/* Prompt:
Write t-sql script create 5 table with attributes like that (with keys):
- NHACUNGCAP(MaNCC, TenNCC, Email, ThanhPho, QuocGia) 
- MATHANG(MaMH, TenMH, MaNCC, DonGia, TinhTrang) 
- KHACHHANG(MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT)
- DONDATHANG(MaDDH, NgayDatHang, MaKH, TriGia)
- CHITIETDDH(MaCT, MaDDH, MaMH, DonGia, SoLuong) 
with type attributes below:
 MaNCC int, MaKH int, TenNCC varchar(40), HoTen varchar(50), Email varchar(40), DiaChi varchar(50), ThanhPho varchar(40), SoDT varchar(15), QuocGia varchar(40), MaDDH int, MaMH int , NgayDatHang datetime, TenMH varchar(50), TriGia decimal(12,2), DonGia decimal(12,2) ,MaCT int, TinhTrang {0, 1}, SoLuong int
*/
DROP DATABASE IF EXISTS Csdl_DonDatHang;
CREATE DATABASE Csdl_DonDatHang;
USE Csdl_DonDatHang;

--Create NHACUNGCAP table
CREATE TABLE NHACUNGCAP (
    MaNCC int PRIMARY KEY,
    TenNCC varchar(40),
    Email varchar(40),
    ThanhPho varchar(40),
    QuocGia varchar(40)
);

--Create MATHANG table
CREATE TABLE MATHANG (
    MaMH int PRIMARY KEY,
    TenMH varchar(50),
    MaNCC int FOREIGN KEY REFERENCES NHACUNGCAP(MaNCC),
    DonGia decimal(12,2),
    TinhTrang bit
);

--Create KHACHHANG table
CREATE TABLE KHACHHANG (
    MaKH int PRIMARY KEY,
    HoTen varchar(50),
    DiaChi varchar(50),
    ThanhPho varchar(40),
    QuocGia varchar(40),
    SoDT varchar(15)
);

--Create DONDATHANG table
CREATE TABLE DONDATHANG (
    MaDDH int PRIMARY KEY,
    NgayDatHang datetime,
    MaKH int FOREIGN KEY REFERENCES KHACHHANG(MaKH),
    TriGia decimal(12,2)
);

--Create CHITIETDDH table
CREATE TABLE CHITIETDDH (
    MaCT int PRIMARY KEY,
    MaDDH int FOREIGN KEY REFERENCES DONDATHANG(MaDDH),
    MaMH int FOREIGN KEY REFERENCES MATHANG(MaMH),
    DonGia decimal(12,2),
    SoLuong int
);

