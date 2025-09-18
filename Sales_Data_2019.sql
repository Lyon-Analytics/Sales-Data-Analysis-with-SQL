

-- ●	Total Revenue

SELECT
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_January_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_February_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_March_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_April_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_May_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_June_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_July_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_August_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_September_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_October_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_November_2019) +
    (SELECT SUM(Quantity_Ordered * Price_Each) FROM Sales_December_2019)
    AS Total_Annual_Revenue;



-- ●	Average Order Value (AOV)
--   AOV = Total Revenue / Total number of orders 

SELECT
    SUM(Quantity_Ordered * Price_Each) AS Total_Revenue,
    SUM(Quantity_Ordered * Price_Each) * 1.0 / COUNT(DISTINCT Order_ID) AS Avg_Order_Value
FROM (
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_January_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_February_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_March_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_April_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_May_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_June_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_July_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_August_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_September_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_October_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_November_2019
    UNION ALL
    SELECT Order_ID, Quantity_Ordered, Price_Each FROM Sales_December_2019
) AS AllMonths;


-- ●	Total Quantity Sold for each month 

SELECT SUM (Quantity_Ordered) AS Tota_Qty_Ordered
FROM Sales_January_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_february_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_March_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_April_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_May_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_June_2019
UNION ALL
SELECT SUM (Quantity_Ordered)
FROM Sales_July_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_August_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_September_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_October_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_November_2019
UNION ALL 
SELECT SUM (Quantity_Ordered)
FROM Sales_December_2019;

-------------------------------

-- Total Quantity Sold for the year
SELECT SUM(TotalQty) AS Total_Qty_Ordered
FROM (
    SELECT SUM(Quantity_Ordered) AS TotalQty FROM Sales_January_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_February_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_March_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_April_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_May_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_June_2019
    UNION ALL
    SELECT SUM(Quantity_Ordered) FROM Sales_July_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_August_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_September_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_October_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_November_2019
    UNION ALL 
    SELECT SUM(Quantity_Ordered) FROM Sales_December_2019
) AS YearlyTotals;


-- ●	Number of Unique Customers

SELECT DISTINCT COUNT (Order_ID) No_of_CUstomer
FROM Sales_January_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_February_2019
UNION ALL
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_March_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_April_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_May_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_June_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_July_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_August_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_September_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_October_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_November_2019
UNION ALL 
SELECT DISTINCT COUNT (Order_ID)
FROM Sales_December_2019;


-- ●	Top Selling Products

-- ● Top 10 Selling Products for the Whole Year
SELECT TOP 10
    Product,
    SUM(Quantity_Ordered) AS Total_Quantity_Sold
FROM (
    SELECT Product, Quantity_Ordered FROM Sales_January_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_February_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_March_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_April_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_May_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_June_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_July_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_August_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_September_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_October_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_November_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_December_2019
) AS AllSales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC;


-- ●	Monthly Growth Rate: Sales in current Month - Sales in previous months /  X 100

WITH MonthlySales AS (
    SELECT 'January' AS MonthName, SUM(Quantity_Ordered * Price_Each) AS TotalRevenue
    FROM Sales_January_2019
    UNION ALL
    SELECT 'February', SUM(Quantity_Ordered * Price_Each) FROM Sales_February_2019
    UNION ALL
    SELECT 'March', SUM(Quantity_Ordered * Price_Each) FROM Sales_March_2019
    UNION ALL
    SELECT 'April', SUM(Quantity_Ordered * Price_Each) FROM Sales_April_2019
    UNION ALL
    SELECT 'May', SUM(Quantity_Ordered * Price_Each) FROM Sales_May_2019
    UNION ALL
    SELECT 'June', SUM(Quantity_Ordered * Price_Each) FROM Sales_June_2019
    UNION ALL
    SELECT 'July', SUM(Quantity_Ordered * Price_Each) FROM Sales_July_2019
    UNION ALL
    SELECT 'August', SUM(Quantity_Ordered * Price_Each) FROM Sales_August_2019
    UNION ALL
    SELECT 'September', SUM(Quantity_Ordered * Price_Each) FROM Sales_September_2019
    UNION ALL
    SELECT 'October', SUM(Quantity_Ordered * Price_Each) FROM Sales_October_2019
    UNION ALL
    SELECT 'November', SUM(Quantity_Ordered * Price_Each) FROM Sales_November_2019
    UNION ALL
    SELECT 'December', SUM(Quantity_Ordered * Price_Each) FROM Sales_December_2019
),
OrderedSales AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY 
            CASE MonthName
                WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3
                WHEN 'April' THEN 4 WHEN 'May' THEN 5 WHEN 'June' THEN 6
                WHEN 'July' THEN 7 WHEN 'August' THEN 8 WHEN 'September' THEN 9
                WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12
            END
        ) AS MonthOrder,
        MonthName,
        TotalRevenue
    FROM MonthlySales
)
SELECT 
    curr.MonthName,
    curr.TotalRevenue,
    LAG(curr.TotalRevenue) OVER (ORDER BY curr.MonthOrder) AS PrevRevenue,
    CASE 
        WHEN LAG(curr.TotalRevenue) OVER (ORDER BY curr.MonthOrder) = 0 THEN NULL
        ELSE 
            ROUND(
                ( (curr.TotalRevenue - LAG(curr.TotalRevenue) OVER (ORDER BY curr.MonthOrder)) * 100.0 )
                / LAG(curr.TotalRevenue) OVER (ORDER BY curr.MonthOrder), 2
            )
    END AS GrowthRate_Percent
