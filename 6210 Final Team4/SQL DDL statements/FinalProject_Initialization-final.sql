Create database FinalProject_team4
go
use FinalProject_team4;

/*Step1 Instantiate Entities*/
-- Create Table Roles
Go
Create table Roles
(
RoleID int not null PRIMARY KEY,
RoleName varchar(255) not null
);

-- Create Table ProviderRole
Go
Create table ProviderRole(
ProveiderRoleID int  NOT NULL,
RoleID int NOT NULL
REFERENCES Roles(RoleID),
CONSTRAINT PR PRIMARY KEY CLUSTERED
(ProveiderRoleID,RoleID),
Modifited_Date datetime DEFAULT Current_Timestamp
);

-- Create Table ProviderAddress
Go
Create table ProviderAddress (
ProviderAddressID INT NOT NULL PRIMARY KEY,
AddressLine1 varchar(255),
AddressLine2 varchar(255),
City varchar(255),
State varchar(255),
ZipCode varchar(255),
WorkPhone varchar(255)
);

-- Create Table Provider
Go
Create table Provider
(
ProviderID int PRIMARY KEY not null,
 LastName varchar(255)not null,
 FirstName varchar(255) not null, 
 MiddleName varchar(255),
 Title varchar(255)not null,
 Phone varchar(255) not null,
 Email varchar(255) not null,
 Type varchar(255) not null
);




--Create Table PatientRecord
Go
Create Table PatientRecord 
(
PatientRecordID INT NOT NULL PRIMARY KEY,
PatientLabResult varchar(255),
PatientAllergicHistory varchar(255),
PatientMedicalRecord varchar(255)
);

--Create Table  InsuranceCompanyBillingProcess
Go 
CREATE TABLE  InsuranceCompanyBillingProcess  (
   Insurance_Company_Billing_Status  varchar(50)  NOT NULL,
   Insurance_Company_Billing_Type  varchar(50)  NOT NULL,
   Insurance_Company_Billing_Amount  varchar(50)  NOT NULL,
   Insurance_Company_Billing_Date  date NOT NULL,
   CompanyBillingID  int  NOT NULL PRIMARY KEY,
) 

-- Create Table InsuranceCompany 
Go
CREATE TABLE  InsuranceCompany  (
   CompanyID  int  NOT NULL PRIMARY KEY,
   Address_Line1  varchar(50)  NOT NULL,
   Address_Line2  varchar(50)  NOT NULL,
   City  varchar(20)  NOT NULL,
   State  char(2)  NOT NULL,
   ZipCode  char(5)  NOT NULL,
   WorkPhone  varchar(15)  NOT NULL,
   CompanyName  varchar(50)  NOT NULL
) 


-- Create Table  InsuranceCompanyPaymentHistory
Go 
CREATE TABLE  InsuranceCompanyPaymentHistory  (
   CompanyPaymentID  int  NOT NULL PRIMARY KEY,
   Insurance_Company_Payment_Type  varchar(50)  NOT NULL,
   Insurance_Company_Payment_Date  date NOT NULL,
   Insurance_Company_Payment_Amount  varchar(50)  NOT NULL
) 


-- Create Table InsurancePlan 
Go
CREATE TABLE  InsurancePlan  (
   PlanID  int  NOT NULL PRIMARY KEY,
   Plan_Type  varchar(25)  NOT NULL,
   Ambulance_Service  varchar(30)  NOT NULL,
   Cardiac_Rehabilitation  varchar(30)  NOT NULL,
   Dialysis_Servives  varchar(30)  NOT NULL,
   Early_Intervention_Services  varchar(30)  NOT NULL,
   Durable_Medical_Equipment  varchar(30)  NOT NULL,
   Emergency_Medical_Outpatient_Services  varchar(30)  NOT NULL,
   Inpatient_Care_In_A_Chronic_Disease_Hospital  varchar(30)  NOT NULL,
   Inpatient_Care_In_A_Rehabilitation_Hospital  varchar(30)  NOT NULL,
   Labs_XRays_And_Other_Tests  varchar(30)  NOT NULL,
   Prescription_Drugs  varchar(30)  NOT NULL,
   Radiation_Therapy_And_Chemotherapy  varchar(30)  NOT NULL, 
) 


