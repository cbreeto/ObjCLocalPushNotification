//
//  AppDelegate.m
//  PushyApp
//
//  Created by Carlos Brito on 19/11/15.
//  Copyright © 2015 Carlos Brito. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void) application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler{
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received while in action" message:identifier preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [ac addAction:aa];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    });

    completionHandler();
    
    
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UILocalNotification *localNotif = launchOptions [UIApplicationLaunchOptionsLocalNotificationKey];
    
    application.applicationIconBadgeNumber = 0;
    
    if (localNotif) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received on lunch" message:localNotif.alertBody preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
        [ac addAction:aa];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
        });

    }
    
    
    return YES;
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    application.applicationIconBadgeNumber = 0;

    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Receive while running" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    [ac addAction:aa];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
                                                [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    });
}

@end