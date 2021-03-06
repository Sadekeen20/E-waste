ALTER TABLE MANUFACTURER ADD EMAIL VARCHAR2(20);
ALTER TABLE MANUFACTURER ADD PASSWORD VARCHAR2(20);

insert into manufacturer values('10010','nazifa','dhaka','nazifa','dhaka','nhrafa.96@gmail.com','1234');

  alter table business add password varchar2(20);

  CREATE SEQUENCE PROVIDER_ID_SEQ
INCREMENT BY 1
START WITH 1
MAXVALUE 1000000
CACHE 100
NOCYCLE;


CREATE OR REPLACE TRIGGER INDIVIDUAL_ON_INSERT
  BEFORE INSERT ON INDIVIDUAL
  FOR EACH ROW
BEGIN
  SELECT PROVIDER_ID_SEQ.nextval
  INTO :new.PROVIDER_ID
  FROM dual;
END;

CREATE OR REPLACE VIEW INDIVIDUAL_SELL_HISTORY("PROVIDER_ID","SOURCES", "BARCODE", "ORDER_DATE", "PRODUCT_CONDITION") AS
SELECT PROVIDER_ID, OP.SOURCES, OP.BARCODE, OP.ORDER_DATE, OP.PRODUCT_CONDITION
FROM ORDER_PROVIDER OP JOIN INDIVIDUAL_PROVIDES IP USING (ORDER_ID) JOIN INDIVIDUAL I USING (PROVIDER_ID);


INSERT INTO INDIVIDUAL VALUES('','01768795587','nhrafa.96@gmail.com',10000,'Nazifa Hamid', '123');
INSERT INTO INDIVIDUAL VALUES ('','01712764276','raafa@gmail.com',3000, 'raafa','Dhaka','123');
INSERT INTO INDIVIDUAL VALUES ('','01778634276','nazifa@gmail.com',7000, 'nazifa','Dhaka','123');
INSERT INTO INDIVIDUAL VALUES ('','01712763445','xyz@gmail.com',1000, 'xyz','Dhaka','123');
INSERT INTO INDIVIDUAL VALUES ('','01714567276','nazifarafa@gmail.com',300, 'nazifarafa','Dhaka','123');
INSERT INTO INDIVIDUAL VALUES ('','01767567224','ridayshahir@gmail.com',300, 'riday','Dhaka','123');
INSERT INTO INDIVIDUAL VALUES ('','01714987653','udoyriday@gmail.com',300, 'shahir','Dhaka','123');


INSERT INTO INDIVIDUAL_PROVIDES VALUES('2','100002');
INSERT INTO INDIVIDUAL_PROVIDES VALUES('3','100004');
INSERT INTO INDIVIDUAL_PROVIDES VALUES('4','100008');
INSERT INTO INDIVIDUAL_PROVIDES VALUES('2','100008');
INSERT INTO INDIVIDUAL_PROVIDES VALUES('2','100010');
INSERT INTO INDIVIDUAL_PROVIDES VALUES('2','100016');


INSERT INTO BUSINESS VALUES('10002',100000,'rafaaa@gmail.com','Dhaka','MIST','rafa','Dhaka','123');
INSERT INTO BUSINESS VALUES('10003',500000,'nazifaa@gmail.com','Dhaka','MIST','rafa','Dhaka','123');
INSERT INTO BUSINESS VALUES('10004',200000,'nazifarafa@gmail.com','Dhaka','SAMSUNG','nazifarafa','Dhaka','123');
INSERT INTO BUSINESS VALUES('10005',400000,'shahirriday@gmail.com','Dhaka','SAMSUNG','shahir riday','Dhaka','123');
INSERT INTO BUSINESS VALUES('10006',600000,'ridayudoy@gmail.com','Dhaka','WALTON','riday udoy','Dhaka','123');
INSERT INTO BUSINESS VALUES('10007',250000,'udoyshahir@gmail.com','Dhaka','LG','udoy shahir','Dhaka','123');


INSERT INTO BUSSINESS_PROVIDES VALUES('1002000', '100006');
INSERT INTO BUSSINESS_PROVIDES VALUES('1002010', '100012');
INSERT INTO BUSSINESS_PROVIDES VALUES('1002020', '100014');

CREATE OR REPLACE VIEW BUSINESS_SELL_HISTORY("PROVIDER_ID", "SOURCES", "BARCODE", "ORDER_DATE","PRODUCT_CONDITION") AS
SELECT PROVIDER_ID, OP.SOURCES, OP.BARCODE, OP.ORDER_DATE, OP.PRODUCT_CONDITION FROM ORDER_PROVIDER OP JOIN BUSSINESS_PROVIDES BP USING( ORDER_ID)
JOIN BUSINESS B USING (PROVIDER_ID);

CREATE OR REPLACE VIEW MANUFACTURER_INVENTORY_HISTORY("PROVIDER_ID","BARCODE", "CHECK_IN_TO", "CHECK_OUT_TO", "CHECK_IN_DATE", "CHECK_OUT_DATE",
"LOCATION","PRODUCT_CONDITION") AS
SELECT PROVIDER_ID ,I.BARCODE, I.CHECK_IN_TO, I.CHECK_OUT_TO, I.CHECK_IN_DATE, I.CHECK_OUT_DATE,
I.LOCATION,I.PRODUCT_CONDITION FROM MANUFACTURER M JOIN ADDS A USING (PROVIDER_ID) JOIN INVENTORY I USING (INVENTORY_ID);


