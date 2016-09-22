//
//  ViewController.m
//  SocketIOCpp_Demo
//
//  Created by zhangqi on 22/9/2016.
//  Copyright © 2016 MaxwellQi. All rights reserved.
//

#import "ViewController.h"
#include <SocketIO-Client-CPP/sio_client.h>
#import "SocketIOOperation.h"
using namespace std;
#include <string.h>
@interface ViewController ()

@property(nonatomic) SocketIOOperation *socketOperation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _socketOperation = new SocketIOOperation();
    _socketOperation->beginConnection("sdfdsf");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
