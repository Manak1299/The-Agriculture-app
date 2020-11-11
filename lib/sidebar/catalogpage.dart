import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
    int _actualPageNumber = 1, _allPagesCount = 0;
    bool isSampleDoc = true;
    PdfController _pdfController;

    @override
    void initState() {
      _pdfController = PdfController(
        document: PdfDocument.openAsset('assets/manak_resume.pdf'),
      );
      super.initState();
    }

    @override
    void dispose() {
      _pdfController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context, false);  },),
         centerTitle: true,
          title: Text('Catalog Page'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.navigate_before),
              onPressed: () {
                _pdfController.previousPage(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 100),
                );
              },
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '$_actualPageNumber/$_allPagesCount',
                style: TextStyle(fontSize: 22),
              ),
            ),
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                _pdfController.nextPage(
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 100),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                if (isSampleDoc) {
                  _pdfController.loadDocument(
                      PdfDocument.openAsset('assets/manak_resume.pdf'));
                } else {
                  _pdfController.loadDocument(
                      PdfDocument.openAsset('assets/manak_resume.pdf'));
                }
                isSampleDoc = !isSampleDoc;
              },
            )
          ],
        ),
        body: PdfView(
          documentLoader: Center(child: CircularProgressIndicator()),
          pageLoader: Center(child: CircularProgressIndicator()),
          controller: _pdfController,
          onDocumentLoaded: (document) {
            setState(() {
              _actualPageNumber = 1;
              _allPagesCount = document.pagesCount;
            });
          },
          onPageChanged: (page) {
            setState(() {
              _actualPageNumber = page;
            });
          },
        ),
      ),
    );
  }

