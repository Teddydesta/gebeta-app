import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/screens/authScreen/components/new_passwordscreen.dart';
import 'package:gebeta_food_delivery/screens/authScreen/signIn.dart';
import 'package:gebeta_food_delivery/screens/customer/DrawerScreen/DrawerScreen.dart';
import 'package:gebeta_food_delivery/screens/customer/address_screen/address_screen.dart';
import 'package:gebeta_food_delivery/screens/customer/profile_screen/components/profile_setting.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/utils/dimensions.dart';
import 'package:gebeta_food_delivery/widgets/accountWidget.dart';
import 'package:gebeta_food_delivery/widgets/app_Icon.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
File? imageFile;
  void getImage({required ImageSource source}) async {
    
    final file = await ImagePicker().pickImage(
        source: source,
      maxWidth: 640,
      maxHeight: 480,
      imageQuality: 70 //0 - 100
    );
    
    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

   
void _pickImage(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Row(

        
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    ),
                      onPressed: ()=> getImage(source: ImageSource.camera),
                      child: const CustomText(text: 'Camera', )
                  
                ),
                const SizedBox(height: 10,),
              
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 33,vertical: 10),
                      
                      
                    ),
                      onPressed: ()=> getImage(source: ImageSource.gallery),
                      child: const CustomText(text: 'Gallery', )
                  
                )
              ],
            ),
        ]
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.orange,
        title: const CustomText(
          text: "profile ",
          fontSize: 34,
          color: AppColors.mainBlackColor,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          
          children: [
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    //Profile
                    Center(
                      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(imageFile != null)
              GestureDetector(
                onTap: (() =>  _pickImage(context)),
                child: Container(
                  width: 140,
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover
                    ),
                    border: Border.all(width: 5, color: Colors.black12),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: (() =>  _pickImage(context)),
                child: Container(
                  width: 140,
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(width: 5, color: Colors.black12),
                    borderRadius: BorderRadius.circular(1000.0),
                  ),
                  
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey[100],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: const CustomText(
                        text: "Account",
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10),

                    //Phone Number
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const ProfileSettingScreen()))),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[50]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AccountWidget(
                              appIcon: const CustomIcon(
                                backgroundColor: Colors.amberAccent,
                                icon: Icons.person,
                                iconColor: Colors.white,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Profile Setting',
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const CustomIcon(
                                iconSize: 22,
                                icon: Icons.arrow_forward_ios,
                                backgroundColor: Colors.white12,
                                iconColor: AppColors.placeholder,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //Address
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const NewPasswordScreen()))),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[50]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AccountWidget(
                              appIcon: const CustomIcon(
                                backgroundColor: Colors.cyan,
                                icon: Icons.lock,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Change password',
                               
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const CustomIcon(
                                iconSize: 22,
                                backgroundColor: Colors.white12,
                                icon: Icons.arrow_forward_ios,
                                iconColor: AppColors.placeholder,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const Addressscreen()))),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[50]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AccountWidget(
                              appIcon: const CustomIcon(
                                backgroundColor: Colors.green,
                                icon: Icons.location_on,
                                iconColor: Colors.white,
                                iconSize: 24,
                                size: 38,
                              ),
                              customText: const CustomText(
                                text: 'Add Your Address',
                               fontSize: 18,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const CustomIcon(
                                iconSize: 22,
                                backgroundColor: Colors.white12,
                                icon: Icons.arrow_forward_ios,
                                iconColor: AppColors.placeholder,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: AppColors.orange,
                              icon: Icons.checklist_outlined,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Orders',
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              backgroundColor: Colors.white12,
                              iconColor: AppColors.placeholder,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const CustomText(
                        text: "Personal",
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),

                    //Phone Number
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: Colors.purple,
                              icon: Icons.policy_rounded,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Privacy Policy',
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              backgroundColor: Colors.white12,
                              iconColor: AppColors.placeholder,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //Address
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: AppColors.primary,
                              icon: Icons.lock_outline_rounded,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Security',
                            fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              backgroundColor: Colors.white12,
                              iconColor: AppColors.placeholder,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: Colors.white,
                              icon: Icons.description_outlined,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Term & Conditions',
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              backgroundColor: Colors.white12,
                              iconColor: AppColors.placeholder,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10),
                          color: Colors.grey[50]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AccountWidget(
                            appIcon: const CustomIcon(
                              backgroundColor: Colors.brown,
                              icon: Icons.help_outline,
                              iconColor: Colors.white,
                              iconSize: 24,
                              size: 38,
                            ),
                            customText: const CustomText(
                              text: 'Help',
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: const CustomIcon(
                              backgroundColor: Colors.white12,
                              iconSize: 22,
                              icon: Icons.arrow_forward_ios,
                              iconColor: AppColors.placeholder,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 65,
                    ),
                    
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  const SignInPage()))),
                        child: Container(
                          
                          margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 40),
                          child: Container(
                          
                          child: Container(
                                           child: Center(child: CustomText( text: "LOGOUT",
                                           color: Colors.white,fontWeight: FontWeight.bold,),),
                        
                        height: 50,
                        width: 450,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                                           
                                           ),
                        ),
                        ),
                      ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



