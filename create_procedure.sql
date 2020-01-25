
/*
File:              xxxx.sql
Author:             Hellen Harry
Oracle Username:    xxxxx
Description: 1.Writing a stored procedure that accepts
            a customer name as a parameter and 
              "returns" the number of cars the customer has bought
              and total amount of money he/she has spent.
              Test the above procedure by writing a script which:

            prompting the user for a beginning letter
            prompting the user for an ending letter
            calls the procedure to show the total spent and the number of cars
            purchased by each customer 
            whose name begins with a letter between the beginning and ending 
            letters (inclusive). 
            For example if the beginning letter is "A" and the ending letter 
            is "D", 
            the result should show all the customers whose name begins with A,
            B, C and D. 
            If "A" and "Z" is entered the result should show all customers.
             Using a cursor as well as including appropriate exception handling.
            using  REGEXP_LIKE 
                
*/
/* 
------------output results -start------------
Procedure FIND_CUST compiled
------------output results -end--------------
*/
SET LINESIZE 132

SET PAGESIZE 255

SET SERVEROUTPUT ON

SET VERIFY ON
CREATE OR REPLACE PROCEDURE find_cust

(   pl_name IN customer.custname%TYPE,
    pl_numcar OUT INT,
    pl_sum_of_cars OUT NUMBER
)
AS
BEGIN
    SELECT COUNT(*),SUM(purchcost)
      INTO pl_numcar,pl_sum_of_cars
      FROM car
     WHERE  UPPER(custname) = UPPER(pl_name);
END;
/
