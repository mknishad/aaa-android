class Measurement {
  num distance;
  num trvDiam;
  num apDiam;

  Measurement(this.distance, this.trvDiam, this.apDiam);

  Measurement.fromJson(Map<String, dynamic> map)
      : this(map['distance'], map['trvDiam'], map['apDiam']);
}
