#data base name is country_people
create database country_people;

use country_people;
-- create a table country

create table country(Id int, Country_name varchar(30) ,Population int not null,
 Area varchar(30)not null);
 
 -- insert  10 rows
 insert into country(Id, country_name,population,Area)
 values( 1, 'china', 1500000, 'shanghai'),
 (2, 'us', 600000, 'phoenix'),
 (3,'uk', 1000000,'king'),
 (4,'india',900000,'gujarat'),
 (5,'null',650000,'tehran'),
 (6,'japan',120000,'hiroshima'),
 (7,'belgium',800000,'charleroi'),
 (8,'chile',700000,'arica'),
 (9,'canada',300000,'toronto'),
 (10,'egypt',500000,'israel');
 
 
-- create a table persons

create table persons( Id int, Fname varchar(15)not null, Lname varchar(15) ,
 Population int not null, Rating int ,Country_Id int not null, 
 Country_name varchar(15) );
 
 insert into persons (Id, fname,Lname,population,Rating,Country_Id,Country_name)
 values(11,'jo','joseph',1500000,4.3,101,'china'),
 (12,'alan','jeo', 600000, 4.6,102,'us'),
 (13,'joshua','alby',1000000,3.7,103,'uk'),
 (14,'sam','jon',900000,3.9,104,'india'),
 (15,'john','peter',650000,3,105,'null'),
 (16,'lilly','mathew',120000,3.4,106,'japan'),
 (17,'jose', 'jerry',800000,4,107,'belgium'),
 (18,'patty','jim',700000,2.9,108,'chile'),
 (19,'jom','jithi',300000,4.9,109,'canada'),
 (20,'anju','jerome',500000,3.1,110,'egypt');
 
 -- Write an SQL query to print the first three characters of Country_name from the Country table
 select substring(country_name,1,3)as first_three_characters from country;
 
 -- Write an SQL query to concatenate first name and last name from Persons table
 select concat(fname,' ', Lname) as fullname from persons;
 
 
 -- Write an SQL query to count the number of unique country names from Persons table
 SELECT COUNT(DISTINCT Country_name) AS UniqueCountryCount FROM Persons;
 
 
 -- Write a query to print the maximum population from the Country table. 
 SELECT MAX(Population) AS MaxPopulation FROM Country;
 
 -- Write a query to print the minimum population from Persons table. 
 SELECT min(Population) AS MINPopulation FROM Country;
 
 -- insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
 INSERT INTO Persons (Id, fname,Lname,population,Rating,Country_Id,Country_name) 
VALUES (21,'Jeo', NULL, 800000,4,102,'US'),
       (22,'Jane', NULL,400000,4.1,109, 'Canada');
       
       SELECT COUNT(Lname) AS LnameCount FROM Persons;
 
 
 -- Write a query to find the number of rows in the Persons table. 
 SELECT COUNT(*) AS TotalRows FROM Persons;
 
 -- Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
 SELECT Population FROM Country LIMIT 3;
 
 -- Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
 SELECT * FROM Country ORDER BY RAND() LIMIT 3;
 
 -- List all persons ordered by their rating in descending order.
 SELECT * FROM Persons ORDER BY Rating DESC;
 
 -- Find the total population for each country in the Persons table. 
 SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name;
 
 -- Find countries in the Persons table with a total population greater than 50,000
 select Country_name, SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name
HAVING TotalPopulation > 50000;
 
 -- List the total number of persons and average rating for each country,but only for countries with more than 2 persons,ordered by the average rating in ascending order
  SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating FROM Persons GROUP BY Country_name
  HAVING COUNT(*) > 2 ORDER BY AverageRating ASC;