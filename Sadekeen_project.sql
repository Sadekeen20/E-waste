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


INSERT INTO MANUFACTURER VALUES('1000000','ZAK','ZEXBAY','GULISTAN','ALIEXPRESS','UGANDA');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000010','100002');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000020','100004');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000030','100006');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000040','100008');
INSERT INTO BUSSINESS_PROVIDES VALUES('1000050','100010');


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