--Create the following test package:

SET SERVEROUTPUT ON

create or replace package qz_pkg
is
    procedure a;
    procedure b;
    procedure c;
end qz_pkg;
/

create or replace package body qz_pkg
is

    procedure a
    is
    begin
        raise zero_divide;
    end a;

    procedure b
    is
    begin
        a;
    exception
        when others then
            raise_application_error(-20100,'handled in b', true);
    end b;

    procedure c
    is
    begin
        b;
    exception
        when others then
            raise_application_error(-20100,'handled in c', true);
    end c;

end qz_pkg;
/

-- Correct choices will print these results only:

-- ORA-01476: divisor is equal to zero  
-- ORA-01476: divisor is equal to zero  
-- ORA-01476: divisor is equal to zero




PROMPT CHOICE 1
declare
procedure print_error
is
    l_depth number;
begin
    l_depth := utl_call_stack.error_depth;
    dbms_output.put_line(
        'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
        || ': ' || utl_call_stack.error_msg(l_depth)
    );
exception
    when others then
        dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 2
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.backtrace_depth;       
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 3
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.dynamic_depth;       
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 4
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.backtrace_depth + utl_call_stack.dynamic_depth;        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 5
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.error_depth - utl_call_stack.dynamic_depth;       
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 6
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.error_depth - (utl_call_stack.dynamic_depth + 1);        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 7
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.backtrace_depth - 1;
        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 8
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := utl_call_stack.error_depth - abs(utl_call_stack.backtrace_depth + utl_call_stack.error_depth) - (utl_call_stack.dynamic_depth - 1);        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 9
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := abs(utl_call_stack.backtrace_depth - utl_call_stack.error_depth) * 2 + utl_call_stack.dynamic_depth - 1;
        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 10
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := (utl_call_stack.error_depth - utl_call_stack.backtrace_depth + utl_call_stack.dynamic_depth) - 1;
        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 11
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := (utl_call_stack.error_depth - utl_call_stack.backtrace_depth + utl_call_stack.dynamic_depth * 2) - 1;
        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/

PROMPT CHOICE 12
declare
    procedure print_error
    is
        l_depth number;
    begin
        l_depth := (utl_call_stack.error_depth + utl_call_stack.backtrace_depth) * 2 + utl_call_stack.dynamic_depth - 1;
        
        dbms_output.put_line(
            'ORA-' || to_char(utl_call_stack.error_number(l_depth), 'fm99999')
            || ': ' || utl_call_stack.error_msg(l_depth)
        );
    exception
        when others then
            dbms_output.put_line('EXCEPTION IN PRINT_ERROR: ' || sqlerrm);
    end print_error;
begin
    begin
        qz_pkg.a;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.b;
    exception
        when others then print_error;
    end;
    begin
        qz_pkg.c;
    exception
        when others then print_error;
    end;
end;
/