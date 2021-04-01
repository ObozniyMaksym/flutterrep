class Discount {
  String id;
  String title;
  String imageURL;
  int discount;
  String description;
  int rate;
  String category; 
  Discount ({
    this.id,
    this.title,
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