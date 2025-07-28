/* Write your T-SQL query statement below */
select name, bonus from employee as e
left join bonus as b on e.empid = b.empid
where bonus is null or bonus < 1000
