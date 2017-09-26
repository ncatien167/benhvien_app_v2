//
//  ApiResponse.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/20/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "ApiResponse.h"

@implementation ApiResponse

+ (instancetype)initWithResponse:(NSDictionary *)response {
    ApiResponse *serverResponse = [[ApiResponse alloc] init];
    [serverResponse parseResponse:response];
    return  serverResponse;
}

- (void)parseResponse:(NSDictionary *)response {
    NSString *message = [response objectForKey:@"message"];
    if ([message isKindOfClass:[NSNull class]]) {
        self.message = @"";
    } else {
        self.message = message;
    }
    
    NSNumber *success = [response objectForKey:@"success"];
    if (success) {
        self.sucsess = [success boolValue];
    }
    
    self.data = [response objectForKey:@"data"];
    self.originalResponse = response;
}

@end
