void main() {
  var isimler = ["Ali", "Ayşe", "Zeynep", "Mert"];
  var aranan = "Ayşe";
  var bulundu = false;
  for (var isim in isimler) {
    if (isim == aranan) {
      bulundu = true;
      break;
    }
  }
  print(bulundu ? "\$aranan listede var." : "\$aranan listede yok.");
}