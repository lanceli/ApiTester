//
//  ATLinkedinMutableURLRequest.m
//  ApiTester
//
//  Created by WU Kai on 6/19/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ATLinkedinMutableURLRequest.h"


@implementation ATLinkedinMutableURLRequest

- (void)setParameters:(NSArray *)parameters 
{
    NSString *url = [[self URL] URLStringWithoutQuery];
    NSString *selector = @"";

    NSMutableString *encodedParameterPairs = [NSMutableString stringWithCapacity:256];
    
    int position = 1;
    for (OARequestParameter *requestParameter in parameters) 
	{
        if ([requestParameter.name characterAtIndex:0] != '@') {
            [encodedParameterPairs appendString:[requestParameter URLEncodedNameValuePair]];
            if (position < [parameters count])
                [encodedParameterPairs appendString:@"&"];
            
            position++;
        }
        else if ([requestParameter.name isEqual:@"@selector"]) {
            //linkedin's selector definition
            selector = requestParameter.value;
        }
        else {
            //one and only one variable in the shit linkedin api such as @id @url
            NSString *new = [url stringByReplacingOccurrencesOfString:requestParameter.name withString:requestParameter.value];
            url = new;
        }
    }
    if ([encodedParameterPairs hasSuffix:@"&"]) {
        NSRange and = {[encodedParameterPairs length]-1,1};
        [encodedParameterPairs deleteCharactersInRange:and];
    }
    
    if ([[self HTTPMethod] isEqualToString:@"GET"] || [[self HTTPMethod] isEqualToString:@"DELETE"])
        [self setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",url, selector, encodedParameterPairs]]];
    else 
	{
        // POST, PUT
        NSData *postData = [encodedParameterPairs dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [self setHTTPBody:postData];
        [self setValue:[NSString stringWithFormat:@"%d", [postData length]] forHTTPHeaderField:@"Content-Length"];
        [self setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [self setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",url, selector]]];
    }
}
@end
