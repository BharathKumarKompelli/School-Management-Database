CREATE DATABASE CollegesystemDB1

CREATE TABLE GraduateAssistantDetails1
(
	UniversityName varchar(50),
	GraduateAssistantID int,
	Age int,
	Gender varchar(50),
	Country varchar(50),
	Residence varchar(50),
	VisaStatus varchar(50),
	CONSTRAINT PK_GraduateAssistantDetails1_GraduteAssistantID PRIMARY KEY CLUSTERED (GraduateAssistantID)
)

INSERT INTO GraduateAssistantDetails1([UniversityName],[GraduateAssistantID],[Age],[Gender],[Country],[Residence],[VisaStatus])
VALUES	('UB',1007900,23,'M','India','ParkAve.','F-1'),
		('UB',1007932,23,'F','UnitedStates','MainStreet','F-1'),
		('UB',1007946,23,'F','Pakistan','MainStreet','F-2'),
		('UB',1007903,22,'F','India','MadisonAve.','H-1'),
		('UB',1007987,28,'M','India','ParkAve.','F-1'),
		('UB',1007948,27,'M','India','ParkAve.','F-1')
		
SELECT * FROM GraduateAssistantDetails1;

CREATE TABLE GraduateAssistantDetails2
(
	GraduateAssistantID int,
	GraduateAssistant varchar(50),
	Phone varchar(50),
	Email varchar(50),
	Payperhour int,
	CONSTRAINT PK_GraduateAssistantDetails2_GraduteAssistant PRIMARY KEY CLUSTERED (GraduateAssistant),
	CONSTRAINT FK_GraduateAssistantDetails2_GraduateAssistantID FOREIGN KEY (GraduateAssistantID)     
	REFERENCES GraduateAssistantDetails1 (GraduateAssistantID)     
	ON DELETE CASCADE    
	ON UPDATE CASCADE  
)

INSERT INTO GraduateAssistantDetails2([GraduateAssistantID],[GraduateAssistant],[Phone],[Email],[Payperhour])
VALUES  (1007900,'Ajay','203-181-1877','ajay@bridgeport.edu',9.5),
		(1007932,'Priya','203-187-8742','priya@bridgeport.edu',9),
		(1007946,'Neha','203-487-1848','neha@bridgeport.edu',11),
		(1007903,'Swetha','203-489-8140','swetha@bridgeport.edu',8.5),
		(1007987,'Arvind','203-697-1021','mohan@bridgeport.edu',11),
		(1007948,'Bharath','203-187-9700','bharath@bridgeport.edu',15)
				
SELECT * FROM GraduateAssistantDetails2;
	
CREATE TABLE DeanDetails
(
	DeanID int,
	DepartmentDean varchar(50),
	CoursesTaught varchar(50),
	GraduateAssistant varchar(50),
	Phone varchar(50),
	Fax varchar(50),
	Deanemail varchar(50),
	CONSTRAINT PK_DeanDetails_DepartmentDean PRIMARY KEY CLUSTERED (DepartmentDean),
	CONSTRAINT FK_DeanDetails_GraduateAssistant FOREIGN KEY (GraduateAssistant)     
	REFERENCES GraduateAssistantDetails2 (GraduateAssistant)     
	ON DELETE CASCADE    
	ON UPDATE CASCADE
)

INSERT INTO [dbo].[DeanDetails]([DeanID],[DepartmentDean],[CoursesTaught],[GraduateAssistant],[Phone],[Fax],[Deanemail])
VALUES (701800,'J.Lee','OperatingSystems','Ajay','203-575-7184','203-576-4755','jelee@bridgeport.edu'),
	   (701801,'Ausif Mahmood','WindowsProgramming','Priya','203-576-4737','203-576-8175','mahmood@bridgeport.edu'),
	   (701802,'Navarun Gupta','Signals&Systems','Neha','203-576-4117','203-576-4105','navarung@bridgeport.edu'),
	   (701803,'Junling (Joyce) Hu','AppliedThermodynamics','Swetha','203-576-4757','203-576-1871','jjhu@bridgeport.edu'),
	   (701804,'Gad J. Selig','Informatics','Arvind','203-576-4870','203-576-8174','gadselig@bridgeport.edu'),
	   (701805,'Prabir Patra','TissueEngineering','Bharath','203-576-4165','203-576-1112','ppatra@bridgeport.edu')
	 
