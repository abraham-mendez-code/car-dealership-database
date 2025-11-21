# Find all Dealerships that have a certain car type 
USE car_dealership;

SELECT
	d.Dealership_ID
    ,d.Name
    ,d.Address
    ,d.Phone
    ,v.VIN
    ,v.Year
    ,v.Make
    ,v.Model
    ,v.Vehicle_Type
    ,v.Price
FROM
	dealerships d
    JOIN inventory i ON i.Dealership_ID = d.Dealership_ID
    JOIN vehicles v ON v.VIN = i.VIN
WHERE
	Vehicle_Type = 'Sedan'
ORDER BY
	price DESC
    ,Model;