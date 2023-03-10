CREATE OR REPLACE VIEW customer_shopping_patterns.tests.vw_tests
AS 
          SELECT * FROM customer_shopping_patterns.tests.vw_test_reconcile 
UNION ALL SELECT * FROM customer_shopping_patterns.tests.vw_test_uniqueness_customer
UNION ALL SELECT * FROM customer_shopping_patterns.tests.vw_test_uniqueness_products;
