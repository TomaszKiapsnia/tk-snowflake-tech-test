CREATE TASK IF NOT EXISTS customer_shopping_patterns.res.tsk_load_fact_transactions
SCHEDULE = '1 MINUTE'
USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'
WHEN
  SYSTEM$STREAM_HAS_DATA('customer_shopping_patterns.raw.str_transactions')
AS
INSERT INTO customer_shopping_patterns.core.fact_transactions (customer_id, product_id, price, date_of_purchase)
SELECT raw_transaction:customer_id
     , basket.value:product_id
     , basket.value:price
     , raw_transaction:date_of_purchase
  FROM customer_shopping_patterns.raw.str_transactions
     , table(flatten(input => raw_transaction:basket)) basket
;

ALTER TASK customer_shopping_patterns.res.tsk_load_fact_transactions RESUME;