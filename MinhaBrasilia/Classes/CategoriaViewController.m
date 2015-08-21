//
//  CategoriaViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/27/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "CategoriaViewController.h"
#import "RefinarBuscaViewController.h"
#import "LojaViewController.h"
#import "Categoria.h"
#import "Constantes.h"
#import "DesignUtils.h"

@interface CategoriaViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewCategorias;
@property (nonatomic, strong) Categoria *categoria;
@property (nonatomic, strong) NSMutableArray *listaArquivoPlist;


@end

@implementation CategoriaViewController
@synthesize identificadorBtn;
static NSString *const IdentificadorCelula = @"idCelulaCategorias";
static NSString *const SegueCategorias = @"segueCategorias";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableViewCategorias setDelegate:self];
    [self.tableViewCategorias setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [DesignUtils customizarNavBar:self.navigationController
                     CorBtnVoltar:[UIColor whiteColor]
                        CorNavBar:[UIColor colorWithRed:0.012 green:0.651 blue:0.471 alpha:1]
                      FonteTitulo:kFonteTitulo];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *managedObjectContext = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        managedObjectContext = [delegate managedObjectContext];
    }
    return managedObjectContext;
}

#pragma mark - Ações da tabela
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itensDaTabela.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Obtendo a célula a partir da tableView
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:IdentificadorCelula
                                                              forIndexPath:indexPath];

    //Se for nula é instanciada
    if(!celula) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:IdentificadorCelula];
    }

    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

    [celula.textLabel setText:[self.itensDaTabela objectAtIndex:indexPath.row]];

    return celula;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //Passando a categoria clicada para o sender
    [self performSegueWithIdentifier:SegueCategorias sender:[self.itensDaTabela objectAtIndex:indexPath.row]];
}


#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SegueCategorias]) {
        LojaViewController *lojaVC = [segue destinationViewController];
        [lojaVC setTxtCategoria:sender];
        [lojaVC setIdentificadorBtn:identificadorBtn];
    }
}

@end
