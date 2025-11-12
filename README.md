# 🚗 Car Rental Management System (MySQL)

## 📖 Overview
The **Car Rental Management System** is a relational database designed to handle all operations of a car rental company — including **customers, cars, branches, employees, rentals, and payments**.  
It provides insights into rental activity, earnings, car availability, employee performance, and customer behavior through SQL queries and reports.

## 🧱 Database Design

### Database Name
```
car_rental_system_db_project
```

### Entities (Tables)
| Table Name | Description |
|-------------|-------------|
| **Branches** | Stores information about car rental branches across cities. |
| **Employees** | Stores details about employees (managers, agents, clerks, etc.). |
| **Customers** | Contains customer details like name, contact, license number, and city. |
| **Cars** | Contains information about all available cars and their rental rates. |
| **Rentals** | Links customers, cars, and employees for each rental transaction. |
| **Payments** | Records payments made for rentals, including mode and amount. |

## 🧩 Entity Relationships
- **Branches ↔ Employees** → One branch can have many employees.  
- **Branches ↔ Cars** → One branch can own many cars.  
- **Customers ↔ Rentals** → One customer can have multiple rentals.  
- **Cars ↔ Rentals** → One car can be rented multiple times.  
- **Employees ↔ Rentals** → One employee handles multiple rentals.  
- **Rentals ↔ Payments** → One rental corresponds to one payment.

## 🗂️ Table Structure Summary
| Table | Primary Key | Foreign Keys | Key Columns |
|--------|--------------|--------------|--------------|
| **Branches** | branch_id | — | branch_name, city |
| **Employees** | emp_id | branch_id → Branches | name, role, salary |
| **Customers** | customer_id | — | name, phone, license_no, city |
| **Cars** | car_id | branch_id → Branches | model, brand, rent_per_day, status |
| **Rentals** | rental_id | customer_id → Customers, car_id → Cars, emp_id → Employees | start_date, end_date, total_amount |
| **Payments** | payment_id | rental_id → Rentals | amount, payment_method |

## 💾 Data Types Used
| Type | Description | Example |
|------|--------------|----------|
| `INT` | Integer / Auto Increment ID | 1, 2, 3 |
| `VARCHAR(n)` | Variable-length string | 'Delhi', 'Honda' |
| `DECIMAL(10,2)` | Monetary values | 2500.50 |
| `ENUM` | Predefined valid string values | 'Available', 'Rented' |
| `DATE` | Calendar date | '2025-10-05' |

## ⚙️ Key Features
- Tracks car availability, maintenance, and rental prices.  
- Records which employee handled which rental.  
- Calculates total and average earnings.  
- Identifies top customers and high-value transactions.  
- Maintains referential integrity with foreign keys and cascade updates.

## 🧾 SQL Queries
### Regular Queries (15)
- Display all customers, cars, rentals, and payments.  
- List available cars.  
- Find customers from a specific city.  
- Join customers, cars, and rentals.  
- Compute total and average earnings.  
- Group cars by status.  
- Count rentals handled by each employee.  
- Find customers who rented specific brands.

### Subqueries (15)
- Find customers handled by a specific employee.  
- List cars not yet rented.  
- Find employees earning above average.  
- Find cars with rent higher than average.  
- Retrieve branches that have available cars.  
- List customers who paid via UPI.  
- Identify cars with min/max rent.  
- Show branches with highest-earning rentals.

## 🧮 Example Query
```sql
SELECT b.branch_name, SUM(r.total_amount) AS branch_earnings
FROM Branches b
JOIN Cars ca ON b.branch_id = ca.branch_id
JOIN Rentals r ON ca.car_id = r.car_id
GROUP BY b.branch_name
HAVING SUM(r.total_amount) > 5000;
```

## 🧠 Tech Used
- MySQL 8.0+  
- phpMyAdmin / MySQL Workbench  
- ER Diagram Tool: dbdiagram.io / Draw.io

## 🚀 Setup Instructions
1. Open MySQL Workbench or phpMyAdmin.  
2. Create a new database and run the SQL script:  
   ```sql
   car-rental-system-project
   ```
3. Run queries at the end of the script to test outputs.

## 👨‍💻 Author
**Rishi shahu**  
Created as a practical SQL project for learning **Database Design, Normalization, and Query Optimization**.

## 🏁 License
This project is open-source under the **MIT License**.
