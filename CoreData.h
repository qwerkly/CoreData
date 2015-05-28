//
//  CoreData.h
//  CoreData
//
//  Created by Ivan Babich on 27.05.15.
//  Copyright (c) 2015 Ivan Babich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface CoreData : NSObject

-(void) saveData: (NSString *) entety_Name Value: (NSString *) name For_Key: (NSString *) key;
-(NSArray *) getData: (NSString *) entityName Key: (NSString *) key;
-(void) save_NSData: (NSString *) entityName Value: (NSData *) dataValue Key: (NSString *) key;
-(NSData *) getNSData: (NSString *) entityName Key: (NSString *) key;

@end
