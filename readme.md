\# E-Commerce Marketplace Analytics



\## Overview



An end-to-end data analytics project using the Olist Brazilian E-Commerce dataset to analyze marketplace sales, customer behavior, geographic demand, delivery performance, and customer satisfaction.



The project follows a practical data analyst workflow:



\*\*Data Preparation → Exploratory Analysis → SQL Analysis → Power BI Dashboard → Business Insights\*\*



\---



\## Business Objective



The objective of this project was to understand how an e-commerce marketplace was performing across sales, customers, and order fulfillment, and to identify patterns that could support business decision-making.



The analysis focuses on three areas:



\- Sales performance and order trends

\- Customer behavior and geographic demand

\- Delivery performance and customer satisfaction



\---



\## Business Questions



\### Sales Performance

\- How many orders were placed?

\- How much product revenue was generated?

\- How does revenue change over time?

\- What is the average order value?

\- Which customer states generate the most revenue?



\### Customer Analysis

\- How many unique customers are present?

\- What proportion of customers are repeat customers?

\- Which customers have placed multiple orders?

\- How does customer activity vary geographically?



\### Delivery \& Customer Experience

\- What is the average delivery time?

\- What percentage of delivered orders arrived late?

\- How do late and on-time deliveries differ in customer review scores?

\- Is delivery time associated with review scores?



\---



\## Dataset



The project uses the \*\*Olist Brazilian E-Commerce Public Dataset\*\*, a large public e-commerce dataset containing approximately 100,000 orders and multiple related tables.



The analysis uses:



\- Orders

\- Customers

\- Order Items

\- Order Reviews



Additional Olist tables were available in the original dataset but were not required for the final scope of this analysis.



Dataset source:



https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce



\---



\## Tools \& Technologies



| Tool | Purpose |

|---|---|

| Python | Data preparation and exploratory analysis |

| Pandas | Data manipulation and aggregation |

| SQL | Business-focused data analysis |

| SQLite | Local analytical database |

| Power BI | Interactive dashboard and visualization |

| DAX | Measures and calculated metrics |

| Git/GitHub | Project version control and documentation |



\---



\## Project Workflow



\### 1. Data Preparation — Python



The raw Olist datasets were loaded into Pandas and inspected for:



\- Dataset structure

\- Missing values

\- Duplicate records

\- Date fields

\- Order statuses

\- Relationships between tables



Order-level information was then combined with customer, payment, delivery, and review information where required for analysis.



\---



\### 2. Exploratory Analysis — Python



Python was used to perform initial exploratory analysis and construct analytical datasets.



Key areas explored included:



\- Order-level revenue

\- Customer geography

\- Payment behavior

\- Repeat customers

\- Delivery time

\- Late deliveries

\- Review scores



The cleaned and aggregated data was then used to guide the SQL and Power BI analysis.



\---



\### 3. SQL Analysis



The Olist data was imported into SQLite and analyzed using business-focused SQL queries.



The SQL analysis was organized into four areas:



\#### Order Analysis

\- Order status distribution

\- Total orders

\- Orders by customer state

\- Delivered orders by state



\#### Sales Analysis

\- Total product revenue

\- Monthly revenue

\- Monthly order volume

\- Average order value

\- Revenue by customer state



\#### Customer Analysis

\- Repeat customers

\- One-time vs repeat customer classification



\#### Delivery \& Customer Experience

\- Average delivery time

\- Late delivery rate

\- Late vs on-time review scores

\- Delivery performance distribution



\---



\## Power BI Dashboard



An interactive Power BI dashboard was developed to bring the analysis together.

### Dashboard Report

[View the Power BI Dashboard Report (PDF)](reports/Olist_Ecommerce_Analysis.pdf)

### Dashboard Features

- Sales and order KPIs
- Monthly revenue and order trends
- Geographic revenue analysis
- Delivery performance monitoring
- Customer review analysis
- Interactive state, order-status, and date filters



\### Key KPIs



\- Total Orders

\- Total Revenue

\- Average Order Value

\- Total Customers

\- Average Review Score

\- Average Delivery Days

\- Late Orders

\- Late Delivery Rate



\### Dashboard Analysis



The dashboard includes:



\- Monthly revenue trends

\- Monthly order trends

\- Revenue by customer state

\- Orders by customer state

\- On-time vs late delivery distribution

\- Review score comparison by delivery status

\- Delivery time by review score



\### Interactive Filters



Users can filter the dashboard by:



\- Customer state

\- Order status

\- Purchase date



\---



\## Key Insights



\### Sales Performance



\- The marketplace recorded 99,441 orders and approximately 13.59 million BRL in product revenue, with an average order value of 136.68 BRL.

\- Monthly revenue peaked in May at approximately 1.50 million BRL.

\- September recorded the lowest monthly revenue at approximately 624.8K BRL.

\- Revenue was geographically concentrated, with São Paulo generating approximately 5.20 million BRL, followed by Rio de Janeiro at 1.82 million BRL and Minas Gerais at 1.59 million BRL.



\### Customer Behavior



\- The dataset contains 96,096 unique customers.

\- 93,099 customers were one-time purchasers, while 2,997 customers placed multiple orders.

\- Repeat customers represented approximately 3.12% of the customer base, indicating that most customers in the dataset made a single purchase.



\### Delivery \& Customer Experience



\- Average delivery time was 12.5 days.

\- Approximately 8.1% of delivered orders were classified as late.

\- On-time deliveries had an average review score of 4.29, compared with 2.57 for late deliveries.

\- The 1.72-point difference in average review scores shows a strong association between delivery performance and customer satisfaction, although the analysis does not establish a causal relationship.

\---



\## Project Structure



```text

Olist\\\_Project/

│

├── data/

│   └── raw/

│

├── sql/

│   ├── 01\\\_order\\\_analysis.sql

│   ├── 02\\\_sales\\\_analysis.sql

│   ├── 03\\\_customer\\\_analysis.sql

│   └── 04\\\_delivery\\\_analysis.sql

│

├── notebooks/

│   └── olist\\\_analysis.ipynb

│

├── powerbi/

│   └── Olist\\\_Ecommerce\\\_Analytics.pbix

│

├── .gitignore

└── README.md


