void main() {
  final ogr = {"ad": "Zeynep", "yas": 17, "sinif": "11A"};
  print("Ad: \\$\{ogr[\"ad\"]\} | Yaş: \\$\{ogr[\"yas\"]\}");
  ogr["yas"] = 18; // güncelle
  print("Güncel Yaş: \\$\{ogr[\"yas\"]\}");
}