class Discount {
  String imageURL;
  int discount;
  String description;
  int rate;
  String category; 
  Discount ({
    this.imageURL,
    this.discount,
    this.description,
    this.rate,
    this.category
  });
  Map<String, dynamic> toMap() {
    return {
      'imageURL': imageURL,
      'discount': discount,
      'description': description,
      'rate': rate,
      'category': category
    };
  }
}