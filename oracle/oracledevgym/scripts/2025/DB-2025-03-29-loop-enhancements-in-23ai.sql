-- Which display below output
-- 1
-- 5
-- 7
-- 23
-- 25
-- 29

SET SERVEROUT ON;
SET ECHO ON;
SET FEEDBACK ON;

PROMPT CHOICE 1 -- CORRECT
begin
  for i in 
    1..10 by 2
    , 21..30 by 2
  loop
    if mod(i, 3) = 0 then
      continue;
    end if;
    dbms_output.put_line(i);
  end loop;
end;
/

PROMPT CHOICE 2
begin
  for i in 
    1..10 by 2
    , 21..30 by 2
  loop
    case
      when mod(i, 3) = 0 then
        continue;
    end case;
    dbms_output.put_line(i);
  end loop;
end;
/

PROMPT CHOICE 3
begin
  for i in 
    1..10 by 2
    , 21..30 by 2
  loop
    continue when mod(i, 3 = 0);
    dbms_output.put_line(i);
  end loop;
end;
/

PROMPT CHOICE 4 -- CORRECT
begin
  for i mutable in 
    1..10 by 2
    , 21..30 by 2
  loop
    if mod(i, 3) = 0 then
      i := i + 2;
    end if;
    dbms_output.put_line(i);
  end loop;
end;
/

PROMPT CHOICE 5
begin
  for i mutable in 
    1..10 by 2
    , 21..30 by 2
  loop
    if mod(i, 3) = 0 then
      i := i + 2;
    else
      dbms_output.put_line(i);
    end if;
  end loop;
end;
/

PROMPT CHOICE 6 -- CORRECT
begin
  for i mutable in 
    1..30
  loop
    if i = 9 then
      i := 22;
    elsif mod(i, 3) = 0 then
      i := i + 1;
    else
      dbms_output.put_line(i);
      i := i + 1;
    end if;
  end loop;
end;
/

PROMPT CHOICE 7
begin
  for i mutable in 
    1..30 by 2
  loop
    if i = 9 then
      i := 21;
    elsif mod(i, 3) = 0 then
      i := i + 2;
    else
      dbms_output.put_line(i);
      i := i + 2;
    end if;
  end loop;
end;
/

PROMPT CHOICE 8 -- CORRECT
begin
  for i mutable in 
    1, repeat i + 0 while i <= 30
  loop
    if i = 9 then
      i := 21;
    elsif mod(i, 3) = 0 then
      i := i + 2;
    else
      dbms_output.put_line(i);
      i := i + 2;
    end if;
  end loop;
end;
/

PROMPT CHOICE 9 -- CORRECT
begin
  for i in 
    1..30 by 2
  loop
    if not (mod(i, 3) = 0 or i between 11 and 20) then
      dbms_output.put_line(i);
    end if;
  end loop;
end;
/

PROMPT CHOICE 10
begin
  for i mutable in 
    1..30 by 2 when not i between 11 and 20
  loop
    if mod(i, 3) = 0 then
      i := i + 2;
    end if;
    dbms_output.put_line(i);
  end loop;
end;
/

PROMPT CHOICE 11 -- CORRECT
begin
  for i in 
    1
    , repeat i + 2 while i <= 30 when not i between 11 and 20
  loop
    if mod(i, 3) = 0 then
      continue;
    end if;
    dbms_output.put_line(i);
  end loop;
end;
/

PROMPT CHOICE 12
begin
  for i mutable in 
    1
    , repeat i + 2 while i <= 30 when mod(i, 3) <> 0
  loop
    dbms_output.put_line(i);
    if i = 9 then
      i := 21;
    end if;
  end loop;
end;
/

PROMPT CHOICE 13  -- CORRECT
begin
  for i in 
    1
    , repeat i + 2 while i <= 30 when not (i between 11 and 20 or mod(i,3) = 0)
  loop
    dbms_output.put_line(i);
  end loop;
end;
/


