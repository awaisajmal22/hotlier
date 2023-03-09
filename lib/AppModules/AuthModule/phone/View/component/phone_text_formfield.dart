
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

Widget phoneTextFormField(
  {
    required BuildContext context,
   required String countryCode,
    double radius =12.84,
    bool obsecure = false,
    // required Container? prefixicon,
    GestureDetector ? suffixIcon, 
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    required String hintText,
    Function(Country?)? onSelect,
    // Function(PhoneNumber?)? onChanged,
    Function(String?)? validation,
  }
){
  return Container(
    decoration: BoxDecoration(
      
      boxShadow: [
      BoxShadow(
        color: AppColor.shadowColor.withOpacity(0.15),
        spreadRadius: -1,
        blurRadius: 22,
        offset: const Offset(0, 4), // changes position of shadow
      ),
      ],
      borderRadius: BorderRadius.circular(radius)
    ),
    
    
    // child: IntlPhoneField(
    //   autovalidateMode: AutovalidateMode.onUserInteraction,
    
    //   validator: (val){

    //     if(val!.completeNumber.isEmpty){
    //       return 'Please Enter Phone';
    //     }else if(val.completeNumber.length < 11){
    //       return 'Please Enter Valid Number';
    //     }
        
    //     return null;
    //   },
    //   onCountryChanged: (value){

    //   },
    //   initialValue: 'PK',

    //   initialCountryCode: 'PK',
    //   onChanged: onChanged as PhoneNumber? Function(PhoneNumber?),
      
    //   flagsButtonPadding: const EdgeInsets.only(left: 20, top: 22 , bottom: 22),
      
    //   dropdownTextStyle: const TextStyle(
    //     fontSize: 14, 
    //       fontWeight: FontWeight.w600,
    //       color: AppColor.lightgrey,
    //       fontFamily: 'SF Pro Display'
        
    //     ),
    //   disableLengthCheck: true,
    //   controller: controller,
    //   showDropdownIcon: false,
    //   style: const TextStyle(
    //     fontSize: 14, 
    //       fontWeight: FontWeight.w600,
    //       fontFamily: 'SF Pro Display',
    //     color:  AppColor.lightgrey
    //   ),
    //   decoration: InputDecoration(
        
    //     hintText: hintText,
    //     hintStyle: const TextStyle(
    //       fontSize: 14, 
    //       fontWeight: FontWeight.w600,
    //       color: AppColor.lightgrey,
    //       fontFamily: 'SF Pro Display'
        
    //     ),
    //     contentPadding: const EdgeInsets.only(top: 22, bottom: 22, right: 20),
    //     border: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Colors.transparent
    //       ),
    //       borderRadius: BorderRadius.circular(radius),
        
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Colors.transparent
    //       ),
    //       borderRadius: BorderRadius.circular(radius),
        
    //     ),
    //     fillColor: AppColor.white,
    //     filled: true,
    //     focusedBorder: OutlineInputBorder(
          
    //       borderRadius: BorderRadius.circular(radius),
    //       borderSide: const BorderSide(
    //         width: 1,
    //         color: AppColor.cyan
    //       )
    //     )
        
    //   ),
    // )
    child: TextFormField(
    
      validator: validation as String? Function(String?),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      // validator: validation as String? Function(String?),
      autofocus: false,
      obscureText: obsecure,
      cursorColor: AppColor.cyan,
      style: TextStyle(
        fontSize: 12,
        fontFamily: 'SF Pro Display',
        color:  AppColor.lightgrey
      ),
      decoration: InputDecoration(
        
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),

        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.lightgrey,
        fontSize: 12,
        fontFamily: 'SF Pro Display',
        ),
        suffixIcon: suffixIcon,
      focusColor: AppColor.cyan,
        prefixIcon: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          child: GestureDetector(
            onTap: (){
              showCountryPicker(
            
            context: context,
            useSafeArea: true,
            showPhoneCode: true,
            onSelect: onSelect as Country? Function(Country?)
            );
            },
            child:appText(text: '+${countryCode}', textColor: AppColor.lightgrey, fontSize: 12)
          ),
          
        ),
        filled: true,
        fillColor: AppColor.white,
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: AppColor.cyan
        ) 
        ),
       border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.transparent
        ),
        borderRadius: BorderRadius.circular(radius)
       ),
       enabledBorder:   OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.transparent
        ),
        borderRadius: BorderRadius.circular(radius)
       ),
       errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.transparent
        ),
        borderRadius: BorderRadius.circular(radius)
       ),
    ),
  )
  );
}