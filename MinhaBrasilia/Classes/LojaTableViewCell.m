//
//  LojaTableViewCell.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/29/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "LojaTableViewCell.h"
#import "Utils.h"

@implementation LojaTableViewCell

- (void)awakeFromNib {
    [self.layer setCornerRadius:7.0f];
    [self.layer setMasksToBounds:YES];
    [self.layer setBorderWidth:0.2f];
    [self setBackgroundColor:[UIColor whiteColor]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.y += 4;
    frame.size.height -= 2 * 4;
    frame.origin.x += 7;
    frame.size.width -= 2 * 7;
    [super setFrame:frame];
}

- (void) preencherCelulaComTitulo:(NSString *)vlTitulo comSubtitulo:(NSString*)vlSubtitulo comCategoria:(NSString*)vlCategoria comEndereco:(NSString*)vlEndereco comQuadra:(NSString*)vlQuadra comTelefone:(NSString*)vlTelefone {
    
    if (![Utils isStringVazia:vlTitulo]) {
        [self.vlTitulo setText:vlTitulo];
    }
    if (![Utils isStringVazia:vlSubtitulo]) {
        [self.vlSubtitulo setText:vlSubtitulo];
    }
    if (![Utils isStringVazia:vlCategoria]) {
        [self.vlCategoria setText:vlCategoria];
    }
    if (![Utils isStringVazia:vlEndereco]) {
        [self.vlEndereco setText:vlEndereco];
    }
    if (![Utils isStringVazia:vlQuadra]) {
        [self.vlQuadra setText:vlQuadra];
    }
    if (![Utils isStringVazia:vlTelefone]) {
        [self.vlTelefone setText:vlTelefone];
    }
}

@end
