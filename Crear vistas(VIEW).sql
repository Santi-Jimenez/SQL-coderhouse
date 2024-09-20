SELECT * FROM hotel_booking

--Vista de los datos de los clientes 
CREATE VIEW Datos_Clientes
AS
SELECT name, country, required_car_parking_spaces, reservation_status, arrival_date From hotel_booking
--SELECT * FROM Datos_Clientes

--Vista de cantidad de adultos, chicos, bebes y comida
CREATE VIEW Huespedes_Comida
AS
SELECT adults, children, babies, meal  FROM hotel_booking
--SELECT * FROM Huespedes_Comida

--Vista de ResortHotel y CityHotel
CREATE VIEW Resort_Hotel
AS
SELECT * FROM hotel_booking
WHERE hotel = 'Resort Hotel'
--SELECT * FROM Resort_Hotel

CREATE VIEW City_Hotel
AS
SELECT * FROM hotel_booking
WHERE hotel = 'City Hotel'
--SELECT * FROM City_Hotel
-------------------------------------------------------------