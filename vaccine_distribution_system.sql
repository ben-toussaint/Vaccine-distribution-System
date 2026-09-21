Create table Vaccine(
VaccineID serial primary key,
VaccineName varchar(30),
Manufacturer varchar(30),
VaccineType varchar(30),
NumberOfDose int
);
Create Table Supplier(
supplierID serial primary key,
supplierName varchar(30),
contactPerson varchar(30),
Telephone bigint,
email varchar(30)
);
create table Supplier_Vaccine(
vaccineId int references vaccine(vaccineId),
supplierid int references supplier(supplierid)
);
create table batches(
batchNumber serial primary key,
ManufacturerDate date,
Expiringdate date,
QuantityReceived int,
vaccineId int references vaccine(vaccineId)
);
create table HealthFacility(
facilityId serial primary key,
facilityName varchar(30),
District varchar(30),
facilityType varchar(30),
TelephoneNumber bigint
);
create table distribution(
distributionId serial primary key,
distributiondate date,
quantityDistributed int,
batchnumber int references batches(batchnumber),
facilityId int references HealthFacility(facilityId)
);
create table staffMembers(
staffId serial primary key,
fullName varchar(30),
staffPosition varchar(30),
telephonenumber bigint,
facilityid int references HealthFacility(facilityid)
);
insert into vaccine(VaccineName,Manufacturer,VaccineType,NumberOfDose)
values('Paracetamol','kipharma','antibiotic',3),
('Felvix','Mediasol','allergic',2),
('ascoril','rwanda_Ltd','antibiotic',2),
('BCG','Japan_Laboratory','antibiotic',4),
('HPV','Kenya_laboratory','AIDs',3),
('RotaVirus','Chard_laboratory','Allergy',5),
('Influenza','Egypt_labo','Antibiotic',10),
('Varicella','Varivax','fatigue',2),
('Betapine','SouthAfrica','Painkiller',2),
('IPV','America_Labo','antibiotic',2);

Insert into supplier(supplierName,contactPerson,Telephone,email)
values('David','Boris',234567654,'dave@gmail.com'),
('credo','manzi',34678756,'cre@gmail.com'),
('jabo','Ghislain',5678767987,'Jabo@gmail.com'),
('chrestien','karuhije',34567898,'chrest@gmail.com'),
('Angelo','intungane',3567896,'angelo@gmail.com'),
('nelso','muhire',45678909,'nelson@gmail.com'),
('neila','Ishimwe',56789876,'neil@gmail.com'),
('pamella','isimbi',3578986,'pamella@gmail.com'),
('mike','ishimwe',67898778,'mike@gmail.com'),
('james','Ribron',4567890,'james@gmail.com');

insert into batches(ManufacturerDate,Expiringdate,QuantityReceived,vaccineId)
values ('12-07-2026','04-23-2028',4,1),
('08-13-2026','05-22-2028',3,2),
('07-18-2027','04-23-2029',5,4),
('07-11-2026','04-10-2030',4,3),
('07-08-2025','04-23-2031',10,5),
('08-11-2020','04--2038',2,6),
('12-07-2026','23-09-2028',12,7),
('02-07-2026','02-07-2033',40,9),
('20-06-2026','03-08-2028',20,8),
('25-07-2026','04-11-2029',15,10);

insert into HealthFacility(facilityName,District,FacilityType,TelephoneNumber)
values('UGHE','Gicumbi','Medecine',45678959),
('La Croix du Sud','Kicukiro','Medicine & Eye Operation',87654356),
('Ruhengeli Hospital','Musanze','Medicine',67899876),
('Nemba Hospital','Gakenke','Medicine',87655678),
('CHIB','Gasabo','Medicine',346782456),
('Kanombe Military hospital','kicukiro','Medecine Internal',76543456),
('Faisal King','Gasabo','Medicine',45678987),
('CHIK','Gasabo','Medicine',987654890),
('Busogo Hospital','Nyabihu','Psychology',3456789876),
('Nyamata Hospital','Bugesera','eye-care',456789987);

insert into staffMembers(fullName,staffPosition,telephonenumber,facilityid)
values('Jean','Secretary',2345678,2),
('Marie','Nurse-assistance',98767887,3),
('kevin','nurse',9875563,1),
('Sabo','Nurse-assistance',876543456,5),
('hirwa','Nurse-assistance',34567654,4),
('Bruno','Doctor',876543,6),
('Ntwari','secretary',987653,7),
('Cyusa','nurse',987654456,8),
('Cyubahiro','Doctor',3456745,9),
('Guidelano','Nurse-assistance',765432,10);

insert into distribution(distributiondate,quantityDistributed,batchnumber,facilityId)
values ('02-02-2023',34,2,1),
('03-03-2024',32,1,2),
('03-10-2024',23,4,3),
('09-09-2025',42,3,4),
('03-08-2026',23,6,5),
('07-07-2027',12,5,6),
('03-06-2028',40,7,7),
('06-04-2029',23,8,8),
('03-02-2030',34,10,9),
('02-04-2031',33,9,10);

insert into Supplier_Vaccine(vaccineId,SupplierId)
values(1,2),
(2,4),
(4,5),
(5,8),
(9,10),
(7,6),
(3,1),
(6,3),
(8,9),
(10,7);
select * from Supplier_Vaccine;
select * from supplier;
select * from batches;
select * from vaccine;
select * from healthfacility;
select * from staffmembers;
select * from distribution;


