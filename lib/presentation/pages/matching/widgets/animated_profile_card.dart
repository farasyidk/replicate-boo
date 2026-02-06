import 'package:flutter/material.dart';
import 'package:friendly/domain/entities/user_profile.dart';
import 'package:friendly/presentation/pages/matching/widgets/widgets.dart';

enum SlideDirection { none, left, right }

class AnimatedProfileCard extends StatefulWidget {
  final UserProfile profile;
  final SlideDirection slideDirection;

  const AnimatedProfileCard({
    super.key,
    required this.profile,
    this.slideDirection = SlideDirection.none,
  });

  @override
  State<AnimatedProfileCard> createState() => _AnimatedProfileCardState();
}

class _AnimatedProfileCardState extends State<AnimatedProfileCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void didUpdateWidget(AnimatedProfileCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.slideDirection != SlideDirection.none &&
        oldWidget.slideDirection == SlideDirection.none) {
      final endOffset = widget.slideDirection == SlideDirection.left
          ? const Offset(-1.5, 0)
          : const Offset(1.5, 0);

      _slideAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: endOffset,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ));

      _controller.forward();
    } else if (widget.profile.id != oldWidget.profile.id) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slideDirection == SlideDirection.none) {
      return ProfileCard(profile: widget.profile);
    }

    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ProfileCard(profile: widget.profile),
      ),
    );
  }
}
