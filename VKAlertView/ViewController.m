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
    
    self.alertView = [[VKAlertView alloc] initWithFrame:CGRectMake(self.view.center.x-80.,
                                                                   self.view.center.y-50.,
                                                                   160,
                                                                   100)];

    [self.alertView addToView:self.view];

    [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(remove)
                                       userInfo:nil
                                        repeats:NO];
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
