-- Expected Output:

-- TEAM   NAME   LOCATION
-- -----  -----  ---------
-- alpha  jean   venice
-- alpha  lisa   paris
-- beta   anna   lima
-- beta   nico   rome
-- gamma  (null) (null)

column team format a7
column name format a7
column location format a9
set null (null)

PROMPT
PROMPT CHOICE 1
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  outer apply json_table(b.players
  columns(
    name     path name.string(),
    location path location.string()
  )
) j
order by b.team, j.name
/

PROMPT
PROMPT CHOICE 2
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  outer apply json_table(b.players, '$[*]'
  columns(
    name     path name.string(),
    location path location.string()
  )
) j
order by b.team, j.name
/

PROMPT
PROMPT CHOICE 3
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  outer apply json_table(b.players[*]
  columns(
    name     path name.string(),
    location path location.string()
  )
) j
order by b.team, j.name
/


PROMPT
PROMPT CHOICE 4
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  outer apply json_table(b.players[*], '$[*]'
  columns(
    name     path name.string(),
    location path location.string()
  )
) j
order by b.team, j.name
/


PROMPT
PROMPT CHOICE 5
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  nested players
  columns(
    name     path name.string(),
    location path location.string()
  ) j
order by b.team, j.name
/


PROMPT
PROMPT CHOICE 6
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  nested players, '$[*]'
  columns(
    name     path name.string(),
    location path location.string()
  ) j
order by b.team, j.name
/


PROMPT
PROMPT CHOICE 7
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  nested players[*]
  columns(
    name     path name.string(),
    location path location.string()
  ) j
order by b.team, j.name
/


PROMPT
PROMPT CHOICE 8
PROMPT 
with base(team, players) as (
  select 'alpha', json(q'[
    {"name":"lisa","location":"paris"},
    {"name":"jean","location":"venice"}
  ]') 
  from dual union all
  select 'beta', json(q'[
    {"name":"anna","location":"lima"},
    {"name":"nico","location":"rome"}
  ]') 
  from dual union all
  select 'gamma', null 
  from dual
)
select b.team, j.name, j.location
from 
  base b
  nested players[*], '$[*]'
  columns(
    name     path name.string(),
    location path location.string()
  ) j
order by b.team, j.name
/