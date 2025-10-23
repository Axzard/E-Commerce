class CreditCardModel {
  String cardHolderName;
  String cardNumber;
  String expiryDate;
  String cvv;
  String cardType;
  String cardImage;
  bool isSaved;
  bool isDefault; // 🔹 Tambahan

  CreditCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardType,
    required this.cardImage,
    this.isSaved = false,
    this.isDefault = false,
  });
}
