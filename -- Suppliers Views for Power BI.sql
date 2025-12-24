-- Suppliers Views for Power BI

-- Total Purchase Amount by Supplier (All time calculated)
CREATE OR REPLACE VIEW V_SUPPLIER_TOTAL_PURCHASE AS
SELECT
    s.supplier_id,
    s.supplier_name,
    NVL(SUM(d.quantity * d.unit_price - NVL(d.discount,0)),0) AS total_purchase_amount
FROM suppliers s
LEFT JOIN bills b ON s.supplier_id = b.supplier_id
LEFT JOIN bills_details d ON b.bill_id = d.bill_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_purchase_amount DESC;


-- Top 10 Suppliers by Purchase Amount
CREATE OR REPLACE VIEW V_SUPPLIER_TOP10_BY_PURCHASE AS
SELECT *
FROM (
    SELECT
        s.supplier_id,
        s.supplier_name,
        NVL(SUM(d.quantity * d.unit_price - NVL(d.discount,0)),0) AS total_purchase_amount
    FROM suppliers s
    LEFT JOIN bills b ON s.supplier_id = b.supplier_id
    LEFT JOIN bills_details d ON b.bill_id = d.bill_id
    GROUP BY s.supplier_id, s.supplier_name
    ORDER BY total_purchase_amount DESC
)
FETCH FIRST 10 ROWS ONLY;

SELECT * FROM V_SUPPLIER_TOP10_BY_PURCHASE;


-- Supplier-Wise Product Supply Count
CREATE OR REPLACE VIEW V_SUPPLIER_PRODUCT_COUNT AS
SELECT
    s.supplier_id,
    s.supplier_name,
    COUNT(p.product_id) AS total_products_supplied
FROM suppliers s
LEFT JOIN products p ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_products_supplied DESC;

SELECT * FROM V_SUPPLIER_PRODUCT_COUNT;


-- Supplier Purchase Trend (Based on Month (Monthly))
CREATE OR REPLACE VIEW V_SUPPLIER_MONTHLY_PURCHASE AS
SELECT
    s.supplier_id,
    s.supplier_name,
    TRUNC(b.bill_date, 'MM') AS purchase_month,
    NVL(SUM(d.quantity * d.unit_price - NVL(d.discount,0)),0) AS monthly_purchase_total
FROM suppliers s
LEFT JOIN bills b ON s.supplier_id = b.supplier_id
LEFT JOIN bills_details d ON b.bill_id = d.bill_id
GROUP BY s.supplier_id, s.supplier_name, TRUNC(b.bill_date, 'MM')
ORDER BY purchase_month;

SELECT * FROM V_SUPPLIER_MONTHLY_PURCHASE;


-- Supplier Order Count (How many bills do we have from each supplier)
CREATE OR REPLACE VIEW V_SUPPLIER_ORDER_COUNT AS
WITH ORDER_COUNTS AS (
    SELECT
        s.SUPPLIER_ID,
        s.SUPPLIER_NAME,
        COUNT(b.BILL_ID) AS ORDER_COUNT
    FROM suppliers s
    LEFT JOIN bills b ON s.SUPPLIER_ID = b.SUPPLIER_ID
    GROUP BY s.SUPPLIER_ID, s.SUPPLIER_NAME
),
RANKED AS (
    SELECT SUPPLIER_NAME, ORDER_COUNT,
           ROW_NUMBER() OVER (ORDER BY ORDER_COUNT DESC) AS RN
    FROM ORDER_COUNTS
)
SELECT SUPPLIER_NAME, ORDER_COUNT FROM RANKED WHERE RN <= 10
UNION ALL
SELECT 'OTHERS', SUM(ORDER_COUNT) FROM RANKED WHERE RN > 10;

drop view v_supplier_order_count_top10;


SELECT * FROM V_SUPPLIER_MONTHLY_PURCHASE;
drop view V_SUPPLIER_ORDER_COUNT;



CREATE OR REPLACE VIEW V_SUPPLIER_DISCOUNT_SUM AS
SELECT
    s.supplier_id,
    s.supplier_name,
    NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_amount
FROM suppliers s
LEFT JOIN bills b ON s.supplier_id = b.supplier_id
LEFT JOIN bills_details d ON b.bill_id = d.bill_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_discount_amount DESC;

SELECT * FROM V_SUPPLIER_DISCOUNT_SUM;

-- Supplier with no purchases ever
CREATE OR REPLACE VIEW V_SUPPLIERS_NEVER_USED AS
SELECT
    s.supplier_id,
    s.supplier_name,
    s.created_date
FROM suppliers s
LEFT JOIN bills b ON s.supplier_id = b.supplier_id
WHERE b.supplier_id IS NULL;

SELECT * FROM V_SUPPLIERS_NEVER_USED;

-- Suppliers that supply products which never sell
CREATE OR REPLACE VIEW V_SUPPLIERS_PRODUCTS_NEVER_SOLD AS
SELECT
    s.supplier_id,
    s.supplier_name,
    p.product_id,
    p.product_name,
    p.current_stock
FROM suppliers s
JOIN products p ON p.supplier_id = s.supplier_id
LEFT JOIN invoices_details d ON p.product_id = d.product_id
WHERE d.product_id IS NULL;

SELECT * FROM V_SUPPLIERS_PRODUCTS_NEVER_SOLD;

-- Supplier Contribution to the total Inventory in our Grocery Store (By Stock Value)
CREATE OR REPLACE VIEW V_SUPPLIER_STOCK_VALUE AS
SELECT
    s.supplier_id,
    s.supplier_name,
    NVL(SUM(p.current_stock * p.sales_price),0) AS total_stock_value
FROM suppliers s
LEFT JOIN products p ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_stock_value DESC;

