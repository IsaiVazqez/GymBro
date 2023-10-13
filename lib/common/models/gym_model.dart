class Gym {
  final String id;
  final String nombre;
  final String imagen;
  final String direccion;

  Gym(
      {required this.id,
      required this.nombre,
      required this.imagen,
      required this.direccion});

  static List<Gym> fromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((data) => Gym(
              id: data['id'],
              nombre: data['Nombre'],
              imagen: data['Imagen'],
              direccion: data['Dirección'],
            ))
        .toList();
  }
}
