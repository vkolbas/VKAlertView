//
//  ViewController.m
//  VKAlertView
//
//  Created by Vladimir Kolbas on 8/30/13.
//  Copyright (c) 2013 Vladimir Kolbas. All rights reserved.
//

#import "ViewController.h"
#import "VKAlertView.h"

@interface ViewController ()
@property (nonatomic, strong) VKAlertView *alertView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.alertView = [[VKAlertView alloc] initWithFrame:CGRectMake(self.view.center.x-80.,
                                                                       self.view.center.y-50.,
                                                                       160,
                                                                       100)
                                         andBackgroundColor:[UIColor blueColor]];
        [self.alertView addToView:self.view];
        [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(remove)
                                       userInfo:nil
                                        repeats:NO];

    });
}

- (void)remove {
    [self.alertView removeFromView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
