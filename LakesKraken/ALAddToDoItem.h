//
//  ALAddToDoItem.h
//  
//
//  Created by DetroitLabsUser on 9/8/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ALAddToDoItem : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


-(void)save;
-(void)prepopulate;
@end
