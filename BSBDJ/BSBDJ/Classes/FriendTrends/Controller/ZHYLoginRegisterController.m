//
//  ZHYLoginRegisterController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYLoginRegisterController.h"

@interface ZHYLoginRegisterController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerLeftSpace;
@end

@implementation ZHYLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)closeButtonClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];

}

- (IBAction)RegisterButtonClick:(UIButton *)button {
    
    if (self.registerLeftSpace.constant == 0) {
        self.registerLeftSpace.constant = -self.view.k_Width;
        button.selected = YES;
        
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }else {
        self.registerLeftSpace.constant = 0;
        button.selected = NO;
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    
    
    }
}
@end
