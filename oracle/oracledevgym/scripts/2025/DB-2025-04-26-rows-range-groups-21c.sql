drop table if exists qz_stock_prices;

alter session set nls_date_format = 'DD-MON-YYYY';

create table qz_stock_prices (
    ticker_symbol varchar2(4),
    price_date     date,
    closing_price  number
);

BEGIN
insert into qz_stock_prices values ( 'ACME', date'2025-04-03', 42 );
insert into qz_stock_prices values ( 'ACME', date'2025-04-04', 43 );
insert into qz_stock_prices values ( 'ACME', date'2025-04-07', 47 );
insert into qz_stock_prices values ( 'ACME', date'2025-04-08', 42 );
insert into qz_stock_prices values ( 'ACME', date'2025-04-09', 46 );
commit;
END;
/

PROMPT CHOICE 1  --  INCORRECT

select ticker_symbol
      ,price_date
      ,avg(closing_price) over (order by price_date) three_day_avg
from   qz_stock_prices
order by price_date;

PROMPT CHOICE 2  -- CORRECT

select ticker_symbol
      ,price_date
      ,avg(closing_price) over (order by price_date rows 2 preceding) three_day_avg
from   qz_stock_prices
order by price_date;

PROMPT CHOICE 3  -- CORRECT

select ticker_symbol
      ,price_date
      ,avg(closing_price) over (order by price_date rows between 2 preceding and current row) three_day_avg
from   qz_stock_prices
order by price_date;

PROMPT CHOICE 4  --  INCORRECT

select ticker_symbol
      ,price_date
      ,avg(closing_price) over (order by price_date range between 2 preceding and current row) three_day_avg
from   qz_stock_prices
order by price_date;

PROMPT CHOICE 5  -- CORRECT

select ticker_symbol
      ,price_date
      ,avg(closing_price) over (order by price_date groups between 2 preceding and current row) three_day_avg
from   qz_stock_prices
order by price_date;

PROMPT CHOICE 6  -- CORRECT

select ticker_symbol
      ,price_date
      ,avg(closing_price) over (order by ( price_date - date '2025-01-06' ) - floor (( next_day ( price_date, 'monday') - date '2025-01-06' ) / 7) * 2 range 2 preceding) three_day_avg
from   qz_stock_prices
order by price_date;