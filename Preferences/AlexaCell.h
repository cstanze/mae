#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>

@interface AlexaCell : PSTableCell
@end

@interface AlexaSwitchCell : PSSwitchTableCell
@end

@interface UITableViewCell (AlexandraCells)
-(void)_setBackgroundInset:(UIEdgeInsets)arg1;
@end
