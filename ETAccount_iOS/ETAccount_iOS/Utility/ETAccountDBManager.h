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

+ (NSString *)getItem:(NSString *)itemName OfId:(NSInteger)itemIdx FromTable:(NSString *)table;

@end