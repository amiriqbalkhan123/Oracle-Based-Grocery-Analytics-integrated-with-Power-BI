📊 Oracle + Power BI Analytics Project



🔎 Project Description
This project is a business management and analytics solution built on Oracle Database for data storage and Power BI for visualization. It is designed to handle core business processes such as customer management, supplier management, product inventory, invoicing, billing, and audit tracking.
The system provides:
- Data integrity through a normalized relational schema.
- Role-based access control for secure user management.
- Audit logging to track changes in product quantities and prices.
- Interactive dashboards in Power BI for actionable insights.




🏗️ System Architecture
- Database Layer (Oracle)
- Stores structured business data across multiple entities.
- Ensures referential integrity with foreign keys (e.g., invoices linked to customers, bills linked to suppliers).
- Provides audit trails for sensitive operations.
- Analytics Layer (Power BI)
- Connects directly to Oracle Database.
- Transforms raw transactional data into meaningful KPIs.
- Offers dashboards for sales, supplier performance, inventory, and audit logs.
- User Layer
- Users interact with Power BI dashboards.
- Administrators manage roles and permissions via the roles and users tables.


🗂️ Database Schema Overview
The schema covers the following domains:
- Audit Logs: Tracks product changes (audit_logs).
- Customers & Suppliers: Manages business relationships (customers, suppliers).
- Users & Roles: Implements authentication and authorization (users, roles).
- Invoices & Bills: Handles financial transactions (invoices, invoices_details, bills, bills_details).
- Products & Categories: Organizes inventory (products, categories).


Entity Relationships
- Customers → Invoices → Invoice Details → Products
- Suppliers → Bills → Bill Details → Products
- Users → Invoices/Bills (created by users)
- Roles → Users (permissions management)
- Audit Logs → Products (tracks changes)


🪟 Views
To simplify reporting and analytics, multiple database views were created. These views aggregate and join data across tables, making it easier for Power BI to consume structured datasets without complex queries.


- Customer Reports Views
- vw_customer_invoices: Combines customer details with invoices and invoice line items.
- vw_customer_activity: Tracks customer purchase frequency and total spend.


- Supplier Reports Views
- vw_supplier_bills: Joins suppliers with bills and bill details for procurement analysis.
- vw_supplier_performance: Summarizes supplier contributions, discounts, and delivery timelines.

- User Performance Views
- vw_user_sales: Tracks invoices created per user, revenue contribution, and discounts applied.
- vw_user_audit: Links users to audit logs for monitoring system activity.


- Main Dashboard Views
- vw_sales_summary: Provides KPIs for revenue, discounts, and product categories.
- vw_inventory_status: Shows product stock levels, active/inactive status, and supplier linkage.


🔄 Triggers
Triggers were implemented to enforce business rules and maintain data integrity:
- Audit Logging Triggers
- Automatically insert records into audit_logs when product quantity or price changes.
- Stock Management Triggers
- Update products.CURRENT_STOCK when new invoices or bills are inserted.
- Prevent negative stock levels by validating before insert/update.
- User Management Triggers
- Log user creation and status changes into audit tables.
- Enforce password update rules (e.g., minimum length, hash storage).



⚡ Indexes
Indexes were added to optimize query performance, especially for Power BI dashboards that run complex aggregations:


- Primary Indexes
- customers(CUSTOMER_ID)
- suppliers(SUPPLIER_ID)
- products(PRODUCT_ID)
- users(USER_ID)
- roles(ROLE_ID)


- Foreign Key Indexes
- invoices(CUSTOMER_ID, USER_ID)
- invoices_details(INVOICE_ID, PRODUCT_ID)
- bills(SUPPLIER_ID, USER_ID)
- bills_details(BILL_ID, PRODUCT_ID)


- Performance Indexes
- On audit_logs(LOG_TIME) for faster chronological queries.
- On products(CATEGORY_ID, SUPPLIER_ID) for inventory and supplier analysis.
- On invoices(INVOICE_DATE) and bills(BILL_DATE) for time-based reporting.

📊 Power BI Analytics
The Power BI layer of this project contains 100+ interactive views and dashboards, designed to provide deep insights into every aspect of the business. These reports are organized into thematic areas for clarity and usability:


🔹 Customer Reports
- Customer purchase history and lifetime value.
- Segmentation by demographics, location, and behavior.
- Trends in customer acquisition and retention.
- Top customers by revenue and frequency of transactions.


🔹 Supplier Reports
- Supplier performance metrics (on-time delivery, pricing consistency).
- Comparative analysis of supplier contributions to inventory.
- Bill tracking and payment status.
- Supplier relationship insights for procurement optimization.


🔹 User Performance Reports
- Activity tracking for system users (sales reps, admins).
- Productivity metrics: invoices processed, bills recorded, audit actions.
- Role-based performance comparisons.
- User contribution to overall business KPIs.


🔹 Main Dashboard
- Executive-level overview combining sales, suppliers, inventory, and audit logs.
- Key performance indicators (KPIs) such as revenue, expenses, discounts, and stock levels.
- Drill-down capabilities to move from summary metrics into detailed reports.
- Real-time refresh from Oracle Database for up-to-date analytics.



🖥️ Features of Power BI Integration
- Scalability: Over 100 views covering granular and high-level analytics.
- Interactivity: Filters, slicers, and drill-through options for dynamic exploration.
- Visualization Variety: Charts, tables, maps, and KPI cards tailored to each domain.
- Data Governance: Secure connection to Oracle Database with role-based access.
- Decision Support: Dashboards designed for managers, auditors, and analysts.
