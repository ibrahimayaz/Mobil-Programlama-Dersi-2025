/*
Klavyeden girilen kelimeye ait harf frekansını 
dönderen (Map döndermelidir) dart kodunu yazınız.
 */

void main() {
  print(harfFrekansi("damla"));
}

Map<String, int> harfFrekansi(String kelime) {
  var frekans = <String, int>{}; // boş bir map keyi string, value int
  for (var h in kelime.split("")) {
    frekans[h] = (frekans[h] ?? 0) + 1;//null+1 yerine 0+1
  }
  return frekans; // {m:1, e:1, r:1, h:1, a:2, b:1}
}

