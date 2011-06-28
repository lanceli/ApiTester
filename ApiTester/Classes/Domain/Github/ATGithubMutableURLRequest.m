//
//  ATGithubMutableURLRequest.m
//  ApiTester
//
//  Created by WU Kai on 6/28/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ATGithubMutableURLRequest.h"


@implementation ATGithubMutableURLRequest

- (void)setParameters:(NSArray *)parameters
{
    NSString *url = [[self URL] URLStringWithoutQuery];

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
        [self setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",url,encodedParameterPairs]]];
    else 
	{
        // POST, PUT
        NSData *postData = [encodedParameterPairs dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        [self setHTTPBody:postData];
        [self setValue:[NSString stringWithFormat:@"%d", [postData length]] forHTTPHeaderField:@"Content-Length"];
        [self setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [self setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
    }
}

- (void)prepare
{
    NSString *oauthHeader = [NSString stringWithFormat:@"token %@",token.key];
    NSLog(@"The header is : %@",oauthHeader);
	
    [self setValue:oauthHeader forHTTPHeaderField:@"Authorization"];
}

@end
