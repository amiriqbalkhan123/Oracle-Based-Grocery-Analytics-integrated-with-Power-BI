-- Categories Views

-- Category Overview (Table, Matrix, Column Chart) will be best for Power BI
CREATE OR REPLACE VIEW V_CATEGORY_OVERVIEW AS
SELECT
    c.category_id,
    c.category_name,
    COUNT(p.product_id) AS total_products,
    NVL(SUM(p.current_stock),0) AS total_stock_units,
    NVL(AVG(p.sales_price),0) AS avg_sales_price
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY c.category_name;

select * from v_category_overview;


-- Category Revenue (Column Chart, Bar Chart, Donut) will be best for Power BI
CREATE OR REPLACE VIEW V_CATEGORY_REVENUE AS
SELECT
    c.category_id,
    c.category_name,
    NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_revenue
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
LEFT JOIN invoices_details d ON d.product_id = p.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

select * from V_CATEGORY_REVENUE;


-- Category Purchase cost total (Bar Chart, Column Chart, Table) will be best for Power BI
CREATE OR REPLACE VIEW V_CATEGORY_PURCHASE_COST AS
SELECT
    c.category_id,
    c.category_name,
    NVL(SUM(bd.quantity * bd.unit_price * (1 - NVL(bd.discount,0)/100)),0) AS total_purchase_cost
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
LEFT JOIN bills_details bd ON bd.product_id = p.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_purchase_cost DESC;
-- 10 alokozay * 40 = 400
--- (unitPrice * Quantity) = total price * (1-discount/100) 
-- actual ()

select * from V_CATEGORY_PURCHASE_COST;


-- Category profit (KPI) -> Profit , -> (Column Chart) -> Profit Ranking , (Clustered Bar Chart) -> Revenue vs Cost
CREATE OR REPLACE VIEW V_CATEGORY_PROFIT AS
WITH sales AS (
    SELECT 
        p.category_id,
        SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)) AS revenue
    FROM invoices_details d
    JOIN products p ON p.product_id = d.product_id
    GROUP BY p.category_id
),
purchases AS (
    SELECT 
        p.category_id,
        SUM(bd.quantity * bd.unit_price * (1 - NVL(bd.discount,0)/100)) AS cost
    FROM bills_details bd
    JOIN products p ON p.product_id = bd.product_id
    GROUP BY p.category_id
)
SELECT
    c.category_id,
    c.category_name,
    NVL(s.revenue,0) AS total_revenue,
    NVL(p.cost,0) AS total_purchase_cost,
    NVL(s.revenue,0) - NVL(p.cost,0) AS profit
FROM categories c
LEFT JOIN sales s ON c.category_id = s.category_id
LEFT JOIN purchases p ON c.category_id = p.category_id
ORDER BY profit DESC;

select * from v_category_profit;

-- Categories with no products (No any visualization tool selected yet)
CREATE OR REPLACE VIEW V_CATEGORIES_WITH_NO_PRODUCTS AS
SELECT 
    c.category_id,
    c.category_name,
    c.created_date
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
WHERE p.product_id IS NULL;
select * from v_categories_with_no_products;


-- CATEGORY STOCK VALUE (Stock * Sales Price) -> Treemap in Power BI
CREATE OR REPLACE VIEW V_CATEGORY_STOCK_VALUE AS
SELECT
    c.category_id,
    c.category_name,
    NVL(SUM(p.current_stock * p.sales_price),0) AS total_stock_value
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_stock_value DESC;

select * from v_category_stock_value;


-- NEW CATEGORIES CREATED TODAY / THIS MONTH / THIS YEAR 
CREATE OR REPLACE VIEW V_NEW_CATEGORIES_DAY AS
SELECT TRUNC(SYSDATE) AS day,
       (SELECT NVL(COUNT(*),0) 
        FROM categories 
        WHERE TRUNC(created_date) = TRUNC(SYSDATE)) AS new_categories
FROM dual;


-- TRUNC(CREATED_DATE, 'MM')
-- TRUNC(CREATED_DATE, 'YYYY')
-- TRUNC(CREATED_DATE 'DD')
-- EXTRACT(MONTH, CREATED_DATE)
-- EXTRACT(YEAR, CREATED_DATE)
-- EXTRACT(DAY, CREATED_DATE) 202-10-15 00:00:00

