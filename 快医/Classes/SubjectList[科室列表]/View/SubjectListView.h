//
//  SubjectListView.h
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HospitalData.h"
@interface SubjectListView : UIView

@property (nonatomic, weak) HospitalData *data;
@property (nonatomic, assign) CGFloat headerH;

@property (nonatomic, copy) NSString *selectNotity;
@property (nonatomic, copy) NSString *scrollNotity;
@property (nonatomic, copy) NSString *loadDataNotity;
@property (nonatomic, copy) NSString *dataName;
@end
