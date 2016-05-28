//
//  BranchSubjectCollectionView.h
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BranchSubjectCollectionView : UICollectionView

//选中行通知
@property (nonatomic, copy) NSString *selectNotity;
//加载数据
@property (nonatomic, copy) NSString *loadDataNotity;
//被滚动
@property (nonatomic, copy) NSString *scrollNotity;

@end
