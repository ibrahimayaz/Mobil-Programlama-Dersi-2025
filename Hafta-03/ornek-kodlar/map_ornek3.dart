void main() {
  mapOrnekleri2();
}

void mapOrnekleri2() {
  var urun = {"ad": "Makarna", "marka": "Filiz", "tip": "burgu"};
  for (var i in urun.keys) {
    print(urun[i]);
  }
}
