//
//  NSString+MD5.h
//  macdown-image-helper
//
//  Created by Junichi Motohisa on 2016/12/15.
//  Copyright © 2016年 jmotohisa. All rights reserved.
//

// Create MD5 Hash from NSString, NSData or a File
// taken from http://iosdevelopertips.com/core-services/create-md5-hash-from-nsstring-nsdata-or-file.html

#import <Cocoa/Cocoa.h>

@interface NSString(MD5)

- (NSString *)MD5;

@end
