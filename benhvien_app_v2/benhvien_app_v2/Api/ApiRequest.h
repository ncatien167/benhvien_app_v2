//
//  ApiRequest.h
//  benhvien_app_v2
//
//  Created by AnhTien on 9/20/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ApiEndPoint.h"
#import "ApiManager.h"

@interface ApiRequest : NSObject

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(ApiCompletionBlock)completion;

+ (void)registerUserWithEmail:(NSString *)email password:(NSString *)password city:(NSString *)city fullName:(NSString *)fullName completion:(ApiCompletionBlock)completion;

+ (void)searchHospitalWithName:(NSString *)name completion:(ApiCompletionBlock)completion;

@end
