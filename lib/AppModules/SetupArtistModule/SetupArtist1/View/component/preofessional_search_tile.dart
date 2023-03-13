import 'package:flutter/material.dart';

import '../../../../../common/app_color.dart';

Widget professionalSearchTile(BuildContext context) {
    return Container(
                  width: MediaQuery.of(context).size.width / 1.33,
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                child: TextFormField(
                      onChanged: (value) {
                        // Method For Searching
                      },
                      // autofocus: true,
                      cursorColor: AppColor.lightgrey,
                     style: const TextStyle(
                        color: AppColor.lightgrey,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        enabled: true,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 13),
                        fillColor: AppColor.buttonColor,
                        hintText: "Search furniture",
                        hintStyle: const  TextStyle(
                          color: AppColor.lightgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                        
                      
                        prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13,vertical: 13),
                            child: ImageIcon(AssetImage('assets/navbar/Search.png'), color: AppColor.lightgrey,),
                          ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                );
  }