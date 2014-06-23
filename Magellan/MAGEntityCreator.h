//
//  MAGEntityCreator.h
//  Magellan
//
//  Created by Ian Henry on 6/23/14.
//
//

#import <Foundation/Foundation.h>
#import "MAGProvider.h"
#import "MAGMapper.h"

@class NSManagedObjectContext, NSEntityDescription;

@interface MAGEntityCreator : NSObject <MAGProvider>

+ (instancetype)entityProviderWithEntityDescription:(NSEntityDescription *)entityDescription
                             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@property (nonatomic, strong, readonly) NSEntityDescription *objectClass;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@end
