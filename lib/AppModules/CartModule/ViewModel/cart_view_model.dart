import 'package:get/get.dart';
import 'package:hotlier/AppModules/CartModule/Model/cart_model.dart';

class CartViewModel extends GetxController{
  RxList<CartModel> cartList = <CartModel>[
   CartModel(title: 'Sofa', cartItemCount: 1.obs, description: 'description', pirce: 150.00, imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60' ),
   CartModel(title: 'Chair', cartItemCount: 1.obs, description: 'description', pirce: 160.00, imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
   CartModel(title: 'Bulb', cartItemCount: 1.obs, description: 'description', pirce: 70.00, imageUrl: 'https://images.unsplash.com/photo-1494438639946-1ebd1d20bf85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
  ].obs;
  
}