drop table if exists qz_shapes;

-- Setup table and data
create table qz_shapes (
  name              varchar2(10),
  all_right_angles  boolean
);

insert into qz_shapes values
 ('circle'    , null)
,('ellipse'   , null)
,('rectangle' , true)
,('square'    , true)
,('triangle'  , false)
,('pentagon'  , false);

commit;

-- Choice 1
PROMPT Choice 1
select name, to_char(all_right_angles) as choice_1
from qz_shapes
order by name;

-- Choice 2
PROMPT Choice 2
select name, to_char(all_right_angles, 'Y') as choice_2
from qz_shapes
order by name;

-- Choice 3
PROMPT Choice 3 -- CORRECT
select name, translate(substr(to_char(all_right_angles), 1, 1), 'TF', 'YN') as choice_3
from qz_shapes
order by name;

-- Choice 4 -- CORRECT
PROMPT Choice 4
select name, translate(substr(all_right_angles, 1, 1), 'TF', 'YN') as choice_4
from qz_shapes
order by name;

-- Choice 5
PROMPT Choice 5
select name, cast(all_right_angles as char(1)) as choice_5
from qz_shapes
order by name;

-- Choice 6
PROMPT Choice 6
select name, cast(all_right_angles as char(1), 'Y') as choice_6
from qz_shapes
order by name;

-- Choice 7
PROMPT Choice 7 -- CORRECT
select name, substr('NY', to_number(all_right_angles) + 1, 1) as choice_7
from qz_shapes
order by name;

-- Choice 8
PROMPT Choice 8 -- CORRECT
select name, substr('NY', all_right_angles + 1, 1) as choice_8
from qz_shapes
order by name;

-- Choice 9
PROMPT Choice 9 -- CORRECT
select name, 
case all_right_angles
  when true then 'Y'
  when false then 'N'
end as choice_9
from qz_shapes
order by name;

-- Choice 10
PROMPT Choice 10 -- CORRECT
select name, decode(all_right_angles, true, 'Y', false, 'N') as choice_10
from qz_shapes
order by name;