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
