//
//  Formula.h
//  ProjectEvaluation
//
//  Created by 9Dim on 27/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Formula : NSObject

+(NSString *)irr:(NSArray *)BasicArr :(NSArray *)CashflowArr;
+(CGFloat)npv:(NSArray *)BasicArr :(NSArray *)CashflowArr;
+(NSString *)PaybackPeriod :(NSArray *)BasicArr :(NSArray *)CashflowArr;

@end
