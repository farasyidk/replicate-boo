import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friendly/presentation/pages/matching/widgets/widgets.dart';
import 'package:friendly/presentation/widgets/widgets.dart';

/// Matching Page
class MatchingPage extends ConsumerStatefulWidget {
  const MatchingPage({super.key});

  @override
  ConsumerState<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends ConsumerState<MatchingPage>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MatchingAppBar(),
      body: Column(
        children: [
          MatchingTabBar(
            selectedIndex: _selectedTabIndex,
            onTabChanged: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const NewUserContent();
      case 1:
        return Center(child: Text('Temukan'));
      default:
        return const NewUserContent();
    }
  }
}
