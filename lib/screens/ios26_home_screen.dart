import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'modern_notes_screen.dart';
import 'budget_screen.dart';
import 'qr_screen.dart';
import 'link_shortener_screen.dart';
import 'file_converter_screen.dart';

class iOS26HomeScreen extends StatefulWidget {
  const iOS26HomeScreen({super.key});

  @override
  State<iOS26HomeScreen> createState() => _iOS26HomeScreenState();
}

class _iOS26HomeScreenState extends State<iOS26HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _pulseController;
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _particleController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          _buildAnimatedBackground(),
          
          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Header
                  _buildHeader(),
                  
                  const SizedBox(height: 30),
                  
                  // Feature Grid
                  Expanded(
                    child: _buildFeatureGrid(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFf093fb).withOpacity(0.1),
                Color(0xFF4facfe).withOpacity(0.1),
                Color(0xFF00f2fe).withOpacity(0.1),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return LiquidGlass(
      shape: LiquidRoundedSuperellipse(
        borderRadius: Radius.circular(30),
      ),
      settings: LiquidGlassSettings(
        thickness: 8,
        glassColor: Colors.white.withOpacity(0.2),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [Color(0xFF5856D6), Color(0xFF7B68EE)],
                ),
              ),
              child: const Icon(
                Icons.apps_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DailyBox',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Hayatınızı kolaylaştırın',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    final features = [
      {
        'title': 'Notlar',
        'subtitle': 'Düşüncelerinizi kaydedin',
        'icon': Icons.edit_note_rounded,
        'colors': [const Color(0xFF007AFF), const Color(0xFF5AC8FA)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ModernNotesScreen()),
        ),
      },
      {
        'title': 'Bütçe',
        'subtitle': 'Para akışını takip edin',
        'icon': Icons.account_balance_wallet_rounded,
        'colors': [const Color(0xFF34C759), const Color(0xFF30D158)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BudgetScreen()),
        ),
      },
      {
        'title': 'QR Kod',
        'subtitle': 'Kod oluştur ve tara',
        'icon': Icons.qr_code_scanner_rounded,
        'colors': [const Color(0xFF5856D6), const Color(0xFF7B68EE)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QRScreen()),
        ),
      },
      {
        'title': 'Link Kısalt',
        'subtitle': 'URL kısaltma aracı',
        'icon': Icons.link_rounded,
        'colors': [const Color(0xFFFF9500), const Color(0xFFFFB143)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LinkShortenerScreen()),
        ),
      },
      {
        'title': 'Format Dönüştürücü',
        'subtitle': 'Dosya formatları',
        'icon': Icons.transform_rounded,
        'colors': [const Color(0xFFFF3B30), const Color(0xFFFF6B6B)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FileConverterScreen()),
        ),
      },
      {
        'title': 'Yeni Özellikler',
        'subtitle': 'Çok yakında...',
        'icon': Icons.auto_awesome_rounded,
        'colors': [const Color(0xFF8E8E93), const Color(0xFFAEAEB2)],
        'onTap': () {},
      },
    ];

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return _buildFeatureCard(
          title: feature['title'] as String,
          subtitle: feature['subtitle'] as String,
          icon: feature['icon'] as IconData,
          colors: feature['colors'] as List<Color>,
          onTap: feature['onTap'] as VoidCallback,
        );
      },
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(
          borderRadius: Radius.circular(24),
        ),
        settings: LiquidGlassSettings(
          thickness: 6,
          glassColor: Colors.white.withOpacity(0.2),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(colors: colors),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}