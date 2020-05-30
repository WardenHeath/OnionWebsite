DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Order_Table CASCADE CONSTRAINTS;
DROP TABLE Seller CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE Product_Listing CASCADE CONSTRAINTS;
DROP TABLE Order_Item CASCADE CONSTRAINTS;
  

CREATE TABLE Customer (
    Customer_ID NUMBER(3)  PRIMARY KEY NOT NULL,
    C_First_Name VARCHAR2(15) NOT NULL,
    C_Last_Name VARCHAR2(40) NOT NULL,
    C_Login VARCHAR2(25) NOT NULL,
    C_Password VARCHAR2(50) NOT NULL,
    C_Addr_Ln1 VARCHAR2(50) NOT NULL,
    C_Addr_Ln2 VARCHAR2(50) NOT NULL,
    C_Addr_Ln3 VARCHAR2(8) NOT NULL,
    C_Tel_No VARCHAR2(15) NOT NULL,
    C_Image VARCHAR2(200) NOT NULL
);

CREATE TABLE Order_Table (
    Order_Table_ID NUMBER(3) PRIMARY KEY NOT NULL,
    Order_Date number(8) NOT NULL,
    order_number number(9),
    Order_Status VARCHAR2(10) NOT NULL,
    Customer_ID NUMBER(3) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Seller (
    Seller_ID NUMBER(3) PRIMARY KEY NOT NULL,
    S_First_Name VARCHAR2(15) NOT NULL,
    S_Last_Name VARCHAR2(40) NOT NULL,
    S_Addrline1 VARCHAR2(100) NOT NULL,
    S_Addrline2 VARCHAR2(100) NOT NULL,
    S_Addrline3 VARCHAR2(8) NOT NULL,
    S_Tel_No VARCHAR2(15) NOT NULL,
    Bank_Sort VARCHAR2(6) NOT NULL,
    Bank_Account VARCHAR2(8) NOT NULL,
    Seller_Name VARCHAR2(100) NOT NULL,
    Seller_Password VARCHAR2(50) NOT NULL,
    S_Image VARCHAR2(250),
    Admin_Rights NUMBER(1) NOT NULL
);

CREATE TABLE Review (
    Review_ID NUMBER(3) PRIMARY KEY NOT NULL,
    Star_Rating NUMBER(1) NOT NULL,
    R_Comment VARCHAR2(250) NOT NULL,
    Customer_ID NUMBER(3) REFERENCES Customer(Customer_ID),
    Seller_ID NUMBER(3) REFERENCES Seller(Seller_ID)
);

CREATE TABLE Product_Listing (
    Product_Listing_ID NUMBER(3) PRIMARY KEY NOT NULL,
    P_Name VARCHAR2(100) NOT NULL,
    P_Image VARCHAR2(250) NOT NULL,
    P_Quantity NUMBER(3) NOT NULL,
    Price_Per_Unit NUMBER(4) NOT NULL,
    Seller_ID NUMBER(3) REFERENCES Seller(Seller_ID)
);

CREATE TABLE Order_Item (
    Order_Item_ID NUMBER(3) PRIMARY KEY NOT NULL,
    Order_Item_Quantity NUMBER(4) NOT NULL,
    Order_Table_ID NUMBER(3) REFERENCES Order_Table(Order_Table_ID),
    Product_Listing_ID NUMBER(3) REFERENCES Product_Listing(Product_Listing_ID)
);

--add constraints
ALTER TABLE Customer ADD CONSTRAINT C_Login_Constraint UNIQUE (C_Login);
ALTER TABLE Seller ADD CONSTRAINT Seller_Name_Constraint UNIQUE (Seller_Name);

DROP SEQUENCE Customer_ID_seq;
DROP SEQUENCE Order_Table_ID_seq;
DROP SEQUENCE Seller_ID_seq;
DROP SEQUENCE Review_ID_seq;
DROP SEQUENCE Product_Listing_ID_seq;
DROP SEQUENCE Order_Item_ID_seq;

CREATE SEQUENCE Customer_ID_seq START WITH 1;
CREATE SEQUENCE Order_Table_ID_seq START WITH 1;
CREATE SEQUENCE Seller_ID_seq START WITH 1;
CREATE SEQUENCE Review_ID_seq START WITH 1;
CREATE SEQUENCE Product_Listing_ID_seq START WITH 1;
CREATE SEQUENCE Order_Item_ID_seq START WITH 1;


INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Tom', 'Makey', 'TDog', 'Test1', '012A Leeds Road' , 'Leeds', 'LS2 1HG' ,'01623458921', 'Ben.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Ben', 'Ever', 'BDog', 'Test2', '13A Bradford Road', 'Bradford', 'BD4 1HG' ,'01658969231', 'Cust2.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Dylan', 'Ellis', 'DDog', 'Test3', '142A Sheffield Street', 'Sheffield', 'SH2 1HG' ,'01623458741', 'Cust3.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Habib', 'Khan', 'HBOSS', 'Test4', '15A Newcastle Road' , 'Newcastle', 'NE2 1GB' ,'01132715896', 'Cust4.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Ben', 'Crew', 'CDOG', 'Test5', '162A Cambridge Road' , 'Cambridge' , 'LS2 1HG' ,'01132711236', 'Cust5.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Adam', 'James', 'GRBOSS', 'Test6', '17A Wembley Road' , 'Wembley' , 'WE2 1GB' ,'011327774122', 'Cust6.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Darren', 'Sherwok', 'StarD', 'Test7', '218A Manchester Road' , 'Manchester' , 'MNS2 1HG' ,'01274321654', 'Cust7.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'David', 'Platt', 'DStar', 'Test8', '192A Birmingham Road' , 'Birmingham' , 'BI2 1HM' ,'012749632654', 'Cust8.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Phil', 'Mitchell', 'PCRIM', 'Test9', '220A Coventry Road' , 'Coventry' , 'CNS2 1AS' ,'02075321456', 'Cust9.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Cain', 'Dingle', 'BigC', 'Test10', '221A Exeter Road' , 'Exeter' , 'EX2 1RD' ,'01132148521', 'Cust10.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Sherlock', 'Holmes', 'Eyes', 'Test11', '20A Southampton Road' , 'Southampton' , 'CNS2 1AS' ,'01611234567', 'Cust11.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Mohammed', 'Hussain', 'Moes', 'Test12', '1A Bridgton Street' , 'Brighton', 'BR2 1TON' ,'02072345677', 'Cust12.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Wasim', 'Hussain', 'Waz01', 'Test13', '62A Chester Road' , 'Chester' , 'CH3 5ST' ,'02072345689', 'Cust13.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Kirsty', 'Coops', 'CoopsK1', 'Test14', '1A Derby Road', 'Derby', 'DE2 1BY' ,'02072345621', 'Cust14.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Gareth', 'James', 'GBOSS', 'dddTestddd15', '25 Bridgton Street', 'Brighton' , 'BR2 1TON' ,'01132778945', 'Cust15.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'James', 'Auther', 'BigJam12', 'Test16', '30 Huddersfield Road' , 'Huddersfield' , 'HU21 1FD' ,'01132778123', 'Cust16.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Jenny', 'McGuire', 'JennyM02', 'Test17', '1 London Road' , 'London' , 'LO2 8ON' ,'01274632587', 'Cust17.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Paul', 'Bedford', 'BedfordP', 'Test18', '30 Bristol Road' , 'Bristol' , 'BR1 5OL' ,'01415553653', 'Cust18.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Clair', 'Smith', 'SmithyC', 'Test19', '99 Nottingham Street' , 'Brighton' , 'NO2 1HAM' ,'01415553632', 'Cust19.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Joanne', 'Staff', 'StaffJo', 'Test20', '37 Holbeck Road' , 'Holbeck' , 'HO2 1EK' ,'01415551234', 'Cust20.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Shabeer', 'Javed', 'JavSha21', 'Test21', '81 Solihill Road' , 'Solihill' , 'SO2 1IL' ,'01415551789', 'Cust21.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Wayne', 'Rooney', 'WayneR', 'Test22', '92 Oxford Street' , 'Oxford' , 'OX21 6FD' ,'01415551234', 'Cust22.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Roger', 'Federer', 'FedererR', 'Test23', '95 Norwich Road' , 'Norwich' , 'NO21 6CH' ,'02070369654', 'Cust23.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Mike', 'Tyson', 'TigerM', 'Test24', '63A Liverpool Street' , 'Liverpool', 'LV21 0OL' ,'02070371234', 'Cust24.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'David', 'Price', 'PriceyD', 'Test25', '0A Lincoln Road' , 'Lincoln' , 'LN21 0LN' ,'02070385426', 'Cust25.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Sweet', 'Onion', 'NeedsOnions', 'Test26', '65 Edinburgh Avenue' , 'Edinburgh' , 'ED21 0GH' ,'02070376245', 'Cust26.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Dave', 'Allen', 'AllOverOnions', 'Test27', '62B Armley Road' , 'Armley' , 'AR1 10EY' ,'01142054561', 'Cust27.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Katy', 'Price', 'PricedK', 'Test28', '0A Wakefield Avenue' , 'Wakefield' , 'WA35 0LD' ,'01142013265', 'Cust28.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Margret', 'Thatcher', 'ThatcherM', 'Test29', '0A Watford Street' , 'Watford' , 'WA21 0RD' ,'01142023145', 'Cust29.png');
INSERT INTO Customer VALUES (Customer_ID_seq.nextval, 'Dani', 'Khan', 'KhanyD', 'Test30', '0A Hunslet Road' , 'Hunslet', 'HN5 1LT' ,'01142089652', 'Cust30.png');

