//
//  LojaTableViewCell.h
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/29/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LojaTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *vlTitulo;
@property (weak, nonatomic) IBOutlet UILabel *vlSubtitulo;
@property (weak, nonatomic) IBOutlet UILabel *vlCategoria;
@property (weak, nonatomic) IBOutlet UILabel *vlEndereco;
@property (weak, nonatomic) IBOutlet UILabel *vlQuadra;
@property (weak, nonatomic) IBOutlet UILabel *vlTelefone;

- (void) preencherCelulaComTitulo:(NSString *)vlTitulo comSubtitulo:(NSString*)vlSubtitulo comCategoria:(NSString*)vlCategoria comEndereco:(NSString*)vlEndereco comQuadra:(NSString*)vlQuadra comTelefone:(NSString*)vlTelefone;


@end
