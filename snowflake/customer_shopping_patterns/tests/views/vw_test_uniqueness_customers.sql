CREATE OR REPLACE VIEW customer_shopping_patterns.tests.vw_test_uniqueness_customer
AS
SELECT IFF(COUNT(*) = 0, 'OK', 'FAILED') AS test_result
       , 'Customer id uniqueness' AS test_description 
   FROM (
      SELECT customer_id
           , COUNT(*)
        FROM customer_shopping_patterns.raw.customers
    GROUP BY customer_id
      HAVING COUNT(*) > 1
   )