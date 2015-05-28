//
//  ViewController.m
//  CoreData
//
//  Created by Ivan Babich on 27.05.15.
//  Copyright (c) 2015 Ivan Babich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray * array_Events;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Метод запускается,когда экран вот-вот загрузится
-(void) viewWillAppear:(BOOL)animated {
    
    CoreData * core = [CoreData new];

    self.array_Events = [core getData:@"Person" Key:@"name"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array_Events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * idintifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:idintifier];
    cell.textLabel.text = [self.array_Events objectAtIndex:indexPath.row];
    return cell;
}
// Метод реализует нажатие на ячейку
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // По нажатию ячейки будем передвигаться в другой ViewController
    DetailViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    detail.isNew = NO;
    detail.value = [self.array_Events objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)new_Action:(id)sender {
    
    DetailViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    detail.isNew = YES;
    [self.navigationController pushViewController:detail animated:YES];
}
@end
