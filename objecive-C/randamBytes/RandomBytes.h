//
//  RandomBytes.h
//  HelloWorld
//
//  Created by Junichi Motohisa on 2016/12/10.
//  Copyright © 2016年 Hokkaido University. All rights reserved.
//

// Generating Random Numbers Securely in Objective-C
// taken from http://stackoverflow.com/questions/9234686/generating-random-numbers-securely-in-objective-c

#import <Foundation/Foundation.h>

@interface RandomBytes : NSData

-(NSData *)getRandomBytes :(NSUInteger)length;

@end
