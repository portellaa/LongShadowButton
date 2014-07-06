//
//  LSButton.m
//  LongShadowButton-Demo
//
//  Created by Luís Portela Afonso on 06/07/14.
//  Copyright (c) 2014 meligaletiko. All rights reserved.
//

#import "LSButton.h"

static CGFloat const kButtonShadowXMovement = 60.0f;
static CGFloat const kButtonShadowYMovement = 60.0f;

@interface LSButton ()

@property(nonatomic, strong) CAShapeLayer *longShadowLayer;
@property(nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation LSButton


#pragma mark - Getters

- (CAShapeLayer *)longShadowLayer
{
	if (!_longShadowLayer) {
		_longShadowLayer = [CAShapeLayer layer];
		
		_longShadowLayer.frame = ({
			CGRect frame = self.frame;
			frame.origin.x = 0.0f;
			frame.origin.y = 0.0f;
			frame.size.width += kButtonShadowXMovement;
			frame.size.height += kButtonShadowYMovement;
			frame;
		});
	}
	
	return _longShadowLayer;
}

- (NSArray *)gradientColors
{
	if (!_gradientColors) {
		_gradientColors = [NSArray arrayWithObjects:
						   (id)[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor,
						   (id)[[UIColor blackColor] colorWithAlphaComponent:0.2].CGColor,
						   nil];
	}
	
	return _gradientColors;
}

- (CGPoint)longShadowOffset
{
	if ((_longShadowOffset.x <= 0) || (_longShadowOffset.y <= 0)) {
		_longShadowOffset = CGPointMake(kButtonShadowXMovement, kButtonShadowYMovement);
	}
	
	return _longShadowOffset;
}

- (CAGradientLayer *)gradientLayer
{
	if (!_gradientLayer) {
		_gradientLayer = [CAGradientLayer layer];
		
		[self.layer addSublayer:self.gradientLayer];
	}
	
	return _gradientLayer;
}

#pragma mark - Private methods

- (CGPathRef)longShadowPath
{
	UIBezierPath *shadowPath = [UIBezierPath bezierPath];
	
	CGFloat cornerOffset = self.layer.cornerRadius / 2.0f;
	
	CGPoint startPoint = CGPointZero;
	startPoint.x += 1.0f;
	startPoint.y = CGRectGetHeight(self.frame) - cornerOffset;
	
	//	Move to left bottom point of the buttom
	[shadowPath moveToPoint:startPoint];
	
	//	Add line from the current point to the middle oh shadow
	[shadowPath addLineToPoint:({
		CGPoint point = shadowPath.currentPoint;
		point.x += self.longShadowOffset.x;
		point.y += self.longShadowOffset.y;
		point;
	})];
	
	//
	[shadowPath addLineToPoint:({
		CGPoint point = shadowPath.currentPoint;
		point.x += CGRectGetWidth(self.frame);
		point;
	})];
	
	
	[shadowPath addLineToPoint:({
		CGPoint point = shadowPath.currentPoint;
		point.y -= CGRectGetHeight(self.frame);
		point;
	})];
	
	[shadowPath addLineToPoint:({
		CGPoint point = CGPointZero;
		point.x = CGRectGetWidth(self.frame) - cornerOffset;
		point.y = 1.0f;
		point;
	})];
	
	[shadowPath addLineToPoint:({
		CGPoint point = shadowPath.currentPoint;
		point.y = startPoint.y;
		point;
	})];
	
	[shadowPath addLineToPoint:({
		CGPoint point = shadowPath.currentPoint;
		point.x = startPoint.x;
		point;
	})];
	
	return shadowPath.CGPath;
}

#pragma mark - Layout Methods

- (void)layoutSubviews
{
	self.longShadowLayer.path = [self longShadowPath];
	
	self.gradientLayer.frame = self.longShadowLayer.frame;
	
    self.gradientLayer.colors = self.gradientColors;
	
	self.gradientLayer.mask = self.longShadowLayer;
}


@end
