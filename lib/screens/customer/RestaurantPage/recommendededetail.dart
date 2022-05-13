import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/customer/homeMainScreen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class RecommendedDetail extends StatelessWidget {
  const RecommendedDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 65,
            //left and right icons
            title: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                const HomeMainScreen()))),
                    child: const CustomIcon(
                      icon: Icons.clear,
                      iconSize: 24,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.orange,
                    ),
                  ),
                  const CustomIcon(
                    icon: Icons.shopping_cart,
                    iconSize: 24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.orange,
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                  width: double.maxFinite,
                  child:
                      const Center(child: CustomText(text: "Sheger food  "))),
            ),
            pinned: true,
            backgroundColor: AppColors.orange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/real/foodd.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: const [
                    Text("""
Lorem ipsum dolor sit amet. Ut repellendus Quis sed quaerat vero ea mollitia galisum a omnis distinctio ea iusto praesentium ut fugit qui modi facere. Ut voluptas alias ad neque rerum et illum quia et perferendis sunt aut reiciendis facilis.
Lorem ipsum dolor sit amet. Ut repellendus Quis sed quaerat vero ea mollitia galisum a omnis distinctio ea iusto praesentium ut fugit qui modi facere. Ut voluptas alias ad neque rerum et illum quia et perferendis sunt aut reiciendis facilis.
Lorem ipsum dolor sit amet. Ut repellendus Quis sed quaerat vero ea mollitia galisum a omnis distinctio ea iusto praesentium ut fugit qui modi facere. Ut voluptas alias ad neque rerum et illum quia et perferendis sunt aut reiciendis facilis. 
""")
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 5,
              left: 50,
              right: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomIcon(
                  icon: Icons.remove,
                  iconSize: 24,
                  backgroundColor: AppColors.orange,
                  iconColor: Colors.white,
                ),
                //
                CustomText(
                  text: " 120 birr " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  fontSize: 24,
                ),
                CustomIcon(
                  icon: Icons.add,
                  iconSize: 24,
                  backgroundColor: AppColors.orange,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(00.0),
                  topRight: Radius.circular(40.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.orange,
                  ),
                  child: const CustomText(
                    text: 'Add to cart | 120 birr',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
