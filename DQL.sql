CREATE TABLE Product(
    Product_id VARCHAR2(20) CONSTRAINT pk_product PRIMARY KEY,
    product_name VARCHAR2(20) CONSTRAINT cons_product NOT NULL,
    Price NUMBER CONSTRAINT check_price CHECK (Price>0),
);

CREATE TABLE Orders(
    Customer_id VARCHAR2(20) CONSTRAINT pk_customer PRIMARY KEY,
    Product_id VARCHAR2(20),
    quantity NUMBER,
    total_amount NUMBER,
    CONSTRAINT fk_customer FOREIGN KEY (Customer_id) REFERENCES Customers (Customer_id),
    CONSTRAINT fk_product FOREIGN KEY (Product_id) REFERENCES Product (Product_id)
);

CREATE TABLE Customers(
    Customer_id VARCHAR2(20),
    Customer_name VARCHAR2(20) CONSTRAINT cons_customer NOT NULL,
    Customer_Tel NUMBER,
    
);

Alter TABLE Product ADD Category VARCHAR2(20);
Alter TABLE Orders ADD OrderDate DATE(SYSDATE);

SELECT * FROM Customers;
SELECT product_name, Category FROM Product WHERE Price BETWEEN 5000 AND 10000;
SELECT * FROM Product ORDER BY Price DESC;
SELECT SUM(quantity), AVG(quantity), MAX(total_amount) AS max_total, MIN(total_amount) AS min_total FROM Orders GROUP BY Product_id;
SELECT Customer_id FROM Orders WHERE quantity>2;
SELECT month(OrderDate) AS month_name, quantity AS sum_of_month FROM Orders WHERE YEAR(OrderDate) = 2020 GROUP BY month(OrderDate);
SELECT product_name, Customer_name, OrderDate FROM Product, Customers, Orders GROUP BY OrderDate;
SELECT * FROM Orders WHERE month(OrderDate) = 07;
SELECT Customer_id FROM Orders WHERE quantity = NULL;