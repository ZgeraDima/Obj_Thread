//
//  ZDStudent.m
//  DZ 13 _Obj_Skut_Thred
//
//  Created by mac on 05.10.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "ZDStudent.h"

@implementation ZDStudent

/*
 - (NSString*) guessAnswer:(NSUInteger) answer inRange:(NSRange) range {
 
 
     NSUInteger low = range.location;
     NSUInteger height = range.length;
     
     NSUInteger mid;
     NSUInteger guess;
     NSInteger try = 0;
     
     
     while (low <= height) {
     
         try++;
         
         mid = (low + height) / 2;
         
         guess = mid;
     
         if (guess == answer) {
         
         NSLog(@"Try: %lu", try);
         
         return [NSString stringWithFormat:@"%lu", guess];
         
         }
         
         if (guess > answer) {
         
         height = mid - 1;
         
         } else {
         
         low = mid + 1;
         
         }
     
     }
     
     return @"Числа нет в заданном диапазоне";
 }
 */

- (void) guessAnswer:(int) answer inRange:(NSRange) range onSuccess:(void(^)(int successGuess, int tryCount)) success {
    
    dispatch_async([ZDStudent concurrentQueue], ^{
        
        NSLog(@"%@ guess started %@", self.name, [NSThread isMainThread] ? @"MainThread: YES" : @"MainThread: NO");
        
        int tryCount = 0;
        int guess;
        
        do {
            
            tryCount += 1;
            guess = arc4random_uniform((int) range.length) + (int)range.location;
            
        } while (guess != answer);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (success) {
                success(guess, tryCount);
            }
            
        });
        
    });
    
}


+ (dispatch_queue_t) concurrentQueue {
    
    static dispatch_queue_t queue = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        dispatch_queue_attr_t queueAtr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_USER_INITIATED, 0);
        
        queue = dispatch_queue_create("concurrentQueue", queueAtr);
        
    });
    
    return queue;
    
}



@end
