drop table if exists qz_quiz_results;

drop table if exists qz_quiz_results_stage;

create table qz_quiz_results (
    quiz_id     integer,
    user_id     integer,
    pct_correct number
);

create table qz_quiz_results_stage (
    quiz_id     integer,
    user_id     integer,
    pct_correct number
);

insert into qz_quiz_results_stage values ( 1, 1, 100 );
insert into qz_quiz_results_stage values ( 1, 1, 100 );
insert into qz_quiz_results_stage values ( 1, 2, 90 );
insert into qz_quiz_results_stage values ( 1, 3, 42 );

insert into qz_quiz_results values ( 1, 1, 100 );
insert into qz_quiz_results values ( 1, 2, 90 );
insert into qz_quiz_results values ( 1, 2, 90 );
insert into qz_quiz_results values ( 1, 4, 28 );

commit;

-- QUIZ_ID  USER_ID PCT_CORRECT
-- -------- -------- -----------
-- 1        1        100
-- 1        3        42


PROMPT
PROMPT Choice 1 -- INCORRECT
PROMPT

select * from qz_quiz_results_stage
minus
select * from qz_quiz_results
order by quiz_id, user_id;

PROMPT
PROMPT Choice 2 -- CORRECT
PROMPT

select * from qz_quiz_results_stage
minus all
select * from qz_quiz_results
order by quiz_id, user_id;

PROMPT
PROMPT Choice 3 -- CORRECT
PROMPT
select * from qz_quiz_results_stage
except all
select * from qz_quiz_results
order by quiz_id, user_id;

PROMPT
PROMPT Choice 4 -- INCORRECT
PROMPT
select * from qz_quiz_results_stage qqrs
where not exists (
  select * from qz_quiz_results qure
  where qure.quiz_id = qqrs.quiz_id
    and qure.user_id = qqrs.user_id
    and qure.pct_correct = qqrs.pct_correct
)
order by quiz_id, user_id;

PROMPT
PROMPT Choice 5 -- INCORRECT
PROMPT
select quiz_id, user_id, pct_correct from (
  select quiz_id, user_id, pct_correct, count(*)
  from   qz_quiz_results_stage
  group by quiz_id, user_id, pct_correct
  minus
  select quiz_id, user_id, pct_correct, count(*)
  from   qz_quiz_results
  group by quiz_id, user_id, pct_correct
)
order by quiz_id, user_id;
