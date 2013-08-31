//
//  VKAlertView.m
//  VKAlertView
//
//  Created by Vladimir Kolbas on 8/30/13.
//  Copyright (c) 2013 Vladimir Kolbas. All rights reserved.
//

#import "VKAlertView.h"

@interface VKAlertView () {
    UIView *_hostView;
}

@end

@implementation VKAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [[UIImage imageNamed:@"background"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        self.backgroundColor = [UIColor colorWithPatternImage:self.backgroundImage];
    }

    
    return self;
}

- (void)addToView:(UIView *)view {

    _hostView = view;
    CGRect oldFrame = self.frame;
    self.frame = CGRectMake(self.center.x - self.bounds.size.width / 2.,
                            self.bounds.origin.y - self.bounds.size.height,
                            oldFrame.size.width,
                            oldFrame.size.height);
    
    self.alpha = 0.0;
    [view addSubview:self];
    
    
    void (^animationsBlock)() = ^void() {
        self.frame = oldFrame;
        self.alpha = 1.0;
    };
    
    void (^completionBlock)(BOOL) = ^void(BOOL completed) {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(tapped:)];
        [self addGestureRecognizer:recognizer];
    };
    
    [UIView animateWithDuration:0.3
                     animations:animationsBlock
                     completion:completionBlock];
}

- (void)removeFromView {
    
    // Check if it was clicked before automatic timer
    for (UIView *view in _hostView.subviews) {
        if ([view isKindOfClass:[VKAlertView class]]) {
            void (^animationsBlock)() = ^void() {
                CGRect destFrame = self.frame;
                destFrame.origin.y = _hostView.bounds.size.height + self.bounds.size.height;
                self.frame = destFrame;
                
                CGAffineTransform scale = CGAffineTransformScale(self.transform, 0.7, 0.7);
                CGAffineTransform rotate = CGAffineTransformRotate(self.transform, -90.0*M_PI/180.);
                self.transform = CGAffineTransformConcat(scale, rotate);
                
                self.alpha = 0.0;
            };
            
            void (^completionBlock)(BOOL) = ^void(BOOL completed) {
                [self removeFromSuperview];
            };
            
            [UIView animateWithDuration:0.3
                             animations:animationsBlock
                             completion:completionBlock];
        }
    }
}

- (void)tapped:(UITapGestureRecognizer *)sender {
    [self removeFromView];
}


@end