--updated passwords due to inclusion of hashing
--wanted to keep record of original passwords for the purposes of demonstration
UPDATE Customer SET C_Password = '77af1a90eb313997cdb13f3c10db247df8f2ef4c' WHERE Customer_ID = 1;
UPDATE Customer SET C_Password = '8d067faee9ad6cf7337182e620c8fb2e4616abfb' WHERE Customer_ID = 2;
UPDATE Customer SET C_Password = 'ac07fb0b8806d8eaf57ea562779895e7a3a716fb' WHERE Customer_ID = 3;
UPDATE Customer SET C_Password = 'a4a73a574dc1fcadd3cd9e2cba2759924ecf27f6' WHERE Customer_ID = 4;
UPDATE Customer SET C_Password = 'c29d2fb276ff35b63db044a8808b6ac56415c60b' WHERE Customer_ID = 5;
UPDATE Customer SET C_Password = '8c71d26a3622aca4ad485d460e6a113132aa61af' WHERE Customer_ID = 6;
UPDATE Customer SET C_Password = '18a67a38af5940f4bbddec6f41fd0b2c5f9c3796' WHERE Customer_ID = 7;
UPDATE Customer SET C_Password = '0da573b6a03da1033bdb1806a5fe2a027adfc96f' WHERE Customer_ID = 8;
UPDATE Customer SET C_Password = 'c2ba9b24ff46810184bb8f9c1d3388f75761ed9b' WHERE Customer_ID = 9;
UPDATE Customer SET C_Password = '2245d6a3c4e2475f34f2fa8b17ee07b28ae3cca3' WHERE Customer_ID = 10;
UPDATE Customer SET C_Password = '289cea68152b8c7863f39f88b232dbc3b1f2c57f' WHERE Customer_ID = 11;
UPDATE Customer SET C_Password = '7b354b226795ebe7aed0441a39c182fe26283626' WHERE Customer_ID = 12;
UPDATE Customer SET C_Password = '90d9d5e813d88ef83d818183e52fc9b39501bfc9' WHERE Customer_ID = 13;
UPDATE Customer SET C_Password = 'c176b67b00f7adee1667a84d048d032621d757dc' WHERE Customer_ID = 14;
UPDATE Customer SET C_Password = '2ab1587d9b45ab8ad342359ea525b510b677b89d' WHERE Customer_ID = 15;
UPDATE Customer SET C_Password = '7d97af5f63622f8e0292f8cc8c2ddc13abb62446' WHERE Customer_ID = 16;
UPDATE Customer SET C_Password = '64db52a211ebc6b4883cf9ea6ea42393a487ccac' WHERE Customer_ID = 17;
UPDATE Customer SET C_Password = 'af4117cd48c98e60e80c3675ca4cb63b81fe2869' WHERE Customer_ID = 18;
UPDATE Customer SET C_Password = '2f7e72c16d0b14edcce872b117f7db22b11d1e9a' WHERE Customer_ID = 19;
UPDATE Customer SET C_Password = '0470978919ffa755d0786aff87510ef5b19d42e0' WHERE Customer_ID = 20;
UPDATE Customer SET C_Password = '1b391cead9c6f835f3950e934849af90d0ef948c' WHERE Customer_ID = 21;
UPDATE Customer SET C_Password = 'd79bcd59290c3db68457c2323f7213fedcec2592' WHERE Customer_ID = 22;
UPDATE Customer SET C_Password = 'b26eac57f7965ef21625b79b0012edaf2204dd0f' WHERE Customer_ID = 23;
UPDATE Customer SET C_Password = 'bf6f4a76fa558a154293c5b16a6f0f216cdee53f' WHERE Customer_ID = 24;
UPDATE Customer SET C_Password = '705a3e36fa2be9fcc7c8d67d34c432a71785d9e1' WHERE Customer_ID = 25;
UPDATE Customer SET C_Password = 'c191112e25cdc3a0898fed47e43506eaeccb8548' WHERE Customer_ID = 26;
UPDATE Customer SET C_Password = 'e1f1bd3c2cba0f7e73ced9cede15822b51ca2faa' WHERE Customer_ID = 27;
UPDATE Customer SET C_Password = '0f0f1fa636a2983c8e6285cb89dd922e2991788d' WHERE Customer_ID = 28;
UPDATE Customer SET C_Password = 'c17607b618ec8a720be6ecb39d8dfcda4fef4ab5' WHERE Customer_ID = 29;
UPDATE Customer SET C_Password = '7b7fd60f20b0f4acaee6e18749d79cb403174bca' WHERE Customer_ID = 30;



INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Ben', 'Ever', '12A Leeds Road' , 'Leeds' , 'LS2 1HG' , '01365486982', '123656', '14765236', 'BennyBenfreshOnionsInc', 'Re', 'Ben.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Terry', 'Tibbs', '13A Bradford Road' , 'Bradford', 'BD4 1HG', '01394386982', '167656', '14782136', 'TerryTOnionsLtd', 'Ree', 'vegetables1.1.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Cath', 'Edral', '142A Sheffield Street' , 'Sheffield', 'SH2 1HG' , '07415486982', '129616', '14785236', 'CathCInc', 'Reee','vegetables1.2.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Dillian', 'Whyte', '15A Newcastle Road' , 'Newcastle' , 'NE2 1GB' , '07415321654', '789456', '14785123', 'LightweightOnionsLtd', 'Dee','vegetables1.3.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Anthony', 'Joshua', '162A Cambridge Road' , 'Cambridge' , 'LS2 1HG' , '07415486123', '129123', '14785321', 'MiddleweightOnionsInc', 'JoshA','vegetables1.4.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Kell', 'Brook', '0A Hunslet Road' , 'Hunslet' , 'HN5 1LT' , '07415486234', '129234', '14785234', 'HeavyweightOnionsLtd', 'KellB','vegetables1.5.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Keith', 'Thurman', '17A Wembley Road' , 'Wembley' , 'WE2 1GB' , '07415486345', '129345', '14785345', 'EuropeanOnionsInc', 'KeithT01','vegetables1.6.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Errol', 'Spence', '218A Manchester Road' , 'Manchester' , 'MNS2 1HG' , '07415486456', '129456', '14785456', 'FabOnionsLtd', 'SpenseE01','vegetables1.7.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Floyd', 'Mayweather', '192A Birmingham Road' , 'Birmingham' , 'BI2 1HM' , '07415486567', '129567', '14785567', 'YellowOnionsInc', 'MoneyF3201','vegetables1.8.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Eddie', 'Hall', '220A Coventry Road' , 'Coventry' , 'CNS2 1AS' , '07415486678', '129678', '14785678', 'RedOnionsLtd', 'Eddie01','vegetables1.9.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Muhammed', 'Ali', '221A Exeter Road' , 'Exeter', 'EX2 1RD' , '07415486789', '129789', '14785789', 'RandomOnionsInc', 'AliM786','vegetables1.10.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Hash', 'Aktar', '20A Southampton Road' , 'Southampton' , 'CNS2 1AS' , '07415486891', '129891', '14785891', 'RealOnionsLtd', 'AktarH786','vegetables1.11.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'James', 'Bond', '1A Bridgton Street' , 'Brighton' , 'BR2 1TON' , '07415486912', '129912', '14785912', '007SuperOnionsInc', 'BondJJ786','vegetables1.12.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'David', 'Beckham', '62A Chester Road' , 'Chester' , 'CH3 5ST' , '07415486102', '129102', '14785102', 'ChampionsOnionsLtd', 'BeckhamJ786','vegetables1.13.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Alex', 'Ferguson', '1A Derby Road' , 'Derby' , 'DE2 1BY' , '07415486103', '129103', '14785103', 'FreshOnionsInc', 'AlexFer786','vegetables1.14.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Jose', 'Morinio', '25 Bridgton Street' , 'Brighton', 'BR2 1TON' , '07415486104', '129104', '14785104', 'HardOnionsLtd', 'JoseM786','vegetables1.15.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Gareth', 'Southgate', '30 Huddersfield Road' , 'Huddersfield' , 'HU21 1FD' , '07415486105', '129105', '14785105', 'RawOnionsInc', 'GarethS786','vegetables1.16.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Arsene', 'Wenget', '1 London Road' , 'London' , 'LO2 8ON' , '07415486106', '129106', '14785106', 'MensOnionsLtd', 'WengerA786','vegetables1.17.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Slaven', 'Bilic', '30 Bristol Road' , 'Bristol' , 'BR1 5OL' , '07415486107', '129107', '14785107', 'TopcalcotInc', 'SlavenB786','vegetables1.18.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Mark', 'Hughes', '99 Nottingham Street' , 'Brighton' , 'NO2 1HAM' , '07415486108', '129108', '14785108', 'TopShallotsLtd', 'HughesM123','vegetables1.19.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Pep', 'Guardiola', '37 Holbeck Road' , 'Holbeck' , 'HO2 1EK' , '07415486109', '129109', '14785109', 'PepesTopShallotsInc', 'GuardiolaP123','vegetables1.20.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Walter', 'Mazzarri', '81 Solihill Road' , 'Solihill' , 'SO2 1IL' , '07415486110', '129110', '14785110', 'WaltVegLtd', 'WalterM123','vegetables1.21.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Jurgen', 'Klopp', '92 Oxford Street' , 'Oxford', 'OX21 6FD' , '07415486111', '129111', '14785111', 'JurgenOnionsInc', 'KloppJ','vegetables1.22.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Mauricio', 'Pochettino', '95 Norwich Road' , 'Norwich' , 'NO21 6CH' , '07415486112', '129112', '14785112', 'ColcotOnionsLtd', 'PochettinoM01','vegetables1.23.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Eddie', 'Hearn', '63A Liverpool Street' , 'Liverpool' , 'LV21 0OL' , '07415486113', '129113', '14785113', 'OrganicOnionsInc', 'HearnE01','vegetables1.24.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Frank', 'Warren', '0A Lincoln Road' , 'Lincoln', 'LN21 0LN' , '07415486114', '129114', '14785114', 'FranksSuperOnionsLtd', 'WarrenF03','vegetables1.25.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Bob', 'Arum', 'Unit 1 Edinburgh Avenue' , 'Edinburgh', 'ED21 0GH' , '07415486115', '129115', '14785115', 'TopOnionsInc', 'ArumB03','vegetables1.26.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Ricky', 'Hatton', '62B Armley Road' , 'Armley' , 'AR1 10EY' , '07415486116', '129116', '14785116', 'TopGunOnionsLtd', 'HattonR','vegetables1.27.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Barry', 'Hearn', '0A Wakefield Avenue' , 'Wakefield' , 'WA35 0LD' , '07415486117', '129117', '14785117', 'BarrysBunionsInc', 'HearnB08','vegetables1.28.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Oscar', 'Delahoya', '0A Watford Street' , 'Watford', 'WA21 0RD' , '07415486118', '129118', '14785118', 'OscarsOnionsLtd', 'DelaHoyaO08','vegetables1.29.png', 0);
INSERT INTO Seller VALUES (Seller_ID_seq.nextval, 'Admin', 'Admin', 'Admin' , 'Admin', 'Admin' , '00000000000', '129118', '14785118', 'Admin', 'password','vegetables1.30.png', 1);

