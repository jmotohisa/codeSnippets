//
//  main.m
//  HelloWorld
//
//  Created by Junichi Motohisa on 2016/12/10.
//  Copyright © 2016年 Hokkaido University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomBytes.h"

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
    }
    return 0;
}
