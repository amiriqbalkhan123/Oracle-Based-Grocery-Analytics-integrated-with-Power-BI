select * from cat;

select * from customers;

UPDATE customers
SET CREATED_DATE = SYSDATE
WHERE CUSTOMER_ID = 43;

SELECT * FROM CUSTOMERS;

SELECT * FROM SUPPLIERS;

SELECT * FROM CATEGORIES;

SELECT * FROM PRODUCTS;

SELECT * FROM INVOICES;

SELECT * FROM BILLS;
SELECT * FROM BILLS_DETAILS;
SELECT * FROM INVOICES_DETAILS;

SELECT * FROM INVOICES;

SELECT * FROM INVOICES_DETAILS;
SELECT * FROM PRODUCTS;
INSERT INTO INVOICES_DETAILS VALUES((SELECT INVOICE_ID FROM INVOICES WHERE INVOICE_ID = 1), (SELECT PRODUCT_ID FROM PRODUCTS WHERE PRODUCT_ID = 1), 10, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 1), 0.25);

SELECT * FROM INVOICES_DETAILS;























INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (1, 12, 3, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 12), 0.05);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (2, 47, 10, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 47), 0.10);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (3, 5, 1, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 5), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (4, 95, 6, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 95), 0.20);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (5, 31, 2, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 31), 0.15);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (6, 22, 8, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 22), 0.08);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (7, 64, 4, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 64), 0.12);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (8, 18, 12, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 18), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (9, 2, 20, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 2), 0.25);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (10, 89, 7, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 89), 0.30);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (11, 33, 5, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 33), 0.07);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (12, 76, 9, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 76), 0.18);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (13, 41, 3, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 41), 0.02);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (14, 57, 14, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 57), 0.22);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (15, 6, 11, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 6), 0.00);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (16, 90, 2, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 90), 0.05);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (17, 44, 16, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 44), 0.35);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (18, 27, 1, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 27), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (19, 13, 13, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 13), 0.10);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (20, 68, 4, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 68), 0.40);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (21, 10, 6, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 10), 0.03);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (22, 55, 9, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 55), 0.12);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (23, 79, 7, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 79), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (24, 46, 15, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 46), 0.28);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (25, 1, 2, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 1), 0.00);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (26, 83, 18, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 83), 0.20);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (27, 29, 3, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 29), 0.06);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (28, 51, 5, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 51), 0.09);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (29, 38, 10, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 38), 0.15);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (30, 72, 8, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 72), 0.00);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (31, 7, 4, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 7), 0.04);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (32, 85, 12, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 85), 0.50);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (33, 54, 2, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 54), 0.01);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (34, 20, 9, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 20), 0.11);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (35, 61, 14, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 61), 0.18);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (36, 34, 6, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 34), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (1, 48, 3, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 48), 0.07);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (2, 16, 11, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 16), 0.13);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (3, 70, 5, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 70), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (4, 59, 7, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 59), 0.21);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (5, 26, 2, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 26), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (6, 94, 1, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 94), 0.30);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (7, 43, 13, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 43), 0.05);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (8, 8, 9, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 8), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (9, 66, 4, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 66), 0.16);

INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (10, 39, 10, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 39), 0.08);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (11, 24, 6, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 24), 0.00);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (12, 87, 15, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 87), 0.40);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (13, 56, 3, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 56), 0.02);
INSERT INTO INVOICES_DETAILS (INVOICE_ID, PRODUCT_ID, QUANTITY, UNIT_PRICE, DISCOUNT) VALUES (14, 17, 8, (SELECT SALES_PRICE FROM PRODUCTS WHERE PRODUCT_ID = 17), 0.14);



SELECT * FROM INVOICES_DETAILS;






















INSERT INTO invoices_details VALUES (1, 5, 4, (SELECT sales_price FROM products WHERE product_id=5), 0.10);
INSERT INTO invoices_details VALUES (2, 17, 2, (SELECT sales_price FROM products WHERE product_id=17), 0.25);
INSERT INTO invoices_details VALUES (3, 9, 8, (SELECT sales_price FROM products WHERE product_id=9), 0.05);
INSERT INTO invoices_details VALUES (4, 33, 6, (SELECT sales_price FROM products WHERE product_id=33), 0.15);
INSERT INTO invoices_details VALUES (5, 12, 3, (SELECT sales_price FROM products WHERE product_id=12), 0.30);
INSERT INTO invoices_details VALUES (6, 44, 10, (SELECT sales_price FROM products WHERE product_id=44), 0.20);
INSERT INTO invoices_details VALUES (7, 28, 5, (SELECT sales_price FROM products WHERE product_id=28), 0.12);
INSERT INTO invoices_details VALUES (8, 7, 9, (SELECT sales_price FROM products WHERE product_id=7), 0.18);
INSERT INTO invoices_details VALUES (9, 55, 4, (SELECT sales_price FROM products WHERE product_id=55), 0.40);
INSERT INTO invoices_details VALUES (10, 6, 11, (SELECT sales_price FROM products WHERE product_id=6), 0.07);

INSERT INTO invoices_details VALUES (11, 21, 12, (SELECT sales_price FROM products WHERE product_id=21), 0.22);
INSERT INTO invoices_details VALUES (12, 72, 3, (SELECT sales_price FROM products WHERE product_id=72), 0.35);
INSERT INTO invoices_details VALUES (13, 18, 7, (SELECT sales_price FROM products WHERE product_id=18), 0.28);
INSERT INTO invoices_details VALUES (14, 94, 2, (SELECT sales_price FROM products WHERE product_id=94), 0.09);
INSERT INTO invoices_details VALUES (15, 65, 15, (SELECT sales_price FROM products WHERE product_id=65), 0.45);
INSERT INTO invoices_details VALUES (16, 11, 6, (SELECT sales_price FROM products WHERE product_id=11), 0.05);
INSERT INTO invoices_details VALUES (17, 3, 9, (SELECT sales_price FROM products WHERE product_id=3), 0.32);
INSERT INTO invoices_details VALUES (18, 49, 4, (SELECT sales_price FROM products WHERE product_id=49), 0.14);
INSERT INTO invoices_details VALUES (19, 36, 8, (SELECT sales_price FROM products WHERE product_id=36), 0.26);
INSERT INTO invoices_details VALUES (20, 1, 5, (SELECT sales_price FROM products WHERE product_id=1), 0.11);

