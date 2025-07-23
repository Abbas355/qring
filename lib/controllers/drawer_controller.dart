import '../models/user_model.dart';

class DrawerControllerMVC {
  // Dummy user data (can be from Firebase later)
  UserModel getCurrentUser() {
    return UserModel(
      name: "Namehere",
      email: "abc@gmail.com",
      profileImage: "assets/images/profile.png",
    );
  }
}
