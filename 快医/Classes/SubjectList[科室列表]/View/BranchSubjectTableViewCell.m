//
//  BranchSubjectTableViewCell.m
//  快医
//
//  Created by 付凯琪 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BranchSubjectTableViewCell.h"

@implementation BranchSubjectTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake( 0, self.height - 1, self.width, 1)];
        view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        
        [self.contentView addSubview:view];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
    
    if (self.selected) {
        self.textLabel.textColor = [UIColor colorWithRed:0.281 green:0.592 blue:0.878 alpha:1.000];
    }else {
        self.textLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    }
}

- (void)setHighlighted:(BOOL)highlighted{
//
}
@end
