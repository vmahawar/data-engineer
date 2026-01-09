-- Table creation and data population

-- You create and populate a table to record chocolate consumption on Christmas Day:

create table if not exists qz_chocolate_consumption (
  consumption_datetime timestamp
);

delete from QZ_CHOCOLATE_CONSUMPTION;

insert into qz_chocolate_consumption
select timestamp'2025-12-25 07:59:00'
       + numtodsinterval(level, 'minute')
from dual
connect by level <= 60;

commit;


alter session set nls_timestamp_format = 'hh24:mi:ss';

-- select
--   ##REPLACE##,
--   count(*)
-- from qz_chocolate_consumption
-- group by period
-- order by period;

SET FEEDBACK ON

PROMPT
PROMPT Choice 1
PROMPT

select
  time_bucket (
  consumption_datetime,
  interval '15' minute,
  date '2025-12-25',
  start
)
|| ' - ' ||
time_bucket (
  consumption_datetime,
  interval '15' minute,
  date '2025-12-25',
  end
) period,
  count(*)
from qz_chocolate_consumption
group by period
order by period;

PROMPT
PROMPT Choice 2 -- Correct
PROMPT

select
  time_bucket (
  consumption_datetime,
  interval '15' minute,
  timestamp '2025-12-25 08:00:00',
  start
)
|| ' - ' ||
time_bucket (
  consumption_datetime,
  interval '15' minute,
  timestamp '2025-12-25 08:00:00',
  end
) period,
  count(*)
from qz_chocolate_consumption
group by period
order by period;

PROMPT
PROMPT Choice 3
PROMPT

select
  time_bucket (
  consumption_datetime,
  interval '15' minute,
  timestamp '2025-12-25 08:00:00 UTC',
  start
)
|| ' - ' ||
time_bucket (
  consumption_datetime,
  interval '15' minute,
  timestamp '2025-12-25 08:00:00 UTC',
  end
) period,
  count(*)
from qz_chocolate_consumption
group by period
order by period;


PROMPT
PROMPT Choice 4 --Correct
PROMPT

select
  time_bucket (
  consumption_datetime,
  numtodsinterval(15, 'minute'),
  timestamp '2025-12-25 08:00:00'
)
|| ' - ' ||
time_bucket (
  consumption_datetime,
  numtodsinterval(15, 'minute'),
  timestamp '2025-12-25 08:15:00'
) period,
  count(*)
from qz_chocolate_consumption
group by period
order by period;


PROMPT
PROMPT Choice 5 --Correct
PROMPT

select
  time_bucket (
  consumption_datetime,
  'PT15M',
  timestamp '2025-12-25 08:00:00'
)
|| ' - ' ||
time_bucket (
  consumption_datetime,
  'PT15M',
  timestamp '2025-01-01 08:00:00',
  end
) period,
  count(*)
from qz_chocolate_consumption
group by period
order by period;


PROMPT
PROMPT Choice 6  --Correct
PROMPT

select
  time_bucket (
  consumption_datetime,
  'PT15M',
  timestamp '2025-01-01 00:00:00',
  start
)
|| ' - ' ||
time_bucket (
  consumption_datetime,
  'PT15M',
  timestamp '2025-12-31 23:45:00',
  end
) period,
  count(*)
from qz_chocolate_consumption
group by period
order by period;