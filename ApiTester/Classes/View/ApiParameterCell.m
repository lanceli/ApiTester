//
//  ApiParameterCell.m
//  ApiTester
//
//  Created by WU Kai on 6/14/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiParameterCell.h"


@implementation ApiParameterCell

@synthesize parameterName,parameterValue;

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
    [parameterName release];
    [parameterValue release];
    [super dealloc];
}

@end
