//
//  ETAccountAddTableViewCell.h
//  ETAccount_iOS
//
//  Created by 기용 이 on 2015. 9. 20..
//  Copyright (c) 2015년 Eten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ETUtility.h"
#import "ETFormatter.h"
#import "Constants.h"

@protocol ETAccountAddDealCellDelegate;

@interface ETAccountAddTableViewCell : UITableViewCell <UITextFieldDelegate> {
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextField *titleTextField;
    IBOutlet UIButton *plusMinusButton;
    
    UIDatePicker *datePicker;
    
    NSInteger datePickerIndex;
}

- (void)initNotification;
- (void)removeNotification;
- (void)setType:(ADD_DEAL_CELL_TYPE)type;
- (void)setTitle:(NSString *)titleString;
- (void)setPlaceholder:(NSString *)placeholderString;
#pragma mark - Date Picker
- (void)setDatePicker:(UIDatePickerMode)datePickerMode WithCurrentTime:(BOOL)isCurrentTime DatePickerIndex:(NSInteger)index DateString:(NSString *)dateString;
#pragma maek - Plus&Minus
- (IBAction)changePlusMinus:(id)sender;

@property (readwrite) NSInteger cellSection;
@property (readonly) IBOutlet UITextField *titleTextField;
@property (readwrite) UIButton *plusMinusButton;

@property (assign, readwrite) id<ETAccountAddDealCellDelegate> addDealCellDelegate;

@end


@protocol ETAccountAddDealCellDelegate <NSObject>

- (void)didEndEditText:(NSString *)insertedText CellIndex:(NSInteger)index;
@optional
- (void)selectAccessor:(STATISTIC_ACCESSOR)accessor;

@end


@interface ETAccountAddTableViewDescriptionCell : ETAccountAddTableViewCell;

@end
