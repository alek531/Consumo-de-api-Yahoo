import 'package:mobx/mobx.dart';
import 'package:projeto_teste_guide/Controllers/ControllerDataTable.dart';
part 'ControllerEstadoGeral.g.dart';

class ControllerEstadoGeral = ControllerEstadoGeralBase with _$ControllerEstadoGeral;
abstract class ControllerEstadoGeralBase with Store{

  @observable
  ObservableList<ControllerListDataTable> ListDadosApiYahoo =  ObservableList();
}