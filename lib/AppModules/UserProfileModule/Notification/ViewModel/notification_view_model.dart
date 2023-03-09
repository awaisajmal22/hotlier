import 'package:get/get.dart';

import '../../Model/notification_model.dart';

class NotificationViewModel extends GetxController{
  List<NotificationModel> notificationList = <NotificationModel>[
   NotificationModel(
    date: '04 March,2023', 
   notificationData: [
    NotificationData(imageUrl: 'https://images.ctfassets.net/kdawwlsweh27/2LtummpjO849eQ83yGGiUN/b33c73279163c84b65241cdfcc1c8844/Fresh_Stock_Content.jpg',
     time: 'Today 8:30 pm', title: 'hi My name is Ali'),
     NotificationData(
      imageUrl: 'https://thumbs.dreamstime.com/b/desperate-man-suffering-emotional-pain-grief-deep-depression-young-hands-covering-face-disorder-desperation-concept-44168769.jpg',
     time: 'Today 8:30 pm', title: 'hi My name is Ali'),
    ]
    ),
    NotificationModel(
    date: '22, Feb,2023', 
   notificationData: [
    NotificationData(
      imageUrl: 'https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
     time: 'Today 8:30 pm', title: 'hi My name is Ali'),
      NotificationData(
      imageUrl: 'https://tinypng.com/images/social/website.jpg',
     time: 'Today 8:30 pm', title: 'hi My name is Ali'),
      NotificationData(
      imageUrl: 'https://images.ctfassets.net/hrltx12pl8hq/qGOnNvgfJIe2MytFdIcTQ/429dd7e2cb176f93bf9b21a8f89edc77/Images.jpg',
     time: 'Today 8:30 pm', title: 'hi My name is Ali'),
    ]
    ),
  ];
}