SELECT * FROM DeanDetails;

CREATE TABLE Departments
(
	DepartmentID int,
	Departmentname varchar(50),
	DepartmentDescription varchar(200),
	DepartmentDean varchar(50),
	SchoolName varchar(50),
	LevelofEducation varchar(50),
	CONSTRAINT PK_Departments_DepartmentID PRIMARY KEY CLUSTERED (DepartmentID),
	CONSTRAINT FK_Departments_DepartmentDean FOREIGN KEY (DepartmentDean)     
	REFERENCES DeanDetails (DepartmentDean)     
	ON DELETE CASCADE    
	ON UPDATE CASCADE
)

INSERT INTO [dbo].[Departments]([DepartmentID],[Departmentname],[DepartmentDescription],[DepartmentDean],[SchoolName],[LevelofEducation])
VALUES (701,'ComputerScience','This department is related to the software/development sector','J.Lee','SchoolofEngineering','Graduate'),
	   (702,'ComputerEngineering','This department is related to the software/engineering sector ','Ausif Mahmood','SchoolofEngineering','Graduate'),
	   (703,'ElectricalEngineering','This department is related to the electrical development sector','Navarun Gupta','SchoolofEngineering','Graduate'),
	   (704,'MechanicalEngineering','This department is related to the machinery/automobile sector','Junling (Joyce) Hu','SchoolofEngineering','Graduate'),
	   (705,'TechnologyManagement','This department is related to the business management skills sector','Gad J. Selig','SchoolofEngineering','Graduate'),
	   (706,'BiomedicalEngineering','This department is related to the engineering principles and design concepts to medicine and biology for healthcare purposes','Prabir Patra','SchoolofEngineering','Graduate')

SELECT * FROM Departments;

CREATE TABLE DepartmentInformation
(
	DepartmentID int,
	CourseID varchar(50),
	Coursesname varchar(50),
	Professor varchar(50),
	Termoffered varchar(50),
	Gradepoint int,
	Buildinglocation varchar(50),
	Categoryofcourse varchar(50),
	CONSTRAINT PK_DepartmentInformation_CourseID PRIMARY KEY CLUSTERED (CourseID),
	CONSTRAINT FK_DepartmentInformation_DepartmentID FOREIGN KEY (DepartmentID)     
    REFERENCES Departments (DepartmentID)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE    
)

