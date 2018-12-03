//
//  IntroViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/28/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "IntroViewController.h"
#import "PaiGowAppDelegate.h"


@implementation IntroViewController
@synthesize myScrollView, myScrollView2, homeButton, webView, infoButton, pageControl, mainIntroScrollView, myScrollView3,nextupButton, navBar, segmentBar, tableView;

@synthesize tileCell1, tileCell2, tileCell3,tileCell4, tileCell5, tileCell6, tileCell7,tileCell8, tileCell9, tileCell10, tileCell11, tileCell12, tileCell13, tileCell14, tileCell15, tileCell16;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    //mainIntroScrollView.pagingEnabled = YES;
    //mainIntroScrollView.delegate = self;
    //self.mainIntroScrollView.frame = CGRectMake(0, 10, 320,460);
	self.myScrollView.contentSize=CGSizeMake(300,1200);
    [myScrollView setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
    self.myScrollView2.contentSize=CGSizeMake(300,1450);
    [myScrollView setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
    self.myScrollView3.contentSize=CGSizeMake(300,1850);
    self.tableView.rowHeight = 100; // 16 tiles * 100
    self.tableView.frame = CGRectMake(3, 30, self.view.frame.size.width - 6, 1950);
    self.tableView.backgroundColor = [UIColor clearColor];
    //[myScrollView3 addSubview:tableView];
    [myScrollView3 setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
    self.mainIntroScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 4, self.view.bounds.size.height - 10 );
	//self.myScrollView.hidden = false;
	//self.webView.hidden = true;
	//isInfo = false;
	//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"]isDirectory:NO]]];
    
    segmentBar.selectedSegmentIndex = 0;
    [segmentBar addTarget:self
                         action:@selector(segmentChanged:)
               forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: myScrollView];
    [self.view bringSubviewToFront:segmentBar];

}

//Action method executes when user touches the button
-(void) segmentChanged:(id)sender{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    [myScrollView removeFromSuperview];
    [myScrollView2 removeFromSuperview];
    [myScrollView3 removeFromSuperview];
    //[tableView removeFromSuperview];
    switch(segmentedControl.selectedSegmentIndex){
        case 0:
            [myScrollView setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview: myScrollView];
            [self.view bringSubviewToFront:segmentBar];
            break;
        case 1:
            [myScrollView2 setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview: myScrollView3];
            //[self.view addSubview: tableView];
            [self.view bringSubviewToFront:segmentBar];

            break;
        case 2:
            [myScrollView3 setFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview: myScrollView2];
            [self.view bringSubviewToFront:segmentBar];

            break;
    	default:
            [self.view addSubview: myScrollView];
            [self.view bringSubviewToFront:segmentBar];

    }
}

- (void) loadView
{
    [super loadView];
    self.view.frame = [UIScreen mainScreen].bounds;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

// Toggle to info and back
-(IBAction) onInfo {
	if(!isInfo) {
		isInfo = true;
		self.myScrollView.hidden = true;
		self.webView.hidden = false;
		[infoButton setTitle:@"Introduction" forState:UIControlStateNormal];
	} else {
		isInfo = false;
		self.myScrollView.hidden = false;
		self.webView.hidden = true;
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"]isDirectory:NO]]];
		[infoButton setTitle:@"Help & About" forState:UIControlStateNormal];
	}
}

-(IBAction) onBack {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"HomeScreen"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

-(IBAction) onHelpAbout {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.helpViewController == nil) {
		appDelegate.helpViewController = [[HelpAboutViewController alloc] initWithNibName:@"HelpAbout" bundle:[NSBundle mainBundle]];
//		UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
//		[appDelegate.helpViewController view].backgroundColor = background;
//		[background release];
	}
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:appDelegate.window cache:YES];
	[appDelegate.viewController.view removeFromSuperview];
	appDelegate.viewController = appDelegate.helpViewController;
	[appDelegate.window addSubview:[appDelegate.helpViewController view]];
	[UIView commitAnimations];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = scrollView.bounds.size.width;
    NSInteger pageNumber = floor((mainIntroScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = pageNumber;
}



/*
- (void)dealloc {
    [super dealloc];
}
*/


#pragma mark - Table view data source
// Using static
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableViewPassed
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    //return [super numberOfSectionsInTableView:tableViewPassed];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 16;
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 9;
            break;
        case 2:
            return 4;
            break;
        default:
            break;
    }
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

//    switch (section) {
//        case 0:
//            return @"Significant Pair Tiles";
//            break;
//        case 1:
//            return @"Even Tile Pairs";
//            break;
//        case 2:
//            return @"Mixed Pair Tiles (Chops)";
//            break;
//        default:
//            break;
//    }
    return @"Paigow Tile/Pair List (highest to lowest)";

}


- (UITableViewCell *)tableView:(UITableView *)tableViewPassed cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0:
            return tileCell1;
            //break;
        case 1:
            return tileCell2;
            //break;
        case 2:
            return tileCell3;
            //break;
        case 3:
            return tileCell4;
            //break;
        case 4:
            return tileCell5;
            //break;
        case 5:
            return tileCell6;
            //break;
        case 6:
            return tileCell7;
            //break;
        case 7:
            return tileCell8;
            //break;
        case 8:
            return tileCell9;
            //break;
        case 9:
            return tileCell10;
            //break;
        case 10:
            return tileCell11;
            //break;
        case 11:
            return tileCell12;
            //break;
        case 12:
            return tileCell13;
            //break;
        case 13:
            return tileCell14;
            //break;
        case 14:
            return tileCell15;
            //break;
        case 15:
            return tileCell16;
            //break;
        default:
            break;
    }
    
	return tileCell1;
}


@end
