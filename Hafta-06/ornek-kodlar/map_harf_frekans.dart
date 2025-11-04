void main() {
  const kelime = "merhaba";
  var frekans = <String, int>{}; //key String, value ise int olacak
  for (var h in kelime.split("")) {
    //harfe göre böldük
    frekans[h] = (frekans[h] ?? 0) + 1;
  }
  print(frekans);
}
