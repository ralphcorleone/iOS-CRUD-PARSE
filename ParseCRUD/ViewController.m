//
//  ViewController.m
//  Parse
//
//  Created by Ralph on 19/02/18.
//  Copyright © 2018 R4lph. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController (){
    NSMutableArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self read:0];
}

-(IBAction)clear:(id)sender{
    for(UIView *t in self.view.subviews){
        if([t isKindOfClass:[UITextField class]]){
            ((UITextField*)t).text = @"";
        }
    }
}

-(BOOL)checkFieldsForAction:(NSInteger)action{
    switch (action) {
        case 1:
            return (self._id.text.length>0 && _name.text.length>0 && _lastName.text.length>0 && _age.text.length>0);
            break;
        default:
            return (_name.text.length>0 && _lastName.text.length>0 && _age.text.length>0);
            break;
    }
    return true;
}

-(IBAction)create:(id)sender{
    if([self checkFieldsForAction:0]){
        PFObject *obj = [PFObject objectWithClassName:@"Test"];
        obj[@"name"] = _name.text;
        obj[@"lastname"] = _lastName.text;
        obj[@"age"] = _age.text;
        [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            [self read:0];
        }];
    }else{
        NSLog(@"Rellena los campos");
    }
}

-(IBAction)read:(id)sender{
    PFQuery *query = [PFQuery queryWithClassName:@"Test"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error){
            data = [[NSMutableArray alloc] initWithArray:objects];
            [self.tableView reloadData];
        }
    }];
}


-(IBAction)update:(id)sender{
    if([self checkFieldsForAction:1]){
        PFObject *obj = [PFObject objectWithoutDataWithClassName:@"Test" objectId:self._id.text];
        obj[@"name"] = _name.text;
        obj[@"lastname"] = _lastName.text;
        obj[@"age"] = _age.text;
        [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            [self read:0];
        }];
    }else{
        NSLog(@"Seleciona el usuario & rellena los campos");
    }
}

-(IBAction)delete:(id)sender{
    if([self checkFieldsForAction:1]){
        PFObject *obj = [PFObject objectWithoutDataWithClassName:@"Test" objectId:self._id.text];
        obj[@"name"] = _name.text;
        obj[@"lastname"] = _lastName.text;
        obj[@"age"] = _age.text;
        [obj deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            [self read:0];
        }];
    }else{
        NSLog(@"Seleciona el usuario & rellena los campos");
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", [data[indexPath.row] objectForKey:@"name"], [data[indexPath.row] objectForKey:@"lastname"]];
    cell.textLabel.text = fullName;
    cell.detailTextLabel.text = [data[indexPath.row] objectForKey:@"age"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self putInFields:indexPath.row];
}

-(void)putInFields:(NSInteger)row{
    PFObject *object = data[row];
    self._id.text = object.objectId;
    self.name.text = object[@"name"];
    self.lastName.text = object[@"lastname"];
    self.age.text = object[@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
