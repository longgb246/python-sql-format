# python-sql-format

Demand : Input a sql string (not formatted), format it and print it out, get the formatted string. 

So reference the method of https://github.com/sethelliott/sql_format, but not all like it.

## Function

`sql_format(sql, wrap_add=None, mode='none')` in `sql_format.py/sql_format`

## Result

Input ( test_sql.sql ):
```roomsql
select field_1, field_2, cast(date_format(case when length(sale_date) > 10 then substring(sale_date,
                                                     1,
                                                     10) else sale_date end, 'u') as int),
                                                     SUM(field_3)  as field_3, max(field_2)
from my_table
left join (Select field_2, sum(field_1) From (Select field_2, field_1 From another_table) as b group by field_2) as sub_table_on on my_table.field_2 = sub_table.field_2
left join table_three on my_table.field_1 = table_three.field_1
group by field_1, field_2 order by field_1 desc
```

Output ( test_format_sql.sql ):
```roomsql
SELECT
    field_1,
    field_2,
    CAST(DATE_FORMAT(CASE WHEN LENGTH(sale_date) > 10 THEN SUBSTRING(sale_date,
                            1,
                            10) ELSE sale_date END,
                    'u') AS int),
    SUM(field_3)  AS field_3,
    MAX(field_2)
FROM
    my_table
LEFT JOIN
    (
        SELECT
            field_2,
            SUM(field_1)
        FROM
            (
                SELECT
                    field_2,
                    field_1
                FROM
                    another_table) AS b
        GROUP BY
            field_2) AS sub_table_on
ON
    my_table.field_2 = sub_table.field_2
LEFT JOIN
    table_three
ON
    my_table.field_1 = table_three.field_1
GROUP BY
    field_1,
    field_2
ORDER BY
    field_1 DESC
```
