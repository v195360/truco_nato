import 'package:truco_nato/model/match_detail.dart';
import 'package:truco_nato/model/matches.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  // Atributo que irá afunilar todas as consultas
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();
  // Construtor privado
  FirestoreDatabase._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference matchCollection =
      FirebaseFirestore.instance.collection("matches");

  Future<MatchDetail> getMatch(matchId) async {
    DocumentSnapshot doc = await matchCollection
        .doc(uid)
        .collection("my_matches")
        .doc(matchId)
        .get();
    MatchDetail match = MatchDetail.fromMap(doc.data());
    return match;
  }

  Future<int> insertMatch(MatchDetail match) async {
    DocumentReference ref =
        await matchCollection.doc(uid).collection("my_matches").add({
      "pontosJogador": match.pontosJogador,
      "pontosOponente": match.pontosOponente,
      "resultado": match.oponente,
      "oponente": match.oponente,
      "data": match.data
    });

    await matchCollection.doc(uid).collection("my_matches").doc(ref.id).update({
      "pontosJogador": match.pontosJogador,
      "pontosOponente": match.pontosOponente,
      "resultado": match.oponente,
      "oponente": match.oponente,
      "data": match.data
    });

    return 42;
  }

  Future<int> deleteMatch(matchId) async {
    await matchCollection
        .doc(uid)
        .collection("my_matches")
        .doc(matchId)
        .delete();
    return 42;
  }

  MatchCollection _matchListFromSnapshot(QuerySnapshot snapshot) {
    MatchCollection matchCollection = MatchCollection();
    for (var doc in snapshot.docs) {
      MatchDetail match = MatchDetail.fromMap(doc.data());
      matchCollection.insertMatchOfId(doc.id, match);
    }
    return matchCollection;
  }

  Future<MatchCollection> getMatchList() async {
    QuerySnapshot snapshot =
        await matchCollection.doc(uid).collection("my_matches").get();

    return _matchListFromSnapshot(snapshot);
  }

  Stream get stream {
    return matchCollection
        .doc(uid)
        .collection("my_matches")
        .snapshots()
        .map(_matchListFromSnapshot);
  }
}
