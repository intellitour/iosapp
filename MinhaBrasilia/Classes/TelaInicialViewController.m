//
//  TelaInicialViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/17/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "TelaInicialViewController.h"
#import "RefinarBuscaViewController.h"
#import "Constantes.h"

@interface TelaInicialViewController ()
@property (nonatomic, strong) NSString *identificador;


@end

@implementation TelaInicialViewController
@synthesize identificador;
static NSString *const SegueTelaInicial = @"segueTelaInicial";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)iniciar:(UIControl *)sender {
    switch (sender.tag) {
        case 1:
            identificador = IdentificadorAsaNorte;
            break;
        case 2:
            identificador = IdentificadorAsaSul;
            break;
        default:
            break;
    }

    [self performSegueWithIdentifier:SegueTelaInicial sender:self];
}


#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:SegueTelaInicial]) {
        RefinarBuscaViewController *refinarBuscaVC = (RefinarBuscaViewController *)[[segue destinationViewController] topViewController];
        [refinarBuscaVC setIdentificadorBtn:identificador];
    }
}


@end
