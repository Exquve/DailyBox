import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;
import 'modern_notes_screen.dart';
import 'budget_screen.dart';
import 'qr_screen.dart';
import 'link_shortener_screen.dart';
import 'file_converter_screen.dart';

class UltraModernHomeScreen extends StatefulWidget {
  const UltraModernHomeScreen({super.key});

  @override
  State<UltraModernHomeScreen> createState() => _UltraModernHomeScreenState();
}

class _UltraModernHomeScreenState extends State<UltraModernHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _heroController;
  late AnimationController _cardsController;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _heroAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    
    _heroController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _cardsController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
    
    _backgroundAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(_backgroundController);
    
    _heroAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _heroController.dispose();
    _cardsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundAnimation,
        builder: (context, child) {
          return Container(
            decoration: _buildDynamicBackground(),
            child: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
                      child: _buildHeroSection(),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: _buildFeatureGrid(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _buildDynamicBackground() {
    final time = _backgroundAnimation.value;
    return BoxDecoration(
      gradient: RadialGradient(
        center: Alignment(
          0.3 + 0.4 * math.sin(time * 0.5),
          -0.2 + 0.3 * math.cos(time * 0.3),
        ),
        radius: 1.2 + 0.3 * math.sin(time * 0.7),
        colors: [
          Color(0xFF6366F1).withValues(alpha: 0.15 + 0.1 * math.sin(time)),
          Color(0xFF8B5CF6).withValues(alpha: 0.12 + 0.08 * math.cos(time * 1.3)),
          Color(0xFFEC4899).withValues(alpha: 0.1 + 0.06 * math.sin(time * 1.7)),
          Color(0xFFF59E0B).withValues(alpha: 0.08 + 0.04 * math.cos(time * 2.1)),
          Color(0xFF10B981).withValues(alpha: 0.06 + 0.03 * math.sin(time * 2.5)),
          Colors.white.withValues(alpha: 0.02),
        ],
        stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
      ),
    );
  }

  Widget _buildHeroSection() {
    return AnimatedBuilder(
      animation: _heroAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _heroAnimation.value,
          child: LiquidGlassLayer(
            settings: LiquidGlassSettings(
              thickness: 25,
              glassColor: Colors.white.withValues(alpha: 0.08),
              lightIntensity: 2.8,
              blend: 60,
              saturation: 1.15,
              lightness: 1.1,
            ),
            child: Stack(
              children: [
                // Background glass effect
                LiquidGlass.inLayer(
                  shape: LiquidRoundedSuperellipse(
                    borderRadius: Radius.circular(32),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: 0.12),
                          Colors.white.withValues(alpha: 0.06),
                          Colors.white.withValues(alpha: 0.03),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                // Content overlay
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Liquid glass logo effect
                            LiquidGlass.inLayer(
                              shape: LiquidRoundedSuperellipse(
                                borderRadius: Radius.circular(16),
                              ),
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.apps_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Glassify(
                              settings: LiquidGlassSettings(
                                thickness: 6,
                                glassColor: Colors.white.withValues(alpha: 0.2),
                                lightIntensity: 2.2,
                              ),
                              child: Text(
                                'DailyBox',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 36,
                                  letterSpacing: -1.2,
                                  color: const Color(0xFF1E293B),
                                  shadows: [
                                    Shadow(
                                      color: Colors.white.withValues(alpha: 0.6),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Glassify(
                          settings: LiquidGlassSettings(
                            thickness: 3,
                            glassColor: Colors.white.withValues(alpha: 0.15),
                            lightIntensity: 1.8,
                          ),
                          child: Text(
                            'Ultra Modern Liquid Glass Experience',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF64748B),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(
            begin: -0.3,
            duration: 1000.ms,
            curve: Curves.elasticOut,
          ),
        );
      },
    );
  }

  Widget _buildFeatureGrid() {
    final features = [
      {
        'title': 'Notlar',
        'subtitle': 'Düşüncelerinizi kaydedin',
        'icon': Icons.edit_note_rounded,
        'primaryColor': const Color(0xFF3B82F6),
        'secondaryColor': const Color(0xFF1D4ED8),
        'screen': const ModernNotesScreen(),
      },
      {
        'title': 'Bütçe',
        'subtitle': 'Para akışınızı takip edin',
        'icon': Icons.account_balance_wallet_rounded,
        'primaryColor': const Color(0xFF10B981),
        'secondaryColor': const Color(0xFF059669),
        'screen': const BudgetScreen(),
      },
      {
        'title': 'QR Kod',
        'subtitle': 'Kod oluştur ve tara',
        'icon': Icons.qr_code_scanner_rounded,
        'primaryColor': const Color(0xFF8B5CF6),
        'secondaryColor': const Color(0xFF7C3AED),
        'screen': const QRScreen(),
      },
      {
        'title': 'Link Kısalt',
        'subtitle': 'URL kısaltma aracı',
        'icon': Icons.link_rounded,
        'primaryColor': const Color(0xFFF59E0B),
        'secondaryColor': const Color(0xFFD97706),
        'screen': const LinkShortenerScreen(),
      },
      {
        'title': 'Dosya Çevir',
        'subtitle': 'Format dönüştürücü',
        'icon': Icons.transform_rounded,
        'primaryColor': const Color(0xFFEF4444),
        'secondaryColor': const Color(0xFFDC2626),
        'screen': const FileConverterScreen(),
      },
      {
        'title': 'Yakında',
        'subtitle': 'Yeni özellikler geliyor',
        'icon': Icons.auto_awesome_rounded,
        'primaryColor': const Color(0xFF6B7280),
        'secondaryColor': const Color(0xFF4B5563),
        'screen': null,
      },
    ];

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final feature = features[index];
          return _buildUltraModernCard(feature, index);
        },
        childCount: features.length,
      ),
    );
  }

  Widget _buildUltraModernCard(Map<String, dynamic> feature, int index) {
    return AnimatedBuilder(
      animation: _cardsController,
      builder: (context, child) {
        final cardOffset = math.sin(_cardsController.value * 2 * math.pi + index * 0.3) * 0.01;
        
        return Transform.scale(
          scale: 1.0 + cardOffset,
          child: LiquidGlassLayer(
            settings: LiquidGlassSettings(
              thickness: 15,
              glassColor: (feature['primaryColor'] as Color).withValues(alpha: 0.08),
              lightIntensity: 2.5,
              blend: 45,
              saturation: 1.2,
              lightness: 1.08,
            ),
            child: Stack(
              children: [
                // Main card glass
                LiquidGlass.inLayer(
                  shape: LiquidRoundedSuperellipse(
                    borderRadius: Radius.circular(28),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: feature['screen'] != null 
                        ? () => _navigateWithGlassTransition(feature['screen'])
                        : null,
                      borderRadius: BorderRadius.circular(28),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withValues(alpha: 0.15),
                              Colors.white.withValues(alpha: 0.08),
                              (feature['primaryColor'] as Color).withValues(alpha: 0.02),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon with liquid glass background
                              LiquidGlass.inLayer(
                                shape: LiquidRoundedSuperellipse(
                                  borderRadius: Radius.circular(20),
                                ),
                                child: Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        feature['primaryColor'] as Color,
                                        feature['secondaryColor'] as Color,
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: (feature['primaryColor'] as Color).withValues(alpha: 0.3),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    feature['icon'] as IconData,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 20),
                              
                              // Title with glass effect
                              Glassify(
                                settings: LiquidGlassSettings(
                                  thickness: 4,
                                  glassColor: Colors.white.withValues(alpha: 0.1),
                                  lightIntensity: 1.8,
                                ),
                                child: Text(
                                  feature['title'] as String,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF1E293B),
                                    fontSize: 18,
                                    letterSpacing: -0.3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                              const SizedBox(height: 8),
                              
                              // Subtitle
                              Text(
                                feature['subtitle'] as String,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF64748B),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Floating accent glass
                Positioned(
                  top: 16,
                  right: 16,
                  child: LiquidGlass.inLayer(
                    shape: LiquidOval(),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            (feature['primaryColor'] as Color).withValues(alpha: 0.6),
                            (feature['secondaryColor'] as Color).withValues(alpha: 0.4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(
            delay: (index * 150).ms,
            duration: 600.ms,
          ).slideY(
            begin: 0.4,
            delay: (index * 150).ms,
            duration: 800.ms,
            curve: Curves.elasticOut,
          ),
        );
      },
    );
  }

  void _navigateWithGlassTransition(Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}