INSERT INTO invoices_details VALUES (21, 83, 13, (SELECT sales_price FROM products WHERE product_id=83), 0.19);
INSERT INTO invoices_details VALUES (22, 59, 6, (SELECT sales_price FROM products WHERE product_id=59), 0.41);
INSERT INTO invoices_details VALUES (23, 24, 7, (SELECT sales_price FROM products WHERE product_id=24), 0.17);
INSERT INTO invoices_details VALUES (24, 15, 12, (SELECT sales_price FROM products WHERE product_id=15), 0.33);
INSERT INTO invoices_details VALUES (25, 30, 3, (SELECT sales_price FROM products WHERE product_id=30), 0.08);
INSERT INTO invoices_details VALUES (26, 92, 14, (SELECT sales_price FROM products WHERE product_id=92), 0.39);
INSERT INTO invoices_details VALUES (27, 40, 10, (SELECT sales_price FROM products WHERE product_id=40), 0.27);
INSERT INTO invoices_details VALUES (28, 19, 2, (SELECT sales_price FROM products WHERE product_id=19), 0.24);
INSERT INTO invoices_details VALUES (29, 60, 9, (SELECT sales_price FROM products WHERE product_id=60), 0.20);
INSERT INTO invoices_details VALUES (30, 13, 7, (SELECT sales_price FROM products WHERE product_id=13), 0.31);

INSERT INTO invoices_details VALUES (31, 71, 5, (SELECT sales_price FROM products WHERE product_id=71), 0.06);
INSERT INTO invoices_details VALUES (32, 45, 3, (SELECT sales_price FROM products WHERE product_id=45), 0.50);
INSERT INTO invoices_details VALUES (33, 52, 8, (SELECT sales_price FROM products WHERE product_id=52), 0.37);
INSERT INTO invoices_details VALUES (34, 89, 6, (SELECT sales_price FROM products WHERE product_id=89), 0.42);
INSERT INTO invoices_details VALUES (35, 22, 4, (SELECT sales_price FROM products WHERE product_id=22), 0.16);
INSERT INTO invoices_details VALUES (36, 76, 9, (SELECT sales_price FROM products WHERE product_id=76), 0.12);
INSERT INTO invoices_details VALUES (1, 14, 15, (SELECT sales_price FROM products WHERE product_id=14), 0.44);
INSERT INTO invoices_details VALUES (2, 8, 11, (SELECT sales_price FROM products WHERE product_id=8), 0.13);
INSERT INTO invoices_details VALUES (3, 50, 3, (SELECT sales_price FROM products WHERE product_id=50), 0.18);
INSERT INTO invoices_details VALUES (4, 27, 7, (SELECT sales_price FROM products WHERE product_id=27), 0.09);

INSERT INTO invoices_details VALUES (5, 61, 6, (SELECT sales_price FROM products WHERE product_id=61), 0.23);
INSERT INTO invoices_details VALUES (6, 32, 4, (SELECT sales_price FROM products WHERE product_id=32), 0.29);
INSERT INTO invoices_details VALUES (7, 87, 9, (SELECT sales_price FROM products WHERE product_id=87), 0.38);
INSERT INTO invoices_details VALUES (8, 10, 5, (SELECT sales_price FROM products WHERE product_id=10), 0.15);
INSERT INTO invoices_details VALUES (9, 43, 8, (SELECT sales_price FROM products WHERE product_id=43), 0.34);
INSERT INTO invoices_details VALUES (10, 95, 14, (SELECT sales_price FROM products WHERE product_id=95), 0.40);
INSERT INTO invoices_details VALUES (11, 57, 2, (SELECT sales_price FROM products WHERE product_id=57), 0.22);
INSERT INTO invoices_details VALUES (12, 26, 6, (SELECT sales_price FROM products WHERE product_id=26), 0.31);
INSERT INTO invoices_details VALUES (13, 35, 12, (SELECT sales_price FROM products WHERE product_id=35), 0.11);
INSERT INTO invoices_details VALUES (14, 63, 9, (SELECT sales_price FROM products WHERE product_id=63), 0.19);

INSERT INTO invoices_details VALUES (15, 73, 3, (SELECT sales_price FROM products WHERE product_id=73), 0.28);
INSERT INTO invoices_details VALUES (16, 47, 7, (SELECT sales_price FROM products WHERE product_id=47), 0.08);
INSERT INTO invoices_details VALUES (17, 20, 6, (SELECT sales_price FROM products WHERE product_id=20), 0.13);
INSERT INTO invoices_details VALUES (18, 91, 5, (SELECT sales_price FROM products WHERE product_id=91), 0.36);
INSERT INTO invoices_details VALUES (19, 48, 4, (SELECT sales_price FROM products WHERE product_id=48), 0.25);
INSERT INTO invoices_details VALUES (20, 66, 10, (SELECT sales_price FROM products WHERE product_id=66), 0.49);
INSERT INTO invoices_details VALUES (21, 4, 8, (SELECT sales_price FROM products WHERE product_id=4), 0.12);
INSERT INTO invoices_details VALUES (22, 16, 6, (SELECT sales_price FROM products WHERE product_id=16), 0.14);
INSERT INTO invoices_details VALUES (23, 74, 5, (SELECT sales_price FROM products WHERE product_id=74), 0.27);
INSERT INTO invoices_details VALUES (24, 25, 9, (SELECT sales_price FROM products WHERE product_id=25), 0.40);

