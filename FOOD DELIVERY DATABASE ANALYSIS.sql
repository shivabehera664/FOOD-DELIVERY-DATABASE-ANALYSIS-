Create Table Customers(customer_id int primary key,
customer_name varchar(50),city varchar(50) ); 

Insert Into Customers(customer_id,customer_name,city)
Values(01,'Raj','Patna'),
      (02,'Rahul','Ranchi'),
	  (03,'Shiva','Cuttuck'),
	  (04,'Ajay','Jajpur'),
	  (05,'Sachin','Dhanbad');

Select * From Customers;

Create Table Restaurants (restaurant_id int primary key,
restaurant_name varchar(50),city varchar(50));

Insert Into Restaurants(restaurant_id,restaurant_name,city)
Values(101,'Friends Corner','Patna'),
      (102,'Pizza Drunk','Ranchi'),
	  (103,'Biryani Centre','Cuttuck'),
	  (104,'Bajania Sweets','Jajpur'),
	  (105,'Cream Hub','Dhanbad');

Select * From Restaurants;

Create Table Orders(order_id int Primary key,
customer_id int, restaurant_id int,
order_amount decimal(10,2),
order_date date, delivery_time int,
Foreign key(customer_id) References Customers(customer_id),
Foreign key(restaurant_id) References Restaurants(restaurant_id));

Insert Into Orders(order_id,customer_id,restaurant_id,order_amount,order_date,delivery_time)
Values(1001,1,101,650,'2024-04-01',15),
      (1002,2,102,750,'2024-04-02',20),
	  (1003,3,103,450,'2024-04-03',25),
	  (1004,1,103,800,'2024-04-04',40);
	  
Select *From Orders;

Create Table Delivery_Partners(partner_id int Primary key,
partner_name varchar(50));

Insert Into Delivery_Partners(partner_id,partner_name)
Values(1,'Rohit'),
      (2,'Suresh'),
      (3,'Aman'),
	  (4,'Jack');
	  
Select * From Delivery_Partners; 

Create Table Payments(payment_id int Primary key,
order_id int, payment_method varchar(50),
Foreign key(order_id) References Orders(order_id));

Insert Into Payments(payment_id,order_id,payment_method)
Values(1,1001,'UPI'),
      (2,1002,'Card'),
	  (3,1003,'Cash'),
	  (4,1004,'UPI');

Select * From Payments;

1.[TOP RESTAURANTS By_SALES]:

Select r.restaurant_name,Sum(o.order_amount) as total_sales
from Orders o
Join Restaurants r on 
o.restaurant_id = r.restaurant_id
Group by r.restaurant_name
Order by total_sales Desc;

2.[Highest Spending Customer]:

Select c.customer_name,Sum(o.order_amount) as total_spent
from Customers c
Join Orders o on 
c.customer_id = o.customer_id
Group by c.customer_name
Order by total_spent Desc;

3.[Average Delivery Time]:

Select 
Avg(delivery_time) as avg_delivery_time 
From Orders;

4.[Most Used Payment Method]:

Select payment_method,Count(*) as total_usage
From Payments
Group by payment_method
Order by total_usage Desc;
