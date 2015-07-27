//
//  TelaInicialViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/17/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "TelaInicialViewController.h"
#import "RefinarBuscaViewController.h"

@interface TelaInicialViewController ()

@property (

@end

@implementation TelaInicialViewController
static NSString *const IdentificadorSegueAsaSul = @"segueAsaSul";
static NSString *const IdentificadorSegueAsaNorte = @"segueAsaNorte";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)iniciar:(UIControl *)sender {
    switch (sender.tag) {
        case 1:
            statements
            break;

        default:
            break;
    }
}

/*
- (IBAction)iniciarAsaSul:(id)sender {
    //RefinarBuscaViewController *refinarBuscaVC = [[RefinarBuscaViewController alloc] init];
    [self performSegueWithIdentifier:IdentificadorSegueAsaSul sender:self];
    //[self.parentViewController presentViewController:refinarBuscaVC animated:YES completion:nil];
}

- (IBAction)iniciarAsaNorte:(id)sender {

}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:IdentificadorSegueAsaSul]) {
        RefinarBuscaViewController *refinarBuscaVC = [segue destinationViewController];
        NSInteger tagIndex = [(UIButton *) sender tag];
        [refinarBuscaVC setIndexBtnClicado:&tagIndex];
    } else if ([[segue identifier] isEqualToString:IdentificadorSegueAsaNorte]) {
        RefinarBuscaViewController *refinarBuscaVC = [segue destinationViewController];
        NSInteger tagIndex = [(UIButton *) sender tag];
        [refinarBuscaVC setIndexBtnClicado:&tagIndex];
    }
}*/


@end