INSERT INTO [dbo].[DepartmentInformation]([DepartmentID],[CourseID],[Coursesname],[Professor],[Termoffered],[Gradepoint],[Buildinglocation],[Categoryofcourse])
VALUES  (701,'CPSC551','AdvanceDatabase','R.Baseda','FALL','3','CarlsonHall','Graduate'),
		(701,'CPSC501','ObjectorientedprogrammingthroughJava','S.Hamada','FALL&SPRING','3','CarlsonHall','Graduate'),
		(701,'CPEG572','Dataandcomputercommunications','Omar Abuzaghleh','FALL&SPRING','3', 'TechBuilding','Graduate'),
		(701,'CPSC502','OperatingSystems','J.Lee','SPRING&SUMMER', '3','CarlsonHall','Graduate'),
		(701,'CPSC503','Theoryofalgorithmsandanalysis','Ditcher','SPRING','3','CarlsonHall','Graduate'),
		(701,'CPSC545','ComponentBasedSoftwareDesign','A.Mahmood','FALL','3','TechBuilding','UnderGraduate'),
		(701,'CPSC552','Datamining','J.Lee','FALL&SUMMER','3','CarlsonHall','Graduate'),
		(701,'CPEG460','IntrotoRobotics','S.Patel','FALL','3','CarlsonHall','UnderGraduate'),
		(701,'CPEG561','NetworkSecurity','K.Ellithy','SPRING','3','CarlsonHall','UnderGraduate'),
		(702,'CPEG510','ComputerArchitecture','Abuzneid','FALL','3','TechBuilding','Graduate'),
		(702,'CPSC511','ObjectorientedprogrammingthroughJava','S.Hamada','FALL&SPRING','3','CarlsonHall','Graduate'),
		(702,'CPEG471','Dataandcomputercommunications','Omar Abuzaghleh','FALL&SPRING','3', 'TechBuilding','Graduate'),
		(702,'CPEG448','IntroductiontoVLSIDesign','A.Mahmood','SUMMER', '3','TechBuilding','UnderGraduate'),
		(702,'ELEG443','AppliedDigitalSignalProcessing','M.Faezipour','SPRING&SUMMER','3','TechBuilding','UnderGraduate'),
		(702,'CPSC546','ComponentBasedSoftwareDesign','M.Faezipour','FALL&SPRING','3','TechBuilding','Graduate'),
		(702,'CPEG286','IntrotoMicroprocessor','X.Xiong','SPRING&SUMMER','3','TechBuilding','UnderGraduate'),
		(702,'CPEG349','SeniorDesignProject','J.Lee','FALL','3','CarlsonHall','UnderGraduate'),
		(702,'CPEG540','ImageProcessing','A.Mahmood','FALL','3','TechBuilding','Graduate'),
		(703,'ELEG447','SemiConductors','M. Ben Haj Frej','FALL&SUMMER','3','TechBuilding','Graduate'),
		(703,'ELEG415','FibreOptics','L.Murcik','FALL','3','TechBuilding','Graduate'),
		(703,'ELEG416','FibreOpticsLab','L.Murcik','SUMMER','3', 'TechBuilding','Graduate'),
		(703,'ELEG449','WirelessSensorNetworks','M. Ben Haj Frej','FALL', '3','TechBuilding','Graduate'),
		(703,'ELEG444','LowPowerVLSI','H.Bajwa','SPRING','3','TechBuilding','Graduate'),
		(703,'ELEG333','Signals&Systems','N.Gupta','FALL','3','TechBuilding','UnderGraduate'),
		(703,'ELEG458','AnalogVLSI','H. Bajwa','SPRING&SUMMER','3','TechBuilding','Graduate'),
		(703,'ELEG404','DigitalVLSI','H.Bajwa','SPRING','3','TechBuilding','Graduate'),
		(703,'ELEG417','ModernElectronics','R. Budzilek','SUMMER','3','TechBuilding','Graduate'),
		(704,'MEEG410','AdvancedFluidDynamics','J.Pallis','SPRING','3','TechBuilding','Graduate'),
		(704,'MEEG463','AdvancedHeatTransfer','J.Pallis','FALL&SUMMER','3','TechBuilding','Graduate'),
		(704,'MEEG452','AdvancedVibrations','J.Pallis','SUMMER','3','MandevilleHall','Graduate'),
		(704,'MEEG454','AdvancedDynamics','J. Pallis','FALL','3','TechBuilding','Graduate'),
		(704,'MEEG453','FiniteElementMethod','J.Hu','FALL&SPRING','3','MandevilleHall','Graduate'),
		(704,'MEEG421','ComputerAidedEngrDesign','Z.Li','SUMMER','3','MandevilleHall','Graduate'),
		(704,'MEEG423','CAM&NCMachining','Z.Li','FALL','3','TechBuilding','Graduate'),
		(704,'MEEG462','AppliedThermodynamics','J.HU','FALL,SPRING&SUMMER','3','MandevilleHall','Graduate'),
		(705,'TCMG505','ProjectManagement','L.Jagtiani','FALL','3','MandevilleHall','Graduate'),
		(705,'TCMG530','FoundMarketingManagement','L.Frame','SPRING','3','MandevilleHall','Graduate'),
		(705,'TCMG410','Survey of Technology','L.Frame','FALL&SPRING','3','MandevilleHall','Graduate'),
		(705,'TCMG549','BusIntell&DecisionSupSyst ','M.Lohle','SPRING&SUMMER','3','MandevilleHall','Graduate'),
		(705,'TCMG524','StatisticalQualityControlTech.','N.Kongar','FALL','3','MandevilleHall','Graduate'),
		(705,'TCMG495','TechWriting,Comm.andResearch','S.Rashba','FALL','3','MandevilleHall','Graduate'),
		(705,'TCMG572','ProductionTech&Techniques','Z.Li','SPRING','3','MandevilleHall','Graduate'),
		(705,'TCMG574','PrinofLogistics&MatlMgt','N.Kongar','SPRING','3','MandevilleHall','Graduate'), 
		(706,'BMEG410','Bio-Sensors','I.Macwan','SPRING','3','MandevilleHall','Graduate'),
		(706,'BMEG412','BioElectronics','I.Macwan','FALL','3','MandevilleHall','Graduate'),
		(706,'BMEG543','DSPLab','M.Joshi','SPRING&SUMMER','3','TechBuilding','Graduate'),
		(706,'BMEG573','MagnetoBio-Engineering','A.Petryk','SPRING','3','DanaHallofScience','Graduate'),
		(706,'BMEG580','TissueEngineering','A.Petryk','FALL','3','MandevilleHall','Graduate'),
		(706,'BMEG537','QuantNMRinBiomedicalEngin','D.Coman','FALL','3','MandevilleHall','Graduate'),
		(706,'BMEG515','Adv.DigitalSystems','M.Faezipour','SPRING','3','MandevilleHall','Graduate')

