//
//  CardsViewController.m
//  Cards
//
//  Created by Armin Kroll on 8/07/13.
//  Copyright (c) 2013 jTribe. All rights reserved.
//

#import "JTCardsViewController.h"
#import "JTCardsLayout.h"

@interface JTCardsViewController ()

@property BOOL showingAll;
@end

@implementation JTCardsViewController

- (id) initWithCards:(NSArray*)cardControllers layout:(JTCardsLayout*)layout bgImage:(UIImage *)bgImage
{
    self = [super init];
    if (self) {
        self.cardControllers =  [NSMutableArray arrayWithArray:cardControllers];
        self.layout = layout;
        self.bgImage = bgImage;
    }
    return self;
}

- (id) initWithCards:(NSArray*)cardControllers bgImage:(UIImage *)bgImage
{
    return [self initWithCards:cardControllers layout:nil bgImage:bgImage];
}

- (id) initWithCards:(NSArray*)cardControllers layout:(JTCardsLayout*)layout
{
    return [self initWithCards:cardControllers layout:layout bgImage:nil];
}

- (id) initWithCards:(NSArray*)cardControllers
{
  return [self initWithCards:cardControllers layout:nil bgImage:nil];
}

// here for debugging purpouses
- (void)updateViewConstraints {
  [super updateViewConstraints];
}

// here for debugging purpouses
- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
}

// here for debugging purpouses
- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
}

- (void) loadView
{
  self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    if (_bgImage) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        [imageView setImage:_bgImage];
        [self.view addSubview:imageView];
    }
  // make sure we are using our own layout mechanism and now autolayout of subviews.
  // This is important. Strange layout effects will happen if we use autolayout for the card views.
  // If a card controller was created in IB then the size set in there should be the size we use here as the cards shows.
  self.view.autoresizesSubviews = NO;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  for (UIViewController *controller in self.cardControllers)
  {
    [controller willMoveToParentViewController:self];
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
  }
  
}

- (void) viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  NSMutableArray *views = [NSMutableArray array];
  for (UIViewController *controller in self.childViewControllers) {
    [views addObject:controller.view];
  }
  // create the default layout only if no layout was set during intialisation.
  if (!self.layout) {
    self.layout = [[JTCardsLayout alloc] initWithControllers:self.cardControllers containerView:self.view];
  }
  else {
    // the layout was already set so just add the views and container view to it.
    if (!self.layout.delegates || !self.layout.views)
    [self.layout setupWithControllers:self.cardControllers containerView:self.view];
  }
  
  [self.layout layoutAllAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