INSERT INTO KHACHHANG (MaKH, HoTen, DiaChi, ThanhPho, QuocGia, SoDT)
VALUES
(1, 'Maria Anders', NULL, 'Berlin', 'Germany', '030-0074321'),
(2, 'Ana Trujillo', NULL, 'Mexico D.F.', 'Mexico', '(5) 555-4729'),
(3, 'Antonio Moreno', NULL, 'Mexico D.F.', 'Mexico', '(5) 555-3932'),
(4, 'Thomas Hardy', NULL, 'London', 'UK', '(171) 555-7788'),
(5, 'Christina Berglund', NULL, 'Lulea', 'Sweden', '0921-12 34 65'),
(6, 'Hanna Moos', NULL, 'Mannheim', 'Germany', '0621-08460'),
(7, 'Frederique Citeaux', NULL, 'Strasbourg', 'France', '88.60.15.31'),
(8, 'Martin Sommer', NULL, 'Madrid', 'Spain', '(91) 555 22 82'),
(9, 'Laurence Lebihan', NULL, 'Marseille', 'France', '91.24.45.40'),
(10, 'Elizabeth Lincoln', NULL, 'Tsawassen', 'Canada', '(604) 555-4729'),
(11, 'Victoria Ashworth', NULL, 'London', 'UK', '(171) 555-1212'),
(12, 'Patricio Simpson', NULL, 'Buenos Aires', 'Argentina', '(1) 135-5555'),
(13, 'Francisco Chang', NULL, 'Mexico D.F.', 'Mexico', '(5) 555-3392'),
(14, 'Yang Wang', NULL, 'Bern', 'Switzerland', '0452-076545'),
(15, 'Pedro Afonso', NULL, 'Sao Paulo', 'Brazil', '(11) 555-7647'),
(16, 'Elizabeth Brown', NULL, 'London', 'UK', '(171) 555-2282'),
(17, 'Sven Ottlieb', NULL, 'Aachen', 'Germany', '0241-039123'),
(18, 'Janine Labrune', NULL, 'Nantes', 'France', '40.67.88.88'),
(19, 'Ann Devon', NULL, 'London', 'UK', '(171) 555-0297'),
(20, 'Roland Mendel', NULL, 'Graz', 'Austria', '7675-3425'),
(21, 'Aria Cruz', NULL, 'Sao Paulo', 'Brazil', '(11) 555-9857'),
(22, 'Diego Roel', NULL, 'Madrid', 'Spain', '(91) 555 94 44'),
(23, 'Martine Rance', NULL, 'Lille', 'France', '20.16.10.16'),
(24, 'Maria Larsson', NULL, 'Bracke', 'Sweden', '0695-34 67 21'),
(25, 'Peter Franken', NULL, 'Munchen', 'Germany', '089-0877310'),
(26, 'Carine Schmitt', NULL, 'Nantes', 'France', '40.32.21.21'),
(27,'Paolo Accorti',NULL,'Torino','Italy','011-4988260'),
(28,'Lino Rodriguez',NULL,'Lisboa','Portugal','(1) 354-2534'),
(29,'Eduardo Saavedra',NULL,'Barcelona','Spain','(93) 203 4560'),
(30,'Jose Pedro Freyre',NULL,'Sevilla','Spain','(95) 555 82 82'),
(31,'Andre Fonseca',NULL,'Campinas','Brazil','(11) 555-9482'),
(32,'Howard Snyder',NULL,'Eugene','USA','(503) 555-7555'),
(33,'Manuel Pereira',NULL,'Caracas','Venezuela','(2) 283-2951'),
(34,'Mario Pontes',NULL,'Rio de Janeiro','Brazil','(21) 555-0091'),
(35,'Carlos Hernandez',NULL,'San Cristobal','Venezuela','(5) 555-1340'),
(36,'Yoshi Latimer',NULL,'Elgin','USA','(503) 555-6874'),
(37,'Patricia McKenna',NULL,'Cork','Ireland','2967 542'),
(38,'Helen Bennett',NULL,'Cowes','UK','(198) 555-8888'),
(39,'Philip Cramer',NULL,'Brandenburg','Germany','0555-09876'),
(40,'Daniel Tonini',NULL,'Versailles','France','30.59.84.10');

INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Email, ThanhPho, QuocGia) VALUES
(1, 'Exotic Liquids', NULL, 'London', 'UK'),
(2, 'New Orleans Cajun Delights', NULL, 'New Orleans', 'USA'),
(3, 'Grandma Kelly''s Homestead', NULL, 'Ann Arbor', 'USA'),
(4, 'Tokyo Traders', NULL, 'Tokyo', 'Japan'),
(5, 'Cooperativa de Quesos ''Las Cabras''', NULL, 'Oviedo', 'Spain'),
(6, 'Mayumi''s', NULL, 'Osaka', 'Japan'),
(7, 'Pavlova, Ltd.', NULL, 'Melbourne', 'Australia'),
(8, 'Specialty Biscuits, Ltd.', NULL, 'Manchester', 'UK'),
(9, 'PB Knackebrod AB', NULL, 'Goteborg', 'Sweden'),
(10, 'Refrescos Americanas LTDA', NULL, 'Sao Paulo', 'Brazil'),
(11, 'Heli Subwaren GmbH & Co. KG', NULL, 'Berlin', 'Germany'),
(12, 'Plutzer Lebensmittelgrobmarkte AG', NULL, 'Frankfurt', 'Germany'),
(13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', NULL, 'Cuxhaven', 'Germany'),
(14, 'Formaggi Fortini s.r.l.', NULL, 'Ravenna', 'Italy'),
(15, 'Norske Meierier', NULL, 'Sandvika', 'Norway'),
(16, 'Bigfoot Breweries', NULL, 'Bend', 'USA'),
(17, 'Svensk Sjofoda AB', NULL, 'Stockholm', 'Sweden'),
(18, 'Aux joyeux ecclesiastiques', NULL, 'Paris', 'France'),
(19, 'New England Seafood Cannery', NULL, 'Boston', 'USA'),
(20, 'Leka Trading', NULL, 'Singapore', 'Singapore'),
(21, 'Lyngbysild', NULL, 'Lyngby', 'Denmark'),
(22, 'Zaanse Snoepfabriek', NULL, 'Zaandam', 'Netherlands'),
(23, 'Karkki Oy', NULL, 'Lappeenranta', 'Finland'),
(24, 'G''day, Mate', NULL, 'Sydney', 'Australia'),
(25, 'Ma Maison', NULL, 'Montreal', 'Canada'),
(26, 'Pasta Buttini s.r.l.', NULL, 'Salerno', 'Italy'),
(27, 'Escargots Nouveaux', NULL, 'Montceau', 'France'),
(28, 'Gai paturage', NULL, 'Annecy', 'France'),
(29, 'Forets d''erables', NULL, 'Ste-Hyacinthe', 'Canada');

INSERT INTO DONDATHANG (MaDDH, NgayDatHang, MaKH, TriGia)
VALUES 
(1,'7/4/2012',15,440),
(2,'7/5/2012',9,1863.4),
(3,'7/8/2012',34,1813),
(4,'7/8/2012',14,670.8),
(5,'7/9/2012',26,3730),
(6,'7/10/2012',34,1444.8),
(7,'7/11/2012',14,625.2),
(8,'7/12/2012',38,2490.5),
(9,'7/15/2012',28,517.8),
(10,'7/16/2012',35,1119.9);

INSERT INTO MATHANG (MaMH, TenMH, MaNCC, DonGia, TinhTrang)
VALUES 
(1, 'Chai', 1, 18, 0),
(2, 'Chang', 1, 19, 0),
(3, 'Aniseed Syrup', 1, 10, 0),
(4, 'Chef Anton''s Cajun Seasoning', 2, 22, 0),
(5, 'Chef Anton''s Gumbo Mix', 2, 21.35, 1),
(6, 'Grandma''s Boysenberry Spread', 3, 25, 0),
(7, 'Uncle Bob''s Organic Dried Pears', 3, 30, 0),
(8, 'Northwoods Cranberry Sauce', 3, 40, 0),
(9, 'Mishi Kobe Niku', 4, 97, 1),
(10, 'Ikura', 4, 31, 0),
(11, 'Queso Cabrales', 5, 21, 0),
(12, 'Queso Manchego La Pastora', 5, 38, 0),
(13, 'Konbu', 6, 6, 0),
(14, 'Tofu', 6, 23.25, 0),
(15, 'Genen Shouyu', 6, 15.5, 0),
(16, 'Pavlova', 7, 17.45, 0),
(17, 'Alice Mutton', 7, 39, 1),
(18, 'Carnarvon Tigers', 7, 62.5, 0),
(19, 'Teatime Chocolate Biscuits', 8, 9.2, 0),
(20, 'Sir Rodney''s Marmalade', 8, 81, 0),
(21, 'Sir Rodney''s Scones', 8, 10, 0),
(22, 'Gustaf''s Knackebröd', 9, 21, 0),
(23, 'Tunnbrod', 9, 9, 0),
(24, 'Guarana Fantastica', 10, 4.5, 1),
(25, 'NuNuCa Nub-Nougat-Creme', 11, 14, 0),
(26, 'Gumbar Gummibarchen', 11, 31.23, 0),
(27, 'Schoggi Schokolade', 11, 43.9, 0),
(28, 'Rossle Sauerkraut', 12, 45.6, 1),
(29, 'Thuringer Rostbratwurst', 12, 123.79, 1),
(30, 'Nord-Ost Matjeshering', 13, 25.89, 0),
(31, 'Gorgonzola Telino', 14, 12.5, 0),
(32, 'Mascarpone Fabioli', 14, 32, 0),
(33, 'Geitost', 15, 2.5, 0),
(34, 'Sasquatch Ale', 16, 14, 0),
(35,'Steeleye Stout',16,18,0),
(36,'Inlagd Sill',17,19,0),
(37,'Gravad lax',17,26,0),
(38,'Cote de Blaye',18,263.5,0),
(39,'Chartreuse verte',18,18,0),
(40,'Boston Crab Meat',19,18.4,0),
(41,'Jack''s New England Clam Chowder',19,9.65,0),
(42,'Singaporean Hokkien Fried Mee',20,14,1),
(43,'Ipoh Coffee',20,46,0),
(44,'Gula Malacca',20,19.45,0),
(45,'Rogede sild',21,9.5,0),
(46,'Spegesild',21,12,0),
(47,'Zaanse koeken',22,9.5,0),
(48,'Chocolade',22,12.75,0),
(49,'Maxilaku',23,20,0),
(50,'Valkoinen suklaa',23,16.25,0),
(51,'Manjimup Dried Apples',24,53,0),
(52,'Filo Mix',24,7,0),
(53,'Perth Pasties',24,32.8,1),
(54,'Tourtiere',25,7.45,0),
(55,'Pâté chinois',25,24,0),
(56,'Gnocchi di nonna Alice',26,38,0),
(57,'Ravioli Angelo',26,19.5,0),
(58,'Escargots de Bourgogne',27,13.25,0),
(59,'Raclette Courdavault',28,55,0),
(60,'Camembert Pierrot',28,34,0),
(61,'Sirop d''erable',29,28.5,0),
(62,'Tarte au sucre',29,49.3,0),
(63,'Vegie-spread',7,43.9,0),
(64,'Wimmers gute Semmelknodel',12,33.25,0),
(65,'Louisiana Fiery Hot Pepper Sauce',2,21.05,0),
(66,'Louisiana Hot Spiced Okra',2,17,0),
(67,'Laughing Lumberjack Lager',16,14,0),
(68,'Scottish Longbreads',8,12.5,0),
(69,'Gudbrandsdalsost',15,36,0),
(70,'Outback Lager',7,15,0),
(71,'Flotemysost',15,21.5,0),
(72,'Mozzarella di Giovanni',14,34.8,0),
(73,'Rod Kaviar',17,15,0),
(74,'Longlife Tofu',4,10,0),
(75,'Rhonbrau Klosterbier',12,7.75,0),
(76,'Lakkalikoori',23,18,0),
(77,'Original Frankfurter grune Sobe',12,13,0),
(78,'Stroopwafels',22,9.75,0);

INSERT INTO CHITIETDDH (MaCT, MaDDH, MaMH, DonGia, SoLuong)
VALUES 
  (1, 1, 11, 14, 12),
  (2, 1, 42, 9.8, 10),
  (3, 1, 72, 34.8, 5),
  (4, 2, 14, 18.6, 9),
  (5, 2, 51, 42.4, 40),
  (6, 3, 41, 7.7, 10),
  (7, 3, 51, 42.4, 35),
  (8, 3, 65, 16.8, 15),
  (9, 4, 22, 16.8, 6),
  (10, 4, 57, 15.6, 15),
  (11, 4, 65, 16.8, 20),
  (12, 5, 20, 64.8, 40),
  (13, 5, 33, 2, 25),
  (14, 5, 60, 27.2, 40),
  (15, 6, 31, 10, 20),
  (16, 6, 39, 14.4, 42),
  (17, 6, 49, 16, 40),
  (18, 7, 24, 3.6, 15),
  (19, 7, 55, 19.2, 21),
  (20, 7, 74, 8, 21),
  (21, 8, 2, 15.2, 20),
  (22, 8, 16, 13.9, 35),
  (23, 8, 36, 15.2, 25),
  (24, 8, 59, 44, 30),
  (25, 9, 53, 26.2, 15),
  (26, 9, 77, 10.4, 12),
  (27, 10, 27, 35.1, 25),
  (28, 10, 39, 14.4, 6),
  (29, 10, 77, 10.4, 15);
