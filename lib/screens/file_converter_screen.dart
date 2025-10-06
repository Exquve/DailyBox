import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'dart:io';

class FileConverterScreen extends StatefulWidget {
  const FileConverterScreen({super.key});

  @override
  State<FileConverterScreen> createState() => _FileConverterScreenState();
}

class _FileConverterScreenState extends State<FileConverterScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedInputFormat = 'PDF';
  String _selectedOutputFormat = 'DOCX';
  File? _selectedFile;
  bool _isConverting = false;
  final List<String> _conversionHistory = [];

  final List<String> _imageFormats = ['JPG', 'PNG', 'WEBP', 'BMP', 'GIF'];
  final List<String> _documentFormats = ['PDF', 'DOCX', 'TXT', 'RTF'];
  final List<String> _videoFormats = ['MP4', 'AVI', 'MOV', 'MKV'];
  final List<String> _audioFormats = ['MP3', 'WAV', 'AAC', 'FLAC'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0: // Image
            _selectedInputFormat = 'JPG';
            _selectedOutputFormat = 'PNG';
            break;
          case 1: // Document
            _selectedInputFormat = 'PDF';
            _selectedOutputFormat = 'DOCX';
            break;
          case 2: // Video
            _selectedInputFormat = 'MP4';
            _selectedOutputFormat = 'AVI';
            break;
          case 3: // Audio
            _selectedInputFormat = 'MP3';
            _selectedOutputFormat = 'WAV';
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Format Dönüştürücü',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFFF3B30),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              tabs: const [
                Tab(text: 'Resim'),
                Tab(text: 'Döküman'),
                Tab(text: 'Video'),
                Tab(text: 'Ses'),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildConverterTab(_imageFormats, 'Resim', Icons.image),
                _buildConverterTab(_documentFormats, 'Döküman', Icons.description),
                _buildConverterTab(_videoFormats, 'Video', Icons.video_library),
                _buildConverterTab(_audioFormats, 'Ses', Icons.audiotrack),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConverterTab(List<String> formats, String title, IconData icon) {
    // Ensure selected formats are valid for current tab
    String validInputFormat = formats.contains(_selectedInputFormat) 
        ? _selectedInputFormat 
        : formats.first;
    String validOutputFormat = formats.contains(_selectedOutputFormat) 
        ? _selectedOutputFormat 
        : (formats.length > 1 ? formats[1] : formats.first);
        
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Main Converter Card
          LiquidGlass(
            shape: LiquidRoundedSuperellipse(
              borderRadius: Radius.circular(24),
            ),
            settings: LiquidGlassSettings(
              thickness: 6,
              glassColor: Colors.white.withOpacity(0.1),
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF3B30).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icon,
                          color: const Color(0xFFFF3B30),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$title Dönüştürücü',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              '$title dosyalarını dönüştürün',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // File Selection
                  GestureDetector(
                    onTap: () => _pickFile(),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[50],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _selectedFile != null ? Icons.check_circle : Icons.cloud_upload,
                              size: 40,
                              color: _selectedFile != null ? Colors.green : Colors.grey[500],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _selectedFile != null 
                                  ? 'Dosya seçildi' 
                                  : 'Dosya seçmek için tıklayın',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (_selectedFile != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                _selectedFile!.path.split('/').last,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Format Selection
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kaynak Format',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildFormatDropdown(
                              formats,
                              validInputFormat,
                              (value) => setState(() => _selectedInputFormat = value!),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF3B30).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFFF3B30),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hedef Format',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildFormatDropdown(
                              formats,
                              validOutputFormat,
                              (value) => setState(() => _selectedOutputFormat = value!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Convert Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (_selectedFile != null && !_isConverting) 
                          ? _convertFile 
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF3B30),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: _isConverting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Dönüştür',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // History Section
          if (_conversionHistory.isNotEmpty) ...[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Dönüştürme Geçmişi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _conversionHistory.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[200],
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          _conversionHistory[index],
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          'Başarıyla dönüştürüldü',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.share, size: 20),
                          onPressed: () => _shareFile(_conversionHistory[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
          
          // Info Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.orange[100]!),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.orange[600]),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Dosya dönüştürme işlemleri cihazınızda güvenli bir şekilde gerçekleştirilir.',
                    style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormatDropdown(
    List<String> formats,
    String selectedValue,
    void Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox(),
        items: formats.map((format) {
          return DropdownMenuItem(
            value: format,
            child: Text(
              format,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _pickFile() {
    HapticFeedback.lightImpact();
    // Simulate file picking
    setState(() {
      _selectedFile = File('/simulated/path/document.pdf');
    });
    _showSnackBar('Dosya seçildi');
  }

  void _convertFile() {
    setState(() {
      _isConverting = true;
    });
    
    // Simulate conversion
    Future.delayed(const Duration(seconds: 2), () {
      final conversionResult = '$_selectedInputFormat → $_selectedOutputFormat dönüştürme tamamlandı';
      
      setState(() {
        _isConverting = false;
        _conversionHistory.insert(0, conversionResult);
        
        // Keep only last 10 items
        if (_conversionHistory.length > 10) {
          _conversionHistory.removeLast();
        }
      });
      
      HapticFeedback.lightImpact();
      _showSnackBar('Dönüştürme başarılı!');
    });
  }

  void _shareFile(String fileName) {
    HapticFeedback.lightImpact();
    _showSnackBar('Dosya paylaşıldı');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}