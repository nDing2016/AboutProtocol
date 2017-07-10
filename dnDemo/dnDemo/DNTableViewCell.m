//
//  DNTableViewCell.m
//  dnDemo
//
//  Created by nanding on 17/6/22.
//  Copyright © 2017年 nD. All rights reserved.
//

#import "DNTableViewCell.h"


@interface DNTableViewCell ()



@end

@implementation DNTableViewCell

- (CGFloat)setLabelHeight:(NSString *)labelText
{
//    NSLayoutConstraint *hei = [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:100];
//    [self addConstraint:hei];
    
    //self.label.text = @"flfjaiejfoeakfpoerjaaaaaaaaaaaaaefsefsvfdvfrfvrevrvdrfvdfvrdvrdv";
    _label.text = labelText;
    
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    _label.preferredMaxLayoutWidth = CGRectGetWidth(_label.frame);
    //NSLog(@"labelFrame========%@",NSStringFromCGRect(_label.frame));
    return _label.frame.size.height;
//    self.label.textColor = [UIColor blackColor];
    
}



-(void)setLabel:(DNLabel *)label
{
    _label = label;
    //NSLog(@"=====%@",NSStringFromCGRect(_label.frame));
    CGSize size = [self getSize:DEMOString strFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(_label.frame.size.width, self.frame.size.height)];
    
    CGSize size1 = [self getSize:@"《指纹相关协议》" strFont:[UIFont systemFontOfSize:12] maxSize:self.frame.size];
    
    CGFloat hang = size.height/size1.height;
    
    CGSize size2 = [self getSize:DEMOString strFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(hang*_label.frame.size.width, size1.height)];
    CGFloat size2Width = size2.width;
    CGFloat cha = hang*_label.frame.size.width-size2Width;
    
    UIButton *btn = [[UIButton alloc] init];
    CGFloat size1Width = size1.width;
    CGFloat size1Height = size1.height;
    btn.frame = CGRectMake(_label.frame.size.width-cha-size1Width, (hang-1)*size1Height, size1Width, size1Height);
    NSLog(@"dn======%@",NSStringFromCGRect(btn.frame));
    btn.backgroundColor = [UIColor redColor];
    [_label addSubview:btn];
    [btn addTarget:self action:@selector(protocolClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)protocolClick:(UIButton *)sender
{
    
}



/**
 *  获取字符串size
 *
 *  @param string  字符串
 *  @param font    字号
 *  @param maxSize 最大size
 *
 *  @return 该字符串的size
 */
- (CGSize)getSize:(NSString *)string strFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    
    CGSize textSize = CGSizeZero;
    
    
    
    
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
        NSStringDrawingUsesFontLeading;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByCharWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
        
        CGRect rect = [string boundingRectWithSize:maxSize
                                           options:opts
                                        attributes:attributes
                                           context:nil];
        textSize = rect.size;
        
        
    }
    
    
    
    return textSize;
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
       
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
