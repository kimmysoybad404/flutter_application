import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 224, 224, 224),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(136, 240, 240, 240),
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: const _PolicyBody(),
        ),
      ),
    );
  }
}

class _PolicyBody extends StatelessWidget {
  const _PolicyBody();

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
        h('ภาพรวม'),
        p('นโยบายความเป็นส่วนตัวนี้อธิบายว่าการใช้งานแอปควบคุมอุปกรณ์ไฟฟ้าภายในบ้าน '
          '(เช่น หลอดไฟ/ปลั๊กอัจฉริยะ ผ่าน ESP32) มีการเก็บ ใช้ เก็บรักษา และเปิดเผยข้อมูลอย่างไร '
          'รวมถึงสิทธิของผู้ใช้ต่อข้อมูลของตนเอง'),

        h('ข้อมูลที่เราเก็บ'),
        li('ข้อมูลบัญชีพื้นฐาน: ชื่อผู้ใช้ อีเมล (หากมีระบบลงทะเบียน)'),
        li('ข้อมูลอุปกรณ์: ชื่ออุปกรณ์ รหัส/หมายเลขเฉพาะของอุปกรณ์ (device ID, chip ID)'),
        li('บันทึกการสั่งงาน (command logs): เวลา คำสั่งที่ส่ง สถานะตอบกลับ เพื่อวินิจฉัยปัญหา'),
        li('ข้อมูลวิเคราะห์การใช้งานแบบภาพรวม (ไม่ระบุตัวบุคคล) เพื่อปรับปรุงประสบการณ์'),

        h('วัตถุประสงค์การใช้ข้อมูล'),
        li('ให้บริการควบคุม/ตรวจสถานะอุปกรณ์ผ่านแอปได้อย่างถูกต้อง'),
        li('ปรับปรุงคุณภาพบริการ แก้ไขบั๊ก และยกระดับความปลอดภัย'),
        li('สื่อสารแจ้งเตือนที่จำเป็น เช่น ความผิดปกติของอุปกรณ์'),

        h('พื้นฐานทางกฎหมาย (ถ้ามีการกำกับดูแลที่เกี่ยวข้อง)'),
        li('การให้บริการตามสัญญา: เพื่อให้แอปและอุปกรณ์ทำงานตามที่ผู้ใช้ต้องการ'),
        li('ความชอบธรรมทางผลประโยชน์: เพื่อความปลอดภัยและประสบการณ์การใช้งาน'),
        li('การยินยอม: สำหรับข้อมูล/ฟีเจอร์ที่ต้องได้รับความยินยอมก่อน'),

        h('การเปิดเผยข้อมูล'),
        li('เราไม่ขายข้อมูลส่วนบุคคลให้บุคคลที่สาม'),
        li('อาจเปิดเผยต่อผู้ให้บริการโครงสร้างพื้นฐาน (เช่น โฮสติ้ง/แจ้งเตือน) '
           'เฉพาะเท่าที่จำเป็นและอยู่ภายใต้สัญญาคุ้มครองข้อมูล'),
        li('กรณีข้อกำหนดทางกฎหมาย/คำสั่งศาล เราอาจต้องเปิดเผยตามที่กฎหมายกำหนด'),

        h('การเก็บรักษาและระยะเวลา'),
        li('เก็บข้อมูลเท่าที่จำเป็นสำหรับการให้บริการและตามวัตถุประสงค์ที่แจ้งไว้'),
        li('ลบบางส่วน/ทำให้ไม่ระบุตัวบุคคลเมื่อหมดความจำเป็น'),

        h('ความปลอดภัยของข้อมูล'),
        li('ใช้มาตรการความปลอดภัยที่เหมาะสมเพื่อป้องกันการเข้าถึง/ใช้/แก้ไข/ทำลายข้อมูลโดยไม่ได้รับอนุญาต'),
        li('ผู้ใช้ควรรักษาความปลอดภัยบัญชี เครือข่ายภายในบ้าน และเฟิร์มแวร์ของอุปกรณ์ (ESP32) ให้ทันสมัย'),

        h('สิทธิของผู้ใช้'),
        li('ขอเข้าถึง/รับสำเนาข้อมูลส่วนบุคคลของตน'),
        li('ขอแก้ไขข้อมูลที่ไม่ถูกต้อง'),
        li('ขอลบข้อมูลหรือคัดค้านบางการประมวลผล (ภายใต้เงื่อนไขที่กฎหมายกำหนด)'),
        li('ถอนความยินยอมได้ในกรณีการประมวลผลที่อาศัยความยินยอม'),

        h('คุกกี้/เทคโนโลยีติดตาม (ถ้ามี)'),
        li('หากมีการใช้คุกกี้หรือ SDK เพื่อติดตามสถิติการใช้งาน จะใช้เพื่อปรับปรุงบริการและไม่ระบุตัวบุคคล'),

        h('บริการของบุคคลที่สาม'),
        li('หากมีการเชื่อมต่อบริการบุคคลที่สาม (เช่น บริการแจ้งเตือน/คลาวด์) '
           'การใช้งานจะอยู่ภายใต้นโยบายของผู้ให้บริการนั้นด้วย'),

        h('เด็กและเยาวชน'),
        li('บริการนี้มุ่งสำหรับผู้ใหญ่/เจ้าของบ้าน ผู้ปกครองควรดูแลการใช้งานของผู้เยาว์'),

        h('การเปลี่ยนแปลงนโยบาย'),
        p('เราอาจปรับปรุงนโยบายเป็นครั้งคราว หากมีการเปลี่ยนแปลงสำคัญจะแจ้งให้ทราบภายในแอป'),

        h('การติดต่อ'),
        p('อีเมลฝ่ายสนับสนุน: 6631501xxx@lamduan.mfu.ac.th'),

        const SizedBox(height: 12),
        const Text('อัปเดตล่าสุด: 02/10/2025',
            style: TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ),
      ],
    );
  }
}