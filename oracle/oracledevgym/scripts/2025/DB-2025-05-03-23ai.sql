drop table if exists qz_officers;

create table if not exists qz_officers (
    id          integer primary key,
    name        varchar2(20),
    partner_id  references qz_officers
                constraint partner_id_uq unique
);


insert into qz_officers values (142, 'Furillo', null);
insert into qz_officers values (253, 'Hill'   , null);
insert into qz_officers values (364, 'Renko'  , 253 );
insert into qz_officers values (475, 'Bates'  , null);
insert into qz_officers values (586, 'Coffey' , 475 );

commit;

-- Expected Output

select id, name, partner_id
from qz_officers
order by id;

-- Output:
-- ID   NAME     PARTNER_ID
-- ------------------------
-- 142  Furillo  null
-- 253  Hill     364
-- 364  Renko    253
-- 475  Bates    586
-- 586  Coffey   475

PROMPT 
PROMPT CHOICE 1 -- CORRECT
PROMPT

update qz_officers o
set o.partner_id = (
    select p.id
    from qz_officers p
    where p.partner_id = o.id
)
where o.partner_id is null
and exists (
    select null
    from qz_officers p
    where p.partner_id = o.id
);

select id, name, partner_id
from qz_officers
order by id;

ROLLBACK;

PROMPT 
PROMPT CHOICE 2 -- CORRECT
PROMPT

update qz_officers o
set o.partner_id = (
    select p.id
    from qz_officers p
    where p.partner_id = o.id
)
where o.partner_id is null;

select id, name, partner_id
from qz_officers
order by id;

ROLLBACK;

PROMPT
PROMPT CHOICE 3 -- CORRECT
PROMPT

update qz_officers o
set o.partner_id = p.id
from qz_officers p
where o.partner_id is null
and p.partner_id = o.id;

select id, name, partner_id
from qz_officers
order by id;

ROLLBACK;

PROMPT
PROMPT CHOICE 4 -- CORRECT
PROMPT

update qz_officers o
set o.partner_id = p.id
using qz_officers p
where o.partner_id is null
and p.partner_id = o.id;

select id, name, partner_id
from qz_officers
order by id;

ROLLBACK;

PROMPT
PROMPT CHOICE 5 -- INCORRECT SYNTAX
PROMPT

update qz_officers o
set o.partner_id = p.id
join qz_officers p
    on p.partner_id = o.id
where o.partner_id is null;

select id, name, partner_id
from qz_officers
order by id;

ROLLBACK;

PROMPT
PROMPT CHOICE 6  -- CORRECT
PROMPT

update (
    select o.partner_id, p.id
    from qz_officers o
    join qz_officers p
        on p.partner_id = o.id
    where o.partner_id is null
)
set partner_id = id;

select id, name, partner_id
from qz_officers
order by id;

ROLLBACK;