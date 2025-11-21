# Find all vehicles for a specific dealership
USE car_dealership;

SELECT
    d.Name
    ,v.VIN
    ,v.Year
    ,v.Make
    ,v.Model
    ,v.Vehicle_Type
    ,v.Color
    ,v.Price
    ,v.Sold
FROM
	Vehicles v
    JOIN inventory i ON i.VIN = v.VIN
    JOIN dealerships d ON d.Dealership_ID = i.Dealership_ID
WHERE 
    d.Dealership_ID = 1;