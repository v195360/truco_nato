import 'package:truco_nato/model/match_detail.dart';

class MatchCollection {
  List<String> idList = [];
  List<MatchDetail> matchList = [];

  MatchCollection() {
    idList = [];
    matchList = [];
  }

  int length() {
    return idList.length;
  }

  MatchDetail getMatchAtIndex(int index) {
    MatchDetail match = matchList[index];
    return MatchDetail.withData(
        pontosJogador: match.pontosJogador,
        pontosOponente: match.pontosOponente,
        resultado: match.resultado,
        oponente: match.oponente,
        data: match.data);
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }

    return -1;
  }

  updateOrInsertMatchOfId(String id, MatchDetail match) {
    int index = getIndexOfId(id);
    if (index != -1) {
      matchList[index] = MatchDetail.withData(
          pontosJogador: match.pontosJogador,
          pontosOponente: match.pontosOponente,
          resultado: match.resultado,
          oponente: match.oponente,
          data: match.data);
    } else {
      idList.add(id);
      matchList.add(MatchDetail.withData(
          pontosJogador: match.pontosJogador,
          pontosOponente: match.pontosOponente,
          resultado: match.resultado,
          oponente: match.oponente,
          data: match.data));
    }
  }

  deleteMatchOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      matchList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertMatchOfId(String id, MatchDetail match) {
    idList.add(id);
    matchList.add(MatchDetail.withData(
        pontosJogador: match.pontosJogador,
        pontosOponente: match.pontosOponente,
        resultado: match.resultado,
        oponente: match.oponente,
        data: match.data));
  }
}
