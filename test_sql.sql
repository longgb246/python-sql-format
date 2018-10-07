select field_1, field_2, cast(date_format(case when length(sale_date) > 10 then substring(sale_date,
                                                     1,
                                                     10) else sale_date end, 'u') as int),
                                                     SUM(field_3)  as field_3, max(field_2)
from my_table
left join (Select field_2, sum(field_1) From (Select field_2, field_1 From another_table) as b group by field_2) as sub_table_on on my_table.field_2 = sub_table.field_2
left join table_three on my_table.field_1 = table_three.field_1
group by field_1, field_2 order by field_1 desc