-- Create Table Patient
Go
CREATE TABLE  Patient  (
   PatientID  int  NOT NULL PRIMARY KEY,
   FirstName  varchar(50)  NOT NULL,
   MiddleName  varchar(50)  NOT NULL,
   LastName  varchar(50)  NOT NULL,
   Birthdate  date NOT NULL,
   Gender  varchar(10)  NOT NULL,
   Phone  varchar(15)  NOT NULL,
   Email  varchar(50)  NOT NULL,
   Modified_Date  date NOT NULL,  
) 

-- Create Table  PatientAddress 
Go
CREATE TABLE  PatientAddress  (
   PatientAddressID  int  NOT NULL PRIMARY KEY,
   Address_Line1  varchar(50)  NOT NULL,
   Address_Line2  varchar(50)  NOT NULL,
   City  varchar(20)  NOT NULL,
   State  char(2)  NOT NULL,
   ZipCode  char(5)  NOT NULL
) 

-- Create Table PatientBillingProcess
Go
CREATE TABLE  PatientBillingProcess  (
   Patient_Billing_Status  varchar(50)  NOT NULL,
   Patient_Billing_Type  varchar(50)  NOT NULL,
   Patient_Billing_Amount  varchar(50)  NOT NULL,
   Patient_Billing_Date  date NOT NULL,
   PatientBillingID  int NOT NULL PRIMARY KEY, 
) 


-- Create Table PatientPaymentHistory
Go
CREATE TABLE  PatientPaymentHistory  (
   PaymentID  int  NOT NULL PRIMARY KEY,
   Patient_Payment_Date  date NOT NULL,
   Patient_Payment_Amount  varchar(50)  NOT NULL,
   Patient_Payment_Type  varchar(50)  NOT NULL
) 

-- Create Table Prescription 
Go
CREATE TABLE  Prescription  (
   PrescriptionID  int  NOT NULL PRIMARY KEY,
   PrescriptionFee  varchar(50)  NOT NULL,
   PrescriptionType  varchar(50)  NOT NULL,
   PrescriptionDate  date NOT NULL, 
) 

-------------------------------------------------------------------------------------------------
/*Step 2 Add Foreign Key Constraint*/

-- FK in table Provider
Go
alter table Provider add ProviderAddressID int
Go
ALTER TABLE Provider ADD CONSTRAINT R1 FOREIGN KEY (ProviderAddressID)
References ProviderAddress (ProviderAddressID);

--FK in table PateintRecord
Go
alter table PatientRecord add PatientID int
Go
ALTER TABLE PatientRecord ADD CONSTRAINT R2 FOREIGN KEY (PatientID)
References Patient (PatientID);

--FK in table InsuranceCompanyBillingProcess
Go
alter table InsuranceCompanyBillingProcess add PlanID int
Go
ALTER TABLE InsuranceCompanyBillingProcess ADD CONSTRAINT PlanID_InsurancePlan 
FOREIGN KEY (PlanID) REFERENCES InsurancePlan(PlanID)
Go
alter table InsuranceCompanyBillingProcess add PatientID int
Go
ALTER TABLE InsuranceCompanyBillingProcess ADD CONSTRAINT PatientID_Patient 
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
Go
alter table InsuranceCompanyBillingProcess add CompanyPaymentID int
Go
ALTER TABLE InsuranceCompanyBillingProcess ADD CONSTRAINT CompanyPaymentID_InsuranceCompanyPaymentHistory 
FOREIGN KEY (CompanyPaymentID) REFERENCES InsuranceCompanyPaymentHistory(CompanyPaymentID)

-- FK in table InsurancePlan
Go
alter table InsurancePlan add CompanyID int
Go
ALTER TABLE InsurancePlan ADD CONSTRAINT CompanyID_InsuranceCompany 
FOREIGN KEY (CompanyID) REFERENCES InsuranceCompany(CompanyID)

-- FK in table Patient
Go
alter table Patient add PatientAddressID int
Go
ALTER TABLE Patient ADD CONSTRAINT PatientAddressID_PatientAddress
FOREIGN KEY (PatientAddressID) REFERENCES PatientAddress(PatientAddressID)

-- FK in table PatientBillingProcess
Go
alter table PatientBillingProcess add PatientID int
Go
ALTER TABLE PatientBillingProcess ADD CONSTRAINT PatientID_Patient_PatientBilling 
FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
Go
alter table PatientBillingProcess add PaymentID int
Go
ALTER TABLE PatientBillingProcess ADD CONSTRAINT PaymentID_PatientPaymentHistory 
FOREIGN KEY (PaymentID) REFERENCES PatientPaymentHistory(PaymentID)

