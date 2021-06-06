# Voice of Customer

## Dataset
Comment Shabu review และ Wongnai

## Data Preparation
1. Filter Stop word และ Remove Word ออก
2. ทำ Word Tokenize
3. สร้าง Dictionary

## Model
ลอง Run LDA 

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/LDA.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/LDA.png" width="400" height="200" />

หลังจาก Run LDA โดยลองเลือกออกมา 5 Topic แล้วเลือกคำสำคัญออกมา 20 อันดับแรกของแต่ละ Topic

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/all.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/all.png" width="400" height="200" />

คำโดยส่วนใหญ่ที่ออกมาจาก Topic ก็จะเหมือนๆกัน ทุก Topic 

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/intersection.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/intersection.png" width="400" height="200" />

แต่ แต่ละ Topic ก็จะมีคำอยุ่บางคำที่ Topic อื่นไม่มีเช่นกัน เพราะฉะนั้นจะลบที่เหมือนๆกันทุก Topic คำออกไป ก็จะเห็นความแตกต่างของแต่ละ Topic มากขึ้น

<img src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/diff.png" data-canonical-src="https://github.com/yakonaru/BADS7105/blob/main/Homework%2011%20-%20Voice%20of%20Customer/diff.png" width="400" height="200" />

## Intrepret

จากการทดสอบพบว่า Topic Name สามารถแบ่งได้เป็น 5 Topic จากที่ดูจาก LDA Bubble chart พบว่า สามารถแบ่งกลุ่ม ได้แยกจากกันมากที่ ซึ่งโดย
ทุกๆ Topic มี Keyword ร่วมกัน โดยจากการทำ intersect topic name กับทุกๆ Topic คือ

'เลือก', 'เนื้อ', 'อาหาร', 'คุ้ม', 'ดี', 'น้ำ', 'ราคา', 'ทาน', 'อร่อย'
ซึ่งในแต่ละ Review โดยส่วนใหญ่ มีพูดถึง เนื้อ อาหาร น้ำซุป ราคาอาหาร กิน ดี มีของหวาน
แต่ก็จะมีบาง Topic จะมีเอกลักษณ์ที่พูดถึงแตกต่างกันไป ซึ่งดูจาก Different keywork ของแต่ละ Topic
* Topic 0 พูดถึง เมนูเทมปุระ ซูชิ น้ำจิ้ม (accurancy : 55%)
* Topic 1 พูดถึง เวลา (accurancy : 28%)
* Topic 2 พูดถึง หมู ไก่ ลองกิน (accurancy : 70%)
* Topic 3 พูดถึง สาย หม้อ ไอติม (accurancy : 100%)
* Topic 4 พูดถึง ชาบู บริการ คุณภาพ พนักงาน (accurancy : 46%)

ดังนั้นแต่ละ Topic ควรชื่อว่า
* Topic 0 คุ้มดีเนื้ออร่อย มีเทมปุระ ซูชิ และน้ำจิ้ม
* Topic 1 คุ้มดีเนื้ออร่อย มีเวลา
* Topic 2 คุ้มดีเนื้ออร่อย มีลองกินหมูไก่
* Topic 3 คุ้มดีเนื้ออร่อย มีหม้อมีไอติม
* Topic 4 คุ้มดีชาบูอร่อย พนักงานบริการคุณภาพ
