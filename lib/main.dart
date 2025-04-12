import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ArmazemDoSitioApp());

class ArmazemDoSitioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Armazém do Sítio',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final String whatsappNumber = '43996485047'; 

  void _abrirWhatsapp() async {
    final url =
        'https://wa.me/$whatsappNumber?text=Olá%20gostaria%20de%20fazer%20um%20pedido!';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Não foi possível abrir o WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Armazém do Sítio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('banner.jpg',
            height: 300,
            width: 400,
            fit: BoxFit.cover,),
          

            SizedBox(height: 20),

            Text(
              'Bem-vindo ao Armazém do Sítio!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Produtos artesanais e hortifrúti direto da roça.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _abrirWhatsapp,
              icon: Icon(Icons.chat),
              label: Text('Fazer Pedido via WhatsApp'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: const Color.fromARGB(255, 94, 206, 100),
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Destaques da Semana',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  // Exemplo de produto em destaque
                  Card(
                    child: ListTile(
                      leading: Image.asset('totame.jpg'),
                      title: Text('Tomate Orgânico'),
                      subtitle: Text('Fresco e colhido no dia! R\$ 4,50/kg'),
                      trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: _abrirWhatsapp,
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Image.asset('goiabada.jpg'),
                      title: Text('Goiabada Caseira'),
                      subtitle: Text('Feita pela Sra. Lourdes - R\$ 12,00'),
                      trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: _abrirWhatsapp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            Text(
              'Feito com carinho em Loanda/PR 💚',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
