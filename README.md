Markdown
# 🎞️ Sakila DVD Rental: Relational Database Project

A professional SQL study project using the **Sakila Sample Database** to analyze a movie rental business. This project demonstrates mastery of the PostgreSQL environment, from initial schema creation to complex business intelligence reporting.

---

## 🏗️ Project Architecture
The Sakila database is the industry standard for learning relational models. It mimics a vintage DVD rental store (like Blockbuster) and features:
* **15 core tables** in a highly normalized structure.
* **Complex Relationships:** Many-to-Many (Actors/Films) and One-to-Many (Customers/Payments).
* **Advanced Types:** PostgreSQL `ENUM` types for movie ratings and `TIMESTAMPS` for rental tracking.

---

## 🚀 Getting Started

### 1. Prerequisites
* **Environment:** macOS (M1/M2/Intel)
* **Engine:** PostgreSQL 14+
* **Interface:** VSCode + SQLTools Extension

### 2. Installation & Data Loading
To build the infrastructure and populate the data, execute the scripts in the following order:

**A. Create the Database**
```sql
CREATE DATABASE sakila;
B. Run the Schema (The Structure)
Execute postgres-sakila-schema.sql.

Note: Ensure all OWNER TO commands are updated to your local user (e.g., OWNER TO ricardo).

C. Insert Data (The Content)
Import the data via the terminal to handle the large file size:

Bash
psql -h localhost -U ricardo -d sakila -f postgres-sakila-insert-data.sql
📊 Business Insights & Sample Queries
🏆 Top 5 "Most Popular" Actors
Objective: Identify which actors appear in the most films in the inventory.

SQL
SELECT 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) as total_movies
FROM actor a
JOIN film_actor fa USING (actor_id)
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY total_movies DESC
LIMIT 5;
💰 Revenue Generation by Genre
Objective: Analyze which categories drive the highest rental income.

SQL
SELECT 
    c.name AS genre, 
    SUM(p.amount) AS total_revenue
FROM category c
JOIN film_category fc USING (category_id)
JOIN inventory i USING (film_id)
JOIN rental r USING (inventory_id)
JOIN payment p USING (rental_id)
GROUP BY c.name
ORDER BY total_revenue DESC;
🕒 Inventory Management (Current Rentals)
Objective: Find customers who have not yet returned their movies.

SQL
SELECT 
    c.first_name, 
    c.last_name, 
    f.title, 
    r.rental_date
FROM customer c
JOIN rental r USING (customer_id)
JOIN inventory i USING (inventory_id)
JOIN film f USING (film_id)
WHERE r.return_date IS NULL
ORDER BY r.rental_date DESC;
🛠️ Technical Challenges Overcome
Role Management: Resolved role "postgres" does not exist errors by mapping permissions to the local system user (ricardo).

Data Integrity: Implemented FOREIGN KEY constraints to ensure relational consistency.

ETL Optimization: Managed large-scale data imports using the psql command-line interface instead of the GUI to prevent memory crashes.

Project maintained by Ricardo — SQL Data Engineering Portfolio.

IMPORTANT - to rebuild the DB

go to sakila-project folder and run the file schema.sql

URl From the database: https://github.com/jOOQ/sakila/tree/main/postgres-sakila-db
Steps:

* download file: postgres-sakila-insert-data.sql

On terminal, from the Download folder run: psql -h localhost -U ricardo -d sakila -f postgres-sakila-insert-data.sql

-- Comando de restauração do banco caso estiver tudo deletado:
-- on terminal: psql -h localhost -U ricardo -d sakila -f backup/sakila_backup_20260312.sql
