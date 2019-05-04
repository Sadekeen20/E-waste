CREATE SEQUENCE BUSINESS_SEQ
INCREMENT BY 10
START WITH 1000000
MAXVALUE 999999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER BUSINESS_INSERT
  BEFORE INSERT ON BUSINESS
  FOR EACH ROW
BEGIN
  SELECT BUSINESS_SEQ.nextval
  INTO :new.PROVIDER_ID
  FROM dual;
END;


INSERT INTO BUSSINESS_PROVIDES VALUES('1000000','101ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000010','102ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000020','103ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000030','104ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000040','105ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000050','106ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000060','107ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000070','108ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000080','109ABC');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000090','110ABC');

INSERT INTO BUYER VALUES('','ABC_CORP','LALBAG','1010239');
INSERT INTO BUYER VALUES('','ABC_CORP1','LALBAG2','1010231');
INSERT INTO BUYER VALUES('','ABC_CORP2','LALBAG3','1010232');
INSERT INTO BUYER VALUES('','ABC_CORP3','LALBAG4','1010233');
INSERT INTO BUYER VALUES('','ABC_CORP4','LALBAG5','1010234');
INSERT INTO BUYER VALUES('','ABC_CORP5','LALBAG6','1010235');
INSERT INTO BUYER VALUES('','ABC_CORP6','LALBAG7','1010236');
INSERT INTO BUYER VALUES('','ABC_CORP7','LALBAG8','1010237');
INSERT INTO BUYER VALUES('','ABC_CORP8','LALBAG9','1010238');
INSERT INTO BUYER VALUES('','ABC_CORP9','LALBAG100','10102392');



INSERT INTO SELLS VALUES('100','40');
INSERT INTO SELLS VALUES('101','41');
INSERT INTO SELLS VALUES('102','42');
INSERT INTO SELLS VALUES('103','43');
INSERT INTO SELLS VALUES('104','44');
INSERT INTO SELLS VALUES('105','45');
INSERT INTO SELLS VALUES('106','46');
INSERT INTO SELLS VALUES('107','47');
INSERT INTO SELLS VALUES('108','48');
INSERT INTO SELLS VALUES('109','49');




CREATE SEQUENCE ORDER_SEQ
INCREMENT BY 2
START WITH 100000
MAXVALUE 99999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER ORDER_INSERT
  BEFORE INSERT ON ORDER_PROVIDER
  FOR EACH ROW
BEGIN
  SELECT ORDER_SEQ.nextval
  INTO :new.ORDER_ID
  FROM dual;
END;



CREATE SEQUENCE PRODUCT_SEQ
INCREMENT BY 2
START WITH 10
MAXVALUE 999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER PRODUCT_INSERT
  BEFORE INSERT ON PRODUCT
  FOR EACH ROW
BEGIN
  SELECT PRODUCT_SEQ.nextval
  INTO :new.PRODUCT_ID
  FROM dual;
END;




INSERT INTO MANUFACTURER VALUES('1000000','ZAK','ZEXBAY','GULISTAN','ALIEXPRESS','UGANDA');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000010','100002');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000020','100004');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000030','100006');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000040','100008');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000050','100010');




INSERT INTO PRODUCT VALUES('','KALABAGAN','BEST','10KG','3');
INSERT INTO PRODUCT VALUES('','KALABAGAN1','WORST','15KG','1');
INSERT INTO PRODUCT VALUES('','KALABAGAN2','BEST','10KG','3');
INSERT INTO PRODUCT VALUES('','KALABAGAN14','WORST','5KG','1');
INSERT INTO PRODUCT VALUES('','KALABAGAN0','WORST','1KG','1');
INSERT INTO PRODUCT VALUES('','KALABAGAN9','BEST','10KG','3');
INSERT INTO PRODUCT VALUES('','KALABAGAN2','WORST','5KG','1');
INSERT INTO PRODUCT VALUES('','KALABAGAN3','WORST','1KG','1');
INSERT INTO PRODUCT VALUES('','KALABAGAN5','BEST','10KG','3');
INSERT INTO PRODUCT VALUES('','KALABAGAN4','WORST','5KG','1');



