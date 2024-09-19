import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewerCachedFromUrl extends StatelessWidget {
  final String url;
  const PdfViewerCachedFromUrl({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pdf View'),
      ),
      body:  PDF(
            enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          debugPrint('viewerError ${error.toString()}');
        },
        onPageError: (page, error) {
          debugPrint('$page: ${error.toString()}');
        },
        onPageChanged: (int? page, int? total) {
          debugPrint('page change: $page/$total');
        },
      ).cachedFromUrl(url,
          placeholder: (progress) => const Center(child: CircularProgressIndicator(color: Colors.purple)),
          errorWidget: (error) => Center(
            child: Text("Error :${error.toString()}"),
          ))
    );
  }
}
