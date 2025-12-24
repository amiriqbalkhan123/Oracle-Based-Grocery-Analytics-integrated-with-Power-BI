select * from cat;
describe suppliers;
describe customers;
describe invoices;
describe invoices_details;
describe bills;
describe bills_details;
describe roles;
describe users;
describe categories;
describe products;
select * from cat;


-- Indexes for Audit Logs Table
CREATE INDEX idx_audit_logs_ref_type ON audit_logs(ref_type);
CREATE INDEX idx_audit_logs_ref_id ON audit_logs(ref_id);
CREATE INDEX idx_audit_logs_product_id ON audit_logs(product_id);
CREATE INDEX idx_audit_logs_log_time ON audit_logs(log_time);


-- Indexes for Customers Table
CREATE UNIQUE INDEX idx_customers_phone ON customers(customer_phone); 
CREATE UNIQUE INDEX idx_customers_email ON customers(customer_email);

-- Indexes for Suppliers Table
CREATE UNIQUE INDEX idx_suppliers_phone ON suppliers(supplier_phone);
CREATE UNIQUE INDEX idx_suppliers_email ON suppliers(supplier_email);


-- Indexes for Roles Table
CREATE UNIQUE INDEX idx_roles_rolename ON roles(rolename);


-- Indexes for Users Table
CREATE UNIQUE INDEX idx_users_username ON users(username);
CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role_id ON users(role_id);


-- Indexes for Invoices Table
CREATE INDEX idx_invoices_customer_id ON invoices(customer_id);
CREATE INDEX idx_invoices_user_id ON invoices(user_id);
CREATE INDEX idx_invoices_status ON invoices(status);
CREATE INDEX idx_invoices_invoice_date ON invoices(invoice_date);

-- Indexes for Invoices_Details Table
CREATE INDEX idx_inv_det_invoice_id ON invoices_details(invoice_id);
CREATE INDEX idx_inv_det_product_id ON invoices_details(product_id);


-- Indexes for Bills Table
CREATE INDEX idx_bills_supplier_id ON bills(supplier_id);
CREATE INDEX idx_bills_user_id ON bills(user_id);
CREATE INDEX idx_bills_status ON bills(status);
CREATE INDEX idx_bills_bill_date ON bills(bill_date);

-- Indexes for Bills_Details Table
CREATE INDEX idx_bill_det_bill_id ON bills_details(bill_id);
CREATE INDEX idx_bill_det_product_id ON bills_details(product_id);

-- Indexes for Products Table
CREATE INDEX idx_products_category_id ON products(category_id);
CREATE INDEX idx_products_supplier_id ON products(supplier_id);
CREATE UNIQUE INDEX idx_products_name ON products(product_name);






SELECT index_name, column_name
FROM user_ind_columns
WHERE table_name = UPPER('Customers')
ORDER BY index_name, column_position;




SELECT index_name, table_name, uniqueness
FROM user_indexes
ORDER BY table_name;

SELECT index_name, table_name, column_name, column_position
FROM user_ind_columns
ORDER BY table_name, index_name, column_position;