--updated passwords due to inclusion of hashing
--wanted to keep record of original passwords for the purposes of demonstration
UPDATE Seller SET Seller_Password = '53765389dc728c7af2981f29e8081cac07f17b24' WHERE Seller_ID = 1;
UPDATE Seller SET Seller_Password = '7f7b514774328ade72eea64a59c8098dbd7ef1ef' WHERE Seller_ID = 2;
UPDATE Seller SET Seller_Password = '8382a61f74181f938a4d25b5a13044dc773246d1' WHERE Seller_ID = 3;
UPDATE Seller SET Seller_Password = 'abaff4e37db4b7628de6193b583c7a516458c5ac' WHERE Seller_ID = 4;
UPDATE Seller SET Seller_Password = '4272dc9f13abf5b6592f9630ce26612f39a9d2a0' WHERE Seller_ID = 5;
UPDATE Seller SET Seller_Password = '5ca460cc85dc5e6f607da47e8831cb2659dde4ff' WHERE Seller_ID = 6;
UPDATE Seller SET Seller_Password = '5caa06674bf7d556df59dc7d48f5531c597d784b' WHERE Seller_ID = 7;
UPDATE Seller SET Seller_Password = 'dc5601cdd01f5c88ed0f17cdb45ac0a4dcc7b6b4' WHERE Seller_ID = 8;
UPDATE Seller SET Seller_Password = '8e9ba60f5ac3b608ef40ffe2060fc9d47f6ff10e' WHERE Seller_ID = 9;
UPDATE Seller SET Seller_Password = 'd3c02dcab2453a61886cc85563a4eb248d5b7746' WHERE Seller_ID = 10;
UPDATE Seller SET Seller_Password = '7deb26ddd6ed8a986d5eaa1d39947fc6b3d95ae4' WHERE Seller_ID = 11;
UPDATE Seller SET Seller_Password = '17cd2a9178ecebfb64fd9bf4ff780b9f1c8e9175' WHERE Seller_ID = 12;
UPDATE Seller SET Seller_Password = '5179b79a20b6d89cfb760a56b917afaa9d2b5c7e' WHERE Seller_ID = 13;
UPDATE Seller SET Seller_Password = '9fcf67b6c83055445d5c4b2fd4e614dea47372c1' WHERE Seller_ID = 14;
UPDATE Seller SET Seller_Password = 'e7395de363cbd58bf815501eb5b3efd48607a43b' WHERE Seller_ID = 15;
UPDATE Seller SET Seller_Password = '3570c86a548df6f5ca614d3a01404d2fe19814b1' WHERE Seller_ID = 16;
UPDATE Seller SET Seller_Password = '9a5bab8f7ce186543ffe29c6eeb714d24dabd053' WHERE Seller_ID = 17;
UPDATE Seller SET Seller_Password = 'f3c6d559e1bc1a14dba5a4c1f446d870b43a7015' WHERE Seller_ID = 18;
UPDATE Seller SET Seller_Password = '40cb819cd40cfc9de74b4769dfab9d1d4f18b5c6' WHERE Seller_ID = 19;
UPDATE Seller SET Seller_Password = '1e2d581442d9c33f8e780bfbc818bb6c3039ced4' WHERE Seller_ID = 20;
UPDATE Seller SET Seller_Password = '7583233fad069ea83a281bb2014983d8edb91886' WHERE Seller_ID = 21;
UPDATE Seller SET Seller_Password = 'e0b3b407e403012d1a1917bbfa8ab94d52e360e1' WHERE Seller_ID = 22;
UPDATE Seller SET Seller_Password = 'a0db310f42980a37fcfd9222c5d9b718eca51fe6' WHERE Seller_ID = 23;
UPDATE Seller SET Seller_Password = 'cbf53009c2b8528bdbc9c842c378804090fb77c1' WHERE Seller_ID = 24;
UPDATE Seller SET Seller_Password = '4675fb67c0ca00113afc7a8d672acd4d6727da46' WHERE Seller_ID = 25;
UPDATE Seller SET Seller_Password = 'fcd93324ad9861548b81b45f71e0d5dea22d029d' WHERE Seller_ID = 26;
UPDATE Seller SET Seller_Password = '82d01a80b870e0686ad7788ed0cdf05060b15b46' WHERE Seller_ID = 27;
UPDATE Seller SET Seller_Password = '7e0d58ebb4af234dfb61f1b29723311a0ae0a817' WHERE Seller_ID = 28;
UPDATE Seller SET Seller_Password = '8421a90c6f7da74b7008c91adb367b4a8ee96ee8' WHERE Seller_ID = 29;
UPDATE Seller SET Seller_Password = 'fb84ede315d10ba6890bbf389fad7ca3ba0405f1' WHERE Seller_ID = 30;
UPDATE Seller SET Seller_Password = '391a8c2e89168bde403b3bffe93edb51b070de9d' WHERE Seller_ID = 31;


INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Super delivery very fast always a good seller' , 1, 1);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'As described, fast delivery, thanks' , 2 , 1);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Good quick service on delivery. Recommended seller and good value xxxxxxxxxxx' , 3 , 1);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'This place is awesome', 3, 2);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'This place is tragic', 4, 2);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Excellent service' , 5 , 2);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Good item and arrived on time thanks a1' , 6 , 2 );
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Fast delivery and item exactly as described. Perfect service - Thank you' , 7 , 3);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Really good description and brilliant service would recommend to anyone' , 8, 3);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Top class service. 1st time buyer for these looking forward to results', 9 , 3);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 2, 'Just what I needed good price quick delivery Thank you' , 10, 4);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'This product is superb. It has a beautiful delicate flavour' , 11, 4);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Excellent produce arrived promptly and the product is of good quality I will use this company and product again I have used this in some of dishes' , 11 , 4);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Tastes and smells great' , 12 , 5);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'I have used Simply Onions for years and have never been unhappy. The Onions are fresh and smell like they should', 13 , 5 );
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Light, Natural Tasting Onions... Quality Onions. No odd after taste. Just a nice onions!' , 14 , 5);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Very flavourful and perfect addition to your pantry! Will for sure buy again once I ran out!' , 15 , 6);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Simply the best!' , 15 , 6);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'The Real Deal!!!!!', 16, 6);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Great item. Packaged very good. Very happy.', 17 , 7);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Love this, so convenient, organic, so thats perfect',  18, 7);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Best organic onion available, in my opinion' , 19 , 7);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'I love these Onions, Excellent quality and definitely adds taste to the food. I continue to buy them because they are well worth the money' , 20 , 8);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Excellent product. It makes everything I cook taste excellent' , 21 , 8);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'yum!' , 22 , 8 );
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4 , 'Its organic and delicious!' , 23 , 9);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'As expected. Was packed very well', 24, 9);
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Excellent product', 25, 9);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Thank GOD for onions!' , 26, 10);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Brilliant for those of us who cant get to the shops easily' , 27 , 10);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'I can safely say that onions saved my bunions' , 28, 10);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Excellent quality and a good onion size. Peeled easily which is a bonus. Very pleased with them. Arrived promptly and well packaged to prevent damage', 29, 11);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'They are of good quality only one onion had gone off so very pleased', 30, 11);                             
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Onions at a good price no waste, not tried taste wait 3 months' , 1 , 11);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Perfect onions, delivered quickly & carefully. No complaints' , 2 , 12 );  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Best onions Ive ever purchased' , 3 , 12);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'These were brilliant will be getting some more later this year' , 4 , 12);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Good quality onion good selection of small and medium size' , 5 , 13);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 2, 'All good', 6 , 13);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'This is a great way to buy the onions, as the supermarkets do not sell it anymore. Very good price too!', 7 , 13);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'From parcel to pot in five minutes. Yum! As an elderly bachelor I need very small amounts (of everything!) and a whole onion can last several meals',  8, 14);                             
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Great as I am unable to buy locally', 9 , 14);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 2, 'Exactly what I wanted but seems a bit expensive', 10, 14);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Wouldnt be without them in my store cupboard!', 11, 15);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'As described, thank you', 12, 15);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'The red onions are Grade A quality well packaged item, and fast delivery I will buy again!',  13, 15);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Really nice and fresh', 14, 16);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Yummy and quick delivery', 15, 16);                             
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Pleased with purchase, well packed and promptly delivered Ta', 16, 16);  
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'A1 Thankyou', 17, 17);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'This place is impressive', 18,17 );    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'A1 Thank you', 19, 17);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Pleased with purchase, well packed and promptly delivered', 20, 18);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Simply the best in the World!' , 21, 18);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'The Real Treat!!!!!', 22, 18);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Quick delivery and item was as described. Perfect service - thank you' , 23, 19);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Really Clean and fresh', 24, 19);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'As described Excellent', 25 , 19);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Wouldnt be able to live without them in my store cupboard', 26 , 20);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'As described, Excellent delivery, Thanks', 28, 20);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Tastes yum!',  29, 21);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Its organic and scrumptious', 30, 21);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Savour and smells great' , 1, 22);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Best organic onion obtainable, in my opinion!', 2 , 22);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 2, 'Arrived on time', 3 ,22);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'This product is wonderful', 4, 23);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Pleased with Sale', 5, 23);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Top class service', 6, 23);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 5, 'Really good description and brilliant service would recommend to anyone', 7, 24);    
INSERT INTO Review VALUES (Review_ID_seq.nextval, 4, 'Efficient quick service on delivery. Highly Recommended Seller', 8, 24);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'This place is Disastrous!!!!!!!!!!!!!!!!!', 9, 24);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'This Place was terrible!!!!!!!!!!!!!', 10, 25);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'This Product was awful!!!!!!!!!!!!', 11, 25);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Would Not Recommend this Place again!!!!!!!!!!!!!!!!!!!!!!!', 12, 25);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 0, 'Worst Service Ever!!!', 13, 26);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Did Not receive Item', 14, 26);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Item not as described', 15, 26);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Never purchasing Onions from here Again', 16, 27);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Delivery After 10 Days', 17, 27);                               
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'New Management Required', 17, 27);   
INSERT INTO Review VALUES (Review_ID_seq.nextval, 3, 'Poor Packaging, Great Onions', 19, 28);   
INSERT INTO Review VALUES (Review_ID_seq.nextval, 2, 'Onions too Over Priced', 20, 28);   
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Incorrect Item was sent out', 21, 28);   
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Worst Customer service', 22, 29); 
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Highly recommend not to buy from here', 23,  29); 
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'New Managentment Requires', 24, 29); 
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Bitter onions rather than pleasant onions', 25, 30); 
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Onions Smell Awful', 26, 30); 
INSERT INTO Review VALUES (Review_ID_seq.nextval, 1, 'Highly recommend not to buy from here', 27, 30);


