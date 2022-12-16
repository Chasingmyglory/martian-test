create schema IF NOT EXISTS Martian_Database ;
use Martian_Database ;
create table Martian_Workers 
(FirstName VarChar(20) Not Null,
MiddleName VARCHAR(20) not null,
Lastname VARCHAR(20) not null,
MartianID char(11) Not null,
BirthDate Date,
MartianAddress VARCHAR(30),
Sex CHAR,
MartianSalary Decimal (10,2),
SectorCommanderID CHAR(9),
SectorNumber INT NOT NULL,
constraint MartianWorkerPrimaryKey
primary key(MartianID),

constraint MartianWorkerForeignKey1
foreign key(SectorCommanderID) references Martian_Workers(MartianID)
ON delete SET NULL
ON Update Cascade
);

create table if not exists Sector
(
SectorName VARCHAR(15) NOT NULL,
SectorNumber int not null,
Sector_CommanderID CHAR(11) not null default "88888888",
SectorCommanderStartDate Date,
constraint SectorPK
primary key(SectorNumber),
unique(SectorName),
Constraint SectorFK
foreign key(Sector_CommanderID) references Martian_Workers(MartianID)
);

create table if not exists Sector_Location
(
SectorNumber int not null,
SectorLocation varchar(15) not null,
Constraint SectorLocationPK
primary key(SectorNumber, SectorLocation),
Constraint SectorLocationFK
foreign key(SectorNumber) references Sector(SectorNumber)
On delete cascade on update cascade
);

Create table if not exists Mission(
MissionName varchar(50) not null default "Mission to be assigned",
MissionNumber int ,
MissionLocation varchar(20) not null default "MissionBase",
SectorNumber int not null,
Unique(MissionName),
Constraint MissionPK
primary key(MissionNumber,MissionName),

Constraint MissionFK
foreign key(SectorNumber) references Sector(SectorNumber)
on update cascade on delete no action);

create table if not exists Working_Mission
( MartianMissionID char(11) not Null,
MissionNumber int not null,
MissionType Char(30),
primary key(MartianMissionID, MissionNumber),
foreign key(MartianMissionID) references Martian_Workers(MartianID),
foreign key(MissionNumber) references Mission(MissionNumber)
);
create table if not exists Martian_Relatives
(
Martian_Relative_ID char(11) not null,
Martian_Relative_Name VARCHAR(20) Not null,
Sex CHAR,
BDate DATE,
Relationship VARCHAR(12),
Primary key(Martian_Relative_ID, Martian_Relative_Name),
Foreign Key (Martian_Relative_ID) references Martian_Workers(MartianID)
);
Use Martian_Database;
alter table Martian_Workers
add column Mars_Arrival_Date date;
alter table Martian_Workers
add column Criminal_Records_Nature VARCHAR(32);

show tables;
show columns from Martian_Workers;
select * from Martian_Workers;
select FirstName from Martian_Workers;
Delete from Martian_Workers;
insert into Martian_Workers (FirstName, MiddleName, Lastname, MartianID, BirthDate, MartianAddress, Sex, MartianSalary, SectorNumber, Mars_Arrival_Date, Criminal_Records_Nature)
 values('Michael',	'B',	'Smithson',	333445555,	'2178-10-30',	'70 Galaxy Drive',	'M', 55000, 5, '2205-10-09', 'None'	);
insert into Martian_Workers values('John',	'B',	'Smith',	123456789,	'2175-09-30',	'731 Spring Valley',	'M', 55000	,333445555	,5	,'2205-10-09',	'None');

select * From Martian_Workers;




 