-- Monthly
CREATE OR REPLACE VIEW V_NEW_CATEGORIES_MONTH AS
SELECT TRUNC(SYSDATE,'MM') AS month,
       (SELECT NVL(COUNT(*),0) 
        FROM categories 
        WHERE TRUNC(created_date,'MM') = TRUNC(SYSDATE,'MM')) AS new_categories
FROM dual;


-- Yearly
CREATE OR REPLACE VIEW V_NEW_CATEGORIES_YEAR AS
SELECT TRUNC(SYSDATE,'YYYY') AS year,
       (SELECT NVL(COUNT(*),0) 
        FROM categories 
        WHERE TRUNC(created_date,'YYYY') = TRUNC(SYSDATE,'YYYY')) AS new_categories
FROM dual;


-- CATEGORY SALES TREND (BY MONTH) -> Line Chart (will be best for Power BIs)
CREATE OR REPLACE VIEW V_CATEGORY_SALES_TREND AS
SELECT
    c.category_id,
    c.category_name,
    TRUNC(i.invoice_date,'MM') AS sales_month,
    NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS revenue
FROM categories c
JOIN products p ON p.category_id = c.category_id
JOIN invoices_details d ON d.product_id = p.product_id
JOIN invoices i ON i.invoice_id = d.invoice_id
GROUP BY c.category_id, c.category_name, TRUNC(i.invoice_date,'MM')
ORDER BY sales_month DESC;


select * from v_category_sales_trend;

-- CATEGORY UNIT SALES TREND (BY MONTH)  -> Line Chart, or Area Chart
CREATE OR REPLACE VIEW V_CATEGORY_UNITS_TREND AS
SELECT
    c.category_id,
    c.category_name,
    TRUNC(i.invoice_date,'MM') AS sales_month,
    NVL(SUM(d.quantity),0) AS total_units_sold
FROM categories c
JOIN products p ON p.category_id = c.category_id
JOIN invoices_details d ON d.product_id = p.product_id
JOIN invoices i ON i.invoice_id = d.invoice_id
GROUP BY c.category_id, c.category_name, TRUNC(i.invoice_date,'MM')
ORDER BY sales_month DESC;

select * from v_category_units_trend;


-- CATEGORY ACTIVITY SUMMARY (One-line KPI per category) -> Matrix, Table, Grouped Bar Chart
CREATE OR REPLACE VIEW V_CATEGORY_ACTIVITY AS
SELECT
    c.category_id,
    c.category_name,
    COUNT(p.product_id) AS total_products,
    NVL(SUM(p.current_stock),0) AS total_stock,
    NVL(SUM(d.quantity),0) AS units_sold,
    NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_revenue
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
LEFT JOIN invoices_details d ON d.product_id = p.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

select * from v_category_activity;

-- Popular Categories -> Bar Chart
CREATE OR REPLACE VIEW V_POPULAR_CATEGORIES AS
SELECT
  pc.category_id,
  c.category_name,
  NVL(SUM(d.quantity),0) AS total_units_sold
FROM products pc
JOIN categories c ON pc.category_id = c.category_id
LEFT JOIN invoices_details d ON pc.product_id = d.product_id
GROUP BY pc.category_id, c.category_name
ORDER BY total_units_sold DESC
FETCH FIRST 10 ROWS ONLY;

SELECT * FROM V_POPULAR_CATEGORIES;



-- 18) CATEGORIES WITH MOST PRODUCTS -> Bar Chart will be best for Power BI
CREATE OR REPLACE VIEW V_CATEGORIES_MOST_PRODUCTS AS
SELECT c.category_id, c.category_name, COUNT(p.product_id) AS products_count
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY products_count DESC;

select * from v_categories_most_products;



-- Total Categories - KPI Card will be best for Power BI
CREATE OR REPLACE VIEW V_TOTAL_CATEGORIES AS
SELECT COUNT(*) AS total_categories FROM categories;

select * from v_total_categories;
