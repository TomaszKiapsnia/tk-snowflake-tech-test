CREATE PIPE IF NOT EXISTS customer_shopping_patterns.res.pipe_raw_transactions
  auto_ingest=TRUE 
  AS
  COPY INTO customer_shopping_patterns.raw.transactions
  FROM @customer_shopping_patterns.res.stg_transactions;