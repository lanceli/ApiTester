//
//  ATTencentMutableURLRequest.m
//  ApiTester
//
//  Created by WU Kai on 6/2/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ATTencentMutableURLRequest.h"


@implementation ATTencentMutableURLRequest

- (void)prepare 
{
    // sign
	// Secrets must be urlencoded before concatenated with '&'
	// TODO: if later RSA-SHA1 support is added then a little code redesign is needed
    signature = [signatureProvider signClearText:[self _signatureBaseString]
                                      withSecret:[NSString stringWithFormat:@"%@&%@",
												  [consumer.secret URLEncodedString],
                                                  [token.secret URLEncodedString]]];
    NSLog(@"The signature is : %@",signature);
    
    // set OAuth headers
    NSString *oauthToken;
    if ([token.key isEqualToString:@""])
        oauthToken = @""; // not used on Request Token transactions
    else
        oauthToken = [NSString stringWithFormat:@"oauth_token=%@&", [token.key URLEncodedString]];
	
	NSMutableString *extraParameters = [NSMutableString string];
	
	// Adding the optional parameters in sorted order isn't required by the OAuth spec, but it makes it possible to hard-code expected values in the unit tests.
	for(NSString *parameterName in [[extraOAuthParameters allKeys] sortedArrayUsingSelector:@selector(compare:)])
	{
		[extraParameters appendFormat:@"&%@=%@",
		 [parameterName URLEncodedString],
		 [[extraOAuthParameters objectForKey:parameterName] URLEncodedString]];
	}	

    NSString *oauthParameters = [NSString stringWithFormat:
        @"oauth_callback=null&oauth_consumer_key=%@&oauth_nonce=%@&oauth_signature=%@&oauth_signature_method=%@&oauth_timestamp=%@&%@oauth_version=1.0%@",
        [consumer.key URLEncodedString],
        //[nonce stringByReplacingOccurrencesOfString:@"-" withString:@""],
        nonce,
        [signature URLEncodedString],
        [[signatureProvider name] URLEncodedString],
        timestamp,
        oauthToken,
        extraParameters];
    NSLog(@"The oauth paramerters are : %@",oauthParameters);
    [self setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", [[self URL] URLStringWithoutQuery], oauthParameters]]];
}

@end
