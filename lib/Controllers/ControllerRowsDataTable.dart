import 'package:projeto_teste_guide/Controllers/ControllerDataTable.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:flutter/material.dart';

class ControllerRowsDataTable extends DataGridSource {
  ControllerRowsDataTable({required List<ControllerListDataTable> employees}) {
    dataGridRows = employees.map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<dynamic>(columnName: 'dia', value: dataGridRow.dia),
      DataGridCell<dynamic>(columnName: 'data', value: dataGridRow.data),
      DataGridCell<dynamic>(columnName: 'valor', value: dataGridRow.valor),
      DataGridCell<dynamic>(columnName: 'variacao', value: dataGridRow.variacao),
      DataGridCell<dynamic>(columnName: 'variacaoData', value: dataGridRow.variacaoData),
    ])).toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
}


