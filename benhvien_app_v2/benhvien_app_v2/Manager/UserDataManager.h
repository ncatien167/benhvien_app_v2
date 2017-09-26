//
//  UserDataManager.h
//  benhvien_app_v2
//
//  Created by AnhTien on 9/21/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataManager : NSObject

@property (strong, nonatomic) NSString *accessToken;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *role;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *fullname;

+ (instancetype)shareClient;
- (void)setUserData:(NSDictionary *)data;
- (void)clearUserData;

@end
