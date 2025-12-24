
-- Overall Sales Summary (General View)
CREATE OR REPLACE VIEW V_SALES_SUMMARY AS
SELECT
    i.INVOICE_ID,
    i.INVOICE_DATE,
    c.CUSTOMER_NAME,
    u.USERNAME AS CREATED_BY,
    i.STATUS,
    SUM(d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0)) AS TOTAL_AMOUNT,
    COUNT(d.PRODUCT_ID) AS TOTAL_ITEMS
FROM invoices i
LEFT JOIN customers c ON i.CUSTOMER_ID = c.CUSTOMER_ID
LEFT JOIN users u ON i.USER_ID = u.USER_ID
LEFT JOIN invoices_details d ON i.INVOICE_ID = d.INVOICE_ID
GROUP BY i.INVOICE_ID, i.INVOICE_DATE, c.CUSTOMER_NAME, u.USERNAME, i.STATUS;


-- All Sales Details (General View)
CREATE OR REPLACE VIEW V_SALES_DETAILS AS
SELECT
    d.INVOICE_ID,
    d.PRODUCT_ID,
    p.PRODUCT_NAME,
    d.QUANTITY,
    d.UNIT_PRICE,
    d.DISCOUNT,
    (d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0)) AS LINE_TOTAL
FROM invoices_details d
JOIN products p ON d.PRODUCT_ID = p.PRODUCT_ID;


-- Purchase Summary (General View)
CREATE OR REPLACE VIEW V_PURCHASE_SUMMARY AS
SELECT
    b.BILL_ID,
    b.BILL_DATE,
    s.SUPPLIER_NAME,
    u.USERNAME AS CREATED_BY,
    b.STATUS,
    SUM(d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0)) AS TOTAL_AMOUNT,
    COUNT(d.PRODUCT_ID) AS TOTAL_ITEMS
FROM bills b
LEFT JOIN suppliers s ON b.SUPPLIER_ID = s.SUPPLIER_ID
LEFT JOIN users u ON b.USER_ID = u.USER_ID
LEFT JOIN bills_details d ON b.BILL_ID = d.BILL_ID
GROUP BY b.BILL_ID, b.BILL_DATE, s.SUPPLIER_NAME, u.USERNAME, b.STATUS;



-- Inventory Movement (Retrived From Audit Logs table to track the movement of the Inventory)
CREATE OR REPLACE VIEW V_INVENTORY_MOVEMENT AS
SELECT
  id         AS log_id,
  ref_type   AS movement_type,
  ref_id     AS reference_id,
  product_id,
  old_qty,
  new_qty,
  old_price,
  new_price,
  action_type,
  log_time
FROM audit_logs
ORDER BY log_time;

SELECT * FROM V_INVENTORY_MOVEMENT;

-- Top 5 Customers by Spend
CREATE OR REPLACE VIEW V_TOP5_CUSTOMERS_BY_SPEND AS
SELECT *
FROM (
  SELECT
    c.customer_id,
    c.customer_name,
    NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_spent
  FROM customers c
  LEFT JOIN invoices i ON c.customer_id = i.customer_id
  LEFT JOIN invoices_details d ON i.invoice_id = d.invoice_id
  GROUP BY c.customer_id, c.customer_name
  ORDER BY total_spent DESC
)
FETCH FIRST 5 ROWS ONLY;

SELECT * FROM V_TOP5_CUSTOMERS_BY_SPEND;

-- Total Inactive Customers
CREATE OR REPLACE VIEW V_CUSTOMERS_INACTIVE_1M AS
SELECT
  c.customer_id,
  c.customer_name,
  c.customer_phone,
  c.customer_email,
  c.created_date,
  NVL(MAX(i.invoice_date), DATE '1900-01-01') AS last_invoice_date
FROM customers c
LEFT JOIN invoices i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.customer_name, c.customer_phone, c.customer_email, c.created_date
HAVING NVL(MAX(i.invoice_date), DATE '1900-01-01') <= ADD_MONTHS(SYSDATE, -1);

