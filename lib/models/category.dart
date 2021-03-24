import "package:forsale/models/discount.dart";

class Category {
  String imageURL;
  String title;
  List<Discount> discounts;

  Category({
    this.imageURL,
    this.title,
    this.discounts,
  });
}

List<Discount> foodDiscounts = [
  Discount(
    imageURL: "assets/images/burger.jpg",
    discount: 50,
    description: "Takeaway discount",
    rate: 5
  ),
  Discount(
    imageURL: "assets/images/pizza.jpg",
    discount: 30,
    description: "Get a discount for second pizza",
    rate: 10
  ),
  Discount(
    imageURL: "assets/images/borscht.jpg",
    discount: 10,
    description: "Wow! The dish of the day!!!",
    rate: 100
  )
];

List<Discount> clothesDiscounts = [
  Discount(
    imageURL: "assets/images/timberland.jpg",
    discount: 50,
    description: "Final sale",
    rate: 5
  ),
  Discount(
    imageURL: "assets/images/ball.jpg",
    discount: 25,
    description: "Random description",
    rate: 18
  )
];


List<Discount> entertainmentDiscounts = [
  Discount(
    imageURL: "assets/images/bowling.jpg",
    discount: 50,
    description: "For sure, you need some bowling today",
    rate: 5
  ),
  Discount(
    imageURL: "assets/images/football.jpg",
    discount: 25,
    description: "Play football with friends",
    rate: 18
  ),
  Discount(
    imageURL: "assets/images/zoo.jpg",
    discount: 37,
    description: "I don't like zoo's but this giraffe is so cute",
    rate: 18
  )
];



List<Category> categories = [
  Category(
    imageURL: "assets/images/food.jpg",
    title: "food",
    discounts: foodDiscounts
  ),
  Category(
    imageURL: "assets/images/clothes.jpg",
    title: "clothes",
    discounts: clothesDiscounts
  ),
  Category(
    imageURL: "assets/images/entertainment.jpg",
    title: "entertainment",
    discounts: clothesDiscounts
  )
];