package com.jing.utils;

import cn.jpush.api.JPushClient;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;
  
public class Jiguang {  
     public static JPushClient jPushClient=null;  
     static String masterSecret="5ebf4fe9cd3138617b242d41";  
     static String appKey="24003ddd7abacaac4d80eb37";  
     static {  
         jPushClient =new JPushClient(masterSecret, appKey);  
         //PushPayload payload = buildPushObject_all_all_alert();  
     }  
      
     public static PushPayload buildPushObject_all_all_alert(){  
        return PushPayload.newBuilder().setPlatform(Platform.android()).setAudience(Audience.tag("tag1")).setNotification(Notification.android("乐吧一日游", "title", null)).build();  
     }
     
     public static PushPayload buildPushObject_single_alert(String content, String title, String tag){  
         //return PushPayload.newBuilder().setPlatform(Platform.android()).setAudience(Audience.tag(tag)).setNotification(Notification.android(content, title, null)).build();
//	        return PushPayload.newBuilder()  
//	                .setPlatform(Platform.android_ios())  
//	                .setAudience(Audience.tag(tag))  
//	                .setNotification(Notification.newBuilder()  
//	                        .setAlert(content)  
//	                        .addPlatformNotification(AndroidNotification.newBuilder()  
//	                                .setTitle(title).build())  
//	                        .addPlatformNotification(IosNotification.newBuilder()  
//	                                .incrBadge(1)  
//	                                .addExtra("title", title).build())  
//	                        .build())  
//	                .build();  
//    	 return PushPayload.newBuilder()  
//                 .setPlatform(Platform.android_ios())  
//                 .setAudience(Audience.newBuilder()  
//                         .addAudienceTarget(AudienceTarget.tag(tag, tag))  
//                         .addAudienceTarget(AudienceTarget.alias(tag, tag))  
//                         .build())
//                  .setNotification(Notification.newBuilder()  
//	                        .setAlert(content)  
//	                        .addPlatformNotification(AndroidNotification.newBuilder()  
//	                                .setTitle(title).build())  
//	                        .addPlatformNotification(IosNotification.newBuilder()  
//	                                .incrBadge(1)  
//	                                .addExtra("title", title).build())  
//	                        .build())
//                 .setMessage(Message.newBuilder()  
//                         .setMsgContent(content)  
//                         .addExtra("title", title)  
//                         .build())  
//                 .build();  
    	 
    	 
//    	 return PushPayload.newBuilder()
//                 .setPlatform(Platform.android_ios())
//                 .setAudience(Audience.newBuilder()
//                         .addAudienceTarget(AudienceTarget.tag(tag))
//                         .addAudienceTarget(AudienceTarget.alias(tag))
//                         .build())
//                 .setMessage(Message.newBuilder()
//                         .setMsgContent(content)
//                         .addExtra("from", "JPush")
//                         .addExtra("title", title)
//                         .build())
//                 .build();
    	 
    	 return PushPayload.newBuilder()  
                 .setPlatform(Platform.android_ios())  
                 .setAudience(Audience.tag_and(tag))  
                 .setNotification(Notification.newBuilder()
	                        .addPlatformNotification(
	                        		AndroidNotification
	                        		.newBuilder()  
	                        		.setAlert(title)
	                        		.setTitle(title)
	                        		.build())  
                         .addPlatformNotification(
                        		 IosNotification
                        		 .newBuilder()  
                                 .setAlert(title)
//                                 .setBadge(5)  
                                 .setSound("happy")  
                                 .addExtra("from", "JPush")  
                                 .build())  
                         .build())  
                  .setMessage(Message.newBuilder().setTitle(title).setMsgContent(content).build())//Message.content(content)
                  .setOptions(Options.newBuilder()  
                          .setApnsProduction(true)  
                          .build())  
                  .build();  
	    }
     
}  
