//
//  SecondViewController.m
//  AutoLayautTask
//
//  Created by Elena on 15.11.15.
//  Copyright (c) 2015 Elena. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;


@end

@implementation SecondViewController

- (IBAction)sliderChanged:(id)sender {
    self.constraint.constant = -1 * ((UISlider*)sender).value;
}


@end
