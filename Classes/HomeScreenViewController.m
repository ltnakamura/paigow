//
//  HomeScreenViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/21/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "PaiGowAppDelegate.h"
#import "TilePracticeViewController.h"
#import "TilePickerViewController.h"


@implementation HomeScreenViewController;

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
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void) loadView {
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

- (IBAction) onTrainTiles {

    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrainTilePositionScreen"];
    TilePracticeViewController *tpvc = (TilePracticeViewController*) vc;
    [tpvc setIsPositionMode:FALSE];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction) onTrainTilePosition {

    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrainTilePositionScreen"];
    TilePracticeViewController *tpvc = (TilePracticeViewController*) vc;
    [tpvc setIsPositionMode:TRUE];
    [tpvc clearAllSubviews];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction) onTrainHands {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];

	if(appDelegate.pgViewController == nil) {
		appDelegate.pgViewController = [[PaiGowViewController alloc] initWithNibName:@"PaiGowViewController" bundle:[NSBundle mainBundle]];
	}
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrainHandsScreen"];
    TilePickerViewController *tprVC = (TilePickerViewController*) vc;
    [tprVC setIsPairMode:TRUE];
    [tprVC clearAllSubviews];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction) onTrainTileRanks {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.tprViewController == nil) {
		appDelegate.tprViewController = [[TilePickerViewController alloc] initWithNibName:@"TilePicker" bundle:[NSBundle mainBundle]];
	}
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrainHandsScreen"];
    TilePickerViewController *tprVC = (TilePickerViewController*) vc;
    [tprVC setIsPairMode:FALSE];
    [tprVC clearAllSubviews];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction) onTrainHandRanks {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.tprViewController == nil) {
		appDelegate.tprViewController = [[TilePickerViewController alloc] initWithNibName:@"TilePicker" bundle:[NSBundle mainBundle]];
	}
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrainHandRankScreen"];

    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

// no longer?
- (IBAction) onHelpAbout {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.helpViewController == nil) {
		appDelegate.helpViewController = [[HelpAboutViewController alloc] initWithNibName:@"HelpAbout" bundle:[NSBundle mainBundle]];
//		UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
//		[appDelegate.helpViewController view].backgroundColor = background;
//		[background release];
	}
//	[UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationDuration:1.0];
//	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:appDelegate.window cache:YES];
//	[appDelegate.viewController.view removeFromSuperview];
//	appDelegate.viewController = appDelegate.helpViewController;
//	[appDelegate.window addSubview:[appDelegate.helpViewController view]];
//	[UIView commitAnimations];
}

- (IBAction) onIntro {
	PaiGowAppDelegate *appDelegate = (PaiGowAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.introViewController == nil) {
		appDelegate.introViewController = [[IntroViewController alloc] initWithNibName:@"Intro" bundle:[NSBundle mainBundle]];
	}
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"IntroScreen"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (void) dealloc {
    [super dealloc];
}

@end
