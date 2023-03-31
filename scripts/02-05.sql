------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BASEITEM"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BASEITEM" (
    "BASEITEM_ID" BIGINT NOT NULL,
    "MEMBER_ID" BIGINT NOT NULL,
    "ITEMTYPE_ID" CHAR(4 OCTETS) NOT NULL,
    "QUANTITYMEASURE" CHAR(16 OCTETS) NOT NULL WITH DEFAULT 'C62',
    "LASTUPDATE" TIMESTAMP,
    "MARKFORDELETE" INTEGER NOT NULL WITH DEFAULT 0,
    "PARTNUMBER" VARCHAR(72 OCTETS) NOT NULL,
    "QUANTITYMULTIPLE" DOUBLE NOT NULL WITH DEFAULT 1.0,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BASEITEM"
ALTER TABLE "DB2ADMIN"."BASEITEM"
ADD PRIMARY KEY ("BASEITEM_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BASEITEM"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000040" ON "DB2ADMIN"."BASEITEM" ("MEMBER_ID" ASC, "PARTNUMBER" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BASEITMDSC"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BASEITMDSC" (
    "BASEITEM_ID" BIGINT NOT NULL,
    "LANGUAGE_ID" INTEGER NOT NULL,
    "SHORTDESCRIPTION" VARCHAR(254 OCTETS),
    "LONGDESCRIPTION" VARCHAR(4000 OCTETS),
    "LASTUPDATE" TIMESTAMP,
    "OPTCOUNTER" SMALLINT
) IN "TAB8K" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BASEITMDSC"
ALTER TABLE "DB2ADMIN"."BASEITMDSC"
ADD PRIMARY KEY ("BASEITEM_ID", "LANGUAGE_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BID"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BID" (
    "BID_ID" BIGINT NOT NULL,
    "REFCODE" CHAR(36 OCTETS) NOT NULL,
    "AUCPAYINFO_ID" BIGINT,
    "OWNER_ID" BIGINT NOT NULL,
    "STORE_ID" INTEGER,
    "ADMIN_ID" BIGINT,
    "AUCT_ID" BIGINT NOT NULL,
    "BIDQUANT" DOUBLE NOT NULL,
    "BIDPRICE" DECIMAL(20, 5) NOT NULL,
    "BIDTIME" TIMESTAMP NOT NULL,
    "WINOPT" CHAR(4 OCTETS) NOT NULL,
    "BIDSTATUS" CHAR(4 OCTETS) NOT NULL,
    "PAYTYPE" CHAR(64 OCTETS) NOT NULL,
    "ENCRYPT" INTEGER NOT NULL,
    "DEVICE" VARCHAR(64 OCTETS) NOT NULL,
    "EXPDATE" TIMESTAMP NOT NULL,
    "QUANTSCALE" INTEGER,
    "AUTOBID_ID" BIGINT,
    "BIDROOT" BIGINT,
    "BKNAME" VARCHAR(254 OCTETS),
    "SHIPTO_ID" BIGINT,
    "SHIPMODE" INTEGER,
    "WINPRICE" DECIMAL(20, 5),
    "WINQUANT" DOUBLE,
    "BIDMSG" VARCHAR(254 OCTETS),
    "FIELD1" BIGINT,
    "FIELD2" DECIMAL(20, 5),
    "FIELD3" VARCHAR(254 OCTETS),
    "BILLADDR" BIGINT,
    "INITPRICE" DECIMAL(20, 5),
    "LIMITPRICE" DECIMAL(20, 5),
    "BIDMODE" CHAR(4 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BID"
ALTER TABLE "DB2ADMIN"."BID"
ADD PRIMARY KEY ("BID_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000041" ON "DB2ADMIN"."BID" ("REFCODE" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000474" ON "DB2ADMIN"."BID" ("OWNER_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000475" ON "DB2ADMIN"."BID" ("STORE_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0001243" ON "DB2ADMIN"."BID" ("AUCPAYINFO_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0001244" ON "DB2ADMIN"."BID" ("AUCT_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000042" ON "DB2ADMIN"."BID" ("AUTOBID_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000043" ON "DB2ADMIN"."BID" ("BIDQUANT" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000044" ON "DB2ADMIN"."BID" ("BIDPRICE" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000045" ON "DB2ADMIN"."BID" ("BIDSTATUS" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BID"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000473" ON "DB2ADMIN"."BID" ("ADMIN_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BIDLOG"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BIDLOG" (
    "BID_ID" BIGINT NOT NULL,
    "ACTIONTIME" TIMESTAMP NOT NULL,
    "ACTIONTYPE" INTEGER,
    "AUCPAYINFO_ID" BIGINT,
    "STORE_ID" INTEGER,
    "OWNER_ID" BIGINT,
    "ADMIN_ID" BIGINT,
    "ACTIONMSG" VARCHAR(254 OCTETS),
    "REFCODE" CHAR(36 OCTETS),
    "AUCT_ID" BIGINT,
    "BIDQUANT" DOUBLE,
    "BIDPRICE" DECIMAL(20, 5),
    "BIDTIME" TIMESTAMP,
    "WINOPT" CHAR(4 OCTETS),
    "BIDSTATUS" CHAR(4 OCTETS),
    "PAYTYPE" CHAR(64 OCTETS),
    "ENCRYPT" INTEGER,
    "DEVICE" VARCHAR(64 OCTETS),
    "EXPDATE" TIMESTAMP,
    "QUANTSCALE" INTEGER,
    "AUTOBID_ID" BIGINT,
    "BIDROOT" BIGINT,
    "BKNAME" VARCHAR(254 OCTETS),
    "SHIPTO_ID" BIGINT,
    "SHIPMODE" INTEGER,
    "WINPRICE" DECIMAL(20, 5),
    "WINQUANT" DOUBLE,
    "BIDMSG" VARCHAR(254 OCTETS),
    "FIELD1" BIGINT,
    "FIELD2" DECIMAL(20, 5),
    "FIELD3" VARCHAR(254 OCTETS),
    "BILLADDR" BIGINT,
    "INITPRICE" DECIMAL(20, 5),
    "LIMITPRICE" DECIMAL(20, 5),
    "BIDMODE" CHAR(4 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BIDLOG"
ALTER TABLE "DB2ADMIN"."BIDLOG"
ADD PRIMARY KEY ("BID_ID", "ACTIONTIME");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDLOG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000476" ON "DB2ADMIN"."BIDLOG" ("STORE_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDLOG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000477" ON "DB2ADMIN"."BIDLOG" ("ADMIN_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDLOG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000478" ON "DB2ADMIN"."BIDLOG" ("OWNER_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDLOG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0001245" ON "DB2ADMIN"."BIDLOG" ("AUCPAYINFO_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BIDORDRREL"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BIDORDRREL" (
    "BID_ID" BIGINT NOT NULL,
    "CREATETIME" TIMESTAMP,
    "STATUS" CHAR(4 OCTETS),
    "COMMENTS" VARCHAR(254 OCTETS),
    "ORDERS_ID" BIGINT NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BIDORDRREL"
ALTER TABLE "DB2ADMIN"."BIDORDRREL"
ADD PRIMARY KEY ("ORDERS_ID", "BID_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDORDRREL"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000479" ON "DB2ADMIN"."BIDORDRREL" ("BID_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BIDPAYMENT"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BIDPAYMENT" (
    "BIDPAY_ID" BIGINT NOT NULL,
    "BID_ID" BIGINT NOT NULL,
    "AUCPAYINFO_ID" BIGINT,
    "AMOUNT" DECIMAL(20, 5) NOT NULL,
    "TYPE" INTEGER,
    "PAYTIME" TIMESTAMP,
    "PAYTYPE" CHAR(64 OCTETS),
    "ENCRYPT" INTEGER,
    "DEVICE" VARCHAR(64 OCTETS),
    "EXPDATE" TIMESTAMP,
    "BKNAME" VARCHAR(254 OCTETS),
    "COMMENTS" VARCHAR(254 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BIDPAYMENT"
ALTER TABLE "DB2ADMIN"."BIDPAYMENT"
ADD PRIMARY KEY ("BIDPAY_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDPAYMENT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000047" ON "DB2ADMIN"."BIDPAYMENT" ("TYPE" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDPAYMENT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000480" ON "DB2ADMIN"."BIDPAYMENT" ("BID_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BIDPAYMENT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0001246" ON "DB2ADMIN"."BIDPAYMENT" ("AUCPAYINFO_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BILLITEMS"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BILLITEMS" (
    "BTRFNBR" INTEGER NOT NULL,
    "BTITEM" CHAR(25 OCTETS),
    "BTVALTYPE" CHAR(1 OCTETS),
    "BTDESC" VARCHAR(254 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BILLITEMS"
ALTER TABLE "DB2ADMIN"."BILLITEMS"
ADD PRIMARY KEY ("BTRFNBR");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BKORDALLOC"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BKORDALLOC" (
    "BKORDNUM" INTEGER NOT NULL,
    "ORDERITEMS_ID" BIGINT NOT NULL,
    "ITEMSPC_ID" BIGINT NOT NULL,
    "QTYNEEDED" INTEGER,
    "QTYAVAILABLE" INTEGER,
    "QTYALLOCATED" INTEGER,
    "LASTUPDATE" TIMESTAMP,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BKORDALLOC"
ALTER TABLE "DB2ADMIN"."BKORDALLOC"
ADD PRIMARY KEY ("ORDERITEMS_ID", "BKORDNUM");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BKORDALLOC"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000481" ON "DB2ADMIN"."BKORDALLOC" ("ITEMSPC_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BKORDITEM"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BKORDITEM" (
    "ORDERITEMS_ID" BIGINT NOT NULL,
    "DATEEXPECTED" TIMESTAMP,
    "LASTUPDATE" TIMESTAMP,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BKORDITEM"
ALTER TABLE "DB2ADMIN"."BKORDITEM"
ADD PRIMARY KEY ("ORDERITEMS_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BLKRSNCODE"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BLKRSNCODE" (
    "BLKRSNCODE_ID" INTEGER NOT NULL,
    "BLOCKREASONTYPE" CHAR(25 OCTETS) NOT NULL,
    "MANUALBLOCK" SMALLINT NOT NULL,
    "MARKFORDELETE" CHAR(1 OCTETS) NOT NULL,
    "FIELD1" INTEGER,
    "FIELD2" VARCHAR(254 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BLKRSNCODE"
ALTER TABLE "DB2ADMIN"."BLKRSNCODE"
ADD PRIMARY KEY ("BLKRSNCODE_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BLKRSNDESC"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BLKRSNDESC" (
    "BLKRSNCODE_ID" INTEGER NOT NULL,
    "LANGUAGE_ID" INTEGER NOT NULL,
    "DESCRIPTION" VARCHAR(254 OCTETS) NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BLKRSNDESC"
ALTER TABLE "DB2ADMIN"."BLKRSNDESC"
ADD PRIMARY KEY ("BLKRSNCODE_ID", "LANGUAGE_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BROADCAST"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BROADCAST" (
    "MEMBER_ID" BIGINT NOT NULL,
    "STOREENT_ID" INTEGER NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BROADCAST"
ALTER TABLE "DB2ADMIN"."BROADCAST"
ADD PRIMARY KEY ("MEMBER_ID", "STOREENT_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BROADCAST"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000482" ON "DB2ADMIN"."BROADCAST" ("STOREENT_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUACCTDET"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUACCTDET" (
    "BACRFNBR" INTEGER NOT NULL,
    "BACORRFNBR" INTEGER,
    "BACOIRFNBR" INTEGER,
    "BACAMT" DECIMAL(20, 5),
    "BACCUR" CHAR(10 OCTETS),
    "BACPERT" DECIMAL(20, 5),
    "BACCALCODE" CHAR(2 OCTETS),
    "BACBCODE" VARCHAR(30 OCTETS),
    "BACDES" VARCHAR(80 OCTETS),
    "BACFIELD1" VARCHAR(30 OCTETS),
    "BACFIELD2" VARCHAR(30 OCTETS),
    "BACFIELD3" VARCHAR(30 OCTETS),
    "ORDERS_ID" BIGINT,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUACCTDET"
ALTER TABLE "DB2ADMIN"."BUACCTDET"
ADD PRIMARY KEY ("BACRFNBR");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUACCTDET"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000483" ON "DB2ADMIN"."BUACCTDET" ("ORDERS_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUADDR"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUADDR" (
    "BARFNBR" INTEGER NOT NULL,
    "BABURFNBR" INTEGER NOT NULL,
    "BACODE" VARCHAR(17 OCTETS) NOT NULL,
    "BACDTYPE" CHAR(2 OCTETS),
    "BATYPE" CHAR(2 OCTETS) NOT NULL,
    "BANAME" VARCHAR(80 OCTETS),
    "BAADDR1" VARCHAR(50 OCTETS),
    "BAADDR2" VARCHAR(30 OCTETS),
    "BAADDR3" VARCHAR(50 OCTETS),
    "BACITY" VARCHAR(30 OCTETS),
    "BASTATE" VARCHAR(20 OCTETS),
    "BACNTRY" VARCHAR(30 OCTETS),
    "BAZIPC" VARCHAR(20 OCTETS),
    "BASGRFNBR" INTEGER,
    "BAFIELD1" VARCHAR(30 OCTETS),
    "BAFIELD2" VARCHAR(30 OCTETS),
    "BAFIELD3" VARCHAR(30 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUADDR"
ALTER TABLE "DB2ADMIN"."BUADDR"
ADD PRIMARY KEY ("BARFNBR");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUADDR"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000048" ON "DB2ADMIN"."BUADDR" (
    "BACODE" ASC,
    "BABURFNBR" ASC,
    "BATYPE" ASC
) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUADDR"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000484" ON "DB2ADMIN"."BUADDR" ("BABURFNBR" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUCONT"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUCONT" (
    "BCRFNBR" INTEGER NOT NULL,
    "BCBURFNBR" INTEGER NOT NULL,
    "BCLNAME" VARCHAR(30 OCTETS) NOT NULL,
    "BCFNAME" VARCHAR(30 OCTETS),
    "BCMNAME" VARCHAR(30 OCTETS),
    "BCTITLE" VARCHAR(30 OCTETS),
    "BCEMAIL1" VARCHAR(80 OCTETS),
    "BCEMAIL2" VARCHAR(80 OCTETS),
    "BCPHONE1" VARCHAR(80 OCTETS),
    "BCPHONE2" VARCHAR(80 OCTETS),
    "BCFAX" VARCHAR(80 OCTETS),
    "BCFIELD1" VARCHAR(30 OCTETS),
    "BCFIELD2" VARCHAR(30 OCTETS),
    "BCFIELD3" VARCHAR(30 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUCONT"
ALTER TABLE "DB2ADMIN"."BUCONT"
ADD PRIMARY KEY ("BCRFNBR");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUCONT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000485" ON "DB2ADMIN"."BUCONT" ("BCBURFNBR" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUSAUDIT"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUSAUDIT" (
    "BUSAUDIT_ID" BIGINT NOT NULL,
    "SESSION_ID" BIGINT NOT NULL,
    "SEQUENCE" INTEGER NOT NULL,
    "USERS_ID" BIGINT NOT NULL,
    "FOR_USER_ID" BIGINT,
    "AUDIT_TIMESTAMP" TIMESTAMP NOT NULL,
    "EVENT_TYPE" CHAR(3 OCTETS) NOT NULL,
    "SIGNATURE" CHAR(64 OCTETS) FOR BIT DATA NOT NULL,
    "STORE_ID" INTEGER NOT NULL,
    "OCCURENCE" INTEGER NOT NULL,
    "COMMAND_NAME" VARCHAR(254 OCTETS) NOT NULL,
    "SEARCH_FIELD1" VARCHAR(254 OCTETS),
    "SEARCH_FIELD2" VARCHAR(254 OCTETS),
    "SEARCH_FIELD3" VARCHAR(254 OCTETS),
    "SEARCH_FIELD4" VARCHAR(254 OCTETS),
    "SEARCH_FIELD5" VARCHAR(254 OCTETS),
    "PARAMETERS" CLOB(10000000 OCTETS) LOGGED NOT COMPACT,
    "WORKSPACE" CHAR(25 OCTETS),
    "TASKGRP" CHAR(25 OCTETS),
    "TASK" CHAR(25 OCTETS),
    "ACTION" CHAR(1 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUSAUDIT"
ALTER TABLE "DB2ADMIN"."BUSAUDIT"
ADD PRIMARY KEY ("BUSAUDIT_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUSAUDIT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000374" ON "DB2ADMIN"."BUSAUDIT" ("SESSION_ID" ASC, "SEQUENCE" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUSCHN"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUSCHN" (
    "BUSCHN_ID" INTEGER NOT NULL,
    "NAME" CHAR(16 OCTETS) NOT NULL,
    "STATE" CHAR(1 OCTETS) NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUSCHN"
ALTER TABLE "DB2ADMIN"."BUSCHN"
ADD PRIMARY KEY ("BUSCHN_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUSCHNDESC"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUSCHNDESC" (
    "BUSCHN_ID" INTEGER NOT NULL,
    "LANGUAGE_ID" INTEGER NOT NULL,
    "OPTCOUNTER" SMALLINT,
    "DISPLAYNAME" VARCHAR(64 OCTETS) NOT NULL,
    "DESCRIPTION" VARCHAR(254 OCTETS)
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUSCHNDESC"
ALTER TABLE "DB2ADMIN"."BUSCHNDESC"
ADD PRIMARY KEY ("BUSCHN_ID", "LANGUAGE_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUSEVENT"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUSEVENT" (
    "BUSEVENT_ID" BIGINT NOT NULL,
    "SEQUENCE" INTEGER NOT NULL,
    "CREATETSTMP" TIMESTAMP NOT NULL,
    "EVENTDATA" VARCHAR(4000 OCTETS) NOT NULL,
    "CHECKED" SMALLINT,
    "OPTCOUNTER" SMALLINT,
    "EVENT_SEARCHKEY" CHAR(64 OCTETS)
) IN "TAB8K" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUSEVENT"
ALTER TABLE "DB2ADMIN"."BUSEVENT"
ADD PRIMARY KEY ("BUSEVENT_ID", "SEQUENCE");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUSEVENT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0001104" ON "DB2ADMIN"."BUSEVENT" ("CHECKED" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUSPROF"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUSPROF" (
    "USERS_ID" BIGINT NOT NULL,
    "EMPLOYEEID" VARCHAR(20 OCTETS),
    "ORG_ID" BIGINT,
    "ORGUNIT_ID" BIGINT,
    "EMPLOYEETYPE" VARCHAR(128 OCTETS),
    "DEPARTMENTNUM" VARCHAR(128 OCTETS),
    "ALTERNATEID" VARCHAR(20 OCTETS),
    "MANAGER" VARCHAR(256 OCTETS),
    "SECRETARY" VARCHAR(256 OCTETS),
    "REQUISITIONERID" VARCHAR(128 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUSPROF"
ALTER TABLE "DB2ADMIN"."BUSPROF"
ADD PRIMARY KEY ("USERS_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUSPROF"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000324" ON "DB2ADMIN"."BUSPROF" ("REQUISITIONERID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUSPROF"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000486" ON "DB2ADMIN"."BUSPROF" ("ORGUNIT_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUSPROF"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000487" ON "DB2ADMIN"."BUSPROF" ("ORG_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUYERPO"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUYERPO" (
    "BUYERPO_ID" BIGINT NOT NULL,
    "SETCCURR" CHAR(3 OCTETS),
    "ACCOUNT_ID" BIGINT,
    "PONUMBER" VARCHAR(128 OCTETS) NOT NULL,
    "BUYERPOTYP_ID" INTEGER NOT NULL,
    "STATE" INTEGER WITH DEFAULT 0,
    "AMOUNT" DECIMAL(20, 5),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUYERPO"
ALTER TABLE "DB2ADMIN"."BUYERPO"
ADD PRIMARY KEY ("BUYERPO_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYERPO"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000488" ON "DB2ADMIN"."BUYERPO" ("ACCOUNT_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYERPO"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000489" ON "DB2ADMIN"."BUYERPO" ("BUYERPOTYP_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUYERPOTYP"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUYERPOTYP" (
    "BUYERPOTYP_ID" INTEGER NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUYERPOTYP"
ALTER TABLE "DB2ADMIN"."BUYERPOTYP"
ADD PRIMARY KEY ("BUYERPOTYP_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUYORG"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUYORG" (
    "BURFNBR" INTEGER NOT NULL,
    "BUNAME" VARCHAR(80 OCTETS) NOT NULL,
    "BUSHRFNBR" INTEGER NOT NULL,
    "BUPHONE" VARCHAR(80 OCTETS),
    "BUEMAIL" VARCHAR(80 OCTETS),
    "BUFAX" VARCHAR(80 OCTETS),
    "BUADDR1" VARCHAR(50 OCTETS),
    "BUADDR2" VARCHAR(50 OCTETS),
    "BUADDR3" VARCHAR(50 OCTETS),
    "BUCITY" VARCHAR(30 OCTETS),
    "BUSTATE" VARCHAR(20 OCTETS),
    "BUCNTRY" VARCHAR(30 OCTETS),
    "BUZIPC" VARCHAR(20 OCTETS),
    "BUFIELD1" VARCHAR(30 OCTETS),
    "BUFIELD2" VARCHAR(30 OCTETS),
    "BUFIELD3" VARCHAR(30 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUYORG"
ALTER TABLE "DB2ADMIN"."BUYORG"
ADD PRIMARY KEY ("BURFNBR");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUYSUPMAP"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUYSUPMAP" (
    "SUPORG_ID" BIGINT NOT NULL,
    "BUYORGUNIT_ID" BIGINT NOT NULL,
    "CATALOG_ID" BIGINT NOT NULL,
    "PROCPROTCL_ID" INTEGER NOT NULL,
    "CONTRACT_ID" BIGINT,
    "MBRGRP_ID" BIGINT NOT NULL,
    "FIELD1" VARCHAR(64 OCTETS),
    "FIELD2" VARCHAR(64 OCTETS),
    "FIELD3" VARCHAR(64 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUYSUPMAP"
ALTER TABLE "DB2ADMIN"."BUYSUPMAP"
ADD PRIMARY KEY (
        "SUPORG_ID",
        "BUYORGUNIT_ID",
        "PROCPROTCL_ID"
    );
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYSUPMAP"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000490" ON "DB2ADMIN"."BUYSUPMAP" ("BUYORGUNIT_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYSUPMAP"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000491" ON "DB2ADMIN"."BUYSUPMAP" ("CATALOG_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYSUPMAP"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000492" ON "DB2ADMIN"."BUYSUPMAP" ("CONTRACT_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYSUPMAP"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000493" ON "DB2ADMIN"."BUYSUPMAP" ("MBRGRP_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BUYSUPSEC"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BUYSUPSEC" (
    "BUYORG_ID" BIGINT NOT NULL,
    "SUPORG_ID" BIGINT NOT NULL,
    "BUYERLOGONID" VARCHAR(254 OCTETS) NOT NULL,
    "BUYERLOGONPASSWORD" CHAR(128 OCTETS) FOR BIT DATA NOT NULL,
    "SUPLOGONIDTYPE" VARCHAR(64 OCTETS),
    "SUPLOGONID" VARCHAR(254 OCTETS),
    "SUPLOGONPASSWORD" CHAR(128 OCTETS) FOR BIT DATA,
    "AUTHLEVEL" INTEGER NOT NULL,
    "EXPIRYDATE" TIMESTAMP,
    "STATUS" INTEGER,
    "FIELD1" VARCHAR(64 OCTETS),
    "FIELD2" VARCHAR(64 OCTETS),
    "FIELD3" VARCHAR(64 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BUYSUPSEC"
ALTER TABLE "DB2ADMIN"."BUYSUPSEC"
ADD PRIMARY KEY ("BUYORG_ID", "SUPORG_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BUYSUPSEC"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE INDEX "DB2ADMIN"."I0000494" ON "DB2ADMIN"."BUYSUPSEC" ("SUPORG_ID" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BZRPENT"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BZRPENT" (
    "BZRPENT_ID" INTEGER NOT NULL,
    "PATH" VARCHAR(1024 OCTETS) NOT NULL,
    "TYPE" VARCHAR(64 OCTETS),
    "PARENT" INTEGER,
    "DIRECTORY" INTEGER NOT NULL,
    "LASTUPDATE" TIMESTAMP NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BZRPENT"
ALTER TABLE "DB2ADMIN"."BZRPENT"
ADD PRIMARY KEY ("BZRPENT_ID");
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BZRPENTAT"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BZRPENTAT" (
    "BZRPENTAT_ID" INTEGER NOT NULL,
    "BZRPENT_ID" INTEGER NOT NULL,
    "NAME" VARCHAR(254 OCTETS) NOT NULL,
    "VALUE" VARCHAR(254 OCTETS),
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BZRPENTAT"
ALTER TABLE "DB2ADMIN"."BZRPENTAT"
ADD PRIMARY KEY ("BZRPENTAT_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BZRPENTAT"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000049" ON "DB2ADMIN"."BZRPENTAT" ("BZRPENT_ID" ASC, "NAME" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BZRPENTSTG"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BZRPENTSTG" (
    "BZRPENTSTG_ID" INTEGER NOT NULL,
    "BZRPENT_ID" INTEGER NOT NULL,
    "SEQUENCE" INTEGER NOT NULL,
    "VALUE" VARCHAR(4000 OCTETS) NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "TAB8K" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BZRPENTSTG"
ALTER TABLE "DB2ADMIN"."BZRPENTSTG"
ADD PRIMARY KEY ("BZRPENTSTG_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BZRPENTSTG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000050" ON "DB2ADMIN"."BZRPENTSTG" ("BZRPENT_ID" ASC, "SEQUENCE" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BZSRVCFG"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BZSRVCFG" (
    "BZSRVCFG_ID" INTEGER NOT NULL,
    "SERVERNAME" VARCHAR(127 OCTETS) NOT NULL,
    "ENABLED" INTEGER NOT NULL WITH DEFAULT 1,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BZSRVCFG"
ALTER TABLE "DB2ADMIN"."BZSRVCFG"
ADD PRIMARY KEY ("BZSRVCFG_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BZSRVCFG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000051" ON "DB2ADMIN"."BZSRVCFG" ("SERVERNAME" ASC) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BZSVCCFG"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BZSVCCFG" (
    "BZSVCCFG_ID" INTEGER NOT NULL,
    "BZSRVCFG_ID" INTEGER NOT NULL,
    "SERVICENAME" VARCHAR(127 OCTETS) NOT NULL,
    "STOREENT_ID" INTEGER NOT NULL,
    "PROJECTPATH" VARCHAR(1022 OCTETS) NOT NULL,
    "AGENTS" INTEGER NOT NULL WITH DEFAULT -1,
    "SESSIONTIMEOUT" INTEGER NOT NULL WITH DEFAULT 30000,
    "LASTUPDATE" TIMESTAMP NOT NULL,
    "ENABLED" INTEGER NOT NULL WITH DEFAULT 1,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BZSVCCFG"
ALTER TABLE "DB2ADMIN"."BZSVCCFG"
ADD PRIMARY KEY ("BZSVCCFG_ID");
-- DDL Statements for Indexes on Table "DB2ADMIN"."BZSVCCFG"
SET SYSIBM.NLS_STRING_UNITS = 'SYSTEM';
CREATE UNIQUE INDEX "DB2ADMIN"."I0000052" ON "DB2ADMIN"."BZSVCCFG" (
    "SERVICENAME" ASC,
    "STOREENT_ID" ASC,
    "BZSRVCFG_ID" ASC
) COMPRESS NO INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "DB2ADMIN"."BZSVCSTA"
------------------------------------------------
CREATE TABLE "DB2ADMIN"."BZSVCSTA" (
    "BZSVCCFG_ID" INTEGER NOT NULL,
    "CLONE_ID" VARCHAR(32 OCTETS) NOT NULL,
    "STATUSCODE" VARCHAR(32 OCTETS) NOT NULL,
    "OPTCOUNTER" SMALLINT
) IN "USERSPACE1" ORGANIZE BY ROW;
-- DDL Statements for Primary Key on Table "DB2ADMIN"."BZSVCSTA"
ALTER TABLE "DB2ADMIN"."BZSVCSTA"
ADD PRIMARY KEY ("BZSVCCFG_ID", "CLONE_ID");
---