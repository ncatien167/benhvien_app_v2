//
//  LoginViewController.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/19/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "LoginViewController.h"
#import "PlacesViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUserInterface {
    self.title = @"Đăng nhập";
    [self showCancelButton];
}

- (void)showDoneButton {
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Xong"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(doneButtonPressed:)];
    [self setupThemeButton:doneButton];
    self.navigationItem.rightBarButtonItem = doneButton;
}

#pragma mark - Login

- (void)validateWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(BOOL isValidate, NSString *message))completion {
    if (!email || email.length == 0) {
        completion(NO,@"Bạn phải nhập email");
        return;
    }
    
    if (!password || password.length == 0) {
        completion(NO, @"Bạn phải nhập mật khẩu");
        return;
    }
    completion(YES, @"");
}

- (void)signInWithEmail:(NSString *)email password:(NSString *)password {
    [self showHUB];
    [ApiRequest loginWithEmail:email password:password completion:^(ApiResponse *response, NSError *error){
        [self hideHUB];
        if (error) {
            [self showAlertWithTitle:@"Lỗi" message:response.message];
        } else {
            [[UserDataManager shareClient] setUserData:response.data];
            AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [appdelegate setupHomeScreen];
        }
    }];
}

- (void)loginWithEmailAndPassword {
    NSString *loginWithEmail    =  self.loginEmailTextField.text;
    NSString *loginWithPassword = self.loginPasswordTextField.text;
    [self validateWithEmail:loginWithEmail password:loginWithPassword completion:^(BOOL isValidate, NSString *message) {
        if (isValidate) {
            [self signInWithEmail:loginWithEmail password:loginWithPassword];
        } else {
            [self showAlertWithTitle:@"Lỗi" message:message];
        }
    }];
}

#pragma mark - Register

- (void)validateWithFullName:(NSString *)fullName
                       email:(NSString *)email
                    password:(NSString *)password
                        city:(NSString *)city
                  completion:(void (^)(BOOL isValidate, NSString *mesaage))completion {
    if (!fullName || fullName.length == 0) {
        completion(NO, @"Bạn phải nhập họ tên");
        return;
    }
    
    if (!email || email.length == 0) {
        completion(NO, @"Bạn phải nhập email");
        return;
    }
    
    if (!password || password.length == 0) {
        completion(NO, @"Bạn phải nhập mật khẩu");
        return;
    }
    
    if (!city || city.length == 0) {
        completion(NO, @"Bạn phải chọn thành phố");
        return;
    }
    
    if (password.length < 6) {
        completion(NO, @"Mật khẩu phải có ít nhất 6 kí tự");
        return;
    }
    completion(YES, @"");
}

- (void)registerWithFullName:(NSString *)fullName email:(NSString *)email password:(NSString *)password city:(NSString *)city {
    [self showHUB];
    [ApiRequest registerUserWithEmail:email password:password city:city fullName:fullName completion:^(ApiResponse *response, NSError *error) {
        [self hideHUB];
        if (error) {
            [self showAlertWithTitle:@"Lỗi" message:response.message];
        } else {
            [[UserDataManager shareClient] setUserData:response.data];
            AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [appdelegate setupHomeScreen];
        }
    }];
}

- (void)registerAccount {
    NSString *fullName  = self.registerFullNameTextField.text;
    NSString *email     = self.registerEmailTextField.text;
    NSString *password  = self.registerPasswordTextField.text;
    NSString *city      = self.registerCityTextField.text;
    [self validateWithFullName:fullName email:email password:password city:city completion:^(BOOL isValidate, NSString *mesaage) {
        if (isValidate) {
            [self registerWithFullName:fullName email:email password:password city:city];
        } else {
            [self showAlertWithTitle:@"Lỗi" message:mesaage];
        }
    }];
}

#pragma mark - Action in Login View Controller

- (IBAction)doneButtonPressed:(id)sender {
    if (self.stateSegmentControl.selectedSegmentIndex == 0) {
        [self loginWithEmailAndPassword];
    } else {
        [self registerAccount];
    }
}

- (IBAction)segmentSwitch:(id)sender {
    if (self.stateSegmentControl.selectedSegmentIndex == 0) {
        self.title = @"Đăng nhập";
        self.loginContentView.hidden    = false;
        self.registerContentView.hidden = true;
    } else {
        self.title = @"Đăng kí";
        self.loginContentView.hidden    = true;
        self.registerContentView.hidden = false;
    }
}

- (IBAction)goToPlacesViewController:(id)sender {
    PlacesViewController *placesViewController = (PlacesViewController *)[PlacesViewController instanceFromStoryboardName:@"Login"];
    [self showViewController:placesViewController sender:nil];
}

@end
