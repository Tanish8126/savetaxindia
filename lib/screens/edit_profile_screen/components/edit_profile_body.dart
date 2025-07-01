import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/default_button.dart';
import 'otp_dialog.dart';
import 'user_image_section.dart';

class EditProfileScreenBody extends StatelessWidget {
  EditProfileScreenBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final _authController = Get.put(AuthController());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserProvider>(context).user;
    return SingleChildScrollView(
      child: Column(
        children: [
          //==============User Image Section==============
          UserImageSection(),

          //==============Name Section==============
          Padding(
            padding: pda(0.02),
            child: Row(
              children: [
                Text("Name", style: tsB(16)),
                sw09,
                Expanded(
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    readOnly: userdata.userName == '' ? false : true,
                    onChanged: (val) {
                      // _authController.phoneNo.value = val;
                      // _authController.showPrefix.value = val.isNotEmpty;
                    },
                    decoration: InputDecoration(
                      hintText: userdata.userName == ''
                          ? "Enter Full Name"
                          : userdata.userName,

                      focusedBorder: oi15(const Color(0xff343434)),
                      enabledBorder: oi15(const Color(0xff343434)),
                      suffixIcon: userdata.phoneNumber == ''
                          ? null
                          : const Icon(Icons.verified, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: pda(0.02),
            child: Row(
              children: [
                Text("Email", style: tsB(16)),
                sw09,
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: userdata.email == '' ? false : true,
                    decoration: InputDecoration(
                      hintText: userdata.email == ''
                          ? "Enter Email"
                          : userdata.email,
                      focusedBorder: oi15(const Color(0xff343434)),
                      enabledBorder: oi15(const Color(0xff343434)),
                      suffixIcon: userdata.email == ''
                          ? null
                          : const Icon(Icons.verified, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: pda(0.02),
            child: Row(
              children: [
                Text("Phone", style: tsB(16)),
                sw09,

                Expanded(
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    readOnly: userdata.phoneNumber == '' ? false : true,
                    decoration: InputDecoration(
                      hintText: userdata.phoneNumber == ''
                          ? "Enter Mobile Number"
                          : userdata.phoneNumber,
                      focusedBorder: oi15(const Color(0xff343434)),
                      enabledBorder: oi15(const Color(0xff343434)),
                      suffixIcon: userdata.phoneNumber == ''
                          ? null
                          : const Icon(Icons.verified, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          sh03,
          Padding(
            padding: pda(0.02),
            child: Row(
              children: [
                Text("Bio", style: tsB(16)),
                sw09,
                Expanded(
                  child: TextFormField(
                    controller: _bioController,
                    maxLines: 3,
                    maxLength: 100,
                    textCapitalization: TextCapitalization.sentences,
                    readOnly: userdata.bio == '' ? false : true,
                    decoration: InputDecoration(
                      hintText: userdata.bio == '' ? "Enter Bio" : userdata.bio,
                      focusedBorder: oi15(const Color(0xff343434)),
                      enabledBorder: oi15(const Color(0xff343434)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: pda(0.02),
            child: DefaultButton(
              text: 'Save',
              size: 15,
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _authController.getOtp(context);
                  otpDialog(context);
                }
                //updateData(userdata.uid);
              },
            ),
          ),
        ],
      ),
    );
  }
}
