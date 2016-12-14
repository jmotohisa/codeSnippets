//
//  RandomBytes.m
//  HelloWorld
//
//  Created by Junichi Motohisa on 2016/12/10.
//  Copyright © 2016年 Hokkaido University. All rights reserved.
//

// Generating Random Numbers Securely in Objective-C
// taken from http://stackoverflow.com/questions/9234686/generating-random-numbers-securely-in-objective-c

#import "RandomBytes.h"

@implementation RandomBytes

-(NSData *)getRandomBytes:(NSUInteger)length {
    return [[NSFileHandle fileHandleForReadingAtPath:@"/dev/random"] readDataOfLength:length];
}

@end
