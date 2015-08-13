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
#import "DesignUtils.h"

@interface TelaInicialViewController ()
@property (nonatomic, strong) NSString *identificador;
@property (weak, nonatomic) IBOutlet UIButton *btnAsaSul;
@property (weak, nonatomic) IBOutlet UIButton *btnAsaNorte;
@property (weak, nonatomic) IBOutlet UIImageView *imgInicial;

@end

@implementation TelaInicialViewController
@synthesize identificador;
static NSString *const SegueTelaInicial = @"segueTelaInicial";

- (void)viewDidLoad {
    [super viewDidLoad];

    //Animação da imagem da Catedral
    self.imgInicial.alpha = 0;
    [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.imgInicial.alpha = 1;
                     }
                     completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //Botões
    [DesignUtils customizarBotao:self.btnAsaNorte
                           CorBg:[UIColor colorWithRed:0.361 green:0.592 blue:0.749 alpha:1]
                       CorTitulo:[UIColor whiteColor] Round:5];

    [DesignUtils customizarBotao:self.btnAsaSul
                           CorBg:[UIColor colorWithRed:0.361 green:0.592 blue:0.749 alpha:1]
                       CorTitulo:[UIColor whiteColor] Round:5];

    //NavigationBar
    [DesignUtils customizarNavBar:self.navigationController CorBtnVoltar:nil
                        CorNavBar:[UIColor colorWithRed:0.012 green:0.651 blue:0.471 alpha:1]
                      FonteTitulo:@"HelveticaNeue-CondensedBlack"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Ação botões iniciais
- (IBAction)iniciar:(UIControl *)sender {
    switch (sender.tag) {
        case 1:
            identificador = kIdentificadorAsaNorte;
            break;
        case 2:
            identificador = kIdentificadorAsaSul;
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
