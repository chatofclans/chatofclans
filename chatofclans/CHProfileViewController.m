//
//  CHProfileViewController.m
//  chatofclans
//
//  Created by Brandon Jue on 5/7/13.
//  Copyright (c) 2013 Brandon Jue. All rights reserved.
//

#import "CHProfileViewController.h"
#import "CHForumViewController.h"

@interface CHProfileViewController ()

@end

@implementation CHProfileViewController

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
	
	UILabel *name = [[UILabel alloc]init];
	name.frame = CGRectMake(0, 0, 320, 20);
	name.text = @"YOUR NAME";
	name.textAlignment = NSTextAlignmentCenter;
	name.textColor = [UIColor redColor];
	[self.view addSubview:name];
	
	UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, self.view.frame.size.height-20-44-20) style:UITableViewStylePlain];
	table.delegate = self;
	table.dataSource = self;
	[self.view addSubview:table];
	
	_names = [[NSMutableArray alloc]initWithObjects:
			  [NSDictionary dictionaryWithObjectsAndKeys:
			   @"Clash of Clans",@"game",
			   @"bjued",@"username",
			   [NSArray arrayWithObjects:
				[NSArray arrayWithObjects:
				 @"Hello World",
				 @"Bye World",nil],
				[NSArray arrayWithObjects:
				 @"2nd topic",
				 @"stuff",nil],nil],@"messages",nil],
			  [NSDictionary dictionaryWithObjectsAndKeys:
			   @"Path of Exile",@"game",
			   @"jujube",@"username",
			   [NSArray arrayWithObjects:
				[NSArray arrayWithObjects:
				 @"Test Test",
				 @"1 2 3 4",
				 @"third message",nil],
				[NSArray arrayWithObjects:
				 @"help",nil],nil],@"messages",nil],nil];
	
	[table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_names count] + 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
	if (!cell) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
	}
	if (indexPath.row==0) {
		cell.textLabel.text = @"Add a Game:Username pair";
		cell.detailTextLabel.text = @"";
	}
	else {
		NSDictionary *item = [_names objectAtIndex:indexPath.row-1];
		cell.textLabel.text = [item objectForKey:@"game"];
		cell.detailTextLabel.text = [item objectForKey:@"username"];
	}
	
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (indexPath.row==0) {
		// do the add flow
	}
	else {
		NSDictionary *item = [_names objectAtIndex:indexPath.row-1];
		CHForumViewController *vc = [[CHForumViewController alloc]init];
		vc.forum = [NSMutableDictionary dictionaryWithDictionary:item];
		[self.navigationController pushViewController:vc animated:YES];
	}
}

@end
