//
//  AppDelegate.m
//  APNTest
//
//  Created by 한상민(iPhone) on 2014. 1. 20..
//  Copyright (c) 2014년 한상민(iPhone). All rights reserved.
//

#import "AppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    UIRemoteNotificationType notiType = UIRemoteNotificationTypeBadge|
    UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;

    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:notiType];

    return YES;
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"remote notificatin : %@", [userInfo description]);
    NSDictionary *apsInfo = userInfo[@"aps"];
    NSString *alert = apsInfo[@"alert"];
    NSLog(@"Received pudh alert : %@", alert);

    NSString *sound = apsInfo[@"sound"];
    NSLog(@"Received push sound: %@", sound);

    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

    NSString *badge  = apsInfo[@"badge"];
    NSLog(@"Received Push badge : %@",badge);
    application.applicationIconBadgeNumber = [badge integerValue];


}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"Success to register APN : %@",deviceToken);
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Fail to register APN:%@", [error localizedDescription]);

}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