SELECT * FROM DepartmentInformation;

CREATE TABLE Students
(
	DepartmentID int,
	StudentFirstname varchar(50),
	StudentLastname varchar(50),
	StudentID varchar(50),
	Section varchar(50),
	Studentaddress varchar(50),
	City varchar(50),
	St varchar(50),
	Postalcode varchar(50),
	Graduationyear varchar(50),
	Contact varchar(50),
	CONSTRAINT PK_Students_StudentID PRIMARY KEY CLUSTERED (StudentID),
	CONSTRAINT FK_Students_DepartmentID FOREIGN KEY (DepartmentID)     
    REFERENCES Departments (DepartmentID)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE    
)

INSERT INTO Students([DepartmentID],[StudentFirstname],[StudentLastname],[StudentID],[Section],[Studentaddress],[City],[St],[Postalcode],[Graduationyear],[Contact])
VALUES  (701,'BharathKumar','Kompelli','S18740','B','Apt.101 Park Ave.','Bridgeport','CT','06604','2016','207-187-1484'),
		(705,'Suresh','Kumar','S18741','A','Apt.156 Madison Ave.','Bridgeport','CT','06605','2017','207-187-1486'),
		(706,'Tejas','Hoizal','S18742','C','Apt.106 Tutson Ave.','Bridgeport','CT','06606','2016','207-187-1445'),
		(703,'Mark','Ing','S18743','B','Apt.10 Fairfield Ave.','Bridgeport','CT','06610','2016','207-187-1489'),
		(701,'Manoj','Kumar','S18744','D','Apt.1610 Fairfield Ave.','Bridgeport','CT','06610','2018','207-187-1413'),
		(706,'Zhug','Hung','S18745','A','Apt.101 Park Ave.','Bridgeport','CT','06604','2017','207-187-1432'),
		(701,'Ramesh','Tummuru','S18746','A','Apt.1610 Fairfield Ave.','Bridgeport','CT','06610','2018','207-187-1485'),
		(703,'Mounika','Bomma','S18747','C','Apt.140 Wine Ave.','Bridgeport','CT','06609','2019','207-187-1401'),
		(704,'Amrutha','Bomma','S18748','C','Apt.140 Wine Ave.','Bridgeport','CT','06609','2017','207-187-14804'),
		(704,'Sasi','Rajulapati','S18749','D','Apt.101 Park Ave.','Bridgeport','CT','06604','2018','207-187-1488'),
		(705,'Akhil','Reddy','S18750','D','Apt.106 Tutson Ave.','Bridgeport','CT','06606','2016','207-187-14806'),
		(704,'Chaitanya','Mulamari','S18751','B','Apt.140 Wine Ave.','Bridgeport','CT','06604','2017','207-187-1470'),
		(706,'Boreedy','Praneeth','S18752','A','Apt.100 Post Ave.','Bridgeport','CT','06721','2018','207-187-1472'),
		(702,'Phani','Kumar','S18753','D','Apt.101 Park Ave.','Bridgeport','CT','06604','2019','207-187-1474'),
		(704,'Praneeth','Akula','S18754','C','Apt.202 Park Ave.','Bridgeport','CT','06604','2020','207-187-1477'),
		(705,'Ashish','Akula','S18755','D','Apt.202 Park Ave.','Bridgeport','CT','06604','2018','207-187-1400'),
		(706,'Nitish','Kondameedhi','S18756','C','Apt.10 Fairfield Ave.','Bridgeport','CT','06610','2019','207-187-1500'),
		(701,'Jyothi','Kondhameedhi','S18757','A','Apt.202 Park Ave.','Bridgeport','CT','06604','2017','207-187-1584'),
		(701,'Meghana','Chiluka','S18758','D','Apt.101 Park Ave.','Bridgeport','CT','06604','2018','207-187-1574'),
		(704,'Anitha','Reddy','S18759','B','Apt.101 Park Ave.','Bridgeport','CT','06604','2019','207-187-1580'),
		(701,'Suraj','Akula','S18760','A','Apt.10 Fairfield Ave.','Bridgeport','CT','06610','2017','207-187-1500'),
		(704,'Siddu','Marre','S18761','A','Apt.101 Park Ave.','Bridgeport','CT','06604','2017','207-187-1516'),
		(705,'Priyanka','Vangari','S18762','C','Apt.1610 Fairfield Ave.','Bridgeport','CT','06610','2016','207-187-1570'),
		(706,'Bhavana','Vootla','S18763','C','Apt.1770 Park Ave.','Bridgeport','CT','06604','2016','207-187-1594'),
		(701,'Prathu','Vootla','S18764','C','Apt.1770 Park Ave.','Bridgeport','CT','06604','2017','207-187-1581'),
		(706,'Rahul','Kumar','S18765','A','Apt.1770 Park Ave.','Bridgeport','CT','06604','2017','207-187-1572'),
		(706,'Vamshi','Yadav','S18766','B','Apt.1770 Park Ave.','Bridgeport','CT','06604','2019','207-187-1319'),
		(702,'Sohail','Shareef','S18767','B','Apt.70 Park Ave.','Bridgeport','CT','06604','2019','207-187-1135'),
		(704,'Kamala','Akula','S18768','D','Apt.70 Park Ave.','Bridgeport','CT','06604','2017','207-187-1188'),
		(703,'Sakina','Samira','S18769','C','Apt.76 Park Ave.','Bridgeport','CT','06604','2018','207-187-1100'),
		(703,'Gomez','Sare','S18770','D','Apt.76 Park Ave.','Bridgeport','CT','06604','2019','207-187-1244'),
		(703,'Cruz','Sarah','S18771','C','Apt.88 Park Ave.','Bridgeport','CT','06604','2018','207-187-1208'),
		(704,'Mike','Tim','S18772','C','Apt.88 Wine Ave.','Bridgeport','CT','06609','2018','207-187-1888'),
		(703,'Laharika','Reddy','S18773','B','Apt.88 Wine Ave.','Bridgeport','CT','06609','2017','207-187-1809'),
		(701,'Sadiya','Jabeen','S18774','A','Apt.88 Wine Ave.','Bridgeport','CT','06609','2017','207-187-1907'),
		(702,'Venkatesh','Chiluka','S18775','A','Apt.145 Broad Street','Edison','NJ','06890','2019','207-187-2051'),
		(705,'Bharath','Chiluka','S18776','B','Apt.145 Broad Street','Edison','NJ','06890','2020','207-187-2574'),
		(702,'Pavitra','Reddy','S18777','D','Apt.101 Park Ave.','Bridgeport','CT','06604','2020','207-187-1009'),
		(705,'Bhanu','Chandupatla','S18778','C','Apt.145 Broad Street','Edison','NJ','06890','2020','207-187-1001'),
		(706,'Mani','Reddy','S18779','D','Apt.145 Broad Street','Edison','NJ','06890','2019','207-187-1044'),
		(706,'Swetha','Chandupatla','S18780','C','Apt.145 Broad Street','Edison','NJ','06890','2020','207-187-1494')

