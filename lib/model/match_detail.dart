class MatchDetail {
  int _pontosJogador = 0;
  int _pontosOponente = 0;
  String _resultado = "";
  String _oponente = "";
  String _data = "";

  MatchDetail() {
    _pontosJogador = 0;
    _pontosOponente = 0;
    _resultado = "";
    _oponente = "";
    _data = "";
  }

  MatchDetail.withData(
      {pontosJogador = 0,
      pontosOponente = 0,
      resultado = "",
      oponente = "",
      data = "",
      imagePath = ""}) {
    _pontosJogador = pontosJogador;
    _pontosOponente = pontosOponente;
    _resultado = resultado;
    _oponente = oponente;
    _data = data;
  }

  MatchDetail.fromMap(map) {
    _pontosJogador = map["pontosJogador"];
    _pontosOponente = map["pontosOponente"];
    _resultado = map["resultado"];
    _oponente = map["oponente"];
    _data = map["data"];
  }

  int get pontosJogador => _pontosJogador;
  int get pontosOponente => _pontosOponente;
  String get resultado => _resultado;
  String get oponente => _oponente;
  String get data => _data;

  set resultado(String newResultado) {
    if (newResultado.isNotEmpty) {
      _resultado = newResultado;
    }
  }

  set pontosJogador(int newPontosJogador) {
    if (newPontosJogador > 0) {
      _pontosJogador = newPontosJogador;
    }
  }

  set pontosOponente(int newPontosOponente) {
    if (newPontosOponente > 0) {
      _pontosOponente = newPontosOponente;
    }
  }

  set oponente(String newOponente) {
    if (newOponente.isNotEmpty) {
      _oponente = newOponente;
    }
  }

  set data(String newData) {
    if (newData.isNotEmpty) {
      _data = newData;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["pontosJogador"] = _pontosJogador;
    map["pontosOponente"] = _pontosOponente;
    map["resultado"] = _resultado;
    map["oponente"] = _oponente;
    map["data"] = _data;
    return map;
  }
}
