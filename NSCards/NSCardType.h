//
//  NSCardType.h
//  NSCards
//
//  Created by Nicholas Barnard on 3/6/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSCard;

typedef enum cardType {
    method = 0,
    object = 1,
    property = 2
} cardType;

@interface NSCardType : NSManagedObject

@property (nonatomic, retain) NSString * cardClassInheritsFrom;
@property (nonatomic, retain) NSString * cardClassName;
@property (nonatomic, retain) NSString * cardDescription;
@property (nonatomic) cardType cardType;
@property (nonatomic, retain) NSSet * cardInstances;
@end

@interface NSCardType (CoreDataGeneratedAccessors)

- (void)addCardInstancesObject:(NSCard *)value;
- (void)removeCardInstancesObject:(NSCard *)value;
- (void)addCardInstances:(NSSet *)values;
- (void)removeCardInstances:(NSSet *)values;

@end