CREATE SEQUENCE MANUFACTURER_SEQ
INCREMENT BY 1
START WITH 1000
MAXVALUE 999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER MANUFACTURER_INSERT
  BEFORE INSERT ON MANUFACTURER
  FOR EACH ROW
BEGIN
  SELECT MANUFACTURER_SEQ.nextval
  INTO :new.PROVIDER_ID
  FROM dual;
END;


CREATE SEQUENCE MANUFACTURER_SEQ
INCREMENT BY 1
START WITH 1000
MAXVALUE 999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER MANUFACTURER_INSERT
  BEFORE INSERT ON MANUFACTURER
  FOR EACH ROW
BEGIN
  SELECT MANUFACTURER_SEQ.nextval
  INTO :new.PROVIDER_ID
  FROM dual;
END;


CREATE SEQUENCE PERSONAL_SEQ
INCREMENT BY 3
START WITH 10001
MAXVALUE 999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER PERSONAL_INSERT
  BEFORE INSERT ON PERSONAL
  FOR EACH ROW
BEGIN
  SELECT
  PERSONAL_SEQ.nextval
  INTO :new.BUYER_ID
  FROM dual;
END;


INSERT INTO PERSONAL VALUES('','20','BKASH','ZUB@KYO.COM','017688987','10000');
INSERT INTO PERSONAL VALUES('','20','CASH','ZUB1@KYO.COM','017688981','20000');
INSERT INTO PERSONAL VALUES('','20','BKASH','ZUB2@KYO.COM','017688982','30000');
INSERT INTO PERSONAL VALUES('','20','CASH','ZUB3@KYO.COM','017688983','40000');
INSERT INTO PERSONAL VALUES('','20','CASH','ZUB4@KYO.COM','017688984','50000');
INSERT INTO PERSONAL VALUES('','20','CASH','ZUB5@KYO.COM','017688985','60000');
INSERT INTO PERSONAL VALUES('','20','CASH','ZUB6@KYO.COM','017688986','70000');
INSERT INTO PERSONAL VALUES('','20','BKASH','ZUB7@KYO.COM','017688977','80000');
INSERT INTO PERSONAL VALUES('','20','BKASH','ZUB8@KYO.COM','017688988','90000');
INSERT INTO PERSONAL VALUES('','20','BKASH','ZUB9@KYO.COM','017688989','110000');

CREATE SEQUENCE Processor_SEQ
INCREMENT BY 3
START WITH 10001
MAXVALUE 999999
CACHE 100
NOCYCLE
NOORDER;


CREATE OR REPLACE TRIGGER Processor_INSERT
  BEFORE INSERT ON processor
  FOR EACH ROW
BEGIN
  SELECT
  Processor_SEQ.nextval
  INTO :new.processor_ID
  FROM dual;
END;





CREATE SEQUENCE STATION_ID_SEQ
INCREMENT BY 10
START WITH 1
MAXVALUE 1000000
CACHE 100
NOCYCLE;

CREATE OR REPLACE TRIGGER DUMP_ON_INSERT
  BEFORE INSERT ON DUMP
  FOR EACH ROW
BEGIN
  SELECT STATION_ID_SEQ.nextval
  INTO :new.STATION_ID
  FROM dual;
END;


CREATE SEQUENCE RAW_MATERIAL_SEQ
INCREMENT BY 10
START WITH 30
MAXVALUE 1000000
CACHE 100
NOCYCLE;

CREATE OR REPLACE TRIGGER RAW_MATERIAL_INSERT
  BEFORE INSERT ON RAW_MATERIAL
  FOR EACH ROW
BEGIN
  SELECT RAW_MATERIAL_SEQ.nextval
  INTO :new.LOT_ID
  FROM dual;
END;



CREATE SEQUENCE INVENTORY_SEQ
INCREMENT BY 10
START WITH 1
MAXVALUE 10000
CACHE 100
NOCYCLE;

CREATE OR REPLACE TRIGGER INVENTORY_INSERT
  BEFORE INSERT ON RAW_MATERIAL
  FOR EACH ROW
BEGIN
  SELECT INVENTORY_SEQ.nextval
  INTO :new.INVENTORY_ID
  FROM dual;
