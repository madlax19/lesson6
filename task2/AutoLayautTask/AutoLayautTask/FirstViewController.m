//
//  FirstViewController.m
//  AutoLayautTask
//
//  Created by Elena on 15.11.15.
//  Copyright (c) 2015 Elena. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;

@end

@implementation FirstViewController

- (IBAction)sliderChanged:(id)sender {
    self.constraint.constant = [(UISlider*)sender value];
}




@end
