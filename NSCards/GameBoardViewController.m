//
//  GameBoardViewController.m
//  NSCards
//
//  Created by Chad D Colby on 3/6/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "GameBoardViewController.h"
#import "QueuesCells.h"
#import "Headers.h"
#import "CardCells.h"

@interface GameBoardViewController ()

@property (strong, nonatomic) AMDraggableBlurView *tempCard;

@end

@implementation GameBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    [self.collectionView registerClass:[QueuesCells class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView registerClass:[CardCells class] forCellWithReuseIdentifier:@"Cell"];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger numberOfSection = 0;
    switch (section) {
        case 0:
            numberOfSection = 5;
            break;
        case 1:
            numberOfSection = 4;
            break;
        case 2:
            numberOfSection = 4;
            break;
        case 3:
            numberOfSection = 6;
            break;
            
        default:
            break;
    }

    return numberOfSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    QueuesCells *queueCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.alpha = 0.5f;
    queueCell.alpha = 0.5f;
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 10.0f;
    queueCell.layer.masksToBounds = YES;
    queueCell.layer.cornerRadius = 10.0f;
    
    
    switch (indexPath.section) {
       case 0:
            cell.backgroundColor = [UIColor blackColor];
            return cell;
            break;
        case 1:
            queueCell.backgroundColor = [UIColor blackColor];
            return queueCell;
        case 2:
            queueCell.backgroundColor = [UIColor whiteColor];
            return queueCell;
        case 3:
            cell.backgroundColor = [UIColor clearColor];
            
            if (indexPath.row < 5) {
            
            [self createCardsAtPoint:cell.frame];
            }
            
            if (indexPath.row == 5) {
            
                UIButton *flipTheCard = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [flipTheCard addTarget:self action:@selector(flipNewCard:) forControlEvents:UIControlEventTouchUpInside];
                flipTheCard.frame = CGRectMake(cell.frame.origin.x + 10, cell.frame.origin.y + 60, 80, 30);
                [flipTheCard setTitle:@"Flip Card" forState:UIControlStateNormal];
                [self.collectionView addSubview:flipTheCard];
                cell.userInteractionEnabled = NO;
                cell.backgroundColor = [UIColor whiteColor];
           }
            return cell;
        default:
            return cell;
            break;
    }
}

- (AMDraggableBlurView *)createCardsAtPoint:(CGRect)placement
{
    AMDraggableBlurView *tempCard = [[AMDraggableBlurView alloc] init];
    [tempCard setDraggable:YES];
    tempCard.userInteractionEnabled = YES;
    tempCard.layer.masksToBounds = YES;
    tempCard.layer.cornerRadius = 10.0f;
    tempCard.frame = placement;
    tempCard.alpha = 0.5f;
   
    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(tempCard.frame.origin.x, tempCard.frame.origin.y, 80, 30)];
//    titleLabel.text = @"NSCards";
   
    [self.view addSubview:tempCard];
//    [tempCard addSubview:titleLabel];
    return tempCard;
}

- (void)flipNewCard:(UIButton *)sender
{
    AMDraggableBlurView *anotherCard = [self createCardsAtPoint:CGRectMake(600, 860, 100, 150)];
    [anotherCard setDraggable:YES];
    anotherCard.userInteractionEnabled = YES;
    anotherCard.layer.masksToBounds = YES;
    anotherCard.layer.cornerRadius = 10.0f;
    anotherCard.alpha = 0.5f;
    [self.view addSubview:anotherCard];
    
    NSLog(@"Pressed");
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize;
    if (indexPath.section == 0 || indexPath.section == 3) {
        itemSize = CGSizeMake(100, 150);
        
    } else {
        itemSize = CGSizeMake(174, 300);
    }
    
    return itemSize;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *dockHeader = nil;
    
    
        if (kind == UICollectionElementKindSectionHeader) {
            Headers *titleHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
            titleHeader.headerLabel.text = @"Your Cards";
            titleHeader.headerLabel.textColor = [UIColor blueColor];

            titleHeader.backgroundColor = [UIColor clearColor];
        
            dockHeader = titleHeader;
        if (indexPath.section == 3) {
        
            UIButton *finishTurnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [finishTurnButton addTarget:self action:@selector(sendMove:) forControlEvents:UIControlEventTouchUpInside];
            finishTurnButton.frame = CGRectMake(titleHeader.frame.origin.x + 50, titleHeader.frame.origin.y, 100, 40);
            [finishTurnButton setTitle:@"Send Move" forState:UIControlStateNormal];
            finishTurnButton.backgroundColor = [UIColor whiteColor];
            finishTurnButton.alpha = 0.4f;

            [self.collectionView addSubview:finishTurnButton];
        }
        
    }
    

    
    return dockHeader;
    
}

- (void)sendMove:(UIButton *)sender
{
    NSLog(@"Move Sent");
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets edges;
    if (section == 0 || section == 3) {
        edges = UIEdgeInsetsMake(20, 10, 10, 10);
    } else if (section == 2) {
        edges = UIEdgeInsetsMake(0, 10, 10, 10);
    }
    else {
        edges = UIEdgeInsetsMake(5, 10, 5, 10);
    }
    return  edges;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize headerSize;
    if (section == 3) {
        headerSize = CGSizeMake(728, 40);
    }
    return headerSize;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath.section == 3) {
        return NO;
    }
    
    return YES;
}

//- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
//    
//    if (indexPath.section == 3) {
//        
//        if (!selectedCell.isSelected) {
//            selectedCell.backgroundColor = [UIColor whiteColor];
//        } else {
//            selectedCell.backgroundColor = [UIColor redColor];
//
//        }
//    }
//}

- (void)snapBackToOrigin
{
    
}


@end
