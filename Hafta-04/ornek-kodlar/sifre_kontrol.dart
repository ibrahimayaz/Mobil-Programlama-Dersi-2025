bool dogruMu(String kullanici, String sifre) {
  const k = "admin";
  const s = "1234";
  return (kullanici == k && sifre == s);
}
void main() {
  print(dogruMu("admin", "1234")); // true
  print(dogruMu("x", "y")); // false
}