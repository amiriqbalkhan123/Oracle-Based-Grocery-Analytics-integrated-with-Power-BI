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
