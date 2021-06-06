# Customer Movement Analysis
## Requirement
นำข้อมูล Supermarket Data ลองเขียน Query แล้วทำ Customer movement Analysis Dashboard 
## Status
โดยการทำ Customer movement Analysis เราจะพิจารณาจากจำนวนสถานะของลูกค้ดังนี้
|Status | Description | Condition |
|------ | ----------- | --------------- |
|New    | เป็นลูกค้าใหม่ในเดือนนั้น | Previous Month = Null |
|Repeat | เป็นลูกค้าที่มีการซื้อในเดือนที่แล้ว แล้วเดือนนี้กลับมาซื้ออีก| Current Month - Previous Month = 1 |
|Reactivated | เป็นลูกค้าที่เคยซื้อมในอดีต แต่ไม่ใช่เดือนที่แล้ว แล้วกลับมาซื้อในเดือนนี้| Current Month - Previous Month > 1 |
|Churn  | เป็นลูกค้าที่ไม่ได้กลับมาซื้อในเดือนนี้| Repeat -  Total of Previous month  |

## Dataset
ข้อมูลที่นำมาวิเคราะห์เป็นข้อมูล transaction การซื้อของใน Supermarket จำนวน 956K Records ซึ่งเป็นส่วนหนึ่งจาก Dunhumbly public dataset จาก  2 stores ในปี  2006 ถึง 2008 

## Result
เมื่อได้ SQL ที่ได้ ก็จะนำไป Visualize Power BI โดยใช้ Stacked Bar Chart

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2006%20%E2%80%93%20Customer%20Segmentation/image/MODE_BASKET_SIZE.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2006%20%E2%80%93%20Customer%20Segmentation/image/MODE_BASKET_SIZE.png" width="400" height="200" />

ถ้าทำให้ง่ายยิ่งขึ้น หรือพิจารณา Trend ของ Customer ในแต่ละสถานะ สามารถพิจารณาได้จาก Line chart เป็น time series 

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2006%20%E2%80%93%20Customer%20Segmentation/image/MODE_BASKET_SIZE.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2006%20%E2%80%93%20Customer%20Segmentation/image/MODE_BASKET_SIZE.png" width="400" height="200" />