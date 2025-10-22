void main() {
  setOrnekleri();
}

void setOrnekleri() {
  var kume = <int>{1, 2, 2, 3}; // {1,2,3}
  kume.add(4);
  kume.remove(2);
  print(kume.contains(3));
  print(kume); // {1,3,4}
}
