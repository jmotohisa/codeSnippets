//
//  NSString+MD5.m
//  macdown-image-helper
//
//  Created by Junichi Motohisa on 2016/12/15.
//  Copyright © 2016年 jmotohisa. All rights reserved.
//

// Create MD5 Hash from NSString, NSData or a File
// taken from http://iosdevelopertips.com/core-services/create-md5-hash-from-nsstring-nsdata-or-file.html

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(MD5)

- (NSString*)MD5
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, (CC_LONG) strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}
@end