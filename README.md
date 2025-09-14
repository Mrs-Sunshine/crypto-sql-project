# 📊 Cryptocurrency Transaction Analysis (SQL Project)

This project analyzes cryptocurrency transaction data (BTC & ETH) using SQL.  
It is designed as part of my practice portfolio for AML / Compliance Analyst roles,  
demonstrating how SQL can be applied to detect suspicious financial activities.


## 📌 Purpose
- Practice SQL skills with real-world transaction data
- Explore how blockchain transaction patterns can relate to financial crime compliance
- Build a portfolio project that connects data analysis with AML/Compliance monitoring


## 🛠️ Dataset
- Source: [Cryptocurrency Transaction Analytics (BTC & ETH) - Kaggle](https://www.kaggle.com/datasets/dnkumars/cryptocurrency-transaction-analytics-btc-and-eth)
- Contains transaction details such as:
  - `transaction_id`
  - `sender_address`
  - `receiver_address`
  - `amount`
  - `transaction_fee`
  - `timestamp`
  - `block_id`
  - `mining_pool`
  - `currency`
  - `transaction_type`
  - `transaction_status`


## 📂 Project Structure
📦 crypto-sql-project
┣ 📜 crypto_transactions_analysis.sql # Main SQL queries
┣ 📜 README.md # Project documentation


## 🔎 Queries Included
1. Suspicious Senders → Find addresses with unusually high transaction counts  
2. High Value Transactions → Identify transactions with large amounts  
3. Active Senders in Time Period → Monitor activity spikes in a given timeframe  
4. Heavy Blocks → Detect blocks with abnormally high number of transactions  
5. High-Frequency Time Slots → Spot bursts of activity in short time frames  
6. Daily Transaction Volumes → Track trends over time  
7. Hourly Patterns → Analyze transaction clustering by hour of day  
8. Multi-Currency Senders → Flag addresses transacting in multiple currencies  


## 🚀 How to Use
1. Create the table schema (`CREATE TABLE ...`)
2. Load the dataset (`LOAD DATA INFILE ...`)
3. Run queries from `crypto_transactions_analysis.sql` one by one


## 🎯 Skills Demonstrated
- SQL: Data loading, grouping, filtering, aggregations
- Financial crime compliance thinking:
  - Suspicious activity monitoring
  - High-risk transaction analysis
  - Pattern detection in crypto transactions