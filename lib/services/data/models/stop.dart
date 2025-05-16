class Stop {
  final int id;
  final String name;

  const Stop({required this.name, required this.id});

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(name: json['name'], id: json['id' ]);
  }
  Map <String, dynamic> toJson(){
    return {
      'id' : id,
      'name' : name,
    };
  }
}
