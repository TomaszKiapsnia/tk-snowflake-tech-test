CREATE STAGE IF NOT EXISTS customer_shopping_patterns.res.stg_customers
  STORAGE_INTEGRATION = SI_CUSTOMER_SHOPPING_PATTERNS
  URL = 's3://tk-snowflake-tech-test/customer_shopping_patterns/customers/'
  FILE_FORMAT = customer_shopping_patterns.res.ff_csv;