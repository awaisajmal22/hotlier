import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../common/size_config.dart';

Widget staggeredBrandTile(
){
  return SizedBox(
      height:SizeConfig.heightMultiplier * 26,
      
      child: SingleChildScrollView(
          child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          
          children:  List.generate(
          
          12, (index) => StaggeredGridTile.count(
          
            crossAxisCellCount: 1,
            mainAxisCellCount: index.isEven  ? 2 : 1,
            child: const Image(image: AssetImage('assets/explore/image.png'), fit: BoxFit.cover,)
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
    
  );
}