-- FK in table Prescription
Go
alter table Prescription add ProviderID int
Go
ALTER TABLE Prescription ADD CONSTRAINT PatientID_Provider
FOREIGN KEY (ProviderID) REFERENCES Provider(ProviderID)
Go
alter table Prescription add PatientRecordID int
Go
ALTER TABLE Prescription ADD CONSTRAINT PatientRecordID_PatientRecord
FOREIGN KEY (PatientRecordID) REFERENCES PatientRecord(PatientRecordID)


-- --------------------------------------------------------
-- Insert Roles
Go
INSERT Roles
VALUES (1,'Provider');
INSERT Roles
VALUES (2,'Provider');
INSERT Roles
VALUES (3,'Provider');
INSERT Roles
VALUES (4,'Provider');
INSERT Roles
VALUES (5,'Provider');
INSERT Roles
VALUES (6,'Provider');
INSERT Roles
VALUES (7,'Provider');
INSERT Roles
VALUES (8,'Provider');
INSERT Roles
VALUES (9,'Provider');
INSERT Roles
VALUES (10,'Provider');

-- Insert ProviderRole
go
INSERT ProviderRole
VALUES (1,1, '2018-04-04');
INSERT ProviderRole
VALUES (2,2, '2018-04-04');
INSERT ProviderRole
VALUES (3,3, '2018-04-04');
INSERT ProviderRole
VALUES (4,4, '2018-04-04');
INSERT ProviderRole
VALUES (5,5, '2018-04-04');
INSERT ProviderRole
VALUES (6,6, '2018-04-04');
INSERT ProviderRole
VALUES (7,7, '2018-04-04');
INSERT ProviderRole
VALUES (8,8, '2018-04-04');
INSERT ProviderRole
VALUES (9,9, '2018-04-04');
INSERT ProviderRole
VALUES (10,10, '2018-04-04');

-- Insert ProviderAddress
go
INSERT ProviderAddress
VALUES (1, '2212 Penifield Rd', 'Ste 100', 'Penfield', 'NY', 14526, 5855988505);
INSERT ProviderAddress
VALUES (2, '1000 South Ave', 'Box 58', 'Rochester', 'NY', 14620, 5853416867);
INSERT ProviderAddress
VALUES (3, '601 Elmwood Ave', 'N/A', 'Rochester', 'NY', 14642, 585473200);
INSERT ProviderAddress
VALUES (4, '601 Elmwood Ave', 'Box 655', 'Rochester', 'NY', 14642, 5852763000);
INSERT ProviderAddress
VALUES (5, '2212 Penifield Rd', 'Ste 200', 'Penfield', 'NY', 14526, 5855988558);
INSERT ProviderAddress
VALUES (6, '160 Sawgrass Dr', 'N/A', 'Rochester', 'NY', 14620, 585276300);
INSERT ProviderAddress
VALUES (7, '10 South Ponite Landing', 'Ste 130', 'Rochester', 'NY', 14606, 5852772550);
INSERT ProviderAddress
VALUES (8, '945 East Henrietta Rd', 'N/A', 'Rochester', 'NY', 14623, 5852926440);
INSERT ProviderAddress
VALUES (9, '2275 South Clinton Ave', 'N/A', 'Rochester', 'NY', 14618, 5857307024);
INSERT ProviderAddress
VALUES (10, '601 Elmwood Ave', 'Box 655', 'Rochester', 'NY', 14642, 5852763000);

