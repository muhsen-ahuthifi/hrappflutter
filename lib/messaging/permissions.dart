
import 'package:firebase_messaging/firebase_messaging.dart';

class NgNotificationManager{
 static void subscribe(String? empId,bool isHrAdmin) async{

  await FirebaseMessaging.instance.subscribeToTopic('alaman_all');
   if(empId!=null)
    await FirebaseMessaging.instance.subscribeToTopic('alaman_'+empId);
   if(isHrAdmin)
     await FirebaseMessaging.instance.subscribeToTopic('alaman_hr');

  }
static void unSubscribe(String? empId) async{

  await FirebaseMessaging.instance.unsubscribeFromTopic('alaman_all');
  if(empId!=null)
    await FirebaseMessaging.instance.unsubscribeFromTopic('alaman_'+empId);
  await FirebaseMessaging.instance.unsubscribeFromTopic('alaman_hr');

  }
 static Future<void> requestPermissions() async {
   

    NotificationSettings settings =
        await FirebaseMessaging.instance.getNotificationSettings();

    if(settings.authorizationStatus==AuthorizationStatus.notDetermined||
    settings.authorizationStatus==AuthorizationStatus.denied){
       
        await FirebaseMessaging.instance.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    }
  }


}


/// Requests & displays the current user permissions for this device.


// /// Maps a [AuthorizationStatus] to a string value.
// const statusMap = {
//   AuthorizationStatus.authorized: 'Authorized',
//   AuthorizationStatus.denied: 'Denied',
//   AuthorizationStatus.notDetermined: 'Not Determined',
//   AuthorizationStatus.provisional: 'Provisional',
// };

/// Maps a [AppleNotificationSetting] to a string value.
// const settingsMap = {
//   AppleNotificationSetting.disabled: 'Disabled',
//   AppleNotificationSetting.enabled: 'Enabled',
//   AppleNotificationSetting.notSupported: 'Not Supported',
// };

// /// Maps a [AppleShowPreviewSetting] to a string value.
// const previewMap = {
//   AppleShowPreviewSetting.always: 'Always',
//   AppleShowPreviewSetting.never: 'Never',
//   AppleShowPreviewSetting.notSupported: 'Not Supported',
//   AppleShowPreviewSetting.whenAuthenticated: 'Only When Authenticated',
// };