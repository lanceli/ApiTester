//
//  ApiResultCell.m
//  ApiTester
//
//  Created by WU Kai on 6/14/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiResultCell.h"


@implementation ApiResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
