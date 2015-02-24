//
//  NewsTableViewCell.m
//  Auto_Layout
//
//  Created by Christi John on 12/02/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    self.contentView.frame = self.bounds;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView updateConstraintsIfNeeded];
    [self.contentView layoutIfNeeded];
    
    self.descLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.descLabel.frame);
}


@end