INSERT INTO invoices_details VALUES (25, 53, 2, (SELECT sales_price FROM products WHERE product_id=53), 0.07);
INSERT INTO invoices_details VALUES (26, 37, 13, (SELECT sales_price FROM products WHERE product_id=37), 0.21);
INSERT INTO invoices_details VALUES (27, 93, 7, (SELECT sales_price FROM products WHERE product_id=93), 0.33);
INSERT INTO invoices_details VALUES (28, 23, 15, (SELECT sales_price FROM products WHERE product_id=23), 0.45);
INSERT INTO invoices_details VALUES (29, 29, 4, (SELECT sales_price FROM products WHERE product_id=29), 0.18);
INSERT INTO invoices_details VALUES (30, 42, 11, (SELECT sales_price FROM products WHERE product_id=42), 0.30);
INSERT INTO invoices_details VALUES (31, 62, 8, (SELECT sales_price FROM products WHERE product_id=62), 0.24);
INSERT INTO invoices_details VALUES (32, 39, 6, (SELECT sales_price FROM products WHERE product_id=39), 0.10);
INSERT INTO invoices_details VALUES (33, 85, 9, (SELECT sales_price FROM products WHERE product_id=85), 0.32);
INSERT INTO invoices_details VALUES (34, 41, 3, (SELECT sales_price FROM products WHERE product_id=41), 0.16);

INSERT INTO invoices_details VALUES (35, 69, 14, (SELECT sales_price FROM products WHERE product_id=69), 0.20);
INSERT INTO invoices_details VALUES (36, 58, 7, (SELECT sales_price FROM products WHERE product_id=58), 0.35);
INSERT INTO invoices_details VALUES (1, 84, 6, (SELECT sales_price FROM products WHERE product_id=84), 0.26);
INSERT INTO invoices_details VALUES (2, 31, 5, (SELECT sales_price FROM products WHERE product_id=31), 0.17);
INSERT INTO invoices_details VALUES (3, 75, 11, (SELECT sales_price FROM products WHERE product_id=75), 0.34);
INSERT INTO invoices_details VALUES (4, 46, 9, (SELECT sales_price FROM products WHERE product_id=46), 0.22);
INSERT INTO invoices_details VALUES (5, 81, 8, (SELECT sales_price FROM products WHERE product_id=81), 0.13);
INSERT INTO invoices_details VALUES (6, 90, 4, (SELECT sales_price FROM products WHERE product_id=90), 0.11);
INSERT INTO invoices_details VALUES (7, 64, 12, (SELECT sales_price FROM products WHERE product_id=64), 0.39);
INSERT INTO invoices_details VALUES (8, 80, 3, (SELECT sales_price FROM products WHERE product_id=80), 0.29);

select * from invoices_details;

INSERT INTO invoices_details VALUES (9, 14, 6, (SELECT sales_price FROM products WHERE product_id=14), 0.21);
INSERT INTO invoices_details VALUES (10, 67, 9, (SELECT sales_price FROM products WHERE product_id=67), 0.32);
INSERT INTO invoices_details VALUES (11, 22, 5, (SELECT sales_price FROM products WHERE product_id=22), 0.12);
INSERT INTO invoices_details VALUES (12, 79, 8, (SELECT sales_price FROM products WHERE product_id=79), 0.27);
INSERT INTO invoices_details VALUES (13, 9, 13, (SELECT sales_price FROM products WHERE product_id=9), 0.17);
INSERT INTO invoices_details VALUES (14, 54, 7, (SELECT sales_price FROM products WHERE product_id=54), 0.33);
INSERT INTO invoices_details VALUES (15, 38, 4, (SELECT sales_price FROM products WHERE product_id=38), 0.18);
INSERT INTO invoices_details VALUES (16, 26, 11, (SELECT sales_price FROM products WHERE product_id=26), 0.29);
INSERT INTO invoices_details VALUES (17, 10, 3, (SELECT sales_price FROM products WHERE product_id=10), 0.06);
INSERT INTO invoices_details VALUES (18, 93, 15, (SELECT sales_price FROM products WHERE product_id=93), 0.41);

INSERT INTO invoices_details VALUES (19, 5, 5, (SELECT sales_price FROM products WHERE product_id=5), 0.19);
INSERT INTO invoices_details VALUES (20, 92, 14, (SELECT sales_price FROM products WHERE product_id=92), 0.23);
INSERT INTO invoices_details VALUES (21, 33, 9, (SELECT sales_price FROM products WHERE product_id=33), 0.38);
INSERT INTO invoices_details VALUES (22, 48, 6, (SELECT sales_price FROM products WHERE product_id=48), 0.15);
INSERT INTO invoices_details VALUES (23, 41, 8, (SELECT sales_price FROM products WHERE product_id=41), 0.30);
INSERT INTO invoices_details VALUES (24, 15, 12, (SELECT sales_price FROM products WHERE product_id=15), 0.26);
INSERT INTO invoices_details VALUES (25, 77, 7, (SELECT sales_price FROM products WHERE product_id=77), 0.40);
INSERT INTO invoices_details VALUES (26, 68, 10, (SELECT sales_price FROM products WHERE product_id=68), 0.14);
INSERT INTO invoices_details VALUES (27, 4, 6, (SELECT sales_price FROM products WHERE product_id=4), 0.11);
INSERT INTO invoices_details VALUES (28, 86, 2, (SELECT sales_price FROM products WHERE product_id=86), 0.48);

