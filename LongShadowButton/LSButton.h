//
//  LSButton.h
//  LongShadowButton-Demo
//
//  Created by Luís Portela Afonso on 06/07/14.
//  Copyright (c) 2014 meligaletiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSButton : UIButton

@property(nonatomic, assign) CGPoint longShadowOffset;
@property(nonatomic, strong) NSArray *gradientColors;

@end
