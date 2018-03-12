//
//  ViewController.h
//  Parse
//
//  Created by Ralph on 19/02/18.
//  Copyright © 2018 R4lph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

//TABLE VIEW
@property (nonatomic, retain) IBOutlet UITableView *tableView;

// FIELDS
@property (nonatomic, retain) IBOutlet UITextField *_id;
@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *lastName;
@property (nonatomic, retain) IBOutlet UITextField *age;


@end

