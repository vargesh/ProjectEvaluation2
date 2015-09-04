
//  CatogaryClass.m
//  Quezt
//
//  Created by 9Dim on 25/05/15.
//  Copyright (c) 2015 XCube Inc. All rights reserved.
//

#import "CatogaryClass.h"
#import "GlobalClass.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
//#import "Reachability.h"
@implementation CatogaryClass







+(void)showAlert:(NSString *)Title :(NSString *)msg;
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Title
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    
}




NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+(NSString *)randomString: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return [NSString stringWithFormat:@"%@%@",[self CurrentDate],randomString];
}

+(NSString *)CurrentDate
{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
   
    NSInteger day = [components day];
    NSInteger week = [components month];
    NSInteger year = [components year];
    [NSString stringWithFormat:@"%ld.%ld.%ld", (long)day, (long)week, (long)year];
    
    
    NSDate *currentDate = [NSDate date];
    
    NSLog(@"currentDate: %@", currentDate); // Result: currentDate: 2014-05-19 05:21:50 +0000
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter2 setDateFormat:@"yyyyMMddHHmmss"];
    
    NSString *strDate = [dateFormatter2 stringFromDate:currentDate];
    
    
    return strDate;
}

+(NSString *) getImageFromImage:(UIImage *)image {
    
    
    NSString *basestr1 = [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]  ;
    
    
    
    
    return basestr1;
}

+(NSString *) getImageFromURL:(NSString *)fileURL {
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    NSString *basestr1 = [UIImagePNGRepresentation(result) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]  ;
    
    
    
    
    return basestr1;
}
+(UIImage *)getUIImageFromURL:(NSString *)fileURL {
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
   
    return result;
}
+(UIImage *)Base64ToImage :(NSString *)Base64Str
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:Base64Str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
   return [UIImage imageWithData:data];
    
}
+(NSString *)ImageToBase64:(UIImage *)img
{
     return [UIImagePNGRepresentation(img) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength] ;
}

/*
+(NSString *)ImageUrlProfile:(NSString *)Content
{
    
    return  [NSString stringWithFormat:@"%@%@%@",BASEURL_STRING_PROFILEIMAGEDOWNLOADURL,Content,@".png"];
    
}
+(NSString *)ImageUrlContent:(NSString *)Content
{
   
     return [NSString stringWithFormat:@"%@%@%@",BASEURL_STRING_IMAGEDOWNLOADURL,Content,@".png"];
}



+(NSArray *)ImgUrlContentArray:(NSUInteger )Resolu :(NSString *)Content :(NSString *)SidVal
{    NSArray *Arr;
    if (Content.length==0) {
        return Arr;
    }
    
    
    NSArray *ImageArray = [Content componentsSeparatedByString:@","];
    NSMutableArray *Mimagearrr=[[NSMutableArray alloc]init];
    for (int val=0; val<ImageArray.count; val++) {
        
        NSString *UrlString;
        if (Resolu==1) { UrlString=URL_IMAGEDOWNLOAD_1X;
        }else if (Resolu==2){UrlString=URL_IMAGEDOWNLOAD_2X;}
        else if (Resolu==3){UrlString=URL_IMAGEDOWNLOAD_3X;}
        else{UrlString=BASEURL_STRING_IMAGEDOWNLOADURL;}
       
        
        ///-------Add UserSid inUrl-----------
       
        UrlString = [UrlString stringByReplacingOccurrencesOfString:@"sid"
                                             withString:SidVal];
        
        [Mimagearrr addObject:[NSString stringWithFormat:@"%@%@%@",UrlString,[ImageArray objectAtIndex:val],@".jpg"]];
    }
       
    Arr=[Mimagearrr copy];
      return Arr;
    
   
    
    
    
}



+(BOOL)isAlphabetString:(NSString *)Str
{
    
    
    if (Str.length==0) {
         return NO;
    }
    
    NSRegularExpression *regex = [[NSRegularExpression alloc]
                                   initWithPattern:@"[a-zA-Z]" options:0 error:NULL];
    
    // Assuming you have some NSString `myString`.
    NSUInteger matches = [regex numberOfMatchesInString:Str options:0 range:NSMakeRange(0, [Str length])];
    
    
    
    
    if (matches==Str.length) {
      return YES;
    }else{
    return NO;
    }
}
+(BOOL)AlphanumericStr :(NSString *)str
{
    NSCharacterSet *alphaSet = [NSCharacterSet alphanumericCharacterSet];
    BOOL valid = [[str stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@""];
    return valid;
}


*/

///------------------------(DependentClasses And Methods)>>>>>>>>>>>>>

