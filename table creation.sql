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