
#team 20 swt22/23



CREATE DATABASE ONLINE_TICKET_BOOKING
USE ONLINE_TICKET_BOOKING

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

#TABLE FOR CUSTOMER ACCOUNT

CREATE TABLE CustomerAccount
(
    E_MAILADDRESS VARCHAR(50) PRIMARY KEY,
    PASSWORD VARCHAR(50) NOT NULL
   
);

#TABLE FOR ListOfFuturePerformance

CREATE TABLE ListOfFuturePerformance
(
    id INTEGER(50) PRIMARY KEY AUTO_INCREMENT,
    titel_of_the_performance VARCHAR(50) NOT NULL,
    duration time NOT NULL DEFAULT '00:00:00',
    assigned_hall VARCHAR(50) NOT NULL,
    start_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
);



#TABLE FOR BOOKING

CREATE TABLE Booking
(
    performanceID INTEGER(50) ,
    customer_email VARCHAR(50) NOT NULL,
    creationDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    rows_number VARCHAR(50) NOT NULL,
    seat_number VARCHAR(50) NOT NULL,
    seat_quantity VARCHAR(50) NOT NULL,
    FOREIGN KEY(performanceID) REFERENCES ListOfFuturePerformance(ID)
);

 
 
#TABLE FOR ListOfArchivePerformance

CREATE TABLE ListOfArchivePerformance
(
    id INTEGER(50) not null,
    titel_of_the_performance VARCHAR(50) NOT NULL,
    duration timestamp NOT NULL DEFAULT '00:00:00',
    assigned_hall VARCHAR(50) NOT NULL,
    start_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
    
);

# INSERT VALUE INTO CustomerAccount


INSERT INTO CustomerAccount  VALUES
('hossain.mdshakhawat@uni-due.de', 'hossain123'),('nazmul.anik@uni-due.de', 'anik6754'),('anamul.haque@uni-due.de', 'haque'),
('zafor.iqbal@uni-due.de', '124zaf'),('nayem.nazrul@uni-due.de', 'nay12em');


#INSERT VALUE INTO ListOfFuturePerformance

INSERT INTO ListOfFuturePerformance (titel_of_the_performance,duration,assigned_hall,start_time) VALUES
('Advanture23','02:20:49','Hall21','2023-02-21 08:30:00'),('action','03:20:49','Hall23','2023-02-24 09:30:00'),('Avetar2','03:10:49','Hall21','2023-02-03 10:30:00'),
('iron_man','02:20:49','Hall25','2023-02-20 18:30:00'),('titanic','03:30:49','Hall24','2023-03-30 19:30:00'),('Advanture1','02:50:49','Hall21','2023-02-10 18:30:00');


select * from ListOfFuturePerformance



#INSERT VALUE INTO  booking

INSERT INTO Booking (performanceid,customer_email,rows_number,seat_number,seat_quantity) VALUES
(1,'hossain.mdshakhawat@uni-due.de','07','8 and 9','2'),(1,'nazmul.anik@uni-due.de','06','2 and 4','2'),
(1,'zafor.iqbal@uni-due.de','03',' 3 ,4, 9','3'),(1,'nayem.nazrul@uni-due.de','02','12 and 13','2')



select * from booking

#CREATE VIEW FOR performanceList WITH  ACENDING ORDER 

CREATE VIEW performanceList as select pl.id , pl.titel_of_the_performance,pl.duration,assigned_hall,pl.start_time from ListOfFuturePerformance as pl 
order by start_time Asc

select * from performanceList




#CREATE BOOKING

SELECT * FROM ListOfFuturePerformance WHERE start_time-15>= CURRENT_TIMESTAMP 


#CREATE TRIGGER FOR ARCHIVE LIST AND DELETE PERFORMANCE FROM ListOfFuturePerformance

DELIMITER $$
	CREATE TRIGGER ARCHIVE_LIST
	before delete
    ON ListOfFuturePerformance
	FOR EACH ROW 
	BEGIN 
	IF (OLD.start_time < CURRENT_TIMESTAMP) THEN
	INSERT INTO ListOfArchivePerformance (id , titel_of_the_performance,duration,assigned_hall,start_time)
    VALUES (OLD.id ,OLD.titel_of_the_performance, OLD.duration,OLD.assigned_hall,OLD.start_time);
    END IF;
    END$$
DELIMITER ;


SELECT * FROM ListOfArchivePerformance






