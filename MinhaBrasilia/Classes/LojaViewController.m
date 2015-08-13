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
static NSString *const IdentificadorCelula = @"idCelulaLoja";
static NSString *const SegueLoja = @"segueLoja";



- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableViewLojas setDelegate:self];
    [self.tableViewLojas setDataSource:self];

    [self.tableViewLojas setBackgroundColor:[UIColor colorWithRed:0.949 green:0.945 blue:0.937 alpha:1]];

    [self carregarPlistDeLojasComId:identificadorBtn
                        filtradaPor:self.txtCategoria];

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



-(Loja *)lojasFiltradasPor:(NSString *)filtro {

    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Loja"
                                                         inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];

    [request setPredicate:[NSPredicate predicateWithFormat:@"categoria.nome = %@", filtro]];
    
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
    }
    return nil;
}

#pragma mark - Carregar plist
- (NSArray *) carregarPlistDeLojasComId:(NSString *)identificador filtradaPor:(NSString *)filtro{
    self.listaFiltrada = [[NSArray alloc] init];
    NSString *caminho = [NSString stringWithFormat:@"%@", identificador];
    NSString *arquivoPlist = [[NSBundle mainBundle] pathForResource:caminho ofType:@"plist"];
    NSArray *arrayPlist = [NSArray arrayWithContentsOfFile:arquivoPlist];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"categoria = %@", filtro];
    return self.listaFiltrada = [arrayPlist filteredArrayUsingPredicate:predicate];
}

 #pragma mark - Ações da tabela
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.listaFiltrada.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     LojaTableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:IdentificadorCelula
                                                                forIndexPath:indexPath];

     self.listaFiltrada = [self carregarPlistDeLojasComId:identificadorBtn filtradaPor:self.txtCategoria];

     self.loja = [NSEntityDescription insertNewObjectForEntityForName:@"Loja" inManagedObjectContext:self.managedObjectContext];

     [self.loja setValue:[[self.listaFiltrada objectAtIndex:indexPath.row] objectForKey:@"titulo"] forKey:@"titulo"];
     [self.loja setValue:[[self.listaFiltrada objectAtIndex:indexPath.row] objectForKey:@"subtitulo"] forKey:@"subtitulo"];
     [self.loja setValue:nil forKey:@"categoria"];
     [self.loja setValue:[[self.listaFiltrada objectAtIndex:indexPath.row] objectForKey:@"endereco"] forKey:@"endereco"];
     [self.loja setValue:nil forKey:@"quadra"];
     [self.loja setValue:[[self.listaFiltrada objectAtIndex:indexPath.row]  objectForKey:@"telefone"] forKey:@"telefone"];


     [celula preencherCelulaComTitulo:self.loja.titulo
                         comSubtitulo:self.loja.subtitulo
                         comCategoria:self.loja.categoria
                          comEndereco:self.loja.endereco
                            comQuadra:self.loja.quadra
                          comTelefone:self.loja.telefone];

    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
     return celula;
 }


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.loja = [self.listaFiltrada objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:SegueLoja sender:self.loja];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SegueLoja]) {
        DetalheViewController *detalheVC = [segue destinationViewController];
        [detalheVC setLoja:sender];
    }
}

@end
