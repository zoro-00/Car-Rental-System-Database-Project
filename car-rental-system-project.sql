CREATE DATABASE IF NOT EXISTS car_rental_system_db_project;
USE car_rental_system_db_project;

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    license_no VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50),
    salary DECIMAL(10,2),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Cars (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    model VARCHAR(100),
    brand VARCHAR(50),
    year INT,
    rent_per_day DECIMAL(10,2),
    status ENUM('Available', 'Rented', 'Maintenance') DEFAULT 'Available',
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    car_id INT,
    emp_id INT,
    start_date DATE,
    end_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    rental_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method ENUM('Cash', 'Credit Card', 'Debit Card', 'UPI', 'Net Banking'),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX idx_customer_email ON Customers(email);
CREATE INDEX idx_customer_license ON Customers(license_no);
CREATE INDEX idx_car_status ON Cars(status);
CREATE INDEX idx_payment_method ON Payments(payment_method);

INSERT INTO Branches (branch_id, branch_name, city) VALUES 
(1, 'Downtown', 'Mumbai'),
(2, 'Airport', 'Delhi'),
(3, 'City Center', 'Bangalore'),
(4, 'Beach Road', 'Goa');

INSERT INTO Employees (emp_id, name, role, salary, branch_id) VALUES 
(1, 'Amit Sharma', 'Manager', 50000, 1),
(2, 'Priya Singh', 'Agent', 32000, 2),
(3, 'Ravi Verma', 'Clerk', 25000, 1),
(4, 'Neha Kapoor', 'Agent', 31000, 3),
(5, 'Rohit Jain', 'Supervisor', 45000, 4);

INSERT INTO Customers (name, phone, email, license_no, city) VALUES
('Raj Kumar', '9876543210', 'raj@gmail.com', 'DL12345', 'Delhi'),
('Sneha Mehta', '9123456789', 'sneha@gmail.com', 'MH67890', 'Mumbai'),
('Anil Deshmukh', '9988776655', 'anil@gmail.com', 'MH11223', 'Pune'),
('Divya Patel', '9898989898', 'divya@gmail.com', 'GJ55667', 'Ahmedabad'),
('Manish Tiwari', '9871234567', 'manish@gmail.com', 'UP66778', 'Lucknow'),
('Kavita Rao', '9123004567', 'kavita@gmail.com', 'KA99887', 'Bangalore'),
('Aditya Singh', '9012345678', 'aditya@gmail.com', 'DL88990', 'Delhi'),
('Pooja Nair', '9001112233', 'pooja@gmail.com', 'KL33445', 'Kochi');

INSERT INTO Cars (model, brand, year, rent_per_day, status, branch_id) VALUES
('Swift', 'Maruti', 2022, 1500, 'Available', 1),
('Creta', 'Hyundai', 2021, 2500, 'Rented', 2),
('Fortuner', 'Toyota', 2020, 3500, 'Maintenance', 1),
('City', 'Honda', 2023, 2800, 'Available', 3),
('Venue', 'Hyundai', 2022, 2200, 'Available', 2),
('Ertiga', 'Maruti', 2021, 1800, 'Rented', 1),
('Seltos', 'Kia', 2022, 3000, 'Available', 3),
('Thar', 'Mahindra', 2023, 4000, 'Rented', 4),
('XUV700', 'Mahindra', 2023, 4500, 'Available', 4),
('Baleno', 'Maruti', 2022, 1600, 'Available', 1);

INSERT INTO Rentals (customer_id, car_id, emp_id, start_date, end_date, total_amount) VALUES
(1, 2, 2, '2025-10-01', '2025-10-05', 10000),
(2, 1, 1, '2025-10-03', '2025-10-07', 6000),
(3, 4, 4, '2025-09-20', '2025-09-25', 14000),
(4, 5, 2, '2025-09-28', '2025-10-02', 8800),
(5, 6, 3, '2025-10-05', '2025-10-10', 9000),
(6, 8, 5, '2025-10-02', '2025-10-06', 16000),
(7, 3, 1, '2025-09-10', '2025-09-12', 7000),
(8, 9, 4, '2025-10-04', '2025-10-08', 18000),
(2, 10, 3, '2025-09-25', '2025-09-28', 4800),
(1, 7, 2, '2025-10-08', '2025-10-11', 9000);

INSERT INTO Payments (rental_id, payment_date, amount, payment_method) VALUES
(1, '2025-10-05', 10000, 'UPI'),
(2, '2025-10-07', 6000, 'Credit Card'),
(3, '2025-09-25', 14000, 'Cash'),
(4, '2025-10-02', 8800, 'UPI'),
(5, '2025-10-10', 9000, 'Debit Card'),
(6, '2025-10-06', 16000, 'UPI'),
(7, '2025-09-12', 7000, 'Net Banking'),
(8, '2025-10-08', 18000, 'UPI'),
(9, '2025-09-28', 4800, 'Credit Card'),
(10, '2025-10-11', 9000, 'Cash');

SELECT * FROM Customers;
SELECT * FROM Cars;
SELECT * FROM Rentals;
SELECT * FROM Payments;

SELECT model, brand, rent_per_day
FROM Cars
WHERE status = 'Available';

SELECT name, phone
FROM Customers
WHERE city = 'Delhi';

SELECT r.rental_id, c.name AS customer, ca.model, r.start_date, r.end_date
FROM Rentals r
JOIN Customers c ON r.customer_id = c.customer_id
JOIN Cars ca ON r.car_id = ca.car_id;

SELECT *
FROM Rentals
WHERE total_amount > 7000;

SELECT SUM(total_amount) AS Total_Earnings
FROM Rentals;

SELECT *
FROM Cars
WHERE rent_per_day = (SELECT MAX(rent_per_day) FROM Cars);

SELECT status, COUNT(*) AS count
FROM Cars
GROUP BY status;

SELECT e.name, COUNT(r.rental_id) AS total_rentals
FROM Employees e
LEFT JOIN Rentals r ON e.emp_id = r.emp_id
GROUP BY e.name;

SELECT DISTINCT c.name
FROM Customers c
JOIN Rentals r ON c.customer_id = r.customer_id
JOIN Cars ca ON r.car_id = ca.car_id
WHERE ca.brand = 'Toyota';

SELECT c.name, AVG(r.total_amount) AS avg_amount
FROM Customers c
JOIN Rentals r ON c.customer_id = r.customer_id
GROUP BY c.name;

SELECT b.branch_name, SUM(r.total_amount) AS branch_earnings
FROM Branches b
JOIN Cars ca ON b.branch_id = ca.branch_id
JOIN Rentals r ON ca.car_id = r.car_id
GROUP BY b.branch_name;

SELECT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Rentals
    WHERE emp_id = (
        SELECT emp_id
        FROM Employees
        WHERE name = 'Priya Singh'
    )
);