SELECT * FROM Students;

CREATE TABLE Sections
(
	CourseID varchar(50),
	No_Days int,
	Starttime time,
	Endtime time,
	Capacity int,
	CONSTRAINT FK_Sections_CourseID FOREIGN KEY (CourseID)     
    REFERENCES DepartmentInformation (CourseID)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE    
)

INSERT INTO Sections([CourseID],[No_Days],[Starttime],[Endtime],[Capacity])
VALUES ('CPSC551',50,'09:30','11:00',50),
		('CPSC501',75,'09:30','12:00',30),
		('CPEG572',40,'10:30','12:00',40),
		('CPSC502',90,'15:30','17:00',23),
		('CPSC503',47,'14:30','17:00',59),
		('CPSC545',55,'15:00','16:00',15),
		('CPSC552',80,'09:30','11:00',20),
		('CPEG460',54,'17:30','19:00',24),
		('CPEG561',89,'09:30','11:00',59),
		('CPEG510',40,'18:30','21:00',70),
		('CPSC511',42,'19:00','21:00',60),
		('CPEG471',84,'09:30','11:00',54),
		('CPEG448',90,'09:30','12:00',50),
		('ELEG443',23,'10:30','12:00',53),
		('CPSC546',30,'15:30','17:00',20),
		('CPEG286',75,'14:30','17:00',25),
		('CPEG349',45,'15:30','16:00',35),
		('CPEG540',56,'09:30','11:00',45),
		('ELEG447',34,'17:30','19:00',56),
		('ELEG415',39,'12:30','14:00',27),
		('ELEG416',58,'12:00','15:00',33),
		('ELEG449',70,'11:30','14:00',30),
		('ELEG444',90,'08:30','10:00',30),
		('ELEG333',65,'09:30','11:00',15),
		('ELEG458',80,'10:00','13:00',10),
		('ELEG404',95,'15:30','19:00',15),
		('ELEG417',70,'14:00','17:00',20),
		('MEEG410',79,'14:00','17:30',9),
		('MEEG463',92,'17:00','19:30',10),
		('MEEG452',84,'19:00','20:30',50),
		('MEEG454',74,'20:00','21:30',20),
		('MEEG453',67,'19:00','19:30',7),
		('MEEG421',50,'09:30','11:30',40),
		('MEEG423',84,'08:00','11:30',24),
		('MEEG462',69,'08:00','9:30',39),
		('TCMG505',90,'11:30','13:30',40),
		('TCMG530',56,'11:00','14:30',33),
		('TCMG410',49,'12:00','15:30',32),
		('TCMG549',76,'16:30','19:00',35),
		('TCMG524',70,'09:30','11:30',12),
		('TCMG495',79,'17:00','19:00',58),
		('TCMG572',95,'18:30','21:00',48),
		('TCMG574',99,'21:30','22:30',40), 
		('BMEG410',33,'12:00','15:00',45),
		('BMEG412',44,'10:30','13:00',22),
		('BMEG543',87,'14:30','15:30',23),
		('BMEG573',74,'08:00','11:30',5),
		('BMEG580',91,'08:00','12:30',66),
		('BMEG537',60,'13:00','17:30',5),
		('BMEG515',50,'18:30','19:30',5)