+(void)ShowToast:(UIView *)ShowView :(NSString *)Msg
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:ShowView animated:YES];
    hud.mode = MBProgressHUDModeText;
   // hud.backgroundColor=[UIColor lightGrayColor];
   // hud.detailsLabelColor=[UIColor lightGrayColor];
    hud.detailsLabelFont=FONT_R(12);
    hud.opacity=0.7;
    hud.animationType=MBProgressHUDAnimationZoomIn;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.detailsLabelText = Msg;
    hud.removeFromSuperViewOnHide = YES;

    [hud hide:YES afterDelay:1];
}

+(UIImage *)ScreenShotofView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
+(UIImage *)BlurImage:(UIImage *)destImage :(CGFloat)blur {
    
    //-USE-- CGFloat factor = 0.1;
    // NSData *imageData = UIImageJPEGRepresentation(self, 1); // convert to jpeg
    // UIImage* destImage = [UIImage imageWithData:imageData];
    
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

+(UIImage*)ResizeImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    
    ///----if Image 3000 Then /5
    ///----if Image 2000 Then /4
    ///----if Image 1000 Then /2
    
    CGFloat WID;
    CGFloat HIT;
    CGSize ModifySize;
     if ((image.size.height+image.size.width)>3000) {
         WID=(newSize.width)/5;
         HIT=(newSize.height)/5;
         ModifySize=CGSizeMake(WID, HIT);
         
     }else if ((image.size.height+image.size.width)>2000){
         WID=(newSize.width)/4;
         HIT=(newSize.height)/4;
         ModifySize=CGSizeMake(WID, HIT);
         
     }else{
         
         WID=(newSize.width)/2;
         HIT=(newSize.height)/2;
         ModifySize=CGSizeMake(WID, HIT);
         
     }
        
    UIGraphicsBeginImageContext( ModifySize );
    [image drawInRect:CGRectMake(0,0,ModifySize.width,ModifySize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return newImage;
}
+(BOOL)isNetworkAvailable
{
    CFNetDiagnosticRef dReference;
    dReference = CFNetDiagnosticCreateWithURL (NULL, (__bridge CFURLRef)[NSURL URLWithString:@"www.apple.com"]);
    
    CFNetDiagnosticStatus status;
    status = CFNetDiagnosticCopyNetworkStatusPassively (dReference, NULL);
    
    CFRelease (dReference);
    
    if ( status == kCFNetDiagnosticConnectionUp )
    {
        NSLog (@"Connection is Available");
        return YES;
    }
    else
    {
        NSLog (@"Connection is down");
        return NO;
    }
}


/*
+(BOOL)networkStatus
{
    BOOL statusStr;
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        //No internet
        statusStr=NO;
        
        
    }
    else if (status == ReachableViaWiFi)
    {
         statusStr=YES;
        //WiFi
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
         statusStr=YES;
    }
    
    
    return statusStr;
    
    
}










//------<<<<<<<<<<<<<<<<<<<<(Main functions Threading)>>>>>>>>>>

+ (void)Backgroundthreading:(SEL )func fromObject:(id) object{
    
    
    ///--Use--[ClassA Backgroundthreading:@selector(littleCFunction) fromObject:self]
    
    
    
    [AppDelegate showGlobalProgressHUDWithTitle:@"Loading Please wait...."];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background Thread
       
         [object performSelector:func];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            
            [AppDelegate dismissGlobalHUD];
            
        });
    });
    

    
}
//////-------------------Remove Image Rotation-----------------
+(UIImage *)scaleAndRotateImage:(UIImage *)image {
    
    int kMaxResolution = 640; // Or whatever
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = roundf(bounds.size.width / ratio);
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = roundf(bounds.size.height * ratio);
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}

///----wowMethods---
+(UIButton *)btntosetwithcolor:(UIColor*)clr andtext:(NSString*)str andWidth:(float)width
{
    
    UIButton *mybutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [mybutton setBackgroundColor:clr];
    //[mybutton setBackgroundColor:[UIColor greenColor]];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 35)];
    lbl.text = str;
    lbl.font = FONT_B(16);
   // lbl.backgroundColor = [UIColor grayColor];
    lbl.textColor = [UIColor whiteColor];
    [mybutton addSubview:lbl];
    
    
    UIImageView *crossimgView = [[UIImageView alloc] initWithFrame:CGRectMake(width - 28, 10, 15, 15)];
    crossimgView.image = [UIImage imageNamed:@"cancel_icon.png"];
    [mybutton addSubview:crossimgView];
 
    return mybutton;
}
+(NSString *)ValidStr :(NSString *)InvalidStr
{
    
      NSString *Str;
    
    if ([InvalidStr length]==0 || [InvalidStr isEqual:(id)@"(null)"] || [InvalidStr isEqual:(id)@"null"] ) {
        Str=@"";
    }
    if (InvalidStr.length>0) {
        Str=InvalidStr;
    }else{
        Str=@"";

    }
    return  Str;
}

//For Web Users
+(NSMutableArray *)testMethod:(NSMutableArray *)array {
    //_tview.scrollEnabled = NO;
    NSDictionary *dic;
    NSMutableArray *testArray = [array mutableCopy];
    

    
    if ([[[testArray objectAtIndex:0]valueForKey:STATUS_CODE] intValue]==201) {
         return testArray;
    }else{
        
        NSInteger arrayCount = testArray.count;
        NSMutableArray *IndexArray = [[NSMutableArray alloc] init];
        for (int val = 0; val < arrayCount; val++) {
            
            
            if (![[[testArray objectAtIndex:val] valueForKey:@"first_name"] length]==0) {
                
                if ([[[testArray objectAtIndex:val] valueForKey:@"first_name"] isEqualToString:@"Web User"]) {
                    
                    dic = [testArray objectAtIndex:val];
                    [IndexArray addObject:[NSNumber numberWithInt:val]];
                    
                }
            } else {
                
                
                
                NSMutableDictionary *muteDic  =  [[testArray objectAtIndex:val] mutableCopy];
 
                [muteDic setObject:@"Web user" forKey:@"first_name"];
                [testArray replaceObjectAtIndex:val withObject:muteDic];
            }
            
        }
        
        for (int vall = 0; vall < IndexArray.count; vall++) {
            
            [testArray removeObjectAtIndex:[[IndexArray objectAtIndex:0] intValue]];
        }
        //   NSLog(@" testArray ---%@", testArray);
        //  NSLog(@" dic-----%@",dic);
        if (dic) {
            
            if (IndexArray.count > 1) {
                NSMutableDictionary *muteDic  =  [dic mutableCopy];
                NSString *indexStr = [NSString stringWithFormat:@"%@(%d)",@"Web Users",IndexArray.count];
                [muteDic setObject:indexStr forKey:@"first_name"];
                [testArray addObject:muteDic];
            } else {
                [testArray addObject:dic];
            }
            
            
            
        }
        
        
        
        return testArray;
        
    }
    
    
    
    
}


+(NSMutableDictionary *)ValidDictionery:(NSDictionary *)targetDict
{
    //make it to be NSMutableDictionary in case that it is nsdictionary
    NSMutableDictionary *m = [targetDict mutableCopy];
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary: m];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in [replaced allKeys]) {
        const id object = [replaced objectForKey: key];
        if (object == nul || [object isEqual:(id)@"(null)"] || [object isEqual:(id)@"null"] ) {
            [replaced setObject: blank forKey: key];
        }
        else if ([object isKindOfClass: [NSArray class]]) {
            NSLog(@"found null inside and key is %@", key);
            //make it to be able to set value by create a new one
            NSMutableArray *a = [object mutableCopy];
            for (int i =0; i< [a count]; i++) {
                
                for (NSString *subKey in [[a objectAtIndex:i] allKeys]) {
                    //                    NSLog(@"key: %@", subKey);
                    //                    NSLog(@"value: %@", [[object objectAtIndex:i] valueForKey:subKey]);
                    if ([[object objectAtIndex:i] valueForKey:subKey] == nul || [object isEqual:(id)@"(null)"]) {
                        [[object objectAtIndex:i] setValue:blank forKey:subKey];
                    }
                }
                
            }
            //replace the updated one with old one
            [replaced setObject:a forKey:key];
            
        }
        
    }
    
    return replaced;
}
+(NSMutableArray *)validPollArray:(NSDictionary *)responceDict
{
    
    NSArray *pollArr=[responceDict valueForKey:@"poll"];
    NSMutableArray *perfectArray=[[NSMutableArray alloc]init];
    
     for (int val =0; val< [pollArr count]; val++) {
    
         NSDictionary *targetDict=[pollArr objectAtIndex:val];
    
         
         //make it to be NSMutableDictionary in case that it is nsdictionary
         NSMutableDictionary *m = [targetDict mutableCopy];
         NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary: m];
         const id nul = [NSNull null];
         const NSString *blank = @"";
         
         for (NSString *key in [replaced allKeys]) {
             const id object = [replaced objectForKey: key];
             if (object == nul || [object isEqual:(id)@"(null)"] || [object isEqual:(id)@"null"] ) {
                 [replaced setObject: blank forKey: key];
             }
             else if ([object isKindOfClass: [NSArray class]]) {
                 NSLog(@"found null inside and key is %@", key);
                 //make it to be able to set value by create a new one
                 NSMutableArray *a = [object mutableCopy];
                 for (int i =0; i< [a count]; i++) {
                     
                     for (NSString *subKey in [[a objectAtIndex:i] allKeys]) {
                         //                    NSLog(@"key: %@", subKey);
                         //                    NSLog(@"value: %@", [[object objectAtIndex:i] valueForKey:subKey]);
                         if ([[object objectAtIndex:i] valueForKey:subKey] == nul || [object isEqual:(id)@"(null)"] || [object isEqual:(id)@"null"]) {
                             [[object objectAtIndex:i] setValue:blank forKey:subKey];
                         }
                     }
                     
                 }
                 //replace the updated one with old one
                 [replaced setObject:a forKey:key];
                 
             }
             
         }

         [perfectArray addObject:replaced];
     }
    return perfectArray;
}


+(NSMutableArray *)validPollArrayFromArray:(NSArray *)pollArr
{
    
   
    NSMutableArray *perfectArray=[[NSMutableArray alloc]init];
    
    for (int val =0; val< [pollArr count]; val++) {
        
        NSDictionary *targetDict=[pollArr objectAtIndex:val];
        
        
        //make it to be NSMutableDictionary in case that it is nsdictionary
        NSMutableDictionary *m = [targetDict mutableCopy];
        NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary: m];
        const id nul = [NSNull null];
        const NSString *blank = @"";
        
        for (NSString *key in [replaced allKeys]) {
            const id object = [replaced objectForKey: key];
            if (object == nul || [object isEqual:(id)@"(null)"] || [object isEqual:(id)@"null"] ) {
                [replaced setObject: blank forKey: key];
            }
            else if ([object isKindOfClass: [NSArray class]]) {
                NSLog(@"found null inside and key is %@", key);
                //make it to be able to set value by create a new one
                NSMutableArray *a = [object mutableCopy];
                for (int i =0; i< [a count]; i++) {
                    
                    for (NSString *subKey in [[a objectAtIndex:i] allKeys]) {
                        //                    NSLog(@"key: %@", subKey);
                        //                    NSLog(@"value: %@", [[object objectAtIndex:i] valueForKey:subKey]);
                        if ([[object objectAtIndex:i] valueForKey:subKey] == nul || [object isEqual:(id)@"(null)"] || [object isEqual:(id)@"null"]) {
                            [[object objectAtIndex:i] setValue:blank forKey:subKey];
                        }
                    }
                    
                }
                //replace the updated one with old one
                [replaced setObject:a forKey:key];
                
            }
            
        }
        
        [perfectArray addObject:replaced];
    }
    return perfectArray;
}


+(UIView *)halfRect:(UIView *)main :(UIColor *)fstColor :(UIColor *)secColor
{
    
    /*
    // Top View
    CGRect topRect = {CGRectGetMinX(main.bounds), CGRectGetMinY(main.bounds), CGRectGetMaxX(main.bounds)/5, CGRectGetMaxY(main.bounds)};
    [fstColor setFill];
    UIRectFill(topRect);
    
    // Bottom View
    CGRect bottomRect = {CGRectGetMaxX(main.bounds)/5, CGRectGetMinY(main.bounds), CGRectGetMaxX(main.bounds)-CGRectGetMaxX(main.bounds)/5, CGRectGetMidY(main.bounds)};
    [secColor setFill];
    UIRectFill(bottomRect);
    
    return main;
    

    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect topView = CGRectMake(-60, 0, main.bounds.size.width, main.bounds.size.height / 2);
    CGRect bottomView = CGRectMake(0, main.bounds.size.height / 2, main.bounds.size.width, main.bounds.size.height / 2);
    
    UIColor * grayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    
    CGContextSetFillColorWithColor(context, grayColor.CGColor);
    CGContextFillRect(context, bottomView);
    
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextFillRect(context, topView);
        
    return main;
    
    
}

//emoticon
+(NSString *)emojitounicode:(NSString*)str
{
    NSData *data = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *goodValue = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return goodValue;
    
}

+(NSString *)unicodetoEmoji:(NSString*)str
{
    
    
    //   [tset stringByReplacingOccurrencesOfString:@"'\'" withString:@"\\"];
    if ([str containsString:@"\\"]) {
        NSData *newdata=[str dataUsingEncoding:NSUTF8StringEncoding
                          allowLossyConversion:YES];
        NSString *goodValue = [[NSString alloc] initWithData:newdata encoding:NSNonLossyASCIIStringEncoding];
        
        return goodValue;
        
    } else {
        return str;
    }
    
    
   
}

    */

@end
