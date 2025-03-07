create or replace procedure qz_test_for_date(
    p_elem    json_element_t
) is
begin
    dbms_output.put_line (
        p_elem.to_String
        || case
            when p_elem.is_Date then ' is a Date'
            else ' is NOT a Date'
        end
    );
end qz_test_for_date;
/

set serveroutput on;

-- Choice 1: Using json_scalar_t with date
DECLARE
    v_json_scalar json_scalar_t;
BEGIN
    BEGIN
        v_json_scalar := json_scalar_t('"2025-02-14T00:00:00"');
        dbms_output.put_line('Choice 1: Executing...');
        qz_test_for_date(v_json_scalar);
    EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 1 failed: ' || SQLERRM);
    END;
END;
/

-- Choice 2: Using json_element_t with date
DECLARE
    v_json_element json_element_t;
BEGIN
    BEGIN
        v_json_element := json_element_t('"2025-02-14T00:00:00"');
        dbms_output.put_line('Choice 2: Executing...');
        qz_test_for_date(v_json_element);
    EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 2 failed: ' || SQLERRM);
    END;
END;
/

-- Choice 3: Using json_object_t with direct date string
DECLARE
    v_json_object json_object_t;
BEGIN
    BEGIN
        v_json_object := json_object_t('"2025-02-14T00:00:00"');
        dbms_output.put_line('Choice 3: Executing...');
        qz_test_for_date(v_json_object);
    EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 3 failed: ' || SQLERRM);
    END;
END;
/

-- Choice 4: Using JSON object with key-value date
DECLARE
    v_json_object json_object_t;
BEGIN
    BEGIN
        v_json_object := json_object_t('{ "theDate": "2025-02-14T00:00:00" }');
        dbms_output.put_line('Choice 4: Executing...');
        qz_test_for_date(v_json_object);
    EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 4 failed: ' || SQLERRM);
    END;
END;
/

-- Choice 5: Using JSON object with key-value date, different syntax
DECLARE
    v_json_object json_object_t;
BEGIN
    BEGIN
        v_json_object := json_object_t('{ "theDate": "2025-02-14T00:00:00" }');
        dbms_output.put_line('Choice 5: Executing...');
        qz_test_for_date(v_json_object.get('theDate'));
    EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 5 failed: ' || SQLERRM);
    END;
END;
/

-- Choice 6: Using JSON object parsed with date
DECLARE
    v_json_object json_object_t;
BEGIN
    BEGIN
        v_json_object := json_object_t.parse('{ "theDate": "2025-02-14T00:00:00" }');
        dbms_output.put_line('Choice 6: Executing...');
        qz_test_for_date(v_json_object.get('theDate'));
    EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 6 failed: ' || SQLERRM);
    END;
END;
/

-- Choice 7: Using an empty JSON object and assigning a date
DECLARE
    v_json_object json_object_t :=  json_object_t();
BEGIN
    v_json_object.put('theDate', date'2025-02-14');
    dbms_output.put_line('Choice 7: Executing...');
    qz_test_for_date(v_json_object);
EXCEPTION
    WHEN OTHERS THEN dbms_output.put_line('Choice 7 failed: ' || SQLERRM);
END;
/

-- Choice 8: Using an empty JSON object and assigning a date differently
DECLARE
    v_json_object := json_object_t();
BEGIN
    v_json_object.put('theDate', json_scalar_t('"2025-02-14T00:00:00"'));
    dbms_output.put_line('Choice 8: Executing...');
    qz_test_for_date(v_json_object.get('theDate'));
EXCEPTION
        WHEN OTHERS THEN dbms_output.put_line('Choice 8 failed: ' || SQLERRM);
END;
/

-- Choice 9: Using JSON object with put() method and storing as a date
DECLARE
    v_json_object := json_object_t();
BEGIN
    v_json_object.put('theDate', date'2025-02-14');
    v_json_object := json_object_t.parse(v_json_object.to_String);
    dbms_output.put_line('Choice 9: Executing...');
    qz_test_for_date(v_json_object.get('theDate'));
EXCEPTION
    WHEN OTHERS THEN dbms_output.put_line('Choice 9 failed: ' || SQLERRM);
END;
/
