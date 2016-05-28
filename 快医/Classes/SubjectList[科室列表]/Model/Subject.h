//
//  Subject.h
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject
@property (nonatomic, copy) NSString *mainSj;
@property (nonatomic, strong) NSMutableArray *branchSj;

+ (instancetype)subjectWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)loadSubjectDataWithPlistName:(NSString *)name;
@end
