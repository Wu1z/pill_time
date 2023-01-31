import 'package:drift/drift.dart';

class Medication extends Table {
  TextColumn get id => text().named('ID')();
  TextColumn get name => text().nullable().named('NAME')();
  IntColumn get quantity => integer().nullable().named('QUANTITY')();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
