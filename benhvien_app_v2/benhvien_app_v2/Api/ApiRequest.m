//
//  ApiRequest.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/20/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "ApiRequest.h"

@implementation ApiRequest

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(ApiCompletionBlock)completion {
    NSDictionary *parameters = @{@"email": email,
                                 @"password": password};
    [[ApiManager sharedClient] requestWithEndPoint:Login method:POST parameters:parameters hasAuth:false completion:completion];
}

+ (void)registerUserWithEmail:(NSString *)email
                     password:(NSString *)password
                         city:(NSString *)city
                     fullName:(NSString *)fullName
                   completion:(ApiCompletionBlock)completion {
    NSDictionary *parameters = @{@"email": email,
                                 @"password": password,
                                 @"role": @"email",
                                 @"fullname": fullName};
    [[ApiManager sharedClient] requestWithEndPoint:Register method:PUT parameters:parameters hasAuth:false completion:completion];
}

+ (void)searchHospitalWithName:(NSString *)name completion:(ApiCompletionBlock)completion {
    NSDictionary *parameters = @{@"name": name};
    [[ApiManager sharedClient] requestWithEndPoint:SearchByName method:GET parameters:parameters hasAuth:true completion:completion];
}

@end
