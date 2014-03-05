//
//  CardWithImageViewController.m
//  Cards
//
//  Created by Armin Kroll on 14/07/13.
//  Copyright (c) 2013 jTribe. All rights reserved.
//

#import "CardWithImageViewController.h"
#import <UIImage+BlurredFrame/UIImage+BlurredFrame.h>
#import <UIImage+BlurredFrame/UIImage+ImageEffects.h>

@interface CardWithImageViewController ()

@end

@implementation CardWithImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
//    UIImage *topImage = [self.image applyDarkEffectAtFrame:CGRectMake(0, 0, 320, 80)];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
//    [imageView setImage:topImage];
//    [self.view addSubview:imageView];
    
    self.image = [self.image applyLightEffectAtFrame:CGRectMake(0, 80, 320, self.view.frame.size.height-80)];
    
    self.cardImageView.image = self.image;
    self.cardImageView.layer.masksToBounds = YES;
    self.cardImageView.layer.cornerRadius = self.view.frame.size.width/16;
  if (self.headerText) self.headerLabel.text = self.headerText;
  if (self.contentText) self.contentLabel.text = self.contentText;
  
}

-(UIImage *)blurredSnapshot
{
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, self.view.window.screen.scale);
    
    // There he is! The new API method
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    
    // Get the snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Now apply the blur effect using Apple's UIImageEffect category
    UIImage *blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
    
    // Or apply any other effects available in "UIImage+ImageEffects.h"
    // UIImage *blurredSnapshotImage = [snapshotImage applyDarkEffect];
    // UIImage *blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
    
    // Be nice and clean your mess up
    UIGraphicsEndImageContext();
    
    return blurredSnapshotImage;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
