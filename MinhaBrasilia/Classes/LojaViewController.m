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
#import "Categoria.h"

@interface LojaViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewLojas;
@property (weak, nonatomic) IBOutlet UITableView *labelCategoria;



@end

@implementation LojaViewController
@synthesize txtCategoria;
static NSString *const IdentificadorCelula = @"idCelulaLoja";


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableViewLojas setDelegate:self];
    [self.tableViewLojas setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.fetchedResultsController = nil;

}

/*
#pragma mark - FetchResultsController

-(NSFetchedResultsController *)fetchedResultsController {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Entidade
    NSEntityDescription *entidade = [NSEntityDescription entityForName:@"Categoria"
                                              inManagedObjectContext:self.managedObjectContext];
}*/


 #pragma mark - UITableViewDataSource
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return 10;
 }

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     LojaTableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:IdentificadorCelula
                                                                forIndexPath:indexPath];
     [celula preencherCelulaComTitulo:self.txtTitulo
                         comSubtitulo:self.txtSubtitulo
                         comCategoria:self.txtCategoria
                          comEndereco:self.txtEndereco
                            comQuadra:self.txtQuadra
                          comTelefone:self.txtTelefone];
    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
     return celula;
 }


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
/*
*/

/*
#pragma mark - Segue
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
