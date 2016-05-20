//
//  ZHYTextField.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTextField.h"

@implementation ZHYTextField

- (void)awakeFromNib {

    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder {

    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {

    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : [UIColor grayColor]}];

    return [super resignFirstResponder];
}



@end
