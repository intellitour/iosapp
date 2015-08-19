//
//  LojaViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/28/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "LojaViewController.h"
#import "CategoriaViewController.h"
#import "LojaTableViewCell.h"
#import "DetalheViewController.h"
#import "Categoria.h"
#import "Loja.h"
#import "DesignUtils.h"

@interface LojaViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewLojas;
@property (weak, nonatomic) IBOutlet UITableView *labelCategoria;
@property (weak, nonatomic) IBOutlet UITableView *buscaLojas;
@property (nonatomic, strong) Loja *loja;
@property (nonatomic, strong) Categoria *categoria;
@end

@implementation LojaViewController
@synthesize identificadorBtn;
@synthesize loja;
static NSString *const IdentificadorCelula = @"idCelulaLoja";
static NSString *const SegueLoja = @"segueLoja";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableViewLojas setDelegate:self];
    [self.tableViewLojas setDataSource:self];

    [self.tableViewLojas setBackgroundColor:[UIColor colorWithRed:0.949 green:0.945 blue:0.937 alpha:1]];
    [self lojasFiltradasPor:self.txtCategoria];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *managedObjectContext = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        managedObjectContext = [delegate managedObjectContext];
    }
    return managedObjectContext;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [DesignUtils customizarNavBar:self.navigationController
                     CorBtnVoltar:[UIColor whiteColor]
                        CorNavBar:[UIColor colorWithRed:0.012 green:0.651 blue:0.471 alpha:1]
                      FonteTitulo:@"HelveticaNeue-CondensedBlack"];
}

#pragma mark -  lojasFiltradasPor:filtro
-(NSArray *)lojasFiltradasPor:(NSString *)filtro {
    NSArray *fetchedObjects;
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Loja" inManagedObjectContext:context];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"categoria.nome = %@", filtro]];
    NSError * error = nil;
    fetchedObjects = [context executeFetchRequest:fetch error:&error];

    return self.listaFiltrada2 = fetchedObjects.count > 1 ? fetchedObjects : nil;
}

 #pragma mark - Ações da tabela
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.listaFiltrada2.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     LojaTableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:IdentificadorCelula
                                                                forIndexPath:indexPath];

     loja = [self.listaFiltrada2 objectAtIndex:indexPath.row];

     [celula preencherCelulaComTitulo:loja.titulo
                         comSubtitulo:loja.subtitulo
                         comCategoria:loja.categoria.nome
                          comEndereco:loja.endereco
                            comQuadra:loja.quadra.nome
                          comTelefone:loja.telefone];

    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
     return celula;
 }


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    loja = [self.listaFiltrada2 objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:SegueLoja sender:loja];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SegueLoja]) {
        DetalheViewController *detalheVC = [segue destinationViewController];
        [detalheVC setLoja:sender];
    }
}

@end
