//
//  MainSubjectCell.m
//  快医
//
//  Created by 付凯琪 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MainSubjectCell.h"

@implementation MainSubjectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake( 0, 87, self.width, 1)];
        view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        
        [self.contentView addSubview:view];
        
        
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
//取消高亮选中
}
@end
