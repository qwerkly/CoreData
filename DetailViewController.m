//
//  DetailViewController.m
//  CoreData
//
//  Created by Ivan Babich on 27.05.15.
//  Copyright (c) 2015 Ivan Babich. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!self.isNew) {
        self.textField.text = self.value;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    CoreData * core = [CoreData new];
    [core saveData:@"Person" Value:textField.text For_Key:@"name"];
    
    return YES;
}

@end
