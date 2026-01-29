--All choices are correct and display 0,3,6,9

begin
  for i in 0, 3, 6, 9 loop
    dbms_output.put_line(i);
  end loop;
end;
/

--

begin
  for i in 0 .. 9 by 3 loop
    dbms_output.put_line(i);
  end loop;
end;
/

--

begin
  for i in 0 .. 9
    when mod(i, 3) = 0 loop
      dbms_output.put_line(i);
  end loop;
end;
/

--

begin
  for i in 0 .. 9 by 3
    when mod(i, 3) = 0 loop
      dbms_output.put_line(i);
  end loop;
end;
/

--

begin
  for i in 0 .. 9 loop
    if mod(i, 3) = 0 then
      dbms_output.put_line(i);
    end if;
  end loop;
end;
/
