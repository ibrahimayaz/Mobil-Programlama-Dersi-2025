void main() {
  var kayitliKullanici = "admin";
  var kayitliSifre = "1234";
  var girilenKullanici = "admin";
  var girilenSifre = "1234";
  if (girilenKullanici == kayitliKullanici && girilenSifre == kayitliSifre) {
    print("Giriş başarılı");
  } else {
    print("Bilgiler hatalı");
  }
}
