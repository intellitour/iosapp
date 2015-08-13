//
//  LojaTableViewCell.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/29/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "LojaTableViewCell.h"

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
    [super setFrame:frame];
}

- (void) preencherCelulaComTitulo:(NSString *)vlTitulo comSubtitulo:(NSString*)vlSubtitulo comCategoria:(Categoria*)vlCategoria comEndereco:(NSString*)vlEndereco comQuadra:(Quadra*)vlQuadra comTelefone:(NSString*)vlTelefone{
    if (!isEmpty(vlTitulo)) {
        [self.vlTitulo setText:vlTitulo];
    }
    if (!isEmpty(vlSubtitulo)) {
        [self.vlSubtitulo setText:vlSubtitulo];
    }
    if (!isEmpty(vlCategoria)) {
        [self.vlCategoria setValue:vlCategoria forKey:@"nome"];
    }
    if (!isEmpty(vlEndereco)) {
        [self.vlEndereco setText:vlEndereco];
    }
    if (!isEmpty(vlQuadra)) {
        [self.vlQuadra setValue:vlQuadra forKey:@"nome"];
    }
    if (!isEmpty(vlTelefone)) {
        [self.vlTelefone setText:vlTelefone];
    }
}

static inline BOOL isEmpty(id objeto) {
    return objeto == nil ||
    ([objeto respondsToSelector:@selector(length)] && [(NSData *)objeto length] == 0) ||
    ([objeto respondsToSelector:@selector(count)] && [(NSArray *)objeto count] == 0);
}
@end
