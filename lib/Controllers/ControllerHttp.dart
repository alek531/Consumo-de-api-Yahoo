import 'package:http/http.dart' as http;

class Request{
  final  String _urlYahoo = 'https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA';
  RequestPost(data, apiUrl) async {
    var apiUrl = _urlYahoo;
    return await http.post(
        Uri.parse(apiUrl),
        body: data
    );
  }
  RequestGet() async {
    return await http.get(
        Uri.parse(_urlYahoo)
    );
  }
}