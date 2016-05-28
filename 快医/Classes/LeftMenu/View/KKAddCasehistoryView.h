//
//  KKAddCasehistoryView.h
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKAddCasehistoryView : UIView

//@property (nonatomic, copy) void(^addCoverBlock)();
@property (nonatomic, copy) void(^jumpToMedicalRecord)();
@property (nonatomic, copy) void(^jumpToSearchController)();

@property (weak, nonatomic) IBOutlet UILabel *showCaseTypeLabel;

@end
