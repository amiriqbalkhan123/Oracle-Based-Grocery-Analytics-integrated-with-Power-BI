
-- Top 5 Customers with Highest Total Discounts (Bar Chart)
CREATE OR REPLACE VIEW V_TOP5_CUSTOMERS_BY_DISCOUNT AS
SELECT *
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        NVL(SUM(id.quantity * id.unit_price * (NVL(id.discount,0)/100)),0) AS total_discount_value
    FROM invoices_details id
    JOIN invoices i ON id.invoice_id = i.invoice_id
    JOIN customers c ON i.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
    ORDER BY total_discount_value DESC
)
FETCH FIRST 5 ROWS ONLY;

SELECT * FROM V_TOP5_CUSTOMERS_BY_DISCOUNT;

-- Top 5 Customers with the Most Orders (Column Chart)
CREATE OR REPLACE VIEW V_TOP5_CUSTOMERS_BY_ORDERS AS
SELECT *
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(i.invoice_id) AS total_orders
    FROM invoices i
    JOIN customers c ON i.customer_id = c.customer_id
    GROUP BY c.customer_id, c.customer_name
    ORDER BY total_orders DESC
)
FETCH FIRST 5 ROWS ONLY;
SELECT * FROM V_TOP5_CUSTOMERS_BY_ORDERS;




-- Top 5 Customers by Quantity Purchased (Tree Map)
CREATE OR REPLACE VIEW V_TOP_CUSTOMERS_BY_QUANTITY AS
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(id.quantity) AS total_quantity_purchased
FROM invoices_details id
JOIN invoices i ON id.invoice_id = i.invoice_id
JOIN customers c ON i.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_quantity_purchased DESC
FETCH FIRST 5 ROWS ONLY;
select * from v_top_customers_by_quantity;





-- Repeat Customers Count (KPI Card)

CREATE OR REPLACE VIEW V_REPEAT_CUSTOMERS_COUNT AS
SELECT 
    COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM invoices
    GROUP BY customer_id
    HAVING COUNT(invoice_id) >= 2
);

SELECT * FROM V_REPEAT_CUSTOMERS_COUNT;



-- Active Customer Count (KPI Card)
CREATE OR REPLACE VIEW V_ACTIVE_CUSTOMERS_COUNT AS
SELECT 
    COUNT(DISTINCT customer_id) AS active_customers
FROM invoices
WHERE invoice_date >= TRUNC(SYSDATE) - 30;




-- Total count of Customers who are inactive for the last 30 days

CREATE OR REPLACE VIEW V_INACTIVE_CUSTOMERS_LAST30DAYS AS
SELECT COUNT(*) AS inactive_customers
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM invoices
    WHERE invoice_date >= TRUNC(SYSDATE) - 30
);




CREATE OR REPLACE VIEW V_CUSTOMERS_BY_COUNTRY AS
SELECT 
    REGEXP_SUBSTR(CUSTOMER_ADDRESS, '[^,]+$', 1, 1) AS COUNTRY,
    COUNT(*) AS TOTAL_CUSTOMERS
FROM customers
GROUP BY REGEXP_SUBSTR(CUSTOMER_ADDRESS, '[^,]+$', 1, 1);

select * from V_CUSTOMERS_BY_COUNTRY;


-- Top 10 Customers By Revenue (No duplicate selected, beacuse Top N should be different)
CREATE OR REPLACE VIEW V_TOP10_CUSTOMERS_BY_REVENUE AS
SELECT *
FROM (
  SELECT
    c.customer_id,
    c.customer_name,
    NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_revenue
  FROM customers c
  LEFT JOIN invoices i ON c.customer_id = i.customer_id
  LEFT JOIN invoices_details d ON i.invoice_id = d.invoice_id
  GROUP BY c.customer_id, c.customer_name
  ORDER BY total_revenue DESC
)
FETCH FIRST 10 ROWS ONLY;

SELECT * FROM V_TOP10_CUSTOMERS_BY_REVENUE;



-- Number of Customers Served Today (We selected distinct customer with invoices today)

CREATE OR REPLACE VIEW V_CUSTOMERS_SERVED_TODAY AS
SELECT TRUNC(SYSDATE) AS today,
       NVL(COUNT(DISTINCT i.customer_id),0) AS customers_served
FROM invoices i
WHERE TRUNC(i.invoice_date) = TRUNC(SYSDATE);