-- creating and inserting values into Customer table
create DATABASE new_db; 
use new_db; 



create table Customer (
    cust_id char(4) UNIQUE ,
    cust_name VARCHAR(30),
    age INTEGER,
    cust_email varchar(40),
    constraint pk_cust primary key(cust_id)

);

insert into Customer values ('1001','Priyanshu',22,'priyanshu@gmail.com');
insert into Customer values ('1002','Hemant',23,'hemant@gmail.com');
insert into Customer values ('1003','Rushan',23,'rushan@gmail.com');
insert into Customer values ('1004','Shruti',24,'shruti@gmail.com');
insert into Customer values ('1005','Aishwarya',20,'aishwarya@gmail.com');
insert into Customer values ('1006','Ranjana',47,'ranjana@gmail.com');
insert into Customer values ('1007','Nirmal',53,'nirmal@gmail.com');
insert into Customer values ('1008','Dwight',41,'dwight@gmail.com');
insert into Customer values ('1009','Andy',38,'andy@gmail.com');
insert into Customer values ('1010','Siddhesh',23,'siddhesh@gmail.com');
insert into Customer values ('1011','Apoorva',23,'apoorva@gmail.com');
insert into Customer values ('1012','Troy',28,'troy@gmail.com');


--creating and inserting values into Coupon table

create table Coupon(
    cust_email varchar(40),
    coupon_code char(6) UNIQUE,
    CONSTRAINT pk_coup PRIMARY KEY(coupon_code)
);

insert into Coupon VALUES ('aishwarya@gmail.com', 'ABC123')
insert into Coupon VALUES ('shruti@gmail.com', 'FGH469')
insert into Coupon VALUES ('andy@gmail.com', 'MAR420')
insert into Coupon VALUES ('priyanshu@gmail.com', 'NIC369')
insert into Coupon VALUES ('dwight@gmail.com', 'KOL256')


-- creating and inserting values into Payment table
create table Payment (
    pmt_type VARCHAR(15) ,
    pmt_id char(7) UNIQUE,
    item_price INTEGER,
    cust_id char(4) ,
    coupon_code char(6),
    CONSTRAINT pk_pmt PRIMARY KEY(pmt_id),
    CONSTRAINT fk_custid FOREIGN KEY(cust_id) REFERENCES Customer(cust_id),
    CONSTRAINT fk_coup FOREIGN KEY(coupon_code)  REFERENCES Coupon(coupon_code)
);

insert into Payment values ('Credit card', '1003212',30,'1005','ABC123')
insert into Payment values ('Debit card', '1002456',45,'1004','FGH469')
insert into Payment values ('Cash', '1006543',36,'1009','KOL256')
insert into Payment values ('Apple pay', '1009687',25,'1008','KOL256')
insert into Payment values ('Google pay', '1007463',69,'1007','FGH469')
insert into Payment values ('Cash', '1007841',60,'1005','NIC369')
insert into Payment values ('Credit card', '1008913',30,'1001','NIC369')
insert into Payment values ('Debit card', '1003428',43,'1009','MAR420')
insert into Payment values ('Apple pay', '1001001',98,'1001','ABC123')
insert into Payment values ('Google pay', '1005310',36,'1011','FGH469')



--creating and inserting values into Orders table

create table Orders (
    item_id char(5) UNIQUE,
    item_name varchar(20),
    item_price integer,
    cust_id char(4) ,
    CONSTRAINT pk_order PRIMARY KEY(item_id),
    CONSTRAINT fk_custid2 FOREIGN KEY(cust_id) REFERENCES Customer(cust_id)
);

insert into Orders values ('20001', 'Chimichanga', 8,'1003')
insert into Orders values ('20002', 'Quesadila', 13,'1005')
insert into Orders values ('20003', 'Enchiladas', 11,'1007')
insert into Orders values ('20004', 'Nachos and dip', 5,'1001')
insert into Orders values ('20005', 'Chicken wings', 9,'1009')
insert into Orders values ('20006', 'Burrito', 6,'1003')
insert into Orders values ('20007', 'Tacos', 4,'1007')
insert into Orders values ('20008', 'Lunch Fajita', 16,'1010')

--creating and inserting values into Booking_Portal table

create table Booking_Portal (
    table_no char(2),
    book_time TIME,
    cust_id char(4) ,

    CONSTRAINT pk_bp primary KEY(table_no,book_time),
    CONSTRAINT fk_custid3 FOREIGN KEY(cust_id) REFERENCES Customer(cust_id)
    
);

