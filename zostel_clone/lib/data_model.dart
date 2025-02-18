import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String description;
  final Color color;
  CardModel({
    required this.title,
    required this.description,
    required this.color,
  });
}

class CardData {
  static const _cardColor = Color(0xff6b6eb3);
  static List<CardModel> getCardData() {
    return [
      CardModel(
        color: _cardColor.withAlpha((0.18 * 255).toInt()),
        title: 'Lorem Ipsum',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Nullam ac erat ante. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris.',
      ),
      CardModel(
        color: _cardColor.withAlpha((0.25 * 255).toInt()),
        title: 'Sed Do Eiusmod',
        description:
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      ),
      CardModel(
        color: _cardColor.withAlpha((0.35 * 255).toInt()),
        title: 'Ut Enim',
        description:
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.',
      ),
      CardModel(
        color: _cardColor.withAlpha((0.45 * 255).toInt()),
        title: 'Duis Aute',
        description:
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Nullam ac erat ante.',
      ),
    ];
  }
}
