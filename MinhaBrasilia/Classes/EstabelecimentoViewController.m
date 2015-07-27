//
//  EstabelecimentoViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/18/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "EstabelecimentoViewController.h"
#import "CelulaEstabelecimentoTableViewCell.h"


@interface EstabelecimentoViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewEstabelecimento;

@end

@implementation EstabelecimentoViewController
@synthesize fCategoria;

static NSString *const IdentificadorCelula = @"idCelulaEstabelecimento";

// Do any additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableViewEstabelecimento setDataSource:self];
}

// Dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CelulaEstabelecimentoTableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:IdentificadorCelula
                                                                                 forIndexPath:indexPath];
    [celula preencherCelulaCom:fCategoria];
    [celula setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return celula;
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
