//
//  FourthViewController.m
//  AutoLayautTask
//
//  Created by Elena on 15.11.15.
//  Copyright (c) 2015 Elena. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@end

@implementation FourthViewController

- (IBAction)heightSliderChanged:(id)sender {
    self.heightConstraint.constant = ((UISlider*)sender).value;
}

- (IBAction)widthSliderChanged:(id)sender {
     self.widthConstraint.constant = ((UISlider*)sender).value;
}

@end