CREATE SEQUENCE INVENTORY_ID_SEQ
INCREMENT BY 1
START WITH 500
MAXVALUE 1000000
CACHE 100
NOCYCLE;


CREATE OR REPLACE TRIGGER INVENTORY_ON_INSERT
BEFORE INSERT ON INVENTORY
FOR EACH ROW
BEGIN
SELECT INVENTORY_ID_SEQ.nextval
INTO :new.INVENTORY_ID
FROM dual;
END;





INSERT INTO INVENTORY VALUES ('12','BADDA','BANANI','20-MAY-2019','2010056', '21-MAY-2019','BANANI','GOOD');
INSERT INTO INVENTORY VALUES ('13','MIRPUR','BASHUNDHARA','22-MAY-2019','2010059', '23-MAY-2019','BANANI','BAD');
INSERT INTO INVENTORY VALUES ('14','UTTORA','DHANMONDI','20-MAY-2019','2010045', '23-MAY-2019','BANANI','GOOD');
INSERT INTO INVENTORY VALUES ('15','BADDA','DHANMONDI','25-MAY-2019','2010089', '26-MAY-2019','BANANI','VERY BAD');


CREATE OR REPLACE TRIGGER FIND_TRANSPORT
AFTER INSERT
ON ORDER_PROVIDER
FOR EACH ROW
DECLARE
  employee varchar(20);
  cond varchar(100);
BEGIN
  cond := :NEW.ORDER_ID;
    SELECT EMPLOYEE_ID INTO employee FROM TRANSPORT JOIN EMPLOYEE USING(EMPLOYEE_ID) WHERE UPPER(EMPLOYEE.STATUS) = 'FREE' AND ROWNUM = 1;
    UPDATE EMPLOYEE SET STATUS = 'busy' WHERE EMPLOYEE_ID = employee;
    INSERT INTO TRANSPORTATION VALUES(employee,cond);

END;



ALTER TABLE TRANSPORTATION DROP CONSTRAINT TRANSPORTATION_VEHICLE_LICENSE_NO_FK;
ALTER TABLE TRANSPORTATION DROP CONSTRAINT TRANSPORTATION_ORDER_PROVIDER_PK;
ALTER TABLE TRANSPORTATION ADD EMPLOYEE_ID VARCHAR(20);
INSERT INTO ORDER_PROVIDER VALUES('','DHAKA','1244',SYSDATE,'BAD');

CREATE OR REPLACE VIEW PRODUCTNAME("NAME","BARCODE") AS(SELECT PRODUCT_NAME, BARCODE FROM PRODUCT_INFO JOIN BARCODE_TABLE USING(MODEL_NO));

create or replace view PRODUCTNAME ("NAME", "BARCODE") AS (SELECT PRODUCT_NAME, BARCODE FROM PRODUCT_INFO JOIN BARCODE_TABLE USING (MODEL_NO));

  create or replace TRIGGER FIND_TRANSPORT 
  AFTER INSERT ON ORDER_PROVIDER
  FOR EACH ROW
  DECLARE
   emp_id varchar(20);
   orderID varchar(20);
  BEGIN
    orderID := :NEW.ORDER_ID;
    SELECT EMPLOYEE_ID INTO emp_id FROM EMPLOYEE JOIN TRANSPORT USING(EMPLOYEE_ID)
    WHERE EMPLOYEE.STATUS = 'free' fetch first row only;
    UPDATE EMPLOYEE SET STATUS = 'busy' WHERE EMPLOYEE_ID = emp_id;
    INSERT INTO TRANSPORTATION VALUES(orderID, emp_id);
  END;







  create or replace trigger UPDATE_BALANCE
  AFTER INSERT ON SELL_ORDER
  FOR EACH ROW
  DECLARE
   pr number;
   sellerID varchar2(100);
   inproID varchar2(100);
   barc varchar2(20);
   ordID varchar2(20);
   bproId varchar2(100);
   in_count number;
   pri number;
   processID varchar2(100);
  BEGIN
    sellerID:= :NEW.SELLER_ID;
   select price into pr from product join second_hand_product using (product_id) join sell_order using (seller_id) where seller_id= sellerID;
   pr:= (pr*0.1);
   pri:= (pri*0.9);

   select processor_id into processID from second_hand_product sp join product p using (product_id) join makes m using (product_id)
      join refurbisher r using (processor_id) join processor pr using (processor_id) where sp.seller_id= sellerID;

      update processor set balance = pri where processor_id = processID;


   select barcode into barc from product p join second_hand_product sp using (product_id) where sp.seller_id = sellerID;
   select order_id into ordID from order_provider JOIN order_info using (order_id) where barcode = barc;
   select provider_id into inproID from individual_provides join order_provider using (order_id) where order_id = ordID;
   select provider_id into bproID from bussiness_provides join order_provider using (order_id) where order_id = ordID;
   select count(provider_id) into in_count from individual_provides join order_provider using (order_id) where order_id =ordID ;
   if(in_count=0)
   THEN
        UPDATE BUSINESS SET balance = pr where provider_id = inproID;
    ELSE
      UPDATE INDIVIDUAL SET BALANCE = pr where provider_id = bproID;
      END IF;

      select processor_id into processID from second_hand_product sp join product p using (product_id) join makes m using (product_id)
      join refurbisher r using (processor_id) join processor pr using (processor_id) where sp.seller_id= sellerID;

      update processor set balance = pri where processor_id = processID;



    END;
