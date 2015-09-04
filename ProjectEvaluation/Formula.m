//
//  Formula.m
//  ProjectEvaluation
//
//  Created by 9Dim on 27/08/15.
//  Copyright (c) 2015 9Dim. All rights reserved.
//

#import "Formula.h"





#define LOW_RATE -1.0
#define HIGH_RATE 1.0
#define MAX_ITERATION 1000
#define PRECISION_REQ 0.00000001

@implementation Formula

+(NSString *)irr:(NSArray *)BasicArr :(NSArray *)CashflowArr;
{/****************
  
  NPV = (∑ {Discounted Period
  Cash Flow/Initial Cost)
  ^ (1/T) - 1
  
  
  
  0 = P0 + P1/(1+IRR) + P2/(1+IRR)2 + P3/(1+IRR)3 + . . . +Pn/(1+IRR)n
  
  where P0, P1, . . . Pn equals the cash flows in periods 1, 2, . . . n, respectively; and
  IRR equals the project's internal rate of return.
  
  
  ******************/
   // -(double)computeIRR :(NSArray*)cf :(int)numOfFlows
   
    
    
    int InitialInvestment=[[BasicArr objectAtIndex:0] floatValue];
    NSMutableArray *cf=[[NSMutableArray alloc]init];
    cf =[CashflowArr mutableCopy];
    [cf insertObject:[NSString stringWithFormat:@"%d",-InitialInvestment] atIndex:0];
    
    
    
    int i = 0,j = 0;
    int numOfFlows=(int)cf.count;
    double old = 0.00;
    double new = 0.00;
    double oldguessRate = LOW_RATE;
    double newguessRate = LOW_RATE;
    double guessRate = LOW_RATE;
    double lowGuessRate = LOW_RATE;
    double highGuessRate = HIGH_RATE;
    double npv = 0.0;
    double denom = 0.0;
    for(i=0; i<MAX_ITERATION; i++)
    {
        npv = 0.00;
        for(j=0; j<numOfFlows; j++)
        {
            denom = pow((1 + guessRate),j);
            npv = npv + ([cf[j] doubleValue]/denom);
        }
        /* Stop checking once the required precision is achieved */
        if((npv > 0) && (npv < PRECISION_REQ))
            break;
        if(old == 0)
            old = npv;
        else
            old = new;
        new = npv;
        if(i > 0)
        {
            if(old < new)
            {
                if(old < 0 && new < 0)
                    highGuessRate = newguessRate;
                else
                    lowGuessRate = newguessRate;
            }
            else
            {
                if(old > 0 && new > 0)
                    lowGuessRate = newguessRate;
                else
                    highGuessRate = newguessRate;
            }
        }
        oldguessRate = guessRate;
        guessRate = (lowGuessRate + highGuessRate) / 2;
        newguessRate = guessRate;
    }
    
    guessRate= guessRate*100;
    NSString *roundedAmount = [NSString stringWithFormat:@"%.2f", guessRate];
    
  
    
    return roundedAmount;
    

    
    
}
+(CGFloat )npv:(NSArray *)BasicArr :(NSArray *)CashflowArr;
{/****************
    NPV = ∑ {Net Period Cash Flow/(1+Dis Rate)^T} - Initial Cost
    T = Time of year 1, year 2, year 3, …
    ******************/
    
    CGFloat Answer;
    
    
    float Discrate=1+([[BasicArr objectAtIndex:0] floatValue]/100);
    float totalTime=CashflowArr.count;
    float InitialCost=[[BasicArr objectAtIndex:1] intValue];
    float npvValue=0;
    NSArray * DisPeriodCashFlow=CashflowArr;
    
    
    for (int timeVal=0; timeVal<totalTime+1; timeVal++) {
        
        
        
        if (timeVal==0) {
            
            
            npvValue+=-InitialCost;
            
        }else{
          float npvValueL=([[DisPeriodCashFlow objectAtIndex:timeVal-1] floatValue])/pow((Discrate),timeVal);
            
            npvValue=npvValue+npvValueL;
            
       }
        
    }
    
    
    Answer=npvValue;
    
    
    
    return Answer;
    
}
+(NSString *)PaybackPeriod:(NSArray *)BasicArr :(NSArray *)CashflowAry;
{/****************
  Intial cost – 1st year CF = Residual – 2nd year CF = Residual – 3rd year CF .. Till the residual closes to zero.
  
  Payback Period = Initial Investment ÷ Annual Cash Flow = $105M ÷ $25M = 4.2 years
  ******************/
    
     CGFloat InitialInvestment=[[BasicArr objectAtIndex:0] floatValue];
    CGFloat AnnualCashFlow=0;
     NSMutableArray *CashflowArr=[[NSMutableArray alloc]init];
    CashflowArr=[CashflowAry mutableCopy];
   [CashflowArr insertObject:[BasicArr objectAtIndex:0] atIndex:0];
    
    
    
   /*
    
    NSMutableArray *CumulativeMArray=[[NSMutableArray alloc]init];
    for (int val=0; val<CashflowArr.count; val++) {
      
        if (val==0) {[CumulativeMArray addObject:[CashflowArr objectAtIndex:0]];}else{
         [CumulativeMArray addObject:[NSString stringWithFormat:@"%d",([[CumulativeMArray objectAtIndex:val-1] intValue]-[[CashflowArr objectAtIndex:val] intValue])]];
        } }
    
    
    /////-----PaybackPeriod Formula------
    
  
     float PaybackPeriod=0;
     for (int val=0; val<CashflowArr.count; val++) {
         if (val==0) {}else{
             
             PaybackPeriod=PaybackPeriod +([[CumulativeMArray objectAtIndex:val-1] floatValue]/[[CashflowArr objectAtIndex:val] floatValue]); }
         
     }
    
    
    PaybackPeriod=PaybackPeriod/CashflowAry.count;
    PaybackPeriod =[[NSString stringWithFormat:@"%.2f", PaybackPeriod] floatValue];
    
    
    */
    
    /////-----PaybackPeriod Formula------
    
   
    float PaybackPeriod=0;
    for (int val=0; val<CashflowAry.count; val++) {
       
            
            PaybackPeriod=PaybackPeriod +[[CashflowAry objectAtIndex:val] floatValue];
        
    }
    
    
    PaybackPeriod=InitialInvestment/(PaybackPeriod/CashflowAry.count);
    float rounded_up =[[NSString stringWithFormat:@"%.2f", PaybackPeriod] floatValue];
    
    NSString *roundedAmount = [NSString stringWithFormat:@"%.2f", PaybackPeriod];
    
    return roundedAmount;
}




