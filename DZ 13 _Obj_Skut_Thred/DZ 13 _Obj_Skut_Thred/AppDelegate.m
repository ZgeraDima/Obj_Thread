//
//  AppDelegate.m
//  DZ 13 _Obj_Skut_Thred
//
//  Created by mac on 05.10.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "AppDelegate.h"
#import "ZDStudent.h"
#import "ZDStudentOp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // GCD
    /*
     NSMutableArray* students = [NSMutableArray array];
     
     for (int i = 0; i < 5; i++) {
         Student* student = [[Student alloc] init];
         student.name = [NSString stringWithFormat:@"Student%d", i + 1];
         
         [students addObject:student];
     }
     
     NSRange range = NSMakeRange(0, 100);
     
     int answer = arc4random_uniform((int) range.length) + (int)range.location;
     
     NSLog(@"Загаданное число: %d", answer);
     
     for (Student* student in students) {
         [student guessAnswer:answer inRange:range onSuccess:^(int successGuess, int tryCount) {
         NSLog(@"%@ guess ended: %d tryCount: %d %@", student.name, successGuess, tryCount, [NSThread isMainThread] ? @"MainThread: YES" : @"MainThread: NO");
         }];
     }
     */
    
    // NSOperation
    
    NSMutableArray* students = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        ZDStudentOp* student = [[ZDStudentOp alloc] init];
        student.name = [NSString stringWithFormat:@"Student%d", i + 1];
        
        [students addObject:student];
    }
    
    NSRange range = NSMakeRange(0, 10000000);
    int answer = arc4random_uniform(10000000);
    
    NSLog(@"Загаданное число: %d", answer);
    
    for (ZDStudentOp* student in students) {
        [student guessAnswer:answer inRange:range onSuccess:^(int successGuess, int tryCount) {
            NSLog(@"%@ guess ended: %d tryCount: %d %@", student.name, successGuess, tryCount, NSOperationQueue.currentQueue.name);
        }];
    }
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
