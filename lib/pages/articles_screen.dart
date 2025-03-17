import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF383838),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Text(
                'Interesting facts',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildArticleCard(
                  context,
                  'Top 5 Lesser-Known Places to Visit in Madrid',
                  'assets/images/articles/1.png',
                  width,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Madrid is full of hidden gems that are not on the standard tourist routes. If you want to see the city from a different perspective, these places are definitely for you:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔹 Prince of Anglomerate Garden (Jardín del Príncipe de Anglona) – a tiny but charming palace garden in the center of La Latina, the perfect place for a quiet getaway.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔹 Pita`s House Bookstore (Librería Panta Rhei) – a unique bookshop and gallery where you can find rare editions and browse art books.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔹 Casa de la Villa y la Barbería (Viewpoint) – one of the best places to get a panoramic view of the center of Madrid.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔹 The Museum of Romanticism (Museo del Romanticismo) is a small but atmospheric exhibition that takes you back to the 19th century.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔹 The Bunkers in El Capricho Park (Los Búnkeres del Capricho) are a hidden network of underground tunnels from the Spanish Civil War.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                _buildArticleCard(
                  context,
                  'History of Madrid in 10 facts',
                  'assets/images/articles/2.png',
                  width,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Madrid is a city with a rich past. Here are 10 interesting historical facts about the capital of Spain:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '📜 1. Madrid was an Arab fortress - in the 9th century, the city was called "Majrita" and was an important outpost of the Umayyads.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🏰 2. The Royal Palace is one of the largest in Europe - its area is 135,000 m², which is larger than Versailles!',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🍇 3. New Year`s tradition with 12 grapes - the Spanish celebrate the New Year by eating 12 grapes to the sound of the clock on Puerta del Sol.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '💃 4. Flamenco did not originate in Madrid, but the city became its center - in the 19th century, the best tablaos (flamenco cabaret) appeared here.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🎭 5. Gran Via – “Spanish Broadway” – this street is known for its theaters, fashion shops and iconic buildings.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '⚔ 6. Duels were held in Madrid – in the Middle Ages, sword fights were officially allowed here.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🦁 7. The coat of arms of Madrid is a bear and a strawberry tree – this symbol can be seen on Puerta del Sol.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '☕ 8. Madrid residents love chocolate with churros – establishments such as "San Ginés" have been operating since the 19th century and are open 24 hours a day.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🎨 9. Picasso`s "Guernica" was not in Spain for a long time – the artist gave the painting to the New York MoMA until the dictatorship in the country ended.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '⚽ 10. Real Madrid is the most decorated football club in the world – the club has won the UEFA Champions League 14 times.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Now you can see the city in a whole new way when you walk around it!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                _buildArticleCard(
                  context,
                  'The best tapas bars in Madrid',
                  'assets/images/articles/3.png',
                  width,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spanish tapas is an art. Madrid has some incredible bars where you can try the best tapas to go with your wine or sangria. Here are some iconic places:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🍤 1. Bodega de la Ardosa – a traditional Madrid bar with classic tapas like anchovies and tortilla omelette.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🧀 2. Casa Revuelta – they make the legendary bacalao rebozado.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🥩 3. El Sur – delicious tapas with ham, chorizo ​​and tomato bruschetta.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🍷 4. Taberna El Tempranillo – a great place to taste Spanish wines with cheese snacks.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🥑 5. La Musa – a modern place with creative tapas, such as guacamole with sun-dried tomatoes.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Tapas are not just food, they are part of the culture. You should definitely try them!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                _buildArticleCard(
                  context,
                  'How to get around Madrid: public transport and walking routes',
                  'assets/images/articles/4.png',
                  width,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🚇 The metro is one of the most convenient ways to get around. The system covers the entire city, and a ride costs around €1.50.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🚌 EMT buses – ideal for night trips when the metro is closed.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🚲 BiciMAD electric scooters and bikes – a convenient eco-friendly option for short trips.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🚶 Walking routes:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '📍 Historic center (2 km): Puerta del Sol → Plaza Mayor → Royal Palace → Almudena Cathedral.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '📍 Art route (3 km): Prado → Reina Sofia → Thyssen-Bornemisza → Retiro Park.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '📍 Gastronomic route (1.5 km): Gran Via → Chueca → Malasaña → Cava Baja.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(
    BuildContext context,
    String title,
    String image,
    double screenWidth,
    Widget textColumn,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF383838),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth > 375 ? 18.0 : 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DetailsScreen(
                                  title: title,
                                  image: image,
                                  textColumn: textColumn,
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFC9B09),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10,
                        ),
                      ),
                      child: const Text('Read more'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;
  final String image;
  final Widget textColumn;

  const DetailsScreen({
    required this.title,
    required this.image,
    required this.textColumn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Info",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              textColumn,
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
