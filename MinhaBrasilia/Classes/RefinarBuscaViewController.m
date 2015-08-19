//
//  RefinarBuscaViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/27/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "RefinarBuscaViewController.h"
#import "CategoriaViewController.h"
#import "Constantes.h"
#import "DesignUtils.h"
#import "Utils.h"

@interface RefinarBuscaViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnCategorias;
@property (weak, nonatomic) IBOutlet UIButton *btnQuadras;
@end

@implementation RefinarBuscaViewController
@synthesize identificadorBtn;
@synthesize listaDeCategorias;

static NSString *const SegueRefinarBusca = @"segueRefinarBusca";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //Botões
    [DesignUtils customizarBotao:self.btnCategorias
                           CorBg:[UIColor colorWithRed:0.361 green:0.592 blue:0.749 alpha:1]
                       CorTitulo:[UIColor whiteColor] Round:5];
    
    [DesignUtils customizarBotao:self.btnQuadras
                           CorBg:[UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1]
                       CorTitulo:[UIColor colorWithRed:0.671 green:0.718 blue:0.718 alpha:1]
                           Round:5];

    //NavigationBar
    [DesignUtils customizarNavBar:self.navigationController
                     CorBtnVoltar:[UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1]
                        CorNavBar:[UIColor colorWithRed:0.012 green:0.651 blue:0.471 alpha:1]
                      FonteTitulo:@"HelveticaNeue-CondensedBlack"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Carregar categorias
- (IBAction)carregarCategorias:(id)sender {
    if ([identificadorBtn isEqualToString:kIdentificadorAsaNorte]) {
        listaDeCategorias = [Utils carregarPlistDeCategoriasComId:identificadorBtn];
    } else if ([identificadorBtn isEqualToString:kIdentificadorAsaSul]) {
        listaDeCategorias = [Utils carregarPlistDeCategoriasComId:identificadorBtn];
    }

    [self performSegueWithIdentifier:SegueRefinarBusca sender:self];
}


#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:SegueRefinarBusca]) {
        CategoriaViewController *categoriaVC = [segue destinationViewController];
        [categoriaVC setItensDaTabela:listaDeCategorias];
        [categoriaVC setIdentificadorBtn:identificadorBtn];
    }
}


@end