INSERT INTO invoices_details VALUES (29, 62, 4, (SELECT sales_price FROM products WHERE product_id=62), 0.09);
INSERT INTO invoices_details VALUES (30, 31, 7, (SELECT sales_price FROM products WHERE product_id=31), 0.17);
INSERT INTO invoices_details VALUES (31, 89, 3, (SELECT sales_price FROM products WHERE product_id=89), 0.25);
INSERT INTO invoices_details VALUES (32, 21, 11, (SELECT sales_price FROM products WHERE product_id=21), 0.34);
INSERT INTO invoices_details VALUES (33, 20, 9, (SELECT sales_price FROM products WHERE product_id=20), 0.05);
INSERT INTO invoices_details VALUES (34, 43, 13, (SELECT sales_price FROM products WHERE product_id=43), 0.31);
INSERT INTO invoices_details VALUES (35, 13, 5, (SELECT sales_price FROM products WHERE product_id=13), 0.08);
INSERT INTO invoices_details VALUES (36, 75, 16, (SELECT sales_price FROM products WHERE product_id=75), 0.39);
INSERT INTO invoices_details VALUES (1, 47, 12, (SELECT sales_price FROM products WHERE product_id=47), 0.22);
INSERT INTO invoices_details VALUES (2, 25, 4, (SELECT sales_price FROM products WHERE product_id=25), 0.19);

INSERT INTO invoices_details VALUES (3, 52, 6, (SELECT sales_price FROM products WHERE product_id=52), 0.12);
INSERT INTO invoices_details VALUES (4, 69, 14, (SELECT sales_price FROM products WHERE product_id=69), 0.33);
INSERT INTO invoices_details VALUES (5, 35, 8, (SELECT sales_price FROM products WHERE product_id=35), 0.21);
INSERT INTO invoices_details VALUES (6, 83, 10, (SELECT sales_price FROM products WHERE product_id=83), 0.37);
INSERT INTO invoices_details VALUES (7, 11, 2, (SELECT sales_price FROM products WHERE product_id=11), 0.28);
INSERT INTO invoices_details VALUES (8, 50, 9, (SELECT sales_price FROM products WHERE product_id=50), 0.42);
INSERT INTO invoices_details VALUES (9, 64, 5, (SELECT sales_price FROM products WHERE product_id=64), 0.13);
INSERT INTO invoices_details VALUES (10, 18, 7, (SELECT sales_price FROM products WHERE product_id=18), 0.09);
INSERT INTO invoices_details VALUES (11, 8, 11, (SELECT sales_price FROM products WHERE product_id=8), 0.47);
INSERT INTO invoices_details VALUES (12, 71, 4, (SELECT sales_price FROM products WHERE product_id=71), 0.36);

INSERT INTO invoices_details VALUES (13, 42, 17, (SELECT sales_price FROM products WHERE product_id=42), 0.29);
INSERT INTO invoices_details VALUES (14, 55, 6, (SELECT sales_price FROM products WHERE product_id=55), 0.10);
INSERT INTO invoices_details VALUES (15, 84, 15, (SELECT sales_price FROM products WHERE product_id=84), 0.26);
INSERT INTO invoices_details VALUES (16, 27, 9, (SELECT sales_price FROM products WHERE product_id=27), 0.31);
INSERT INTO invoices_details VALUES (17, 32, 13, (SELECT sales_price FROM products WHERE product_id=32), 0.20);
INSERT INTO invoices_details VALUES (18, 63, 6, (SELECT sales_price FROM products WHERE product_id=63), 0.07);
INSERT INTO invoices_details VALUES (19, 12, 8, (SELECT sales_price FROM products WHERE product_id=12), 0.32);
INSERT INTO invoices_details VALUES (20, 73, 10, (SELECT sales_price FROM products WHERE product_id=73), 0.44);
INSERT INTO invoices_details VALUES (21, 30, 3, (SELECT sales_price FROM products WHERE product_id=30), 0.15);
INSERT INTO invoices_details VALUES (22, 91, 11, (SELECT sales_price FROM products WHERE product_id=91), 0.23);

INSERT INTO invoices_details VALUES (23, 7, 5, (SELECT sales_price FROM products WHERE product_id=7), 0.18);
INSERT INTO invoices_details VALUES (24, 46, 8, (SELECT sales_price FROM products WHERE product_id=46), 0.38);
INSERT INTO invoices_details VALUES (25, 2, 12, (SELECT sales_price FROM products WHERE product_id=2), 0.09);
INSERT INTO invoices_details VALUES (26, 39, 6, (SELECT sales_price FROM products WHERE product_id=39), 0.34);
INSERT INTO invoices_details VALUES (27, 60, 4, (SELECT sales_price FROM products WHERE product_id=60), 0.14);
INSERT INTO invoices_details VALUES (28, 76, 15, (SELECT sales_price FROM products WHERE product_id=76), 0.40);
INSERT INTO invoices_details VALUES (29, 58, 7, (SELECT sales_price FROM products WHERE product_id=58), 0.21);
INSERT INTO invoices_details VALUES (30, 49, 18, (SELECT sales_price FROM products WHERE product_id=49), 0.25);
INSERT INTO invoices_details VALUES (31, 94, 10, (SELECT sales_price FROM products WHERE product_id=94), 0.35);
INSERT INTO invoices_details VALUES (32, 1, 4, (SELECT sales_price FROM products WHERE product_id=1), 0.05);

