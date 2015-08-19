//
//  TelaInicialViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/17/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "TelaInicialViewController.h"
#import "RefinarBuscaViewController.h"
#import "Constantes.h"
#import "DesignUtils.h"
#import "Utils.h"
#import "AsaNorte.h"

@interface TelaInicialViewController ()
@property (nonatomic, strong) NSString *identificador;
@property (weak, nonatomic) IBOutlet UIButton *btnAsaSul;
@property (weak, nonatomic) IBOutlet UIButton *btnAsaNorte;
@property (weak, nonatomic) IBOutlet UIImageView *imgInicial;

@property (nonatomic, strong) Loja *loja;
@property (nonatomic, strong) Categoria *categoria;
@property (nonatomic, strong) Quadra *quadra;

@end

@implementation TelaInicialViewController
@synthesize identificador;
@synthesize loja;
@synthesize categoria;
@synthesize quadra;

static NSString *const SegueTelaInicial = @"segueTelaInicial";

- (void)viewDidLoad {
    [super viewDidLoad];

    //Animação da imagem da Catedral
    self.imgInicial.alpha = 0;
    [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.imgInicial.alpha = 1;
                     }
                     completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //Botões
    [DesignUtils customizarBotao:self.btnAsaNorte
                           CorBg:[UIColor colorWithRed:0.361 green:0.592 blue:0.749 alpha:1]
                       CorTitulo:[UIColor whiteColor] Round:5];

    [DesignUtils customizarBotao:self.btnAsaSul
                           CorBg:[UIColor colorWithRed:0.361 green:0.592 blue:0.749 alpha:1]
                       CorTitulo:[UIColor whiteColor] Round:5];

    //NavigationBar
    [DesignUtils customizarNavBar:self.navigationController CorBtnVoltar:nil
                        CorNavBar:[UIColor colorWithRed:0.012 green:0.651 blue:0.471 alpha:1]
                      FonteTitulo:@"HelveticaNeue-CondensedBlack"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma iniciar
- (IBAction)iniciar:(UIControl *)sender {
    switch (sender.tag) {
        case 1: {
            identificador = kIdentificadorAsaNorte;
            [self carregarEntidadeLojaComId:identificador keyNSUserDefault:@"listaCarregadaAsaNorte"];
            break;
        }
        case 2: {
            identificador = kIdentificadorAsaSul;
            [self carregarEntidadeLojaComId:identificador keyNSUserDefault:@"listaCarregadaAsaSul"];
            break;
        }
        default:
            break;
    }

    [self performSegueWithIdentifier:SegueTelaInicial sender:self];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *managedObjectContext = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        managedObjectContext = [delegate managedObjectContext];
    }
    return managedObjectContext;
}

- (void)criarEntidadesNo:(NSManagedObjectContext *)contexto {
    loja = [NSEntityDescription insertNewObjectForEntityForName:@"Loja" inManagedObjectContext:contexto];
    categoria = [NSEntityDescription insertNewObjectForEntityForName:@"Categoria" inManagedObjectContext:contexto];
    quadra = [NSEntityDescription insertNewObjectForEntityForName:@"Quadra" inManagedObjectContext:contexto];
}

- (void)salvarNo:(NSManagedObjectContext *)contexto {
    NSError *erro;
    [contexto save:&erro];
    if (!erro) {
        NSLog(@"Dados persistidos no contexto: %@", contexto);
    }else {
        NSLog(@"Erro CoreData: %@", erro);
    }
}

- (void)carregarEntidadeLojaComId:(NSString *)identificadorLoja keyNSUserDefault:(NSString *)key {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        NSManagedObjectContext *contexto = [self managedObjectContext];

        //AsaNorte *asaNorte = [AsaNorte inserirObjetoNoContexto:contexto];

        NSArray *arrayLojas = [Utils carregarArrayPlist:identificadorLoja];
        NSArray *atributosComuns = @[@"titulo", @"subtitulo", @"telefone", @"endereco"];
        for (NSDictionary *dicionario in arrayLojas) {
            [self criarEntidadesNo:contexto];

            //Loop para atributos comuns
            for (NSString *atributo in atributosComuns) {
                [loja setValue:[dicionario objectForKey:atributo] forKey:atributo];
            }

            [categoria setValue:[dicionario objectForKey:@"categoria"] forKey:@"nome"];
            [loja setValue:categoria forKey:@"categoria"];

            [quadra setValue:[dicionario objectForKey:@"quadra"] forKey:@"nome"];
            [loja setValue:quadra forKey:@"quadra"];
        }
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];

        [self salvarNo:contexto];
    }
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:SegueTelaInicial]) {
        RefinarBuscaViewController *refinarBuscaVC = [segue destinationViewController];
        [refinarBuscaVC setIdentificadorBtn:identificador];
    }
}


@end
