import 'package:flutter/material.dart';
import 'package:qring/utils/image_assets.dart';
import '../../utils/constants.dart' as constants;
// adjust path as per your structure

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildIcon({required String assetPath, required bool isSelected}) {
    return Container(
      // height: 30,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? constants.drawerclor : Colors.transparent,
      ),
      child: Image.asset(
        assetPath,
        height: 24,
        width: 24,
        color: isSelected ? Colors.white : Colors.grey,
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  return Container(
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1,
          spreadRadius: 2,
          offset: Offset(0, -1), // Shadow from top
        ),
      ],),
    child: PhysicalModel(
      color: Colors.white,
      elevation: 8,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(
              assetPath: ImageAssets.navicon['navhome']!,
              isSelected: currentIndex == 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              assetPath: ImageAssets.navicon['navactivity']!,
              isSelected: currentIndex == 1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              assetPath: ImageAssets.navicon['navsleep']!,
              isSelected: currentIndex == 2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              assetPath: ImageAssets.navicon['navprofile']!,
              isSelected: currentIndex == 3,
            ),
            label: '',
          ),
        ],
      ),
    ),
  );
}

}
