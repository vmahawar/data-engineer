/*
EXECUTE below as ADMIN user
GRANT CREATE DOMAIN to DEVGYM;
*/

drop table if exists qz_class_schedules;

drop domain if exists qz_days_of_week;

create domain qz_days_of_week as enum (
  monday    = mon = 'MO',
  tuesday   = tue = 'TU',
  wednesday = wed = 'WE',
  thursday  = thu = 'TH',
  friday    = fri = 'FR',
  saturday  = sat = 'SA',
  sunday    = sun = 'SU'
);

create table qz_class_schedules (
  class_id     integer,
  class_day    qz_days_of_week,
  start_hour   integer
);

PROMPT
PROMPT Choice 1 - INCORRECT
PROMPT

insert into qz_class_schedules
values ( 1, qz_days_of_week."monday", 10 );

PROMPT
PROMPT Choice 2 - CORRECT
PROMPT

insert into qz_class_schedules
values ( 1, qz_days_of_week.monday, 10 );

ROLLBACK;

PROMPT
PROMPT Choice 3 - CORRECT
PROMPT

insert into qz_class_schedules
values ( 1, qz_days_of_week.mon, 10 );

ROLLBACK;

PROMPT
PROMPT Choice 4 - INCORRECT
PROMPT

insert into qz_class_schedules
values ( 1, qz_days_of_week.mo, 10 );

PROMPT
PROMPT Choice 5 - CORRECT
PROMPT

insert into qz_class_schedules
values ( 1, 'MO', 10 );

ROLLBACK;

PROMPT
PROMPT Choice 6 - INCORRECT
PROMPT

insert into qz_class_schedules
values ( 1, 'mo', 10 );

drop table if exists qz_class_schedules;

drop domain if exists qz_days_of_week FORCE;