SELECT *
FROM Payments
WHERE payment_method = 'UPI';

SELECT *
FROM Cars
WHERE car_id NOT IN (SELECT car_id FROM Rentals);

SELECT c.name
FROM Customers c
JOIN Rentals r ON c.customer_id = r.customer_id
JOIN Payments p ON r.rental_id = p.rental_id
WHERE p.amount > (SELECT AVG(amount) FROM Payments);

SELECT *
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

SELECT *
FROM Cars
WHERE rent_per_day > (SELECT AVG(rent_per_day) FROM Cars);

SELECT *
FROM Rentals
WHERE total_amount > (
    SELECT MAX(amount)
    FROM Payments
    WHERE payment_method = 'Cash'
);

SELECT name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Rentals
    WHERE car_id IN (
        SELECT car_id
        FROM Cars
        WHERE brand = 'Hyundai'
    )
);

SELECT c.name
FROM Customers c
WHERE customer_id IN (
    SELECT r.customer_id
    FROM Rentals r
    JOIN Payments p ON r.rental_id = p.rental_id
    WHERE p.payment_method = 'UPI'
);

SELECT *
FROM Branches
WHERE branch_id IN (
    SELECT branch_id
    FROM Cars
    WHERE status = 'Available'
);

SELECT *
FROM Cars
WHERE branch_id = (
    SELECT branch_id
    FROM Branches
    WHERE city = 'Goa'
);

SELECT name
FROM Employees
WHERE emp_id IN (
    SELECT emp_id
    FROM Rentals
    WHERE total_amount > (
        SELECT AVG(total_amount)
        FROM Rentals
    )
);

SELECT *
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Rentals
    WHERE end_date > '2025-10-05'
);

SELECT brand
FROM Cars
WHERE rent_per_day = (SELECT MIN(rent_per_day) FROM Cars);

SELECT branch_name
FROM Branches
WHERE branch_id IN (
    SELECT branch_id
    FROM Cars
    WHERE car_id IN (
        SELECT car_id
        FROM Rentals
        WHERE total_amount = (
            SELECT MAX(total_amount)
            FROM Rentals
        )
    )
);