SELECT * FROM V_SUPPLIER_STOCK_VALUE;


-- Supplier Activiy Summary (Full Insights View)
CREATE OR REPLACE VIEW V_SUPPLIER_ACTIVITY_SUMMARY AS
SELECT
    s.supplier_id,
    s.supplier_name,
    COUNT(DISTINCT p.product_id) AS products_supplied,
    COUNT(DISTINCT b.bill_id) AS bills_count,
    NVL(SUM(d.quantity * d.unit_price - NVL(d.discount,0)),0) AS total_purchase,
    NVL(SUM(d.quantity * d.unit_price * (NVL(d.discount,0)/100)),0) AS total_discount_given,
    NVL(SUM(p.current_stock),0) AS total_stock_units
FROM suppliers s
LEFT JOIN products p ON p.supplier_id = s.supplier_id
LEFT JOIN bills b ON b.supplier_id = s.supplier_id
LEFT JOIN bills_details d ON b.bill_id = d.bill_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_purchase DESC;

SELECT * FROM V_SUPPLIER_ACTIVITY_SUMMARY;


-- Overall Purchase Summary for the Suppliers
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

-- Suppliers Performance (items purchased, purchase spend after-discount)
CREATE OR REPLACE VIEW V_SUPPLIERS_PERFORMANCE AS
SELECT
  s.supplier_id,
  s.supplier_name,
  NVL(SUM(d.quantity),0)      AS total_items_purchased,
  NVL(SUM(d.quantity * d.unit_price * (1 - NVL(d.discount,0)/100)),0) AS total_purchase_spend
FROM suppliers s
LEFT JOIN bills b ON s.supplier_id = b.supplier_id
LEFT JOIN bills_details d ON b.bill_id = d.bill_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_purchase_spend DESC;

select * from v_suppliers_performance;





-- Total Bills Status Count for 'paid', 'unpaid', 'cancel'
CREATE OR REPLACE VIEW V_BILLS_STATUS_COUNTS AS
SELECT
    COUNT(CASE WHEN STATUS = 'paid' THEN 1 END) AS PAID_COUNTS,
    COUNT(CASE WHEN STATUS = 'unpaid' THEN 1 END) AS UNPAID_COUNTS,
    COUNT(CASE WHEN STATUS = 'cancel' THEN 1 END) AS PENDING_COUNTS,
    COUNT(*) AS TOTAL_BILLS
FROM bills;
select * from V_BILLS_STATUS_COUNTS;
drop view b_bills_status_counts;
DROP VIEW V_BILLS_STATUS_COUNTS;
COMMIT;

select * from V_SUPPLIER_TOP10_BY_PURCHASE;



 -- Total Suppliers
CREATE OR REPLACE VIEW V_TOTAL_SUPPLIERS AS
SELECT 
COUNT(SUPPLIER_ID) AS TOTAL_SUPPLIER_COUNT
FROM SUPPLIERS;

select * from v_total_suppliers;

-- Average Product per Supplier
CREATE OR REPLACE VIEW V_KPI_AVG_PRODUCTS_PER_SUPPLIER AS
SELECT
    ROUND(AVG(PRODUCT_COUNT), 2) AS AVG_PRODUCTS_PER_SUPPLIER
FROM (
    SELECT
        s.SUPPLIER_ID,
        COUNT(p.PRODUCT_ID) AS PRODUCT_COUNT
    FROM suppliers s
    LEFT JOIN products p 
        ON s.SUPPLIER_ID = p.SUPPLIER_ID
    GROUP BY s.SUPPLIER_ID
);
select * from V_KPI_AVG_PRODUCTS_PER_SUPPLIER;

-- Latest supplier added to the system (most recent)
CREATE OR REPLACE VIEW V_KPI_NEWEST_SUPPLIER AS
SELECT SUPPLIER_NAME, CREATED_DATE AS NEWEST_SUPPLIER_CREATED_DATE
FROM (
    SELECT 
        SUPPLIER_NAME,
        CREATED_DATE,
        RANK() OVER (ORDER BY CREATED_DATE DESC) AS RN
    FROM suppliers
)
WHERE RN = 1;
select * from V_KPI_NEWEST_SUPPLIER;


-- Oldest Supplier added to the system (First Added)
CREATE OR REPLACE VIEW V_KPI_OLDEST_SUPPLIER AS
SELECT SUPPLIER_NAME, CREATED_DATE AS FIRST_SUPPLIER_CREATED_DATE
FROM (
    SELECT 
        SUPPLIER_NAME,
        CREATED_DATE,
        RANK() OVER (ORDER BY CREATED_DATE ASC) AS RN
    FROM suppliers
)
WHERE RN = 1;

select * from V_KPI_OLDEST_SUPPLIER;

-- Most Valuable Supplier of store
CREATE OR REPLACE VIEW V_KPI_TOP_SUPPLIER_BY_PURCHASE AS
SELECT SUPPLIER_NAME, TOTAL_AMOUNT FROM (
    SELECT
        s.SUPPLIER_NAME,
        SUM(bd.QUANTITY * bd.UNIT_PRICE - NVL(bd.DISCOUNT,0)) AS TOTAL_AMOUNT,
        RANK() OVER (ORDER BY SUM(bd.QUANTITY * bd.UNIT_PRICE - NVL(bd.DISCOUNT,0)) DESC) AS RN
    FROM suppliers s
    LEFT JOIN bills b ON s.SUPPLIER_ID = b.SUPPLIER_ID
    LEFT JOIN bills_details bd ON b.BILL_ID = bd.BILL_ID
    GROUP BY s.SUPPLIER_NAME
)
WHERE RN = 1;

select * from V_KPI_TOP_SUPPLIER_BY_PURCHASE;