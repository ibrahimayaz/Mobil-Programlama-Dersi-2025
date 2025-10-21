void main() {
  print(notHesapla(80, 75));
}
String notHesapla(double v, double f) {
  var ort = v * 0.4 + f * 0.6;
  String harfNotu = "";
  if (ort >= 90 && ort <= 100) {
    harfNotu = "AA";
  } else if (ort >= 80 && ort < 90) {
    harfNotu = "BA";
  } else if (ort >= 70 && ort < 80) {
    harfNotu = "BB";
  } else if (ort >= 60 && ort < 70) {
    harfNotu = "CC";
  } else {
    harfNotu = "FF";
  }
  return "Ortalamanız: $ort Harf Notunuz:$harfNotu";
}
