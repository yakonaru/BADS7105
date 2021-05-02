CREATE OR REPLACE MODEL`supermarket.CUSTOMER_SEGMENT_CLUSTERS` 
OPTIONS(model_type='kmeans', num_clusters=2) 
AS (
    SELECT  TOTAL_SPEND , TOTAL_VISIT, STD_TICKET_SIZE ,
DURING_SINCE_FIRST_PURCHASE,
DURING_SINCE_LAST_PURCHASE, 
LENGHT_OF_STAY,
AVERAGE_TIME_TO_EVENT,
MODE_BASKET_SIZE  ,
MODE_SHOP_TIME  ,
MODE_WEEKDAY ,
AVERAGE_MONTHLY_VISIT,
AVERAGE_MONTHLY_SPEND,
STD_MONTHLY_SPEND,
STD_MONTHLY_VISIT
    FROM `crm-customer-segment.supermarket.aggregate`WHERE CUST_CODE IS NOT NULL
)