import 'dart:convert';
import 'package:projeto_teste_guide/Model/ListGeralApiYahoo.dart';

class ControllerFuture{

  static  Future<List<ListGeralApiYahoo>> ApiYaho(request) async {
    var response = await request.RequestGet();
    var dados_json =  json.decode(response.body);
    List<ListGeralApiYahoo> Listdados = [];
    for(var ValJson in dados_json['chart']['result']){
      print('--------------------------- teste ${ValJson}');
      var currency         = ValJson['meta']['currency'];
      var symbol         = ValJson['meta']['symbol'];
      var exchangeName         = ValJson['meta']['exchangeName'];
      var instrumentType         = ValJson['meta']['instrumentType'];
      var firstTradeDate         = ValJson['meta']['firstTradeDate'];
      var gmtoffset         =  ValJson['meta']['gmtoffset'];
      var regularMarketPrice         = ValJson['meta']['regularMarketPrice'];
      var scale         = ValJson['meta']['scale'];
      var previousClose         = ValJson['meta']['previousClose'];
      var chartPreviousClose         = ValJson['meta']['chartPreviousClose'];
      var priceHint         = ValJson['meta']['priceHint'];
      var exchangeTimezoneName = ValJson['meta']['exchangeTimezoneName'];
      var timezone = ValJson['meta']['timezone'];
      var regularMarketTime = ValJson['meta']['regularMarketTime'];
      ListGeralApiYahoo dados = ListGeralApiYahoo(
          currency,
          symbol,
          exchangeName,
          instrumentType,
          firstTradeDate,
          regularMarketTime.toInt(), gmtoffset,
          timezone,
          exchangeTimezoneName, regularMarketPrice.toDouble(),
          chartPreviousClose.toDouble(),
          previousClose.toDouble(),
          scale.toInt(),priceHint.toInt()
      );
      Listdados.add(dados);
    }
    return Listdados;
  }
}