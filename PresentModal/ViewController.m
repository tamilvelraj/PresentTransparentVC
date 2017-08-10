//
//  ViewController.m
//  PresentModal
//
//  Created by Thamil Selvan V on 04/08/17.
//  Copyright © 2017 Thamil Selvan V. All rights reserved.
//

#import "ViewController.h"
#import <math.h>
#import "AppDelegate.h"

@interface ViewController ()
@property(nonatomic,strong) UIButton *presentModalButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *delegate = (AppDelegate*) [UIApplication sharedApplication].delegate;

    _presentModalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _presentModalButton.frame = CGRectMake(0, 200+(delegate.count*20.f), 300, 100);
    CGFloat red = (rand()%255) / 255.f;
    CGFloat green = (rand()%255) / 255.f;
    CGFloat blue = (rand()%255) / 255.f;
    _presentModalButton.titleLabel.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.1f];
    
    NSString *title = [NSString stringWithFormat:@"Click Me %i", (int)delegate.count];
    
    [_presentModalButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12+delegate.count]];
    
    [_presentModalButton setTitle:title forState:UIControlStateNormal];
    [_presentModalButton addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_presentModalButton];
}

-(void)clickMe:(UIButton*)button {
    //controller.providesPresentationContextTransitionStyle = YES;
    //controller.definesPresentationContext = YES;
    
    ViewController *controller = [[ViewController alloc] init];
    AppDelegate *delegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    delegate.count += 1;
    
    [controller setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:controller animated:YES completion:^{

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
