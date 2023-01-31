import 'package:drift/drift.dart';

class MedicationReminder extends Table {
  TextColumn get id => text().named('ID')();
  TextColumn get medicationId => text().named('MEDICATION_ID')();
  RealColumn get dosage => real().nullable().named('DOSAGE')();
  IntColumn get pillTime => integer().nullable().named('PILL_TIME')();
  IntColumn get dtStart => integer().nullable().named('DT_START')();
  IntColumn get dtEnd => integer().nullable().named('DT_END')();
  IntColumn get qtComplete => integer().nullable().named('QT_COMPLETE')();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
