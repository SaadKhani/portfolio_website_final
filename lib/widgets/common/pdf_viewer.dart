import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class PdfViewer extends StatefulWidget {
  final String assetPath;

  const PdfViewer({super.key, required this.assetPath});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();

    _viewType = 'pdf-viewer-${DateTime.now().microsecondsSinceEpoch}';

    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final iframe = web.HTMLIFrameElement()
        ..src = widget.assetPath
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%';

      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF252B36)),
      ),
      clipBehavior: Clip.antiAlias,
      child: HtmlElementView(viewType: _viewType),
    );
  }
}
