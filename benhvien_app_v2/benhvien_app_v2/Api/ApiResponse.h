//
//  ApiResponse.h
//  benhvien_app_v2
//
//  Created by AnhTien on 9/20/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiResponse : NSObject

@property (nonatomic, strong) NSDictionary *originalResponse;
@property (nonatomic, strong) id data;
@property (nonatomic) BOOL sucsess;
@property (nonatomic, strong) NSString *message;

+ (instancetype)initWithResponse:(NSDictionary *)response;

@end
