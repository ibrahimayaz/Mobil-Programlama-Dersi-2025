int faktoriyel(int n) {
  var sonuc = 1;
  var i = 1;
  while (i <= n) {
    sonuc *= i;
    i++;
  }
  return sonuc;
}
void main() {
  print(faktoriyel(5)); // 120
}