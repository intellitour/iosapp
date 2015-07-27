//
//  AsaSulViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/17/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//


#import "CategoriaAsaSulViewController.h"
#import "EstabelecimentoViewController.h"
#import "CelulaEstabelecimentoTableViewCell.h"
#import "Categoria.h"

@interface CategoriaAsaSulViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewCategorias;
@property (nonatomic, strong) NSMutableArray *listaDeCategorias;
@property (nonatomic, strong) Categoria *categoria;

@end

@implementation CategoriaAsaSulViewController
@synthesize listaDeCategorias;
@synthesize tableViewCategorias;
@synthesize categoria;
@synthesize contexto;

static NSString *const IdentificadorCelula = @"idCelulaCategoria";
static NSString *const IdentificadorSegue = @"segueTabelaCategoria";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableViewCategorias setDelegate:self];
    [self.tableViewCategorias setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    contexto = [self managedObjectContext];

    [self carregarCategoriasAsaSul];
}

- (NSManagedObjectContext *)managedObjectContext {
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        contexto = [delegate managedObjectContext];
    }
    return contexto;
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


#pragma mark - Ações da tabela
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //O número de linhas da tabela será o mesmo número de objetos na lista de categorias
    return listaDeCategorias.count;
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
    categoria = [NSEntityDescription insertNewObjectForEntityForName:@"Categoria" inManagedObjectContext:contexto];

    categoria.nome = [listaDeCategorias objectAtIndex:indexPath.row];

    [celula.textLabel setText:categoria.nome];
    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return celula;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    categoria.nome = [listaDeCategorias objectAtIndex:indexPath.row];
    //Passando a categoria clicada para o sender
    [self performSegueWithIdentifier:IdentificadorSegue sender:categoria.nome];
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:IdentificadorSegue]) {
        EstabelecimentoViewController *estabelecimento = [segue destinationViewController];
        [estabelecimento setFCategoria:sender];
    }
}

@end
