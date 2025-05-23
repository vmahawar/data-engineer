drop table if exists qz_bricks;

create table qz_bricks (
    brick_id integer,
    colour   varchar2(10),
    shape    varchar2(10)
);

insert into qz_bricks values ( 1, 'red',   'cylinder' );
insert into qz_bricks values ( 2, 'red',   'cube' );
insert into qz_bricks values ( 3, 'blue',  'cylinder' );
insert into qz_bricks values ( 4, 'green', 'cylinder' );
commit;

create function qz_count_unique (
    col dbms_tf.columns_t
) return clob sql_macro as
begin
    return '
        select count( distinct ' || col(1) || ' ) val#
        from qz_bricks';
end;
/

PROMPT CHOICE 1
select * from qz_count_unique ( colour );

PROMPT CHOICE 2
select * from qz_count_unique ( 'colour' );

PROMPT CHOICE 3
select * from qz_count_unique ( columns ( shape ) );

PROMPT CHOICE 4
select * from qz_count_unique ( columns ( colour ) );

PROMPT CHOICE 5
select * from qz_count_unique ( columns ( colour, shape ) );