insert into Booking_Portal values ('1','10:00','1001')
insert into Booking_Portal values ('2','9:00','1004')
insert into Booking_Portal values ('3','18:00','1002')
insert into Booking_Portal values ('4','13:30','1004')
insert into Booking_Portal values ('1','14:00','1009')
insert into Booking_Portal values ('5','19:00','1011')

----creating and inserting values into Grocery_Store table

create TABLE Grocery_Store (
    shop_id char(2),
    shop_name varchar(20),
    product_id char(5) UNIQUE,
    quantity integer, 
    CONSTRAINT pk_gs PRIMARY KEY(product_id)

);

insert into Grocery_Store values('10','US Food store', '50001',100)
insert into Grocery_Store values('20','Restaurant Depot', '50002',150)
insert into Grocery_Store values('10','US Food store', '50003',360)
insert into Grocery_Store values('20','Restaurant Depot', '50004',270)


--creating and inserting values into Kitchen table

create table Kitchen (
    item_id char(5),
    food_id char (6) UNIQUE,
    CONSTRAINT pk_kitc PRIMARY KEY (item_id, food_id),
    CONSTRAINT fk_itemid FOREIGN KEY(item_id) REFERENCES Orders(item_id)

);

insert into Kitchen values ('20004','600001')
insert into Kitchen values ('20008','600002')
insert into Kitchen values ('20004','600003')
insert into Kitchen values ('20001','600009')

--creating and inserting values into Product table

create table Product(
    product_id char(5),
    product_name varchar(10) UNIQUE, 
    CONSTRAINT pk_pro PRIMARY KEY (product_name),
    CONSTRAINT fk_proid FOREIGN KEY(product_id) REFERENCES Grocery_Store(product_id) 

);

insert into Product values ('50001', 'Flour')
insert into Product values ('50002', 'Chicken')
insert into Product values ('50003', 'Rice')
insert into Product values ('50004', 'Beef')

--creating and inserting values into Match table

create table Match (
    product_name varchar(10),
    product_match char(1) UNIQUE,
    CONSTRAINT pk_match PRIMARY KEY (product_name, product_match)


);

insert into Match values ('Flour','1')
insert into Match values ('Chicken','2')
insert into Match values ('Rice','3')
insert into Match values ('Beef','4')


--creating and inserting values into Quantities table

create table Quantities (
    
    quantity INTEGER,
    food_id char(6),
    product_match char(1) UNIQUE,
    CONSTRAINT pk_quant PRIMARY KEY (product_match, quantity),
    CONSTRAINT fk_match1 FOREIGN KEY(product_match) REFERENCES Match (product_match),
    CONSTRAINT fk_food FOREIGN KEY(food_id) REFERENCES Kitchen(food_id)

);

insert into Quantities values(30,'600001','1')
insert into Quantities values(20,'600002','2')
insert into Quantities values(20,'600001','3')
insert into Quantities values(35,'600009','4')


-- showing data of the tables

select * from Customer ;

select * from Payment ; P

select * from Orders; 

select * from Coupon; 

select * from Booking_Portal;

select * from Grocery_Store;

select * from Kitchen ;

select * from Product; 

select * from Match;

select * from Quantities;


-- relationship between customer and payment

select * from customer c, payment p where c.cust_id=p.cust_id;

-- show names of all the customers who used credit card as their mode of payment

select c.cust_name, p.pmt_type  
from Customer c 
INNER JOIN Payment p 
on c.cust_id=p.cust_id 
and p.pmt_type = 'Credit card';

-- show names of all the items ordered by customers


select o.item_name,c.cust_name 
from Orders o
FULL JOIN Customer c 
on c.cust_id = o. cust_id;

--show customer email and payment type of all the customers irrespctive if they used the coupon or not

select c.cust_email, p.pmt_type
from Coupon c
LEFT JOIN Payment p 
on c.coupon_code = p.coupon_code; 

--show all the names of the products irrespective of the fact if they are bought from 'Restaurant depot' or not

select p.product_name 
from Grocery_Store g 
RIGHT JOIN Product p 
on g.product_id = p.product_id 
and g.shop_name = 'Restaurant Depot';

-- show customer id if their age >20 and payment type is apple pay 

select cust_id from Customer where age>20
INTERSECT 
select cust_id from Payment where pmt_type = 'Apple pay' 

-- show customer ids of customers whose name starts with 'A' or  if the price of the item they bought is >30

select cust_id from Customer where cust_name like 'A%'
UNION
select cust_id from Payment where item_price >30 ;

-- show customer ids of customers who are younger than 30 and their mode of payment is not Credit card 

select cust_id from Customer where age<30 
except 
select cust_id from Payment where pmt_type = 'Credit card';