--assume price is in pence

INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Staffordshire White', 'WhiteOnions.png', 800, 30, 1);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'The Firecracker', 'RedOnions.png', 682, 60, 2);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'The Noxious Toxic' , 'AllOnions.png', 127, 55, 20);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Mild Brown Onions' , 'YellowOnions.png', 99, 99, 1);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Best Sweet Red Onion' , 'RedOnions.png', 111, 97, 2);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Diced White Onion' , 'WhiteOnions.png', 222, 94, 3);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Sliced Red Onion' , 'SlicedRedOnions.png', 179, 90, 4);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Organic Red Onions' , 'RedOnions.png', 98, 88, 5);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'TerrysTOnions' , 'RedOnions.png', 100, 56, 6);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'BerryBensYellowOnions' , 'YellowOnions.png', 75, 65, 7);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Dylans Red Onions' , 'RedOnions.png', 21, 99, 8);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Dylans Organic Yellow Onions' , 'YellowOnions.png', 98, 87, 9);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'All Organic Onions' , 'AllOnions.png', 98, 88, 10);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Bens Best Red Onions' , 'RedOnions.png', 98, 99, 11);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Bens Organic Onions' , 'AllOnions.png', 36, 98, 12);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Habibs Organic Random Selection' , 'AllOnions.png', 32, 32, 13);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Beckett Red Onions' , 'RedOnions.png', 100, 13, 14);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Beckett Organic Red Onions' , 'RedOnions.png', 12, 12, 15);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Beckett Yellow Onions' , 'YellowOnions.png', 22, 10, 16);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Beckett Organic Yellow Onions' , 'RedOnions.png', 22, 22, 17);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Beckett Onions' , 'AllOnions.png', 300, 66, 21);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Beckett Organic Onions' , 'AllOnions.png', 322, 55, 22);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Franks Super White Onions' , 'WhiteOnions.png', 125, 44, 23);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Organic White Onions' , 'WhiteOnions.png', 275, 33, 24);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'White Onions' , 'WhiteOnions.png', 326, 11, 26);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Farm Toxic Yellow Onions' , 'RedOnions.png', 22, 77, 27);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Hitmans Organic Onions' , 'AllOnions.png', 22, 88, 28);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Muhammed Yellow Onions' , 'YellowOnions.png', 600, 99, 29);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Floyds Rare Onions' , 'AllOnions.png', 999, 99, 30);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'The Sharp Cruncher', 'WhiteOnions.png', 309, 21, 8);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'The Omnipotent Red', 'RedOnions.png', 706, 70, 5);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Boneless Onion', 'YellowOnions.png', 338, 17, 8);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Inoculation of Despair', 'WhiteOnions.png', 449, 30, 14);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Saint Cecilia''s Crunch', 'YellowOnions.png', 632, 26, 19);
INSERT INTO Product_Listing VALUES (Product_Listing_ID_seq.nextval, 'Classical Classic', 'AllOnions.png', 801, 17, 22);
