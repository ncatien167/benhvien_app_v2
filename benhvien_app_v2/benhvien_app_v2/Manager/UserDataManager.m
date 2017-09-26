//
//  UserDataManager.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/21/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "UserDataManager.h"
#import "NSUserDefaults+Utility.h"
#import "Constants.h"

@implementation UserDataManager

@synthesize accessToken = _accessToken;
@synthesize role = _role;
@synthesize fullname = _fullname;
@synthesize city = _city;
@synthesize email = _email;
@synthesize userId = _userId;

+ (instancetype)shareClient {
    static UserDataManager *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[UserDataManager alloc] init];
    });
    return _shareClient;
}

- (void)setUserData:(NSDictionary *)data {
    self.accessToken    = [data objectForKey:@"token"];
    self.userId         = [data objectForKey:@"userId"];
    self.role           = [data objectForKey:@"role"];
    self.fullname       = [data objectForKey:@"fullName"];
    self.email          = [data objectForKey:@"email"];
    self.city           = [data objectForKey:@"city"];
}

- (void)clearUserData {
    [NSUserDefaults setObject:nil forKey:UserToken];
    [NSUserDefaults setObject:nil forKey:UserId];
    [NSUserDefaults setObject:nil forKey:UserEmail];
    [NSUserDefaults setObject:nil forKey:UserFullName];
    [NSUserDefaults setObject:nil forKey:UserRole];
    [NSUserDefaults setObject:nil forKey:UserCity];
}

#pragma mark - Accsess Token

- (void)setAccessToken:(NSString *)accessToken {
     _accessToken = accessToken;
    [NSUserDefaults setObject:accessToken forKey:UserToken];
}

- (NSString *)accessToken {
    NSString *accessToken = [NSUserDefaults objectForKey:UserToken];
    if (accessToken) {
        return accessToken;
    } else {
        return @"";
    }
}

#pragma  mark - User Id

- (void)setUserId:(NSString *)userId {
    _userId = userId;
    [NSUserDefaults setObject:userId forKey:UserId];
}

- (NSString *)userId {
    NSString *userId = [NSUserDefaults objectForKey:UserId];
    if (userId) {
        return userId;
    } else {
        return @"";
    }
}

#pragma  mark - Full Name

- (void)setFullname:(NSString *)fullname {
    _fullname = fullname;
    [NSUserDefaults setObject:fullname forKey:UserFullName];
}

- (NSString *)fullname {
    NSString *fullname = [NSUserDefaults objectForKey:UserFullName];
    if (fullname) {
        return fullname;
    } else {
        return @"";
    }
}

#pragma  mark - Email

- (void)setEmail:(NSString *)email {
    _email = email;
    [NSUserDefaults setObject:email forKey:UserEmail];
}

- (NSString *)email {
    NSString *email = [NSUserDefaults objectForKey:UserEmail];
    if (email) {
        return email;
    } else {
        return @"";
    }
}

#pragma  mark - Role

- (void)setRole:(NSString *)role {
    _role = role;
    [NSUserDefaults setObject:role forKey:UserRole];
}

- (NSString *)role {
    NSString *role = [NSUserDefaults objectForKey:UserRole];
    if (role) {
        return role;
    } else {
        return @"";
    }
}

#pragma  mark - City

- (void)setCity:(NSString *)city {
    _city = city;
    [NSUserDefaults setObject:city forKey:UserCity];
}

- (NSString *)city {
    NSString *city = [NSUserDefaults objectForKey:UserCity];
    if (city) {
        return city;
    } else {
        return @"";
    }
}

@end
