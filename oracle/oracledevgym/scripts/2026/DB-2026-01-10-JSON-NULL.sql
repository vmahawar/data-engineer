--------------------------------------------------------------------------------
-- Setup
--------------------------------------------------------------------------------

drop table if exists qz_persons purge;

create table if not exists qz_persons (
    id          integer primary key,
    first_name  varchar2(20),
    middle_name varchar2(20),
    last_name   varchar2(20)
);

BEGIN
insert into qz_persons values (42, 'Kimberly', 'Bay',  'Hansforth');
insert into qz_persons values (43, 'Johnny',   null,   'Gideon');
insert into qz_persons values (44, 'Samantha', 'Noel', 'Miller');
commit;
END;

--------------------------------------------------------------------------------
-- Instructions
-- Uncomment ONE choice at a time to replace ##REPLACE##
--------------------------------------------------------------------------------

select
    json_serialize(
        /* ##REPLACE## */
        pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 1
--------------------------------------------------------------------------------
/*
JSON {
    first_name,
    middle_name,
    last_name
}
*/

select
    json_serialize(
        JSON {
    first_name,
    middle_name,
    last_name}
        pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 2
--------------------------------------------------------------------------------
/*
JSON_OBJECT(
    first_name,
    middle_name,
    last_name
    RETURNING JSON
)
*/

select
    json_serialize(
        JSON_OBJECT(
    first_name,
    middle_name,
    last_name
    RETURNING JSON
) pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 3
--------------------------------------------------------------------------------
/*
JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : middle_name,
    'last_name'   : last_name
    EMPTY STRING ON NULL
    RETURNING JSON
)
*/

select
    json_serialize(
        JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : middle_name,
    'last_name'   : last_name
    EMPTY STRING ON NULL
    RETURNING JSON
) pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 4
--------------------------------------------------------------------------------
/*
JSON {
    first_name,
    middle_name,
    last_name
    EMPTY STRING ON NULL
}
*/

select
    json_serialize(
        JSON {
    first_name,
    middle_name,
    last_name
    EMPTY STRING ON NULL
} pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 5
--------------------------------------------------------------------------------
/*
JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : case
                       when middle_name is null then ''
                       else middle_name
                    end,
    'last_name'   : last_name
    RETURNING JSON
)
*/

select
    json_serialize(
        JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : case
                       when middle_name is null then ''
                       else middle_name
                    end,
    'last_name'   : last_name
    RETURNING JSON
) pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 6
--------------------------------------------------------------------------------
/*
JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : case
                       when middle_name is null then '""'
                       else '""' || middle_name || '""'
                    end format json,
    'last_name'   : last_name
    RETURNING JSON
)
*/

select
    json_serialize(
        JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : case
                       when middle_name is null then '""'
                       else '""' || middle_name || '""'
                    end format json,
    'last_name'   : last_name
    RETURNING JSON
) pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 7  (✅ CORRECT ANSWER)
--------------------------------------------------------------------------------
/*
JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : middle_name EMPTY STRING ON NULL,
    'last_name'   : last_name
    RETURNING JSON
)
*/

select
    json_serialize(
        JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : middle_name EMPTY STRING ON NULL,
    'last_name'   : last_name
    RETURNING JSON
) pretty
    ) as person_json
from qz_persons
order by id;

--------------------------------------------------------------------------------
-- Choice 8
--------------------------------------------------------------------------------
/*
JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : JSON_SCALAR(middle_name EMPTY STRING ON NULL),
    'last_name'   : last_name
    RETURNING JSON
)
*/

select
    json_serialize(
        JSON_OBJECT(
    'first_name'  : first_name,
    'middle_name' : JSON_SCALAR(middle_name EMPTY STRING ON NULL),
    'last_name'   : last_name
    RETURNING JSON
) pretty
    ) as person_json
from qz_persons
order by id;
