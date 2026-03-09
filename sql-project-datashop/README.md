# SQL Project - Datashop

## 

## Executive Summary

This project simulated a real-world e-commerce analytics environment where SQL is used not only for querying data, but for generating strategic business insights.



Using a structured relational database built in MySQL, I performed progressive analysis (basic → advanced) to evaluate revenue structure, customer behavior, growth sustainability, and risk exposure.



###### Key Business Findings

* Revenue is highly concentrated in premium products (Electronics represent > 85% of total revenue);
* A small percentage of customers generate the majority of revenue (strong Pareto effect);
* The business model demonstrates strong short-term profitability but structural long-term risk due to revenue concentration and customer dependency.



###### Strategic Interpretation

While the simulated company shows strong margins, it is exposed to:

* Customer churn risk;
* Category concentration risk;
* Revenue predictability challenges.

Long-term sustainability would require diversification strategies, customer retention programs, and mid-frequency buyer expansion.



###### Technical Scope

This project demonstrates:

* Relational database modeling (MySQL);
* Data scaling using recursive CTEs;
* Window functions (RANK, NTILE, LAG, SUM OVER)
* Revenue growth analysis;
* Pareto modeling;
* Churn risk detection
* Business-driven SQL storytelling



###### Project Structure

01\_create\_tables.sql  

02\_insert\_seed\_data.sql  

03\_basic\_queries.sql  

04\_intermediate\_queries.sql  

05\_advanced\_queries.sql  

06\_generate\_scaled\_data.sql  

07\_advanced\_business\_scenarios.sql   

## 

## Detailed Business Analysis

### 

### Business Context

DataShop is a fictional e-commerce company that operates in online product sales.

The business team requested a series of analyses performed exclusively using SQL to support strategic decisions related to sales, customers, and products.

This project simulates how SQL can be used not only for querying data, but for transforming transactional records into business intelligence insights.

## 

### Business Problem

The team needs to:

* Understand the company’s commercial performance over time;
* Identify the most profitable products and categories;
* Analyze customer purchasing behavior in order to optimize sales and marketing strategies;
* Evaluate revenue concentration and growth sustainability;
* Detect structural risks such as volatility and customer dependency.

## 

### Project Objectives

The objective of this project is to:

* Build a relational database using MySQL;
* Populate it with transactional data;
* Perform progressive analytical queries (basic → advanced);
* Generate strategic business insights using SQL only.



**Key Business Questions**

* What is the total revenue by month and by year?
* Which products are the best-selling and most profitable?
* Which customers have the highest purchase volume?
* Is there growth or decline in sales over time?

## 

### Database Structure

The data was loaded into a MySQL database, where the tables were modeled using primary and foreign keys to ensure relational integrity.

All analyses were performed exclusively using SQL.



The SQL queries were organized by complexity level to simulate real-world analytical requests from a business team.



###### Project Structure



├── 01\_create\_tables.sql

     Script responsible for creating the database and tables, including primary and foreign keys.

 

├── 02\_insert\_seed\_data.sql

     Inserts fictional data to simulate real e-commerce operations.



├── 03\_basic\_queries.sql

     Basic queries for initial data exploration.



├── 04\_intermediate\_queries.sql

     Queries using JOIN's, subqueries and aggregated filters.



├── 05\_advanced\_queries.sql

     Advanced analyses using CTE's and window fuctions.



├── 06\_generate\_scaled\_data.sql

     Database scaling and synthetic data generation to simulate a realistic e-commerce environment.



├── 07\_advanced\_business\_scenarios.sql

     Advanced business analysis using window functions and strategic modeling techniques.

## 

### SQL Analysis

#### 

1. #### Basic Exploration



###### Initial Data Validation and Exploration

* 5 customers
* 6 products
* 5 orders
* 7 order items

The number of order items exceeding the number of orders confirms the correct implementation of many-to-many relationship.

###### 

###### Geographic Distribution

Customers are distributed across multiple Brazilian states (SP, RJ, MG, PR, RS), simulating geographic diversity.



