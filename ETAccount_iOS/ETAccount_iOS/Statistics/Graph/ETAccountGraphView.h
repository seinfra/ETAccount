//
//  ETAccountGraphView.h
//  ETAccount_iOS
//
//  Created by 기용 이 on 2015. 11. 24..
//  Copyright © 2015년 Eten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ETFormatter.h"

#import "ETAccountGraphInnerView.h"

@interface ETAccountGraphView : UIView <UIScrollViewDelegate> {
    ETAccountGraphInnerView *innerView;
//    UIView *innerView;
    
    UIScrollView *innerScrollView;
    
    NSArray *dataArray;
    NSString *startDateString, *endDateString;
    
    BOOL basicSet;
    BOOL innerViewSet;
}

+ (ETAccountGraphView *)sharedView;

- (BOOL)setBaseWithFrame:(CGRect)frame;
//- (void)setDataArray:(NSArray *)array;
- (void)initInnerView;
- (void)closeInnerView;

@property (readwrite) ETACCOUNT_GRAPH_TYPE graphType;
@property (readwrite) ETACCOUNT_GRAPH_KIND graphKind;
@property (readwrite, strong) NSMutableArray *globalDataArray;
@property (readwrite, strong) NSMutableArray *globalFullDateArray;
@property (readwrite, strong) NSMutableArray *globalFullDateArrayTillFrom;
//@property (readwrite, strong) NSMutableDictionary *globalDataDictionary;
@property (readwrite) NSString *firstDate, *lastDate;
@property (readwrite) NSInteger biggestCost, smallestCost;

@end
