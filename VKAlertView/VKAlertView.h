//
//  VKAlertView.h
//  VKAlertView
//
//  Created by Vladimir Kolbas on 8/30/13.
//  Copyright (c) 2013 Vladimir Kolbas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKAlertView : UIView

@property (nonatomic, strong) UIImage *backgroundImage;

// Animate to passed UIView
- (void)addToView:(UIView *)view;

// Remove from UIView
- (void)removeFromView;

@end
