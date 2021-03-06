//
//  ETAccountAddStatisticTableViewCell.m
//  ETAccount_iOS
//
//  Created by 기용 이 on 2015. 12. 6..
//  Copyright © 2015년 Eten. All rights reserved.
//

#import "ETAccountAddStatisticTableViewCell.h"

@implementation ETAccountAddStatisticTableViewCell

@synthesize cellSection;
@synthesize addDealCellDelegate;

#pragma mark - Date Picker

- (void)setDatePicker:(UIDatePickerMode)datePickerMode WithCurrentTime:(BOOL)isCurrentTime DatePickerIndex:(NSInteger)index DateString:(NSString *)dateString
{
    datePicker = [[UIDatePicker alloc] init];
    [datePicker setDatePickerMode:datePickerMode];
    if (isCurrentTime) {
        NSDate *todayDate = [NSDate date];
        NSString *todayDateString = [ETFormatter dateStringForDeal:todayDate];
        todayDateString = [NSString stringWithFormat:@"%@ 00:00", [todayDateString substringToIndex:10]];
        
        [datePicker setDate:[ETFormatter dateFromDateSting:todayDateString]];
    }
    else {
        if (![dateString isEqualToString:@"~"]) {
            [datePicker setDate:[ETFormatter dateFromDateSting:dateString]];
        }
        else {
            //날짜 설정 안한 경우
            [titleTextField setText:dateString];
        }
    }
    
    datePickerIndex = index;
    
    UIToolbar* datePickerToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, DEVICE_SIZE.width, 50)];
    [datePickerToolbar setBarStyle:UIBarStyleBlackOpaque];
    [datePickerToolbar setItems:[NSArray arrayWithObjects:
                                 [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelDatePicker)],
                                 [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                 [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(acceptDatepicker)],
                                 nil]];
    [datePickerToolbar sizeToFit];
    
    [titleTextField setInputAccessoryView:datePickerToolbar];
    [titleTextField setInputView:datePicker];
    
    if (![dateString isEqualToString:@"~"])
        [titleTextField setText:[NSString stringWithFormat:@"%@", [ETFormatter dateStringForDeal:[datePicker date]]]];
//    NSLog(@"asdf : %@", [titleTextField text]);
    [addDealCellDelegate didEndEditText:[titleTextField text] CellIndex:10 + datePickerIndex];
}

- (void)cancelDatePicker
{
    [titleTextField resignFirstResponder];
}

- (void)acceptDatepicker
{
    NSString *todayDateString = [NSString stringWithFormat:@"%@ 00:00", [[ETFormatter dateStringForDeal:[datePicker date]] substringToIndex:10]];
    [titleTextField setText:todayDateString];
//    [titleTextField setText:[NSString stringWithFormat:@"%@", [ETFormatter dateStringForDeal:[datePicker date]]]];
    [addDealCellDelegate didEndEditText:[titleTextField text] CellIndex:10 + datePickerIndex];
    
    [self cancelDatePicker];
}


#pragma maek - Accessor Button

- (void)setButtonTag:(STATISTIC_ACCESSOR)tag
{
    [plusMinusButton setTag:tag];
}

- (IBAction)changePlusMinus:(id)sender
{
    [addDealCellDelegate selectAccessor:[sender tag]];
}


#pragma mark - 델리게이트 메서드

#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [addDealCellDelegate didEndEditText:[textField text] CellIndex:cellSection];
}

@end
