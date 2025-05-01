COMMENT ON TABLE EMP IS 'This table is used to store Employee Inforation';

select * from user_tab_comments
where table_name='EMP';

COMMENT ON COLUMN EMP.EMPNO IS 'Employee Number assigned to Employees';

select * from user_col_comments
where table_name = 'EMP'
and column_name = 'EMPNO';

COMMENT ON TABLE EMP IS '';

select * from user_tab_comments
where table_name='EMP';

COMMENT ON COLUMN EMP.EMPNO IS '';

select * from user_col_comments
where table_name = 'EMP'
and column_name = 'EMPNO';