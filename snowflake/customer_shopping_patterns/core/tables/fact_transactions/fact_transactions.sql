CREATE TABLE IF NOT EXISTS customer_shopping_patterns.core.fact_transactions
(
  customer_id VARCHAR(20)
, product_id VARCHAR(20)
, price NUMBER(10,0)
, date_of_purchase TIMESTAMP_NTZ(9) 
)