import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zostel/data_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _expanded3 = false;
  bool _expanded4 = false;
  void _toggleSize(int index) {
    setState(() {
      if (index == 0) {
        _expanded1 = !_expanded1;
        _expanded2 = false;
        _expanded3 = false;
        _expanded4 = false;
      } else if (index == 1) {
        _expanded2 = !_expanded2;
        _expanded1 = false;
        _expanded3 = false;
        _expanded4 = false;
      } else if (index == 2) {
        _expanded3 = !_expanded3;
        _expanded1 = false;
        _expanded2 = false;
        _expanded4 = false;
      } else if (index == 3) {
        _expanded4 = !_expanded4;
        _expanded1 = false;
        _expanded2 = false;
        _expanded3 = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Zostel Clone'),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: CardData.getCardData().length,
              itemBuilder: (context, index) {
                var card = CardData.getCardData()[index];
                return _buildAnimatedCard(
                  index,
                  index == 0
                      ? _expanded1
                      : index == 1
                          ? _expanded2
                          : index == 2
                              ? _expanded3
                              : _expanded4,
                  card.color,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard(int index, bool expanded, Color color) {
    var data = CardData.getCardData();
    return GestureDetector(
      onTap: () => _toggleSize(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: double.infinity,
        padding: index == 4
            ? const EdgeInsets.only(bottom: 20)
            : const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: expanded
              ? Colors.deepPurpleAccent.withAlpha((0.1 * 255).toInt())
              : color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Text(
              data[index].title,
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: expanded
                    ? [
                        Text(
                          data[index].description,
                          style: const TextStyle(
                            color: Colors.purple,
                            fontSize: 14,
                          ),
                        ),
                        SvgPicture.asset("assets/icon.svg")
                      ]
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Second Screen'),
    );
  }
}
