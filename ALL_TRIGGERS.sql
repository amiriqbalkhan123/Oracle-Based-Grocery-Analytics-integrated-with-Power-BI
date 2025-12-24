
-- Creating Audit Logs Table to store every event handled by users regarding invoice and bill generation!
CREATE TABLE audit_logs (
    id NUMBER PRIMARY KEY,
    ref_type VARCHAR2(50),         -- This indicates whether it is Purchase or Bill
    ref_id NUMBER,                 -- It will record the BILL_ID or INVOICE_ID
    detail_id NUMBER,              -- DETAILS ABOUT THE TRANSACTION
    product_id NUMBER,             -- PRODUCT THAT IS GETTING SOLD
    old_qty NUMBER,                -- OLD QUANTITY FOR THE QUANTITY LEFT IN THE STOCK
    new_qty NUMBER,                -- NEW QUANTITY THAT IS GETTING SOLD OR PURCHASED
    old_price NUMBER,              -- OLD PRICE FOR THE PRODUCT GETTING SOLD OR PURCHASED
    new_price NUMBER,              -- NEW PRICE FOR THE PRODUCT GETTING SOLD OR PURCHASED
    action_type VARCHAR2(20),      -- INSERT/UPDATE/DELETE (WHICH OPERATION IT IS?)
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP          -- THE ACTUAL TIME OF THE TRANSACTION
);
-- SEQUENCE FOR AUDIT_LOGS TABLE
CREATE SEQUENCE audit_logs_seq START WITH 1 INCREMENT BY 1;


-- Trigger: Inserting Purchases (Bills_Details)
CREATE OR REPLACE TRIGGER trg_purchase_insert
AFTER INSERT ON bills_details
FOR EACH ROW
BEGIN
    -- Increasing The stock
    UPDATE products
    SET current_stock = current_stock + :NEW.quantity
    WHERE product_id = :NEW.product_id;

    -- Recording the Transaction details into Audit Logs Table
    INSERT INTO audit_logs (
        id, ref_type, ref_id, detail_id, product_id,
        old_qty, new_qty,
        old_price, new_price,
        action_type
    ) VALUES (
        audit_logs_seq.NEXTVAL,
        'purchase',
        :NEW.bill_id,
        NULL,                        -- we set this as null as we don't have bill 
        :NEW.product_id,
        NULL,
        :NEW.quantity,
        NULL,
        :NEW.unit_price,
        'INSERT'
    );
END;
/

-- Trigger: Updating Purchases (Bills_Details)

CREATE OR REPLACE TRIGGER trg_purchase_update
AFTER UPDATE ON bills_details
FOR EACH ROW
BEGIN
    -- Adjusting stock based on change in quantity
    UPDATE products
    SET current_stock = current_stock + (:NEW.quantity - :OLD.quantity)
    WHERE product_id = :NEW.product_id;

    -- Auditing the log here as before
    INSERT INTO audit_logs (
        id, ref_type, ref_id, detail_id, product_id,
        old_qty, new_qty,
        old_price, new_price,
        action_type
    ) VALUES (
        audit_logs_seq.NEXTVAL,
        'purchase',
        :NEW.bill_id,
        NULL,
        :NEW.product_id,
        :OLD.quantity,
        :NEW.quantity,
        :OLD.unit_price,
        :NEW.unit_price,
        'UPDATE'
    );
END;
/

-- Trigger: Deleting Purchases (Bills_Details)
CREATE OR REPLACE TRIGGER trg_purchase_delete
AFTER DELETE ON bills_details
FOR EACH ROW
BEGIN
    -- Reversing the stock
    UPDATE products
    SET current_stock = current_stock - :OLD.quantity
    WHERE product_id = :OLD.product_id;

    -- Auditing log
    INSERT INTO audit_logs (
        id, ref_type, ref_id, detail_id, product_id,
        old_qty, new_qty,
        old_price, new_price,
        action_type
    ) VALUES (
        audit_logs_seq.NEXTVAL,
        'purchase',
        :OLD.bill_id,
        NULL,
        :OLD.product_id,
        :OLD.quantity,
        NULL,
        :OLD.unit_price,
        NULL,
        'DELETE'
    );
END;
/

-- Trigger: Inserting Sales (Invoices_details)
CREATE OR REPLACE TRIGGER trg_sale_insert
AFTER INSERT ON invoices_details
FOR EACH ROW
BEGIN
    -- Decrease  the stock here because of the sale
    UPDATE products
    SET current_stock = current_stock - :NEW.quantity
    WHERE product_id = :NEW.product_id;

    -- Auditing the  log
    INSERT INTO audit_logs (
        id, ref_type, ref_id, detail_id, product_id,
        old_qty, new_qty,
        old_price, new_price,
        action_type
    ) VALUES (
        audit_logs_seq.NEXTVAL,
        'sale',
        :NEW.invoice_id,
        NULL,
        :NEW.product_id,
        NULL,
        :NEW.quantity,
        NULL,
        :NEW.unit_price,
        'INSERT'
    );
END;
/


-- Trigger: Updating Sales (Invoices_details)
CREATE OR REPLACE TRIGGER trg_sale_update
AFTER UPDATE ON invoices_details
FOR EACH ROW
BEGIN
    -- Adjusting stock (reverse old, apply new)
    UPDATE products
    SET current_stock = current_stock - (:NEW.quantity - :OLD.quantity)
    WHERE product_id = :NEW.product_id;

    -- Auditing the log here 
    INSERT INTO audit_logs (
        id, ref_type, ref_id, detail_id, product_id,
        old_qty, new_qty,
        old_price, new_price,
        action_type
    ) VALUES (
        audit_logs_seq.NEXTVAL,
        'sale',
        :NEW.invoice_id,
        NULL,
        :NEW.product_id,
        :OLD.quantity,
        :NEW.quantity,
        :OLD.unit_price,
        :NEW.unit_price,
        'UPDATE'
    );
END;
/


-- Trigger: Deleting Sales (Invoices_details)
CREATE OR REPLACE TRIGGER trg_sale_delete
AFTER DELETE ON invoices_details
FOR EACH ROW
BEGIN
    -- Restoring the stock here
    UPDATE products
    SET current_stock = current_stock + :OLD.quantity
    WHERE product_id = :OLD.product_id;

    -- Auditing the log here
    INSERT INTO audit_logs (
        id, ref_type, ref_id, detail_id, product_id,
        old_qty, new_qty,
        old_price, new_price,
        action_type
    ) VALUES (
        audit_logs_seq.NEXTVAL,
        'sale',
        :OLD.invoice_id,
        NULL,
        :OLD.product_id,
        :OLD.quantity,
        NULL,
        :OLD.unit_price,
        NULL,
        'DELETE'
    );
END;
/




-- Testing all the Triggers' Response to Events
select * from products;

UPDATE products
SET current_stock = 0
WHERE product_id = 1;
INSERT INTO bills_details (bill_id, product_id, quantity, unit_price, discount)
VALUES (100, 1, 10, 5000, 0);
select * from products;
select * from audit_logs;
UPDATE bills_details
SET quantity = 15, unit_price = 5200
WHERE bill_id = 100 AND product_id = 1;
select * from bills_details;
INSERT INTO invoices_details (invoice_id, product_id, quantity, unit_price, discount)
VALUES (20, 1, 3, 8000, 0);
select * from invoices_details;
select * from invoices;
select * from invoices_details where unit_price = 8000;
delete from invoices_details where unit_price = 8000;