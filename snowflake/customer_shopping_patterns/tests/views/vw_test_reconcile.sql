CREATE OR REPLACE VIEW customer_shopping_patterns.tests.vw_test_reconcile 
AS
WITH src AS (
    SELECT customer_id
         , COUNT(*) AS cnt 
      FROM customer_shopping_patterns.core.fact_transactions
  GROUP BY customer_id
  ),
  trg AS (
    SELECT customer_id
         , SUM(purchase_count) AS cnt 
      FROM customer_shopping_patterns.pub.vw_output
  GROUP BY customer_id
  )
         SELECT IFF(COUNT(*) = 0, 'OK', 'FAILED') AS test_result
              , 'Reconcile customers purchase count' AS test_description 
           FROM src 
FULL OUTER JOIN trg 
             ON src.customer_id = trg.customer_id
          WHERE src.cnt <> trg.cnt;