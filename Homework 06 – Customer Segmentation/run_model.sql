SELECT
  * EXCEPT(nearest_centroids_distance)
FROM
  ML.PREDICT (MODEL `crm-customer-segment.supermarket.CUSTOMER_SEGMENT_CLUSTERS`,

(
SELECT
      *
    FROM
        `crm-customer-segment.supermarket.aggregate`
    WHERE
      CUST_CODE IS NOT NULL
)
  )