select * from sales.orders
---------------------------------

select * 
from sales.customers
order by customer_id asc
----------------------------------
select * 
from sales.customers
order by customer_id desc
--------------------------------
select * 
from sales.customers
order by first_name asc

----------------------------offset and fetch
select * 
from sales.customers
order by customer_id
offset 10 rows
fetch next  10 rows only
------------------------------ select from top city and lastname
select top 10 city,last_name
from sales.customers
------------------------distinct(non repeated)
select distinct city
from sales.customers
----------------------------use of where and and
select customer_id
from sales.customers
where customer_id>10 and customer_id<20 and phone is NULL
---------------------------------or
select first_name
from sales.customers
where customer_id=10 or customer_id= 12
----------------------------------in
select *
from sales.customers
where customer_id in(1,4,23)
-----------------------between
 select *
 from sales.customers
 where customer_id between 2 and 45
 ---------------------------use of like
 (firstname ends with li)
 select first_name
 from sales.customers
 where first_name like '%li'
 ----------------------------
 (firstname starts with ta)

 select first_name
 from sales.customers
 where first_name like 'ta%'
 ------------------------------join

 select * from sales.staffs
  select * from sales.customers

 ------------------innerjoin
 select sales.customers.customer_id,
 from sales.customers inner join sales.staffs
 on sales.customers.phone=sales.staffs.phone
 ---------------------left join/right join

 select *
 from sales.customers c right join sales.staffs s
 on s.email=c.email
 -------------------groupby
 select max(customer_id)
 from sales.customers
 group by first_name

 ---------------subquery

  select first_name,last_name
  from sales.customers
  where customer_id in(select customer_id
  from sales.orders
  where store_id=1)
  

  select * from sales.customers
  select * from sales.orders
