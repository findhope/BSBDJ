//
//  NSString+ZHYExtensiton.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/23.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "NSString+ZHYExtensiton.h"

@implementation NSString (ZHYExtensiton)
- (NSInteger)fileSize {
    
    
    NSFileManager * fileManger = [NSFileManager defaultManager];
    // 是否为文件夹
    BOOL isDirectory = NO;
    // 这个路径是否存在
    BOOL exists = [fileManger fileExistsAtPath:self isDirectory:&isDirectory];
    if (exists == NO) {
        // 路径不存在
        return 0;
    }
    if (isDirectory) { // 如果是文件夹
        NSInteger size = 0;
        NSDirectoryEnumerator * enumerator = [fileManger enumeratorAtPath:self];
        for (NSString * subPath in enumerator) {
            // 获得全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            // 获得文件属性
            NSDictionary *attrs = [fileManger attributesOfItemAtPath:fullPath error:nil];
            size += attrs.fileSize;
        }
        return size;
        
    } else { // 如果是文件
        
        return [fileManger attributesOfItemAtPath:self error:nil].fileSize;
    }
}
@end
