//
//  DetailViewController.h
//  CoreData
//
//  Created by Ivan Babich on 27.05.15.
//  Copyright (c) 2015 Ivan Babich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (assign, nonatomic) BOOL isNew;
@property (strong, nonatomic) NSString * value;

@end
