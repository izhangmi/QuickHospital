//
//  NSString+CC.m
//  hedaAssistant
//
//  Created by bear on 16/5/4.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "NSString+CC.h"

@implementation NSString (CC)

+(NSString *)getDocumentPathWithFileName:(NSString *)fileName{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath=[docPath stringByAppendingPathComponent:fileName];
    NSLog(@"-------%@",filePath);
    return filePath;
}



+ (NSString *)transformChinsesToPinyin:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSLog(@"%@", pinyin);
    return [pinyin uppercaseString];
}
@end
