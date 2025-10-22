void main() {
  if (asalMi(1011001) == true) {
    print("girilen sayı asaldır.");
  } else {
    print("girilen sayı asal değildir.");
  }
}

bool asalMi(int sayi) {
  if (sayi < 2) return false;
  for (var i = 2; i < sayi; i++) {
    if (sayi % i == 0) return false;
  }
  return true;
}
