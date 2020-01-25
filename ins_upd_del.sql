
/*
File:              xxxxx.sql
Author:             Hellen Harry
Oracle Username:    xxxxx
Description:Into the operation field goes the word 'INSERT', 'UPDATE', or 
            'DELETE' as appropriate.

            Put SYSDATE into opdate and USER into username.

Hint:
To see both the date and time in a date field, use the TO_CHAR function with a
format string as follows:
SELECT TO_CHAR(opdate, 'fmMon fmDD, YYYY fmHH:MI P.M.') FROM carlog

                
*/
/* 
------------output results -start------------

Trigger CAR_BEFORE_INS_UPD_DEL compiled

1 row inserted.

1 row updated.

1 row deleted.

------------output results -end--------------
*/
SET LINESIZE 132

SET PAGESIZE 255

SET SERVEROUTPUT ON

SET VERIFY ON

CREATE OR REPLACE TRIGGER car_before_ins_upd_del
BEFORE DELETE OR INSERT OR UPDATE
ON car
FOR EACH ROW
BEGIN
    IF INSERTING THEN
    :NEW.carserial := UPPER(:NEW.carserial);
    :NEW.carmake := UPPER(:NEW.carmake);
    :NEW.carmodel := UPPER(:NEW.carmodel);
    :NEW.extcolor := UPPER(:NEW.extcolor);
        INSERT INTO carlog
    VALUES(USER,'insert',TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),:NEW.carserial ,:NEW.carmake,:NEW.carmodel,:NEW.extcolor);
    END IF;
    IF UPDATING THEN
    :NEW.carserial := UPPER(:NEW.carserial);
    :NEW.carmake := UPPER(:NEW.carmake);
    :NEW.carmodel := UPPER(:NEW.carmodel);
    :NEW.extcolor := UPPER(:NEW.extcolor);
        INSERT INTO carlog
    VALUES(USER,'update',TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),:NEW.carserial ,:NEW.carmake,:NEW.carmodel,:NEW.extcolor);
    END IF;
    IF DELETING THEN
    
        INSERT INTO carlog
    VALUES(USER,'delete',TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),:NEW.carserial ,:NEW.carmake,:NEW.carmodel,:NEW.extcolor);
    END IF; 
    
END;

INSERT INTO car VALUES('a24ayt91',null,'Jacks','cats','2009','bluedust','spot','v4',null,20000,233322,234333);
UPDATE car 
SET carmake = 'flaps'
WHERE carserial = 'A24AYT91';

DELETE FROM car
WHERE carserial = 'A24AYT91';
