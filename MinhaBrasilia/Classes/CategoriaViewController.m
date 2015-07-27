//
//  CategoriaViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/27/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "CategoriaViewController.h"

@interface CategoriaViewController ()

@property (nonatomic, strong) NSMutableArray *listaDeCategorias;

@end

@implementation CategoriaViewController
@synthesize listaDeCategorias;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Carregar categorias
- (void) carregarCategoriasAsaSul {
    //Inicializando o array para receber as categorias
    listaDeCategorias = [[NSMutableArray alloc] init];

    //Variável indicativa do caminho do arquivo .plist
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:@"CategoriaAsaSul" ofType:@"plist"];

    //Dicionário contendo as informações do arquivo
    NSDictionary *dicionarioPlist = [NSDictionary dictionaryWithContentsOfFile:arquivoPlist];

    //Atribuição do array ao dicionário
    listaDeCategorias = [dicionarioPlist objectForKey:@"categorias"];
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