FROM OrderedSales curr
ORDER BY curr.MonthOrder;



SELECT * 
FROM Sales_January_2019;

-- ●	Average Price per Product

-- ● Average Price per Product (All 12 Months Combined)

SELECT 
    Product,
    AVG(Price_Each) AS Average_Price
FROM (
    SELECT Product, Price_Each FROM Sales_January_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_February_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_March_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_April_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_May_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_June_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_July_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_August_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_September_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_October_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_November_2019
    UNION ALL
    SELECT Product, Price_Each FROM Sales_December_2019
) AS AllMonths
GROUP BY Product
ORDER BY Average_Price DESC;


-- ●	Identify the top three best-performing products in terms of total revenue 
-- for the entire year of 2019. How do these products contribute to the overall sales performance?


-- ● Top 3 Best-Performing Products by Total Revenue (2019)
WITH AllSales AS (
    SELECT Product, (Quantity_Ordered * Price_Each) AS Revenue
    FROM Sales_January_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_February_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_March_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_April_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_May_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_June_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_July_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_August_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_September_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_October_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_November_2019
    UNION ALL
    SELECT Product, (Quantity_Ordered * Price_Each) FROM Sales_December_2019
),
ProductRevenue AS (
    SELECT 
        Product,
        SUM(Revenue) AS Total_Revenue
    FROM AllSales
    GROUP BY Product
),
Overall AS (
    SELECT SUM(Total_Revenue) AS Yearly_Revenue FROM ProductRevenue
)
SELECT 
    pr.Product,
    pr.Total_Revenue,
    ROUND( (pr.Total_Revenue * 100.0 / o.Yearly_Revenue), 2) AS Contribution_Percentage
FROM ProductRevenue pr
CROSS JOIN Overall o
ORDER BY pr.Total_Revenue DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


-- 

-- ● Distribution of Order Quantities Across Products (2019)
WITH AllSales AS (
    SELECT Product, Quantity_Ordered
    FROM Sales_January_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_February_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_March_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_April_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_May_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_June_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_July_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_August_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_September_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_October_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_November_2019
    UNION ALL
    SELECT Product, Quantity_Ordered FROM Sales_December_2019
)
SELECT 
    Product,
    AVG(Quantity_Ordered) AS Avg_Quantity_Ordered,
    MAX(Quantity_Ordered) AS Max_Quantity_Ordered
FROM AllSales
GROUP BY Product
ORDER BY Avg_Quantity_Ordered DESC;


-- ●	The Accountant reported that we made a loss in the months of April, May, June and July
-- as compared to other months. Is this true? What happened? Show monthly sales performance.

-- ● Monthly Sales Performance in 2019
WITH MonthlySales AS (
    SELECT 'January' AS Month, SUM(Quantity_Ordered * Price_Each) AS Revenue
    FROM Sales_January_2019
    UNION ALL
    SELECT 'February', SUM(Quantity_Ordered * Price_Each) FROM Sales_February_2019
    UNION ALL
    SELECT 'March', SUM(Quantity_Ordered * Price_Each) FROM Sales_March_2019
    UNION ALL
    SELECT 'April', SUM(Quantity_Ordered * Price_Each) FROM Sales_April_2019
    UNION ALL
    SELECT 'May', SUM(Quantity_Ordered * Price_Each) FROM Sales_May_2019
    UNION ALL
    SELECT 'June', SUM(Quantity_Ordered * Price_Each) FROM Sales_June_2019
    UNION ALL
    SELECT 'July', SUM(Quantity_Ordered * Price_Each) FROM Sales_July_2019
    UNION ALL
    SELECT 'August', SUM(Quantity_Ordered * Price_Each) FROM Sales_August_2019
    UNION ALL
    SELECT 'September', SUM(Quantity_Ordered * Price_Each) FROM Sales_September_2019
    UNION ALL
    SELECT 'October', SUM(Quantity_Ordered * Price_Each) FROM Sales_October_2019
    UNION ALL
    SELECT 'November', SUM(Quantity_Ordered * Price_Each) FROM Sales_November_2019
    UNION ALL
    SELECT 'December', SUM(Quantity_Ordered * Price_Each) FROM Sales_December_2019
)
SELECT Month, Revenue
FROM MonthlySales
ORDER BY 
    CASE 
        WHEN Month = 'January' THEN 1
        WHEN Month = 'February' THEN 2
        WHEN Month = 'March' THEN 3
        WHEN Month = 'April' THEN 4
        WHEN Month = 'May' THEN 5
        WHEN Month = 'June' THEN 6
        WHEN Month = 'July' THEN 7
        WHEN Month = 'August' THEN 8
        WHEN Month = 'September' THEN 9
        WHEN Month = 'October' THEN 10
        WHEN Month = 'November' THEN 11
        WHEN Month = 'December' THEN 12
    END;



