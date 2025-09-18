# Sales-Data-Analysis-with-SQL (2019)
---

## Introduction
This repository contains a comprehensive SQL script for analyzing 2019 sales data. The project aims to extract key business insights from raw monthly sales data, providing a foundation for data-driven decision-making. The SQL queries are designed to be run on a database containing twelve separate tables, one for each month of the year.

---

## Project Overview
The `Sales_Data_2019.sql` script performs a series of analytical tasks to understand the company's performance throughout the year. The queries are focused on answering critical business questions related to revenue, customer behavior, and product performance.

---

## Key Analysis Points:
Total Revenue: Calculates the total revenue generated for the entire year.

Average Order Value (AOV): Determines the average value of each customer order, a key metric for understanding purchasing behavior.

Total Quantity Sold: Identifies the total number of products sold for each month and for the entire year.

Unique Customers: Counts the number of unique customers for each month.

Top Selling Products: Ranks the top 10 best-selling products by quantity sold for the year.

Monthly Growth Rate: Analyzes the month-over-month sales growth to identify trends and performance anomalies.

Average Price per Product: Calculates the average price of each product across all transactions.

Top 3 Best-Performing Products: Identifies the top three products by total revenue and their contribution to overall sales.

Distribution of Order Quantities: Provides insights into the average and maximum number of items per order for each product.

Monthly Sales Performance: Visualizes monthly sales to validate business assumptions and uncover trends.

---

## Explanation of Queries
The SQL script is well-commented and organized into logical sections. The queries use standard SQL functions and syntax, making them compatible with most relational database systems.

A key technique used in several queries is the `UNION ALL` operator. This is used to combine the data from the twelve individual monthly sales tables into a single, unified dataset for yearly analysis. This approach allows for aggregate functions like `SUM()`, `AVG()`, and `COUNT()` to be applied to the entire year's data without having to run a separate query for each month.

For example, the Average Order Value (AOV) query first combines all monthly data using `UNION ALL` into a derived table named AllMonths. It then calculates the total revenue and the total number of unique `Order_ID` values from this combined table to compute the AOV.

The Monthly Growth Rate query uses a `WITH` clause (Common Table Expression) to first calculate the total revenue for each month. It then uses the `LAG()` window function to access the previous month's revenue, allowing for a straightforward calculation of the month-over-month growth rate percentage. This is a powerful technique for time-series analysis in SQL.

---

## How to Use
- Download the  `Sales_2019.bak` attached in this repo files

- Open the **MSSQLSERVER** folder in your system and Access the **Backup** folder using the administrator access

- Copy and Paste the `Sales_2019.bak` file downloaded in the **Backup** folder

- Then, Open your MSSQL and right click on **Databases** folder and select **Restore database**

- Select **Device** from the option given. the earlier file `Sales_2019.bak` pasted in your backup will be displayed 

- Then confirm selection with **Add** and Choose **OK**

### Alternatively:
- Ensure you have a database set up with 12 tables named Sales_January_2019 through Sales_December_2019, with columns 
`Order_ID, Quantity_Ordered, Price_Each, Product, Order_Date, Purchase_Address`.

- Open your SQL client or database management tool.

- Copy and paste the entire content of the `Sales_Data_2019.sql` file into the query editor.

- Run the script to see the results of each analysis.

Feel free to adapt and expand on these queries for further analysis!
