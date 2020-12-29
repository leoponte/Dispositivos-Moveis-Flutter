class Math {
  String id;
  bool matBasica1;
  bool matBasica2;
  bool matBasica3;
  bool matBasica4;
  bool matBasica5;
  bool matBasica6;
  bool matBasica7;
  bool matBasica8;

  Math(
      {this.id,
      this.matBasica1,
      this.matBasica2,
      this.matBasica3,
      this.matBasica4,
      this.matBasica5,
      this.matBasica6,
      this.matBasica7,
      this.matBasica8});

  Math.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.matBasica1 = map["matBasica1"];
    this.matBasica2 = map["matBasica2"];
    this.matBasica3 = map["matBasica3"];
    this.matBasica4 = map["matBasica4"];
    this.matBasica5 = map["matBasica5"];
    this.matBasica6 = map["matBasica6"];
    this.matBasica7 = map["matBasica7"];
    this.matBasica8 = map["matBasica8"];
  }
}
