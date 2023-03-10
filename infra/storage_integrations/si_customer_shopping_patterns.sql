CREATE STORAGE INTEGRATION IF NOT EXISTS si_customer_shopping_patterns
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::152838130605:role/role_customer_shopping_patterns'
  STORAGE_ALLOWED_LOCATIONS = ('s3://tk-snowflake-tech-test/customer_shopping_patterns/')