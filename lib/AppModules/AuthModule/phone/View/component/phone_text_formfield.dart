
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotlier/common/app_Text.dart';
import 'package:hotlier/common/app_color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

Widget phoneTextFormField(
  {
    required bool validateCheck,
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
    Function(String?)? validator,
    Function(PhoneNumber?)? onChanged,
  }
){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:10 ,vertical: 0),
    decoration: BoxDecoration(
      color: AppColor.white,
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
    
    child: InternationalPhoneNumberInput(
      hintText: hintText,
      onSaved: (number){},
      textAlignVertical: TextAlignVertical.center,
      textStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500,
        fontFamily: 'DS Pro Display',
        color: AppColor.lightgrey
      ),
      textFieldController: controller,
      validator: validator as String? Function(String?),
      onInputValidated: (value){  
       
      },
      ignoreBlank: true,
      selectorTextStyle: const TextStyle(
        color: AppColor.lightgrey
      ),
      selectorConfig: const SelectorConfig(
      
       leadingPadding: 10,
       trailingSpace: false,
       showFlags: true,
       selectorType: PhoneInputSelectorType.BOTTOM_SHEET
      ),
      onInputChanged: onChanged as PhoneNumber?  Function(PhoneNumber)?,
      inputBorder: InputBorder.none,
      inputDecoration:  InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: validateCheck == true ? 5 : 22.9),
        fillColor: AppColor.white,
        filled: true,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
     focusedErrorBorder: InputBorder.none,
        )
      ),
    
  // TextFormField(
    
  //     validator: validation as String? Function(String?),
  //     textInputAction: textInputAction,
  //     keyboardType: keyboardType,
  //     controller: controller,
  //     // validator: validation as String? Function(String?),
  //     autofocus: false,
  //     obscureText: obsecure,
  //     cursorColor: AppColor.cyan,
  //     style: const TextStyle(
  //       fontSize: 12,
  //       fontFamily: 'SF Pro Display',
  //       color:  AppColor.lightgrey
  //     ),
  //     decoration: InputDecoration(
        
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),

  //       hintText: hintText,
  //       hintStyle: const TextStyle(
  //         color: AppColor.lightgrey,
  //       fontSize: 12,
  //       fontFamily: 'SF Pro Display',
  //       ),
  //       suffixIcon: suffixIcon,
  //     focusColor: AppColor.cyan,
  //       prefixIcon: Container(
  //         alignment: Alignment.center,
  //         width: 60,
  //         height: 60,
  //         child: GestureDetector(
  //           onTap: (){
  //             showCountryPicker(
            
  //           context: context,
  //           useSafeArea: true,
  //           showPhoneCode: true,
  //           onSelect: onSelect as Country? Function(Country?)
  //           );
  //           },
  //           child:appText(text: '+${countryCode}', textColor: AppColor.lightgrey, fontSize: 12)
  //         ),
          
  //       ),
  //       filled: true,
  //       fillColor: AppColor.white,
  //       enabled: true,
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(radius),
  //       borderSide: const BorderSide(
  //         color: AppColor.cyan
  //       ) 
  //       ),
  //      border: OutlineInputBorder(
  //       borderSide: const BorderSide(
  //         color: AppColor.transparent
  //       ),
  //       borderRadius: BorderRadius.circular(radius)
  //      ),
  //      enabledBorder:   OutlineInputBorder(
  //       borderSide: const BorderSide(
  //         color: AppColor.transparent
  //       ),
  //       borderRadius: BorderRadius.circular(radius)
  //      ),
  //      errorBorder: OutlineInputBorder(
  //       borderSide: const BorderSide(
  //         color: AppColor.transparent
  //       ),
  //       borderRadius: BorderRadius.circular(radius)
  //      ),
  //   ),
  // )
  );
}