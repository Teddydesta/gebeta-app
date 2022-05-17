import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:gebeta_food_delivery/screens/customer/profile_screen/components/profile_setting.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/profile_screen.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/CustomBtn.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:gebeta_food_delivery/widgets/formFilld.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        padding: const EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) =>
                              const ProfileScreen()))),
                  child: const CustomIcon(
                    icon: Icons.close,
                    iconColor: AppColors.orange,
                    iconSize: 24,
                    backgroundColor: Colors.white,
                  ),
                ),
                const CustomBtn(
                  text: "Save",
                  textColor: Colors.white,
                  fontSize: 24,
                  height: 35,
                  width: 80,
                  borderRadius: 8,
                  color: AppColors.orange,
                ),
              ],
            ),
            const CustomText(text: "Edit Account"),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "Name"),
            const FormFieldWidget(
              hintText: "teddy",
              isPassword: false,
              keyboardType: TextInputType.text,
              maxLine: 1,
              readOnly: false,
              labelText: "Name",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "Last Name"),
            const FormFieldWidget(
              hintText: "desta",
              isPassword: false,
              keyboardType: TextInputType.text,
              maxLine: 1,
              readOnly: false,
              labelText: "Name",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(text: "Phone Number"),
            const FormFieldWidget(
              hintText: "+251-",
              isPassword: false,
              keyboardType: TextInputType.number,
              maxLine: 1,
              readOnly: false,
              labelText: "Name",
            ),
          ],
        ),
      ),
    );
  }
}
