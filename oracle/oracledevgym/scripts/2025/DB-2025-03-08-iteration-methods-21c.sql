create or replace package quiz_types as 
	type t_list is table of varchar2(10);
end quiz_types;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 1');

    for i in 1..l_list.count loop
        l_list(i) := l_list(i) || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 2');

    for v in values of l_list loop
        v := v || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 3');

    for v mutable in values of l_list loop
        v := v || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 4');

    for i in indices of l_list loop
        l_list(i) := l_list(i) || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 5');

    for i, v in pairs of l_list loop
        v := v || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 6');

    for v mutable in pairs of l_list loop
        v := v || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 7');

    for i, v in pairs of l_list loop
        l_list(i) := l_list(i) || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/


declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 8');

    for i, v in pairs of l_list loop
        v := v || 'xx';
        l_list(i) := v;
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 9');

    for i, v mutable in pairs of l_list loop
        v := v || 'xx';
        l_list(i) := v;
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 10');

    for v in (select column_value from table(l_list)) loop
        v.column_value := v.column_value || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 11');

    for v mutable in (select column_value from table(l_list)) loop
        v.column_value := v.column_value || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

declare
    l_list quiz_types.t_list := quiz_types.t_list('a','b','c');
begin
    dbms_output.put_line('Choice 12');

    for v in values of (select column_value from table(l_list) for update) loop
        v.column_value := v.column_value || 'xx';
    end loop;

    for i, v in pairs of l_list loop
        dbms_output.put_line(i || '=>' || v);
    end loop;
end;
/

-- Choice 1, 4, 7 and 9 give expected output as:

-- 1=>axx
-- 2=>bxx
-- 3=>cxx

