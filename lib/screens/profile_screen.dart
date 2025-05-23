import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/appImage_const.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/controller/home_controller.dart';
import 'package:instagram_clone/screens/edit_profile.dart';
import 'package:instagram_clone/screens/photo_view_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Obx(() {
      final user = homeController.userModel.value;

      return Scaffold(
        backgroundColor: AppColorConst.appBlack,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Text(
                      // 'john_scott',
                      user!.username,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColorConst.appWhite,
                      ),
                    ),

                    /* Obx(() {
                      final user = homeController.userModel.value;
                      if (user == null) {
                        return const SizedBox();
                      }
                      return Text(
                        user.username,
                        style: const TextStyle(
                          color: AppColorConst.appWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      );
                    }),*/
                    const Spacer(),
                    const Icon(
                      Icons.add_box_outlined,
                      color: AppColorConst.appWhite,
                      size: 28,
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.menu,
                      color: AppColorConst.appWhite,
                      size: 28,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _profileData(),
                      const SizedBox(height: 20),
                      _storyHighlights(),
                      const SizedBox(height: 15),
                      _postIcon(),
                      const SizedBox(height: 15),
                      _postGrid(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _profileData() {
    final HomeController homeController = Get.find<HomeController>();

    return Obx(() {
      final user = homeController.userModel.value;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppImageConst.appDpImage,
                          fit: BoxFit.cover,
                        ),
                      ),

                      /* child: ClipOval(
                        child: Obx(() {
                          final imageUrl =
                              homeController.userModel.value?.image;
                          return imageUrl != null && imageUrl.isNotEmpty
                              ? Image.network(imageUrl, fit: BoxFit.cover)
                              : Image.asset(AppImageConst.appDpImage,
                                  fit: BoxFit.cover);
                        }),
                      ),*/
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: AppColorConst.appBlue,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColorConst.appBlack, width: 2),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: AppColorConst.appWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '5',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Post',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '1000',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '500',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        color: AppColorConst.appWhite,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 17),
            Text(
              // 'Jonathan Scott',
              user!.username,
              style: const TextStyle(
                color: AppColorConst.appWhite,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),

            /*   Obx(() {
              final user = homeController.userModel.value;
              if (user == null) {
                return const SizedBox(); // or a placeholder Text
              }
              return Text(
                user.username,
                style: const TextStyle(
                  color: AppColorConst.appWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              );
            }),*/

            const SizedBox(height: 4),
            const Text(
              'Creative/Artistic',
              style: TextStyle(
                color: AppColorConst.appWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'www.johnscott.com',
              style: TextStyle(
                color: AppColorConst.appWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () => Get.off(() => EditProfile()),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColorConst.appLightBlack),
                      ),
                      child: const Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(color: AppColorConst.appWhite),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColorConst.appLightBlack),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColorConst.appWhite,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _storyHighlights() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _storyItem('Paris', 'assets/images/nature.jpg'),
          const SizedBox(width: 15),
          _storyItem('Dubai', 'assets/images/nature2.png'),
          const SizedBox(width: 15),
          _newStoryItem(),
        ],
      ),
    );
  }

  Widget _storyItem(String label, String imagePath) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColorConst.appLightBlack, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: AppColorConst.appWhite, fontSize: 12),
        ),
      ],
    );
  }

  Widget _newStoryItem() {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColorConst.appLightBlack, width: 2),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: AppColorConst.appWhite,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'New',
          style: TextStyle(color: AppColorConst.appWhite, fontSize: 12),
        ),
      ],
    );
  }

  Widget _postIcon() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.grid_on,
            color: AppColorConst.appWhite,
            size: 28,
          ),
          Icon(
            Icons.person_pin_outlined,
            color: AppColorConst.appLightBlack,
            size: 28,
          ),
        ],
      ),
    );
  }

  Widget _postGrid() {
    final postImages = [
      'assets/images/nature.jpg',
      'assets/images/nature2.png',
      'assets/images/nature.jpg',
      'assets/images/nature2.png',
      'assets/images/post1.png',
      'assets/images/nature.jpg',
    ];

    List<Widget> imageWidgets = [];

    for (var img in postImages) {
      imageWidgets.add(
        GestureDetector(
          onTap: () => Get.off(() => Photoviewscreen(imageURL: img)),
          child: SizedBox(
            height: 150,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: imageWidgets,
    );
  }
}
