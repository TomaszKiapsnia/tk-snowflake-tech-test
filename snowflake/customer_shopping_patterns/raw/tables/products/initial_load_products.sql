-- disclaimer -- here we have only initial load, while CDC and SCD should be handled for full management of dimension
-- it can be done using streams and tasks. Whenever some new data is ingested, stream on table shows diff and, for example, UDF can be triggered to handle changes

COPY INTO customer_shopping_patterns.raw.products
  FROM @customer_shopping_patterns.res.stg_products;