###### Product Portfolio

Products are divides into the three categories:

* Electronics
* Accessories
* Furniture

The product catalog is primarily composed of Electronics, followed by Accessories and Furniture.



###### Order Distribution Over Time

Orders are distributed between March and June 2023, allowing for initial time-based analysis and future growth comparisons.



###### Strategic Interpretation

Even in a small dataset, early patterns suggest revenue concentration in premium categories. 

This structure resembles real-world e-commerce models driven by high-margin products.

## 

#### 2\. Intermediate Business Analysis



##### Revenue and Performance Analysis



###### Revenue Concentration

Electronics generate the highest revenue, significantly outperforming other categories.



###### Product Performance

A small number of products generate a significant share of total revenue.

This suggests a revenue concentration pattern, common in e-commerce environments where premium products contribute disproportionately to overall sales.



###### Customer Revenue Behavior

A limit number of customers account for a large share of total revenue.

The top customer generated over 50% of total revenue in the initial dataset.

**Strategic Interpretation**

This indicates:

* High dependency on premium buyers;
* Elevated exposure to customer churn risk

###### 

###### Monthly Revenue Trends

Revenue is concentrated between March and June 2023, with revenue peaked in March 2023, followed by significant monthly fluctuation.

**Strategic Interpretation**

* Revenue volatility suggests a transactional model riven by sporadic high-ticket purchases rather than consistent recurring sales;
* This limits shot-term revenue predictability and introduces cash flow instability.

## 

#### 3\. Advanced SQL \& Business Intelligence

This section applies advanced SQL techniques (window functions, growth rate calculations and percentage contribution) to transform transaction data into business intelligence insights



###### Product Portfolio Performance

The top two products account for over 75% of total revenue.

**Executive Insights**

* This improves short-term revenue performance but it reduces diversification and increases exposure to demand volatility;
* The company becomes structurally dependent on a small number of SKU's, increasing vulnerability to demand shifts or supply disruptions.

###### 

###### Revenue Structure and Category

Electronics represent over 85% of total revenue.

**Strategic Implications**

* Category concentration increases systemic risk;
* Diversification into mid-ticket or recurring product lines could stabilize long-term revenue.

###### 

###### Revenue Trend and Growth Analysis

Monthly growth rates reveal sharp fluctuations:

* Strong peak month;
* Severe contraction;
* High volatility.

**Executive Interpretation**

* The revenue pattern indicates a non-recurring demand structure;
* This reduces forecasting accuracy and may challenge financial planning and inventory management.



###### Customer Revenue Dependency

Top customers represent the majority of revenue contribution.

**Strategic Implication**



* High customer concentration creates churn exposure;
* Retention programs, loyalty incentives, and base expansion strategies should be prioritized.

## 

#### 4\. Scalability \& Data Simulation

To simulate a realistic business environment, the dataset was programmatically expanded using recursive CTEs.



The database was scaled to include:

* 250 customers;
* 40 products;
* 1,000+ orders;
* 2 years of transactional data (2023-2024)



This enabled:

* Frequency-based segmentation;
* pareto analysis;
* Churn risk detection;
* Year-over-year comparison.



#### 5\. Business Intelligence Analysis

###### 

###### Data-Driven Customer Segmentation

Customers were segmented dynamically using NTILE(3), based on purchase frequency:

* High Frequency;
* Mid Frequency;
* Low Frequency.



**Strategic Insights**

* Revenue concentration remained strongly skewed toward high-frequency customers.
* This validated a Pareto-like revenue model common in premium e-commerce business.



###### Pareto Analysis (Revenue Concentration)

A cumulative revenue analysis confirmed that a minority of customers generate the majority of revenue.



**Executive Implication**

This structure:

* Maximizes short-term profitability;
* Increases long-term structural risk

Revenue diversification should be considered a strategic priority.



###### Churn Risk Identification

Customers inactive for more than 120 days were flagged as potential churn risks.



**Strategic Implication**

Proactive CRM strategies and reactivation campaigns could mitigate revenue volatility and improve retention metrics.

