# 🚗 Vehicle Rental System – Database

This project is designed to demonstrate the database implementation of a **vehicle rental system**.  
It uses advanced **PostgreSQL** features such as **INNER JOIN**, **NOT EXISTS**, **GROUP BY**, and **HAVING** to perform data analysis, generate reports, and extract business insights.  
This repository can be used as a practical example for learning database logic and real-world database operations.

---

## 🖼 Entity Relationship Diagram (ERD)

The database consists of three main tables:

- **Users**
- **Vehicles**
- **Bookings**

The ERD illustrates how logical relationships and foreign key constraints are applied between these tables.

🔗 **ERD Diagram:**  
https://drawsql.app/teams/not-null-1/diagrams/next-level-b6-a3  

---

## 📖 Theory Questions (Viva Practice)

1. **What is a foreign key and why is it important in relational databases?**  
2. **What is the difference between WHERE and HAVING clauses in SQL?**  
3. **What is a primary key and what are its characteristics?**  
4. **What is the difference between INNER JOIN and LEFT JOIN in SQL?**

📂 **Google Drive (Viva & Resources):**  
https://drive.google.com/drive/folders/1R5F1kX7Xw59rIpJMfutrtNiAVjo9dMsq?usp=drive_link

---

## 🔍 Key Features & Queries

### Booking Report (JOIN & USING)
- Generates a detailed booking report by joining **Bookings**, **Users**, and **Vehicles** tables.
- Uses the `USING` keyword to keep queries clean and readable.

### Market Inventory Analysis (NOT EXISTS)
- Identifies vehicles that have **not received any bookings** using `NOT EXISTS`.
- Helps the business decide which vehicles need more marketing or promotion.

### Inventory Filtering (WHERE)
- Uses `WHERE` and `AND` clauses to filter:
  - Vehicle type (e.g., `Car`)
  - Vehicle status (e.g., `Available`)
- Makes it easy for users or admins to find relevant vehicles.

### Popularity Tracking (GROUP BY & HAVING)
- Uses `GROUP BY` and `COUNT` to calculate total bookings per vehicle.
- Applies `HAVING` to show only vehicles with **more than 2 bookings**.
- Helps identify the most popular vehicles from a business perspective.

---

## 🛠 Tech Stack

- **Database:** PostgreSQL  
- **Tools:** Beekeeper Studio  
