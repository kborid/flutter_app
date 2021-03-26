import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class WebViewPage extends StatefulWidget {
  var title, url;

  WebViewPage(this.url, [this.title]);

  @override
  State<StatefulWidget> createState() {
    return WebViewWidgetState(this.url, this.title);
  }
}

class WebViewWidgetState extends State<WebViewPage>
    with SingleTickerProviderStateMixin {
  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

  TabController controller;
  var choiceIndex = 0;
  var title = '', url = 'http://www.baidu.com';

  WebViewWidgetState(this.url, [this.title]);

  //获取h5页面标题
  Future<String> getWebTitle2() async {
    String script = 'window.document.title';
    var title = await flutterWebViewPlugin.evalJavascript(script);
    setState(() {
      this.title = title;
      print('####################   $title');
    });
  }

  //获取h5页面标题
  Future<String> getWebTitle({String url}) async {
    var client = http.Client();
    client.get(Uri.parse(url)).then((response) {
      String title = RegExp(
              r"<[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}(\s.*)?>([^<]*)</[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}>")
          .stringMatch(response.body);
      if (title != null) {
        title = title.substring(title.indexOf('>') + 1, title.lastIndexOf("<"));
      } else {
        title = "";
      }
      print("####################  " + title);
    }).catchError((error) {
      print(error);
      getWebTitle2();
    }).whenComplete(
      client.close,
    );
  }

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onStateChanged
        .listen((WebViewStateChanged webViewState) async {
      switch (webViewState.type) {
        case WebViewState.finishLoad:
          handleJs();
          getWebTitle();
          break;
        case WebViewState.shouldStart:
          break;
        case WebViewState.startLoad:
          break;
        case WebViewState.abortLoad:
          break;
      }
    });

    /**
     * 监听页面加载url
     */
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      print("########### url=" + url);
      this.url = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            flutterWebViewPlugin.canGoBack().then((can) {
              if (can) {
                flutterWebViewPlugin.goBack();
              } else {
                Navigator.pop(context);
              }
            });
          },
        ),
      ),
      scrollBar: false,
      withZoom: false,
      url: url,
    );
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  void handleJs() {
    flutterWebViewPlugin.evalJavascript("abc($title)").then((result) {});
  }
}
