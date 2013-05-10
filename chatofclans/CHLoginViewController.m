//
//  CHLoginViewController.m
//  chatofclans
//
//  Created by Brandon Jue on 5/7/13.
//  Copyright (c) 2013 Brandon Jue. All rights reserved.
//

#import "CHLoginViewController.h"
#import "CHProfileViewController.h"

@interface CHLoginViewController ()

@end

@implementation CHLoginViewController

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
	
	UITextField *email = [[UITextField alloc]init];
	email.frame = CGRectMake(0, 0, 160, 30);
	email.center = CGPointMake(self.view.center.x, self.view.center.y - 80);
	email.backgroundColor = [UIColor whiteColor];
	email.borderStyle = UITextBorderStyleBezel;
	email.placeholder = @"email";
	[self.view addSubview:email];
	
	UITextField *pass = [[UITextField alloc]init];
	pass.frame = CGRectMake(0, 0, 160, 30);
	pass.center = CGPointMake(self.view.center.x, self.view.center.y - 50);
	pass.backgroundColor = [UIColor whiteColor];
	pass.borderStyle = UITextBorderStyleBezel;
	pass.placeholder = @"password";
	[self.view addSubview:pass];
	
	UIButton *login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	login.frame = CGRectMake(0, 0, 80, 40);
	login.center = self.view.center;
	[login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:login];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)login {
	// for now just send them to the next scene
	CHProfileViewController *vc = [[CHProfileViewController alloc]init];
	[self.navigationController pushViewController:vc animated:YES];
}

@end