SELECT * FROM V_CUSTOMERS_INACTIVE_1M;


-- Top 15 Products By Units Sold
CREATE OR REPLACE VIEW V_TOP15_PRODUCTS_BY_UNITS AS
SELECT *
FROM (
    SELECT
        p.product_name,
        NVL(SUM(d.quantity), 0) AS total_units_sold
    FROM invoices_details d
    JOIN products p
        ON p.product_id = d.product_id
    GROUP BY p.product_name
    ORDER BY total_units_sold DESC
)
FETCH FIRST 15 ROWS ONLY;

SELECT * FROM V_TOP15_PRODUCTS_BY_UNITS;



-- Products that Never Sell 
CREATE OR REPLACE VIEW V_PRODUCTS_NEVER_SOLD AS
SELECT p.product_id, p.product_name, p.current_stock
FROM products p
LEFT JOIN invoices_details d ON p.product_id = d.product_id
WHERE d.product_id IS NULL;

SELECT * FROM V_PRODUCTS_NEVER_SOLD;


-- Total Money in Unpaid Bills (Uses discount % on bills_details)
CREATE OR REPLACE VIEW V_TOTAL_MONEY_IN_UNPAID_BILLS AS
SELECT NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_unpaid_amount
FROM bills b
JOIN bills_details d ON b.bill_id = d.bill_id
WHERE NVL(UPPER(b.status),'') <> 'PAID';

SELECT * FROM V_TOTAL_MONEY_IN_UNPAID_BILLS;



-- Top 15 Products by Revenue (After - Discount)
CREATE OR REPLACE VIEW V_TOP15_PRODUCTS_BY_REVENUE AS
SELECT *
FROM (
  SELECT
    d.product_id,
    NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_revenue
  FROM invoices_details d
  GROUP BY d.product_id
  ORDER BY total_revenue DESC
)
FETCH FIRST 5 ROWS ONLY;

SELECT * FROM V_TOP15_PRODUCTS_BY_REVENUE;

-- Staff who generate most Revenue
CREATE OR REPLACE VIEW V_STAFF_BY_REVENUE AS
SELECT
  u.user_id,
  u.username,
  NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_revenue
FROM users u
LEFT JOIN invoices i ON u.user_id = i.user_id
LEFT JOIN invoices_details d ON i.invoice_id = d.invoice_id
GROUP BY u.user_id, u.username
ORDER BY total_revenue DESC;

SELECT * FROM V_STAFF_BY_REVENUE;


-- Staff with Most Sales (Total Count of invoices handled)
CREATE OR REPLACE VIEW V_STAFF_BY_INVOICE_COUNT AS
SELECT
  u.user_id,
  u.username,
  NVL(COUNT(i.invoice_id),0) AS invoices_count
FROM users u
LEFT JOIN invoices i ON u.user_id = i.user_id
GROUP BY u.user_id, u.username
ORDER BY invoices_count DESC;

SELECT * FROM V_STAFF_BY_INVOICE_COUNT;

-- Products Running Out of Stock (threshold <= 5)
CREATE OR REPLACE VIEW V_PRODUCTS_LOW_STOCK AS
SELECT
  p.product_id,
  p.product_name,
  p.current_stock
FROM products p
WHERE p.current_stock <= 5
ORDER BY p.current_stock ASC;

SELECT * FROM V_PRODUCTS_LOW_STOCK;

--------------------------------------------------------------------------------
-- 11) TOTAL SALES: TODAY / THIS WEEK / THIS MONTH / THIS YEAR
-- All revenue calculations apply discount percentage
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW V_TOTAL_SALES_TODAY AS
SELECT TRUNC(i.invoice_date) AS sales_day,
       NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_sales
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
WHERE TRUNC(i.invoice_date) = TRUNC(SYSDATE)
GROUP BY TRUNC(i.invoice_date);

CREATE OR REPLACE VIEW V_TOTAL_SALES_THIS_WEEK AS
SELECT TRUNC(i.invoice_date,'IW') AS sales_week_start,
       NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_sales
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
WHERE TRUNC(i.invoice_date,'IW') = TRUNC(SYSDATE,'IW')
GROUP BY TRUNC(i.invoice_date,'IW');


