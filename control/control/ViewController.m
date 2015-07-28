//
//  ViewController.m
//  control
//
//  Created by kakapo on 15/7/20.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import "ViewController.h"
#import "G9shareBaseActivity.h"
#import "TestA.h"
#import "G9ShareActivityViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) G9ShareActivityViewController *vc;
@property (nonatomic, strong) UIWindow *window;


@end

@implementation ViewController


- (IBAction)action:(id)sender {
    TestA *a = [[TestA alloc] init];
    TestA *b = [[TestA alloc] init];
    TestA *c = [[TestA alloc] init];
    TestA *d = [[TestA alloc] init];
    TestA *q = [[TestA alloc] init];
    TestA *w = [[TestA alloc] init];
//
    TestA *e = [[TestA alloc] init];
    TestA *f = [[TestA alloc] init];
    TestA *g = [[TestA alloc] init];
    TestA *h = [[TestA alloc] init];
    
    NSArray *array2 = @[e, f, g, h, q, w];
    
    NSArray *array = @[a, b, c, d];
//
    _vc = [[G9ShareActivityViewController alloc] initWithASharedActivity:array actionActivities:array2];


    [_vc show];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

       NSInteger cellnum = 2;

    return cellnum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.editing = NO;
    return cell;
}



@end
