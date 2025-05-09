import 'package:flutter/material.dart';

import '../../../core/components/custom_Search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: const [
          CustomSearchField(),
        ],
      ),
    );
  }
}