CREATE OR REPLACE VIEW V_TOTAL_SALES_THIS_MONTH AS
SELECT TRUNC(i.invoice_date,'MM') AS sales_month,
       NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_sales
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
WHERE TRUNC(i.invoice_date,'MM') = TRUNC(SYSDATE,'MM')
GROUP BY TRUNC(i.invoice_date,'MM');


CREATE OR REPLACE VIEW V_TOTAL_SALES_THIS_YEAR AS
SELECT TRUNC(i.invoice_date,'YYYY') AS sales_year,
       NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_sales
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
WHERE TRUNC(i.invoice_date,'YYYY') = TRUNC(SYSDATE,'YYYY')
GROUP BY TRUNC(i.invoice_date,'YYYY');


-- Total Discount Given (All Time)
-- Discount % Applied to (Quantity * Unit_Price)
CREATE OR REPLACE VIEW V_TOTAL_DISCOUNT_ALLTIME AS
SELECT NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_amount
FROM invoices_details d;


-- Total Discount Given by Day / Month / Year (General Summary)
CREATE OR REPLACE VIEW V_TOTAL_DISCOUNT_BY_DAY AS
SELECT TRUNC(i.invoice_date) AS dt,
       NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_amount
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
GROUP BY TRUNC(i.invoice_date);


CREATE OR REPLACE VIEW V_TOTAL_DISCOUNT_BY_MONTH AS
SELECT TRUNC(i.invoice_date,'MM') AS month,
       NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_amount
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
GROUP BY TRUNC(i.invoice_date,'MM');

CREATE OR REPLACE VIEW V_TOTAL_DISCOUNT_BY_YEAR AS
SELECT TRUNC(i.invoice_date,'YYYY') AS yr,
       NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_amount
FROM invoices i
JOIN invoices_details d ON i.invoice_id = d.invoice_id
GROUP BY TRUNC(i.invoice_date,'YYYY');



-- Total Number of Customer
CREATE OR REPLACE VIEW V_TOTAL_CUSTOMERS AS
SELECT COUNT(*) AS total_customers FROM customers;

-- Total Number of Products
CREATE OR REPLACE VIEW V_TOTAL_PRODUCTS AS
SELECT COUNT(*) AS total_products FROM products;


-- New Customers and Suppliers Created: Day / Month / Year
CREATE OR REPLACE VIEW V_NEW_CUSTOMERS_SUPPLIERS_DAY AS
SELECT TRUNC(SYSDATE) AS day,
       (SELECT NVL(COUNT(*),0) FROM customers WHERE TRUNC(created_date) = TRUNC(SYSDATE)) AS new_customers,
       (SELECT NVL(COUNT(*),0) FROM suppliers WHERE TRUNC(created_date) = TRUNC(SYSDATE)) AS new_suppliers
FROM dual;

CREATE OR REPLACE VIEW V_NEW_CUSTOMERS_SUPPLIERS_MONTH AS
SELECT TRUNC(SYSDATE,'MM') AS month,
       (SELECT NVL(COUNT(*),0) FROM customers WHERE TRUNC(created_date,'MM') = TRUNC(SYSDATE,'MM')) AS new_customers,
       (SELECT NVL(COUNT(*),0) FROM suppliers WHERE TRUNC(created_date,'MM') = TRUNC(SYSDATE,'MM')) AS new_suppliers
FROM dual;

CREATE OR REPLACE VIEW V_NEW_CUSTOMERS_SUPPLIERS_YEAR AS
SELECT TRUNC(SYSDATE,'YYYY') AS year,
       (SELECT NVL(COUNT(*),0) FROM customers WHERE TRUNC(created_date,'YYYY') = TRUNC(SYSDATE,'YYYY')) AS new_customers,
       (SELECT NVL(COUNT(*),0) FROM suppliers WHERE TRUNC(created_date,'YYYY') = TRUNC(SYSDATE,'YYYY')) AS new_suppliers
