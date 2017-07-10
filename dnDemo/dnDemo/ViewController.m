//
//  ViewController.m
//  dnDemo
//
//  Created by nanding on 17/6/21.
//  Copyright © 2017年 nD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)storyboardAction:(id)sender {
    [self performSegueWithIdentifier:@"DNTableViewController" sender:nil];
    
}


- (IBAction)codeAction:(id)sender {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
