//
//  LojaViewController.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/28/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface LojaViewController : UIViewController

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSString* identificadorBtn;

@property (strong, nonatomic) NSArray* listaFiltrada;

@property (strong, nonatomic) NSString *txtCategoria;
@property (strong, nonatomic) NSString *txtTitulo;
@property (strong, nonatomic) NSString *txtSubtitulo;
@property (strong, nonatomic) NSString *txtEndereco;
@property (strong, nonatomic) NSString *txtQuadra;
@property (strong, nonatomic) NSString *txtTelefone;

@end
