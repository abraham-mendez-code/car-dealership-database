# Get all sales information for a specific dealer for a specific date range
USE car_dealership;

SELECT 
	Contract_ID
    ,s.Dealership_ID
    ,d.Name
    ,s.VIN
    ,s.Customer_ID
    ,s.Date
    ,s.Tax
    ,s.Recording_Fee
    ,s.Processing_Fee
    ,s.Financed
    ,s.Principal
    ,s.Monthly_Payment
    ,s.Final_Total
FROM 
	sales_contracts s
	JOIN dealerships d ON d.Dealership_ID = s.Dealership_ID
WHERE
	s.Dealership_ID = 1 AND
    s.Date BETWEEN '2025-11-15' AND '2025-11-16';