END;



CREATE SEQUENCE BUYER_SEQ
INCREMENT BY 1
START WITH 100
MAXVALUE 10000
CACHE 100
NOCYCLE;

CREATE OR REPLACE TRIGGER BUYER_INSERT
  BEFORE INSERT ON BUYER
  FOR EACH ROW
BEGIN
  SELECT BUYER_SEQ.nextval
  INTO :new.BUYER_ID
  FROM dual;
END;






INSERT INTO RAW_MATERIAL VALUES('',15,'12','11','12','13','13','13','13');
INSERT INTO RAW_MATERIAL VALUES('','12','12','11','12','13','13','13','13');
INSERT INTO RAW_MATERIAL VALUES('','13','12','11','29','13','13','13','13');
INSERT INTO RAW_MATERIAL VALUES('','14','12','81','12','13','13','13','13');
INSERT INTO RAW_MATERIAL VALUES('','15','12','21','12','53','12','13','13');
INSERT INTO RAW_MATERIAL VALUES('','16','12','11','12','13','73','13','13');
INSERT INTO RAW_MATERIAL VALUES('','17','12','14','12','13','13','50','13');
INSERT INTO RAW_MATERIAL VALUES('','18','12','11','12','53','13','13','13');
INSERT INTO RAW_MATERIAL VALUES('','19','12','39','12','19','13','13','13');
INSERT INTO RAW_MATERIAL VALUES('','20','12','22','12','13','13','13','13');

INSERT INTO RAW_MATERIAL_SELLING VALUES('30');
INSERT INTO RAW_MATERIAL_SELLING VALUES('40',);
INSERT INTO RAW_MATERIAL_SELLING VALUES('50',);
INSERT INTO RAW_MATERIAL_SELLING VALUES('60',);
INSERT INTO RAW_MATERIAL_SELLING VALUES('70','');
INSERT INTO RAW_MATERIAL_SELLING VALUES('80','');
INSERT INTO RAW_MATERIAL_SELLING VALUES('90','');
INSERT INTO RAW_MATERIAL_SELLING VALUES('100','');
INSERT INTO RAW_MATERIAL_SELLING VALUES('110','');
INSERT INTO RAW_MATERIAL_SELLING VALUES('120;','');

INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');
INSERT INTO inventory VALUES ('','','','','','','','');

INSERT INTO EXTRACTION VALUES('10301','30');
INSERT INTO EXTRACTION VALUES('10304','40');
INSERT INTO EXTRACTION VALUES('10307','50');
INSERT INTO EXTRACTION VALUES('10310','60');
INSERT INTO EXTRACTION VALUES('10313','70');
INSERT INTO EXTRACTION VALUES('10316','80');
INSERT INTO EXTRACTION VALUES('10319','90');
INSERT INTO EXTRACTION VALUES('10322','100');
INSERT INTO EXTRACTION VALUES('10325','110');
INSERT INTO EXTRACTION VALUES('10601','120');



      INSERT INTO RECYCLER VALUES ('10301','SP1','40%','C1');
      INSERT INTO RECYCLER VALUES ('10304','SP1','40%','C2');
      INSERT INTO RECYCLER VALUES ('10307','SP1','40%','C3');
      INSERT INTO RECYCLER VALUES ('10310','SP1','40%','C4');
      INSERT INTO RECYCLER VALUES ('10313','SP1','40%','C5');
      INSERT INTO RECYCLER VALUES ('10316','SP1','40%','C7');
      INSERT INTO RECYCLER VALUES ('10319','SP1','40%','C8');
      INSERT INTO RECYCLER VALUES ('10322','SP1','40%','C9');
     INSERT INTO RECYCLER VALUES (' 1032','SP1','40%','C6');
      INSERT INTO RECYCLER VALUES ('10601','SP1','40%','C10');






  INSERT INTO MAKES VALUES('10','10301');
  INSERT INTO MAKES VALUES ('12','10304');
  INSERT INTO MAKES VALUES ('14','10307');
  INSERT INTO MAKES VALUES ('16','10310');
  INSERT INTO MAKES VALUES ('18','10313');
  INSERT INTO MAKES VALUES ('20','10316');
  INSERT INTO MAKES VALUES ('22','10319');
  INSERT INTO MAKES VALUES ('24','10322');
  INSERT INTO MAKES VALUES ('26','10325');
  INSERT INTO MAKES VALUES ('28','10601');


  INSERT INTO REFURBISHER VALUES ('10307',100);
  INSERT INTO REFURBISHER VALUES ('10310',550);
  INSERT INTO REFURBISHER VALUES ('10313',110);
  INSERT INTO REFURBISHER VALUES ('10316',1000);
  INSERT INTO REFURBISHER VALUES ('10319',2100);
  INSERT INTO REFURBISHER VALUES ('10322',1100);
  INSERT INTO REFURBISHER VALUES ('10601',600);
  INSERT INTO REFURBISHER VALUES ('10325',150);
  INSERT INTO REFURBISHER VALUES ('10304',550);

