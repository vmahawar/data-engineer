drop table if exists qz_currencies;

create table qz_currencies (
    currency_code varchar2(3) primary key,
    usd_ex_rate number
);

insert into qz_currencies values ('USD', 1);
insert into qz_currencies values ('GBP', 0.792);
insert into qz_currencies values ('EUR', 0.954);
insert into qz_currencies values ('INR', 87.13);

commit;


set serveroutput on

-- declare
--     type currency_arr is table of number
--         index by varchar2(3);
--     ex_rates currency_arr;
-- begin
--     ##REPLACE##
    
--     for curr, rate in pairs of ex_rates loop
--         dbms_output.put_line ( curr || ' = ' || rate );
--     end loop;
-- end;
-- /

set serveroutput on

PROMPT OPTION 1 --Correct

declare
    type currency_arr is table of number
        index by varchar2(3);
    ex_rates currency_arr;
begin
    dbms_output.put_line('Option 1');
    for rws in ( select * from qz_currencies ) loop
        ex_rates ( rws.currency_code ) := rws.usd_ex_rate;
    end loop;

    for curr, rate in pairs of ex_rates loop
        dbms_output.put_line ( curr || ' = ' || rate );
    end loop;
end;
/

select * from qz_currencies;

set serveroutput on

PROMPT OPTION 2

declare
    type currency_arr is table of number
        index by varchar2(3);
    ex_rates currency_arr;
begin
    dbms_output.put_line('Option 2');
    select * bulk collect into ex_rates from qz_currencies;  -- Incorrect because bulk collect cannot directly populate an associative array

    for curr, rate in pairs of ex_rates loop
        dbms_output.put_line ( curr || ' = ' || rate );
    end loop;
end;
/


set serveroutput on

PROMPT OPTION 3

declare
    type currency_arr is table of number
        index by varchar2(3);
    ex_rates currency_arr;
begin
    dbms_output.put_line('Option 3');
    ex_rates := currency_arr ( 
        for rws in ( select * from qz_currencies ) 
        => rws.usd_ex_rate 
    );  -- Incorrect syntax

    for curr, rate in pairs of ex_rates loop
        dbms_output.put_line ( curr || ' = ' || rate );
    end loop;
end;
/

set serveroutput on

PROMPT OPTION 4

declare
    type currency_arr is table of number
        index by varchar2(3);
    ex_rates currency_arr;
begin
    dbms_output.put_line('Option 4');
    ex_rates := currency_arr ( 
        for rws in ( select * from qz_currencies ) sequence 
        => rws.usd_ex_rate 
    );  -- Incorrect syntax

    for curr, rate in pairs of ex_rates loop
        dbms_output.put_line ( curr || ' = ' || rate );
    end loop;
end;
/

set serveroutput on

PROMPT OPTION 5

declare
    type currency_arr is table of number
        index by varchar2(3);
    ex_rates currency_arr;
begin
    dbms_output.put_line('Option 5');
    ex_rates := currency_arr ( 
        for rws in ( select * from qz_currencies ) 
        index => rws.currency_code 
        => rws.usd_ex_rate 
    );  -- Incorrect syntax

    for curr, rate in pairs of ex_rates loop
        dbms_output.put_line ( curr || ' = ' || rate );
    end loop;
end;
/
