/* QN 1 : Creation of tables  PASSENGER AND PRICE in the new Database TravelOnTheGo */
drop database if exists TravelOnTheGo;
create database TravelOnTheGo;
use TravelOnTheGo;
create table PASSENGER (passenger_name  varchar(50), category varchar(50), gender varchar(2), boarding_City varchar(20), destination_city varchar(20), distance int, bus_type varchar(8));
create table PRICE (Bus_Type varchar(8), Distance int, Price int);

/* QN 2 : Insertion of data into tables  PASSENGER AND PRICE */
INSERT INTO PASSENGER VALUES ("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
INSERT INTO PASSENGER VALUES ("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
INSERT INTO PASSENGER VALUES ("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
INSERT INTO PASSENGER VALUES ("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
INSERT INTO PASSENGER VALUES ("Udit","Non-AC","M","TrivANDrum","panaji",1000,"Sleeper");
INSERT INTO PASSENGER VALUES ("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
INSERT INTO PASSENGER VALUES ("Hemant","Non-AC","M","panaji","Mumbai",700,"Sleeper");
INSERT INTO PASSENGER VALUES ("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
INSERT INTO PASSENGER VALUES ("Piyush","AC","M","Pune","Nagpur",700,"Sitting");

INSERT INTO PRICE VALUES ("Sleeper",350,770);
INSERT INTO PRICE VALUES ("Sleeper",500,1100);
INSERT INTO PRICE VALUES ("Sleeper",600,1320);
INSERT INTO PRICE VALUES ("Sleeper",700,1540);
INSERT INTO PRICE VALUES ("Sleeper",1000,2200);
INSERT INTO PRICE VALUES ("Sleeper",1200,2640);
INSERT INTO PRICE VALUES ("Sleeper",1500,2700);
INSERT INTO PRICE VALUES ("Sitting",500,620);
INSERT INTO PRICE VALUES ("Sitting",600,744);
INSERT INTO PRICE VALUES ("Sitting",700,868);
INSERT INTO PRICE VALUES ("Sitting",1000,1240);
INSERT INTO PRICE VALUES ("Sitting",1200,1488);
INSERT INTO PRICE VALUES ("Sitting",1500,1860);

/* QN 3 : How many females AND how many male passengers travelled for a minimum distance of 600 KMs? */
SELECT
  count(case when gender='F' then 1 end) as females_count,
  count(case when gender='M' then 1 end) as males_count FROM passenger WHERE Distance>= 600;

/* QN 4 : Find the minimum ticket price for Sleeper Bus + vefiying the maximum as well */
SELECT min(price) AS Minimum_Price FROM Price WHERE bus_type='Sleeper';
SELECT max(price) AS Maximum_Price FROM Price WHERE bus_type='Sleeper';

/* QN 5 : SELECT passenger names whose names start with character 'S' */
SELECT passenger_name FROM PASSENGER WHERE passenger_name LIKE 'S%';

/* QN 6 : Price for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output */
SELECT t1.passenger_name, t1.boarding_City, t1.destination_city, t1.bus_type, t2.price FROM PASSENGER T1, PRICE T2 
WHERE t1.bus_type=t2.bus_type AND t1.distance=t2.distance;

/* QN 7 : Passenger name/s AND his/her ticket price who travelled in the Sitting bus for a distance of 1000 KMs  */
SELECT t1.passenger_name,t1.bus_type,t1.distance, t2.price FROM PASSENGER t1, PRICE t2 
WHERE t1.distance>=1000 AND t1.bus_type='Sitting' AND t1.bus_type=t2.bus_type AND t1.distance=t2.distance;
/* QN 7a Logic verification  : Passenger name/s AND his/her ticket price who travelled in the Sleeper bus for a distance of 1000 KMs  */
SELECT t1.passenger_name,t1.bus_type,t1.distance, t2.price FROM PASSENGER t1, PRICE t2 
WHERE t1.distance>=700 AND t1.bus_type='Sleeper' AND t1.bus_type=t2.bus_type AND t1.distance=t2.distance;
/* QN 7b Logic verification  : Passenger name/s AND his/her ticket price who travelled in the Sitting bus for a distance of 600 KMs  */
SELECT t1.passenger_name,t1.bus_type,t1.distance, t2.price FROM PASSENGER t1, PRICE t2 
WHERE t1.distance>=600 AND t1.bus_type='Sitting' AND t1.bus_type=t2.bus_type AND t1.distance=t2.distance;
/* QN 7c Logic verification  : Passenger name/s AND his/her ticket price who travelled in the Sitting bus for a distance of 500 KMs  */
SELECT t1.passenger_name,t1.bus_type,t1.distance, t2.price FROM PASSENGER t1, PRICE t2 
WHERE t1.distance>=500 AND t1.bus_type='Sitting' AND t1.bus_type=t2.bus_type AND t1.distance=t2.distance;
/* QN 7d Logic verification  : Passenger name/s AND his/her ticket price who travelled in the Sitting bus for a distance of 500 KMs  */
SELECT t1.passenger_name,t1.bus_type,t1.distance, t2.price FROM PASSENGER t1, PRICE t2 
WHERE t1.distance>=1500 AND t1.bus_type='Sleeper' AND t1.bus_type=t2.bus_type AND t1.distance=t2.distance;

/* QN 8 : What will be the Sitting AND Sleeper bus charge for Pallavi to travel FROM Bangalore to Panaji? */
SELECT t1.passenger_name, t1.bus_type, t1.distance, t2.price FROM PASSENGER T1, PRICE T2 WHERE t1.passenger_name='Pallavi' AND t1.distance=600 AND t1.distance=t2.distance;

/* QN 9 : List the distances FROM the 'Passenger' table which are unique (non-repeated distances) in descending order */
SELECT DISTINCT distance FROM PASSENGER ORDER BY distance desc;

/* QN 10 : Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables  */
SELECT passenger_name, distance, distance * 100.0 / (SELECT SUM(distance) from PASSENGER) AS percentage FROM PASSENGER;

/* QN 11 : Display the distance, price in three categories in table Price; a) Expensive if the cost is more than 1000 b) Average Cost if the cost is less than 1000 and greater than 500  */
SELECT distance, price,  
CASE WHEN price >  1000 THEN 'Expensive'
 WHEN price BETWEEN 500 AND 1000 THEN 'Average Cost'
 ELSE 'Cheap' 
 END AS Categories
 FROM PRICE;

