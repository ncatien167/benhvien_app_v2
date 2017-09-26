//
//  ApiManager.h
//  benhvien_app_v2
//
//  Created by AnhTien on 9/20/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ApiResponse.h"
#import "ApiEndPoint.h"
#import <AFNetworking/AFNetworking.h>
#import "UserDataManager.h"

typedef enum{
    GET,
    POST,
    PUT
} ApiMeThod;

@interface ApiManager : NSObject

typedef void (^ApiCompletionBlock)(ApiResponse *response, NSError *error);

+ (instancetype)sharedClient;

- (void)requestWithEndPoint:(NSString *)endpoint
                     method:(ApiMeThod)method
                 parameters:(NSDictionary *)parameters
                    hasAuth:(BOOL)hasAuth
                 completion:(ApiCompletionBlock)completion;

@end
