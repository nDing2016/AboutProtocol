//
//  DNLabel.m
//  dnDemo
//
//  Created by nanding on 17/6/22.
//  Copyright © 2017年 nD. All rights reserved.
//

#import "DNLabel.h"

@implementation DNLabel





//-(void)layoutSubviews
//{
//    self.text = @"flfjaiejfoeakfpoerjaaaaaaaaaaaaaefsefsvfdvfrfvrevrvdrfvdfvrdvrdvoooooooooooooooooooooooooookhkghjknlkjlhgygljjihhnnnnnnnnnnnnnnnfoeakfpoerjaaaaaaaaaaaaaefsefsvfdvfrfvrevrvdrfvdfvrdvrdvoooooooooooooooooooooooooookhkghjknlkjlhgygljjihhnnnnnnnnnnnnnnn";
//    self.textColor = [UIColor blackColor];
//}


//-(void)drawRect:(CGRect)rect
//{
//    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:DEMOString];
//    
//    NSString *blueStr = @"《指纹相关协议》";
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,DEMOString.length-blueStr.length)];
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(DEMOString.length-blueStr.length,blueStr.length)];
//    
//    
//    
//    
//    
//    
//    
//    NSString *strD = [str string];
//    
//    CGSize size = [self drawWithStr:strD Font:[UIFont systemFontOfSize:12] Color:[UIColor blackColor] Point:CGPointMake(0, 0)];
//    
//    CGSize size1 = [self getSize:@"《指纹相关协议》" strFont:[UIFont systemFontOfSize:12] maxSize:self.frame.size];
//    
//    CGFloat hang = size.height/size1.height;
//    
//    CGSize size2 = [self getSize:DEMOString strFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(hang*self.frame.size.width, size1.height)];
//    CGFloat size2Width = size2.width;
//    CGFloat cha = hang*self.frame.size.width-size2Width;
//    
//    UIButton *btn = [[UIButton alloc] init];
//    CGFloat size1Width = size1.width;
//    CGFloat size1Height = size1.height;
//    btn.frame = CGRectMake(self.frame.size.width-cha-size1Width+10, (hang-1)*size1Height, size1Width-10, size1Height);
//    NSLog(@"dn======%@",NSStringFromCGRect(btn.frame));
//    
//    [self addSubview:btn];
//    
//    
//}


/**
 *  绘制文字
 *
 *  @param str   字符串
 *  @param font  字号
 *  @param color 颜色
 *  @param point 坐标点
 */
- (CGSize)drawWithStr:(NSString *)str Font:(UIFont *)font Color:(UIColor *)color Point:(CGPoint)point
{
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    //paragraphStyle.alignment=NSTextAlignmentCenter;//文字居中
//    NSDictionary* attribute1 = @{
//                                 NSForegroundColorAttributeName:color,//设置文字颜色
//                                 NSFontAttributeName:font,//设置文字的字体
//                                 NSParagraphStyleAttributeName:paragraphStyle,//设置文字的样式
//                                 };
    
    
    
    NSDictionary* attribute1 = @{
                                 //设置文字颜色
                                 NSFontAttributeName:font,//设置文字的字体
                                 NSParagraphStyleAttributeName:paragraphStyle,//设置文字的样式
                                 };
    
    CGSize size1 = CGSizeZero;
    if ([str respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
        size1 = [str boundingRectWithSize:self.bounds.size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{
                                            NSFontAttributeName:font,//设置文字的字体
                                            NSKernAttributeName:@0,//文字之间的字距
                                            }
                                  context:nil].size;
    }
    
    
    
    CGRect rect1 = CGRectMake(point.x, point.y, size1.width, size1.height);
    
    if ([str respondsToSelector:@selector(drawInRect:withAttributes:)]) {
        [str drawInRect:rect1 withAttributes:attribute1];
    }

    return size1;
    
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



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
