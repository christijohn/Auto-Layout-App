//
//  ShareViewController.m
//  Auto_Layout
//
//  Created by Christi John on 16/04/15.
//  Copyright (c) 2015 Christi John. All rights reserved.
//

#import "ShareViewController.h"

#define sampleText @"The value of this attribute is an NSParagraphStyle object. Use this attribute to apply multiple attributes to a range of text. If you do not specify this attribute, the string uses the default paragraph attributes, as returned by the defaultParagraphStyle method of NSParagraphStyle."
@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareAction:(id)sender {
    
    UIImage *shareImage = [UIImage imageNamed:@"template1.jpg"];
    shareImage = [self applyBlurOnImage:shareImage withRadius:5];
    shareImage = [self drawText:sampleText inImage:shareImage atPoint:CGPointMake(10, 10)];
    shareImage = [self addLogotoImage:shareImage];
    
    _shareImageView.image = shareImage;
    
    
}

- (IBAction)saveImage:(id)sender {
    
    [self saveImageToLibrary];
}

#pragma mark -
#pragma mark - Private Methods
#pragma mark -

-(UIImage*) drawText:(NSString*) text
             inImage:(UIImage*)  image
             atPoint:(CGPoint)   point
{
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    NSDictionary *attriDic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.size.width-20, image.size.height);
    [[UIColor whiteColor] set];
    [text drawInRect:CGRectIntegral(rect) withAttributes:attriDic];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void) saveImageToLibrary{
    
    UIImageWriteToSavedPhotosAlbum(_shareImageView.image,
                                   nil,
                                   nil,
                                   nil);
}

- (UIImage *)applyAlphaToImage:(UIImage*)image andAlpha:(CGFloat) alpha {
   
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)applyBlurOnImage: (UIImage *)imageToBlur withRadius: (CGFloat)blurRadius {
    CIImage *originalImage = [CIImage imageWithCGImage: imageToBlur.CGImage]; CIFilter *filter = [CIFilter filterWithName: @"CIGaussianBlur" keysAndValues: kCIInputImageKey, originalImage, @"inputRadius", @(blurRadius), nil]; CIImage *outputImage = filter.outputImage; CIContext *context = [CIContext contextWithOptions:nil]; CGImageRef outImage = [context createCGImage: outputImage fromRect: [outputImage extent]]; return [UIImage imageWithCGImage: outImage];
}

-(UIImage*) addLogotoImage:(UIImage*)image
{
    
    UIImage *bottomImage = image;//background image
    UIImage *topImage       = [UIImage imageNamed:@"ndtv.png"]; //foreground image
    
    CGSize newSize = CGSizeMake(bottomImage.size.width, bottomImage.size.height);
    UIGraphicsBeginImageContext( newSize );
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Apply supplied opacity if applicable
    [topImage drawInRect:CGRectMake(0,200,300,70) blendMode:kCGBlendModeNormal alpha:1.0];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
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