INSERT INTO invoices_details VALUES (33, 82, 9, (SELECT sales_price FROM products WHERE product_id=82), 0.11);
INSERT INTO invoices_details VALUES (34, 16, 7, (SELECT sales_price FROM products WHERE product_id=16), 0.30);
INSERT INTO invoices_details VALUES (35, 70, 3, (SELECT sales_price FROM products WHERE product_id=70), 0.22);
INSERT INTO invoices_details VALUES (36, 24, 5, (SELECT sales_price FROM products WHERE product_id=24), 0.49);
INSERT INTO invoices_details VALUES (1, 28, 6, (SELECT sales_price FROM products WHERE product_id=28), 0.12);
INSERT INTO invoices_details VALUES (2, 44, 13, (SELECT sales_price FROM products WHERE product_id=44), 0.41);
INSERT INTO invoices_details VALUES (3, 6, 11, (SELECT sales_price FROM products WHERE product_id=6), 0.33);
INSERT INTO invoices_details VALUES (4, 80, 10, (SELECT sales_price FROM products WHERE product_id=80), 0.19);
INSERT INTO invoices_details VALUES (5, 29, 7, (SELECT sales_price FROM products WHERE product_id=29), 0.16);
INSERT INTO invoices_details VALUES (6, 88, 3, (SELECT sales_price FROM products WHERE product_id=88), 0.45);

INSERT INTO invoices_details VALUES (7, 72, 4, (SELECT sales_price FROM products WHERE product_id=72), 0.28);
INSERT INTO invoices_details VALUES (8, 90, 18, (SELECT sales_price FROM products WHERE product_id=90), 0.34);
INSERT INTO invoices_details VALUES (9, 56, 7, (SELECT sales_price FROM products WHERE product_id=56), 0.09);
INSERT INTO invoices_details VALUES (10, 57, 9, (SELECT sales_price FROM products WHERE product_id=57), 0.22);
INSERT INTO invoices_details VALUES (11, 85, 5, (SELECT sales_price FROM products WHERE product_id=85), 0.25);
INSERT INTO invoices_details VALUES (12, 17, 8, (SELECT sales_price FROM products WHERE product_id=17), 0.29);
INSERT INTO invoices_details VALUES (13, 3, 14, (SELECT sales_price FROM products WHERE product_id=3), 0.20);
INSERT INTO invoices_details VALUES (14, 53, 6, (SELECT sales_price FROM products WHERE product_id=53), 0.43);
INSERT INTO invoices_details VALUES (15, 66, 12, (SELECT sales_price FROM products WHERE product_id=66), 0.37);
INSERT INTO invoices_details VALUES (16, 95, 4, (SELECT sales_price FROM products WHERE product_id=95), 0.18);

INSERT INTO invoices_details VALUES (17, 61, 9, (SELECT sales_price FROM products WHERE product_id=61), 0.11);
INSERT INTO invoices_details VALUES (18, 74, 16, (SELECT sales_price FROM products WHERE product_id=74), 0.36);
INSERT INTO invoices_details VALUES (19, 37, 8, (SELECT sales_price FROM products WHERE product_id=37), 0.30);
INSERT INTO invoices_details VALUES (20, 23, 7, (SELECT sales_price FROM products WHERE product_id=23), 0.14);
INSERT INTO invoices_details VALUES (21, 40, 5, (SELECT sales_price FROM products WHERE product_id=40), 0.33);
INSERT INTO invoices_details VALUES (22, 19, 4, (SELECT sales_price FROM products WHERE product_id=19), 0.10);
INSERT INTO invoices_details VALUES (23, 51, 10, (SELECT sales_price FROM products WHERE product_id=51), 0.47);
INSERT INTO invoices_details VALUES (24, 87, 3, (SELECT sales_price FROM products WHERE product_id=87), 0.21);
INSERT INTO invoices_details VALUES (25, 78, 6, (SELECT sales_price FROM products WHERE product_id=78), 0.39);
INSERT INTO invoices_details VALUES (26, 45, 8, (SELECT sales_price FROM products WHERE product_id=45), 0.28);

INSERT INTO invoices_details VALUES (27, 34, 13, (SELECT sales_price FROM products WHERE product_id=34), 0.20);
INSERT INTO invoices_details VALUES (28, 63, 10, (SELECT sales_price FROM products WHERE product_id=63), 0.42);
INSERT INTO invoices_details VALUES (29, 52, 4, (SELECT sales_price FROM products WHERE product_id=52), 0.07);
INSERT INTO invoices_details VALUES (30, 67, 18, (SELECT sales_price FROM products WHERE product_id=67), 0.30);
INSERT INTO invoices_details VALUES (31, 14, 6, (SELECT sales_price FROM products WHERE product_id=14), 0.24);
INSERT INTO invoices_details VALUES (32, 41, 11, (SELECT sales_price FROM products WHERE product_id=41), 0.08);
INSERT INTO invoices_details VALUES (33, 59, 12, (SELECT sales_price FROM products WHERE product_id=59), 0.11);
INSERT INTO invoices_details VALUES (34, 72, 15, (SELECT sales_price FROM products WHERE product_id=72), 0.44);
INSERT INTO invoices_details VALUES (35, 83, 6, (SELECT sales_price FROM products WHERE product_id=83), 0.19);
INSERT INTO invoices_details VALUES (36, 90, 7, (SELECT sales_price FROM products WHERE product_id=90), 0.26);


select * from invoices_details;





select * from bills_details;

select
sum(quantity) as total_quantities_count
from bills_details;

select * from invoices_details;

select
sum(quantity) as total_quantities_count_sold
from invoices_details;

commit;





select * from invoices_details order by invoice_id;

select
sum(quantity) as total_quantities_sold
from invoices_details;


INSERT INTO invoices_details VALUES (12, 44, 7, 310.00, 9.25);
INSERT INTO invoices_details VALUES (5, 78, 4, 155.00, 12.10);
INSERT INTO invoices_details VALUES (19, 11, 9, 440.00, 7.90);
INSERT INTO invoices_details VALUES (33, 62, 6, 225.00, 14.50);
INSERT INTO invoices_details VALUES (8, 87, 5, 510.00, 3.75);
INSERT INTO invoices_details VALUES (21, 5, 11, 95.00, 18.20);
INSERT INTO invoices_details VALUES (14, 16, 3, 130.00, 2.00);
INSERT INTO invoices_details VALUES (6, 29, 12, 280.00, 19.60);
INSERT INTO invoices_details VALUES (29, 71, 8, 360.00, 6.10);
INSERT INTO invoices_details VALUES (10, 55, 2, 140.00, 0.80);

