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