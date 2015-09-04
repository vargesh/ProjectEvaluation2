//
//  EvalutionEntryVC.h
//  ProjectEvaluation
//
//  Created by 9Dim on 27/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvalutionEntryVC : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *entryTV;
@property (weak, nonatomic) IBOutlet UIButton *addCellBtn;
- (IBAction)addCellAction:(id)sender;
- (IBAction)pop:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *CalculateDataBtn;
- (IBAction)calculateDataAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *calculatedDataTF;
@property (weak, nonatomic) IBOutlet UILabel *navTitleLbl;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *resetBtn;

- (IBAction)ResetAllData:(id)sender;




///////--------------SetedValues
@property int formulaNo;
@property (weak, nonatomic) NSString *navTitle;


@end
