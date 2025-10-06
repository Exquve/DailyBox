import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:blur/blur.dart';
import '../widgets/modern_feature_box.dart';
import '../theme/modern_theme.dart';
import 'modern_notes_screen.dart';
import 'budget_screen.dart';
import 'qr_screen.dart';
import 'link_shortener_screen.dart';
import 'file_converter_screen.dart';

class ModernHomeScreen extends StatelessWidget {
  const ModernHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('DailyBox'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: Theme.of(context).brightness == Brightness.light
                    ? [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.6),
                      ]
                    : [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.6),
                      ],
              ),
            ),
          ).blurred(blur: 20, borderRadius: BorderRadius.zero),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: Theme.of(context).brightness == Brightness.light
                ? ModernTheme.lightGradient
                : ModernTheme.darkGradient,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Header with greeting
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getGreeting(),
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
                      const SizedBox(height: 8),
                      Text(
                        'What would you like to do today?',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).brightness == Brightness.light
                              ? ModernTheme.lightSecondaryText
                              : ModernTheme.darkSecondaryText,
                        ),
                      ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideX(begin: -0.3),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              
              // Feature grid
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildListDelegate([
                    ModernFeatureBox(
                      title: 'Notes',
                      subtitle: 'Quick thoughts',
                      icon: Icons.note_add_rounded,
                      gradient: const LinearGradient(
                        colors: [ModernTheme.primaryBlue, ModernTheme.primaryPurple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ModernNotesScreen()),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 300.ms).scale(begin: const Offset(0.8, 0.8)),
                    
                    ModernFeatureBox(
                      title: 'Budget',
                      subtitle: 'Track expenses',
                      icon: Icons.account_balance_wallet_rounded,
                      gradient: const LinearGradient(
                        colors: [ModernTheme.primaryTeal, ModernTheme.primaryBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BudgetScreen()),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 400.ms).scale(begin: const Offset(0.8, 0.8)),
                    
                    ModernFeatureBox(
                      title: 'QR Code',
                      subtitle: 'Scan & Generate',
                      icon: Icons.qr_code_rounded,
                      gradient: const LinearGradient(
                        colors: [ModernTheme.primaryOrange, ModernTheme.primaryRed],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QRScreen()),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 500.ms).scale(begin: const Offset(0.8, 0.8)),
                    
                    ModernFeatureBox(
                      title: 'Link Shortener',
                      subtitle: 'Shorten URLs',
                      icon: Icons.link_rounded,
                      gradient: const LinearGradient(
                        colors: [ModernTheme.primaryPink, ModernTheme.primaryPurple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LinkShortenerScreen()),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 600.ms).scale(begin: const Offset(0.8, 0.8)),
                    
                    ModernFeatureBox(
                      title: 'File Converter',
                      subtitle: 'Convert files',
                      icon: Icons.transform_rounded,
                      gradient: const LinearGradient(
                        colors: [ModernTheme.primaryPurple, ModernTheme.primaryTeal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FileConverterScreen()),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 700.ms).scale(begin: const Offset(0.8, 0.8)),
                    
                    // Placeholder for future Map feature
                    GlassmorphicContainer(
                      width: double.infinity,
                      height: 180,
                      borderRadius: 20,
                      blur: 20,
                      alignment: Alignment.center,
                      border: 1,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.1),
                          Colors.grey.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.2),
                          Colors.grey.withOpacity(0.1),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map_rounded,
                            size: 48,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Location Map',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Coming Soon',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 800.ms).scale(begin: const Offset(0.8, 0.8)),
                  ]),
                ),
              ),
              
              // Bottom spacing
              const SliverToBoxAdapter(
                child: SizedBox(height: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}