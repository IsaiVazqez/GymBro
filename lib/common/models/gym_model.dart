class Gym {
  final String id;
  final String nombre;
  final String imagen;
  final String direccion;
  final String descripcion;
  final double calificacion;

  Gym({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.direccion,
    required this.descripcion,
    required this.calificacion,
  });

  static List<Gym> fromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((data) => Gym(
              id: data['Id'],
              nombre: data['Nombre'] ?? '',
              imagen: data['Imagen'] ?? '',
              direccion: data['Direccion'] ?? '',
              descripcion: data['Descripcion'] ?? '',
              calificacion: double.parse(data['Calificacion'] ?? '0.0'),
            ))
        .toList();
  }
}
