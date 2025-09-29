# Elevate-Labs-Task-4

---

# 📄 README.md

## 📌 Project: SQL Data Analysis on E-commerce Dataset

### 🔹 Objective

The goal of this project is to perform **data analysis using SQL** on an e-commerce dataset.
This task demonstrates the ability to:

* Import structured data into a relational database.
* Write SQL queries for data exploration, aggregation, and analysis.
* Use advanced SQL features like subqueries, views, and indexes.
* Present insights in a clear and organized format.

---

## 📊 Dataset Overview

* **File:** `ecommerce_data.csv`
* **Records:** 1000 rows
* **Attributes (Columns):**

  1. `order_id` → Unique ID for each order
  2. `customer_id` → Unique customer identifier
  3. `order_date` → Date of order placement
  4. `product_id` → Unique product identifier
  5. `product_name` → Name of the product
  6. `category` → Category (Books, Electronics, Toys, etc.)
  7. `quantity` → Number of units purchased
  8. `unit_price` → Price per unit
  9. `total_amount` → Final order value (quantity × unit price)
  10. `payment_method` → Payment type (Credit Card, UPI, Net Banking, etc.)
  11. `city` → City where the order was placed

This dataset simulates real-world e-commerce transactions, useful for customer, sales, and product-level insights.

---

## ⚡ SQL Queries & Insights

### 1️⃣ Preview First 10 Rows

```sql
SELECT * FROM ecommerce_data LIMIT 10;
```

✅ **Insight:** Confirms that the dataset was successfully imported. Displays sample records including order details, payment type, and city.

---

### 2️⃣ Total Revenue

```sql
SELECT SUM(total_amount) AS total_revenue FROM ecommerce_data;
```

✅ **Insight:** Gives the overall revenue earned from all 1000 orders. This number is a **key business metric** showing company earnings.

---

### 3️⃣ Average Revenue Per User

```sql
SELECT customer_id, AVG(total_amount) AS avg_revenue
FROM ecommerce_data
GROUP BY customer_id
ORDER BY avg_revenue DESC
LIMIT 10;
```

✅ **Insight:** Shows which customers spend the most on average. Useful for identifying **high-value customers** for loyalty programs or targeted marketing.

---

### 4️⃣ Top 5 Best-Selling Products

```sql
SELECT product_name, SUM(quantity) AS total_sold
FROM ecommerce_data
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;
```

✅ **Insight:** Lists the most popular products by sales volume. Helps the business manage **inventory and demand forecasting**.

---

### 5️⃣ Revenue by City

```sql
SELECT city, SUM(total_amount) AS city_revenue
FROM ecommerce_data
GROUP BY city
ORDER BY city_revenue DESC;
```

✅ **Insight:** Identifies which cities generate the highest revenue. Critical for **regional sales strategies** and allocating resources effectively.

---

### 6️⃣ Orders by Payment Method

```sql
SELECT payment_method, COUNT(*) AS total_orders
FROM ecommerce_data
GROUP BY payment_method
ORDER BY total_orders DESC;
```

✅ **Insight:** Shows customer preferences for payment modes. Businesses can use this insight to **optimize checkout processes** and add popular payment options.

---

### 7️⃣ Orders Above Average Order Value

```sql
SELECT order_id, customer_id, total_amount
FROM ecommerce_data
WHERE total_amount > (SELECT AVG(total_amount) FROM ecommerce_data)
ORDER BY total_amount DESC;
```

✅ **Insight:** Finds orders that are **larger than the average purchase**. Helps spot **premium orders** and high-value customers.

---

### 8️⃣ Creating a View (Revenue per City)

```sql
CREATE OR REPLACE VIEW revenue_per_city AS
SELECT city, SUM(total_amount) AS city_revenue
FROM ecommerce_data
GROUP BY city;

SELECT * FROM revenue_per_city;
```

✅ **Insight:** Creates a **reusable virtual table** for revenue by city. This simplifies future analysis queries without re-writing aggregation logic.

---

## 📷 Screenshots Provided

1. Top 5 Best-Selling Products
2. City Revenue Table
3. Orders Distribution by Payment Method
4. Orders Above Average Value
5. Revenue per City (View)
6. SQL Script Execution Summary

---

## 🛠 Tools & Technologies

* **Database:** MySQL
* **Client Tool:** DBeaver
* **Language:** SQL

---

## 📌 Key Learnings

* Writing efficient SQL queries for real-world datasets.
* Using aggregate functions (`SUM`, `AVG`) and grouping (`GROUP BY`).
* Implementing **subqueries** to filter data based on calculated metrics.
* Creating **views** for modular and reusable analysis.
* Understanding how to visualize SQL results through screenshots for reporting.

---

## 🚀 How to Run This Project

1. Import `ecommerce_data.csv` into your MySQL database using DBeaver.
2. Run the SQL script file: `ecommerce_analysis.sql`.
3. Capture query outputs as screenshots.
4. Review insights and include them in your final report.

---
