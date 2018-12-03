//
//  PaiGowAppDelegate.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreenViewController.h"
#import "PaiGowViewController.h"
#import "TilePracticeViewController.h"
#import "TilePickerViewController.h"
#import "HelpAboutViewController.h"
#import "IntroViewController.h"

@interface PaiGowAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIViewController *viewController;
	UIViewController *origViewController;
	PaiGowViewController *pgViewController;
	TilePracticeViewController *tpViewController;
	TilePickerViewController *tprViewController;
	HelpAboutViewController *helpViewController;
	IntroViewController *introViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;
@property (nonatomic, retain) IBOutlet UIViewController *origViewController;
@property (nonatomic, retain) IBOutlet TilePracticeViewController *tpViewController;
@property (nonatomic, retain) IBOutlet PaiGowViewController *pgViewController;
@property (nonatomic, retain) IBOutlet TilePickerViewController *tprViewController;
@property (nonatomic, retain) IBOutlet HelpAboutViewController *helpViewController;
@property (nonatomic, retain) IBOutlet IntroViewController *introViewController;
@end

