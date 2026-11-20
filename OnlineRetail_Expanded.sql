Create Database OnlineRetail;

-- Entity
CREATE TABLE Users
(
    userid INT NOT NULL
    ,name VARCHAR(20)
    ,phoneNumber VARCHAR(20)
    ,PRIMARY KEY(userid)
);

CREATE TABLE Buyer
(
    userid INT NOT NULL
    ,PRIMARY KEY(userid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Seller
(
    userid INT NOT NULL
    ,PRIMARY KEY(userid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE BankCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,expiryDate DATE
    ,bank VARCHAR(20)
    ,PRIMARY KEY(cardNumber)
);

CREATE TABLE
CreditCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,userid INT NOT NULL
    ,organization VARCHAR(20)
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES BankCard(cardNumber)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE DebitCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,userid INT NOT NULL
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES BankCard(cardNumber)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Address
(
    addrid INT NOT NULL
    ,userid INT NOT NULL
    ,name VARCHAR(50)
    ,contactPhoneNumber VARCHAR(20)
    ,province VARCHAR(100)
    ,city VARCHAR(100)
    ,streetaddr VARCHAR(100)
    ,postCode VARCHAR(12)
    ,PRIMARY KEY(addrid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Store
(
    sid INT NOT NULL
    ,name VARCHAR(20)
    ,province VARCHAR(20)
    ,city VARCHAR(20)
    ,streetaddr VARCHAR(20)
    ,customerGrade INT
    ,startTime DATE
    ,PRIMARY KEY(sid)
);

CREATE TABLE Brand
(
    brandName VARCHAR(20) NOT NULL
    ,PRIMARY KEY (brandName)
);

CREATE TABLE Product
(
    pid INT NOT NULL
    ,sid INT NOT NULL
    ,brand VARCHAR(50) NOT NULL
    ,name VARCHAR(100)
    ,type VARCHAR(50)
    ,modelNumber VARCHAR(50)
    ,color VARCHAR(50)
    ,amount INT
    ,price INT
    ,PRIMARY KEY(pid)
    ,FOREIGN KEY(sid) REFERENCES Store(sid)
    ,FOREIGN KEY(brand) REFERENCES Brand(brandName)
);

CREATE TABLE OrderItem
(
    itemid INT NOT NULL
    ,pid INT NOT NULL
    ,price INT
    ,creationTime DATE
    ,PRIMARY KEY(itemid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Orders
(
    orderNumber INT NOT NULL
    ,paymentState VARCHAR(12)
    ,creationTime DATE
    ,totalAmount INT
    ,PRIMARY KEY (orderNumber)
);


CREATE TABLE Comments  
(
    creationTime DATE NOT NULL
    ,userid INT NOT NULL
    ,pid INT NOT NULL
    ,grade FLOAT
    ,content VARCHAR(500)
    ,PRIMARY KEY(creationTime,userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(userid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE ServicePoint
(
    spid INT NOT NULL
    ,streetaddr VARCHAR(40)
    ,city VARCHAR(30)
    ,province VARCHAR(20)
    ,startTime VARCHAR(20)
    ,endTime VARCHAR(20)
    ,PRIMARY KEY(spid)
);
-- Relationship

CREATE TABLE Save_to_Shopping_Cart
(
    userid INT NOT NULL
    ,pid INT NOT NULL
    ,addTime DATE
    ,quantity INT
    ,PRIMARY KEY (userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(userid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Contain
(
    orderNumber INT NOT NULL
    ,itemid INT NOT NULL
    ,quantity INT
    ,PRIMARY KEY (orderNumber,itemid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(itemid) REFERENCES OrderItem(itemid)
);

CREATE TABLE Payment
(
    orderNumber INT NOT NULL
    ,creditcardNumber VARCHAR(25) NOT NULL
    ,payTime DATE
    ,PRIMARY KEY(orderNumber,creditcardNumber)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(creditcardNumber) REFERENCES CreditCard(cardNumber)
);

CREATE TABLE Deliver_To
(
    addrid INT NOT NULL
    ,orderNumber INT NOT NULL
    ,TimeDelivered DATE
    ,PRIMARY KEY(addrid,orderNumber)
    ,FOREIGN KEY(addrid) REFERENCES Address(addrid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
);

CREATE TABLE Manage
(
    userid INT NOT NULL
    ,sid INT NOT NULL
    ,SetUpTime DATE
    ,PRIMARY KEY(userid,sid)
    ,FOREIGN KEY(userid) REFERENCES Seller(userid)
    ,FOREIGN KEY(sid) REFERENCES Store(sid)
);

CREATE TABLE After_Sales_Service_At
(
    brandName VARCHAR(20) NOT NULL
    ,spid INT NOT NULL
    ,PRIMARY KEY(brandName, spid)
    ,FOREIGN KEY(brandName) REFERENCES Brand (brandName)
    ,FOREIGN KEY(spid) REFERENCES ServicePoint(spid)
);

-- Insert Values for the tables
INSERT INTO users (userid,name,phoneNumber) VALUES (1,'Leonard Carroll','809-902-4957');
INSERT INTO users (userid,name,phoneNumber) VALUES (2,'Sybill C. Kane','797-156-7733');
INSERT INTO users (userid,name,phoneNumber) VALUES (3,'Ryder Stanton','857-833-6279');
INSERT INTO users (userid,name,phoneNumber) VALUES (4,'Owen Robbins','102-490-9669');
INSERT INTO users (userid,name,phoneNumber) VALUES (5,'Tyrone D. Harvey','364-220-7833');
INSERT INTO users (userid,name,phoneNumber) VALUES (6,'Tanek T. Noble','577-561-5445');
INSERT INTO users (userid,name,phoneNumber) VALUES (7,'Tanek X. Bridges','817-736-8954');
INSERT INTO users (userid,name,phoneNumber) VALUES (8,'Latifah Q. Erickson','500-413-5229');
INSERT INTO users (userid,name,phoneNumber) VALUES (9,'Geoffrey Erickson','311-237-5037');
INSERT INTO users (userid,name,phoneNumber) VALUES (10,'Galvin Hart','501-807-7965');
INSERT INTO users (userid,name,phoneNumber) VALUES (11,'Nolan Cummings','931-805-0046');
INSERT INTO users (userid,name,phoneNumber) VALUES (12,'Inga K. Gonzales','736-865-1874');
INSERT INTO users (userid,name,phoneNumber) VALUES (13,'Orson Dale','997-968-1425');
INSERT INTO users (userid,name,phoneNumber) VALUES (14,'Rahim Mcdowell','554-339-3873');
INSERT INTO users (userid,name,phoneNumber) VALUES (15,'Louis Mcguire','725-145-0036');
INSERT INTO users (userid,name,phoneNumber) VALUES (16,'Kyra Bell','627-635-5250');
INSERT INTO users (userid,name,phoneNumber) VALUES (17,'Kylee U. Hebert','906-664-4111');
INSERT INTO users (userid,name,phoneNumber) VALUES (18,'Cora Collins','308-345-2108');
INSERT INTO users (userid,name,phoneNumber) VALUES (19,'Mara Murray','794-251-3294');
INSERT INTO users (userid,name,phoneNumber) VALUES (20,'Blair N. Weeks','563-321-0004');
INSERT INTO users (userid,name,phoneNumber) VALUES (21,'Walter Callahan','568-397-1819');
INSERT INTO users (userid,name,phoneNumber) VALUES (22,'Brynne V. Hayes','181-495-6507');
INSERT INTO users (userid,name,phoneNumber) VALUES (23,'Hedy U. Wise','499-991-2743');
INSERT INTO users (userid,name,phoneNumber) VALUES (24,'Nevada Langley','619-882-8501');
INSERT INTO users (userid,name,phoneNumber) VALUES (25,'Sasha Church','853-381-3371');
INSERT INTO users (userid,name,phoneNumber) VALUES (26,'Tamekah Cantu','332-466-8999');
INSERT INTO users (userid,name,phoneNumber) VALUES (27,'Regan R. Cook','280-150-3915');
INSERT INTO users (userid,name,phoneNumber) VALUES (28,'Christian England','385-898-0420');
INSERT INTO users (userid,name,phoneNumber) VALUES (29,'Kevyn P. Cox','768-396-9425');
INSERT INTO users (userid,name,phoneNumber) VALUES (30,'Leah B. Franklin','853-688-0957');
INSERT INTO users (userid,name,phoneNumber) VALUES (31,'Urielle Humphrey','926-331-0012');
INSERT INTO users (userid,name,phoneNumber) VALUES (32,'Kendall Lane','661-911-8866');
INSERT INTO users (userid,name,phoneNumber) VALUES (33,'Ezra Randolph','922-755-8559');
INSERT INTO users (userid,name,phoneNumber) VALUES (34,'Ashton Maddox','523-845-2705');
INSERT INTO users (userid,name,phoneNumber) VALUES (35,'Sopoline Spence','614-499-4578');
INSERT INTO users (userid,name,phoneNumber) VALUES (36,'Justin Guerrero','516-139-5882');
INSERT INTO users (userid,name,phoneNumber) VALUES (37,'Phoebe S. Wynn','264-976-8713');
INSERT INTO users (userid,name,phoneNumber) VALUES (38,'Noble R. Flynn','501-240-1875');
INSERT INTO users (userid,name,phoneNumber) VALUES (39,'Buffy S. Chandler','859-284-1514');
INSERT INTO users (userid,name,phoneNumber) VALUES (40,'Finn Hood','183-267-5415');
INSERT INTO users (userid,name,phoneNumber) VALUES (41,'Alea V. Brewer','482-150-4868');
INSERT INTO users (userid,name,phoneNumber) VALUES (42,'Elvis M. Watkins','634-901-1779');
INSERT INTO users (userid,name,phoneNumber) VALUES (43,'Shafira T. Frank','483-164-3378');
INSERT INTO users (userid,name,phoneNumber) VALUES (44,'Beck C. Herman','738-418-4743');
INSERT INTO users (userid,name,phoneNumber) VALUES (45,'Minerva V. William','539-390-0106');
INSERT INTO users (userid,name,phoneNumber) VALUES (46,'Dahlia Walls','953-437-1177');
INSERT INTO users (userid,name,phoneNumber) VALUES (47,'Travis Savage','640-362-9129');
INSERT INTO users (userid,name,phoneNumber) VALUES (48,'Illana Gallegos','762-486-9320');
INSERT INTO users (userid,name,phoneNumber) VALUES (49,'Sylvia N. Santos','375-164-3524');
INSERT INTO users (userid,name,phoneNumber) VALUES (50,'Baxter O. May','346-460-2655');
INSERT INTO users (userid,name,phoneNumber) VALUES (51,'Glenna Dalton','913-377-4551');
INSERT INTO users (userid,name,phoneNumber) VALUES (52,'Tiger C. Nieves','693-911-2291');
INSERT INTO users (userid,name,phoneNumber) VALUES (53,'Mona M. Hurley','238-367-9905');
INSERT INTO users (userid,name,phoneNumber) VALUES (54,'Isadora Y. Durham','284-851-0165');
INSERT INTO users (userid,name,phoneNumber) VALUES (55,'Ryder Osborn','721-853-4940');
INSERT INTO users (userid,name,phoneNumber) VALUES (56,'Blaze B. Aguirre','916-218-1512');
INSERT INTO users (userid,name,phoneNumber) VALUES (57,'Summer V. Frazier','879-742-3407');
INSERT INTO users (userid,name,phoneNumber) VALUES (58,'Lynn J. Sullivan','340-319-3768');
INSERT INTO users (userid,name,phoneNumber) VALUES (59,'Faith M. Wood','908-750-3533');
INSERT INTO users (userid,name,phoneNumber) VALUES (60,'Jakeem Velazquez','801-187-8092');
INSERT INTO users (userid,name,phoneNumber) VALUES (61,'Adria Fields','755-909-1768');
INSERT INTO users (userid,name,phoneNumber) VALUES (62,'Colby Mathews','294-493-0304');
INSERT INTO users (userid,name,phoneNumber) VALUES (63,'Graiden O. Graves','217-211-8998');
INSERT INTO users (userid,name,phoneNumber) VALUES (64,'Reece U. Case','984-206-6405');
INSERT INTO users (userid,name,phoneNumber) VALUES (65,'Calvin A. Wiley','134-482-7453');
INSERT INTO users (userid,name,phoneNumber) VALUES (66,'Hanna T. Stevens','896-641-3132');
INSERT INTO users (userid,name,phoneNumber) VALUES (67,'Dominic Fleming','833-252-1580');
INSERT INTO users (userid,name,phoneNumber) VALUES (68,'Garrett Goodwin','618-577-5738');
INSERT INTO users (userid,name,phoneNumber) VALUES (69,'Charissa Dillard','213-729-8239');
INSERT INTO users (userid,name,phoneNumber) VALUES (70,'Laurel C. Morales','847-648-1831');
INSERT INTO users (userid,name,phoneNumber) VALUES (71,'Cathleen W. Burnett','956-194-4659');
INSERT INTO users (userid,name,phoneNumber) VALUES (72,'Genevieve Whitney','919-463-1871');
INSERT INTO users (userid,name,phoneNumber) VALUES (73,'Iola Gonzales','593-480-8818');
INSERT INTO users (userid,name,phoneNumber) VALUES (74,'Aline Hampton','193-284-2494');
INSERT INTO users (userid,name,phoneNumber) VALUES (75,'Lucy Q. Andrews','593-876-6529');
INSERT INTO users (userid,name,phoneNumber) VALUES (76,'Athena P. Gray','393-826-7570');
INSERT INTO users (userid,name,phoneNumber) VALUES (77,'Violet S. Underwood','425-483-4304');
INSERT INTO users (userid,name,phoneNumber) VALUES (78,'Lev Phillips','281-817-4060');
INSERT INTO users (userid,name,phoneNumber) VALUES (79,'Deanna Z. Snider','444-315-3902');
INSERT INTO users (userid,name,phoneNumber) VALUES (80,'Otto U. Frye','384-258-6411');
INSERT INTO users (userid,name,phoneNumber) VALUES (81,'Tatiana Dickson','180-578-2636');
INSERT INTO users (userid,name,phoneNumber) VALUES (82,'Cathleen R. Aguilar','577-690-7062');
INSERT INTO users (userid,name,phoneNumber) VALUES (83,'Sylvester H. Wiley','914-931-6799');
INSERT INTO users (userid,name,phoneNumber) VALUES (84,'Xander G. Thornton','871-337-1836');
INSERT INTO users (userid,name,phoneNumber) VALUES (85,'Rooney Hunter','857-195-6423');
INSERT INTO users (userid,name,phoneNumber) VALUES (86,'Theodore G. Macias','412-369-2301');
INSERT INTO users (userid,name,phoneNumber) VALUES (87,'Britanney Boyer','493-286-6876');
INSERT INTO users (userid,name,phoneNumber) VALUES (88,'Wang Harper','923-883-5069');
INSERT INTO users (userid,name,phoneNumber) VALUES (89,'Benjamin V. Young','652-797-0120');
INSERT INTO users (userid,name,phoneNumber) VALUES (90,'Gray Z. Conner','202-685-6363');
INSERT INTO users (userid,name,phoneNumber) VALUES (91,'Amal Mccoy','419-663-7344');
INSERT INTO users (userid,name,phoneNumber) VALUES (92,'Kyra G. Reed','990-385-6303');
INSERT INTO users (userid,name,phoneNumber) VALUES (93,'Reuben Gilmore','749-575-5329');
INSERT INTO users (userid,name,phoneNumber) VALUES (94,'Thomas G. Robles','231-847-0873');
INSERT INTO users (userid,name,phoneNumber) VALUES (95,'Kylynn L. Hardin','606-903-9466');
INSERT INTO users (userid,name,phoneNumber) VALUES (96,'Regina F. Larsen','338-386-8025');
INSERT INTO users (userid,name,phoneNumber) VALUES (97,'Xantha U. Graham','146-582-9214');
INSERT INTO users (userid,name,phoneNumber) VALUES (98,'Adara N. Leonard','902-263-9357');
INSERT INTO users (userid,name,phoneNumber) VALUES (99,'Ashton V. Hubbard','320-269-9789');
INSERT INTO users (userid,name,phoneNumber) VALUES (100,'Robert Lester','579-713-6386');



INSERT INTO buyer VALUES (5);
INSERT INTO buyer VALUES (41);
INSERT INTO buyer VALUES (18);
INSERT INTO buyer VALUES (12);
INSERT INTO buyer VALUES (24);
INSERT INTO buyer VALUES (16);
INSERT INTO buyer VALUES (17);
INSERT INTO buyer VALUES (85);
INSERT INTO buyer VALUES (56);
INSERT INTO buyer VALUES (66);
INSERT INTO buyer VALUES (33);
INSERT INTO buyer VALUES (28);
INSERT INTO buyer VALUES (9);

INSERT INTO seller VALUES (1);
INSERT INTO seller VALUES (15);
INSERT INTO seller VALUES (30);
INSERT INTO seller VALUES (32);
INSERT INTO seller VALUES (61);
INSERT INTO seller VALUES (63);
INSERT INTO seller VALUES (10);
INSERT INTO seller VALUES (9);
INSERT INTO seller VALUES (4);
INSERT INTO seller VALUES (88);

INSERT INTO address VALUES (1,28,'Haviva F. Davidson','915-791-0670','Ontario','Ottawa-Carleton','8484 Nonummy Av.','N0C 7E0');
INSERT INTO address VALUES (2,21,'Rae R. Lara','495-472-7273','Ontario','St. Catharines','5836 Iaculis Avenue','L7M 2V6');
INSERT INTO address VALUES (3,36,'Ashely O. Knowles','895-493-8279','British Columbia','Hudson''s Hope','P.O. Box 827, 1825 Fusce Ave','V7A 5A6');
INSERT INTO address VALUES (4,11,'Hollee G. Hudson','516-753-9880','Quebec','Baie-Comeau','9376 Imperdiet Street','G4J 8Y2');
INSERT INTO address VALUES (5,39,'Kylynn G. Waller','838-912-3476','Quebec','Neuville','Ap #179-5810 Nunc Rd.','G9K 8Y6');
INSERT INTO address VALUES (6,38,'Audra Manning','898-140-2501','Manitoba','Daly','732-9599 Lacinia Rd.','R1X 3Z2');
INSERT INTO address VALUES (7,9,'Zia Guzman','781-454-1244','Ontario','Cornwall','Ap #553-1602 Sit Av.','M4G 2Y2');
INSERT INTO address VALUES (8,12,'Xerxes Luna','841-769-6638','Quebec','Verdun','P.O. Box 210, 6443 Donec Road','G5L 7P4');
INSERT INTO address VALUES (9,25,'Azalia P. Hooper','116-526-3919','Quebec','Lachine','Ap #379-4986 Odio. Rd.','H3P 9J4');
INSERT INTO address VALUES (10,32,'Dahlia Rojas','916-981-2927','Ontario','Vaughan','Ap #642-6556 Adipiscing St.','L4T 4A3');
INSERT INTO address VALUES (11,11,'Melanie Duran','440-799-4382','Ontario','Tay','565-8573 Et Road','M0K 5N9');
INSERT INTO address VALUES (12,19,'Nyssa S. Maynard','861-136-6572','Prince Edward Island','Montague','P.O. Box 794, 5616 Gravida Rd.','C5Z 2Z0');
INSERT INTO address VALUES (13,38,'Hilary I. Boone','618-129-6884','British Columbia','Sooke','P.O. Box 594, 5086 At Avenue','V9W 0S9');
INSERT INTO address VALUES (14,17,'Aileen B. Pratt','785-162-9219','Quebec','Montreal','654-6775 Primis Av.','G7H 5E9');
INSERT INTO address VALUES (15,14,'Rudyard O. Kent','896-514-6693','Alberta','Wood Buffalo','271-2092 Enim. Av.','T6E 3R8');
INSERT INTO address VALUES (16,24,'Quentin Lewis','616-464-2316','Quebec','Pointe-au-Pic','P.O. Box 331, 348 Ut Rd.','J7M 7X5');
INSERT INTO address VALUES (17,33,'Alan A. Norton','229-829-6509','Ontario','Ottawa','700-385 Augue, Road','K9C 5N6');
INSERT INTO address VALUES (18,11,'Sigourney U. Stevens','206-582-2529','Alberta','Lamont','7636 Felis, Av.','T5X 9Y0');
INSERT INTO address VALUES (19,34,'Kevyn Hines','146-355-8639','Alberta','Sylvan Lake','578-8255 Amet Rd.','T4N 2R9');
INSERT INTO address VALUES (20,34,'Tyler O. Curry','111-353-8652','Quebec','Baie-Comeau','171-701 Semper Street','H3H 0J1');
INSERT INTO address VALUES (21,32,'Nola Y. Mcmahon','826-961-6244','Saskatchewan','Calder','477-5078 Dolor Street','S2X 2E7');
INSERT INTO address VALUES (22,34,'Drake Witt','464-747-5669','Nova Scotia','Pugwash','6574 Ipsum Av.','B9S 5E9');
INSERT INTO address VALUES (23,39,'Valentine Y. Peterson','175-217-1821','Alberta','Westlock','Ap #338-3056 Justo. St.','T5S 5V8');
INSERT INTO address VALUES (24,20,'Daphne Munoz','841-264-2751','Ontario','Midlands','7408 Pharetra Rd.','N8M 0B3');
INSERT INTO address VALUES (25,34,'Thomas O. Morse','700-652-8089','Saskatchewan','Estevan','P.O. Box 537, 4062 Mauris Ave','S0H 8L8');
INSERT INTO address VALUES (26,15,'Dahlia H. Fox','747-633-8010','Ontario','Russell','Ap #248-8859 Feugiat. Street','L6V 8K8');
INSERT INTO address VALUES (27,11,'Brian E. Cannon','305-973-3594','Quebec','Lévis','Ap #612-3420 Montes, Road','J4R 1Y8');
INSERT INTO address VALUES (28,13,'Cullen Vega','465-172-3435','Ontario','Burlington','P.O. Box 881, 6715 Dignissim Ave','K7M 8N4');
INSERT INTO address VALUES (29,20,'Bruce U. Blair','899-466-5745','Manitoba','Beausejour','P.O. Box 821, 8801 Diam Street','R9G 4Y7');
INSERT INTO address VALUES (30,6,'Ivan L. Barrett','626-422-8515','Ontario','St. Catharines','Ap #713-8042 Sit Street','K4N 0L5');
INSERT INTO address VALUES (31,34,'Jared X. Leonard','271-473-5902','Alberta','Rocky Mountain House','P.O. Box 900, 5389 Sagittis Avenue','T1C 1C5');
INSERT INTO address VALUES (32,37,'Daryl Terry','498-809-2944','Ontario','Quinte West','P.O. Box 960, 527 Tristique Avenue','K9C 4V9');
INSERT INTO address VALUES (33,39,'Melodie Reynolds','111-137-4809','Quebec','Valcourt','513-8244 Elit, Street','J2B 9Y6');
INSERT INTO address VALUES (34,29,'Robert Whitley','381-319-3443','Manitoba','Flin Flon','P.O. Box 896, 5501 Mauris Rd.','R6B 5B6');
INSERT INTO address VALUES (35,12,'Maggie B. Mccoy','230-943-0150','Ontario','St. Catharines','P.O. Box 996, 7765 Hendrerit Ave','N3H 8X2');
INSERT INTO address VALUES (36,32,'Isaiah X. Montoya','410-539-2283','Ontario','Grey County','274-9821 Consectetuer Road','N9X 1V2');
INSERT INTO address VALUES (37,30,'Fiona Ruiz','964-373-1028','Quebec','Dorval','Ap #396-5126 Ut Road','G1T 6B6');
INSERT INTO address VALUES (38,39,'Bree Bray','717-977-7726','Ontario','Scarborough','8565 Etiam St.','L5G 8K0');
INSERT INTO address VALUES (39,5,'TaShya Y. Buckley','779-640-3249','Quebec','Saint-Georges','Ap #881-9739 In Rd.','G0L 4E2');
INSERT INTO address VALUES (40,9,'Jason N. Contreras','454-369-2951','Quebec','Price','Ap #483-4891 In Ave','G4A 0Z4');
INSERT INTO address VALUES (41,30,'Alea A. Ortiz','717-521-9609','Alberta','Penhold','935-227 Dis St.','T4W 9W2');
INSERT INTO address VALUES (42,10,'Rhonda C. Luna','374-193-9903','Ontario','Kapuskasing','P.O. Box 990, 2280 Blandit. Rd.','K3C 7R1');
INSERT INTO address VALUES (43,18,'Ashton Sykes','687-799-5559','Prince Edward Island','Stratford','4199 Mollis. Av.','C1A 6P3');
INSERT INTO address VALUES (44,32,'Roanna Guy','412-193-7026','Quebec','Alma','2484 At St.','G0C 5W1');
INSERT INTO address VALUES (45,35,'Judah Wagner','982-952-2901','Newfoundland and Labrador','Marystown','537-9791 In St.','A0S 5J4');
INSERT INTO address VALUES (46,1,'Kimberley O. Taylor','992-637-8656','Quebec','Dubuisson','8844 Mollis Av.','J4Y 6J7');
INSERT INTO address VALUES (47,36,'Kieran Y. Sutton','239-332-3013','Alberta','Breton','Ap #980-7807 Morbi Av.','T5Y 2C4');
INSERT INTO address VALUES (48,11,'Audra Delacruz','335-263-4916','Newfoundland and Labrador','Fortune','Ap #640-8358 Nullam Rd.','A0S 1T7');
INSERT INTO address VALUES (49,5,'Lance Weeks','988-570-1631','Nova Scotia','Cape Breton Island','5297 Ante Street','B0V 6N6');
INSERT INTO address VALUES (50,15,'Lydia I. Cannon','326-839-5531','Ontario','Malahide','P.O. Box 155, 6071 Phasellus Ave','K9S 3K6');
INSERT INTO address VALUES (51,15,'Nichole M. Golden','639-480-6437','British Columbia','Kent','Ap #868-8497 Mauris Rd.','V3M 3G0');
INSERT INTO address VALUES (52,38,'Hop Bright','754-973-4196','Ontario','Caledon','P.O. Box 218, 9674 Ac Road','N1W 2Y7');
INSERT INTO address VALUES (53,11,'Slade Glenn','811-140-4603','Manitoba','Stonewall','2584 Fringilla St.','R7A 3J5');
INSERT INTO address VALUES (54,16,'Mariam A. Rodgers','869-516-3030','Ontario','Merrickville-Wolford','Ap #123-3481 Consequat Street','N0K 4W4');
INSERT INTO address VALUES (55,26,'Kareem G. Mayo','588-941-2918','Quebec','Lac-Serent','P.O. Box 310, 566 Eget Av.','J8A 9R4');
INSERT INTO address VALUES (56,27,'Donovan P. Olson','701-985-7619','Ontario','Orangeville','P.O. Box 255, 105 Ornare Ave','L5K 4G2');
INSERT INTO address VALUES (57,32,'Benedict Dejesus','896-978-9023','Quebec','Ville de Maniwaki','P.O. Box 133, 3382 Dictum Av.','J1R 7P6');
INSERT INTO address VALUES (58,26,'Brady Gibbs','269-303-3275','Ontario','Newbury','4700 Quam Road','M1A 2X2');
INSERT INTO address VALUES (59,31,'Denton H. Jenkins','661-758-1597','Ontario','Pickering','304 Luctus St.','K1V 4W0');
INSERT INTO address VALUES (60,12,'Cameron Snow','518-850-7423','British Columbia','Hope','7675 Elit. Rd.','V4N 3Y0');
INSERT INTO address VALUES (61,18,'Tanya Armstrong','483-743-4109','Quebec','Baie-Comeau','P.O. Box 718, 3678 Quisque Street','H7G 3K0');
INSERT INTO address VALUES (62,32,'Hammett Vinson','263-446-2540','British Columbia','Comox','P.O. Box 238, 9700 Sed Ave','V2W 5A1');
INSERT INTO address VALUES (63,30,'Tasha F. Johnson','984-260-8520','Quebec','Lévis','Ap #427-4974 A Rd.','G2R 1K3');
INSERT INTO address VALUES (64,29,'Shad U. Gallegos','567-187-9734','Ontario','Whitby','Ap #839-9525 Nulla Ave','K0Y 4S2');
INSERT INTO address VALUES (65,2,'Kim Parrish','439-545-6591','Manitoba','Minitonas','P.O. Box 676, 2077 Orci. Rd.','R5G 5K2');
INSERT INTO address VALUES (66,28,'Summer X. Page','883-290-9218','Saskatchewan','Lang','500-9567 Luctus Avenue','S7K 2K8');
INSERT INTO address VALUES (67,9,'Daryl Leach','301-543-7000','New Brunswick','Campbellton','P.O. Box 375, 1934 Neque Avenue','E5X 4T9');
INSERT INTO address VALUES (68,5,'Meredith Carroll','228-134-5659','British Columbia','Qualicum Beach','Ap #774-629 Enim. Rd.','V2Y 0H6');
INSERT INTO address VALUES (69,34,'Jade Black','653-593-3191','Ontario','Aurora','P.O. Box 963, 3155 Ac Avenue','N1T 2Z3');
INSERT INTO address VALUES (70,9,'Angela Head','462-990-3984','British Columbia','Mission','Ap #682-4133 Felis Road','V1A 8R6');
INSERT INTO address VALUES (71,23,'Jakeem Harvey','115-177-3031','Ontario','Merrickville-Wolford','Ap #666-9799 Ridiculus Street','K2G 5Z3');
INSERT INTO address VALUES (72,16,'Colleen M. King','506-439-2552','Quebec','Carleton','306 Ac, Road','J4V 8C1');
INSERT INTO address VALUES (73,14,'Daquan S. Sellers','115-233-3748','Quebec','Dorval','P.O. Box 918, 1473 Ac Avenue','J0E 4S5');
INSERT INTO address VALUES (74,39,'Jasmine Mercado','809-324-1682','Manitoba','Winnipeg','4965 Dui. Av.','R0Z 0P6');
INSERT INTO address VALUES (75,24,'Irene Levine','736-297-2950','Ontario','Hamilton','828-4504 In Avenue','M2T 7S8');
INSERT INTO address VALUES (76,6,'Keegan X. Webb','346-295-6332','British Columbia','Oliver','4385 Mauris Av.','V4E 5A2');
INSERT INTO address VALUES (77,9,'Iola Osborne','732-970-8724','Ontario','Guelph','765-6138 Rhoncus. Avenue','N0V 1K6');
INSERT INTO address VALUES (78,30,'Alexandra Bridges','668-956-6165','Ontario','Northumberland','Ap #430-5072 Ut Rd.','L6H 1N3');
INSERT INTO address VALUES (79,12,'Sylvester G. Dixon','296-196-1745','Ontario','Kitchener','P.O. Box 985, 8040 Mauris Avenue','K9A 2H7');
INSERT INTO address VALUES (80,25,'Hillary E. Christensen','954-617-8483','Ontario','Markham','P.O. Box 650, 8382 Amet Road','K0H 4S1');
INSERT INTO address VALUES (81,19,'Shad Grimes','745-755-7427','British Columbia','Hope','296-2991 Cras Rd.','V6J 0P0');
INSERT INTO address VALUES (82,7,'Raymond Z. Owen','976-147-0880','Quebec','Baie-Comeau','P.O. Box 595, 4902 Laoreet St.','H0W 9L6');
INSERT INTO address VALUES (83,1,'Cassady Kent','331-383-3817','Saskatchewan','Maple Creek','P.O. Box 435, 8107 Donec St.','S6M 4Z8');
INSERT INTO address VALUES (84,16,'Lee C. Cox','851-819-0204','Quebec','Labrecque','3521 Vel, Street','J5W 5C2');
INSERT INTO address VALUES (85,37,'Daniel G. Beach','221-894-7980','Ontario','Markham','4246 Praesent Rd.','P8P 9H6');
INSERT INTO address VALUES (86,10,'Justine V. Wolfe','187-940-4068','Nova Scotia','Guysborough','2185 Sem Rd.','B1N 4Y6');
INSERT INTO address VALUES (87,33,'Ruby Gutierrez','813-928-6273','Quebec','Batiscan','P.O. Box 684, 6160 Cras Road','H1J 1Z6');
INSERT INTO address VALUES (88,21,'Kitra N. Cabrera','265-914-8426','New Brunswick','Campbellton','P.O. Box 268, 4081 Suspendisse Street','E2J 3G6');
INSERT INTO address VALUES (89,11,'Astra Massey','835-156-4880','Alberta','Lethbridge','3795 Congue St.','T8B 4V4');
INSERT INTO address VALUES (90,6,'Kirby Case','742-850-9082','Alberta','Mayerthorpe','3673 Eu, Avenue','T0Z 8J1');
INSERT INTO address VALUES (91,27,'Deacon Thornton','750-890-5150','Quebec','Dorval','1795 Phasellus St.','G5E 3T1');
INSERT INTO address VALUES (92,36,'Bruno E. Potts','693-730-2896','Alberta','Picture Butte','Ap #399-7736 Vestibulum, Ave','T0P 7Z9');
INSERT INTO address VALUES (93,12,'Lyle E. Delacruz','504-478-0170','Quebec','Kirkland','5972 Velit Rd.','G9C 5S3');
INSERT INTO address VALUES (94,10,'Ira Mcguire','684-620-2873','Quebec','Dollard-des-Ormeaux','6447 Egestas. Road','J1A 7C0');
INSERT INTO address VALUES (95,29,'Halee R. Townsend','595-402-4968','British Columbia','Coquitlam','3945 Nisl. Rd.','V5H 2K2');
INSERT INTO address VALUES (96,32,'Lisandra Q. Wells','233-348-3006','Alberta','Beaumont','P.O. Box 529, 2204 Quis, St.','T9C 1P1');
INSERT INTO address VALUES (97,40,'Karina Valdez','440-133-7465','British Columbia','Fort St. John','P.O. Box 807, 7421 Praesent Rd.','V7G 3M8');
INSERT INTO address VALUES (98,12,'Farrah O. Potts','652-690-8838','Ontario','Orangeville','964-8682 Erat Rd.','L1G 0L7');
INSERT INTO address VALUES (99,9,'Eve Z. Figueroa','258-514-7449','British Columbia','Williams Lake','4890 Quis, Rd.','V4V 5N6');
INSERT INTO address VALUES (100,5,'Bruce P. Maynard','443-690-0335','Quebec','Montreal','Ap #830-7510 Eget Av.','J9G 9P2');

INSERT INTO bankcard VALUES('4023 1231 3431 8623', '2039-9-10','CIBC');
INSERT INTO bankcard VALUES('5872 8293 3321 0123', '2020-5-14','BMO');
INSERT INTO bankcard VALUES('4902 9212 3402 8831', '2027-7-01','CIBC');
INSERT INTO bankcard VALUES('5782 7293 8472 0318', '2028-8-15','CIBC');
INSERT INTO bankcard VALUES('4509 4462 9302 0716', '2030-1-30','CIBC');
INSERT INTO bankcard VALUES('8473 9299 8492 7361', '2024-6-20','BMO');
INSERT INTO bankcard VALUES('4457 4992 7391 0219', '2025-8-30','BMO');
INSERT INTO bankcard VALUES('5728 8391 7362 5381', '2035-5-20','CIBC');
INSERT INTO bankcard VALUES('7283 8982 8361 5593', '2029-4-14','BMO');
INSERT INTO bankcard VALUES('9238 2749 5738 5921', '2027-8-01','CIBC');
INSERT INTO bankcard VALUES('2839 8219 3728 2933', '2031-5-20','CIBC');

INSERT INTO creditcard VALUES('4902 9212 3402 8831',5,'VISA');
INSERT INTO creditcard VALUES('4023 1231 3431 8623',18,'MASTER');
INSERT INTO creditcard VALUES('8473 9299 8492 7361',41,'VISA');
INSERT INTO creditcard VALUES('7283 8982 8361 5593',24,'VISA');
INSERT INTO creditcard VALUES('9238 2749 5738 5921',12,'MASTER');
INSERT INTO creditcard VALUES('2839 8219 3728 2933',9,'VISA');


INSERT INTO debitcard VALUES('5872 8293 3321 0123', 15);
INSERT INTO debitcard VALUES('5728 8391 7362 5381', 30);
INSERT INTO debitcard VALUES('4457 4992 7391 0219', 32);
INSERT INTO debitcard VALUES('5782 7293 8472 0318', 1);
INSERT INTO debitcard VALUES('4509 4462 9302 0716', 3);


INSERT INTO store VALUES(8,'Choby Collection','Quebec','Montreal','No.2012 Sanguinet',4,'2006-5-30');
INSERT INTO store VALUES(10,'BestBuy','British Columbia','Vancouver','No.20 ShineStreet',5,'2002-8-05');
INSERT INTO store VALUES(39,'CoolGuy','Quebec','Montreal','No.1023 St-Catherine',3,'2012-2-24');
INSERT INTO store VALUES(77,'Your Favorite','Ontario','Toronto','No.3022 Saint Denis',4,'2015-7-25');
INSERT INTO store VALUES(218,'American Eagle','Quebec','Quebec city','No.5 Berri Street',2,'2004-11-17');

INSERT INTO Brand VALUES('Asus');
INSERT INTO Brand VALUES('Bose');
INSERT INTO Brand VALUES('Canon');
INSERT INTO Brand VALUES('DELL');
INSERT INTO Brand VALUES('GoPro');
INSERT INTO Brand VALUES('Microsoft');

INSERT INTO ServicePoint VALUES(27,'2045 Sanguinet Street','Montreal','Quebec','10:00 am','5:30 pm');
INSERT INTO ServicePoint VALUES(72,'37 Sherbrook Street','Montreal','Quebec','9:30 am','5:30 pm');
INSERT INTO ServicePoint VALUES(34,'45 St Denis Street','Montreal','Quebec','10:00 am','6:00 pm');
INSERT INTO ServicePoint VALUES(19,'1099 University street','Montreal','Quebec','10:00 am','5:30 pm');
INSERT INTO ServicePoint VALUES(9,'27 St Catherine Street','Quebec City','Quebec','10:00 am','5:30 pm');

INSERT INTO Product VALUES(1,8,'Asus','ASUS Chromebook 11.6 laptop','laptop','C201PA-DS02','navy blue',10,262);
INSERT INTO Product VALUES(2,10,'Bose','Bose QuietComfort 35 wireless headphone','headphone','759944-0010','black',100,449);
INSERT INTO Product VALUES(3,39,'Canon','Canon EOS Rebel T5','cameras','9126B003','black',50,500);
INSERT INTO Product VALUES(4,77,'DELL','DELL Ultra HD 4k Monitor P2715Q 27-Inch Screen LED-Lit Monitor','computer accessories','P2715Q','black',40,713);
INSERT INTO Product VALUES(5,218,'GoPro','GoPro HERO5','cameras','CHDHX-501-CA','black',80,599);
INSERT INTO Product VALUES(6,218,'Microsoft','Microsoft Xbox 360 Wired Controller for Windows','controllers','52A-00004','black',60,35);
INSERT INTO Product VALUES(7,8,'Microsoft','Microsoft Sculpt Ergonomic Wireless Bluetrack Desktop Keyboard','computer accessories','L5V-00003','black',70,126);
INSERT INTO Product VALUES(8,8,'Microsoft','Microsoft Surface Pro 4 i5 (128GB) with Wireless Media Adapter','laptop','CR5-00001','black',30,1350);




-- 100 additional Product records (Product now contains 108 rows and 9 columns)
INSERT INTO Product VALUES(9,8,'Asus','ASUS VivoBook 15 Laptop','laptop','X1504ZA-001','silver',390,800);
INSERT INTO Product VALUES(10,10,'Asus','ASUS ZenBook 14 Laptop','laptop','UX3402-002','silver',327,1213);
INSERT INTO Product VALUES(11,39,'Asus','ASUS Gaming Monitor 24','monitor','VG248QG-003','black',164,296);
INSERT INTO Product VALUES(12,77,'Asus','ASUS Wireless Router','networking','RT-AX55-004','white',81,149);
INSERT INTO Product VALUES(13,218,'Bose','Bose QuietComfort Earbuds','earbuds','QC-EARBUDS2-005','white',238,282);
INSERT INTO Product VALUES(14,8,'Bose','Bose SoundLink Speaker','speaker','SOUNDLINK-FLEX-006','red',135,195);
INSERT INTO Product VALUES(15,10,'Bose','Bose Noise Cancelling Headphones','headphone','NC-700-007','black',162,408);
INSERT INTO Product VALUES(16,39,'Canon','Canon EOS Mirrorless Camera','camera','EOS-R50-008','white',94,721);
INSERT INTO Product VALUES(17,77,'Canon','Canon PIXMA Wireless Printer','printer','PIXMA-G3470-009','black',136,173);
INSERT INTO Product VALUES(18,218,'Canon','Canon RF Camera Lens','camera accessories','RF50-F18-010','black',27,166);
INSERT INTO Product VALUES(19,8,'DELL','Dell Inspiron 14 Laptop','laptop','INS14-5430-011','silver',239,899);
INSERT INTO Product VALUES(20,10,'DELL','Dell UltraSharp Monitor 27','monitor','U2723QE-012','black',106,582);
INSERT INTO Product VALUES(21,39,'DELL','Dell Wireless Keyboard','computer accessories','KM3322W-013','black',293,50);
INSERT INTO Product VALUES(22,77,'DELL','Dell USB-C Docking Station','computer accessories','WD19S-014','black',85,228);
INSERT INTO Product VALUES(23,218,'GoPro','GoPro HERO Action Camera','camera','HERO12-015','black',102,431);
INSERT INTO Product VALUES(24,8,'GoPro','GoPro Enduro Battery','camera accessories','ADBAT-011-016','black',194,69);
INSERT INTO Product VALUES(25,10,'GoPro','GoPro Media Mod','camera accessories','AIMIC-001-017','black',91,36);
INSERT INTO Product VALUES(26,39,'Microsoft','Microsoft Surface Laptop','laptop','SURFACE-L5-018','black',168,1069);
INSERT INTO Product VALUES(27,77,'Microsoft','Microsoft Wireless Mouse','computer accessories','RJG-00001-019','black',254,17);
INSERT INTO Product VALUES(28,218,'Microsoft','Microsoft Xbox Wireless Controller','controller','QAT-00001-020','white',191,55);
INSERT INTO Product VALUES(29,8,'Microsoft','Microsoft Surface Keyboard','computer accessories','WS2-00025-021','black',148,108);
INSERT INTO Product VALUES(30,10,'Asus','ASUS VivoBook 15 Laptop','laptop','X1504ZA-022','silver',415,871);
INSERT INTO Product VALUES(31,39,'Asus','ASUS ZenBook 14 Laptop','laptop','UX3402-023','blue',352,1284);
INSERT INTO Product VALUES(32,77,'Asus','ASUS Gaming Monitor 24','monitor','VG248QG-024','black',189,367);
INSERT INTO Product VALUES(33,218,'Asus','ASUS Wireless Router','networking','RT-AX55-025','black',106,119);
INSERT INTO Product VALUES(34,8,'Bose','Bose QuietComfort Earbuds','earbuds','QC-EARBUDS2-026','white',263,252);
INSERT INTO Product VALUES(35,10,'Bose','Bose SoundLink Speaker','speaker','SOUNDLINK-FLEX-027','red',160,165);
INSERT INTO Product VALUES(36,39,'Bose','Bose Noise Cancelling Headphones','headphone','NC-700-028','silver',126,378);
INSERT INTO Product VALUES(37,77,'Canon','Canon EOS Mirrorless Camera','camera','EOS-R50-029','black',58,691);
INSERT INTO Product VALUES(38,218,'Canon','Canon PIXMA Wireless Printer','printer','PIXMA-G3470-030','white',100,244);
INSERT INTO Product VALUES(39,8,'Canon','Canon RF Camera Lens','camera accessories','RF50-F18-031','black',52,237);
INSERT INTO Product VALUES(40,10,'DELL','Dell Inspiron 14 Laptop','laptop','INS14-5430-032','black',264,970);
INSERT INTO Product VALUES(41,39,'DELL','Dell UltraSharp Monitor 27','monitor','U2723QE-033','black',131,552);
INSERT INTO Product VALUES(42,77,'DELL','Dell Wireless Keyboard','computer accessories','KM3322W-034','black',318,20);
INSERT INTO Product VALUES(43,218,'DELL','Dell USB-C Docking Station','computer accessories','WD19S-035','black',110,198);
INSERT INTO Product VALUES(44,8,'GoPro','GoPro HERO Action Camera','camera','HERO12-036','black',66,401);
INSERT INTO Product VALUES(45,10,'GoPro','GoPro Enduro Battery','camera accessories','ADBAT-011-037','black',158,39);
INSERT INTO Product VALUES(46,39,'GoPro','GoPro Media Mod','camera accessories','AIMIC-001-038','black',55,107);
INSERT INTO Product VALUES(47,77,'Microsoft','Microsoft Surface Laptop','laptop','SURFACE-L5-039','platinum',132,1140);
INSERT INTO Product VALUES(48,218,'Microsoft','Microsoft Wireless Mouse','computer accessories','RJG-00001-040','blue',279,10);
INSERT INTO Product VALUES(49,8,'Microsoft','Microsoft Xbox Wireless Controller','controller','QAT-00001-041','white',216,25);
INSERT INTO Product VALUES(50,10,'Microsoft','Microsoft Surface Keyboard','computer accessories','WS2-00025-042','silver',173,78);
INSERT INTO Product VALUES(51,39,'Asus','ASUS VivoBook 15 Laptop','laptop','X1504ZA-043','silver',440,841);
INSERT INTO Product VALUES(52,77,'Asus','ASUS ZenBook 14 Laptop','laptop','UX3402-044','silver',377,1254);
INSERT INTO Product VALUES(53,218,'Asus','ASUS Gaming Monitor 24','monitor','VG248QG-045','black',153,337);
INSERT INTO Product VALUES(54,8,'Asus','ASUS Wireless Router','networking','RT-AX55-046','white',70,190);
INSERT INTO Product VALUES(55,10,'Bose','Bose QuietComfort Earbuds','earbuds','QC-EARBUDS2-047','white',227,323);
INSERT INTO Product VALUES(56,39,'Bose','Bose SoundLink Speaker','speaker','SOUNDLINK-FLEX-048','red',124,135);
INSERT INTO Product VALUES(57,77,'Bose','Bose Noise Cancelling Headphones','headphone','NC-700-049','black',151,348);
INSERT INTO Product VALUES(58,218,'Canon','Canon EOS Mirrorless Camera','camera','EOS-R50-050','white',83,661);
INSERT INTO Product VALUES(59,8,'Canon','Canon PIXMA Wireless Printer','printer','PIXMA-G3470-051','black',125,214);
INSERT INTO Product VALUES(60,10,'Canon','Canon RF Camera Lens','camera accessories','RF50-F18-052','black',77,207);
INSERT INTO Product VALUES(61,39,'DELL','Dell Inspiron 14 Laptop','laptop','INS14-5430-053','silver',289,940);
INSERT INTO Product VALUES(62,77,'DELL','Dell UltraSharp Monitor 27','monitor','U2723QE-054','black',95,623);
INSERT INTO Product VALUES(63,218,'DELL','Dell Wireless Keyboard','computer accessories','KM3322W-055','black',282,91);
INSERT INTO Product VALUES(64,8,'DELL','Dell USB-C Docking Station','computer accessories','WD19S-056','black',74,168);
INSERT INTO Product VALUES(65,10,'GoPro','GoPro HERO Action Camera','camera','HERO12-057','black',91,371);
INSERT INTO Product VALUES(66,39,'GoPro','GoPro Enduro Battery','camera accessories','ADBAT-011-058','black',183,10);
INSERT INTO Product VALUES(67,77,'GoPro','GoPro Media Mod','camera accessories','AIMIC-001-059','black',80,77);
INSERT INTO Product VALUES(68,218,'Microsoft','Microsoft Surface Laptop','laptop','SURFACE-L5-060','black',157,1110);
INSERT INTO Product VALUES(69,8,'Microsoft','Microsoft Wireless Mouse','computer accessories','RJG-00001-061','black',304,58);
INSERT INTO Product VALUES(70,10,'Microsoft','Microsoft Xbox Wireless Controller','controller','QAT-00001-062','white',180,96);
INSERT INTO Product VALUES(71,39,'Microsoft','Microsoft Surface Keyboard','computer accessories','WS2-00025-063','black',137,149);
INSERT INTO Product VALUES(72,77,'Asus','ASUS VivoBook 15 Laptop','laptop','X1504ZA-064','silver',404,811);
INSERT INTO Product VALUES(73,218,'Asus','ASUS ZenBook 14 Laptop','laptop','UX3402-065','blue',341,1224);
INSERT INTO Product VALUES(74,8,'Asus','ASUS Gaming Monitor 24','monitor','VG248QG-066','black',178,307);
INSERT INTO Product VALUES(75,10,'Asus','ASUS Wireless Router','networking','RT-AX55-067','black',95,160);
INSERT INTO Product VALUES(76,39,'Bose','Bose QuietComfort Earbuds','earbuds','QC-EARBUDS2-068','white',252,293);
INSERT INTO Product VALUES(77,77,'Bose','Bose SoundLink Speaker','speaker','SOUNDLINK-FLEX-069','red',149,206);
INSERT INTO Product VALUES(78,218,'Bose','Bose Noise Cancelling Headphones','headphone','NC-700-070','silver',176,419);
INSERT INTO Product VALUES(79,8,'Canon','Canon EOS Mirrorless Camera','camera','EOS-R50-071','black',47,631);
INSERT INTO Product VALUES(80,10,'Canon','Canon PIXMA Wireless Printer','printer','PIXMA-G3470-072','white',89,184);
INSERT INTO Product VALUES(81,39,'Canon','Canon RF Camera Lens','camera accessories','RF50-F18-073','black',41,177);
INSERT INTO Product VALUES(82,77,'DELL','Dell Inspiron 14 Laptop','laptop','INS14-5430-074','black',253,910);
INSERT INTO Product VALUES(83,218,'DELL','Dell UltraSharp Monitor 27','monitor','U2723QE-075','black',120,593);
INSERT INTO Product VALUES(84,8,'DELL','Dell Wireless Keyboard','computer accessories','KM3322W-076','black',307,61);
INSERT INTO Product VALUES(85,10,'DELL','Dell USB-C Docking Station','computer accessories','WD19S-077','black',99,239);
INSERT INTO Product VALUES(86,39,'GoPro','GoPro HERO Action Camera','camera','HERO12-078','black',116,442);
INSERT INTO Product VALUES(87,77,'GoPro','GoPro Enduro Battery','camera accessories','ADBAT-011-079','black',208,10);
INSERT INTO Product VALUES(88,218,'GoPro','GoPro Media Mod','camera accessories','AIMIC-001-080','black',44,47);
INSERT INTO Product VALUES(89,8,'Microsoft','Microsoft Surface Laptop','laptop','SURFACE-L5-081','platinum',121,1080);
INSERT INTO Product VALUES(90,10,'Microsoft','Microsoft Wireless Mouse','computer accessories','RJG-00001-082','blue',268,28);
INSERT INTO Product VALUES(91,39,'Microsoft','Microsoft Xbox Wireless Controller','controller','QAT-00001-083','white',205,66);
INSERT INTO Product VALUES(92,77,'Microsoft','Microsoft Surface Keyboard','computer accessories','WS2-00025-084','silver',162,119);
INSERT INTO Product VALUES(93,218,'Asus','ASUS VivoBook 15 Laptop','laptop','X1504ZA-085','silver',429,882);
INSERT INTO Product VALUES(94,8,'Asus','ASUS ZenBook 14 Laptop','laptop','UX3402-086','silver',366,1295);
INSERT INTO Product VALUES(95,10,'Asus','ASUS Gaming Monitor 24','monitor','VG248QG-087','black',203,277);
INSERT INTO Product VALUES(96,39,'Asus','ASUS Wireless Router','networking','RT-AX55-088','white',120,130);
INSERT INTO Product VALUES(97,77,'Bose','Bose QuietComfort Earbuds','earbuds','QC-EARBUDS2-089','white',216,263);
INSERT INTO Product VALUES(98,218,'Bose','Bose SoundLink Speaker','speaker','SOUNDLINK-FLEX-090','red',113,176);
INSERT INTO Product VALUES(99,8,'Bose','Bose Noise Cancelling Headphones','headphone','NC-700-091','black',140,389);
INSERT INTO Product VALUES(100,10,'Canon','Canon EOS Mirrorless Camera','camera','EOS-R50-092','white',72,702);
INSERT INTO Product VALUES(101,39,'Canon','Canon PIXMA Wireless Printer','printer','PIXMA-G3470-093','black',114,255);
INSERT INTO Product VALUES(102,77,'Canon','Canon RF Camera Lens','camera accessories','RF50-F18-094','black',66,248);
INSERT INTO Product VALUES(103,218,'DELL','Dell Inspiron 14 Laptop','laptop','INS14-5430-095','silver',278,880);
INSERT INTO Product VALUES(104,8,'DELL','Dell UltraSharp Monitor 27','monitor','U2723QE-096','black',145,563);
INSERT INTO Product VALUES(105,10,'DELL','Dell Wireless Keyboard','computer accessories','KM3322W-097','black',271,31);
INSERT INTO Product VALUES(106,39,'DELL','Dell USB-C Docking Station','computer accessories','WD19S-098','black',63,209);
INSERT INTO Product VALUES(107,77,'GoPro','GoPro HERO Action Camera','camera','HERO12-099','black',80,412);
INSERT INTO Product VALUES(108,218,'GoPro','GoPro Enduro Battery','camera accessories','ADBAT-011-100','black',172,50);

INSERT INTO OrderItem VALUES(1,1,262,'2016-09-18');
INSERT INTO OrderItem VALUES(2,2,449,'2014-03-22');
INSERT INTO OrderItem VALUES(3,3,500,'2017-01-23');
INSERT INTO OrderItem VALUES(4,4,713,'2017-01-23');
INSERT INTO OrderItem VALUES(5,5,599,'2016-12-27');
INSERT INTO OrderItem VALUES(6,6,35,'2015-05-30');
INSERT INTO OrderItem VALUES(7,7,126,'2017-02-12');
INSERT INTO OrderItem VALUES(8,8,1350,'2016-12-27');
INSERT INTO OrderItem VALUES(9,1,262,'2015-02-13');
INSERT INTO OrderItem VALUES(10,5,599,'2015-08-22');

INSERT INTO Comments VALUES('2017-02-21',5,1,4.3,'The laptop works amazingly. It holds a 10 hour charge, is compact to wander with, the brightness/volume features are perfect.');
INSERT INTO Comments VALUES('2016-09-18',5,2,4.6,'These headphones are worth the money, yes even the CAD price. They sound good and the noise cancellation is incredible.');
INSERT INTO Comments VALUES('2014-03-22',12,3,4.7,'Someone always has a better camera. That being said, this is an admirable performer with enough features for most.');
INSERT INTO Comments VALUES('2017-01-23',12,4,4.8,'This monitor is simply amazing. My eyes are not getting any younger and this makes everything very crisp and clear. I can definitely notice the improvement over a 2560X1440 display. I am ordering another one!');
INSERT INTO Comments VALUES('2016-12-27',18,5,4.3,'It is the first Go Pro I have had and so far I am loving it, the voice control is great for when you have your hands busy or can not reach the buttons. The apps for camera pairing and video editing are just great as well');
INSERT INTO Comments VALUES('2015-05-30',24,6,4.5,'Works flawlessly. After plugging it in, Windows automatically installed the drivers for it, and it was working in a matter of moments. It is an actual Xbox controller so it feels solid. This was definitely a purchase I would make again.');
INSERT INTO Comments VALUES('2017-02-12',41,7,4.3,'Overall good keyboard and mouse. However the moment your USB receiver dies, the whole thing goes in the garbage.');
INSERT INTO Comments VALUES('2016-12-27',41,8,3.8,'I love my surface. I got it a couple of weeks ago. I amm a life time mac user, but I consider myself quite tech savvy. I think this is a great device.');
INSERT INTO Comments VALUES('2015-05-30',12,2,4.3,'I have been using it for a week now. For a short conclusion, i love the headset.');
INSERT INTO Comments VALUES('2015-08-22',18,1,5,'This was definitely an impulse buy on my part but has turned out to be one of the best things I have ever invested in for school!');
INSERT INTO Comments VALUES('2015-08-22',24,5,5,'First go pro I have ever purchased. Really impressed with the quality and ease of use. The stabilizer is awesome, do not need to warp stabilize a ton in adobe.');

INSERT INTO Save_to_Shopping_Cart VALUES(5,1,'2017-02-21',1);
INSERT INTO Save_to_Shopping_Cart VALUES(5,2,'2016-09-18',1);
INSERT INTO Save_to_Shopping_Cart VALUES(18,3,'2014-03-22',2);
INSERT INTO Save_to_Shopping_Cart VALUES(12,4,'2017-01-23',1);
INSERT INTO Save_to_Shopping_Cart VALUES(24,5,'2016-12-27',2);
INSERT INTO Save_to_Shopping_Cart VALUES(41,6,'2015-05-30',1);
INSERT INTO Save_to_Shopping_Cart VALUES(9,7,'2016-02-19',4);
INSERT INTO Save_to_Shopping_Cart VALUES(18,8,'2012-01-20',1);


INSERT INTO Manage VALUES(1,8,'2015-12-24');
INSERT INTO Manage VALUES(15,10,'2006-03-20');
INSERT INTO Manage VALUES(30,39,'2006-08-09');
INSERT INTO Manage VALUES(32,77,'2005-03-04');
INSERT INTO Manage VALUES(1,218,'2010-05-06');

INSERT INTO After_Sales_Service_At VALUES('Asus',27);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',27);
INSERT INTO After_Sales_Service_At VALUES('DELL',72);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',34);
INSERT INTO After_Sales_Service_At VALUES('Bose',34);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',19);
INSERT INTO After_Sales_Service_At VALUES('Canon',19);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',9);
INSERT INTO After_Sales_Service_At VALUES('DELL',9);
INSERT INTO After_Sales_Service_At VALUES('GoPro',9);

INSERT INTO Orders VALUES(76023921,'Paid','2016-09-18',315);
INSERT INTO Orders VALUES(23924831,'Paid','2014-03-22',174);
INSERT INTO Orders VALUES(87291231,'Unpaid','2017-01-23',102);
INSERT INTO Orders VALUES(58293123,'Unpaid','2016-12-27',928);
INSERT INTO Orders VALUES(12992012,'Paid','2015-05-30',203);
INSERT INTO Orders VALUES(59203012,'Paid','2017-02-12',87);
INSERT INTO Orders VALUES(91027482,'Unpaid','2016-12-27',187);
INSERT INTO Orders VALUES(72839301,'Unpaid','2015-02-13',293);
INSERT INTO Orders VALUES(93042135,'Paid','2015-08-22',52);
INSERT INTO Orders VALUES(74892932,'UnPaid','2016-02-19',77);
INSERT INTO Orders VALUES(83921201,'Paid','2017-01-03',301);
INSERT INTO Orders VALUES(73919231,'Paid','2014-02-11',20);
INSERT INTO Orders VALUES(84821231,'Paid','2014-11-02',18);

INSERT INTO Contain VALUES(76023921,1,1);
INSERT INTO Contain VALUES(76023921,2,2);
INSERT INTO Contain VALUES(23924831,3,1);
INSERT INTO Contain VALUES(87291231,4,2);
INSERT INTO Contain VALUES(58293123,5,1);
INSERT INTO Contain VALUES(12992012,6,1);
INSERT INTO Contain VALUES(12992012,7,1);
INSERT INTO Contain VALUES(59203012,8,1);
INSERT INTO Contain VALUES(91027482,9,1);
INSERT INTO Contain VALUES(72839301,10,1);
INSERT INTO Contain VALUES(93042135,1,1);
INSERT INTO Contain VALUES(93042135,2,1);
INSERT INTO Contain VALUES(93042135,3,1);
INSERT INTO Contain VALUES(82921201,4,4);
INSERT INTO Contain VALUES(84821231,5,3);
INSERT INTO Contain VALUES(73919231,6,2);
INSERT INTO Contain VALUES(83921201,7,5);


INSERT INTO deliver_to VALUES(39,87291231,'2017-02-17');
INSERT INTO deliver_to VALUES(1,12992012,'2015-6-10');
INSERT INTO deliver_to VALUES(7,76023921,'2015-10-04');
INSERT INTO deliver_to VALUES(12,59203012,'2017-02-20');
INSERT INTO deliver_to VALUES(14,93042135,'2015-09-08');

INSERT INTO Payment VALUES(23924831,'4902 9212 3402 8831','2016-08-23');
INSERT INTO Payment VALUES(87291231,'4023 1231 3431 8623','2016-08-07');
INSERT INTO Payment VALUES(58293123,'8473 9299 8492 7361','2016-09-07');
INSERT INTO Payment VALUES(12992012,'7283 8982 8361 5593','2015-02-23');
INSERT INTO Payment VALUES(59203012,'9238 2749 5738 5921','2013-09-07');
INSERT INTO Payment VALUES(91027482,'4902 9212 3402 8831','2017-02-01');
INSERT INTO Payment VALUES(72839301,'4902 9212 3402 8831','2016-10-23');
INSERT INTO Payment VALUES(93042135,'4023 1231 3431 8623','2016-10-07');
INSERT INTO Payment VALUES(91027482,'7283 8982 8361 5593','2017-02-01');
INSERT INTO Payment VALUES(84821231,'9238 2749 5738 5921','2017-01-23');
INSERT INTO Payment VALUES(73919231,'9238 2749 5738 5921','2016-10-23');
INSERT INTO Payment VALUES(83921201,'9238 2749 5738 5921','2017-02-01');



