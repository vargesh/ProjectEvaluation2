//
//  EvalutionEntryVC.m
//  ProjectEvaluation
//
//  Created by 9Dim on 27/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import "EvalutionEntryVC.h"
#import "GlobalClass.h"
#import "CatogaryClass.h"
#import "EntryCell.h"
#import "Formula.h"
@interface EvalutionEntryVC ()
{
    int CellCount;
    NSMutableArray *CashFlowMarry;
    NSMutableArray *BasicEntryMarry;
    UIToolbar* numberToolbar;
    
}

@end

@implementation EvalutionEntryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CellCount=1;
    
    
    //////////----------------
   
    CashFlowMarry=[[NSMutableArray alloc]init];
   
    for (int i = 0; i < 1; i++)
    {
        [CashFlowMarry addObject:@""];
    }
    
    
    
    BasicEntryMarry=[[NSMutableArray alloc]init];
    int BasicEntryMarryCount=0;
    if (_formulaNo==0) {BasicEntryMarryCount=2;}else{BasicEntryMarryCount=1;}
   
    
    for (int i = 0; i < BasicEntryMarryCount; i++)
    {
        [BasicEntryMarry addObject:@""];
    }
   
    
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.backgroundColor=[UIColor whiteColor];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 60.0, 50.0);
    [button setTitle:@"Done" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(DoneNumberPad) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    numberToolbar.items = [NSArray arrayWithObjects:
                           myButton,
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],nil];
    [numberToolbar sizeToFit];
    
  
}
-(void)viewWillAppear:(BOOL)animated
{
    
    /////////-------------Seted view by Fomula no---------------
    
    _navTitleLbl.text=[NSString stringWithFormat:@"%@",_navTitle];
    
    
    
    _CalculateDataBtn.layer.cornerRadius=5;
    _CalculateDataBtn.clipsToBounds=YES;
   _resetBtn.layer.cornerRadius=5;
     _resetBtn.clipsToBounds=YES;
    _calculatedDataTF.layer.cornerRadius=5;
    _calculatedDataTF.clipsToBounds=YES;
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    // Register notification when the keyboard will be show
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    // Register notification when the keyboard will be hide
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableviewDelegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;    //count of section
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 71.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
     if (section==0) {
         
         if (_formulaNo ==0){
              return 2;
         }else{
              return 1;
         }
         
         
        
     }else{
         return CashFlowMarry.count;
     }
    
    
    
    
        //count number of row from counting array hear cataGorry is An Array
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"EntryCell";
    EntryCell *cell = (EntryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section==0) {
        
        if (_formulaNo ==0) {
            if (indexPath.row==0) {
                cell.leftLbl.text=@"Discount rate:";
                cell.entryTf.placeholder=@"%";
               
                cell.entryTf.tag=[[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section+1,(long)indexPath.row] intValue];
                cell.entryTf.text=[BasicEntryMarry objectAtIndex:0];
                [cell.entryTf setKeyboardType:UIKeyboardTypeNumberPad];
                 cell.entryTf.inputAccessoryView = numberToolbar;
                cell.dollerLbl.text=@"%";
                 cell.entryTf.delegate=self;
                
            }else if (indexPath.row==1) {
                cell.leftLbl.text=@"Initial cost:";
                cell.entryTf.placeholder=@"$";
                
                cell.entryTf.tag=[[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section+1,(long)indexPath.row] intValue];
                cell.entryTf.text=[BasicEntryMarry objectAtIndex:1];
                 [cell.entryTf setKeyboardType:UIKeyboardTypeNumberPad];
                 cell.entryTf.inputAccessoryView = numberToolbar;
                 cell.entryTf.delegate=self;
                
            } else{
                
               
            }
            
        }else{
            
             if (indexPath.row==0) {
                cell.leftLbl.text=@"Initial cost:";
                cell.entryTf.placeholder=@"$";
                cell.entryTf.tag=[[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section+1,(long)indexPath.row] intValue];
                cell.entryTf.text=[BasicEntryMarry objectAtIndex:0];
                [cell.entryTf setKeyboardType:UIKeyboardTypeNumberPad];
                  cell.entryTf.inputAccessoryView = numberToolbar;
                 cell.entryTf.delegate=self;
            } else{
                
               
            }
        }

        
        
        
    }else{
        
        
        cell.leftLbl.text=[NSString stringWithFormat:@"Cash flow %ld:",indexPath.row+1];
        cell.entryTf.placeholder=@" $ per year";
        cell.entryTf.tag=[[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section+1,(long)indexPath.row] intValue];
        cell.entryTf.text=[CashFlowMarry objectAtIndex:indexPath.row];
         [cell.entryTf setKeyboardType:UIKeyboardTypeNumberPad];
         cell.entryTf.inputAccessoryView = numberToolbar;
        cell.entryTf.delegate=self;
        
        
        
    }
    
    
    
    
    
    
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //[CatogaryClass showAlert:@"" :@"cell Clicked"];
    [self.view endEditing:YES];
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    
     if (indexPath.section==1) {
        
         if (editingStyle == UITableViewCellEditingStyleDelete)
         {
             // Commit the delete
             
             NSLog(@"%ld",(long)indexPath.row);
             [CashFlowMarry removeObjectAtIndex:indexPath.row];
             CellCount=CellCount-1;
             [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
             [tableView reloadData];
             
         }

     }else{
         editingStyle=UITableViewCellEditingStyleNone;
     }
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     if (indexPath.section==1) {
         
         if (indexPath.row==0) {
             return UITableViewCellEditingStyleNone;

         }else{ return UITableViewCellEditingStyleDelete; }
        
     }else{return UITableViewCellEditingStyleNone;  }
   
}

- (IBAction)addCellAction:(id)sender {
    
    if (CellCount>20) {
        
        [CatogaryClass ShowToast:self.view :@"We have 20 year limit"];
    }else{
    [CashFlowMarry addObject:@""];
    CellCount=CellCount+1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:CellCount-1 inSection:1];
    [_entryTV insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [_entryTV reloadData];
    }
}

- (IBAction)pop:(id)sender {SB_POP;}
- (IBAction)calculateDataAction:(id)sender {
    [self.view endEditing:YES];
    BOOL sucess=NO;
    
    ////-----Get All Data from _entryTV
    for (int val=0; val <BasicEntryMarry.count; val++) {
        
        if ([[BasicEntryMarry objectAtIndex:val] length]==0) {
           
            [CatogaryClass ShowToast:self.view :@"Please enter All values"];
             sucess=NO;
            return;
        }else{
            sucess=YES;
        }
    }
    
    
    
    if (CashFlowMarry.count==20) {
        
      //  [CashFlowMarry removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(CellCount, 20-CellCount)]];
    }
   
    
    
    
    for (int val=0; val<CashFlowMarry.count; val++) {
        
        if ([[CashFlowMarry objectAtIndex:val] length]==0) {
          
            [CatogaryClass ShowToast:self.view :@"Please enter All Cash flow values"];
             sucess=NO;
             return;
        }else{ sucess=YES;}
    }
    
   
    
    
    ///////////--------------Implement formulas------------------------
    
    
    if (sucess) {
       // [_addCellBtn setHidden:YES];
        CGFloat Answer=0;
        if (_formulaNo==0) {
            Answer=[Formula npv:BasicEntryMarry :CashFlowMarry];
            _calculatedDataTF.text=[NSString stringWithFormat:@"$ %f",Answer];
        }else if (_formulaNo==1){
            
                _calculatedDataTF.text=[NSString stringWithFormat:@"%@%% p.a",[Formula irr:BasicEntryMarry :CashFlowMarry]];
        }
        else if (_formulaNo==2){
           
            _calculatedDataTF.text=[NSString stringWithFormat:@"%@ year",[Formula PaybackPeriod:BasicEntryMarry :CashFlowMarry]];

        }
       
    }
    
}

#pragma mark textfieldDelegates



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;{
    
    
    
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField;{
    
    
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField; {
    
    [textField resignFirstResponder];
    
      return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField;{
    
    
    NSString *TagStr=[NSString stringWithFormat:@"%ld",textField.tag];
    int section=[[TagStr substringToIndex:1] intValue];
    int indexpath=[[TagStr substringFromIndex:1] intValue];
    
    if (![textField.text floatValue]) {
     
        
        if (section==1) {
            //[CatogaryClass showAlert:@"" :[NSString stringWithFormat:@"Please enter valid value of %@",textField.placeholder]];
            [CatogaryClass ShowToast:self.view :[NSString stringWithFormat:@"Please enter valid value of %@",textField.placeholder]];
            textField.text=@"";
            [BasicEntryMarry replaceObjectAtIndex:indexpath withObject:textField.text];
        }else{
           // [CatogaryClass showAlert:@"" :[NSString stringWithFormat:@"Please enter valid value in CashFlow%d",indexpath+1]];
            [CatogaryClass ShowToast:self.view :[NSString stringWithFormat:@"Please enter valid value in CashFlow%d",indexpath+1]];
            textField.text=@"";
            [CashFlowMarry replaceObjectAtIndex:indexpath withObject:textField.text];
        }
        
        
    }else{
        
        
        if (section==1) {
           
            [BasicEntryMarry replaceObjectAtIndex:indexpath withObject:textField.text];
        }else{
            
            [CashFlowMarry replaceObjectAtIndex:indexpath withObject:textField.text];
        }
        
        
    }
    
}


- (IBAction)ResetAllData:(id)sender {
    
   // [_addCellBtn setHidden:NO];
    
    CellCount=1;
    CashFlowMarry=[[NSMutableArray alloc]init];
    
    for (int i = 0; i < 1; i++)
    {
        [CashFlowMarry addObject:@""];
    }
    
    
    
    BasicEntryMarry=[[NSMutableArray alloc]init];
    int BasicEntryMarryCount=0;
    if (_formulaNo==0) {BasicEntryMarryCount=2;}else{BasicEntryMarryCount=1;}
    
    
    for (int i = 0; i < BasicEntryMarryCount; i++)
    {
        [BasicEntryMarry addObject:@""];
    }
    
   
    [_entryTV reloadData];
    _calculatedDataTF.text=[NSString stringWithFormat:@"$ 0.00"];
    
    
}



-(void) keyboardWillShow:(NSNotification *)note
{

    
    CGRect NewFrm=_entryTV.frame;
    NewFrm.size.height=self.view.bounds.size.height/2;
    NewFrm.size.width=self.view.bounds.size.width;
    _entryTV.frame=NewFrm;
    
    
}


- (void)doneButton:(id)sender {
    [self.view endEditing:YES];
}
-(void)keyboardWillHide :(NSNotification *)note
{
    
    CGRect NewFrm=_entryTV.frame;
    CGFloat ViewHit=self.view.bounds.size.height/4.8;
    NewFrm.size.height=self.view.bounds.size.height-ViewHit;
    NewFrm.size.width=self.view.bounds.size.width;
     _entryTV.frame=NewFrm;
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)DoneNumberPad{
    [self.view endEditing:YES];
}





@end
