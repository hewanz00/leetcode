select e1.name from employee e1
join 


( select managerid from employee 
group by managerid
having count(managerid) >= 5
) t1


on e1.id = t1.managerid 


