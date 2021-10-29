class CardModel {
  String user;
  String cardType;

  CardModel(this.user, this.cardType);
}

List<CardModel> cards = cardData
    .map((item) => CardModel(
        item['user'].toString(),
        item['cardType'].toString()
  ),
).toList();

var cardData = [
  {
    "user": "Smartphone",
    "cardType": "assets/images/A03S.png",
  },
  {
    "user": "Audio & Watches",
    "cardType": "assets/images/A52.png",
  },
  {
    "user": "Smart Life",
    "cardType": "assets/images/M62.png",
  },
];
