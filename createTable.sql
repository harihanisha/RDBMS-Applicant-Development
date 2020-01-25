/*
File:              xxxx.sql
Author:             Hellen Harry
Oracle Username:    xxxxx
Description:  creating the log file:

CREATE TABLE carlog(
    username VARCHAR2(40),
   operation CHAR(6),
      opdate DATE,
      serial CHAR(8),
        make VARCHAR2(10),
       model VARCHAR2(10),
      colour VARCHAR2(12)
);

   
*/
/* 
------------output results -start------------

Table CARLOG dropped.


Table CARLOG created.



------------output results -end--------------
*/SET LINESIZE 132

SET PAGESIZE 255

SET SERVEROUTPUT ON

SET VERIFY ON

DROP TABLE carlog;

CREATE TABLE carlog (
    username    VARCHAR2(40)
   ,operation   CHAR(6)
   ,opdate      DATE
   ,serial      CHAR(8)
   ,make        VARCHAR2(10)
   ,model       VARCHAR2(10)
   ,colour      VARCHAR2(12)
);