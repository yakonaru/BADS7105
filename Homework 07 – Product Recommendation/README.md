# Product Recommendation

## Dataset
แบบสำรวจสอบถามนักศึกในชั้นเรียนวิชา CRM Analytics โดยสอบถามว่าเคยซื้อสินค้าในแบบสอบถามหรือไม่
ซึ่งจะผู้ทำแบบทดสอบ ตอบว่า เคย หรือไม่เคย

## Data Preparation
1. ลบข้อมูลที่เป็น Null ออก

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/raw.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/raw.png" width="800" height="100" />

2. เปลี่ยน ค่าคำตอบของแบบสำรวจ จาก เคยซื้อ / ไม่เคยซื้อ สินค้าเป็น 1 / 0

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/10.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/10.png" width="800" height="100" />

## Exploratory Data Analysis
ลอง Visualize ด้วย matplotlib ของ Python เพื่อดูว่า มีไอเทมชิ้นใดบ้าง ที่มีคนเคยซื้ออยู่มากที่สุด และไม่ค่อยมีใครซื้อเลย

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/Explore.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/Explore.png" width="800" height="300" />

พบว่า สินค้าที่มีคนเคยซื้อมากที่สุด 10 อันดับได้แก่
* ครีมกันแดด
* กระเป๋า
* ชาบู
* โรตี
* กะหรี่(ปั๊บ)
* เม็ดมะม่วงหิมพานต์
* หมอนข้าง
* พัดลม
* หมูแดดเดียว
* Software ถูกลิขสิทธิ์

ซึ่สินค้า 10 อันดับนี้ เราอาจจะไม่สามารถแนะนำได้ เพราะใครๆ ก็ซื้อสินค้าเหล่านี้เป็นปกติอยู่แล้ว
เพราะฉะนั้นจะลบสินค้าเหล่านี้ออกไปก่อน

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/result.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/result.png" width="800" height="300" />

## Collaborative Filtering Model

