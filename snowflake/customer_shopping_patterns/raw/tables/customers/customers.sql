--- I've decided on my own about data types length by looking at input data.
--- Despite using full lenght of varchar causing no performance degradation or storage consumption
--- specification of downstream applications needs to be considered
--- (some BI tools in advance allocate in memory lenght of the data type, so it can case an issue)

CREATE TABLE IF NOT EXISTS customer_shopping_patterns.raw.customers
(
  customer_id VARCHAR(20)
 ,loyalty_score NUMBER(10,0)
)