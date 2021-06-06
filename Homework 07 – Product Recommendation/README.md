# Product Recommendation

## Dataset
แบบสำรวจสอบถามนักศึกในชั้นเรียนวิชา CRM Analytics โดยสอบถามว่าเคยซื้อสินค้าในแบบสอบถามหรือไม่
ซึ่งจะผู้ทำแบบทดสอบ ตอบว่า เคย หรือไม่เคย

## Data Preparation
1. ลบข้อมูลที่เป็น Null ออก

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/raw.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/raw.png" width="800" height="300" />

2. เปลี่ยน ค่าคำตอบของแบบสำรวจ จาก เคยซื้อ / ไม่เคยซื้อ สินค้าเป็น 1 / 0

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/10.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/10.png" width="800" height="100" />

## Exploratory Data Analysis
ลอง Visualize ด้วย matplotlib ของ Python เพื่อดูว่า มีไอเทมชิ้นใดบ้าง ที่มีคนเคยซื้ออยู่มากที่สุด และไม่ค่อยมีใครซื้อเลย

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/Explore.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/Explore.png" width="1000" height="700" />

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

## Collaborative Filtering Model
1. สร้าง Matrix ให้เป็น Item-Item เพื่อที่เราจะเตรียมหาค่า Similarity ของคู่สินค้าแต่ละชิ้นร่วมกันได้
2. คำนวน Distance ด้วย Consie ของสินค้าแต่ละคู่
3. คำนวน Similarity = 1-Distance ของสินค้าแต่ละคู่

4. ลบ Record ที่มีสินค้าเป็นสิ่งเดียวกัน เนื่องจากว่าโครง Matrix จะมีการจับคู่สินค้าเดียวกันด้วย
<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/result.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/result.png" width="600" height="300" />

## Graph Visualization
ลองใช้  Graph Visualization เพื่อ Plot ดูกลุ่มที่มีโอกาสซื้อของไปด้วยกัน
พบว่ามี 4 กลุ่มใหญ่ๆ

1. กลุ่มแอลกอฮอล์

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph4.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph4.png" width="300" height="300" />

2. กลุ่มไดร์เป่าผม

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph2.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph2.png" width="300" height="200" />

3. กลุ่มทาสแมว

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph3.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph3.png" width="600" height="200" />

4. กลุ่มอื่นๆ

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph1.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2007%20%E2%80%93%20Product%20Recommendation/image/graph1.png" width="800" height="400" />

## Interpretation

หลังจาก Run Model Collaborative Filtering ด้วยการหา Consine similarity ของ Item to Item พบว่า Item ที่เคยซื้อเหมือนๆ กัน โดย ลอง Filter Item ที่ Similarity > 0.6 มีหลากหลายรูปแบบทั้ง ของชนิดที่ไม่ทางเดียวกัน แต่ของที่ไปคนละทางกัน

* 86% ของคนที่เคยซื้อ "Brownie อวกาศ" เคยซื้อ "กระเป๋า Channel"  โดยทั้ง 2 สิ่งนี้คือเป็นสิ่งดูคนละเรื่องกัน แต่ถ้าเมื่อลอง สำรวจ Graph แล้วพบว่า คนที่เคยซื้อกระเป๋า channel ยังเคยซื้อยังเคยของเกี่ยวกับแมวด้วย เช่น ห้องน้ำแมวอัตโนมัติ อาหารแมวคลีนลดหุ่น ซึ่งถ้าดูจากในวงนี้น่าจะเป็นกลุ่มที่สนใจแมว สนใจกระเป๋า Channel และสนใจกัญชา สิ่งที่ควรแนะนำกลุ่มที่ชอบซื้อ Brownie อวกาศ ให้แนะนำกระเป๋า Brandname , สิ่งของสำหรับเลี้ยงแมว

* 83% ของคนที่เคยซื้อ "ต้นไม้ประดับ" เคยซื้อ "เลโก้" ซึ่งจริงๆ แล้วคนที่เคยซื้อเลโก้ จะเคยซื้ออีกหลายๆ อย่าง ซึ่งสามารถ Recommend ให้ซื้อต่อได้ เช่น ชุดน้องหมา,น้ำส้มดีโด้ , ที่ยกน้ำหนัก, ตาชั่ง, Boardgame , Collagen , วากิว, เครื่องดูดฝุ่นอัตโนมัติ 60%-70%)

* 71% ของคนที่เคยซื้อเสื้อซีทรู เคยซื้อชุดนอนไม่ได้นอน จะอยู่ในกลุ่มที่สนใจความสวยงาม สามารถแนำผลิตภัณฑ์อื่นๆต่อได้ เช่น Botox , Collagen

* 70% ของคนเคยซื้อไฟอัจฉริยะ เคยซื้อหลอดไฟเปลี่ยนสีได้ ซึ่งจริงๆ แล้วหลอดไฟเปลี่ยนสีอาจจะเป็นส่วนหนึ่งของหลอดไฟอัจฉริยะ แต่มี Gadget อื่นที่สามารถ Recommend ได้เช่น เครื่องตรวจน้ำตาลในเลือด, ตาชั่ง เครื่องดูดฝุ่นอัตโนมัติ และจักรยานเสือภูเขา (มากกว่า 60%)
* สุดท้าย แม้ว่า แม่โขง Vs แสงโสม , เนื้อวากิล Vs เนื้อย่าง จะมีค่า Similarity ที่สูงอยู่แล้ว (มากกว่า 88%) แต่เป็นสิ่งที่เรารู้อยู่แล้ว จึงไม่ควรจะนำมาแนะนำใหม่



