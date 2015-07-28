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

@interface RefinarBuscaViewController ()

@property (nonatomic, strong) NSMutableArray *listaArquivoPlist;

@end

@implementation RefinarBuscaViewController
@synthesize identificadorBtn;
@synthesize listaArquivoPlist;
@synthesize listaDeCategorias;
static NSString *const SegueRefinarBusca = @"segueRefinarBusca";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)carregarCategorias:(id)sender {
    if ([identificadorBtn isEqualToString:IdentificadorAsaNorte]) {
        listaDeCategorias = [self carregarPlist:identificadorBtn];
    } else if ([identificadorBtn isEqualToString:IdentificadorAsaSul]) {
        listaDeCategorias = [self carregarPlist:identificadorBtn];
    }

    [self performSegueWithIdentifier:SegueRefinarBusca sender:self];
}

//Método responsável por carregar o arquivo .plist de acordo com o identificador
- (NSMutableArray *)carregarPlist:(NSString *)peloIdentificador {
    listaArquivoPlist = [[NSMutableArray alloc] init];
    NSString *caminho = [NSString stringWithFormat:@"Categoria%@", peloIdentificador];
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:caminho ofType:@"plist"];
    NSDictionary *dicionarioPlist = [NSDictionary dictionaryWithContentsOfFile:arquivoPlist];
    listaArquivoPlist = [dicionarioPlist objectForKey:@"categorias"];
    return listaArquivoPlist;
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:SegueRefinarBusca]) {
        CategoriaViewController *categoriaVC = (CategoriaViewController *)[[segue destinationViewController] topViewController];
        [categoriaVC setItensDaTabela:listaDeCategorias];
    }
}


@end
