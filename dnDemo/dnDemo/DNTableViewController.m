//
//  DNTableViewController.m
//  dnDemo
//
//  Created by nanding on 17/6/22.
//  Copyright © 2017年 nD. All rights reserved.
//

#import "DNTableViewController.h"
#import "DNTableViewCell.h"

@interface DNTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation DNTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_table registerNib:[UINib nibWithNibName:@"DNTableViewCell" bundle:nil] forCellReuseIdentifier:@"dnIdentifier"];
    
    self.table.estimatedRowHeight = 50.0f;
    self.table.rowHeight = UITableViewAutomaticDimension;
    
}


#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 3) {
        DNTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"dnIdentifier"];
        //cell1.label.text = DEMOString;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:DEMOString];
        
        NSString *blueStr = @"《指纹相关协议》";
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,DEMOString.length-blueStr.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(DEMOString.length-blueStr.length,blueStr.length)];
        
        cell1.label.attributedText = str;
        cell = cell1;
        
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    }
    return cell;
}




#pragma mark - UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat hei;
    DNTableViewCell *cell;
    if (indexPath.section == 3) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"dnIdentifier"];
        [cell setLabelHeight:DEMOString];
        //NSLog(@"cellHeight=====%f",cell.label.frame.size.height);
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
        hei = size.height;
    }else{
        hei = 44;
    }
    
    
    return hei;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
