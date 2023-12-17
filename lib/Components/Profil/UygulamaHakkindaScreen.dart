import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class UygulamaHakkindaScreen extends StatefulWidget {
  const UygulamaHakkindaScreen({super.key});

  @override
  State<UygulamaHakkindaScreen> createState() => _UygulamaHakkindaScreenState();
}

class _UygulamaHakkindaScreenState extends State<UygulamaHakkindaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Renkler.Blue,
        foregroundColor: Renkler.White,
        title: const Text(
          'Uygulama Hakkında',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 12, right: 12),
        child: UygulamaScreen(),
      ),
    );
  }
}

class UygulamaScreen extends StatelessWidget {
  const UygulamaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text(
            "Takip Plus Hakkında",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Takip Plus: İşinizin Kontrolü Parmaklarınızın Ucunda!",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "10 Yıllık Muhasebe ve İş Takip Tecrübesi",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Takip Plus, iş dünyasındaki karmaşıklığı azaltmayı ve işletmenizin finansal süreçlerini kolaylaştırmayı amaçlayan bir muhasebe ve iş takip uygulamasıdır. 10 yılı aşkın süredir edindiğimiz deneyim ve müşteri geri bildirimleri doğrultusunda, işletmelerin finansal yönetim süreçlerini optimize etmeye odaklanıyoruz.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Ürün ve Müşteri Takibi:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Takip Plus, müşteri yönetimi ve ürün takibi konusunda endüstri lideri bir çözüm sunar. Müşterilerinizle ilişkilerinizi güçlendirmek, satışlarınızı artırmak ve stok yönetimini optimize etmek için tasarlanmıştır.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Müşteri Takibi: Müşterilerinizle etkileşimde bulunmanın ve taleplerini anlamanın kolay bir yolu. Satışlarınızı artırın ve müşteri memnuniyetini maksimize edin. Ürün Takibi: Stok düzeylerinizi anında takip edin, ürünlerinizin hareketini analiz edin ve stok yönetimini optimize ederek israfı minimize edin.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Neden Takip Plus?",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Kolay Kullanım: İş süreçlerinizi kolaylaştırmak için kullanıcı dostu bir arayüz. Muhasebe Kolaylığı: Gelir ve giderlerinizi takip etmek, faturalarınızı yönetmek ve vergi hazırlıklarınızı yapmak için güçlü muhasebe özellikleri. Mobil Uyumlu: İşinizi her an her yerden yönetin, mobil cihazlarınızla uyumlu. Güvenilirlik: 10 yıldan fazla bir süredir binlerce işletme tarafından güvenle kullanılan bir platform.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "İletişim:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Takip Plus ekibi, sizinle iş süreçlerinizi iyileştirmek ve işinizi büyütmek için bir araya gelmeyi dört gözle bekliyor. Sorularınız, önerileriniz veya işbirliği talepleriniz için bizimle iletişime geçmekten çekinmeyin.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
