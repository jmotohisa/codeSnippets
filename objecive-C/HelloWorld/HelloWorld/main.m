//
//  main.m
//  HelloWorld
//
//  Created by Junichi Motohisa on 2016/12/10.
//  Copyright © 2016年 Hokkaido University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomBytes.h"
#import "NSString+MD5.h"
#import "NSData+MD5.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSUInteger i=6;
        RandomBytes *fileNameData=[[RandomBytes alloc] init];
        NSData *dt=[fileNameData getRandomBytes:i];
        NSLog(@"%@", [[NSString alloc] initWithData:dt
                                           encoding:NSUTF8StringEncoding]);
        NSString *fileName = [dt base64EncodedStringWithOptions:0];
        NSLog(@"%@",fileName);
        
        // NSString+MD5
        
        NSString *str = @"String to convert to MD5";
        NSLog(@"MD5 hash of string: %@", [str MD5]);

        // NSdata+MD5
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TestFile" ofType:@"txt"];
        NSData *nsData = [NSData dataWithContentsOfFile:path];
        if (nsData) 
            NSLog(@"MD5 hash of file: %@", [nsData MD5]);
    }
    return 0;
}
