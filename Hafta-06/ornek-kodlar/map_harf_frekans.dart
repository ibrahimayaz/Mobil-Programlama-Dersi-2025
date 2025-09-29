void main() {
  const kelime = "merhaba";
  final frekans = <String, int>{};
  for (final h in kelime.split("")) {
    frekans[h] = (frekans[h] ?? 0) + 1;
  }
  print(frekans);
}