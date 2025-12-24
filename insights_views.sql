
-- Daily Sales Summary View

-- 1. Sales Per Day
-- 2. Daily Revenue
-- 3. Number of Invoices
-- 4. Units Sold
-- Power BI: line chart — Sales Trend

CREATE OR REPLACE VIEW SALES_SUMMARY_VIEW AS
SELECT 
    TRUNC(i.invoice_date) AS sales_date,
    COUNT(DISTINCT i.invoice_id) AS total_invoices,
    SUM(d.quantity) AS total_units_sold,
    SUM(d.quantity * d.unit_price * (1 - d.discount/100)) AS total_revenue
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
WHERE i.status = 'paid'
GROUP BY sales_date;




-- Top 20 Selling Products based on Total Quantities Sold
-- Power BI: Bar Chart - Best Sellers
CREATE OR REPLACE VIEW TOP_20_SELLING_PRODUCTS AS
SELECT 
    p.product_id,
    p.product_name,
    SUM(d.quantity) AS total_qty_sold,
    SUM(d.quantity * d.unit_price) AS total_sales_value
FROM invoices_details d
JOIN products p ON d.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_qty_sold DESC
FETCH FIRST 20 ROWS ONLY;

-- Customer Purchase Summary View
-- To track top customers and spending behavior.
-- PowerBI: customer ranking, RFM scores.

CREATE OR REPLACE VIEW PURCHASE_SUMMARY_VIEW AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT i.invoice_id) AS total_invoices,
    SUM(d.quantity * d.unit_price * (1 - d.discount/100)) AS total_spent
FROM customers c
LEFT JOIN invoices i ON c.customer_id = i.customer_id
LEFT JOIN invoices_details d ON i.invoice_id = d.invoice_id
GROUP BY c.customer_id, c.customer_name;








-- Low Stock ALert (Product Quantity < 20 {current_stock column})
CREATE OR REPLACE VIEW LOW_STOCK_VIEW AS
SELECT
    product_id,
    product_name,
    current_stock
FROM products
WHERE current_stock < 20
ORDER BY current_stock ASC;

SELECT * FROM LOW_STOCK_VIEW;

SELECT * FROM PRODUCTS;



select * from invoices_details;





SELECT * FROM PURCHASE_SUMMARY_VIEW;
SELECT * FROM TOP_20_SELLING_PRODUCTS;
SELECT * FROM SALES_SUMMARY_VIEW;

DESCRIBE INVOICES;
DESCRIBE INVOICES_DETAILS;
DESCRIBE BILLS;
DESCRIBE BILLS_DETAILS;

select
constraint_name, constraint_type 
from user_constraints
where table_name = 'BILLS_DETAILS';

select * from products;

select * from bills_details;

select 
sum(quantity) as total_quantity_baught
from bills_details
where product_id = 1;
