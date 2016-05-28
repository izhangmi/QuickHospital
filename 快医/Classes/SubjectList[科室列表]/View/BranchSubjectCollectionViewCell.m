//
//  BranchSubjectCollectionViewCell.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BranchSubjectCollectionViewCell.h"
#import "BranchSubjectTableView.h"

@interface BranchSubjectCollectionViewCell ()

@property (nonatomic, weak) BranchSubjectTableView *branchTV;

@end
@implementation BranchSubjectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        BranchSubjectTableView *branchSubjectTableView = [[BranchSubjectTableView alloc] init];
        
        _branchTV = branchSubjectTableView;        
        [self.contentView addSubview:branchSubjectTableView];
    }
    return self;
}

- (void)setSubject:(Subject *)subject{
    
    _subject = subject;
    self.branchTV.subject = subject;

}


- (void)layoutSubviews{

    [super layoutSubviews];
    
    _branchTV.frame = self.bounds;

}

@end
