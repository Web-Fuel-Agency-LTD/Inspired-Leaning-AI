import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inspired_learning_ai/screens/personalInformation/personal_information.dart';

import '../../utils/constants/colors.dart';
import '../homePage/home_page.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.dark,
        appBar: AppBar(
          title: const Text('Account', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            icon: const Icon(Icons.arrow_back_outlined, color: Colors.white,)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ILColors.accent,
                      ),
                    ),
                  const SizedBox(width: 20,),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      Text('johndoe@gmail.com', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  ],),
                  IconButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PersonalInformationScreens()));
                  }, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 0.1,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subscription', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      Text('Manage your subscription', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  ],),
                   IconButton(onPressed: (){
                   
                  }, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 0.1,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      Text('Setups apps learning configurations', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  ],),
                   IconButton(onPressed: (){
                    
                  }, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 0.1,),
              const SizedBox(height: 50,),
              const Row(children: [
                Icon(Icons.logout, color: Colors.white,),
                const SizedBox(width: 20,),
                Text('Logout', style: TextStyle(color: Colors.white))
              ],)
            ],
          ),
        ));
  }
}
