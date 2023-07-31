enum Dosage {
  drops(1, "Drops"),
  pillQuantity(2, "Pills"),
  ml(3, "ml"),
  mg(4, "mg");

  const Dosage(this.value, this.description);

  final int value;
  final String description;
}