--Insert Provider
INSERT Provider
VALUES (1,'Abell','Kim','B','MD', 5855988505, 'kimab@gmail.com', 'Primary',(SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='1'));
INSERT Provider
VALUES (2,'Ahmed','Bilal','N/A','MBBS', 5853416867, 'bilalah@gmail.com', 'Primary', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='2'));
INSERT Provider
VALUES (3,'Allen','Egan','F','MD', 5853416776, 'eganal@gmail.com', 'Primary', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='3'));
INSERT Provider
VALUES (4,'Aloisio','Nicholas','L','MD', 5852763000, 'nicholasal@gmail.com', 'Primary', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='4'));
INSERT Provider
VALUES (5,'Bansal','Anuj','N/A','MBBS', 5855988558, 'anujba@gmail.com', 'Primary', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='5'));
INSERT Provider
VALUES (6,'Bell','Derek','E','MD', 585276300, 'derekbe@gmail.com', 'Primary', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='6'));
INSERT Provider
VALUES (7,'Beckham','Carla','N/A','PhD', 5852752876, 'carlabe@gmail.com', 'Surgery', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='7'));
INSERT Provider
VALUES (8,'Booth','Laura','L','MD', 5852926440, 'laurabo@gmail.com', 'Pediatrics', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='8'));
INSERT Provider
VALUES (9,'Burke','Laureen','A','MD', 5857307024, 'laureenbu@gmail.com', 'Obsterics', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='9'));
INSERT Provider
VALUES (10,'Chan','Raymond','K','MD', 5853416880, 'raymondch@gmail.com', 'Emergency Medicine', (SELECT ProviderAddressID from ProviderAddress WHERE ProviderAddressID='10'));
--


-- --------------------------------------------------------

--
-- INSERT PatientAddress
--
go
INSERT PatientAddress
VALUES (1,'71 Saint Alphonsus','apt 1111','RoxBury','MA','02120');
INSERT PatientAddress
VALUES (2,'71 Saint Alphonsus','apt 1112','RoxBury','MA','02120');
INSERT PatientAddress
VALUES (3,'409 Huntington','apt 023','Boston','MA','02115');
INSERT PatientAddress
VALUES (4,'3 Hawthorne','apt 1111','Medford','MA','02158');
INSERT PatientAddress
VALUES (5,'160 Pleasant st','apt 1112','Malden','MA','02148');
INSERT PatientAddress
VALUES (6,'238 Hemenway st','apt 112','Boston','MA','02115');
INSERT PatientAddress
VALUES (7,'78 Saint Alphonsus','apt 023','Boston','MA','02120');
INSERT PatientAddress
VALUES (8,'429 Huntington','apt 112','RoxBury','MA','02115');
INSERT PatientAddress
VALUES (9,'32 Hawthorne','apt 023','Boston','MA','02158');
INSERT PatientAddress
VALUES (10,'122 Pleasant st','apt 1112','Medford','MA','02148');
-- --------------------------------------------------------

