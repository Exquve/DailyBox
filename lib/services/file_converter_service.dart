import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class FileConverterService {
  static Future<String> imagesToPdf(List<File> imageFiles, String fileName) async {
    final pdf = pw.Document();

    for (final imageFile in imageFiles) {
      final imageBytes = await imageFile.readAsBytes();
      final image = pw.MemoryImage(imageBytes);
      
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(image, fit: pw.BoxFit.contain),
            );
          },
        ),
      );
    }

    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/$fileName.pdf');
    await file.writeAsBytes(await pdf.save());
    
    return file.path;
  }

  static Future<List<File>> splitPdfToImages(File pdfFile) async {
    // This is a placeholder implementation
    // In a real app, you would use a PDF processing library
    throw UnimplementedError('PDF to images conversion not implemented');
  }

  static List<String> getSupportedImageFormats() {
    return ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
  }

  static bool isImageFile(String path) {
    final extension = path.split('.').last.toLowerCase();
    return getSupportedImageFormats().contains(extension);
  }

  static bool isPdfFile(String path) {
    return path.toLowerCase().endsWith('.pdf');
  }

  static String getFileSize(File file) {
    final bytes = file.lengthSync();
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}