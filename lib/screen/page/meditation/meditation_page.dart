import 'package:affordable_yoga_252/screen/page/meditation/child_pages/meditation_detail_page.dart';
import 'package:flutter/material.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                CategoryButton(label: 'Novice'),
                CategoryButton(label: 'Amateur'),
                CategoryButton(label: 'Professional'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const <Widget>[
                MeditationCard(
                    title: 'Mindful Mornings', sessions: '7 Sessions'),
                MeditationCard(
                    title: 'Deep Relaxation Series', sessions: '14 Sessions'),
                MeditationCard(
                    title: 'Zen Meditations', sessions: '6 Sessions'),
                MeditationCard(
                    title: 'Focus And Productivity', sessions: '10 Sessions'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffA65EEF),
      ),
      margin: const EdgeInsets.only(left: 16),
      alignment: Alignment.center,
      child: Text(label),
    );
  }
}

class MeditationCard extends StatelessWidget {
  final String title;
  final String sessions;

  const MeditationCard({Key? key, required this.title, required this.sessions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SerenityStretchScreen()),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const Text('text'),
          title: Text(title),
          subtitle: Text(sessions),
        ),
      ),
    );
  }
}