FROM dual;



-- Total Number of Paid / Unpaid / Cancelled Bills (Their Counts)
CREATE OR REPLACE VIEW V_BILLS_STATUS_COUNTS AS
SELECT NVL(SUM(CASE WHEN UPPER(status) = 'PAID' THEN 1 ELSE 0 END),0) AS paid_count,
       NVL(SUM(CASE WHEN UPPER(status) = 'UNPAID' THEN 1 ELSE 0 END),0) AS unpaid_count,
       NVL(SUM(CASE WHEN UPPER(status) = 'CANCELLED' THEN 1 ELSE 0 END),0) AS cancelled_count,
       COUNT(*) AS total_bills
FROM bills;
SELECT * FROM V_BILLS_STATUS_COUNTS;

--  Which Product Category has the most discount (Monetary sum of Discounts)
CREATE OR REPLACE VIEW V_CATEGORY_MOST_DISCOUNT AS
SELECT
  pc.category_id,
  c.category_name,
  NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_amount
FROM products pc
JOIN categories c ON pc.category_id = c.category_id
LEFT JOIN invoices_details d ON pc.product_id = d.product_id
GROUP BY pc.category_id, c.category_name
ORDER BY total_discount_amount DESC;

SELECT * FROM V_CATEGORY_MOST_DISCOUNT;


-- Product Sales Performance (Sales = quantity/revenuue, Purchase = Quantity/Cost)
CREATE OR REPLACE VIEW V_PRODUCT_SALES_PERFORMANCE AS
SELECT
  p.product_id,
  p.product_name,
  p.category_id,
  NVL(s.sales_qty,0)       AS sales_qty,
  NVL(s.sales_revenue,0)   AS sales_revenue,
  NVL(b.purchase_qty,0)    AS purchase_qty,
  NVL(b.purchase_cost,0)   AS purchase_cost,
  NVL(s.sales_revenue,0) - NVL(b.purchase_cost,0) AS gross_profit
FROM products p
LEFT JOIN (
   SELECT product_id,
          SUM(quantity) AS sales_qty,
          SUM(quantity * unit_price * (1 - NVL(discount,0)/100)) AS sales_revenue
   FROM invoices_details
   GROUP BY product_id
) s ON p.product_id = s.product_id
LEFT JOIN (
   SELECT product_id,
          SUM(quantity) AS purchase_qty,
          SUM(quantity * unit_price * (1 - NVL(discount,0)/100)) AS purchase_cost
   FROM bills_details
   GROUP BY product_id
) b ON p.product_id = b.product_id;

SELECT * FROM V_PRODUCT_SALES_PERFORMANCE;


-- Product Category Profitability (Gross Profit per Category)
CREATE OR REPLACE VIEW V_CATEGORY_PROFITABILITY AS
SELECT
  pc.category_id,
  c.category_name,
  NVL(SUM(s.sales_revenue),0) AS sales_revenue,
  NVL(SUM(b.purchase_cost),0) AS purchase_cost,
  NVL(SUM(s.sales_revenue),0) - NVL(SUM(b.purchase_cost),0) AS gross_profit
FROM products pc
JOIN categories c ON pc.category_id = c.category_id
LEFT JOIN (
   SELECT product_id,
          SUM(quantity * unit_price * (1 - NVL(discount,0)/100)) AS sales_revenue
   FROM invoices_details GROUP BY product_id
) s ON pc.product_id = s.product_id
LEFT JOIN (
   SELECT product_id,
          SUM(quantity * unit_price * (1 - NVL(discount,0)/100)) AS purchase_cost
   FROM bills_details GROUP BY product_id
) b ON pc.product_id = b.product_id
GROUP BY pc.category_id, c.category_name
ORDER BY gross_profit DESC;

SELECT * FROM V_CATEGORY_PROFITABILITY;



-- POWER BI

--0) V_INVENTORY_MOVEMENT

-- Purpose: Shows all stock movements from audit_logs (old/new qty & price changes).
-- Best Visual: Table or Matrix (log history is not meaningful in charts).


