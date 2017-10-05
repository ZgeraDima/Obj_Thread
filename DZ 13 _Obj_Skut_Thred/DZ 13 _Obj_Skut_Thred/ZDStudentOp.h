//
//  ZDStudentOp.h
//  DZ 13 _Obj_Skut_Thred
//
//  Created by mac on 05.10.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDStudentOp : NSObject

@property (strong, nonatomic) NSString* name;

- (void) guessAnswer:(int) answer inRange:(NSRange) range onSuccess:(void(^)(int successGuess, int tryCount)) success;


@end
