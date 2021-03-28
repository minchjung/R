# 1,2 서술형  
# 3번. 
library(DBI)
Sys.setenv(JAVA_HOME = "C:\\Program Files\\Java\\jdk-15.0.1\\bin")
library(rJava)
library(RJDBC)
library(stringr)

drv <- JDBC("oracle.jdbc.driver.OracleDriver",
            "C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6_g.jar")
conn <- dbConnect(drv,
                  "jdbc:oracle:thin:@//127.0.0.1:1521/xe", "scott", "tiger")
#################################################################################
query<-"drop table CUSTOMERS"
dbGetQuery(conn, query)

# CUSTOMERS TABLE 만들기
query = "create table CUSTOMERS(
CUSTOMER_ID varchar(50) primary key,
NAME varchar(50) not null,
ADDRESS varchar(200),
WEBSITE varchar(200),
CREDIT_LIMIT varchar(30)
)
"
# RECORD추가 
qeury = "insert into CUSTOMERS values('ccjj', '이민주', '부산시 서면로 289-1', http://www.www.www,10)"
qeury = "insert into CUSTOMERS values('abcd', '이영주', '부산시 범서로 189-1', http://www.www.www,20)"
qeury = "insert into CUSTOMERS values('fdad', '길기주', '울산시 당서로 159-1', http://www.www.www,40)"

dbSendUpdate(conn, query)
query ="select*from CUSTOMERS"
dbGetQuery(conn, query)

# ORDERS 테이블
query = "create table ORDERS(
ORDER_ID varchar(50) primary key,
CUSTOMER_ID varchar(50) not null,
STATUS varchar(200),
SALESMAN_ID varchar(200),
ORDER_DATE number(30)
)
"
dbSendUpdate(conn, query)

query = "insert into ORDERS values('2414','ccjj','on','124','20210102')"
query = "insert into ORDERS values('4214','abcd','off','244','20210121')"
query = "insert into ORDERS values('1114','fdad','off','564','20210201')"
dbSendUpdate(conn, query)

#ORDER_ITEMS
query = "create table ORDER_ITEMS(
ORDER_ID varchar(50) not null,
ITEM_ID varchar(50) primary key,
PRODUCT_ID varchar(50),
QUANT number(50),
UNIT_PRICE varchar(50)
)
"
# Record 추가 
query = "insert into ORDER_ITEMS values('c112414','21cc1jj','1154vv','2','50000')"
query = "insert into ORDER_ITEMS values('a114214','1a1b2c3d','2231cc','4','25000')"
query = "insert into ORDER_ITEMS values('d111114','3f1d1a1d','1542cz','1','15000')"
dbSendUpdate(conn, query)
#PRODUCTS
query = "create table CONTACTS(
CONTACT_ID varchar(50) primary key,
FIRST_NAME varchar(50) not null,
LAST_NAME varchar(50),
EMAIL varchar(50),
PHONE varchar(50)
CUSTOMER_ID varchar(50)
)
"
# Record 추가 
query = "insert into CONTACTS values('ccjj','Nofirst','noLast','asdf@gmail.com','010-0000-1111')"
query = "insert into CONTACTS values('abcd','yourNmae','yourLast','adsf@naver.com','010-1234-2500')"
query = "insert into CONTACTS values('fdad','min','Kim','gfadf@gmail.com','010-1542-6985')"
dbSendUpdate(conn, query)

#EMPLOYEE
query = "create table EMPLOYEES(
EMPLOYEE_ID varchar(50) primary key,
FIRST_NAME varchar(50) not null,
LAST_NAME varchar(50) not null,
EMAIL varchar(50) not null,
PHONE varchar(50), not null,
HIRE_DATE varchar(50) not null
)
"
# Record 추가 
query = "insert into EMPLOYEES values('555ASDF','AMY','VANDESAR','asdf@gmail.com','010-0000-1111','2020-01-03')"
query = "insert into EMPLOYEES values('4156AWER','LOHAIKEY','KYLIST','adsf@naver.com','010-1234-2500','2018-01-04')"
query = "insert into EMPLOYEES values('1544FDAD','min','Kim','gfadf@gmail.com','010-1542-6985','1980-08-08')"
dbSendUpdate(conn, query)

#INVENTORS
query = "create table INVENTORIES(
PRODUCT_ID varchar(50) not null,
WAREHOUSE_ID varchar(50) primary key,
QUANTITY varchar(50),
)
"
# Record 추가 
query = "insert into INVENTORIES values('12SDFAAF','ADFEAD1111','50000')"
query = "insert into INVENTORIES values('6AWERDDF','AFFFED1123','100000')"
query = "insert into INVENTORIES values('1544FDAF','AEEEEAD112','1550')"
dbSendUpdate(conn, query)

# PRODUCT_CATEGORIES
query = "create table PRODUCT_CATEGORIES(
COUNTRYRY_ID varchar(50) primary key,
WAREHOUSE_ID varchar(50) not null
)
"
query = "insert into PRODUCT_CATEGORIES values('12SDFAAF','ADFEAD1111')"
query = "insert into PRODUCT_CATEGORIES values('6AWERDDF','AFFFED1123')"
query = "insert into PRODUCT_CATEGORIES values('1544FDAF','AEEEEAD112')"
dbSendUpdate(conn, query)

# REGIONS
query = "create table REGIONS(
REGION_ID varchar(50) primary key,
REGION_NAME varchar(50) not null
)
"
query = "insert into REGIONS values('12SDFAAF','ADFEAD1111')"
query = "insert into REGIONS values('6AWERDDF','AFFFED1123')"
query = "insert into REGIONS values('1544FDAF','AEEEEAD112')"
dbSendUpdate(conn, query)

# COUNTRIES
query = "create table COUNTRIES(
COUNTRY_ID varchar(50) primary key,
COUNTRY_NAME varchar(50) not null
)
"
query = "insert into COUNTRIES values('ADAF515ASDF12','S.KOREA')"
query = "insert into COUNTRIES values('AAWERDDFASD42','USA')"
query = "insert into COUNTRIES values('AAAADFEADFA44','UAE')"
dbSendUpdate(conn, query)

# LOCATIONS
query = "create table LOCATIONS(
LOCATION_ID varchar(50) primary key,
COUNTRY_NAME varchar(50) not null,
COUNTRY_ID varchar(50) not null
)
"
query = "insert into LOCATIONS values('ADAF515ASDF12','S.KOREA')"
query = "insert into LOCATIONS values('AAWERDDFASD42','USA')"
query = "insert into LOCATIONS values('AAAADFEADFA44','UAE')"
dbSendUpdate(conn, query)

# WAREHOUSES
query = "create table WAREHOUSES(
WAREHOUSE_ID varchar(50) primary key,
WAREHOUSE_NAME varchar(50) not null
LOCATION_ID
)
"
query = "insert into WAREHOUSES values('154214A','HOMEDEPOT','WHATKINDOFIDYOUWANT')"
query = "insert into WAREHOUSES values('542W42A','LEWIS','NOIDTOPUTYOUPUMPKIN')"
query = "insert into WAREHOUSES values('15AA44D','GOGU','LASTWORDTOSAY')"
dbSendUpdate(conn, query)
