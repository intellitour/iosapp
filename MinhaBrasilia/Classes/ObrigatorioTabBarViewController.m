//
//  ObrigatorioTabBarViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 8/18/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "ObrigatorioTabBarViewController.h"
#import "DesignUtils.h"

@interface ObrigatorioTabBarViewController ()

@end

@implementation ObrigatorioTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //NavigationBar
    [DesignUtils customizarNavBar:self.navigationController
                     CorBtnVoltar:[UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1]
                        CorNavBar:[UIColor colorWithRed:0.012 green:0.651 blue:0.471 alpha:1]
                      FonteTitulo:@"HelveticaNeue-CondensedBlack"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
