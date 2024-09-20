SELECT * FROM hotel_booking


--Reservas del 2016 con un espacio para su automovil.
SELECT * FROM hotel_booking
WHERE arrival_date_year = '2016' AND required_car_parking_spaces = '1';

--Total de personas de cada pais de cada hotel.
SELECT DISTINCT(country), COUNT(country) as Total_Turistas FROM Resort_Hotel
GROUP BY country;

SELECT DISTINCT(country), COUNT(country) as Total_Turistas FROM City_Hotel
GROUP BY country;

SELECT DISTINCT(country), COUNT(country) as Total_Turistas FROM hotel_booking
GROUP BY country;

--