SELECT * FROM Sections;

CREATE TABLE Grades(
	StudentID varchar(50),
	CourseID varchar(50),
	Academic_Year int,
	Semester varchar(50),
	Grade varchar(50)
	CONSTRAINT FK_Grades_StudentID FOREIGN KEY (StudentID)     
    REFERENCES Students (StudentID),     
 	CONSTRAINT FK_Grades_CourseID FOREIGN KEY (CourseID)  
    REFERENCES DepartmentInformation (CourseID)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE
)

INSERT INTO Grades([StudentID],[CourseID],[Academic_Year],[Semester],[Grade])
VALUES  ('S18740','CPEG572',2016,'FALL','B+'),
		('S18741','CPSC545',2015,'FALL','C+'),
		('S18742','CPEG540',2014,'SPRING','B+'),
		('S18743','MEEG453',2016,'FALL','A-'),
		('S18744','TCMG495',2014,'SPRING','B'),
		('S18745','CPEG572',2013,'FALL','B-'),
		('S18746','TCMG495',2012,'SUMMER','B+'),
		('S18747','CPEG540',2012,'SUMMER','B+'),
		('S18748','MEEG453',2014,'SPRING','A-'),
		('S18749','ELEG447',2011,'FALL','C+'),
		('S18750','CPSC545',2014,'SPRING','B+'),
		('S18751','BMEG515',2016,'SUMMER','B+'),
		('S18752','ELEG404',2015,'SUMMER','B'),
		('S18753','BMEG515',2015,'FALL','B-'),
		('S18754','CPEG572',2011,'FALL','B+'),
		('S18755','ELEG447',2010,'SPRING','B+'),
		('S18756','MEEG410',2009,'SPRING','B'),
		('S18757','CPSC552',2014,'FALL','B'),
		('S18758','MEEG453',2016,'FALL','A-'),
		('S18759','CPEG540',2015,'SUMMER','C+'),
		('S18760','CPSC545',2015,'SPRING','B+'),
		('S18761','CPSC552',2014,'FALL','B+'),
		('S18762','ELEG447',2016,'SPRING','B-'),
		('S18763','BMEG515',2015,'SUMMER','B'),
		('S18764','ELEG333',2011,'FALL','B'),
		('S18765','ELEG333',2015,'FALL','C+'),
		('S18766','MEEG453',2016,'FALL','B+'),
		('S18767','ELEG404',2015,'FALL','A'),
		('S18768','CPSC545',2015,'SUMMER','B+'),
		('S18769','BMEG543',2014,'SPRING','B'),
		('S18770','CPSC552',2016,'SPRING','A-'),
		('S18771','TCMG410',2012,'SPRING','B'),
		('S18772','MEEG410',2011,'FALL','C+'),
		('S18773','ELEG404',2009,'FALL','B+'),
		('S18774','BMEG515',2010,'FALL','A'),
		('S18775','TCMG410',2009,'SUMMER','A'),
		('S18776','TCMG530',2015,'SPRING','B'),
		('S18777','ELEG333',2016,'SPRING','A-'),
		('S18778','BMEG543',2013,'SUMMER','C+'),
		('S18779','ELEG404',2012,'FALL','B+'),
		('S18780','TCMG410',2010,'FALL','B+')

