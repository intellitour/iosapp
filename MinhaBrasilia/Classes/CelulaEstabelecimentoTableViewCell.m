//
//  CelulaEstabelecimentoTableViewCell.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/18/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

#import "CelulaEstabelecimentoTableViewCell.h"

@implementation CelulaEstabelecimentoTableViewCell
@synthesize labelCategoria;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) preencherCelulaCom:(NSString *) nomeDaCategoria {
    [labelCategoria setText:nomeDaCategoria];
}

@end
