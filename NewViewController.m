//
//  NewViewController.m
//  CoreData
//
//  Created by Ivan Babich on 27.05.15.
//  Copyright (c) 2015 Ivan Babich. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"Smile"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveImage:(id)sender {
    // Из png картинки вернем формат NSData
    NSData * imageData = UIImagePNGRepresentation(self.imageView.image);
        NSDictionary * dict = [[NSDictionary alloc]initWithObjectsAndKeys:@"Ivan",@"name",@"25",@"age",imageData,@"image", nil];
    // Архивируем объект,который передаем в качестве аргумента
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    CoreData * core = [CoreData new];
    [core save_NSData:@"Person" Value:data Key:@"data"];
}
@end
