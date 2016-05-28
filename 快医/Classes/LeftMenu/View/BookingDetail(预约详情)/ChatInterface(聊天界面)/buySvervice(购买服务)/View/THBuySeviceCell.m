//
//  THBuySeviceCell.m
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBuySeviceCell.h"

@interface THBuySeviceCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLblLeftCon;

@end

@implementation THBuySeviceCell

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *linerPath = [UIBezierPath bezierPath];
    
    [COLOR(35, 189, 184, 1)  set];
    [linerPath moveToPoint:CGPointMake(0, self.height-1)];
    [linerPath addLineToPoint:CGPointMake(self.width-1, self.height-1)];
    
    linerPath.lineWidth = 0.7;

    [linerPath stroke];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone ;
    // Initialization code

}

- (void)setModel:(THBuySeviceModel *)model
{
    _model = model ;
    if (model.isPrompt) {
        _titleLbl.text = _model.title ;
        _iconV.hidden = YES;
        _rightBtn.hidden = YES;
        _titleLbl.textColor = [UIColor grayColor];
        _titleLblLeftCon.constant = -10 ;
    }else
    {
      _iconV.image = [UIImage imageNamed:_model.iconName];
        _titleLbl.textColor = [UIColor blackColor];
        _iconV.hidden = NO;

        _titleLbl.text = _model.title;
        _titleLblLeftCon.constant = 10 ;

        _rightBtn.hidden = NO;
        _rightBtn.selected = _model.isSelected ;
    }
}

@end
