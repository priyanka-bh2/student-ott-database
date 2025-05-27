# 🎬📺 Student OTT Database System
**A comprehensive database system designed to manage and analyze student subscriptions to various Over-The-Top (OTT) platforms.**

This project presents a fully normalized relational database design for an OTT (Over-the-Top) media streaming platform tailored to university students. It includes SQL scripts for schema creation, inserts, complex queries, updates, and entity-relation modeling. It aims to provide insights into students' OTT platform usage, facilitating better understanding and management of subscription patterns.

---

# 🚀 Features

**🗂️ Manage Students & Devices**: Track users, their ratings, reviews, and allowed devices

**📅 Subscription Lifecycle**: Full subscription details with payment history and benefits

**🎥 Media Library**: Manage OTT content metadata, distributor contracts, and views

**📊 Analytics**: Insightful SQL queries (CUBE, ROLLUP, aggregates, filters)

**🔐 Role Management**: Admins manage media; Distributors manage series content

---

# 🧰 Tech Stack
**📦 Database:** Oracle SQL  

**📐 Modeling:** EER Diagram    

**🧾 Documents:** ERD, Mapping PDFs 

**💻 Scripting:**   SQL (DDL, DML, DQL) 

**📊 Reports & Queries:**   GROUP BY, CUBE, ROLLUP

---

# 🛠️ File Structure
  student-ott-database/
  
├── projectDBcreate.sql 

├── projectDBinsert.sql 

├── projectDBupdate.sql 

├── projectDBqueries.sql 

├── projectDBdrop.sql 

├── Final Relational Mapping.pdf

├── Final Revised EER.pdf 

└── README.md 

---

# ⚙️ How to Run

1. **🔃 Create schema**
   ```sql
   @projectDBcreate.sql
2. **🗃️ Insert data**
   ```sql
   @projectDBinsert.sql
3. **🛠️ Run updates or deletes**
    ```sql
    @projectDBupdate.sql
4. **📊 Run analytical queries**
   ```sql
   @projectDBqueries.sql
5. **🗑️ Drop all tables (cleanup)**
   ```sql
   @projectDBdrop.sql

---

# 🧠 Business Insights
- Identify top-performing genres and students

- Optimize subscription pricing

- Analyze device usage patterns

- Track distributor contracts and salary impact

- Enable targeted marketing using domain-based student emails

---

# 🔮 Future Enhancements

**🔐 Authentication** – Add user login and role-based access

**📲 Mobile Support** – Fully responsive design

**📬 Notifications** – Email reminders for subscription renewals

**🤖 Prediction Models** – Forecast OTT usage trends by category

**🧩 Admin Dashboard** – Graphical insights for university use

---
# 📌 Use Cases

**🎓 College Admins** – Track student content usage for institutional accounts

**📚 Research** – Study the impact of OTT on student behavior

**🧾 Subscription Services** – Tailor plans based on student trends

**🧑‍🏫 Academic Projects** – Demonstrate CRUD, backend integration, DB reporting
