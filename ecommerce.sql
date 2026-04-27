CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Product_Category (
    product_id INT,
    category_id INT,
    PRIMARY KEY(product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Item (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customer VALUES
(1, 'Pratham', 'p@gmail.com'),
(2, 'Rahul', 'rahul@gmail.com'),
(3, 'Amit', 'amit@gmail.com'),
(4, 'Sneha', 'sneha@gmail.com'),
(5, 'Kiran', 'kiran@gmail.com'),
(6, 'Anjali', 'anjali@gmail.com'),
(7, 'Ravi', 'ravi@gmail.com'),
(8, 'Meena', 'meena@gmail.com'),
(9, 'Arjun', 'arjun@gmail.com'),
(10, 'Divya', 'divya@gmail.com');

INSERT INTO Product VALUES
(101, 'Laptop', 50000.00),
(102, 'Mobile', 20000.00),
(103, 'Headphones', 2000.00),
(104, 'Keyboard', 1500.00),
(105, 'Mouse', 800.00),
(106, 'Monitor', 12000.00),
(107, 'Tablet', 25000.00),
(108, 'Charger', 500.00),
(109, 'Camera', 30000.00),
(110, 'Speaker', 4000.00);

INSERT INTO Category VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Computers'),
(4, 'Audio'),
(5, 'Mobile Devices');

INSERT INTO Product_Category VALUES
(101, 3),
(102, 5),
(103, 4),
(104, 3),
(105, 2),
(106, 3),
(107, 5),
(108, 2),
(109, 1),
(110, 4);

INSERT INTO Orders VALUES
(201, 1, '2025-04-01'),
(202, 2, '2025-04-02'),
(203, 3, '2025-04-03'),
(204, 4, '2025-04-04'),
(205, 5, '2025-04-05'),
(206, 6, '2025-04-06'),
(207, 7, '2025-04-07'),
(208, 8, '2025-04-08'),
(209, 9, '2025-04-09'),
(210, 10, '2025-04-10');

INSERT INTO Order_Item VALUES
(201, 101, 1),
(202, 102, 2),
(203, 103, 1),
(204, 104, 1),
(205, 105, 3),
(206, 106, 1),
(207, 107, 1),
(208, 108, 2),
(209, 109, 1),
(210, 110, 2);

INSERT INTO Payment (payment_id, order_id, amount, status) VALUES
(1, 201, 50000.00, 'Completed'),
(2, 202, 40000.00, 'Completed'),
(3, 203, 2000.00, 'Pending'),
(4, 204, 1500.00, 'Completed'),
(5, 205, 2400.00, 'Completed'),
(6, 206, 12000.00, 'Pending'),
(7, 207, 25000.00, 'Completed'),
(8, 208, 1000.00, 'Completed'),
(9, 209, 30000.00, 'Completed'),
(10, 210, 8000.00, 'Pending');

SELECT c.name, o.order_id
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT SUM(amount) AS total_revenue
FROM Payment
WHERE status = 'Completed';

SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Item
GROUP BY product_id;

SELECT * FROM Orders
WHERE order_date > '2025-01-01';

SELECT c.name, p.name, oi.quantity
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Item oi ON o.order_id = oi.order_id
JOIN Product p ON oi.product_id = p.product_id;