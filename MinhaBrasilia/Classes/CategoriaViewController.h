//
//  CategoriaViewController.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/27/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriaViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *itensDaTabela;
@property (nonatomic, strong) NSManagedObjectContext *contexto;

@end
