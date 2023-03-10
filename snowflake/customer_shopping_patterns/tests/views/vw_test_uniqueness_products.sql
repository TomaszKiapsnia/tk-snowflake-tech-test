CREATE OR REPLACE VIEW customer_shopping_patterns.tests.vw_test_uniqueness_products
AS
SELECT IFF(COUNT(*) = 0, 'OK', 'FAILED') AS test_result
       , 'Product id uniqueness' AS test_description 
   FROM (
      SELECT product_id
           , COUNT(*)
        FROM customer_shopping_patterns.raw.products
    GROUP BY product_id
      HAVING COUNT(*) > 1
   )