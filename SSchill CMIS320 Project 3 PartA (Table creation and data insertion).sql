CREATE TABLE MOVIE(
 Movie_ID VARCHAR2(20) NOT NULL,
 Title VARCHAR2(30) NOT NULL,
 Rating VARCHAR2(5) CHECK (Rating in ('G', 'PG', 'PG-13', 'R', 'NC-17', 'NR')),
 Director VARCHAR2(50),
 Description VARCHAR2(500),
 CONSTRAINT MOVIE_PK PRIMARY KEY(Movie_ID));

CREATE TABLE CUSTOMER(
 Customer_ID VARCHAR2(20) NOT NULL,
 First_Name VARCHAR2(30) NOT NULL,
 Last_Name VARCHAR2(30) NOT NULL,
 Street VARCHAR2(30),
 City VARCHAR2(30),
 State CHAR(2),
 ZIP VARCHAR2(10),
 Phone# NUMBER(10,0),
 CONSTRAINT CUSTOMER_PK PRIMARY KEY(Customer_ID));

CREATE TABLE DISTRIBUTOR(
 Distributor_ID VARCHAR2(20) NOT NULL,
 Name VARCHAR2(100) NOT NULL,
 Street VARCHAR2(50),
 City VARCHAR2(50),
 State CHAR(2),
 ZIP VARCHAR2(10),
 Phone# NUMBER(10,0),
 CONSTRAINT DISTRIBUTOR_PK PRIMARY KEY(Distributor_ID));

CREATE TABLE SHIPMENT(
 Shipment_ID VARCHAR2(20) NOT NULL,
 Distributor_ID VARCHAR2(20) NOT NULL,
 Total_Items NUMBER(3,0) NOT NULL,
 Total_Payment NUMBER(7,2),
 Order_Status VARCHAR(20),
 Date_Ordered DATE DEFAULT SYSDATE,
 CONSTRAINT SHIPMENT_PK PRIMARY KEY(Shipment_ID),
 FOREIGN KEY(Distributor_ID) REFERENCES DISTRIBUTOR(Distributor_ID));

