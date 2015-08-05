//
//  TelaInicialViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/17/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

#import "TelaInicialViewController.h"
#import "RefinarBuscaViewController.h"
#import "Constantes.h"

@interface TelaInicialViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    @autoreleasepool {

        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        [_locationManager setDelegate:self];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Ação botões iniciais
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

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:SegueTelaInicial]) {
        RefinarBuscaViewController *refinarBuscaVC = (RefinarBuscaViewController *)[[segue destinationViewController] topViewController];
        [refinarBuscaVC setIdentificadorBtn:identificador];
    }
}


@end
