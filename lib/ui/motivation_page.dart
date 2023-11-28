import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MotivationPage(
      ),
    );
  }
}

class MotivationPage extends StatelessWidget {
  final List<MotivationCard> motivationCards = [
    MotivationCard(
      title: 'Sebaik - baik manusia diantara kamu adalah yang mempelajari Al-Quran dan mengajarkannya',
      description: '- HR Bukhori',
      cardColor: Colors.blue.shade900,
    ),
    MotivationCard(
      title: 'Sungguh engkau diciptakan bukan untuk membalas orang yang menyakitimu, kewajibanmu hanyalah bersabar. Karena sabar merupakan adabmu kepada Allah SWT',
      description: '-Al Habib Ali Al Jufri',
      cardColor: Colors.blue.shade700,
    ),
    MotivationCard(
      title: 'Boleh jadi kamu membenci sesuatu, padahal ia amat baik bagimu, dan boleh jadi (pula) kamu menyukai sesuatu, padahal ia amat buruk bagimu. Allah mengetahui, sedang kamu tidak mengetahui.',
      description: '- QS Al Baqarah 216',
      cardColor: Colors.blue.shade900,
    ),
    MotivationCard(
      title: 'Ibadah termulia adalah memasukkan rasa bahagia pada hati orang lain.',
      description: '- Husein Jafar Al Hadar',
      cardColor: Colors.blue.shade700,
    ),
    MotivationCard(
      title: 'Apabila sesuatu yang kau senangi tidak terjadi maka senangilah apa yang terjadi.',
      description: '– Ali bin Abi Thalib',
      cardColor: Colors.blue.shade900,
    ),
    MotivationCard(
      title: 'Berpikirlah positif, tidak peduli seberapa keras kehidupanmu',
      description: '- Ali bin Abi Thalib',
      cardColor: Colors.blue.shade700,
    ),
    MotivationCard(
      title: 'Barang siapa yang tidak mensyukuri yang sedikit, maka ia tidak akan mampu mensyukuri sesuatu yang banyak',
      description: '- HR. Ahmad',
      cardColor: Colors.blue.shade900,
    ),
    MotivationCard(
      title: 'Manusia yang berakal adalah manusia yang suka menerima dan meminta nasihat.',
      description: '- Umar bin Khattab',
      cardColor: Colors.blue.shade700,
    ),
    MotivationCard(
      title: 'Semakin banyak ilmu yang kamu miliki, maka semakin besar pula ketakwaanmu terhadap Allah SWT.',
      description: '- Abu Bakar As-Shidiq',
      cardColor: Colors.blue.shade900,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motivasi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: motivationCards.length,
              itemBuilder: (context, index) {
                return motivationCards[index];
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
       onPressed: () {
         _launchUrl('https://www.merdeka.com/jabar/50-kata-kata-motivasi-islami-penuh-makna-jadi-inspirasi-dan-nasihat-hidup-49837-mvk.html?screen=4');
       }, 
        child: Icon(Icons.link),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}


class MotivationCard extends StatelessWidget {
  final String title;
  final String description;
  final Color cardColor;

  MotivationCard({required this.title, required this.description, required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
