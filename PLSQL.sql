
CREATE OR REPLACE PROCEDURE show_events_with_timetables_after_date(p_date IN DATE) IS
    CURSOR event_cursor IS
        SELECT e.id, e.name
        FROM Event e
        JOIN Timetable t ON e.id = t.Event_id
        JOIN EventPart ep ON t.EventPart_id = ep.id
        WHERE ep.when = p_date; -- Filtering by the date when the event occurs

    event_rec event_cursor%ROWTYPE;

    CURSOR timetable_cursor IS
        SELECT ep.what, ep.when, ep."where"
        FROM EventPart ep
        JOIN Timetable t ON ep.id = t.EventPart_id
        WHERE t.Event_id = event_rec.id; -- Fetch timetable parts for a specific event
    
    timetable_rec timetable_cursor%ROWTYPE;

BEGIN
    OPEN event_cursor;
    
    LOOP
        FETCH event_cursor INTO event_rec;
        EXIT WHEN event_cursor%NOTFOUND;  
        
        DBMS_OUTPUT.PUT_LINE('Event: ' || event_rec.name);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
        
        OPEN timetable_cursor;
        
        LOOP
            FETCH timetable_cursor INTO timetable_rec;
            EXIT WHEN timetable_cursor%NOTFOUND;  
            
            DBMS_OUTPUT.PUT_LINE('  What: ' || timetable_rec.what);
            DBMS_OUTPUT.PUT_LINE('  When: ' || TO_CHAR(timetable_rec.when, 'YYYY-MM-DD HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('  Where: ' || timetable_rec."where");
            DBMS_OUTPUT.PUT_LINE('-----------------------------------');
        END LOOP;
        
        CLOSE timetable_cursor;
    END LOOP;
    
    CLOSE event_cursor;

END show_events_with_timetables;
/

EXEC show_events_with_timetables_after_date(TO_DATE('2023-01-05', 'YYYY-MM-DD'));



CREATE OR REPLACE PROCEDURE update_agent_commissions_with_limit(
    p_team_id IN INTEGER,
    p_increase_percentage IN NUMBER,
    p_commission_limit IN NUMBER
) IS
    CURSOR agent_cursor IS
        SELECT a.id, a.com
        FROM Agent a
        JOIN AgentAgentTeam att ON a.id = att.agent_id
        WHERE att.team_id = p_team_id;

    v_agent_id Agent.id%TYPE;
    v_current_com Agent.com%TYPE;
    v_new_com Agent.com%TYPE;

BEGIN
    OPEN agent_cursor;
    LOOP
        FETCH agent_cursor INTO v_agent_id, v_current_com;
        EXIT WHEN agent_cursor%NOTFOUND;

        IF v_current_com >= p_commission_limit THEN
            DBMS_OUTPUT.PUT_LINE('Agent ID: ' || v_agent_id || 
                                 ' - Skipped (Current commission: ' || 
                                 v_current_com || ' exceeds limit: ' || 
                                 p_commission_limit || ')');
        ELSE
            v_new_com := v_current_com + (v_current_com * p_increase_percentage / 100);

            UPDATE Agent
            SET com = v_new_com
            WHERE id = v_agent_id;
            DBMS_OUTPUT.PUT_LINE('Updated comission for' || v_agent_id || '. New value is: ' || v_new_com);

        END IF;
    END LOOP;

    CLOSE agent_cursor;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END; 
/

EXEC update_agent_commissions_with_limit(3, 10, 1000);


