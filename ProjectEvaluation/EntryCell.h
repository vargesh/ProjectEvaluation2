//
//  EntryCell.h
//  ProjectEvaluation
//
//  Created by 9Dim on 27/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLbl;
@property (weak, nonatomic) IBOutlet UITextField *entryTf;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *dollerLbl;

@end
