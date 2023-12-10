import 'dart:io';

void main() async {
  var i18nPtBr = File('pt_br.json');
  var sink = i18nPtBr.openWrite();
  var teste = {'"teste"': '"valor"'};
  sink.write(teste);
  await sink.flush();
  await sink.close;
}
