//
//  ETAccountDBManager.h
//  ETAccount_iOS
//
//  Created by 기용 이 on 2015. 10. 18..
//  Copyright © 2015년 Eten. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ETUtility.h"

@interface ETAccountDBManager : NSObject

+ (NSInteger)getLast:(NSString *)key FromTable:(NSString *)table;
+ (NSMutableArray *)getAllItems:(NSArray *)columnArray FromTable:(NSString *)table;
+ (NSMutableArray *)getItems:(NSArray *)columnArray Object:(NSString *)object ForKey:(NSString *)key FromTable:(NSString *)table;
+ (NSString *)getItem:(NSString *)itemName OfId:(NSInteger)itemIdx FromTable:(NSString *)table;
+ (NSString *)getItem:(NSString *)itemName OfId:(NSInteger)itemIdx Key:(NSString *)key FromTable:(NSString *)table;
+ (BOOL)insertToTable:(NSString *)table dataDictionary:(NSDictionary *)dataDic;
+ (BOOL)updateToTable:(NSString *)table dataDictionary:(NSDictionary *)dataDic ToId:(NSInteger)dealId;
+ (BOOL)deleteFromTable:(NSString *)table OfId:(NSInteger)itemId;
+ (BOOL)deleteFromTable:(NSString *)table OfId:(NSInteger)itemId Key:(NSString *)key;

@end
