Executive Summary
This project simulated a real-world e-commerce analytics environment where SQL is used not only for querying data, but for generating strategic business insights.

Using a structured relational database built in MySQL, I performed progressive analysis (basic → advanced) to evaluate revenue structure, customer behavior, growth sustainability, and risk exposure.

Key Business Findings
Revenue is highly concentrated in premium products (Electronics represent > 85% of total revenue);
A small percentage of customers generate the majority of revenue (strong Pareto effect);
The business model demonstrates strong short-term profitability but structural long-term risk due to revenue concentration and customer dependency.
Strategic Interpretation
While the simulated company shows strong margins, it is exposed to:

Customer churn risk;
Category concentration risk;
Revenue predictability challenges.
Long-term sustainability would require diversification strategies, customer retention programs, and mid-frequency buyer expansion.

Technical Scope
This project demonstrates:

Relational database modeling (MySQL);
Data scaling using recursive CTEs;
Window functions (RANK, NTILE, LAG, SUM OVER)
Revenue growth analysis;
Pareto modeling;
Churn risk detection
Business-driven SQL storytelling
Project Structure
01_create_tables.sql

02_insert_seed_data.sql

03_basic_queries.sql

04_intermediate_queries.sql

05_advanced_queries.sql

06_generate_scaled_data.sql

07_advanced_business_scenarios.sql
