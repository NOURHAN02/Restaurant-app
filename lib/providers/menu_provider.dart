import 'package:flutter/material.dart';
import 'package:restaurant_app/core/widgets/customer_snack_bar_widget.dart';
import 'package:restaurant_app/models/food_model.dart';

class MenuProvider extends ChangeNotifier {
  bool isCheckOut = false;
  List<FoodModel> cardList = [];
  List<FoodModel> europeanFoods = [
    FoodModel(
      id: '0',
      name: 'Pizza',
      country: 'Italy',
      description: 'Delicious cheese pizza with tomato sauce and herbs.',
      ingredients: ['Flour', 'Tomato Sauce', 'Cheese', 'Olive Oil', 'Oregano'],
      halal: true,
      imageUrl:
          "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg",
      price: 12.5,
      amountAvailable: 10,
    ),
    FoodModel(
      id: "1",
      name: "Ratatouille",
      country: "France",
      description:
          "A French vegetable stew made with zucchini, eggplant, peppers, and tomatoes cooked in olive oil.",
      ingredients: [
        "Zucchini",
        "Eggplant",
        "Bell Peppers",
        "Onion",
        "Tomatoes",
        "Garlic",
        "Olive Oil",
      ],
      halal: true,
      imageUrl:
          "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2FPhoto%2FRecipes%2F2024-07-ratatouille%2FRatatouille-",
      price: 8.5,
      amountAvailable: 20,
    ),
    FoodModel(
      id: "2",
      name: "Fish and Chips",
      country: "United Kingdom",
      description:
          "Crispy fried fish served with deep-fried potatoes, a classic British dish.",
      ingredients: ["Fish", "Potatoes", "Flour", "Salt", "Oil"],
      halal: true,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4gI4xWMY0WoOfFjE2SVUUJge1VG9otavDNg&s",
      price: 12.0,
      amountAvailable: 15,
    ),
    FoodModel(
      id: "3",
      name: "Lasagna",
      country: "Italy",
      description:
          "A layered pasta dish with ground meat, tomato sauce, béchamel, and cheese.",
      ingredients: [
        "Lasagna Pasta",
        "Ground Beef",
        "Cheese",
        "Tomato Sauce",
        "Béchamel",
      ],
      halal: true,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHH3Gpync0MKU7Qkt0EoAdFNBQ5s84K_ADGA&s",
      price: 10.0,
      amountAvailable: 10,
    ),
    FoodModel(
      id: "4",
      name: "Goulash",
      country: "Hungary",
      description:
          "A hearty Hungarian stew made with beef, paprika, and vegetables.",
      ingredients: ["Beef", "Onions", "Potatoes", "Paprika"],
      halal: true,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxwOwgJTkTukdhxeQAUQtl2e-d3DpNO96xug&s",
      price: 11.5,
      amountAvailable: 8,
    ),
    FoodModel(
      id: "5",
      name: "Swedish Meatballs",
      country: "Sweden",
      description:
          "Meatballs made with beef or pork served in creamy sauce, often with lingonberry jam.",
      ingredients: ["Ground Meat", "Breadcrumbs", "Egg", "Onion", "Cream"],
      halal: true,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs1mC8X5bKN-5AkvqGsQSYsz76UljEje65KA&s",
      price: 9.0,
      amountAvailable: 18,
    ),
    FoodModel(
      id: "6",
      name: "Shakshuka",
      country: "Tunisia",
      description:
          "Poached eggs in a spicy tomato and pepper sauce, often eaten for breakfast.",
      ingredients: ["Eggs", "Tomatoes", "Peppers", "Onion", "Garlic", "Oil"],
      halal: true,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQFTzIgVpeOIQlNL5sqyD-z4-h2LdM4BWjFQ&s",
      price: 7.5,
      amountAvailable: 25,
    ),
  ];

  double totalPrice() {
    return cardList.fold(0.0, (sum, item) => sum + item.price);
  }

  void addToCard({required FoodModel foodModel, context}) {
    final exists = cardList.any((item) => item.id == foodModel.id);
    if (!exists) {
      cardList.add(foodModel);
      CustomerSnackBar.show(context, "Add The meal  in cart");
    } else {
      CustomerSnackBar.show(context, "The meal is already in the cart");
    }
  }

  void removeFromCart({required FoodModel foodModel, context}) {
    final exists = cardList.any((item) => item.id == foodModel.id);
    if (exists) {
      cardList.removeWhere((e) => e.id == foodModel.id);
      CustomerSnackBar.show(context, "Meal removed from cart");
      notifyListeners();
    }
  }

  Future<void> checkOutFunction({context}) async {
    isCheckOut = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    cardList.clear();
    CustomerSnackBar.show(context, "CheckOut done");

    isCheckOut = false;
    notifyListeners();
  }
}
