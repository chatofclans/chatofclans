//
//  CHForumViewController.m
//  chatofclans
//
//  Created by Brandon Jue on 5/7/13.
//  Copyright (c) 2013 Brandon Jue. All rights reserved.
//

#import "CHForumViewController.h"
#import "CHThreadViewController.h"

@interface CHForumViewController ()

@end

@implementation CHForumViewController
@synthesize forum = _forum;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
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
	return [[_forum objectForKey:@"messages"] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
	if (!cell) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
	}
	
	NSArray *item = [[_forum objectForKey:@"messages"] objectAtIndex:indexPath.row];
	cell.textLabel.text = [item objectAtIndex:0];

	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	NSArray *item = [[_forum objectForKey:@"messages"] objectAtIndex:indexPath.row];
	CHThreadViewController *vc = [[CHThreadViewController alloc]init];
	vc.messages = [NSMutableArray arrayWithArray:item];
	[self.navigationController pushViewController:vc animated:YES];
}

@end
