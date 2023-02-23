class NotificationModel{
  String date;
  List<NotificationData> notificationData;
  NotificationModel({
    required this.date,
    required this.notificationData
  });
}

class NotificationData{
  String title;
  String imageUrl;
  String time;
  NotificationData({
    required this.imageUrl,
    required this.time,
    required this.title
  });

}