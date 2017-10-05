//
//  ZDStudent.h
//  DZ 13 _Obj_Skut_Thred
//
//  Created by mac on 05.10.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDStudent : NSObject

@property (strong, nonatomic) NSString* name;

//- (NSString*) guessAnswer:(NSUInteger) answer inRange:(NSRange) range;

- (void) guessAnswer:(int) answer inRange:(NSRange) range onSuccess:(void(^)(int successGuess, int tryCount)) success;


@end
