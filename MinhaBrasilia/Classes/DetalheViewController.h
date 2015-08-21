//
//  DetalheViewController.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/30/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Loja.h"
#import "AsaNorte.h"
#import "AsaSul.h"


@interface DetalheViewController : UIViewController

@property (nonatomic, strong) NSString* identificadorBtn;
@property (weak, nonatomic) IBOutlet UILabel *vlTitulo;


@end
