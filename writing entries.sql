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