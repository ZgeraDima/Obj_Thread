//
//  ZDStudentOp.m
//  DZ 13 _Obj_Skut_Thred
//
//  Created by mac on 05.10.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "ZDStudentOp.h"

@interface ZDStudentOp ()

@end


@implementation ZDStudentOp


- (void) guessAnswer:(int) answer inRange:(NSRange) range onSuccess:(void(^)(int successGuess, int tryCount)) success {
    
    NSOperation* op = [NSBlockOperation blockOperationWithBlock:^{
        
        //NSLog(@"currentQueue: %@", NSOperationQueue.currentQueue.name);
        
        NSLog(@"%@ guess started %@", self.name, NSOperationQueue.currentQueue.name);
        
        int tryCount = 0;
        int guess;
        
        do {
            
            tryCount += 1;
            guess = arc4random_uniform((int)range.length);
            
        } while (guess != answer);
        
        [NSOperationQueue.mainQueue addOperationWithBlock:^{
            
            if (success) {
                success(guess, tryCount);
            }
            
        }];
        
    }];
    
    
    void(^completionBlock)(void) = ^{
        
        NSLog(@"%@ completionBlock", self.name);
        
    };
    
    op.completionBlock = completionBlock;
    
    
    //[op start];
    
    [[ZDStudentOp operationQueue] addOperation:op];
    
}


+ (NSOperationQueue*) operationQueue {
    
    static NSOperationQueue* queue = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[NSOperationQueue alloc] init];
        queue.name = @"Concurrent Queue";
    });
    
    return queue;
}


@end