SELECT * FROM Grades;

CREATE TABLE Student_Transactions(
	Transaction_ID varchar(50),
	StudentID varchar(50),
	PostDate Date,
	Amount float,
	Transaction_Description varchar(50)
	CONSTRAINT FK_Student_Transactions_StudentID FOREIGN KEY (StudentID)  
    REFERENCES Students (StudentID)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE
)

INSERT INTO Student_Transactions ([Transaction_ID],[StudentID],[PostDate],[Amount],[Transaction_Description])
VALUES  ('T0001','S18740','2016-11-05',3.06,'Coffee'),
		('T0002','S18741','2015-09-26',0.10,'Printout'),
		('T0003','S18742','2015-01-13',9.55,'Meal'),
		('T0004','S18743','2014-10-25',9.55,'Meal'),
		('T0005','S18744','2014-02-18',3.06,'Coffee'),
		('T0006','S18745','2014-11-20',10.00,'Parking'),
		('T0007','S18746','2015-04-11',9.55,'Meal'),
		('T0008','S18747','2014-10-09',3.10,'Printout'),
		('T0009','S18748','2013-05-06',10.00,'Parking'),
		('T0010','S18749','2012-09-09',10.00,'Parking'),
		('T0011','S18750','2014-11-03',10.00,'Parking'),
		('T0012','S18751','2015-03-17',3.06,'Coffee'),
		('T0013','S18752','2016-01-19',3.06,'Coffee'),
		('T0014','S18753','2013-04-29',0.10,'Printout'),
		('T0015','S18754','2012-12-28',9.55,'Meal'),
		('T0016','S18755','2011-04-30',3.06,'Coffee'),
		('T0017','S18756','2010-12-10',10.00,'Parking'),
		('T0018','S18757','2015-06-30',9.55,'Meal'),
		('T0019','S18758','2016-08-23',10.00,'Parking'),
		('T0020','S18759','2013-11-26',0.10,'Printout'),
		('T0021','S18760','2013-12-14',3.06,'Coffee'),
		('T0022','S18761','2015-05-13',0.10,'Printout'),
		('T0023','S18762','2014-07-19',10.00,'Parking'),
		('T0024','S18763','2012-11-04',9.55,'Meal'),
		('T0025','S18764','2014-08-08',9.55,'Meal'),
		('T0026','S18765','2015-12-31',3.06,'Coffee'),
		('T0027','S18766','2015-07-18',3.06,'Coffee'),
		('T0028','S18767','2016-02-27',1.75,'Cookiee'),
		('T0029','S18768','2016-03-29',0.10,'Printout'),
		('T0030','S18769','2016-11-13',0.10,'Printout'),
		('T0031','S18770','2012-09-15',10.00,'Parking'),
		('T0032','S18771','2014-10-25',3.06,'Coffee'),
		('T0033','S18772','2011-05-23',9.55,'Meal'),
		('T0034','S18773','2015-06-28',1.75,'Cookiee'),
		('T0035','S18774','2016-09-19',0.10,'Printout'),
		('T0036','S18775','2014-12-20',0.10,'Printout'),
		('T0037','S18776','2015-07-21',1.75,'Cookiee'),
		('T0038','S18777','2013-10-19',10.00,'Parking'),
		('T0039','S18778','2013-02-05',0.10,'Printout'),
		('T0040','S18779','2014-10-05',3.06,'Coffee'),
		('T0041','S18780','2015-10-01',3.06,'Coffee')

