//
//  LSBDViewController.m
//  LongShadowButton-Demo
//
//  Created by Luís Portela Afonso on 05/07/14.
//  Copyright (c) 2014 meligaletiko. All rights reserved.
//

#import "LSBDViewController.h"
#import "LSButton.h"

@interface LSBDViewController ()

@property (weak, nonatomic) IBOutlet LSButton *shadowButton;

@end

@implementation LSBDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.shadowButton.layer.borderColor = [UIColor blueColor].CGColor;
	self.shadowButton.layer.borderWidth = 2.5f;
	self.shadowButton.layer.cornerRadius = 2.5f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
