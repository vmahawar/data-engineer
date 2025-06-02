PROMPT
PROMPT Choice 1
PROMPT 

begin
    for i in 2..10 loop
        if i in (2, 4, 8, 10) then
            dbms_output.put_line(i);
        end if;
    end loop;
end;
/

PROMPT
PROMPT Choice 2
PROMPT 

begin
    for i in 2, 4, 8, 10 loop
        dbms_output.put_line(i);
    end loop;
end;
/

PROMPT
PROMPT Choice 3
PROMPT 

begin
    for i in 2..10 by 2 loop
        if i != 6 then
            dbms_output.put_line(i);
        end if;
    end loop;
end;
/

PROMPT
PROMPT Choice 4
PROMPT 

begin
    for i in 2..10 by 2 loop
        dbms_output.put_line(i);
        if i = 4 then
            i := i + 2;
        end if;
    end loop;
end;
/

PROMPT
PROMPT Choice 5
PROMPT 

begin
    for i MUTABLE in 2..10 by 2 loop
        dbms_output.put_line(i);
        if i = 4 then
            i := i + 2;
        end if;
    end loop;
end;
/

PROMPT
PROMPT Choice 6
PROMPT 


begin
    for i MUTABLE in 2..10 loop
        dbms_output.put_line(i);
        i := i + 1;
        if i = 4 then
            i := i + 2;
        end if;
    end loop;
end;
/

PROMPT
PROMPT Choice 7
PROMPT 

begin
    for i MUTABLE in 2..10 loop
        dbms_output.put_line(i);
        if i = 4 then
            i := i + 2;
        end if;
        i := i + 1;
    end loop;
end;
/

PROMPT
PROMPT Choice 8
PROMPT 

begin
    for i MUTABLE in 2..10 by 3 loop
        dbms_output.put_line(i);
        if i = 4 then
            i := i + 1;
        else
            i := i - 1;
        end if;
    end loop;
end;
/
