select* from order_file;

create table cars_details(
car_num int,
car_name char(15),
brand_name char(20)
);

insert into cars_details values
(1,'Honda City','Honda'),
(2,'Kia Seltos', 'Kia'),
(3, 'Toyota', 'Fortuner'),
(4, 'Jaguar', 'Tata');

select * from cars;
update cars
set car_name = 'Fortuner',
brand_name = 'Toyoya'
where car_num = 3;
update cars
set car_name = 'Nexon'
where car_num = 4;
delete from cars 
where car_num = 4;
select* from cars;
alter table cars
add colour char(20);
select * from cars;
update cars 
set colour = 'green'
where car_num = 1;

select * from cars;
Describe cars;
alter table cars modify car_name char(20);
select * from cars;
alter table cars rename 
column colour to car_colour;
select* from Cars;
alter table cars rename to Cars_Details;
truncate table cars_details;
select * from cars_details;

drop table cars_details;