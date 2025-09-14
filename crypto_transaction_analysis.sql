-- 1. Create transactions table
CREATE TABLE transactions (
    transaction_id VARCHAR(100) PRIMARY KEY,
    sender_address VARCHAR(100),
    receiver_address VARCHAR(100),
    amount DECIMAL(20,8),
    transaction_fee DECIMAL(20,8),
    timestamp DATETIME,
    block_id VARCHAR(100),
    mining_pool VARCHAR(100),
    currency VARCHAR(20),
    transaction_type VARCHAR(50),
    transaction_status VARCHAR(50)
);

-- 2. Load data from CSV file into transactions table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/crypto_transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(transaction_id, sender_address, receiver_address, amount, transaction_fee, @raw_timestamp, block_id, mining_pool, currency, transaction_type, transaction_status, @skip_gas_price)
SET timestamp = STR_TO_DATE(SUBSTRING_INDEX(@raw_timestamp, '.', 1), '%Y-%m-%dT%H:%i:%s');

-- 3. Detect suspicious addresses with high transaction counts
SELECT sender_address AS suspicious_address,
       COUNT(*) AS total_transactions
FROM transactions
GROUP BY sender_address
HAVING COUNT(*) > 100
ORDER BY total_transactions DESC;

-- 4. Identify high-value transactions
SELECT transaction_id, sender_address, amount
FROM transactions
WHERE amount > 10
ORDER BY amount DESC;

-- 5. Find addresses with frequent transactions in a specific date range
SELECT sender_address, COUNT(*) AS tx_count
FROM transactions
WHERE timestamp BETWEEN '2025-03-01' AND '2025-05-31'
GROUP BY sender_address
HAVING tx_count > 5;

-- 6. Detect blocks with unusually high transaction counts
SELECT block_id, COUNT(*) AS tx_count
FROM transactions
GROUP BY block_id
HAVING COUNT(*) > 50
ORDER BY tx_count DESC;

-- 7. Analyze hourly transaction patterns
SELECT DATE(timestamp) AS tx_date,
       HOUR(timestamp) AS tx_hour,
       COUNT(*) AS tx_count,
       MIN(timestamp) AS first_tx,
       MAX(timestamp) AS last_tx
FROM transactions
GROUP BY DATE(timestamp), HOUR(timestamp)
HAVING COUNT(*) > 20
ORDER BY tx_count DESC;

-- 8. Identify addresses involved in multiple currencies
SELECT sender_address, COUNT(DISTINCT currency) AS currency_used
FROM transactions
GROUP BY sender_address
HAVING COUNT(DISTINCT currency) > 1;