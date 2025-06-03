use sales;
select * from sales;

/*extract month and years*/

SELECT MONTH(sale_date) AS month,year(sale_date) AS year
FROM sales;


/*groupby year or month and sum for revenue*/

SELECT MONTH(sale_date) as sale_month, sum(revenue) AS m_revenue
FROM sales
group by month(sale_date)
order by m_revenue;

SELECT YEAR(sale_date) as sale_year, sum(revenue) AS y_revenue
FROM sales
group by year(sale_date)
order by y_revenue;



/*Total product id by revenue*/

SELECT 
    product_id,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;

/* sales by product per month */ 
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    product_id,
    SUM(revenue) AS product_monthly_revenue
FROM sales
GROUP BY year, month, product_id
ORDER BY year, month, product_monthly_revenue DESC;

/*Filter for a Specific Time Period */

SELECT *
FROM sales
WHERE sale_date BETWEEN '2023-01-01' AND '2023-03-31';




/*limit results*/
SELECT * FROM sales
LIMIT 3;


/*Highest Revenue Day */

SELECT 
    sale_date,
    SUM(revenue) AS daily_revenue
FROM sales
GROUP BY sale_date
ORDER BY daily_revenue DESC
LIMIT 1;

/* Revenue Trend by Week */

SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    WEEK(sale_date) AS week,
    SUM(revenue) AS weekly_revenue
FROM sales
GROUP BY year, week
ORDER BY year, week;


/*Most Frequently Sold Products */

SELECT 
    product_id,
    COUNT(*) AS total_sales
FROM sales
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;



