void main() {
  icIceFor();
}

void icIceFor() {
  for (var satir = 0; satir < 3; satir++) {
    var line = '';
    for (var sutun = 0; sutun < 4; sutun++) {
      line += '*';
    }
    print(line);
  }
}