--
-- INSERT Patient
--
go
INSERT Patient
VALUES (1,'John','Keay','Rice','2/2/1964','F','1(666)6666666','John.r@gmail.com','11/2/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='1'));
INSERT Patient
VALUES (2,'Jack','Finny','Lin','11/30/1992','M','1(777)7777777','Jack.y@sina.mail.com','11/2/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='2'));
INSERT Patient
VALUES (3,'Keay','Wayne','Finny','5/5/1993','F','1(111)1111111','Keany@husky.neu.edu','11/2/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='3'));
INSERT Patient
VALUES (4,'Wayne','Fine','Fine','1/1/1974','M','1(222)2222222','Wayne@gmail.com','11/2/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='4'));
INSERT Patient
VALUES (5,'Tiffany','Ming','Gage','6/6/1982','F','1(333)3333333','Tiffany@gmail.com','11/30/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='5'));
INSERT Patient
VALUES (6,'Pola','Gage','Ming','2/11/2000','F','1(333)3333334','Pola@gmail.com','12/1/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='6'));
INSERT Patient
VALUES (7,'Scholt','Pola','Tian','12/12/1999','M','1(333)3333335','Schot@gmail.com','12/1/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='7'));
INSERT Patient
VALUES (8,'Twiit','Tiffany','Yao','11/12/1988','F','1(333)3333336','Twiit@gmail.com','12/1/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='8'));
INSERT Patient
VALUES (9,'Hawwi','Scholt','Hao','11/13/1988','M','1(333)3333337','Mayy@gmail.com','12/1/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='9'));
INSERT Patient
VALUES (10,'Mayy','Tian','Hao','11/13/1988','F','1(333)3333338','Pola2@gmail.com','12/1/2017',(SELECT PatientAddressID from PatientAddress WHERE PatientAddressID='10'));

--Insert PatientRecord
INSERT PatientRecord
VALUES (1, 'Screening tests for the hepatitis B, hepatitis C, and HIV viruses are NEGATIVE', 'N/A', 'Abelcet',(SELECT PatientID from Patient WHERE PatientID='1'));
INSERT PatientRecord
VALUES (2, 'Screening tests for the hepatitis B, hepatitis C, and HIV viruses are NEGATIVE', 'N/A', 'Cafcit (Caffeine Citrate)',(SELECT PatientID from Patient WHERE PatientID='2'));
INSERT PatientRecord
VALUES (3, 'N/A', 'N/A', 'Calan (Verapamil HCl) ',(SELECT PatientID from Patient WHERE PatientID='3'));
INSERT PatientRecord
VALUES (4, 'Screening tests for the hepatitis B, hepatitis C, and HIV viruses are NEGATIVE', 'Tartrazine', 'Yellow Fever Vaccine (Yf-Vax)',(SELECT PatientID from Patient WHERE PatientID='4'));
INSERT PatientRecord
VALUES (5, 'N/A', 'N/A', 'Zantac (Ranitidine Hcl)',(SELECT PatientID from Patient WHERE PatientID='5'));
INSERT PatientRecord
VALUES (6, 'N/A', 'N/A', 'N/A',(SELECT PatientID from Patient WHERE PatientID='6'));
INSERT PatientRecord
VALUES (7, 'Screening tests for the hepatitis B, hepatitis C, and HIV viruses are NEGATIVE', 'Tetracycline, Cephalosporins', 'E.E.S. (Erythromycin Ethylsuccinate)',(SELECT PatientID from Patient WHERE PatientID='7'));
INSERT PatientRecord
VALUES (8, 'N/A', 'Sulfonamides', 'Eletriptan hydrobromide (Relpax)',(SELECT PatientID from Patient WHERE PatientID='8'));
INSERT PatientRecord
VALUES (9, 'Screening tests for the hepatitis B, hepatitis C, and HIV viruses are NEGATIVE', 'N/A', 'N/A',(SELECT PatientID from Patient WHERE PatientID='9'));
INSERT PatientRecord
VALUES (10, 'Screening tests for the hepatitis B, hepatitis C, and HIV viruses are NEGATIVE', 'Penicillin, Cephalosporins', 'Olopatadine (Patanol)',(SELECT PatientID from Patient WHERE PatientID='10'));

--
-- INSERT InsuranceCompany
--
INSERT InsuranceCompany
VALUES (1,'77 Park St','No 1','Roxbury','MA','02115','1(666)6616666','Fenway Health');
INSERT InsuranceCompany
VALUES (2,'16 High Street','No 123','Boston','MA','02115','1(777)7777477','Acelleron Health');
INSERT InsuranceCompany
VALUES (3,'800 District Ave','No 222','Burlington','MA','08103','1(111)1161111','Black Duck Health');
INSERT InsuranceCompany
VALUES (4,'6th Rd','No 27','Woburn','MA','01801','1(222)2662222','Raytheon Health');
INSERT InsuranceCompany
VALUES (5,'251 Ballardvale St','No 273','Wilmington','MA','02021','1(333)3363333','Cardinal Health');
INSERT InsuranceCompany
VALUES (6,'120 Royall St','No 900','Canton','MA','02134','1(333)3336334','Charles Health');
INSERT InsuranceCompany
VALUES (7,'1212 Commonwealth Avenue','No 3','Allston','MA','02903','1(333)3336335','MarketSight Health');
INSERT InsuranceCompany
VALUES (8,'10 Dorrance St','No 2711','Braintree','MA','01824','1(333)3333636','Federal Health');
INSERT InsuranceCompany
VALUES (9,'150 Apollo Dr','No 257','Chelmsford','MA','04101','1(333)3336337','Harris Health');
INSERT InsuranceCompany
VALUES (10,'400 Congress St','No 27','Waltham','MA','02122','1(333)3336338','Kepware Health');
-- --------------------------------------------------------

--
-- INSERT InsuranceCompanyPaymentHistory
--
INSERT InsuranceCompanyPaymentHistory
VALUES (1,'end','11/2/2017','32324');
INSERT InsuranceCompanyPaymentHistory
VALUES (2,'end','11/2/2017','3321');
INSERT InsuranceCompanyPaymentHistory
VALUES (3,'end','11/2/2017','34335');
INSERT InsuranceCompanyPaymentHistory
VALUES (4,'end','11/2/2017','6655');
INSERT InsuranceCompanyPaymentHistory
VALUES (5,'process','11/30/2017','44443');
INSERT InsuranceCompanyPaymentHistory
VALUES (6,'end','12/1/2017','65654');
INSERT InsuranceCompanyPaymentHistory
VALUES (7,'end','12/1/2017','3334');
INSERT InsuranceCompanyPaymentHistory
VALUES (8,'process','12/1/2017','26275');
INSERT InsuranceCompanyPaymentHistory
VALUES (9,'process','12/1/2017','23425');
INSERT InsuranceCompanyPaymentHistory
VALUES (10,'end','12/1/2017','23124');
-- --------------------------------------------------------
--
-- INSERT InsurancePlan
--
go
INSERT InsurancePlan
VALUES (1,'Gold1','90%','90%','90%','90%','90%','90%','90%','90%','90%','90%','90%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='1'));
INSERT InsurancePlan
VALUES (2,'Gold2','80%','80%','80%','80%','80%','80%','80%','80%','80%','80%','80%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='2'));
INSERT InsurancePlan
VALUES (3,'Gold3','70%','70%','70%','70%','70%','70%','70%','70%','70%','70%','70%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='3'));
INSERT InsurancePlan
VALUES (4,'Silver1','60%','60%','60%','60%','60%','60%','60%','60%','60%','60%','60%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='4'));
INSERT InsurancePlan
VALUES (5,'Silver2','50%','50%','50%','50%','50%','50%','50%','50%','50%','50%','50%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='5'));
INSERT InsurancePlan
VALUES (6,'Silver3','40%','40%','40%','40%','40%','40%','40%','40%','40%','40%','40%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='6'));
INSERT InsurancePlan
VALUES (7,'Bronze1','30%','30%','30%','30%','30%','30%','30%','30%','30%','30%','30%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='7'));
INSERT InsurancePlan
VALUES (8,'Bronze2','20%','20%','20%','20%','20%','20%','20%','20%','20%','20%','20%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='8'));
INSERT InsurancePlan
VALUES (9,'Bronze3','10%','10%','10%','10%','10%','10%','10%','10%','10%','10%','10%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='9'));
INSERT InsurancePlan
VALUES (10,'normal','5%','5%','5%','5%','5%','5%','5%','5%','5%','5%','5%',(SELECT CompanyID from InsuranceCompany WHERE CompanyID='10'));

------------------------------------------------
--
-- INSERT InsuranceCompanyBillingProcess
--
go
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','32324','11/2/2017',1,(SELECT PlanID from InsurancePlan WHERE PlanID='1'),(SELECT PatientID from Patient WHERE PatientID='1'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='1'));
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','3321','11/2/2017',2,(SELECT PlanID from InsurancePlan WHERE PlanID='2'),(SELECT PatientID from Patient WHERE PatientID='2'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='2'));
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','34335','11/2/2017',3,(SELECT PlanID from InsurancePlan WHERE PlanID='3'),(SELECT PatientID from Patient WHERE PatientID='3'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='3'));		
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','6655','11/2/2017',4,(SELECT PlanID from InsurancePlan WHERE PlanID='4'),(SELECT PatientID from Patient WHERE PatientID='4'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='4'));					
INSERT InsuranceCompanyBillingProcess
VALUES ('unpaid','process','44443','11/30/2017',5,(SELECT PlanID from InsurancePlan WHERE PlanID='5'),(SELECT PatientID from Patient WHERE PatientID='5'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='5'));
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','65654','12/1/2017',6,(SELECT PlanID from InsurancePlan WHERE PlanID='6'),(SELECT PatientID from Patient WHERE PatientID='6'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='6'));
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','3334','12/1/2017',7,(SELECT PlanID from InsurancePlan WHERE PlanID='7'),(SELECT PatientID from Patient WHERE PatientID='7'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='7'));
INSERT InsuranceCompanyBillingProcess
VALUES ('unpaid','process','26275','12/1/2017',8,(SELECT PlanID from InsurancePlan WHERE PlanID='8'),(SELECT PatientID from Patient WHERE PatientID='8'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='8'));
INSERT InsuranceCompanyBillingProcess
VALUES ('unpaid','process','23425','12/1/2017',9,(SELECT PlanID from InsurancePlan WHERE PlanID='9'),(SELECT PatientID from Patient WHERE PatientID='9'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='9'));
INSERT InsuranceCompanyBillingProcess
VALUES ('paid','end','23124','12/1/2017',10,(SELECT PlanID from InsurancePlan WHERE PlanID='10'),(SELECT PatientID from Patient WHERE PatientID='10'),(SELECT CompanyPaymentID from InsuranceCompanyPaymentHistory WHERE CompanyPaymentID='10'));


-- --------------------------------------------------------

--
-- INSERT PatientPaymentHistory
--
INSERT PatientPaymentHistory
VALUES (1,'11/2/2017','32324','end');
INSERT PatientPaymentHistory
VALUES (2,'11/2/2017','3321','end');
INSERT PatientPaymentHistory
VALUES (3,'11/2/2017','34335','end');
INSERT PatientPaymentHistory
VALUES (4,'11/2/2017','6655','end');
INSERT PatientPaymentHistory
VALUES (5,'11/30/2017','44443','process');
INSERT PatientPaymentHistory
VALUES (6,'12/1/2017','65654','end');
INSERT PatientPaymentHistory
VALUES (7,'12/1/2017','3334','end');
INSERT PatientPaymentHistory
VALUES (8,'12/1/2017','26275','process');
INSERT PatientPaymentHistory
VALUES (9,'12/1/2017','23425','process');
INSERT PatientPaymentHistory
VALUES (10,'12/1/2017','23124','end');

-- --------------------------------------------------------

--
-- INSERT PatientBillingProcess
--
go
INSERT PatientBillingProcess
VALUES ('paid','end','32324','11/2/2017',1,(SELECT PatientID from Patient WHERE PatientID='1'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='1'));
INSERT PatientBillingProcess
VALUES ('paid','end','3321','11/2/2017',2,(SELECT PatientID from Patient WHERE PatientID='2'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='2'));
INSERT PatientBillingProcess
VALUES ('paid','end','34335','11/2/2017',3,(SELECT PatientID from Patient WHERE PatientID='3'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='3'));
INSERT PatientBillingProcess
VALUES ('paid','end','6655','11/2/2017',4,(SELECT PatientID from Patient WHERE PatientID='4'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='4'));
INSERT PatientBillingProcess
VALUES ('unpaid','process','44443','11/30/2017',5,(SELECT PatientID from Patient WHERE PatientID='5'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='5'));
INSERT PatientBillingProcess
VALUES ('paid','end','65654','12/1/2017',6,(SELECT PatientID from Patient WHERE PatientID='6'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='6'));
INSERT PatientBillingProcess
VALUES ('paid','end','3334','12/1/2017',7,(SELECT PatientID from Patient WHERE PatientID='7'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='7'));
INSERT PatientBillingProcess
VALUES ('unpaid','process','26275','12/1/2017',8,(SELECT PatientID from Patient WHERE PatientID='8'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='8'));
INSERT PatientBillingProcess
VALUES ('unpaid','process','23425','12/1/2017',9,(SELECT PatientID from Patient WHERE PatientID='9'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='9'));
INSERT PatientBillingProcess
VALUES ('paid','end','23124','12/1/2017',10,(SELECT PatientID from Patient WHERE PatientID='10'),(SELECT PaymentID from PatientPaymentHistory WHERE PaymentID='10'));


-- --------------------------------------------------------
--
-- INSERT Prescription
--
INSERT Prescription
VALUES (1,'23','lab','11/2/2017',(SELECT ProviderID from Provider WHERE ProviderID='1'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='1'));
INSERT Prescription
VALUES (2,'44','lab and medicine','11/2/2017',(SELECT ProviderID from Provider WHERE ProviderID='2'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='2'));
INSERT Prescription
VALUES (3,'25','lab','11/2/2017',(SELECT ProviderID from Provider WHERE ProviderID='3'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='3'));
INSERT Prescription
VALUES (4,'26','medicine','11/2/2017',(SELECT ProviderID from Provider WHERE ProviderID='4'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='4'));
INSERT Prescription
VALUES (5,'33','lab','11/30/2017',(SELECT ProviderID from Provider WHERE ProviderID='5'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='5'));
INSERT Prescription
VALUES (6,'46','lab and medicine','12/1/2017',(SELECT ProviderID from Provider WHERE ProviderID='6'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='6'));
INSERT Prescription
VALUES (7,'15','medicine','12/1/2017',(SELECT ProviderID from Provider WHERE ProviderID='7'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='7'));
INSERT Prescription
VALUES (8,'33','lab','12/1/2017',(SELECT ProviderID from Provider WHERE ProviderID='8'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='8'));
INSERT Prescription
VALUES (9,'28','medicine','12/1/2017',(SELECT ProviderID from Provider WHERE ProviderID='9'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='9'));
INSERT Prescription
VALUES (10,'31','lab','12/1/2017',(SELECT ProviderID from Provider WHERE ProviderID='10'),(SELECT PatientRecordID from PatientRecord WHERE PatientRecordID='10'));
-- --------------------------------------------------------


go
/*Stored Procedure: Encrypt*/
create procedure dbo.EncryptPassword 
@Tablename varchar(250),--table name
@Attributename varchar(250)--column name
as 
begin
declare @OriginalName varchar(250)
set @OriginalName=@Attributename
--create master ket
create master key encryption by 
password='Test_P@ssWord'
--create certificate 
create certificate SelfSignedCertificate 
 with subject = 'Password_Encryptioin'
--create symmetric_key
create symmetric key Sql_symmetrickey
with algorithm =aes_128
encryption by certificate SelfSignedCertificate;
open symmetric key Sql_SymmetricKey 
decryption by certificate SelfSignedCertificate;
--execute dynamic sql
exec ('alter table '+ @Tablename+' add '+@Attributename+ '_Encrypted varbinary(max) null');
exec ('update '+@Tablename+' set ' + @Attributename+'_Encrypted = ENCRYPTBYKEY(KEY_GUID'+'('+'''Sql_SymmetricKey'''+'),'+ @Attributename+')');
exec ('alter table '+@Tablename+' drop column '+@Attributename)
end
go

/*Stored Procedure: clear master key, certificate, symmetric key */
create proc dbo.ClearSK
as 
begin
close symmetric key Sql_SymmetricKey;
drop symmetric key Sql_SymmetricKey;
drop certificate SelfSignedCertificate;
drop master key
end
go


/*Execute procedure, return the result*/
go
exec dbo.EncryptPassword  PatientBillingProcess, Patient_Billing_Amount;
select * from PatientBillingProcess
go

/*Decrypt*/
--open symmetric key Sql_SymmetricKey
--decryption by certificate SelfSignedCertificate;
--Select *,
--convert(varchar(20),DECRYPTBYKEY(UserPassword_Encrypted)) as [DecryptedResults]
--from
--UserDetails


/*Clear All*/
exec ClearSK;
drop proc dbo.EncryptPassword;
drop proc ClearSK;


--
-- ------------------VIEW ----------------- 
--
--
-- report patient information and record by PatientID
--
go

create view PatientInfomation 
as
SELECT p.PatientID, LastName, FirstName,pr.PatientLabResult,pr.PatientAllergicHistory,pr.PatientMedicalRecord
FROM Patient p
inner JOIN PatientRecord pr
ON p.PatientID = pr.PatientID
WHERE p.Modified_Date > '2017-11-30'
go
-- Results
select * from PatientInfomation

go
drop view PatientInfomation

-------------------------------------------------
--report Patients' info of who have paid the insurance and live in Roxbury  

select p.PatientID,
FirstName,
MiddleName,
LastName,p.Gender,p.Birthdate,p.Email,
Address_Line1 + ' '+Address_Line2 as Address 
from 
PatientBillingProcess pbp inner join Patient p 
on pbp.PatientID= P.PatientID
inner join PatientAddress pa
on pa.PatientAddressID = p.PatientAddressID
where pa.City='Roxbury' and Patient_Billing_Status= 'paid'




-----------------------------------------
-- Function
-- count the total ended payment by date
--
go

CREATE FUNCTION dbo.countTotalAmountDue
(@year int, @month int)
RETURNS MONEY
AS
BEGIN
	DECLARE @totalAmount AS MONEY;
	SELECT @totalAmount = 
	ISNULL(SUM(cast(Patient_Payment_Amount as money)),0)
	FROM PatientPaymentHistory
	WHERE YEAR(Patient_Payment_Date)  = @year   AND
		  MONTH(Patient_Payment_Date) = @month  and 
		  Patient_Payment_Type='end'
	RETURN @totalAmount;
END
GO

SELECT 'TotaL Payment Amount'as ' ', dbo.countTotalAmountDue(2017, 11) as ' ';

DROP FUNCTION dbo.countTotalAmountDue;

-- add Check Constraint

alter table Roles
add Constraint chk_Roles check (RoleID >0 and RoleName='Provider')

alter table PatientAddress
add check(State='MA')

-- Specify Computed Column

alter table ProviderRole
add RelativeDaysss as ( datediff(dd,'2017-01-01',Modifited_Date))
