-- KPI Queries
SELECT SUM(total_price) AS Total_Revenue from pizza_sales;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

SELECT SUM(quantity) as Total_pizza_sold from pizza_sales

SELECT COUNT(DISTINCT order_id) as Total_Orders from pizza_sales

SELECT CAST(CAST(SUM(quantity) as DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id)as DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order from pizza_sales

Chart Queries
--Daily trend
SELECT DATENAME(DW,order_date) as order_day,COUNT(DISTINCT order_id) AS Total_Orders
From pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY COUNT(DISTINCT order_id) DESC

--Hourly trend
SELECT DATEPART(HOUR,order_time) as order_hours,COUNT(DISTINCT order_id) AS Total_Orders
From pizza_sales
Group by DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

-- Category query
SELECT pizza_category,sum(total_price)*100 / (SELECT sum(total_price) from pizza_sales) AS Total_Sales_Percentage
From pizza_sales
Group by pizza_category

--Categories of pizza sold
SELECT pizza_category,sum(quantity) as Total_Pizzas_Sold
From pizza_sales
Group by pizza_category





--Top 5 pizzas
Select top 5 pizza_name,sum(quantity)as Total_Pizzas_Sold
From pizza_sales
Group by pizza_name
Order by Total_Pizzas_Sold desc

--Bottom 5 pizzas
Select top 5 pizza_name,sum(quantity)as Total_Pizzas_Sold
From pizza_sales
Group by pizza_name
Order by Total_Pizzas_Sold asc
