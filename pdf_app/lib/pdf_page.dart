import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_app/pdf_preview_screen.dart';

class PdfPage extends StatelessWidget {
  final pdf = pw.Document();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool hasContent = false; // Track if content has been added

  PdfPage({Key? key}) : super(key: key);

  // Check if the document has content
  bool isPdfEmpty() {
    return !hasContent;
  }

  writeOnPdf() {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('PDF Viewer', textScaleFactor: 2),
                    ])),
            pw.Header(level: 1, text: 'What is Lorem Ipsum?'),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. '),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. '),
            pw.Header(level: 1, text: 'This is Header'),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Consectetur adipiscing elit duis tristique sollicitudin nibh sit. '),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Consectetur adipiscing elit duis tristique sollicitudin nibh sit. '),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.TableHelper.fromTextArray(
                context: context,
                data: const <List<String>>[
                  <String>['Year', 'Sample'],
                  <String>['SN0', 'GFG1'],
                  <String>['SN1', 'GFG2'],
                  <String>['SN2', 'GFG3'],
                  <String>['SN3', 'GFG4'],
                ]),
          ];
        },
      ),
    );
    hasContent = true;
  }

  Future<void> savePdf(BuildContext context) async {
    try {
      if (isPdfEmpty()) {
        // If the document is empty, build it
        writeOnPdf();
      }

      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      File file = File("$documentPath/example.pdf");

      if (file.existsSync()) {
        file.deleteSync(); // Delete the existing file if it exists
      }

      List<int> bytes = await pdf.save();
      await file.writeAsBytes(bytes);

      print("File saved successfully");

      String fullPath = "$documentPath/example.pdf";
      print(fullPath);

      Navigator.push(
        scaffoldKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => PdfPreviewScreen(path: fullPath),
        ),
      );
    } catch (error) {
      print("Error saving PDF: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Geeksforgeeks"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blueGrey,
                child: const Text(
                  'Preview PDF',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  writeOnPdf();
                  await savePdf(context);

                  Directory documentDirectory =
                      await getApplicationDocumentsDirectory();

                  String documentPath = documentDirectory.path;

                  String fullPath = "$documentPath/example.pdf";
                  print(fullPath);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
