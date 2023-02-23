import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hotlier/AppModules/SetupArtistModule/VIewModel/setupArtist2_view_model.dart';
import 'package:hotlier/common/size_config.dart';

Widget staggeredGridTile({
  required SetupArtist2ViewModel setupArtist2VM
}){
  return  Obx(
    ()=> Container(
      height: setupArtist2VM.isReadMore.value == false ? SizeConfig.heightMultiplier * 45 : SizeConfig.heightMultiplier * 40,
      child: SingleChildScrollView(
          child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          
          children:  List.generate(
          
          12, (index) => StaggeredGridTile.count(
          
            crossAxisCellCount: 1,
            mainAxisCellCount: index.isEven  ? 2 : 1,
            child: Image(image: AssetImage('assets/explore/image.png'), fit: BoxFit.cover,)
          ),
          // StaggeredGridTile.count(
          //   crossAxisCellCount: 1,
          //   mainAxisCellCount: 2,
          //   child: Container(
          //     color: Colors.black,
          //   ),
          // ),
          //  StaggeredGridTile.count(
          //   crossAxisCellCount: 1,
          //   mainAxisCellCount: 2,
          //   child: Container(
          //     color: Colors.black,
          //   ),
          // ),
          )
          ),
        ),
    ),
  );
}