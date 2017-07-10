//
//  DNTableViewCell.h
//  dnDemo
//
//  Created by nanding on 17/6/22.
//  Copyright © 2017年 nD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNLabel.h"

@interface DNTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet DNLabel *label;

- (CGFloat)setLabelHeight:(NSString *)labelText;

@end
