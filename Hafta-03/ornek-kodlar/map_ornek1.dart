void main() {
  mapOrnekleri();
}

void mapOrnekleri() {
  var ogr = {'ad': 'Ali', 'yas': 16, 'sehir': 'Ankara'};
  ogr['yas'] = 17; // Yaşı güncelle / veri değiştirme
  ogr['okul'] = 'Bitlis Lisesi'; // Yeni key-value ekle
  print(ogr['okul']);
}