-- POWER BI Dashboard's Views

-- Main Dashboard

-- 1. V_TOTAL_SALES_THIS_MONTH
-- 2. V_TOTAL_SALES_TODAY
-- 3. V_TOTAL_CUSTOMERS
-- 4. V_TOTAL_CATEGORIES
-- 5. V.TOTAL_DISCOUNT_BY_MONTH
-- 6. V_BILLS_STATUS_COUNTS
-- 7. V_TOTAL_PRODUCTS
-- 8. LOW_STOCK_VIEW


-- Invoices Status Counts
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW V_INVOICES_STATUS_COUNTS AS
SELECT NVL(SUM(CASE WHEN UPPER(status) = 'PAID' THEN 1 ELSE 0 END),0)      AS paid_count,
       NVL(SUM(CASE WHEN UPPER(status) = 'UNPAID' THEN 1 ELSE 0 END),0)    AS unpaid_count,
       NVL(SUM(CASE WHEN UPPER(status) = 'CANCEL' THEN 1 ELSE 0 END),0) AS cancelled_count,
       COUNT(*) AS total_invoices
FROM invoices;

select * from invoices;
SELECT * FROM V_INVOICES_STATUS_COUNTS;

select * from V_PRODUCT_SALES_PERFORMANCE;

-- To query the view:
DROP VIEW V_INVOICES_STATUS_COUNTS;


describe invoices_details;
describe invoices;
describe bills;
describe bills_details;
describe suppliers;
describe customers;
describe users;
describe roles;
describe categories;
describe products;

select * from bills;
select * from bills_details;

select * from invoices_details;
CREATE OR REPLACE VIEW V_TOTAL_PROFIT
AS
SELECT 
    (
        -- Total Sales Revenue (only PAID invoices)
        NVL((
            SELECT SUM(
                id.QUANTITY * id.UNIT_PRICE * (1 - NVL(id.DISCOUNT,0)/100)
            )
            FROM invoices_details id
            JOIN invoices i ON i.INVOICE_ID = id.INVOICE_ID
            WHERE i.STATUS = 'paid'
        ), 0)
        -
        -- Total Purchase Cost (only PAID bills)
        NVL((
            SELECT SUM(
                bd.QUANTITY * bd.UNIT_PRICE * (1 - NVL(bd.DISCOUNT,0)/100)
            )
            FROM bills_details bd
            JOIN bills b ON b.BILL_ID = bd.BILL_ID
            WHERE b.STATUS = 'paid'
        ), 0)
    ) AS total_profit
FROM dual;


-- Total Revenue

CREATE OR REPLACE VIEW V_TOTAL_REVENUE
AS
select
i.status,
sum(id.quantity * id.unit_price * (1 - id.discount/100)) as total_revenue
from invoices_details id
left join invoices i
on i.invoice_id = id.invoice_id
group by i.status
where status = 'paid';



-- Total Cost

CREATE OR REPLACE VIEW V_TOTAL_COST
AS
SELECT
    b.status,
    SUM(bd.quantity * bd.unit_price * (1 - NVL(bd.discount,0)/100)) AS TOTAL_COST
FROM bills_details bd
LEFT JOIN bills b
    ON b.bill_id= bd.bill_id
WHERE UPPER(b.status) = 'PAID'
GROUP BY b.status;

SELECT * FROM V_TOTAL_COST;


-- Total Suppliers View

CREATE OR REPLACE VIEW V_TOTAL_SUPPLIERS AS
SELECT 
    COUNT(*) AS TOTAL_SUPPLIERS
FROM suppliers;

select * from v_total_suppliers;