INSERT INTO invoices_details VALUES (31, 9, 15, 410.00, 5.25);
INSERT INTO invoices_details VALUES (17, 34, 4, 270.00, 11.40);
INSERT INTO invoices_details VALUES (7, 88, 3, 510.00, 7.50);
INSERT INTO invoices_details VALUES (4, 63, 10, 190.00, 1.90);
INSERT INTO invoices_details VALUES (28, 20, 6, 150.00, 10.00);
INSERT INTO invoices_details VALUES (3, 41, 8, 220.00, 6.85);
INSERT INTO invoices_details VALUES (15, 12, 5, 455.00, 4.10);
INSERT INTO invoices_details VALUES (23, 53, 9, 160.00, 20.00);
INSERT INTO invoices_details VALUES (32, 77, 7, 380.00, 8.60);
INSERT INTO invoices_details VALUES (35, 46, 4, 295.00, 12.75);

INSERT INTO invoices_details VALUES (9, 3, 13, 85.00, 3.40);
INSERT INTO invoices_details VALUES (18, 25, 2, 210.00, 15.25);
INSERT INTO invoices_details VALUES (22, 90, 1, 675.00, 21.00);
INSERT INTO invoices_details VALUES (30, 65, 6, 240.00, 11.15);
INSERT INTO invoices_details VALUES (1, 7, 14, 125.00, 9.00);
INSERT INTO invoices_details VALUES (11, 33, 5, 330.00, 3.30);
INSERT INTO invoices_details VALUES (24, 52, 16, 170.00, 6.75);
INSERT INTO invoices_details VALUES (27, 84, 2, 540.00, 17.20);
INSERT INTO invoices_details VALUES (36, 14, 7, 260.00, 13.00);
INSERT INTO invoices_details VALUES (20, 58, 3, 145.00, 4.50);

INSERT INTO invoices_details VALUES (12, 73, 9, 340.00, 12.25);
INSERT INTO invoices_details VALUES (26, 6, 6, 100.00, 7.35);
INSERT INTO invoices_details VALUES (2, 49, 18, 195.00, 9.10);
INSERT INTO invoices_details VALUES (13, 32, 8, 290.00, 2.25);
INSERT INTO invoices_details VALUES (8, 76, 4, 355.00, 14.00);
INSERT INTO invoices_details VALUES (5, 21, 10, 115.00, 5.00);
INSERT INTO invoices_details VALUES (17, 94, 3, 715.00, 19.90);
INSERT INTO invoices_details VALUES (25, 18, 7, 250.00, 6.25);
INSERT INTO invoices_details VALUES (7, 27, 11, 205.00, 10.90);
INSERT INTO invoices_details VALUES (34, 80, 5, 480.00, 8.80);

INSERT INTO invoices_details VALUES (14, 56, 2, 165.00, 1.50);
INSERT INTO invoices_details VALUES (23, 13, 4, 135.00, 12.20);
INSERT INTO invoices_details VALUES (29, 92, 6, 745.00, 16.75);
INSERT INTO invoices_details VALUES (19, 47, 8, 305.00, 7.00);
INSERT INTO invoices_details VALUES (10, 2, 15, 90.00, 3.10);
INSERT INTO invoices_details VALUES (33, 28, 3, 185.00, 20.00);
INSERT INTO invoices_details VALUES (4, 69, 12, 395.00, 13.85);
INSERT INTO invoices_details VALUES (9, 43, 2, 155.00, 0.95);
INSERT INTO invoices_details VALUES (22, 35, 9, 265.00, 8.00);
INSERT INTO invoices_details VALUES (30, 88, 1, 525.00, 11.60);


INSERT INTO invoices_details VALUES (6, 10, 5, 120.00, 9.40);
INSERT INTO invoices_details VALUES (15, 64, 14, 240.00, 4.60);
INSERT INTO invoices_details VALUES (3, 17, 7, 140.00, 3.75);
INSERT INTO invoices_details VALUES (28, 54, 6, 260.00, 18.25);
INSERT INTO invoices_details VALUES (32, 83, 4, 490.00, 7.75);
INSERT INTO invoices_details VALUES (11, 39, 3, 175.00, 2.50);
INSERT INTO invoices_details VALUES (20, 22, 10, 150.00, 16.60);
INSERT INTO invoices_details VALUES (34, 8, 8, 110.00, 5.50);
INSERT INTO invoices_details VALUES (1, 30, 11, 230.00, 14.40);
INSERT INTO invoices_details VALUES (27, 66, 2, 320.00, 1.90);

INSERT INTO invoices_details VALUES (35, 91, 9, 690.00, 15.25);
INSERT INTO invoices_details VALUES (21, 4, 5, 95.00, 6.60);
INSERT INTO invoices_details VALUES (16, 24, 8, 200.00, 10.40);
INSERT INTO invoices_details VALUES (18, 45, 3, 290.00, 12.95);
INSERT INTO invoices_details VALUES (26, 50, 12, 180.00, 8.30);
INSERT INTO invoices_details VALUES (31, 74, 6, 360.00, 21.00);
INSERT INTO invoices_details VALUES (12, 38, 7, 225.00, 4.80);
INSERT INTO invoices_details VALUES (8, 95, 5, 850.00, 23.00);
INSERT INTO invoices_details VALUES (14, 59, 13, 190.00, 7.25);
INSERT INTO invoices_details VALUES (23, 1, 9, 80.00, 2.40);

