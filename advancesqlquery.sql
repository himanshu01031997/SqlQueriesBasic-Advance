  -------------------------------stored procedure
  create PROCEDURE SPCustomer
  as 
  begin 
  select first_name,last_name
  from sales.customers
  where customer_id=1
  end
  EXEC SPCustomer
  ------------------ALter storedprocedure(using paramerter)
  alter procedure SPCustomer(@min_customer_id as decimal,@max_customer_id as decimal,@name as varchar(max))
  as 
  begin
  select first_name,last_name
  from sales.customers
  where customer_id>=@min_customer_id and customer_id<=@max_customer_id and first_name like '%'+@name+'%'
  end
  ------------------------------to execute stored procedure
  exec SPCustomer 5,100,latasha
  --------------------------
  select first_name,last_name,customer_id
  from sales.customers
  ----------------------------------to declare a variable
  declare @cust int

  
  select * from sales.orders
  select * from sales.customers
  ---------------------------------view(from single table)

  create view details as 
  select order_date,store_id
  from sales.orders
  where order_id=10

  select * from details
  --------------------------------(views from multiple table)
   create view multiview as 
   select o.order_date , c.email
   from sales.orders o , sales.customers c
   where o.customer_id=c.customer_id

   select * from multiview
   -----------------------------------(index)
   --(normal query)

   select * from sales.customers
   where zip_code>14127

   --(create new index)

   create index zipindex
   on sales.customers(zip_code)
   -----------------(trigger)---------------------
   create table employeetab
   
   (
   Emp_id int identity,
   Emp_name varchar(100),
   Emp_sal decimal (10,2)
   )
   drop table employeetab


   select * from employeetab
   insert into employeetab values('ram',15000);
   insert into employeetab values('mohan',15000);
   insert into employeetab values('salu',15000);
   insert into employeetab values('kalu',15000);

    create table employeetablog
   
   (
   Emp_id int identity,
   Emp_name varchar(100),
   Emp_sal decimal (10,2),
   logaction varchar (100),
   log_time  datetime
   )
   select * from employeetablog

   create trigger employeetrigger on employeetab
   after insert 
   as
   declare @empid int ;
   declare @empname varchar(100);
   declare @empsal decimal(10,2);
   declare @logaction varchar(100);
    select @empid=i.Emp_id,@empid=i.Emp_name ,@empsal=i.Emp_sal from inserted i;
	set @logaction ='added';

	insert into employeetablog
	(Emp_id,Emp_name,Emp_sal,logaction,log_time)
	values(@empid,@empname,@empsal,@logaction,getdate());
	print 'after insert '
	go

	   select * from employeetab

	   select * from employeetablog
   insert into employeetab values('r',15000);


   ------------------(function )
   select *  from sales.order_items

   select max(discount) from sales.order_items
   select min(discount) from sales.order_items
   select count(discount) from sales.order_items

