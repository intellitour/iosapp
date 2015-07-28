//
//  CategoriaViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/27/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "CategoriaViewController.h"
#import "RefinarBuscaViewController.h"
#import "Categoria.h"
#import "Constantes.h"


@interface CategoriaViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewCategorias;
@property (nonatomic, strong) Categoria *categoria;

@end

@implementation CategoriaViewController
@synthesize itensDaTabela;
@synthesize categoria;
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

    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.managedObjectContext = [self managedObjectContext];
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
    return itensDaTabela.count;
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

    //Criando para cada categoria uma entidade categoria
    categoria = [NSEntityDescription insertNewObjectForEntityForName:@"Categoria" inManagedObjectContext:self.managedObjectContext];

    //TODO Criar método para persistir separadamente
    [categoria setValue:[itensDaTabela objectAtIndex:indexPath.row] forKey:@"nome"];

    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Não foi possível salvar. Erro: %@", error);
        NSLog(@"Erro: %@", [error localizedDescription]);
    } else {
        [celula.textLabel setText:categoria.nome];
        [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }

    return celula;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    categoria.nome = [itensDaTabela objectAtIndex:indexPath.row];
    //Passando a categoria clicada para o sender
    [self performSegueWithIdentifier:SegueCategorias sender:categoria.nome];
}

/*
#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:SegueCategorias]) {
        EstabelecimentoViewController *estabelecimento = [segue destinationViewController];
        [estabelecimento setFCategoria:sender];
    }
}*/

@end
