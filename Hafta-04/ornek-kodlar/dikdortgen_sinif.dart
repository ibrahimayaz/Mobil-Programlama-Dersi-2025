class Dikdortgen {
  int en;
  int boy;
  Dikdortgen(this.en, this.boy);
  int alan() {
    return en * boy;
  }
  int cevre() {
    return 2 * (en + boy);
  }
}
void main() {
  var d = Dikdortgen(5, 8);
  print("Alan: \\${d.alan()}");
  print("Çevre: \\${d.cevre()}");
}