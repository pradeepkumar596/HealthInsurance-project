CREATE DATABASE IF NOT EXISTS INSURANCE;
USE INSURANCE;
create table Hospital
(
CustomerID varchar(100) NOT NULL,
year varchar(100) NOT NULL,
month varchar(100) NOT NULL,
date varchar(100)NOT NULL,
charges int(100)NOT NULL,
Hospitaltier varchar(100) NOT NULL,
Citytier varchar(100) NOT NULL,
StateID varchar(100) NOT NULL,
PRIMARY KEY(CustomerID));
use INSURANCE;
create table medical
(
CustomerID Varchar(100),
BMI int(100),
HBA1C int(100),
HeartIssues varchar(100),
AnyTransplants varchar(100),
Cancerhistory varchar(100),
NumberOfMajorSurgeries varchar(100),
smoker varchar(100),
PRIMARY KEY(CustomerID));
ALTER TABLE hospital
ADD COLUMN children int(100);

SELECT * FROM hospital 
JOIN medical
ON hospital.CustomerID = medical.CustomerID;

select m.HBA1C, m.`HeartIssues`, avg(h.children), avg(m.BMI), avg(h.charges) 
from medical as m 
inner join hospital as h 
on h.`CustomerID` = m.`CustomerID`
where m.HBA1C>6.5 and m.`HeartIssues`= 'yes'; 

select `Hospitaltier`, avg(charges) as avg_cost from hospital group by `Hospitaltier`;
select `Citytier`, avg(charges) as avg_cost from hospital group by `Citytier`;

select count(`CustomerID`) from medical where `Cancerhistory`='Yes' and NumberOfMajorSurgeries>0;
select `StateID`, count(`Hospitaltier`) from hospital where `Hospitaltier`='tier - 1' group by `StateID`;