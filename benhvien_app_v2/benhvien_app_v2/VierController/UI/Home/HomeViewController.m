//
//  HomeViewController.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/22/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchResultViewController.h"
#import "AdvanceSearchViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    self.title = @"Tìm kiếm";
    [self showBackButton];
    
    self.searchTextField.layer.cornerRadius     = 4.0;
    self.searchTextField.layer.borderWidth      = 0.5;
    self.searchTextField.layer.borderColor      = [UIColor colorWithHex:0xC8C7CC].CGColor;
    self.searchButton.layer.cornerRadius        = 4.0;
    self.advanceSearchButton.layer.cornerRadius = 4.0;
}

- (void)validateWithName:(NSString *)name completion:(void (^)(BOOL isValidate, NSString *message))completion {
    if (!name || name.length == 0) {
        completion(NO, @"Bạn phải nhập bệnh viện");
        return;
    }
    completion(YES, @"");
}

- (void)searchHospitalWithName:(NSString *)name {
    [self showHUB];
    [ApiRequest searchHospitalWithName:name completion:^(ApiResponse *response, NSError *error) {
        [self hideHUB];
        if (error) {
            [self showAlertWithTitle:@"Lỗi" message:response.message];
        } else {
            [self goToSearchResultViewController];
        }
    }];
}

- (void)goToSearchResultViewController {
    SearchResultViewController *searchResultViewController = (SearchResultViewController *)[SearchResultViewController instanceFromStoryboardName:@"Home"];
    [self showViewController:searchResultViewController sender:nil];
}

- (void)searchHospital {
    NSString *hospitalName = self.searchTextField.text;
    [self validateWithName:hospitalName completion:^(BOOL isValidate, NSString *message) {
        if (isValidate) {
            [self searchHospitalWithName:hospitalName];
        } else {
            [self showAlertWithTitle:@"Lỗi" message:message];
        }
    }];
}

- (IBAction)searchButtonPressed:(id)sender {
    [self searchHospital];
}

- (IBAction)goToAdvanceSearchViewController:(id)sender {
    AdvanceSearchViewController *advanceSearchViewController = (AdvanceSearchViewController *)[AdvanceSearchViewController instanceFromStoryboardName:@"Home"];
    [self showViewController:advanceSearchViewController sender:nil];
}

@end
