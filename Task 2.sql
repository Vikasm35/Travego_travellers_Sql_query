use travego;

select * from pasenger;
select * from price;

-- a.How many female passengers traveled a minimum distance of 600KMs?
select count(gender) as Female_pasenger from pasenger where gender ='F' and (distance) >= 600;

-- b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select pasenger_id,pasenger_name,category,gender,boarding_city,destination_city from pasenger where bus_type = 'Sleeper' and distance >= 500;

-- c.Select passenger names whose names start with the character'S'.
select * from pasenger where pasenger_name like 'S%';

-- d.Calculate the price charged for each passenger,displaying the Passengername,BoardingCity,Destination City,Bustype,and Price in the output.
#select p.pasenger_id,p.pasenger_name,p.Boarding_city,p.destination_city,p.bus_type,p.distance,r.price from pasenger p left join price r on p.distance = r.distance;
select pasenger.pasenger_name,pasenger.boarding_city,pasenger.destination_city,pasenger.bus_type,price.price from pasenger,price where pasenger.distance = price.distance;

-- e.What are the passengername(s) and the ticket price for those who traveled 1000KMs Sitting in a bus?
select p.pasenger_id,p.pasenger_name,p.Boarding_city,p.distance,p.destination_city,p.bus_type,r.distance,r.price
from pasenger p inner join price r
on p.pasenger_id = r.id
where p.bus_type ='Sitting' and p.distance >= 1000;

-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select * from pasenger where pasenger_name = 'Pallavi';
select bus_type,price from price where distance = (select distance from pasenger where pasenger_name = 'Pallavi');

-- g.Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
update pasenger set category = 'Non-AC' where bus_type = 'Sleeper';
select * from pasenger;

-- h.Delete an entry from the table where the pasenger name is Piyush and commit this change in the database.
delete from pasenger where pasenger_name = 'Piyush';
commit;

-- i.Truncate the table passenger and comment on the number of rows in the table (explain if required).
truncate table pasenger;
select * from pasenger;

-- j.Delete the table passenger from the database
drop table pasenger;
   

