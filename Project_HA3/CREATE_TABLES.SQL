CREATE TABLE Business_Entity (id int not null PRIMARY Key, contact_info varchar (50), shipping_loc varchar(50), address varchar(50), name varchar(50), phone varchar(15), web_loc varchar(50));

CREATE TABLE Shipper (shipper_id int not null PRIMARY Key, FOREIGN Key(shipper_id) REFERENCES Business_Entity(id) on DELETE cascade);

CREATE TABLE Customer (customer_id int not null PRIMARY Key, FOREIGN Key(customer_id) REFERENCES Business_Entity(id) on DELETE cascade);

CREATE TABLE Supplier (supplier_id int not null PRIMARY Key, FOREIGN Key(supplier_id) REFERENCES Business_Entity(id) on DELETE cascade);

CREATE TABLE Manufacturer (mft_id int not null PRIMARY Key, FOREIGN Key(mft_id) REFERENCES Business_Entity(id) on DELETE cascade);

CREATE TABLE item (item_id int not null PRIMARY Key,  item_weight varchar(50));

CREATE TABLE Product(product_id int not null PRIMARY Key, PRODUCT_NAME VARCHAR(50), FOREIGN Key(product_id) REFERENCES item(item_id) ON DELETE CASCADE);

CREATE TABLE MATERIAL(MATERIAL_id int not null PRIMARY Key, MATERIAL_NAME VARCHAR(50), FOREIGN Key(MATERIAL_id) REFERENCES item(item_id) ON DELETE CASCADE);

CREATE TABLE MANUFACTURE_FOR_CSR(mft_id INT, customer_id INT, MFT_PRODUCT VARCHAR(50), PRIMARY KEY(mft_id, customer_id), FOREIGN KEY(mft_id) REFERENCES Manufacturer(mft_id), FOREIGN KEY(customer_id) REFERENCES Customer(customer_id));

CREATE TABLE PROD_NEEDS_MATERIAL(MATERIAL_id int, PRODUCT_ID INT, PART_QUANTITITES INT, PRIMARY KEY(PRODUCT_ID, material_id), FOREIGN Key(MATERIAL_id) REFERENCES MATERIAL(material_id) , FOREIGN Key(PRODUCT_id) REFERENCES Product(product_id));

CREATE TABLE SUPPLY_TO_MANUFACTURER(supplier_id INT, MFT_ID INT, material_id INT, price_per_unit FLOAT(40), FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id), FOREIGN KEY(MFT_id) REFERENCES Manufacturer(MFT_id), FOREIGN KEY(material_id) REFERENCES MATERIAL(material_id));

CREATE TABLE SUPPLY_TO_CUSTOMER(supplier_id INT, CUSTOMER_ID INT, material_id INT, PRODUCT_ID INT, price_per_unit FLOAT(40), FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id), FOREIGN KEY(customer_id) REFERENCES Customer(customer_id), FOREIGN KEY(product_id) REFERENCES Product(product_id), FOREIGN KEY(material_id) REFERENCES MATERIAL(material_id));

CREATE TABLE SUPPLY_UNIT_PRICING(supplier_id INT, item_id INT, PRICE_PER_UNIT FLOAT(30), FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id), FOREIGN KEY(item_id) REFERENCES item(ITEM_ID));

CREATE TABLE SUPPLIER_DISCOUNT( supplier_id INT PRIMARY KEY, DISCOUNT_PERCENTAGE FLOAT(10), PREDETERMINED_PRICE_BOUND FLOAT(10), FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id));

CREATE TABLE MANUF_PRODUCE( product_id INT, MANUFACTURER_ID INT, SET_UP_COST FLOAT(50), PRODUCT_COST_PER_UNIT FLOAT(50), PRIMARY KEY(product_id, Manufacturer_ID), FOREIGN KEY(product_id) REFERENCES Product(product_id), FOREIGN KEY(Manufacturer_ID) REFERENCES Manufacturer(mft_id));

CREATE TABLE MANUFACTURER_DISCOUNT( MFT_id INT PRIMARY KEY, DISCOUNT_PERCENTAGE FLOAT(10), PREDETERMINED_PRICE_BOUND FLOAT(10), FOREIGN KEY(MFT_id) REFERENCES Manufacturer(MFT_id));

create TABLE SHIP_SERVICE_PRICING(shipper_id INT, DESTINATION_ID INT, SOURCE_ID INT, DESTINATION_LOCATION VARCHAR(50), SOURCE_LOCATION VARCHAR(50), MIN_PACKAGE_PRICE FLOAT(10), PRICE_PER_LB FLOAT(10), AMT1 FLOAT(10), DISC1 FLOAT(10), AMT2 FLOAT(10), DISC2 FLOAT(10),  PRIMARY KEY(shipper_id, SOURCE_ID, DESTINATION_ID), FOREIGN KEY(shipper_id) REFERENCES Shipper(shipper_id), FOREIGN KEY(SOURCE_ID) REFERENCES Business_Entity(id), FOREIGN KEY(DESTINATION_ID) REFERENCES Business_Entity(ID));

CREATE TABLE SHIPPER_DISCOUNT( shipper_id INT PRIMARY KEY, DISCOUNT_PERCENTAGE FLOAT(10), PREDETERMINED_PRICE_BOUND FLOAT(10), FOREIGN KEY(shipper_id) REFERENCES Shipper(shipper_id));

CREATE TABLE CUSTOMER_DEMAND(customer_id INT, item_id INT, ITEM_QUANTITY INT, PRIMARY KEY(customer_id, item_id), FOREIGN KEY(customer_id) REFERENCES Customer(customer_id), FOREIGN KEY(item_id) REFERENCES item(item_id));

CREATE TABLE SHIP_ORDER (ORDER_ID INT ,SHIPPER_ID INT, SHIPPER_NAME VARCHAR(50), ITEM_ID INT,SENDER_ID INT, RECIPIENT_ID INT,item_quantity INT, ,  price_per_lb FLOAT(10), TOTAL_WEIGHT FLOAT(10), PRIMARY KEY( ORDER_ID, shipper_id, ITEM_ID, SENDER_ID, RECIPIENT_ID), FOREIGN KEY(shipper_id) REFERENCES Shipper(shipper_id), FOREIGN KEY(item_id) REFERENCES item(ITEM_ID), FOREIGN KEY(SENDER_ID) REFERENCES Business_Entity(id), FOREIGN KEY(RECIPIENT_ID) REFERENCES Business_Entity(id));

CREATE TABLE MANUF_ORDER (ORDER_ID INT , MFT_id INT, ITEM_ID INT, item_quantity INT, PRIMARY KEY( ORDER_ID, MFT_id, ITEM_ID), FOREIGN KEY(MFT_id) REFERENCES Manufacturer(MFT_id), FOREIGN KEY(item_id) REFERENCES item(ITEM_ID));

CREATE TABLE SUPPLIER_ORDER (ORDER_ID INT , supplier_id INT, ITEM_ID INT, item_quantity INT, PRIMARY KEY( ORDER_ID, supplier_id, ITEM_ID), FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id), FOREIGN KEY(item_id) REFERENCES item(ITEM_ID));
