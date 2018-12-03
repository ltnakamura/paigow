//
//  IntroViewController.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/28/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IntroViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>{
	IBOutlet UIScrollView *myScrollView; // main view
	IBOutlet UIScrollView *myScrollView2; // rules
    IBOutlet UIScrollView *myScrollView3; // cheatsheet
    IBOutlet UITableView  *tableView;  // cheatsheettable


    IBOutlet UIScrollView *mainIntroScrollView; // main view
	IBOutlet UIPageControl *pageControl;
	IBOutlet UIButton *homeButton;
	IBOutlet UIButton *infoButton;
    IBOutlet UIButton *nextupButton;
    IBOutlet UINavigationController* navBar;
    IBOutlet UISegmentedControl* segmentBar;
    
    IBOutlet UITableViewCell* tileCell1;
    IBOutlet UITableViewCell* tileCell2;
    IBOutlet UITableViewCell* tileCell3;
    IBOutlet UITableViewCell* tileCell4;
    IBOutlet UITableViewCell* tileCell5;
    IBOutlet UITableViewCell* tileCell6;
    IBOutlet UITableViewCell* tileCell7;
    IBOutlet UITableViewCell* tileCell8;
    IBOutlet UITableViewCell* tileCell9;
    IBOutlet UITableViewCell* tileCell10;
    IBOutlet UITableViewCell* tileCell11;
    IBOutlet UITableViewCell* tileCell12;
    IBOutlet UITableViewCell* tileCell13;
    IBOutlet UITableViewCell* tileCell14;
    IBOutlet UITableViewCell* tileCell15;
    IBOutlet UITableViewCell* tileCell16;
    IBOutlet UIWebView *webView;
	bool isInfo;
}

@property (nonatomic, retain) UIScrollView 	*myScrollView;
@property (nonatomic, retain) UIScrollView 	*myScrollView2;
@property (nonatomic, retain) UIScrollView 	*myScrollView3;
@property (nonatomic, retain) UIScrollView 	*mainIntroScrollView;
@property (nonatomic, retain) UITableView   *tableView;
// static list
@property (strong, retain) UITableViewCell* tileCell1;
@property (strong, retain) UITableViewCell* tileCell2;
@property (strong, retain) UITableViewCell* tileCell3;
@property (strong, retain) UITableViewCell* tileCell4;
@property (strong, retain) UITableViewCell* tileCell5;
@property (strong, retain) UITableViewCell* tileCell6;
@property (strong, retain) UITableViewCell* tileCell7;
@property (strong, retain) UITableViewCell* tileCell8;
@property (strong, retain) UITableViewCell* tileCell9;
@property (strong, retain) UITableViewCell* tileCell10;
@property (strong, retain) UITableViewCell* tileCell11;
@property (strong, retain) UITableViewCell* tileCell12;
@property (strong, retain) UITableViewCell* tileCell13;
@property (strong, retain) UITableViewCell* tileCell14;
@property (strong, retain) UITableViewCell* tileCell15;
@property (strong, retain) UITableViewCell* tileCell16;

@property (nonatomic, retain) UINavigationController 	*navBar;
@property (nonatomic, retain) UISegmentedControl 		*segmentBar;

@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) UIButton 		*homeButton;
@property (nonatomic, retain) UIButton 		*infoButton;
@property (nonatomic, retain) UIButton 		*nextupButton;
@property (nonatomic, retain) UIWebView 	*webView;

-(IBAction) onHelpAbout; // go to the tiles
-(IBAction) onInfo; // show Info
-(IBAction) onBack ;
@end