SELECT * FROM Student_Transactions;

CREATE TABLE Employees(
	Emp_ID varchar(50),
	Emp_name varchar(50),
	Salary varchar(50),
	DepartmentID int,
	Years_of_Exp int,
	CONSTRAINT FK_Employees_DepartmentID FOREIGN KEY (DepartmentID)     
    REFERENCES Departments (DepartmentID)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE   

)

INSERT INTO Employees([Emp_ID],[Emp_name],[Salary],[DepartmentID],[Years_of_Exp])
VALUES  ('UBE001','R.Baseda',70000,701,5),
		('UBE002','S.Hamada',65000,701,2),
		('UBE003','J.Lee',100000,701,7),
		('UBE004','Ditcher',70000,701,3),
		('UBE005','A.Mahmood',85000,701,6),
		('UBE006','S.Patel',70000,701,3),
		('UBE007','K.Ellithy',90000,701,7),
		('UBE008','Abuzneid',85000,702,4),
		('UBE009','Omar Abuzaghleh',85000,702,5),
		('UBE010','M.Faezipour',70000,702,3),
		('UBE011','X.Xiong',65000,702,4),
		('UBE012','M. Ben Haj Frej',70000,703,3),
		('UBE013','L.Murcik',65000,703,5),
		('UBE014','H.Bajwa',85000,703,4),
		('UBE015','N.Gupta',70000,703,5),
		('UBE016','R. Budzilek',85000,703,5),
		('UBE017','J. Pallis',70000,704,4),
		('UBE018','J.HU',65000,704,6),
		('UBE019','L.Jagtiani',60000,705,7),
		('UBE020','L.Frame',65000,705,4),
		('UBE021','M.Lohle',70000,705,6),
		('UBE022','N.Kongar',70000,705,7),
		('UBE023','S.Rashba',85000,705,2),
		('UBE024','Z.Li',70000,705,4),
		('UBE025','I.Macwan',65000,705,6),
		('UBE026','M.Joshi',65000,706,3),
		('UBE027','A.Petryk',70000,706,4),
		('UBE028','D.Coman',70000,706,1)

SELECT * FROM Employees;