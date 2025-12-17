import 'dart:math';

class Nokta {
  final double x, y;
  final double uzaklik; // Orijine uzaklık

  // Default
  Nokta(this.x, this.y) : uzaklik = sqrt(x * x + y * y);

  // Named (orijin)
  Nokta.orijin() : this(0, 0);

  // Factory: polar koordinattan kartesyene
  factory Nokta.polar(double r, double aciRadyan) {
    final x = r * cos(aciRadyan);
    final y = r * sin(aciRadyan);
    return Nokta(x, y);
  }

  @override
  String toString() =>
      'Nokta(x:${x.toStringAsFixed(2)}, y:${y.toStringAsFixed(2)}, r:${uzaklik.toStringAsFixed(2)})';
}

class KullaniciCache {
  final int id;
  final String ad;
  static final _havuz = <int, KullaniciCache>{};
  factory KullaniciCache(int id, String ad) =>
      _havuz.putIfAbsent(id, () => KullaniciCache._(id, ad));
  KullaniciCache._(this.id, this.ad);
  @override
  String toString() => 'Kullanici#$id($ad)';
}
