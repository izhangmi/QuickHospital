//
//  Subject.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "Subject.h"

@implementation Subject
+ (instancetype)subjectWithDict:(NSDictionary *)dict{

    Subject *subject = [[Subject alloc] init];
    [subject setValuesForKeysWithDictionary:dict];
    
    return subject;
}

+ (NSMutableArray *)loadSubjectDataWithPlistName:(NSString *)name{

    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Subject *subject = [Subject subjectWithDict:obj];
        [arrM addObject:subject];
    }];
    return arrM;
}

@end
