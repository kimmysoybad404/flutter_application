import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: const _TermsBody(),
        ),
      ),
    );
  }
}

class _TermsBody extends StatelessWidget {
  const _TermsBody();

  @override
  Widget build(BuildContext context) {
    Widget h(String t) => Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Text(t, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        );
    Widget p(String t) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(t, style: const TextStyle(fontSize: 14, height: 1.4)),
        );
    Widget li(String t) => Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  ', style: TextStyle(fontSize: 14)),
              Expanded(child: Text(t, style: const TextStyle(fontSize: 14, height: 1.4))),
            ],
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h('1) ข้อตกลงเบื้องต้น'),
        p('การใช้งานแอปนี้ถือว่าคุณยอมรับข้อกำหนดทั้งหมดด้านล่าง '
           'แอปใช้ควบคุมอุปกรณ์ไฟฟ้าภายในบ้าน (เช่น หลอดไฟ ปลั๊กอัจฉริยะ) ผ่าน ESP32.'),

        h('2) ความปลอดภัยและความรับผิดชอบของผู้ใช้'),
        li('ดูแลความปลอดภัยของบัญชี รหัสผ่าน และเครือข่ายบ้านของคุณเอง'),
        li('ติดตั้ง/เดินสายตามมาตรฐานไฟฟ้า ป้องกันไฟไหม้/ลัดวงจร'),
        li('อย่าใช้งานในสภาพเสี่ยง เช่น เปียกน้ำหรืออุณหภูมิสูงผิดปกติ'),

        h('3) การเชื่อมต่ออุปกรณ์ (ESP32)'),
        li('อุปกรณ์ต้องอยู่บนเครือข่ายที่คุณรับผิดชอบ'),
        li('อัปเดตเฟิร์มแวร์/ซอฟต์แวร์เพื่อความปลอดภัยอย่างสม่ำเสมอ'),
        li('อนุญาตเฉพาะผู้ใช้ที่เชื่อถือได้ให้ควบคุมอุปกรณ์'),

        h('4) ความเป็นส่วนตัวและข้อมูล'),
        li('อาจเก็บ log การสั่งงาน/ข้อมูลอุปกรณ์เพื่อปรับปรุงบริการ'),
        li('ไม่ขายข้อมูลส่วนบุคคลให้บุคคลที่สาม'),
        li('ติดต่อเพื่อขอลบ/ขอสำเนาข้อมูลได้'),

        h('5) การใช้งานที่ห้าม'),
        li('ห้ามใช้ผิดกฎหมาย รบกวนผู้อื่น หรือเข้าถึงอุปกรณ์ที่คุณไม่มีสิทธิ์'),
        li('ห้ามเจาะระบบ/ดักข้อมูล/ทำวิศวกรรมย้อนกลับ'),

        h('6) การรับประกันและข้อจำกัดความรับผิด'),
        li('ซอฟต์แวร์ให้ “ตามสภาพ” ผู้พัฒนาไม่รับผิดต่อความเสียหายจากการใช้งานผิดวิธี '
           'การติดตั้งไฟฟ้าไม่ถูกต้อง หรือปัญหาเครือข่าย/ฮาร์ดแวร์'),
        li('ควรมีอุปกรณ์ป้องกันไฟ (ฟิวส์/เบรกเกอร์) ตามมาตรฐาน'),

        h('7) การอัปเดตข้อกำหนด'),
        p('เราอาจปรับข้อกำหนดเป็นครั้งคราว หากมีการเปลี่ยนแปลงสำคัญจะแจ้งในแอป'),

        h('8) การยุติการใช้งาน'),
        p('เราสามารถระงับบัญชีที่ฝ่าฝืนข้อกำหนดหรือเสี่ยงต่อความปลอดภัย'),

        h('9) การติดต่อ'),
        p('อีเมลฝ่ายสนับสนุน: 6631501xxx@lamduan.mfu.ac.th'),

        const SizedBox(height: 12),
        const Text('อัปเดตล่าสุด: 01/10/2025',
            style: TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('I Agree'),
          ),
        ),
      ],
    );
  }
}