INSERT INTO invoices_details VALUES (5, 72, 4, 335.00, 11.90);
INSERT INTO invoices_details VALUES (19, 48, 2, 275.00, 5.15);
INSERT INTO invoices_details VALUES (30, 60, 7, 210.00, 17.40);
INSERT INTO invoices_details VALUES (7, 23, 15, 160.00, 13.10);
INSERT INTO invoices_details VALUES (17, 67, 3, 310.00, 9.25);
INSERT INTO invoices_details VALUES (10, 15, 14, 130.00, 6.60);
INSERT INTO invoices_details VALUES (24, 86, 8, 505.00, 12.35);
INSERT INTO invoices_details VALUES (28, 40, 6, 200.00, 18.90);
INSERT INTO invoices_details VALUES (36, 79, 4, 420.00, 4.95);
INSERT INTO invoices_details VALUES (2, 26, 10, 175.00, 7.70);

INSERT INTO invoices_details VALUES (9, 57, 5, 265.00, 10.50);
INSERT INTO invoices_details VALUES (33, 82, 3, 570.00, 19.40);
INSERT INTO invoices_details VALUES (16, 51, 9, 160.00, 8.25);
INSERT INTO invoices_details VALUES (11, 68, 1, 465.00, 14.75);
INSERT INTO invoices_details VALUES (4, 93, 12, 720.00, 22.00);
INSERT INTO invoices_details VALUES (13, 37, 6, 185.00, 5.10);
INSERT INTO invoices_details VALUES (20, 75, 7, 340.00, 1.85);
INSERT INTO invoices_details VALUES (15, 19, 3, 145.00, 3.15);
INSERT INTO invoices_details VALUES (25, 61, 11, 275.00, 14.90);
INSERT INTO invoices_details VALUES (6, 85, 2, 495.00, 11.85);




SELECT 
    constraint_name,
    constraint_type,
    search_condition,
    status
FROM user_constraints 
WHERE table_name = 'INVOICES';

SELECT
constraint_name,
constraint_type,
search_condition
STATUS
FROM user_constraints
WHERE table_name = 'CUSTOMERS';


-- Quick overview of all constraints
SELECT 
    table_name,
    constraint_name,
    constraint_type,
    status
FROM user_constraints
ORDER BY table_name, constraint_type;


SELECT 
    ucc.column_name,
    uc.constraint_name,
    CASE uc.constraint_type
        WHEN 'P' THEN 'PRIMARY KEY'
        WHEN 'U' THEN 'UNIQUE'
        WHEN 'C' THEN 'CHECK'
        WHEN 'R' THEN 'FOREIGN KEY'
    END as constraint_type,
    uc.search_condition as rule,
    uc.status
FROM user_constraints uc
JOIN user_cons_columns ucc ON uc.constraint_name = ucc.constraint_name
WHERE uc.table_name = 'PRODUCTS'
ORDER BY ucc.column_name, uc.constraint_type;






















ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008670 TO PRODUCTS_CATEGORY_ID_FK;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008666 TO PRODUCTS_CREATED_DATE_CHECK;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008665 TO PRODUCTS_CURRENT_STOCK_NOTNULL;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008668 TO PRODUCTS_CURRENT_STOCK_CHECK;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008669 TO PRODUCTS_PRODUCT_ID_PK;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008663 TO PRODUCTS_PRODUCT_NAME_NOTNULL;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008667 TO PRODUCTS_SALES_PRICE_CHECK;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008664 TO PRODUCTS_SALES_PRICE_NOTNULL;

ALTER TABLE PRODUCTS
RENAME CONSTRAINT SYS_C008671 TO PRODUCTS_SUPPLIER_ID_FK;

































SELECT * FROM CAT;






ALTER TABLE CATEGORIES
RENAME CONSTRAINT SYS_C008662 TO CATEGORIES_CATEGORY_ID_PK;
ALTER TABLE CATEGORIES
RENAME CONSTRAINT SYS_C008659 TO CATEGORIES_CATEGORY_NAME_NOTNULL;
ALTER TABLE CATEGORIES
RENAME CONSTRAINT SYS_C008661 TO CATEGORIES_CREATED_DATE_CHECK;
ALTER TABLE CATEGORIES 
RENAME CONSTRAINT SYS_C008660 TO CATEGORIES_UNIT_OF_MEASURE_CHECK;







SELECT * FROM CAT;

ALTER TABLE ROLES
RENAME CONSTRAINT SYS_C008673 TO ROLES_CREATED_DATE_CHECK;

ALTER TABLE ROLES
RENAME CONSTRAINT SYS_C008674 TO ROLES_ROLENAME_CHECK;

ALTER TABLE ROLES
RENAME CONSTRAINT SYS_C008672 TO ROLES_ROLENAME_NOTNULL;

ALTER TABLE ROLES
RENAME CONSTRAINT SYS_C008675 TO ROLES_ROLE_ID_PK;






ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008678 TO USERS_CREATED_DATE_CHECK;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008682 TO USERS_EMAIL_UNIQUE;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008677 TO USERS_PASSWORD_CHECK;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008683 TO USERS_ROLE_ID_FK;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008679 TO USERS_STATUS_CHECK;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008676 TO USERS_USERNAME_NOTNULL;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008681 TO USERS_USERNAME_UNIQUE;

ALTER TABLE USERS
RENAME CONSTRAINT SYS_C008680 TO USERS_USER_ID_PK;



ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008718 TO BILLS_D_BILL_ID_FK;

ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008717 TO BILLS_D_DISCOUNT_CHECK;

ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008719 TO BILLS_D_PRODUCT_ID_FK;

ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008713 TO BILLS_D_QUANTITY_NOTNULL;

ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008715 TO BILLS_D_QUANTITY_CHECK;

ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008714 TO BILLS_D_UNIT_PRICE_NOTNULL;

