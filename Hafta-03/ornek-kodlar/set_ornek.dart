void main() {
  setOrnekleri();
}

void setOrnekleri() {
  var s1 = <String>{'Elma', 'Armut', 'Muz', 'Elma'};

  s1.add('Kivi');
  s1.add('Mandalina'); // Aynı eleman tekrar eklenmez
  s1.remove('Elma');
  print(s1.length);
  // for (var meyve in s1) {
  //   print(meyve);
  // }
}
