import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;
import 'modern_notes_screen.dart';
import 'budget_screen.dart';
import 'qr_screen.dart';
import 'link_shortener_screen.dart';
import 'file_converter_screen.dart';

class UltraModernIOS26Screen extends StatefulWidget {
  const UltraModernIOS26Screen({Key? key}) : super(key: key);

  @override
  State<UltraModernIOS26Screen> createState() => _UltraModernIOS26ScreenState();
}

class _UltraModernIOS26ScreenState extends State<UltraModernIOS26Screen>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _pulseController;
  late AnimationController _floatController;
  late AnimationController _particleController;
  late AnimationController _rotationController;
  late AnimationController _dragRippleController;
  late AnimationController _liquidWaveController;
  late AnimationController _morphController;

  // Reorderable features list
  late List<Map<String, dynamic>> features;
  
  // Drag interaction states
  bool _isDragging = false;
  int? _draggedIndex;
  int? _hoveredIndex;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    
    _particleController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    
    _rotationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();

    // Drag interaction controllers
    _dragRippleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _liquidWaveController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _morphController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Initialize features list
    features = [
      {
        'id': 0,
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
        'id': 1,
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
        'id': 2,
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
        'id': 3,
        'title': 'Link Kısalt',
        'subtitle': 'URL kısaltma aracı',
        'icon': Icons.link_rounded,
        'colors': [const Color(0xFFFF9500), const Color(0xFFFFCC02)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LinkShortenerScreen()),
        ),
      },
      {
        'id': 4,
        'title': 'Format Dönüştürücü',
        'subtitle': 'Dosya formatları dönüştürün',
        'icon': Icons.transform_rounded,
        'colors': [const Color(0xFFFF3B30), const Color(0xFFFF6347)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FileConverterScreen()),
        ),
      },
      {
        'id': 5,
        'title': 'Yeni Özellikler',
        'subtitle': 'Çok yakında...',
        'icon': Icons.auto_awesome_rounded,
        'colors': [const Color(0xFF8E8E93), const Color(0xFFAEAEB2)],
        'onTap': () {},
      },
    ];
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    _particleController.dispose();
    _rotationController.dispose();
    _dragRippleController.dispose();
    _liquidWaveController.dispose();
    _morphController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ultra Modern Animated Background
          _buildAnimatedBackground(),
          
          // Floating Particles
          _buildFloatingParticles(),
          
          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Ultra Modern Header with Complex Glass Effects
                  _buildUltraModernHeader(),
                  
                  const SizedBox(height: 30),
                  
                  // Enhanced Feature Grid
                  Expanded(
                    child: _buildEnhancedFeatureGrid(),
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
      animation: _rotationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(_rotationController.value * 2 * math.pi),
              colors: [
                const Color(0xFF667eea).withOpacity(0.1),
                const Color(0xFFf093fb).withOpacity(0.15),
                const Color(0xFF4facfe).withOpacity(0.1),
                const Color(0xFF00f2fe).withOpacity(0.12),
                const Color(0xFFa8edea).withOpacity(0.08),
              ],
              stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  Colors.transparent,
                  const Color(0xFF667eea).withOpacity(0.05),
                  const Color(0xFFf093fb).withOpacity(0.1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingParticles() {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return Stack(
          children: List.generate(12, (index) {
            final offset = _particleController.value * 2 * math.pi + (index * math.pi / 6);
            return Positioned(
              left: 50 + math.cos(offset) * 30 + (index % 3) * 100,
              top: 100 + math.sin(offset * 0.7) * 50 + (index % 4) * 150,
              child: Container(
                width: 8 + (index % 3) * 4,
                height: 8 + (index % 3) * 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      [
                        const Color(0xFF667eea),
                        const Color(0xFFf093fb),
                        const Color(0xFF4facfe),
                        const Color(0xFF00f2fe),
                      ][index % 4].withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: [
                        const Color(0xFF667eea),
                        const Color(0xFFf093fb),
                        const Color(0xFF4facfe),
                        const Color(0xFF00f2fe),
                      ][index % 4].withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 2000.ms, color: Colors.white.withOpacity(0.3))
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.2, 1.2),
                    duration: 3000.ms,
                  ),
            );
          }),
        );
      },
    );
  }

  Widget _buildUltraModernHeader() {
    return AnimatedBuilder(
      animation: Listenable.merge([_pulseController, _floatController]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, math.sin(_floatController.value * 2 * math.pi) * 8),
          child: LiquidGlass(
            shape: LiquidRoundedSuperellipse(
              borderRadius: Radius.circular(40),
            ),
            settings: LiquidGlassSettings(
              thickness: 12,
              glassColor: Colors.white.withOpacity(0.25),
            ),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.25),
                    Colors.white.withOpacity(0.1),
                    Colors.blue.withOpacity(0.08),
                    Colors.purple.withOpacity(0.12),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: const Offset(0, 15),
                  ),
                  BoxShadow(
                    color: const Color(0xFF667eea).withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: -5,
                    offset: const Offset(-20, -20),
                  ),
                  BoxShadow(
                    color: const Color(0xFFf093fb).withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: -5,
                    offset: const Offset(20, 20),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Animated App Icon
                  Transform.scale(
                    scale: 1 + (_pulseController.value * 0.1),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF667eea),
                            Color(0xFF764ba2),
                            Color(0xFF5856D6),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF5856D6).withOpacity(0.4),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.apps_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 24),
                  
                  // Enhanced Title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFF667eea),
                              Color(0xFFf093fb),
                              Color(0xFF4facfe),
                            ],
                          ).createShader(bounds),
                          child: const Text(
                            'DailyBox',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Hayatınızı kolaylaştırın',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEnhancedFeatureGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.05,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return _buildLiquidGlassDraggableCard(feature, index);
      },
    );
  }

  Widget _buildLiquidGlassDraggableCard(Map<String, dynamic> feature, int index) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _dragRippleController,
        _liquidWaveController,
        _morphController,
        _floatController,
      ]),
      builder: (context, child) {
        // Calculate liquid glass effects based on drag state
        final isDraggedCard = _draggedIndex == index;
        final isHoveredCard = _hoveredIndex == index;
        final rippleEffect = isDraggedCard ? _dragRippleController.value : 0.0;
        final waveEffect = _liquidWaveController.value;
        final morphEffect = isDraggedCard ? _morphController.value : 0.0;
        
        return GestureDetector(
          onLongPressStart: (details) {
            setState(() {
              _isDragging = true;
              _draggedIndex = index;
            });
            
            // Start liquid glass animations
            _dragRippleController.forward();
            _liquidWaveController.repeat();
            _morphController.forward();
            
            // Haptic feedback
            HapticFeedback.mediumImpact();
          },
          onLongPressMoveUpdate: (details) {
            // Liquid glass continues to animate during drag
          },
          onLongPressEnd: (details) {
            setState(() {
              _isDragging = false;
              _draggedIndex = null;
              _hoveredIndex = null;
            });
            
            // Reset animations
            _dragRippleController.reset();
            _liquidWaveController.stop();
            _liquidWaveController.reset();
            _morphController.reverse();
          },
          onTap: () {
            if (!_isDragging) {
              (feature['onTap'] as VoidCallback)();
            }
          },
          child: DragTarget<int>(
            onWillAccept: (draggedIndex) {
              if (draggedIndex != null && draggedIndex != index) {
                setState(() {
                  _hoveredIndex = index;
                });
                return true;
              }
              return false;
            },
            onLeave: (draggedIndex) {
              setState(() {
                _hoveredIndex = null;
              });
            },
            onAccept: (draggedIndex) {
              setState(() {
                final draggedItem = features.removeAt(draggedIndex);
                features.insert(index, draggedItem);
                _hoveredIndex = null;
              });
              HapticFeedback.heavyImpact();
            },
            builder: (context, candidateData, rejectedData) {
              return Transform.translate(
                offset: Offset(
                  math.sin((_floatController.value * 2 * math.pi) + (index * 0.5)) * 
                      (isDraggedCard ? 6 : 3),
                  math.cos((_floatController.value * 2 * math.pi) + (index * 0.7)) * 
                      (isDraggedCard ? 8 : 5),
                ),
                child: Transform.scale(
                  scale: isDraggedCard ? 1.05 + (morphEffect * 0.1) : 
                         isHoveredCard ? 1.02 : 1.0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: isDraggedCard ? 0 : 300),
                    transform: Matrix4.identity()
                      ..rotateZ(isDraggedCard ? morphEffect * 0.05 : 0),
                    child: Stack(
                      children: [
                        // Main liquid glass card
                        LiquidGlass(
                          shape: LiquidRoundedSuperellipse(
                            borderRadius: Radius.circular(32 + (morphEffect * 8)),
                          ),
                          settings: LiquidGlassSettings(
                            thickness: 8 + (rippleEffect * 4),
                            glassColor: Colors.white.withOpacity(
                              0.15 + (isDraggedCard ? rippleEffect * 0.1 : 0)
                            ),
                            blur: 20 + (waveEffect * 10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32 + (morphEffect * 8)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(
                                    isDraggedCard ? 0.3 + (rippleEffect * 0.2) : 0.25
                                  ),
                                  Colors.white.withOpacity(
                                    isDraggedCard ? 0.1 + (rippleEffect * 0.1) : 0.05
                                  ),
                                ],
                                transform: isDraggedCard 
                                    ? GradientRotation(waveEffect * math.pi * 2)
                                    : null,
                              ),
                              border: Border.all(
                                color: isHoveredCard 
                                    ? Colors.blue.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.3),
                                width: isHoveredCard ? 2 : 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: (feature['colors'] as List<Color>)[0].withOpacity(
                                    isDraggedCard ? 0.4 + (rippleEffect * 0.3) : 0.2
                                  ),
                                  blurRadius: isDraggedCard ? 25 + (rippleEffect * 15) : 15,
                                  spreadRadius: isDraggedCard ? 4 + (rippleEffect * 2) : 2,
                                  offset: Offset(0, isDraggedCard ? 15 + (morphEffect * 5) : 12),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                            child: _buildCardContent(feature, index, isDraggedCard, rippleEffect),
                          ),
                        ),
                        
                        // Ripple effect overlay when dragging
                        if (isDraggedCard) _buildRippleEffect(rippleEffect),
                        
                        // Wave distortion effect
                        if (isDraggedCard) _buildWaveDistortion(waveEffect),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCardContent(Map<String, dynamic> feature, int index, bool isDragged, double rippleEffect) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Enhanced Icon with liquid glass morphing
        AnimatedContainer(
          duration: Duration(milliseconds: isDragged ? 0 : 300),
          width: 60 + (isDragged ? rippleEffect * 8 : 0),
          height: 60 + (isDragged ? rippleEffect * 8 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18 + (isDragged ? rippleEffect * 6 : 0)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: feature['colors'] as List<Color>,
            ),
            boxShadow: [
              BoxShadow(
                color: (feature['colors'] as List<Color>)[0].withOpacity(
                  isDragged ? 0.6 + (rippleEffect * 0.3) : 0.4
                ),
                blurRadius: isDragged ? 25 + (rippleEffect * 10) : 20,
                offset: Offset(0, isDragged ? 12 + (rippleEffect * 3) : 8),
              ),
            ],
          ),
          child: Icon(
            feature['icon'] as IconData,
            color: Colors.white,
            size: 28 + (isDragged ? rippleEffect * 4 : 0),
          ),
        )
            .animate(target: isDragged ? 1 : 0)
            .shimmer(
              duration: 1000.ms,
              color: Colors.white.withOpacity(0.6),
            )
            .scale(
              begin: const Offset(1, 1),
              end: Offset(1.1 + (rippleEffect * 0.2), 1.1 + (rippleEffect * 0.2)),
              duration: 800.ms,
            ),
        
        const SizedBox(height: 16),
        
        // Enhanced Title with liquid distortion
        AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: isDragged ? 0 : 300),
          style: TextStyle(
            fontSize: 18 + (isDragged ? rippleEffect * 2 : 0),
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            letterSpacing: -0.5 + (isDragged ? rippleEffect * 0.3 : 0),
          ),
          child: Text(
            feature['title'] as String,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
        const SizedBox(height: 6),
        
        // Enhanced Subtitle with morphing effect
        AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: isDragged ? 0 : 300),
          style: TextStyle(
            fontSize: 13 + (isDragged ? rippleEffect : 0),
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
          child: Text(
            feature['subtitle'] as String,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildRippleEffect(double rippleValue) {
    return Positioned.fill(
      child: CustomPaint(
        painter: RipplePainter(
          rippleValue: rippleValue,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildWaveDistortion(double waveValue) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: CustomPaint(
          painter: WaveDistortionPainter(
            waveValue: waveValue,
            color: Colors.blue.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}

// Custom Painters for liquid glass effects
class RipplePainter extends CustomPainter {
  final double rippleValue;
  final Color color;

  RipplePainter({required this.rippleValue, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.sqrt(size.width * size.width + size.height * size.height) / 2;

    // Draw multiple ripple circles
    for (int i = 0; i < 3; i++) {
      final rippleRadius = maxRadius * rippleValue + (i * 20);
      final rippleOpacity = (1.0 - rippleValue) * (1.0 - i * 0.3);
      
      if (rippleOpacity > 0) {
        paint.color = color.withOpacity(rippleOpacity * 0.3);
        canvas.drawCircle(center, rippleRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class WaveDistortionPainter extends CustomPainter {
  final double waveValue;
  final Color color;

  WaveDistortionPainter({required this.waveValue, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Create wave distortion effect
    for (double x = 0; x <= size.width; x += 2) {
      final y = size.height / 2 + 
          math.sin((x / size.width * 4 * math.pi) + (waveValue * 2 * math.pi)) * 
          (20 * waveValue);
      
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}