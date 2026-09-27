import 'package:flutter/material.dart';
import 'package:movies_app/model/cinema_model.dart';

class CinemaViewModel with ChangeNotifier {
  List<CinemaModel> _cinemas = [];

  List<CinemaModel> get cinemas => _cinemas;

  Future<void> fetchCinema() async {
    try {
      _cinemas = [
        CinemaModel(
          name: 'CGV Transmart Cempaka Putih',
          address: 'Jl. Jenderal Ahmad Yani No.83, RT.10/RW.7, Cemp. Putih Tim., Kec. Cemp. Putih, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10510',
          latitude: -6.1687239,
          longitude: 106.8767546,
        ),
        CinemaModel(
          name: 'XXI Kelapa Gading',
          address: 'Jl. Boulevard Raya, RT.13/RW.18, Klp. Gading Tim., Kec. Klp. Gading, Jkt Utara, Daerah Khusus Ibukota Jakarta 14240',
          latitude: -6.158501,
          longitude: 106.908165,
        ),
        CinemaModel(
          name: 'CGV Grand Indonesia',
          address: 'Grand Indonesia, West Mall Building, Jl. M.H. Thamrin No.1 8th Floor, Kb. Melati, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10230',
          latitude: -6.1947481,
          longitude: 106.8197044,
        ),
      ];

      notifyListeners();
    } catch (e) {
      print('Error fetching cinema: $e');
    }
  }
}
