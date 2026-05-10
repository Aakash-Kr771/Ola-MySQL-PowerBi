CREATE SCHEMA ola;
USE ola;

CREATE TABLE booking(
Date DATE,
Time TIME,
Booking_ID VARCHAR(30),
Booking_Status VARCHAR(30),
Customer_ID VARCHAR(30),
Vehicle_Type VARCHAR(30),
Pickup_Location VARCHAR(30),
Drop_Location VARCHAR(30),
V_TAT INT,
C_TAT INT,
Canceled_Rides_by_Customer VARCHAR(50),
Canceled_Rides_by_Driver VARCHAR(50),
Incomplete_Rides VARCHAR(50),
Incomplete_Rides_Reason VARCHAR(50),
Booking_Value INT,
Payment_Method VARCHAR(20),
Ride_Distance INT,
Driver_Ratings INT,
Customer_Rating INT
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bookings_cleaned.csv'
INTO TABLE booking
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM booking;

-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT * FROM booking WHERE Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW  ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance FROM booking GROUP BY
Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW  cancelled_rides_by_customers AS
SELECT COUNT(*) FROM booking WHERE Booking_Status = 'cancelled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW  Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM booking GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW  Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM booking WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW  Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
booking WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW  UPI_Payment AS
SELECT * FROM booking WHERE Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW  AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM booking
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) as total_successful_value FROM booking WHERE
Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM booking WHERE Incomplete_Rides =
'Yes';


-- 1. Retrieve all successful bookings:
SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
SELECT * FROM ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
SELECT * FROM  cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT * FROM Top_5_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM  Max_Min_Driver_Rating;

-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM  UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
SELECT * FROM  AVG_Cust_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT * FROM total_successful_ride_value;

-- 10. List all incomplete rides along with the reason:
SELECT * FROM Incomplete_Rides_Reason;