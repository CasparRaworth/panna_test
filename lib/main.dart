import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/panna_logo.png', height: 30),
            Text(
              '£25.00',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Saturday, 17th August'),
                  TextButton(
                    onPressed: () {},
                    child: Text('All scores >'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildScoreCard('LIVE', 'WOL', '2', 'TOT', '1'),
                  SizedBox(width: 8),
                  _buildScoreCard('LIVE', 'ARS', '2', 'BRE', '1'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildScoreCard('FINAL', 'LIV', '4', 'FUL', '0'),
                  SizedBox(width: 8),
                  _buildScoreCard('FINAL', 'CHE', '2', 'MNC', '0'),
                ],
              ),
              SizedBox(height: 16),
              _buildPannaPick(),
              SizedBox(height: 16),
              _buildSectionTitle('Latest News'),
              _buildNewsCard(
                  'assets/maresca.webp',
                  '‘We will keep fighting’ Maresca backs his blues',
                  'As the start of Chelsea’s season goes from bad to worse, the new manager stays positive in light of backlash...'),
              SizedBox(height: 8),
              _buildNewsCard(
                  'assets/liverpool.jpeg',
                  'Liverpool hammer Fulham in first win in five games',
                  'The Reds fire in five in quick succession to end their goal drought at the start of the season. New manager delighted with...'),
              SizedBox(height: 8),
              _buildNewsCard(
                  'assets/ipswich.jpeg',
                  'New hopefuls Ipswich continue unbeaten start',
                  'Ipswich were once again victorious, this time over league leaders Manchester City. Can anyone stop the Chair...'),
              SizedBox(height: 16),
              _buildSectionTitle('Community Articles'),
              _buildCommunityArticle(
                  'Palace have every chance of coming top four this season if we keep this up',
                  'Will_Jsy'),
              _buildCommunityArticle(
                  'United are still the biggest club in England, despite the lack of recent titles',
                  'FB.devil69'),
              _buildCommunityArticle(
                  'We should have never let Poch go, Chelsea are never...'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'LIVE SCORES'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'LEAGUES'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'CHATS'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildScoreCard(
      String status, String team1, String score1, String team2, String score2) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(status, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(team1),
                Text(score1, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(score2, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(team2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPannaPick() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Panna pick of the week: City Fever',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 8),
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage('assets/city.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
            'It is no surprise that Pep’s City have come flying out of the blocks with a Haaland brace to seal the...'),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        TextButton(
          onPressed: () {},
          child: Text('See all >'),
        ),
      ],
    );
  }

  Widget _buildNewsCard(String imagePath, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityArticle(String title, [String author = '']) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          if (author.isNotEmpty)
            Text(
              ' • $author',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );
  }
}
