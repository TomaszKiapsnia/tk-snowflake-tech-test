CREATE OR REPLACE VIEW customer_shopping_patterns.pub.vw_output
AS
         SELECT fct.customer_id
              , cust.loyalty_score
              , fct.product_id 
              , prod.product_category
              , COUNT(*) AS purchase_count
  
           FROM customer_shopping_patterns.core.fact_transactions fct 
LEFT OUTER JOIN customer_shopping_patterns.raw.customers cust -- it should be dimension with CDC and SCD and use it instead 
             ON fct.customer_id = cust.customer_id 
LEFT OUTER JOIN customer_shopping_patterns.raw.products prod -- it should be dimension with CDC and SCD and use it instead 
             ON fct.product_id = prod.product_id
GROUP BY fct.customer_id
              , cust.loyalty_score
              , fct.product_id 
              , prod.product_category
ORDER BY fct.customer_id ASC, fct.product_id ASC