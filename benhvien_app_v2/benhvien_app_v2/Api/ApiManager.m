//
//  ApiManager.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/20/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "ApiManager.h"

@interface ApiManager()
{
    
}

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation ApiManager

+ (instancetype)sharedClient {
    static ApiManager *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[ApiManager alloc] init];
        [_shareClient setepManager];
    });
    return _shareClient;
}

- (void)setepManager {
    self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
}

-(void)setupHeader {
    [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content_Type"];
    [self.manager.requestSerializer setValue:[self getAccessToken] forHTTPHeaderField:@"Authorization"];
}

- (NSString *)getAccessToken {
    NSString *token = [NSString stringWithFormat:@"JWT %@",[UserDataManager shareClient].accessToken];
    return token;
}

- (void)requestWithEndPoint:(NSString *)endpoint
                     method:(ApiMeThod)method
                 parameters:(NSDictionary *)parameters
                    hasAuth:(BOOL)hasAuth
                 completion:(ApiCompletionBlock)completion {
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@",BaseURL, endpoint];
    
    if (hasAuth) {
        [self setupHeader];
    }
    
    switch (method) {
        case GET:
            [self processGetRequestWithURL:fullUrl parameters:parameters completion:completion];
            break;
        
        case POST:
            [self processPostRequestWithUrl:fullUrl parameters:parameters completion:completion];
            break;
            
        case PUT:
            [self processPutRequestWithUrl:fullUrl parameters:parameters completion:completion];
            break;
            
        default:
            break;
    }
}

#pragma mark - GET

- (void)processGetRequestWithURL:(NSString *)url
                      parameters:(NSDictionary *)parameters
                      completion:(ApiCompletionBlock)completion {
    [self.manager GET:url
           parameters:parameters
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  [self processSuccessWithRespone:responseObject completion:completion];
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  [self processFailureWithError:error completion:completion];
              }];
}

#pragma mark - POST

- (void)processPostRequestWithUrl:(NSString *)url
                      parameters:(NSDictionary *)parameters
                      completion:(ApiCompletionBlock)completion {
    [self.manager POST:url
            parameters:parameters
              progress:nil
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   [self processSuccessWithRespone:responseObject completion:completion];
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   [self processFailureWithError:error completion:completion];
               }];
}

#pragma mark - PUT

- (void)processPutRequestWithUrl:(NSString *)url
                      parameters:(NSDictionary *)parameters
                      completion:(ApiCompletionBlock)completion {
    [self.manager PUT:url
           parameters:parameters
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  [self processSuccessWithRespone:responseObject completion:completion];
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
              }];
}

#pragma mark - GET

- (void)processSuccessWithRespone:(id)responseObject completion:(ApiCompletionBlock)completion {
    ApiResponse *response = [ApiResponse initWithResponse:responseObject];
    if (completion) {
        completion(response, nil);
        NSLog(@"%@",responseObject);
    }
}

#pragma  mark - FAILURE

- (void)processFailureWithError:(NSError *)error completion:(ApiCompletionBlock)completion {
    if (completion) {
        completion(nil, error);
        NSLog(@"%@",error);
    }
}

@end
