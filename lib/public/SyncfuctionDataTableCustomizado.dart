import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
class SyncfuctionDataTableCustomizado extends StatelessWidget {


  final DataGridSource source;

  SyncfuctionDataTableCustomizado(this.source);

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: this.source,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'id',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                child: Text(
                  'ID',
                ))),
        GridColumn(
            columnName: 'name',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text('Name'))),
        GridColumn(
            columnName: 'designation',
            width: 120,
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text('Designation'))),
        GridColumn(
            columnName: 'salary',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                child: Text('Salary'))),
      ],
    );
  }
}
