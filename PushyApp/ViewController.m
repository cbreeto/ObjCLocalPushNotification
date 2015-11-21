//
//  ViewController.m
//  PushyApp
//
//  Created by Carlos Brito on 19/11/15.
//  Copyright © 2015 Carlos Brito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


- (void) requestPermissionToNotify;

- (void) createANotification: (int) secondsInTheFuture;

@end

@implementation ViewController
- (IBAction)buttonTapped:(id)sender {
    
    [self requestPermissionToNotify];
    [self createANotification:15];
}



- (void) createANotification: (int) secondsInTheFuture {
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    
    //timezone will change as the user moves
    localNotif.timeZone = nil;
    
    localNotif.alertTitle = @"Alert Title";
    
    localNotif.alertBody = @"Alert Body"    ;
    
    localNotif.alertAction = @"Okay";
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    localNotif.applicationIconBadgeNumber = 123;
    
    localNotif.category = @"MAIN_CATEGORY";
    
    
    
  //  [[UIApplication sharedApplication] scheduledLocalNotifications];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
    
    
    
}

- (void) requestPermissionToNotify{
    
    //
    UIMutableUserNotificationAction * floatAction = [[UIMutableUserNotificationAction alloc ] init ];
    //Identifier wich action the user picked,
    floatAction.identifier = @"FLOAT_ACTION";
    floatAction.title = @"Float";
    floatAction.activationMode = UIUserNotificationActivationModeBackground ;
    
    //In red
    floatAction.destructive = YES;
    floatAction.authenticationRequired = NO;
    
    
    
    //
    UIMutableUserNotificationAction * stingAction = [[UIMutableUserNotificationAction alloc ] init ];
    //Identifier wich action the user picked,
    stingAction.identifier = @"STING_ACTION";
    stingAction.title = @"15 seconds";
    stingAction.activationMode = UIUserNotificationActivationModeForeground ;
    
    //In red
    stingAction.destructive = NO;
    stingAction.authenticationRequired = YES;
    
    
    
    //Define categories
    
    UIMutableUserNotificationCategory * responseCategory = [[UIMutableUserNotificationCategory alloc] init];
    
    responseCategory.identifier = @"MAIN_CATEGORY";
    
    [responseCategory setActions:@[floatAction, stingAction] forContext:UIUserNotificationActionContextDefault];
    
    
    
    NSSet * categories = [NSSet setWithObjects:responseCategory, nil];
    
    
    
    
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
