import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../common/app_Text.dart';
import '../../../../../common/app_color.dart';
import '../../Model/notification_model.dart';

Widget slidableTile(
  {
   required List<NotificationModel> notification,
  }
) {
    return ListView(
                children: List.generate(notification.length, (index) => Column(
              children: [
              Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: const Color(0xffC2C3CB),
                              height: 1,
                            ),
                          ),
                          const SizedBox(width: 4.5,),
                        appText(text: notification[index].date, fontSize: 20, fontweight: FontWeight.w400,textAlign: TextAlign.start, textColor: AppColor.textBlack.withOpacity(0.6)),
                        const SizedBox(
                          width: 4.5,
                        ),
                        Expanded(
                          child: Container(
                              color: const Color(0xffC2C3CB),
                              height: 1,
                            ),
                        ),
                        ],
                       ),
                
                Column(
                  children: List.generate(notification[index].notificationData.length, (i) =>Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10,),
                  child: Slidable(
                    
                    key: const ValueKey(0),
                    closeOnScroll: true,
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(), 
                      extentRatio: 0.22,
                      dismissible: DismissiblePane(onDismissed: (){}),
                    children:const [
                      SlidableAction(
                        onPressed: null,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                        backgroundColor: Color(0xffFF5555),
                        icon: Icons.delete,
                        foregroundColor: AppColor.buttonColor,
                        
                      )
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        tileColor: AppColor.buttonColor,
                        contentPadding: const EdgeInsets.only(left: 10, top: 5.5, right: 5),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(notification[index].notificationData[i].imageUrl),
                          
                        ),
                        title: FittedBox(child: appText(text: 'You have Recieved a Proposal...', textColor: const Color(0xff323142), fontSize: 20, fontweight: FontWeight.w700)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(text: 'Lorem ipsum dolor sit amet consectetur. Iaculis in quam scelerisque fames convallis ...', fontSize: 14,textAlign: TextAlign.left, fontweight: FontWeight.w400, textColor: AppColor.shadowColor),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                appText(text: 'Today  8:38 AM', textColor: AppColor.shadowColor,fontSize: 14, fontweight: FontWeight.w400)
                              ],
                            )
                          ],
                        ),
                        
                      ),
                    ),
                  ),),
                  ),
                  
                ),
                const SizedBox(
                  height: 31,
                )
              ],
            )),
              );
    
  }