//
//  LoginViewController.h
//  benhvien_app_v2
//
//  Created by AnhTien on 9/19/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *stateSegmentControl;

@property (weak, nonatomic) IBOutlet UIView *registerContentView;
@property (weak, nonatomic) IBOutlet UIView *loginContentView;

@property (weak, nonatomic) IBOutlet UITextField *loginEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *registerFullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registerEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *registerPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *registerCityTextField;

@end
