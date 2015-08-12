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
@property (weak, nonatomic) IBOutlet UIButton *btnAsaSul;
@property (weak, nonatomic) IBOutlet UIButton *btnAsaNorte;

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

    //Criar botões arredondados
    [self.btnAsaSul.layer setCornerRadius:5];
    [self.btnAsaNorte.layer setCornerRadius:5];

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
        RefinarBuscaViewController *refinarBuscaVC = [segue destinationViewController];
        [refinarBuscaVC setIdentificadorBtn:identificador];
    }
}


@end
