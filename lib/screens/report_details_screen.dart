import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReportDetailsScreen extends StatefulWidget {
  const ReportDetailsScreen({super.key});

  @override
  _ReportDetailsScreenState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  late final WebViewController _webViewController;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x000FF000))
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            //showProgressDialog(context);
          },
          onPageFinished: (String url) {
            //Navigator.pop(context);
            setState(() {
              isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      //..loadFlutterAsset('assets/index.html');
      ..loadRequest(Uri.parse('https://aorta-mobile.web.app/'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Report'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'CT Scan'),
              Tab(text: 'Measurements'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: const Text('Patient ID: 8029643657160423794'),
                  subtitle: const Row(
                    children: [
                      Text('Age: 54'),
                      SizedBox(width: 16.0),
                      Text('Gender: Male'),
                    ],
                  ),
                  trailing: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 154, 43, 16),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    //color: Colors.deepOrange,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'AAA',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Long Diameter: '),
                          Text('Short Diameter: '),
                          Text('Cross Section Area: '),
                          Text('Slice Index: '),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '53.46 mm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 154, 43, 16),
                              ),
                            ),
                            Text(
                              '46.95 mm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 154, 43, 16),
                              ),
                            ),
                            Text(
                              '1823.56 mm2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '74',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      WebViewWidget(controller: _webViewController),
                      isLoading
                          ? const Padding(
                              padding: EdgeInsets.only(top: 150.0),
                              child: CircularProgressIndicator(),
                            )
                          : const Stack(),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: const Text('Patient ID: 8029643657160423794'),
                  subtitle: const Row(
                    children: [
                      Text('Age: 54'),
                      SizedBox(width: 16.0),
                      Text('Gender: Male'),
                    ],
                  ),
                  trailing: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 154, 43, 16),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    //color: Colors.deepOrange,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'AAA',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Long Diameter: '),
                          Text('Short Diameter: '),
                          Text('Cross Section Area: '),
                          Text('Slice Index: '),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '53.46 mm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 154, 43, 16),
                              ),
                            ),
                            Text(
                              '46.95 mm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 154, 43, 16),
                              ),
                            ),
                            Text(
                              '1823.56 mm2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '74',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showProgressDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 24.0),
            child: const Text(
              "Loading...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