CREATE TABLE INVENTORY(
 Serial# VARCHAR2(30) NOT NULL,
 Movie_ID VARCHAR2(20) NOT NULL,
 Shipment_ID VARCHAR2(20) NOT NULL,
 CONSTRAINT INVENTORY_PK PRIMARY KEY(Serial#),
 FOREIGN KEY(Movie_ID) REFERENCES MOVIE(Movie_ID),
 FOREIGN KEY(Shipment_ID) REFERENCES SHIPMENT(Shipment_ID));

CREATE TABLE RENTAL(
 Rental_ID VARCHAR2(30) NOT NULL,
 Customer_ID VARCHAR2(20) NOT NULL,
 Serial# VARCHAR2(30) NOT NULL,
 Rental_Date VARCHAR2(10) NOT NULL,
 Rental_Return VARCHAR2(10),
 CONSTRAINT RENTAL_PK PRIMARY KEY(Rental_ID),
 FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER(Customer_ID),
 FOREIGN KEY(Serial#) REFERENCES INVENTORY(Serial#));

/* POPULATE TABLES */

INSERT into MOVIE values('300Murro', '300 Rise of an Empire', 'R', 'Noam Murro', 'While King Leonidas and his 300 Spartans have their date with destiny at Thermopylae, another battle against the Persians is brewing, this time at sea. Themistocles (Sullivan Stapleton), a Greek general, sees the threat posed by the God-King Xerxes of Persia. He knows that he must unite all of Greece if he is to stand any chance of repelling the Persian invasion. Even if he accomplishes his mission, Themistocles must still face Artemisia (Eva Green), the ruthless leader of the...');
INSERT into MOVIE values('RobPadilha', 'Robocop', 'PG-13', 'Jose Padilha', 'In 2028, OmniCorp is at the center of robot technology. While its drones have long been used by the military overseas, their use is forbidden in American law enforcement. However, OmniCorp gets a golden opportunity to crack that market when Detroit cop Alex Murphy (Joel Kinnaman) is critically injured in the line of duty. By transforming Murphy into a cyborg, OmniCorp executives hope to rake in billions for their shareholders, but they forget one thing, Theres still a man inside the machine.');
INSERT into MOVIE values('ShaBranagh', 'Shadow Recruit', 'PG-13', 'Kenneth Branagh', 'To his friends and loved ones, young Jack Ryan (Chris Pine) appears to be an ordinary executive; however, he has secretly worked for the CIA for years. Ryan was originally brought in to crunch global data, but when he uncovers a carefully planned scheme to crash the U.S. economy and spark global chaos, he becomes the only man with the skills to stop it. Now a full operative, Ryan finds himself caught between his secretive handler, his clueless fiancee and a brilliant Russian leader.');
INSERT into MOVIE values('WolScorsese', 'The Wolf of Wall Street', 'R', 'Martin Scorsese', 'In 1987, Jordan Belfort (Leonardo DiCaprio) takes an entry-level job at a Wall Street brokerage firm. By the early 1990s, while still in his 20s, Belfort founds his own firm, Stratton Oakmont. Together with his trusted lieutenant (Jonah Hill) and a merry band of brokers, Belfort makes a huge fortune by defrauding wealthy investors out of millions. However, while Belfort and his cronies partake in a hedonistic brew of sex, drugs and thrills, the SEC and the FBI close in on his empire of excess.');
INSERT into MOVIE values('RidStory', 'Ride Along', 'PG-13', 'Tim Story', 'For two years, security guard Ben (Kevin Hart) has tried to convince James (Ice Cube), a veteran cop, that he is worthy of James sister, Angela. When Ben is finally accepted into the police academy, James decides to test his mettle by inviting him along on a shift deliberately designed to scare the trainee. However, events take an unexpected turn when their wild night leads to Atlantas most-notorious criminal and Bens rapid-fire mouth proves as dangerous as the bullets whizzing by them.');

INSERT into CUSTOMER values('TM5078464', 'Tony', 'Montana', '9729 High Heath', 'Shock', 'VA', '22959-9736', '7035078464');
INSERT into CUSTOMER values('RB4641500', 'Rocky', 'Balboa', '603 Velvet Spring Parkway', 'Piankashawtown', 'VA', '22085-1056', '7574641500');
INSERT into CUSTOMER values('DC2096657', 'Don Vito', 'Corleone', '3912 Cotton Hills Autoroute', 'Polecat Landing', 'VA', '24203-9322', '7032096657');
INSERT into CUSTOMER values('HS6262895', 'Han', 'Solo', '9899 Jagged Swale', 'Shaunavon', 'VA', '23162-1934', '7036262895');
INSERT into CUSTOMER values('MR4501070', 'Mad Max', 'Rockatansky', '9871 Hazy Estates', 'Latexo', 'VA', '23099-2967', '7034501070');

INSERT into DISTRIBUTOR values('SD2251170', 'Super D', '17822 Gillette Ave #A', 'Irvine', 'CA', 92614, '9492251170');
INSERT into DISTRIBUTOR values('IE4900031', 'Ingram Entertainment!, INC.', '8779 Greenwood Place', 'Savage', 'MD', '20763', '3014900031');
INSERT into DISTRIBUTOR values('SC7482050', 'Sumner Communications, INC.', '24 Stony Hill Road', 'Bethel', 'CT', '06801-1166', '2037482050');
INSERT into DISTRIBUTOR values('DE8070660', 'Deuce Entertainment, LLC.', '600 S. Wanamaker Avenue', 'Ontario', 'CA', '91761', '3108070660');
INSERT into DISTRIBUTOR values('VPD3662111', 'Video Products Distributors', '150 Parkshore Drive', 'Folsom', 'CA', '95630', '8003662111');

INSERT into SHIPMENT values('300Murro20140615', 'SD2251170', '50', '500.00', 'Delivered', '');
INSERT into SHIPMENT values('RobPadilha20140613', 'IE4900031', '30', '299.70', 'Delivered', '');
INSERT into SHIPMENT values('ShaBranagh20140610', 'SC7482050', '45', '382.50', 'Delivered', '');
INSERT into SHIPMENT values('WolScorsese20140528', 'DE8070660', '40', '340.00', 'Delivered', '');
INSERT into SHIPMENT values('RidStory20140522', 'VPD3662111', '25', '175.00', 'Delivered', '');

INSERT into INVENTORY values('3001684', '300Murro', '300Murro20140615');
INSERT into INVENTORY values('3001685', '300Murro', '300Murro20140615');
INSERT into INVENTORY values('3001686', '300Murro', '300Murro20140615');
INSERT into INVENTORY values('Rob28756', 'RobPadilha', 'RobPadilha20140613');
INSERT into INVENTORY values('Rob28757', 'RobPadilha', 'RobPadilha20140613');

INSERT into RENTAL values('TM30020140701', 'TM5078464', '3001684', '2014-06-01', '2014-06-02');
INSERT into RENTAL values('RBROB20140701', 'RB4641500', 'Rob28756', '2014-07-01', '2014-07-03');
INSERT into RENTAL values('DC30020140702', 'DC2096657', '3001685', '2014-07-02', '');
INSERT into RENTAL values('HSROB20140702', 'HS6262895', 'Rob28757', '2014-07-02', '');
INSERT into RENTAL values('MR30020140702', 'MR4501070', '3001686', '2014-07-02', '');