1.
CREATE OR REPLACE VIEW RAW_MAT_BY_RECYCLER
AS
SELECT * FROM RAW_MATERIAL JOIN EXTRACTION USING (LOT_ID)
JOIN RECYCLER USING(PROCESSOR_ID) ;
//WHERE PROCESSOR_ID=$ID; TO ONLY THAT RECYCLER

2.
CREATE OR REPLACE VIEW FIXED_PRODUCTS
AS
SELECT * 
FROM 
REFURBISHER JOIN MAKES USING (PROCESSOR_ID)
JOIN PRODUCT USING (PRODUCT_ID)
;

3.
--> Show total money earned by recycler. (view)

CREATE OR REPLACE VIEW EARNED_RECYLER
AS
SELECT SUM(PRICE*QUANTITY),PROCESSOR_ID
FROM RECYCLER JOIN EXTRACTION USING (PROCESSOR_ID)
JOIN RAW_MATERIAL USING(LOT_ID)
JOIN RAW_MATERIAL_SELLING USING (LOT_ID)
JOIN SELL_ORDER USING (SELLER_ID)
GROUP BY PROCESSOR_ID;



CREATE OR REPLACE VIEW EARNED_BY_RECYLER
AS
SELECT SUM(PRICE),PROCESSOR_ID
FROM RECYCLER JOIN EXTRACTION USING (PROCESSOR_ID)
JOIN RAW_MATERIAL USING(LOT_ID)
JOIN RAW_MATERIAL_SELLING USING (LOT_ID)
JOIN SELL_ORDER USING (SELLER_ID)
GROUP BY PROCESSOR_ID;

//ASSUMING THE THINGS ARE BOUGHT LOT WISE

4.
CREATE OR REPLACE VIEW EARNED_REFURBISHER
AS
SELECT PROCESSOR_ID,PRICE
FROM REFURBISHER JOIN MAKES USING(PROCESSOR_ID)
JOIN PRODUCT USING (PRODUCT_ID)
JOIN SECOND_HAND_PRODUCT USING (PRODUCT_ID)
JOIN SELL_ORDER USING (SELLER_ID);

5.

CREATE OR REPLACE VIEW ORDERS_OF_BUYER
AS
SELECT NAME, LOT_ID,QUANTITY
FROM RECYCLER JOIN EXTRACTION USING (PROCESSOR_ID)
JOIN RAW_MATERIAL USING(LOT_ID)
JOIN RAW_MATERIAL_SELLING USING (LOT_ID)
JOIN SELL_ORDER USING (SELLER_ID)
JOIN SELLS USING (SELLER_ID)
JOIN BUYER USING (BUYER_ID)
;

6.
UPDATE CHECK_OUT_DATE
SET

7.



4.Show total money earned by recycler. (view)
5.Show total money earned by refurbisher. (view)
6.Show sale orders and buyer info for the recycler. (view)
7.Add an insert for repair_cost of all the items taken from inventory.
8.Add an insert for adding products with sequence for primary key.
9.Add an insert for adding raw materials with sequence for primary key.
10.Add sequence to processor ID generation.For reference check Riday_project_sql.
11.Add trigger for updating profit for recycler when item is sold.
12.Add trigger for updating profit for refurbisher when item is sold.
