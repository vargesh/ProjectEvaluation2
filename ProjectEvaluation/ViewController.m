//
//  ViewController.m
//  ProjectEvaluation
//
//  Created by 9Dim on 21/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import "ViewController.h"
#import "GlobalClass.h"
#import "MainCell.h"
#import "CatogaryClass.h"
#import "EvalutionEntryVC.h"
@interface ViewController ()
{
    NSArray *titlearry;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    
    [_ListTv reloadData];
    self.navigationController.navigationBarHidden=YES;
    
    
    for (int i=10; i<12; i++) {
        UIButton *Btn1=(UIButton *)[self.view viewWithTag:i];
        Btn1.layer.cornerRadius=Btn1.bounds.size.width/2;
        Btn1.layer.borderColor=RGB(232, 170, 84).CGColor;
        Btn1.layer.borderWidth=3;
    }
    
    titlearry=@[@"NPV",@"IRR",@"Payback Period"];
    NSArray *Imagearry=@[@"",@"",@"",@""];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableviewDelegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 71.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [titlearry count];    //count number of row from counting array hear cataGorry is An Array
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MainCell";
    MainCell *cell = (MainCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    cell.imageV.image=[UIImage imageNamed:@""];
    cell.imageV.backgroundColor=RGB(234, 176, 95);
    cell.titleLbl.text=[titlearry objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
   EvalutionEntryVC *Obj= SB_IDENTIFIER(@"EvalutionEntryVC");
    Obj.formulaNo=(int)indexPath.row ;
    Obj.navTitle=[titlearry objectAtIndex:indexPath.row];
    SB_PUSH(Obj);
    
   
    
    
   }


@end
