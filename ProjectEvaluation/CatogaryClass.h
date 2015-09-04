//
//  CatogaryClass.h
//  Quezt
//
//  Created by 9Dim on 25/05/15.
//  Copyright (c) 2015 XCube Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@interface CatogaryClass : NSObject
{
    
}


+(NSString *)ValidStr :(NSString *)InvalidStr;

+(NSString *)randomString: (int) len;
+(BOOL)isAlphabetString:(NSString *)Str;
+(BOOL)AlphanumericStr :(NSString *)str;
+(void)showAlert:(NSString *)Title :(NSString *)msg;
+(NSString *) getImageFromURL:(NSString *)fileURL;
+(UIImage *)getUIImageFromURL:(NSString *)fileURL;
+(NSString *) getImageFromImage:(UIImage *)image ;

+(UIImage *)Base64ToImage :(NSString *)Base64Str;
+(NSString *)ImageToBase64:(UIImage *)img;
+(UIImage*)ResizeImage:(UIImage*)image scaledToSize:(CGSize)newSize;



////---------(Modified methods for Images)---------
+(NSString *)ImageUrlProfile:(NSString *)Content;
+(NSString *)ImageUrlContent:(NSString *)Content;
+(UIImage *)ScreenShotofView:(UIView *)view;
+(UIImage *)BlurImage:(UIImage *)destImage :(CGFloat)blur;
+(UIImage *)scaleAndRotateImage:(UIImage *)image ;



///----------(Network msg)---------------------------

+(BOOL)isNetworkAvailable;
+(BOOL)networkStatus;
///---------(DependentClasses)>>>>>>>>>>
+(void)ShowToast:(UIView *)ShowView :(NSString *)Msg;
+(UIView *)halfRect:(UIView *)main :(UIColor *)fstColor :(UIColor *)secColor;



///-----------AsRequirmentRemovebleclass---------------
+(NSArray *)ImgUrlContentArray:(NSUInteger )Resolu :(NSString *)Content :(NSString *)SidVal;

///----wowMethods---
+(UIButton *)btntosetwithcolor:(UIColor*)clr andtext:(NSString*)str andWidth:(float)width;

//For Web Users
+(NSMutableArray *)testMethod:(NSMutableArray *)array;




+(NSMutableDictionary *)ValidDictionery:(NSDictionary *)targetDict;
+(NSMutableArray *)validPollArray:(NSDictionary *)responceDict;
+(NSMutableArray *)validPollArrayFromArray:(NSArray *)pollArr;

//emotiocons

+(NSString *)emojitounicode:(NSString*)str;
+(NSString *)unicodetoEmoji:(NSString*)str;


@end
