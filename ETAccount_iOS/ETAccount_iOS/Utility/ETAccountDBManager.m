//
//  ETAccountDBManager.m
//  ETAccount_iOS
//
//  Created by 기용 이 on 2015. 10. 18..
//  Copyright © 2015년 Eten. All rights reserved.
//

#import "ETAccountDBManager.h"

@implementation ETAccountDBManager

+ (NSInteger)getLastIdFromTable:(NSString *)table
{
    NSString *querryString = @"SELECT Tag_target.id FROM Tag_target ORDER BY tag_target.id DESC LIMIT 1";
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:_DB];
    FMDatabase *db = [FMDatabase databaseWithPath:documentPath];
    [db open];
    
    FMResultSet *rs = [db executeQuery:querryString];
    NSInteger lastId = 0;
    
    while ([rs next]) {
        lastId = [[rs stringForColumn:@"id"] integerValue];
    }
    [db close];
    
    return lastId;
}

+ (NSString *)getItem:(NSString *)itemName OfId:(NSInteger)itemIdx FromTable:(NSString *)table
{
    //현재는 전체 로드 : 날짜순 조건 추가, 동적 로딩 추가
    
    NSString *querryString = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE id = %ld",itemName, table, (long)itemIdx];
    NSArray *columnArray = [NSArray arrayWithObjects:itemName, nil];
    
    return [[[ETUtility selectDataWithQuerry:querryString FromFile:_DB WithColumn:columnArray] objectAtIndex:0] objectForKey:itemName];
}

+ (BOOL)insertToTable:(NSString *)table dataDictionary:(NSDictionary *)dataDic
{
    NSString *querryString = [NSString stringWithFormat:@"INSERT INTO %@ (", table];
    
    NSInteger dataDicCount = [[dataDic allKeys] count];
    
    for (NSInteger index = 0; index < dataDicCount - 1; index++) {
        querryString = [NSString stringWithFormat:@"%@%@, ", querryString, [[dataDic allKeys] objectAtIndex:index]];
    }
    querryString = [NSString stringWithFormat:@"%@%@) VALUES (", querryString, [[dataDic allKeys] objectAtIndex:dataDicCount - 1]];
    
    for (NSInteger index = 0; index < dataDicCount - 1; index++) {
        querryString = [NSString stringWithFormat:@"%@%@, ", querryString, [dataDic objectForKey:[[dataDic allKeys] objectAtIndex:index]]];
    }
    querryString = [NSString stringWithFormat:@"%@%@)", querryString, [dataDic objectForKey:[[dataDic allKeys] objectAtIndex:dataDicCount - 1]]];
    
    return [ETUtility runQuerry:querryString FromFile:_DB];
}

+ (BOOL)updateToTable:(NSString *)table dataDictionary:(NSDictionary *)dataDic ToId:(NSInteger)itemId
{
    NSString *querryString = [NSString stringWithFormat:@"UPDATE %@ SET ", table];
    
    NSInteger dataDicCount = [[dataDic allKeys] count];
    
    for (NSInteger index = 0; index < dataDicCount - 1; index++) {
        querryString = [NSString stringWithFormat:@"%@%@ = %@, ", querryString,
                        [[dataDic allKeys] objectAtIndex:index], [dataDic objectForKey:[[dataDic allKeys] objectAtIndex:index]]];
    }
    querryString = [NSString stringWithFormat:@"%@%@ = %@ ", querryString,
                    [[dataDic allKeys] objectAtIndex:dataDicCount - 1], [dataDic objectForKey:[[dataDic allKeys] objectAtIndex:dataDicCount - 1]]];
    
    querryString = [NSString stringWithFormat:@"%@WHERE id = %ld", querryString, (long)itemId];
    
    return [ETUtility runQuerry:querryString FromFile:_DB];
}

+ (BOOL)deleteFromTable:(NSString *)table OfId:(NSInteger)itemId
{
    NSString *querryString = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id = %ld", table, (long)itemId];
    
    return [ETUtility runQuerry:querryString FromFile:_DB];
}

@end
