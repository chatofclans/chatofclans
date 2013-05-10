//
//  CHThreadViewController.m
//  chatofclans
//
//  Created by Brandon Jue on 5/7/13.
//  Copyright (c) 2013 Brandon Jue. All rights reserved.
//

#import "CHThreadViewController.h"

@interface CHThreadViewController ()

@end

@implementation CHThreadViewController
@synthesize messages = _messages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-20-44) style:UITableViewStylePlain];
	table.delegate = self;
	table.dataSource = self;
	[self.view addSubview:table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_messages count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
	if (!cell) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
	}
	
	NSString *item = [_messages objectAtIndex:indexPath.row];
	cell.textLabel.text = item;
	
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}

@end
