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
@synthesize contexto;
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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    contexto = [self managedObjectContext];

}

- (NSManagedObjectContext *)managedObjectContext {
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        contexto = [delegate managedObjectContext];
    }
    return contexto;
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
    categoria = [NSEntityDescription insertNewObjectForEntityForName:@"Categoria" inManagedObjectContext:contexto];

    categoria.nome = [itensDaTabela objectAtIndex:indexPath.row];

    [celula.textLabel setText:categoria.nome];
    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return celula;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    categoria.nome = [itensDaTabela objectAtIndex:indexPath.row];
    //Passando a categoria clicada para o sender
    [self performSegueWithIdentifier:SegueCategorias sender:categoria.nome];
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
