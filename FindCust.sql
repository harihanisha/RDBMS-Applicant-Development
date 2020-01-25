/*
File:           xxxx.sql
Author:             Hellen Harry
Oracle Username:    xxxx

Description: Q5.Who are the customers living in Oakville
    who have spent $2000 or more on labor costs on their car services?
    Include the sum of the laborcost-s in the select. 
    Display the results in descending order of the total amount spent (5 marks).
    A car may have been serviced multiple times so be sure to group by the 
    appropriate fields.

*/
SET linesize 500
SET pagesize 100
SET ECHO ON
SPOOL xxxxxxx.txt

/* 
------------output results -start------------

CUSTNAME             TOTALSPENTONSERVICES
-------------------- --------------------
PHOEBE BUERON                        7896
CHRIS PECKOVER                    2279.44
JIN HWAN OH                          2000



------------output results -end--------------
*/

SELECT
    cust.custname
   ,SUM(si.laborcost) AS totalspentonservices
FROM
    s11.customer cust
   ,s11.servinv si
WHERE
    si.custname = cust.custname
    AND   upper(cust.custcity) = upper('OAKVILLE')
GROUP BY
    cust.custname
HAVING
    SUM(si.laborcost) >= '2000'
ORDER BY
    SUM(si.laborcost) DESC;
    
SPOOL OFF
SET ECHO OFF