--Doing some query as follow.
--Displaying vaccine supplied by a specific supplier.
SELECT Vaccine.VaccineID, Vaccine.VaccineName
FROM vaccine JOIN Supplier_Vaccine
ON vaccine.vaccineID = supplier_vaccine.vaccineID
JOIN Supplier
ON supplier_vaccine.supplierID = supplier.supplierID
WHERE supplierName= 'jabo';


--Displaying all batches that will be displayed within next 90 days
SELECT * 
FROM batches
WHERE (Expiringdate) <= current_date + 90;

-- displaying the number of COUNT function which display number of staff members in each facility.
SELECT facilityId, COUNT(*) AS numberOfstaff
FROM staffMembers
GROUP BY facilityId
ORDER BY facilityID;

--Calculating the total vaccine distributed per facility
SELECT facilityId, SUM(quantityDistributed) AS TotalVaccines
FROM distribution
GROUP BY facilityId
ORDER BY facilityId ASC;

--Displaying all vaccines
SELECT VaccineID, VaccineName
FROM Vaccine;
SELECT *
FROM Vaccine;

--Displaying all suppliers
SELECT *
FROM Supplier;
SELECT supplierID, supplierName
FROM Supplier;

--Displaying health facilities located in Gasabo District
SELECT facilityId, facilityName
FROM HealthFacility
WHERE District = 'Gasabo';

--Displaying all staff members working at GASABO district.
SELECT fullName
FROM staffMembers
JOIN HealthFacility
ON staffMembers.facilityId = HealthFacility.facilityId
WHERE District = 'Gasabo';

--Display all vaccine batches sorted by expiry date.
SELECT *
FROM batches
ORDER BY Expiringdate;

--Display all vaccines manufactured by Mediasol.
SELECT *
FROM Vaccine
WHERE manufacturer = 'Mediasol';

--Display all vaccines requiring 2 doses.
SELECT *
FROM Vaccine
WHERE numberofdose = 2;

-- Display all batches received after 1 January 2026.
SELECT *
FROM batches
WHERE ReceivedDate > '2026-01-01';

--Display all health facilities ordered alphabetically.
SELECT *
FROM HealthFacility
ORDER BY facilityName ASC;

--Display all staff members whose position is nurse.
SELECT *
FROM staffMembers
WHERE staffPosition = 'nurse';

-- Display every vaccine together with its suppliers.
SELECT vaccine.VaccineName, Supplier.supplierName
FROM vaccine
INNER JOIN Supplier_Vaccine
ON vaccine.VaccineID = Supplier_Vaccine.VaccineID
INNER JOIN Supplier
ON Supplier.supplierID = Supplier_Vaccine.supplierID;

--Display every vaccine batch together with the vaccine name.
SELECT batches.batchNumber, vaccine.VaccineName
FROM batches
JOIN vaccine
ON vaccine.vaccineID = batches.vaccineID
ORDER BY batchNumber;

--Display all staff together with their health facilities.
SELECT staffMembers.fullName, staffMembers.staffPosition, staffMembers.telephonenumber, 
HealthFacility.facilityName
FROM staffMembers
JOIN HealthFacility
ON HealthFacility.facilityid = staffMembers.facilityid;

--Display all facilities together with the total vaccines they have received.
SELECT HealthFacility.facilityid,
		HealthFacility.facilityName.
		SUM(batches.QuantityReceived) AS total_vaccine_received
FROM HealthFacility
JOIN batches
ON HealthFacility.facilityid = batches.facilityid
GROUP BY HealthFacility.facilityid, HealthFacility.facilityName;

--Display all batches together with supplier information.
SELECT *
FROM batches;

--Count the total number of vaccines.
SELECT COUNT(*) AS total_vaccines
FROM batches;

SELECT SUM(QuantityReceived) AS total_does
FROM batches;

--Count the total number of health facilities.
SELECT COUNT(*) AS total_of_health_facilites
FROM HealthFacility;

--Calculate the total quantity of vaccines received.
SELECT SUM(QuantityReceived) AS Quantity_Received
FROM batches;

--Calculate the total quantity distributed.
SELECT SUM(quantityDistributed) AS quantity_Distributed
FROM distribution;

--Calculate the average quantity received per batch.
SELECT AVG(QuantityReceived) AS average_quantity
FROM batches;

--Display the highest quantity received.
SELECT MAX(QuantityReceived) AS highest_quantity
FROM batches;

--Display the lowest quantity received.
SELECT MIN(QuantityReceived) AS lowest_quantity
FROM batches;

--Display the total number of batches for each vaccine.
SELECT vaccines.VaccineName,
		COUNT(batches.batchNumber) AS total_batches
FROM batches
GROUP BY vaccines.vaccineName;

--Display the total quantity distributed for each facility.
SELECT HealthFacility.facilityName,
		SUM(distribution.quantityDistributed) AS total_quantity_distributed
FROM HealthFacility
JOIN distribution
ON HealthFacility.facilityid = distribution.facilityid
GROUP BY HealthFacility.facilityName;

SELECT 	COUNT(*) AS  total_vaccines
FROM vaccines;
--highest.
SELECT SUM(QuantityReceived) AS total_recevied
FROM batches;

--learn how to use left join and right join.

--how sub-query works
SELECT batchNumber,
		ManufacturerDate,
		QuantityReceived,
		vaccineID
FROM batches
WHERE ManufacturerDate = (
	SELECT MIN(ManufacturerDate)
	FROM batches);