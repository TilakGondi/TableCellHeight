//
//  RTCustomCellTableViewCell.m
//  TableCellHeight
//
//  Created by DEV_IPHONE_01 on 08/10/14.
//  Copyright (c) 2014 tilak_ios. All rights reserved.
//

#import "RTCustomCellTableViewCell.h"

@implementation RTCustomCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
