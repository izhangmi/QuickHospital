//
//  ChineseInclude.m
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ChineseInclude.h"

@implementation ChineseInclude
+ (BOOL)isIncludeChineseInString:(NSString*)str {
    for (int i=0; i<str.length; i++) {
        unichar ch = [str characterAtIndex:i];
        if (0x4e00 < ch  && ch < 0x9fff) {
            return true;
        }
    }
    return false;
}
@end
