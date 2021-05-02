รองรับภาษาไทย

# Customer Segmentation
รอบนี้จะเป็นการนำข้อมูล transaction ของ Supermarket มาลองจัดกลุ่มดู โดยเริ่มแรกจะ Import เข้า Google Big Query แล้วนำข้อมูลไป Aggregate ให้ได้ Feature ต่างๆ จากนั้นสร้าง Model K-Mean Clustering แล้วลองวิเคราะห์ และแปลผลลัพธ์ โดยเขียน Python ผ่าน Google Collab

## 1. Import Dataset
ข้อมูลที่นำมาวิเคราะห์เป็นข้อมูล transaction การซื้อของใน Supermarket จำนวน 956K Records ซึ่งเป็นส่วนหนึ่งจาก Dunhumbly public dataset จาก  2 stores ในปี  2006 ถึง 2008 Import เข้า Google Big Query 
## 2. Feature Extraction
จากนั้นลองสร้าง Variable ขึ้นมาจากข้อมูล Transaction
* TOTAL_SPEND ผลรวมของยอดซื้อของลูกค้าแต่ละราย
* TOTAL_VISIT จำนวน Basket ของลูกค้าแต่ละราย
* STD_TICKET_SIZE ส่วนเบี่ยงเบนมาตรฐานของยอดซื้อของลูกค้าแต่ละราย
* DURING_SINCE_FIRST_PURCHASE จำนวนนับจากเริ่มมี Transaction ครั้งแรก
* DURING_SINCE_LAST_PURCHASE จำนวนนับจาก Transaction ล่าสุด
* LENGHT_OF_STAY ระยะเวลาที่ยังเป็นลูกค้าอยู่
* AVERAGE_TIME_TO_EVENT ค่าเฉลี่ยของระยะยเวลาที่เป็นลูกค้าอยู่
* MODE_BASKET_SIZE ขนาดของ Basket ส่วนใหญ่ที่ลูกค้ามาซื้อของ
* MODE_SHOP_TIME เวลาที่ไปซื้อบ่อยที่สุด
* MODE_WEEKDAY วันที่ไปซื้อบ่อยที่สุด
* AVERAGE_MONTHLY_VISIT ยอดซื้อของเฉลี่ยลูกค้าแต่ละราย ต่อเดือน
* AVERAGE_MONTHLY_SPEND ยอดซื้อของเฉลี่ยลูกค้าแต่ละราย ต่อเดือน
* STD_MONTHLY_SPEND ส่วนเบี่ยงเบนมาตรฐานของยอดซื้อของลูกค้าแต่ละราย ต่อเดือน
* STD_MONTHLY_VISIT ส่วนเบี่ยงเบนมาตรฐานของจำนวน Basket ของลูกค้าแต่ละราย ต่อเดือน

แล้วบันทึกเป็น Table ใหม่ ลง [Aggregate Table](https://github.com/yakonaru/BADS7105/blob/main/Homework%2006%20%E2%80%93%20Customer%20Segmentation/create_table_aggregate.sql)

## 3. Clustering Model
ก่อนอื่น เรายังไม่รู้ว่าจะต้องจัดกลุ่มกี่กลุ่ม ไม่รู้ว่ากำหนด ค่า K เป็นเท่าไหร่ เลยลอง ดู Elbow Method และ Silhouette

ทำการสร้าง  [K-Mean Clustering Model](https://github.com/yakonaru/BADS7105/blob/main/Homework%2006%20%E2%80%93%20Customer%20Segmentation/create_model.sql)

จากรูปพบว่า ค่า Silhouette จะสูงที่สุด เมื่อจัดกลุ่มเป็น 3 กลุ่ม (K=3)


## 5. Clistering Analysis

## 6. Intrepret



Reference:
https://cloud.google.com/bigquery/docs/reference/standard-sql/statistical_aggregate_functions

SSE
https://vitalflux.com/k-means-elbow-point-method-sse-inertia-plot-python/

Silhouette Analysis in K-means Clustering
https://medium.com/@cmukesh8688/silhouette-analysis-in-k-means-clustering-cefa9a7ad111

Importance Feature with Random Forest
https://mljar.com/blog/feature-importance-in-random-forest/#:~:text=Random%20Forest%20Built%2Din%20Feature,from%20the%20Random%20Forest%20structure.&text=The%20average%20over%20all%20trees,measure%20of%20the%20feature%20importance.

Mode in BigQuery
https://github.com/tanatiem/BADS7105-CRM-Analytics/tree/main/Homework%2006%20-%20Customer%20Segmentation