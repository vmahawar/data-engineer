-- Which display below output
-- 1
-- 5
-- 7
-- 23
-- 25
-- 29

SET SERVEROUT ON;
SET ECHO ON;
SET SQLFORMAT ansiconsole
SET LINENUM ON;

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

SET ECHO OFF;


--Below is the output
/*
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 2
CHOICE 2
SQL> begin
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
begin
*
ERROR at line 1:
ORA-06592: CASE not found while executing CASE statement
ORA-06512: at line 9

https://docs.oracle.com/error-help/db/ora-06592/


More Details :
https://docs.oracle.com/error-help/db/ora-06592/
https://docs.oracle.com/error-help/db/ora-06512/
SQL> 
SQL> PROMPT CHOICE 3
CHOICE 3
SQL> begin
       for i in
         1..10 by 2
         , 21..30 by 2
       loop
         continue when mod(i, 3 = 0);
         dbms_output.put_line(i);
       end loop;
     end;
     /
    continue when mod(i, 3 = 0);
                  *
ERROR at line 6:
ORA-06550: line 6, column 19:
PLS-00306: wrong number or types of arguments in call to 'MOD'
ORA-06550: line 6, column 5:
PL/SQL: Statement ignored

https://docs.oracle.com/error-help/db/ora-06550/


More Details :
https://docs.oracle.com/error-help/db/ora-06550/
https://docs.oracle.com/error-help/db/pls-00306/
SQL> 
SQL> PROMPT CHOICE 4 -- CORRECT
CHOICE 4 -- CORRECT
SQL> begin
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
1
5
7
11
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 5
CHOICE 5
SQL> begin
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
1
7
25


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 6 -- CORRECT
CHOICE 6 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 7
CHOICE 7
SQL> begin
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
1
5
23


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 8 -- CORRECT
CHOICE 8 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 9 -- CORRECT
CHOICE 9 -- CORRECT
SQL> begin
       for i in 
         1..30 by 2
       loop
         if not (mod(i, 3) = 0 or i between 11 and 20) then
           dbms_output.put_line(i);
         end if;
       end loop;
     end;
     /
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 10
CHOICE 10
SQL> begin
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
1
5
7
11
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 11 -- CORRECT
CHOICE 11 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 12
CHOICE 12
SQL> begin
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
1
5
7
11
13
17
19
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 13  -- CORRECT
CHOICE 13  -- CORRECT
SQL> begin
       for i in 
         1
         , repeat i + 2 while i <= 30 when not (i between 11 and 20 or mod(i,3) = 0)
       loop
         dbms_output.put_line(i);
       end loop;
     end;
     /
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> SET ECHO OFF;
SQL> -- Which display below output
SQL> -- 1
SQL> -- 5
SQL> -- 7
SQL> -- 23
SQL> -- 25
SQL> -- 29
SQL> 
SQL> SET SERVEROUT ON;
SQL> SET ECHO ON;
SQL> SET SQLFORMAT ansiconsole
SQL> SET LINENUM ON;
SP2-0268: linesize option not a valid number
SQL> 
SQL> PROMPT CHOICE 1 -- CORRECT
CHOICE 1 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 2
CHOICE 2
SQL> begin
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
begin
*
ERROR at line 1:
ORA-06592: CASE not found while executing CASE statement
ORA-06512: at line 9

https://docs.oracle.com/error-help/db/ora-06592/


More Details :
https://docs.oracle.com/error-help/db/ora-06592/
https://docs.oracle.com/error-help/db/ora-06512/
SQL> 
SQL> PROMPT CHOICE 3
CHOICE 3
SQL> begin
       for i in
         1..10 by 2
         , 21..30 by 2
       loop
         continue when mod(i, 3 = 0);
         dbms_output.put_line(i);
       end loop;
     end;
     /
    continue when mod(i, 3 = 0);
                  *
ERROR at line 6:
ORA-06550: line 6, column 19:
PLS-00306: wrong number or types of arguments in call to 'MOD'
ORA-06550: line 6, column 5:
PL/SQL: Statement ignored

https://docs.oracle.com/error-help/db/ora-06550/


More Details :
https://docs.oracle.com/error-help/db/ora-06550/
https://docs.oracle.com/error-help/db/pls-00306/
SQL> 
SQL> PROMPT CHOICE 4 -- CORRECT
CHOICE 4 -- CORRECT
SQL> begin
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
1
5
7
11
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 5
CHOICE 5
SQL> begin
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
1
7
25


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 6 -- CORRECT
CHOICE 6 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 7
CHOICE 7
SQL> begin
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
1
5
23


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 8 -- CORRECT
CHOICE 8 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 9 -- CORRECT
CHOICE 9 -- CORRECT
SQL> begin
       for i in
         1..30 by 2
       loop
         if not (mod(i, 3) = 0 or i between 11 and 20) then
           dbms_output.put_line(i);
         end if;
       end loop;
     end;
     /
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 10
CHOICE 10
SQL> begin
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
1
5
7
11
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 11 -- CORRECT
CHOICE 11 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 12
CHOICE 12
SQL> begin
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
1
5
7
11
13
17
19
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 13  -- CORRECT
CHOICE 13  -- CORRECT
SQL> begin
       for i in
         1
         , repeat i + 2 while i <= 30 when not (i between 11 and 20 or mod(i,3) = 0)
       loop
         dbms_output.put_line(i);
       end loop;
     end;
     /
1
5
7
23
25
SQL> -- Which display below output
SQL> -- 1
SQL> -- 5
SQL> -- 7
SQL> -- 23
SQL> -- 25
SQL> -- 29
SQL> 
SQL> SET SERVEROUT ON;
SQL> SET ECHO ON;
SQL> SET SQLFORMAT ansiconsole
SQL> SET LINENUM ON;
SP2-0268: linesize option not a valid number
SQL> 
SQL> PROMPT CHOICE 1 -- CORRECT
CHOICE 1 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 2
CHOICE 2
SQL> begin
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
begin
*
ERROR at line 1:
ORA-06592: CASE not found while executing CASE statement
ORA-06512: at line 9

https://docs.oracle.com/error-help/db/ora-06592/


More Details :
https://docs.oracle.com/error-help/db/ora-06592/
https://docs.oracle.com/error-help/db/ora-06512/
SQL> 
SQL> PROMPT CHOICE 3
CHOICE 3
SQL> begin
       for i in 
         1..10 by 2
         , 21..30 by 2
       loop
         continue when mod(i, 3 = 0);
         dbms_output.put_line(i);
       end loop;
     end;
     /
    continue when mod(i, 3 = 0);
                  *
ERROR at line 6:
ORA-06550: line 6, column 19:
PLS-00306: wrong number or types of arguments in call to 'MOD'
ORA-06550: line 6, column 5:
PL/SQL: Statement ignored

https://docs.oracle.com/error-help/db/ora-06550/


More Details :
https://docs.oracle.com/error-help/db/ora-06550/
https://docs.oracle.com/error-help/db/pls-00306/
SQL> 
SQL> PROMPT CHOICE 4 -- CORRECT
CHOICE 4 -- CORRECT
SQL> begin
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
1
5
7
11
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 5
CHOICE 5
SQL> begin
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
1
7
25


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 6 -- CORRECT
CHOICE 6 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 7
CHOICE 7
SQL> begin
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
1
5
23


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 8 -- CORRECT
CHOICE 8 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 9 -- CORRECT
CHOICE 9 -- CORRECT
SQL> begin
       for i in
         1..30 by 2
       loop
         if not (mod(i, 3) = 0 or i between 11 and 20) then
           dbms_output.put_line(i);
         end if;
       end loop;
     end;
     /
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 10
CHOICE 10
SQL> begin
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
1
5
7
11
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 11 -- CORRECT
CHOICE 11 -- CORRECT
SQL> begin
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
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 12
CHOICE 12
SQL> begin
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
1
5
7
11
13
17
19
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> PROMPT CHOICE 13  -- CORRECT
CHOICE 13  -- CORRECT
SQL> begin
       for i in
         1
         , repeat i + 2 while i <= 30 when not (i between 11 and 20 or mod(i,3) = 0)
       loop
         dbms_output.put_line(i);
       end loop;
     end;
     /
1
5
7
23
25
29


PL/SQL procedure successfully completed.

SQL> 
SQL> SET ECHO OFF;
SQL> 
*/