Map<String, int> frekans(String kelime) {
  final m = <String, int>{};
  for (final h in kelime.split("")) {
    m[h] = (m[h] ?? 0) + 1;
  }
  return m;
}

void main() {
  print(frekans("muhammed"));
}
