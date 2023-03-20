import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_teste_guide/Controllers/ControllerChartData.dart';
import 'package:projeto_teste_guide/Controllers/ControllerDataTable.dart';
import 'package:projeto_teste_guide/Controllers/ControllerFutures.dart';
import 'package:projeto_teste_guide/Controllers/ControllerHttp.dart';
import 'package:projeto_teste_guide/Controllers/ControllerModificacaoEstados/ControllerEstadoGeral.dart';
import 'package:projeto_teste_guide/Controllers/ControllerRowsDataTable.dart';
import 'package:intl/intl.dart';
import 'package:projeto_teste_guide/public/AppBarCustomizado.dart';
import 'package:projeto_teste_guide/public/TextoCustomizado.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Request _request = Request();
  ControllerEstadoGeral controllerGeral = ControllerEstadoGeral();

  late List<ControllerListDataTable> ListDadoParaDataTable = [];
  late List<ControllerChartData> data;
  late List<ControllerChartData> dadosData;

  /** Buscando dados para popular data table */
  _BuscandoDadosParaPopularODataTable() async {
    /**Todas as vezes que a aplicação iniciar irá limpar os dados e posteriormente
     * irá preenchelo após receber todos os dados da api */
    controllerGeral.ListDadosApiYahoo.clear();
    dadosData.clear();
    var dados = await ControllerFuture.ApiYaho(_request);
    for (var item in dados) {
      int timestamp = item.regularMarketTime;
      DateTime data = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
      var now = DateTime.now();
      var formatter = DateFormat('dd/MM/yyyy');
      String formattedDate = formatter.format(data);

      /**Trata valores valores*/
      dynamic  variacaoD1 = (item.regularMarketTime * 10) / 100;
      dynamic variacaodata = (item.regularMarketTime * item.chartPreviousClose) / 100;
      double convrtedNumber  = (variacaodata / 10000000).roundToDouble() / 100;
      double convertedNumber = (variacaoD1 / 10000000).roundToDouble() / 100;

      ControllerListDataTable novoItem = ControllerListDataTable(
          formatter.format(now) ,formattedDate, item.regularMarketPrice,convertedNumber.toStringAsFixed(2).replaceAll('.', ','),
          convrtedNumber.toStringAsFixed(2).replaceAll('.', ','));
          controllerGeral.ListDadosApiYahoo.add(
          novoItem
      );

      dadosData.add(
        ControllerChartData('Variacao', double.parse(item.regularMarketPrice.toStringAsFixed(2)))
      );
    }
  }

  /** Grafico dinamico */
  _HabilitarGraficoDeVariacoes(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              insetPadding: EdgeInsets.zero,
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextoCustomizado('Resultado da variação', TextStyle(
                            fontSize: 13
                        )),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10)
                            ,child: Icon(Icons.close, size: 25,),)
                        )
                      ],
                    ),
                    Expanded(flex: 12,child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                      series: <ChartSeries<ControllerChartData, String>>[
                        ColumnSeries<ControllerChartData, String>(
                            dataSource: dadosData,
                            xValueMapper: (_chartData, _) => _chartData.x,
                            yValueMapper: (_chartData, _) => _chartData.y,
                            name: 'Gold',
                            color: Color.fromRGBO(8, 142, 255, 1)
                        )
                      ],
                    )),

                    Flexible(child: FractionallySizedBox(
                      widthFactor: .90,
                      child: ElevatedButton.icon(
                        label: Text('Fechar', style: TextStyle(color: Colors.white),),
                        icon: Icon(Icons.close,color: Colors.white,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            elevation: 0,
                            visualDensity: VisualDensity.comfortable,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                          //elevated btton background color
                        ),
                      ),
                    ))
                ]
             )
          ));
        }
    );
  }

  @override
  void initState() {
    dadosData = [
      ControllerChartData('CHN', 131),
    ];
    _BuscandoDadosParaPopularODataTable();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return AppBarCustomizado(
        container: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
             TextoCustomizado('Consumo de api, Yahoo Finance',
             TextStyle(fontSize: 14)),
             /** Data table dinamico */
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 280,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Observer(builder: (_){
                  return controllerGeral.ListDadosApiYahoo.isEmpty ?
                      Center(child: CircularProgressIndicator(),)
                      : SfDataGrid(
                        source: ControllerRowsDataTable(employees: controllerGeral.ListDadosApiYahoo ),
                        columns: <GridColumn>[
                          GridColumn(
                              columnName: 'Dia',
                              label: Container(
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Dia',
                                  ))),
                          GridColumn(
                              columnName: 'Data',
                              label: Container(
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text('Data'))),
                          GridColumn(
                              columnName: 'Valor',
                              label: Container(
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Valor',
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'Variação D-1',
                              label: Container(
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text('Variação D-1'))),

                          GridColumn(
                              columnName: 'Variação Data',
                              label: Container(
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: Text('Variação Data'))),
                        ],
                      );
                })
              )
            ],
          ),
        ),
        risizescrool: true, onpressed: () {
          /** Habilitar visualização de grafico*/
          _HabilitarGraficoDeVariacoes();
        },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}



