//
//  NSString+CC.h
//  hedaAssistant
//
//  Created by bear on 16/5/4.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CC)

+ (NSString *)transformChinsesToPinyin:(NSString *)chinese;

+(NSString *)getDocumentPathWithFileName:(NSString *)fileName;

@end
