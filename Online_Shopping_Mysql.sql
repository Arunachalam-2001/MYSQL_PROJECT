CREATE DATABASE ONLINE_SHOPPING;
USE ONLINE_SHOPPING;
CREATE TABLE items(item_id INT(8),item_name VARCHAR(10) ,constraint PK primary key(item_id));
update  items set item_id=7 where item_name='egg';
INSERT INTO items VALUES(1,'RICE'),(2,'WHEET'),(3,'DALL'),(4,'RAVA'),(5,'MAIDA'),(6,'RICEFLOUR'),(7,'CORN'),(8,'EGG'),(9,'OIL'),(10,'CHILLI'),
(11,'cookies'),(12,'biscuts'),(13,'chicken'),(14,'mutton'),(15,'curd'),(16,'ghee'),(17,'soya'),(18,'chocklate'),(19,'noodels'),(20,'pasta');

SELECT*FROM items;
CREATE TABLE customers(customer_id INT(8),customer_name VARCHAR(20) not null,customer_address VARCHAR(100),customer_phno bigint (15) ,
customer_mailid VARCHAR(80) ,country varchar(10), constraint PK primary key(customer_id),constraint unique_ok unique(customer_name,customer_phno,customer_mailid));
insert into customers values(1011,'LOKI','MURUGAN KOVIL STREET CioDALORE',9087009806,'LOKI@GMAIL.COM','india');
insert INTO customers VALUES(1001,'KRISH','PILLIYAR KOVIL STREET CUDDALORE',9087009876,'KRISH@GMAIL.COM','india'),
(1002,'LOKI','MURUGAN KOVIL STREET CUDDALORE',9087009806,'LOKI@GMAIL.COM','india'),
(1003,'THARUN','KP KOVIL STREET CUDDALORE',9087000876,'THARUN@GMAIL.COM','america'),
(1004,'ARUN','PP ROAD CUDDALORE',9077009876,'ARUN@GMAIL.COM','japan'),
(1005,'HEMA','NP STREET CUDDALORE',9087009870,'HEMA@GMAIL.COM','india'),
(1006,'RAMYA','PILLIYAR KOVIL STREET CHENNAI',9087009846,'RAMYA@GMAIL.COM','japan'),
(1007,'KAVI','PILI ROAD CUDDALORE',8087009876,'KAVI@GMAIL.COM','america'),
(1008,'PRIYA','SALEM MAIN ROAD CUDDALORE',9087009875,'PRIYA@GMAIL.COM','india'),
(1009,'KILO','PILLIYAR KOVIL SALEM',9087009676,'KILO@GMAIL.COM','china'),
(1010,'TONY','AMERICA ROAD CUDDALORE',9067009876,'TONY@GMAIL.COM','usa'),
(1011,'hems','japan ROAD CUDDALORE',9067010876,'hems@GMAIL.COM','usa'),
(1012,'bhar','AMERICA ROAD panruti',9067099876,'bhar@GMAIL.COM','india'),
(1013,'pugaz','china ROAD CUDDALORE',9007009876,'pugaz@GMAIL.COM','china'),
(1014,'vicky','3rd street CUDDALORE',9067879876,'vicky@GMAIL.COM','usa'),
(1015,'kumar','AME road CUDDALORE',8067009876,'kumar@GMAIL.COM','india');
SELECT*FROM CUSTOMERS;

create table orders(order_id int(10),
item_id int(10),
item_price double(16,4), 
item_time timestamp default current_timestamp on update current_timestamp,
customer_id int(10),
item_quantity int(10),
constraint pk primary key (order_id),
constraint fk foreign key(customer_id) references customers(customer_id),
check (item_quantity>0),
constraint fkk foreign key(item_id) references items(item_id));

update orders set customer_id=1015 where order_id=2000;

INSERT INTO ORDERS (order_id,item_id,item_price,customer_id,item_quantity) values(2000,1,200,1001,2),(2001,2,200,1002,2),
(2002,3,200,1003,2),(2003,4,200,1004,2),(2004,5,2000,1005,8),(2005,7,20,1006,3),(2006,6,200,1007,2),(2007,9,200,1008,2),
(2008,10,2050,1009,11),(2009,4,200,1004,4),(2010,10,200,1011,1),(2011,2,20,1009,2),(2012,10,200,1010,2),(2013,6,200,1015,2),(2014,9,200,1013,2),
(2015,5,200,1011,2),(2016,8,2000,1014,2),(2017,10,200,1008,2),(2018,9,200,1014,6),(2019,1,200,1015,5),(2020,9,20,1010,2),
(2021,2,2000,1010,3),(2022,4,200,1004,2),(2023,10,2020,1010,2),(2024,9,200,1012,2),(2025,8,200,1008,9),(2026,7,200,1012,2),(2027,6,200,1013,2),
(2028,9,2000,1014,2),(2029,3,200,1014,7),(2030,6,200,1005,8),(2031,8,200,1010,1),(2032,4,200,1015,4),(2033,9,200,1011,7),
(2034,4,200,1007,2),(2035,6,200,1013,2),(2036,4,200,1008,2),(2037,2,200,1009,1),(2038,4,2005,1006,2),(2039,6,200,1014,2),
(2040,9,200,1008,2),(2041,3,200,1012,3),(2042,9,20,1004,2),(2043,6,200,1010,2),(2044,10,200,1012,2),(2045,4,200,1014,6),
(2046,1,2050,1010,2),(2047,2,2000,1013,2),(2048,4,200,1009,2),(2049,9,200,1015,2),(2050,2,200,1003,2);
select*from orders;
select*from orders where   order_id < 2033;


create table billing(bill_id int ,bill_amount int,order_id int, customer_id int,constraint bk primary key(bill_id),
constraint dkk foreign key (customer_id) references customers(customer_id)); 
insert into billing values(3001,200,2000,1001),(3002,200,2001,1002),(3003,2000,2002,1003),(3004,1000,2003,1004),(3005,100,2004,1005),(3006,4000,2005,1006),
(3007,10,2006,1007);
select*from billing;

select a.order_id ,b.item_name, c.customer_name,d.bill_id,c.country,a.item_time from orders a inner join items b inner join customers c inner join
 billing d on a.item_id = b.item_id and a.order_id=2001;
