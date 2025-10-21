void main() {
  var sonuc = puanYorum(84);
  print(sonuc);
}

String puanYorum(double p) {
  if (p >= 85) {
    return "Çok İyi";
  } else if (p >= 70) {
    return "İyi";
  } else if (p >= 50) {
    return "Geçti";
  } else {
    return """Kaldı""";
  }
}
