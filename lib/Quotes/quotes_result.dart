import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class QuotesResult extends StatefulWidget {
  final String categname;

  QuotesResult(this.categname);

  @override
  State<QuotesResult> createState() => _QuotesResultState();
}

class _QuotesResultState extends State<QuotesResult> {
  List quotes = [];
  List authors = [];

  bool isData = false;

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  getQuote() async {
    String url = "https://quotes.toscrape.com/tag/${widget.categname}/";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    dom.Document document = parser.parse(response.body);
    final quotesclass = document.getElementsByClassName("quote");
    quotes = quotesclass
        .map((element) => element.getElementsByClassName('text')[0].innerHtml)
        .toList();
    authors = quotesclass
        .map((element) => element.getElementsByClassName('author')[0].innerHtml)
        .toList();

    setState(() {
      isData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categname} quotes".toUpperCase()),
      ),
      body: isData
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ListTile(
                        title: Text(quotes[index]),
                        subtitle: Text(authors[index])),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
