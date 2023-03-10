CREATE STAGE IF NOT EXISTS customer_shopping_patterns.res.stg_products
  STORAGE_INTEGRATION = SI_CUSTOMER_SHOPPING_PATTERNS
  URL = 's3://tk-snowflake-tech-test/customer_shopping_patterns/products/'
  FILE_FORMAT = customer_shopping_patterns.res.ff_csv;