CREATE OR REPLACE VIEW V_SUPPLIERS_PERFORMANCE AS
SELECT
    s.SUPPLIER_ID,
    s.SUPPLIER_NAME,

    -- Total Bills
    COUNT(b.BILL_ID) AS TOTAL_BILLS,

    -- Total Purchase Amount
    SUM(d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0)) AS TOTAL_SPENT,

    -- Total Products Supplied
    COUNT(DISTINCT d.PRODUCT_ID) AS TOTAL_PRODUCTS_SUPPLIED,

    -- Average Bill Value
    AVG((SELECT SUM(dd.QUANTITY * dd.UNIT_PRICE - NVL(dd.DISCOUNT,0))
         FROM bills_details dd WHERE dd.BILL_ID = b.BILL_ID)) AS AVG_BILL_AMOUNT,

    -- Most Recent Bill
    MAX(b.BILL_DATE) AS LAST_BILL_DATE
FROM suppliers s
LEFT JOIN bills b ON s.SUPPLIER_ID = b.SUPPLIER_ID
LEFT JOIN bills_details d ON b.BILL_ID = d.BILL_ID
GROUP BY s.SUPPLIER_ID, s.SUPPLIER_NAME;


-- Total Money in unpaid bills  
CREATE OR REPLACE VIEW V_TOTAL_MONEY_IN_UNPAID_BILLS AS
SELECT
    SUM(d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0)) AS TOTAL_PAYABLES
FROM bills b
JOIN bills_details d ON b.BILL_ID = d.BILL_ID
WHERE b.STATUS <> 'paid';


-- Bills status counts
CREATE OR REPLACE VIEW V_BILLS_STATUS_COUNTS AS
SELECT
    b.STATUS,
    COUNT(*) AS TOTAL_BILLS,
    SUM(d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0)) AS TOTAL_AMOUNT
FROM bills b
JOIN bills_details d ON b.BILL_ID = d.BILL_ID
GROUP BY b.STATUS;

select * from v_bills_status_counts;


-- Shows how many products each supplier provides + active/inactive status.
CREATE OR REPLACE VIEW V_SUPPLIER_PRODUCT_PORTFOLIO AS
SELECT
    s.SUPPLIER_ID,
    s.SUPPLIER_NAME,

    COUNT(p.PRODUCT_ID) AS TOTAL_PRODUCTS,
    SUM(CASE WHEN p.IS_ACTIVE = true THEN 1 ELSE 0 END) AS ACTIVE_PRODUCTS,
    SUM(CASE WHEN p.IS_ACTIVE = true THEN 1 ELSE 0 END) AS INACTIVE_PRODUCTS
FROM suppliers s
LEFT JOIN products p ON s.SUPPLIER_ID = p.SUPPLIER_ID
GROUP BY s.SUPPLIER_ID, s.SUPPLIER_NAME;

select * from products;



-- Supplier products ranked by sellings
CREATE OR REPLACE VIEW V_SUPPLIER_TOP_SELLING_PRODUCTS AS
SELECT
    s.SUPPLIER_ID,
    s.SUPPLIER_NAME,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,

    SUM(id.QUANTITY) AS TOTAL_SOLD_QTY,
    SUM(id.QUANTITY * id.UNIT_PRICE - NVL(id.DISCOUNT, 0)) AS TOTAL_REVENUE
FROM suppliers s
JOIN products p ON s.SUPPLIER_ID = p.SUPPLIER_ID
LEFT JOIN invoices_details id ON p.PRODUCT_ID = id.PRODUCT_ID
GROUP BY s.SUPPLIER_ID, s.SUPPLIER_NAME, p.PRODUCT_ID, p.PRODUCT_NAME;





-- Average cost per bill
CREATE OR REPLACE VIEW V_SUPPLIER_AVG_DELIVERY_VALUE AS
SELECT
    s.SUPPLIER_ID,
    s.SUPPLIER_NAME,
    AVG(
        (SELECT SUM(d.QUANTITY * d.UNIT_PRICE - NVL(d.DISCOUNT,0))
         FROM bills_details d
         WHERE d.BILL_ID = b.BILL_ID)
    ) AS AVG_BILL_VALUE
FROM suppliers s
JOIN bills b ON s.SUPPLIER_ID = b.SUPPLIER_ID
GROUP BY s.SUPPLIER_ID, s.SUPPLIER_NAME;


COMMIT;