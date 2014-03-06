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

@interface GameBoardViewController ()

@end

@implementation GameBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    [self.collectionView registerClass:[QueuesCells class] forCellWithReuseIdentifier:@"Cell"];

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
            numberOfSection = 5;
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
    cell.alpha = 0.6f;
    queueCell.alpha = 0.6f;

    
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
            cell.backgroundColor = [UIColor whiteColor];
            return cell;
        default:
            return cell;
            break;
    }
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
        
        titleHeader.headerLabel.text = @"Player Dock";

        titleHeader.backgroundColor = [UIColor whiteColor];
        
        dockHeader = titleHeader;
        dockHeader.alpha = 0.5f;
    }
    

    
    return dockHeader;
    
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

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    if (!selectedCell.isSelected) {
        selectedCell.backgroundColor = [UIColor whiteColor];
    } else {
        selectedCell.backgroundColor = [UIColor redColor];

    }
}




@end
