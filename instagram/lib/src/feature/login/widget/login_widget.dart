import 'package:flutter/material.dart';

import '../../../constant/utils/color.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: kLightGreyColor.withOpacity(0.5),
        height: 1,
      ),
    ),
    title: const Center(
      child: Text(
        "Sign Up",
        style: TextStyle(color: kBlackColor, fontSize: 16, fontWeight: FontWeight.normal),
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: TextStyle(
          color: kGreyColor.withOpacity(0.5), fontWeight: FontWeight.normal, fontSize: 14),
    ),
  );
}

Widget buildTextField(
    String text, String hintText, String textType, void Function(String value)? func) {
  return Container(
    width: 325,
    height: 50,
    decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: kBlackColor)),
    child: Row(
      children: [
        // Container(
        //     width: 16,
        //     height: 16,
        //     margin: const EdgeInsets.only(left: 17),
        //     child:  textType == "email" ? const Icon(Icons.person): const Icon(Icons.lock)),
        Container(
          width: 260,
          height: 50,
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: TextField(
            onChanged: (value) {
              func!(value);
            },
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              hintText: hintText,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget buildLoginButton(String buttonName,void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 200,
      height: 50,
      margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
      decoration:
          BoxDecoration(color: kBlueColor, borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: kGreyColor.withOpacity(0.1))
      ]),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}