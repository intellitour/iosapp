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
#import "Constantes.h"
#import "AsaNorte.h"
#import "AsaSul.h"
#import "Utils.h"

@interface LojaViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewLojas;
@property (weak, nonatomic) IBOutlet UITableView *labelCategoria;
@property (weak, nonatomic) IBOutlet UITableView *buscaLojas;
@property (nonatomic, strong) Loja *loja;
@property (nonatomic, strong) Categoria *categoria;
@property (nonatomic, strong) AsaNorte *asaNorte;
@property (nonatomic, strong) AsaSul *asaSul;
@end

@implementation LojaViewController
@synthesize identificadorBtn;
@synthesize loja;
@synthesize asaNorte;
@synthesize asaSul;
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
                      FonteTitulo:kFonteTitulo];
}

#pragma lojasFiltradasPor:filtro
-(NSArray *)lojasFiltradasPor:(NSString *)filtro {
    NSArray *fetchedObjects;
    NSEntityDescription *entityDescription;
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];

    if ([Utils isEntidadeAsaNorte:identificadorBtn]) {
        entityDescription = [NSEntityDescription entityForName:kIdentificadorAsaNorte
                                        inManagedObjectContext:context];
    } else if ([Utils isEntidadeAsaSul:identificadorBtn]) {
        entityDescription = [NSEntityDescription entityForName:kIdentificadorAsaSul
                                        inManagedObjectContext:context];
    }

    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"loja.categoria.nome = %@", filtro]];
    NSError *error = nil;
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

     [self.listaFiltrada2 objectAtIndex:indexPath.row];
     //TODO: Refazer quando tiver mais tempo
     /*if ([Utils isEntidadeAsaNorte:identificadorBtn]) {
         asaNorte = [self.listaFiltrada2 objectAtIndex:indexPath.row];
         [celula preencherCelulaComTitulo:asaNorte.loja.titulo
                             comSubtitulo:asaNorte.loja.subtitulo
                             comCategoria:asaNorte.loja.categoria.nome
                              comEndereco:asaNorte.loja.endereco
                                comQuadra:asaNorte.loja.quadra.nome
                              comTelefone:asaNorte.loja.telefone];
     } else if ([Utils isEntidadeAsaSul:identificadorBtn]) {
         asaSul = [self.listaFiltrada2 objectAtIndex:indexPath.row];
         [celula preencherCelulaComTitulo:asaSul.loja.titulo
                             comSubtitulo:asaSul.loja.subtitulo
                             comCategoria:asaSul.loja.categoria.nome
                              comEndereco:asaSul.loja.endereco
                                comQuadra:asaSul.loja.quadra.nome
                              comTelefone:asaSul.loja.telefone];
     }*/

    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
     return celula;
 }


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id sender;
    if ([Utils isEntidadeAsaNorte:identificadorBtn]) {
        asaNorte = [self.listaFiltrada2 objectAtIndex:indexPath.row];
        sender = asaNorte;
    } else if ([Utils isEntidadeAsaSul:identificadorBtn]) {
        asaSul = [self.listaFiltrada2 objectAtIndex:indexPath.row];
        sender = asaSul;
    }
    [self performSegueWithIdentifier:SegueLoja sender:sender];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SegueLoja]) {
        DetalheViewController *detalheVC = [segue destinationViewController];
        [detalheVC setIdentificadorBtn:identificadorBtn];
        [detalheVC setVlTitulo:sender];
    }
}

@end