-(double)computeIRR :(NSArray*)cf :(int)numOfFlows
{
    
        int i = 0,j = 0;
    
        double old = 0.00;
        double new = 0.00;
        double oldguessRate = LOW_RATE;
        double newguessRate = LOW_RATE;
        double guessRate = LOW_RATE;
        double lowGuessRate = LOW_RATE;
        double highGuessRate = HIGH_RATE;
        double npv = 0.0;
        double denom = 0.0;
        for(i=0; i<MAX_ITERATION; i++)
        {
            npv = 0.00;
            for(j=0; j<numOfFlows; j++)
            {
                denom = pow((1 + guessRate),j);
                npv = npv + ([cf[j] doubleValue]/denom);
            }
            /* Stop checking once the required precision is achieved */
            if((npv > 0) && (npv < PRECISION_REQ))
                break;
            if(old == 0)
                old = npv;
            else
                old = new;
            new = npv;
            if(i > 0)
            {
                if(old < new)
                {
                    if(old < 0 && new < 0)
                        highGuessRate = newguessRate;
                    else
                        lowGuessRate = newguessRate;
                }
                else
                {
                    if(old > 0 && new > 0)
                        lowGuessRate = newguessRate;
                    else
                        highGuessRate = newguessRate;
                }
            }
            oldguessRate = guessRate;
            guessRate = (lowGuessRate + highGuessRate) / 2;
            newguessRate = guessRate;
        }
        return guessRate;
    
}


@end
