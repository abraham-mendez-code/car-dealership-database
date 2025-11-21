# Find the dealership where a certain car is located, by VIN
USE car_dealership;

SELECT
	VIN
	,d.name AS 'Dealership'
    ,d.Address
    ,d.Phone
FROM
	dealerships d
	JOIN inventory i ON i.Dealership_ID = d.Dealership_ID
    WHERE
		VIN = 10000044;