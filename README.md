
# Car Dealership Database

## 📌 Overview
This project provides a **MySQL 8 database schema with preloaded data** for managing car dealership operations, along with a set of **test SQL scripts** to validate and demonstrate common queries.

## ✅ Features
- **Complete Database Setup**:
  - Tables for dealerships, vehicles, customers, and sales.
  - Preloaded sample data for testing.
- **Test Query Scripts**:
  - Get all dealerships.
  - List vehicles for a specific dealership.
  - Find vehicle by VIN.
  - Find dealership by vehicle VIN.
  - Find dealerships by vehicle type.
  - Get dealer sales within a date range.

## 🛠️ Tech Stack
- **Database:** MySQL 8
- **Language:** SQL

## ✅ Example Use Cases
- Quickly retrieve dealership lists.
- Find vehicles by VIN or dealership.
- Generate sales reports for a date range.

## 📂 Project Structure
```
CarDealership.My.SQL8.sql                # Database schema + sample data
01_test_get_dealerships.sql             # Query: Get all dealerships
02_test_get_vehicles_from_dealership.sql# Query: List vehicles for a dealership
03_test_find_vehicle_by_vin.sql         # Query: Find vehicle by VIN
04_test_find_dealership_by_vin.sql      # Query: Find dealership by VIN
05_test_find_dealership_by_vehicle_type.sql # Query: Find dealerships by type
06_test_find_dealership_by_sale_date_range.sql # Query: Sales within date range
```

## 🔍 One Interesting Discovery
During this project, I explored **using foreign keys to enforce relationships between tables** and learned how to **add them dynamically using `ALTER TABLE`**. This approach ensures **referential integrity** without having to recreate tables from scratch.

Example:
```sql
ALTER TABLE Lease_Contracts
ADD CONSTRAINT FK_Lease_Vehicles
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN);
