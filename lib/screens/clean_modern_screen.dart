import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'modern_notes_screen.dart';
import 'budget_screen.dart';
import 'qr_screen.dart';
import 'link_shortener_screen.dart';
import 'file_converter_screen.dart';

class CleanModernScreen extends StatefulWidget {
  const CleanModernScreen({Key? key}) : super(key: key);

  @override
  State<CleanModernScreen> createState() => _CleanModernScreenState();
}

class _CleanModernScreenState extends State<CleanModernScreen> {
  List<Map<String, dynamic>> features = [
    {
      'id': 0,
      'title': 'Notlar',
      'subtitle': 'Düşüncelerinizi kaydedin',
      'icon': Icons.edit_note_rounded,
      'color': const Color(0xFF007AFF),
      'onTap': () {},
    },
    {
      'id': 1,
      'title': 'Bütçe',
      'subtitle': 'Para akışını takip edin',
      'icon': Icons.account_balance_wallet_rounded,
      'color': const Color(0xFF34C759),
      'onTap': () {},
    },
    {
      'id': 2,
      'title': 'QR Kod',
      'subtitle': 'Kod oluştur ve tara',
      'icon': Icons.qr_code_scanner_rounded,
      'color': const Color(0xFF5856D6),
      'onTap': () {},
    },
    {
      'id': 3,
      'title': 'Link Kısalt',
      'subtitle': 'URL kısaltma aracı',
      'icon': Icons.link_rounded,
      'color': const Color(0xFFFF9500),
      'onTap': () {},
    },
    {
      'id': 4,
      'title': 'Format Dönüştürücü',
      'subtitle': 'Dosya formatları',
      'icon': Icons.transform_rounded,
      'color': const Color(0xFFFF3B30),
      'onTap': () {},
    },
    {
      'id': 5,
      'title': 'Yeni Özellikler',
      'subtitle': 'Çok yakında...',
      'icon': Icons.auto_awesome_rounded,
      'color': const Color(0xFF8E8E93),
      'onTap': () {},
    },
  ];

  @override
  void initState() {
    super.initState();
    _setupNavigationCallbacks();
  }

  void _setupNavigationCallbacks() {
    features[0]['onTap'] = () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ModernNotesScreen()),
    );
    features[1]['onTap'] = () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BudgetScreen()),
    );
    features[2]['onTap'] = () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRScreen()),
    );
    features[3]['onTap'] = () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LinkShortenerScreen()),
    );
    features[4]['onTap'] = () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FileConverterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Simple Header with minimal liquid glass
            SliverToBoxAdapter(
              child: _buildCleanHeader(),
            ),
            
            // Feature Grid
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildCleanFeatureCard(index),
                  childCount: features.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCleanHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(
          borderRadius: Radius.circular(24),
        ),
        settings: LiquidGlassSettings(
          thickness: 8,
          glassColor: Colors.white.withOpacity(0.2),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF667eea).withOpacity(0.8),
                const Color(0xFF764ba2).withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.apps_rounded,
                  color: Colors.white,
                  size: 28,
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
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Hayatınızı kolaylaştırın',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCleanFeatureCard(int index) {
    final feature = features[index];
    
    return LongPressDraggable<int>(
      data: index,
      feedback: Material(
        color: Colors.transparent,
        child: Transform.scale(
          scale: 1.05,
          child: _buildCardContent(feature, isDragging: true),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _buildCardContent(feature),
      ),
      child: DragTarget<int>(
        onWillAccept: (data) => data != null && data != index,
        onAccept: (draggedIndex) {
          setState(() {
            if (draggedIndex > index) {
              features.insert(index, features.removeAt(draggedIndex));
            } else {
              features.insert(index, features.removeAt(draggedIndex));
            }
          });
          HapticFeedback.lightImpact();
        },
        builder: (context, candidateData, rejectedData) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: candidateData.isNotEmpty
                  ? Border.all(color: Colors.blue, width: 2)
                  : null,
            ),
            child: _buildCardContent(feature),
          );
        },
      ),
    );
  }

  Widget _buildCardContent(Map<String, dynamic> feature, {bool isDragging = false}) {
    return GestureDetector(
      onTap: feature['onTap'],
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDragging ? 0.2 : 0.08),
              blurRadius: isDragging ? 20 : 10,
              offset: Offset(0, isDragging ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: (feature['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                feature['icon'],
                color: feature['color'],
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              feature['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              feature['subtitle'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}