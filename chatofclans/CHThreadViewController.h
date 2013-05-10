//
//  CHThreadViewController.h
//  chatofclans
//
//  Created by Brandon Jue on 5/7/13.
//  Copyright (c) 2013 Brandon Jue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHThreadViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSMutableArray *_messages;
}

@property (nonatomic, strong) NSMutableArray *messages;

@end