ALTER TABLE BILLS_DETAILS
RENAME CONSTRAINT SYS_C008716 TO BILLS_D_UNIT_PRICE_CHECK;





ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008710 TO INV_D_DISCOUNT_CHECK;

ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008711 TO INV_D_INVOICE_ID_FK;

ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008712 TO INV_D_PRODUCT_ID_FK;

ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008708 TO INV_D_QUANTITY_CHECK;

ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008706 TO INV_D_QUANTITY_NOT_NULL;

ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008707 TO INV_D_UNIT_PRICE_NOT_NULL;

ALTER TABLE INVOICES_DETAILS
RENAME CONSTRAINT SYS_C008709 TO INV_D_UNIT_PRICE_CHECK;

-- CUSTOMER DONE
-- SUPPLIER DONE
-- INVOICES DONE
-- BILLS DONE
-- INVOICES_DETAILS
-- BILLS_DETAILS


ALTER TABLE BILLS
RENAME CONSTRAINT SYS_C008684 TO BILLS_BILL_DATE_CHECK;

ALTER TABLE BILLS
RENAME CONSTRAINT SYS_C008688 TO BILLS_BILL_ID_PK;

ALTER TABLE BILLS
RENAME CONSTRAINT SYS_C008687 TO BILLS_STATUS_CHECK;

ALTER TABLE BILLS
RENAME CONSTRAINT SYS_C008689 TO BILLS_SUPPLIER_ID_FK;

ALTER TABLE BILLS
RENAME CONSTRAINT SYS_C008690 TO BILLS_USER_ID_FK;








ALTER TABLE SUPPLIERS
RENAME CONSTRAINT SYS_C008655 TO SUPP_CREATED_DATE_CHECK;


ALTER TABLE SUPPLIERS
RENAME CONSTRAINT SUPPLIER_EMAIL_UNIQUE TO SUPP_SUPPLIER_EMAIL_UNIQUE;

ALTER TABLE SUPPLIERS
RENAME CONSTRAINT SUPPLIER_ID_PK TO SUPP_SUPPLIER_ID_PK;

ALTER TABLE SUPPLIERS
RENAME CONSTRAINT SUPPLIER_NAME_CHECK TO SUPP_SUPPLIER_NAME_CHECK;

ALTER TABLE SUPPLIERS
RENAME CONSTRAINT SUPPLIER_PHONE_CHECK TO SUPP_SUPPLIER_PHONE_CHECK;

ALTER TABLE SUPPLIERS
RENAME CONSTRAINT SUPPLIER_PHONE_UNIQUE TO SUPP_SUPPLIER_PHONE_UNIQUE;












ALTER TABLE INVOICES
RENAME CONSTRAINT SYS_C008704 TO CUSTOMER_ID_FOREIGN_KEY;


ALTER TABLE INVOICES
RENAME CONSTRAINT SYS_C008700 TO CREATED_DATE_CHECK;

ALTER TABLE INVOICES
RENAME CONSTRAINT SYS_C008698 TO INVOICE_DATE_CHECK;

ALTER TABLE INVOICES
RENAME CONSTRAINT SYS_C008703 TO INVOICE_ID_PK;

ALTER TABLE INVOICES
RENAME CONSTRAINT SYS_C008702 TO STATUS_CHECK;

ALTER TABLE INVOICES
RENAME CONSTRAINT SYS_C008705 TO USER_ID_FK;

ALTER TABLE INVOICES
RENAME CONSTRAINT CUSTOMER_ID_FOREIGN_KEY TO CUSTOMER_ID_FK;


ALTER TABLE INVOICES
RENAME CONSTRAINT CUSTOMERS_CUSTOMER_ID_FK TO INVOICES_CUSTOMER_ID_FK;










ALTER TABLE CUSTOMERS
RENAME CONSTRAINT SYS_C008650 TO CUSTOMER_NAME_CHECK;




ALTER TABLE CUSTOMERS
RENAME CONSTRAINT SYS_C008652 TO CUSTOMER_PHONE_UNIQUE;


ALTER TABLE table_name 
RENAME CONSTRAINT SYS_C008651 TO your_preferred_name;


ALTER TABLE CUSTOMERS
RENAME CONSTRAINT SYS_C008651 TO CUSTOMER_ID_PK;





ALTER TABLE INVOICES
RENAME CONSTRAINT CREATED_DATE_CHECK TO INVOICES_CREATED_DATE_CHECK;

ALTER TABLE INVOICES
RENAME CONSTRAINT CUSTOMER_ID_FK TO CUSTOMERS_CUSTOMER_ID_FK;

ALTER TABLE INVOICES
RENAME CONSTRAINT INVOICE_DATE_CHECK TO INVOICES_INVOICE_DATE_CHECK;


ALTER TABLE INVOICES
RENAME CONSTRAINT INVOICE_ID_PK TO INVOICES_INVOICE_ID_PK;


ALTER TABLE INVOICES
RENAME CONSTRAINT STATUS_CHECK TO INVOICES_STATUS_CHECK;

ALTER TABLE INVOICES
RENAME CONSTRAINT USER_ID_FK TO INVOICES_USER_ID_FK;


ALTER TABLE CUSTOMERS
RENAME CONSTRAINT CUSTOMER_ID_PK TO CUSTOMERS_CUSTOMER_ID_PK;

ALTER TABLE CUSTOMERS
RENAME CONSTRAINT CUSTOMER_NAME_CHECK TO CUSTOMERS_CUSTOMER_NAME_CHECK;


ALTER TABLE CUSTOMERS
RENAME CONSTRAINT CUSTOMER_PHONE_UNIQUE TO CUSTOMERS_CUSTOMER_PHONE_UNIQUE;