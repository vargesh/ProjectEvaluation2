//
//  MainCell.m
//  ProjectEvaluation
//
//  Created by 9Dim on 21/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import "MainCell.h"
#import "GlobalClass.h"
@implementation MainCell

- (void)awakeFromNib {
    // Initialization code
    CGRect NewFrame=  _backgroundV.frame;
    NewFrame.size.width=SCREEN_WIDTH;
    _backgroundV.frame=NewFrame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
