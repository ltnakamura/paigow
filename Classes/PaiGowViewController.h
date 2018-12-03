//
//  PaiGowViewController.h
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hand.h"


@interface PaiGowViewController : UIViewController {
	IBOutlet UIView *pickerView;
	UIView *origView;
	IBOutlet UIButton* drawTiles;
    IBOutlet UIButton* chooseTiles;
    IBOutlet UIButton* chooseDone;
    IBOutlet UILabel*  chosenTileLabel;
	IBOutlet UIButton* checkHands;
	IBOutlet UIButton* checkHands2;
	IBOutlet UIButton* checkHands3;
	IBOutlet UILabel*  pairValues;
	IBOutlet UIButton* commitButton;
	IBOutlet UIButton* resetButton;
	IBOutlet UIButton* dudHouseWayButton;
	
	IBOutlet UIView *mainView;
	IBOutlet UIView *flipView;
    IBOutlet UIView *chooseView;
    
    bool isChoosing;
	
	Hand *upperHand;
	Hand *lowerHand;
	
	int numClicked;
	int topLeftPos, topRightPos, bottomLeftPos, bottomRightPos;

	NSMutableArray *drawnTiles;
    NSMutableArray *allTilesInOrder;
	UIImageView *selectedImage;
    IBOutlet UIView *guideImage;

	CGPoint startPoint;
	int selectedPos;
	float yOrig;
	float xOrig0;
	float xWidth;
	bool tileClicked[4];
	Hand *AB, *AC, *AD, *BC, *BD, *CD;
	int highestLow, highestHigh;
	Hand *highestLowHand, *highestHighHand;
	Hand *lowHouseHand, *highHouseHand;
    UIImageView *tile1Image, *tile2Image, *tile3Image, *tile4Image;
    int touchedTag;
}

@property(nonatomic, retain) UILabel* pairValues;
@property(nonatomic, retain) NSMutableArray* drawnTiles;

@property (nonatomic, retain) UIView *pickerView;
@property (nonatomic, retain) UIImageView *selectedImage;
@property (nonatomic, retain) UIView *guideImage;
@property (nonatomic, retain) Hand *upperHand;
@property (nonatomic, retain) Hand *lowerHand;
@property (nonatomic, retain) UIView *flipView;
@property (nonatomic, retain) UIView *mainView;
@property (nonatomic, retain) UIView *chooseView;
@property (nonatomic, retain) UIButton *commitButton;
@property (nonatomic, retain) UIButton *resetButton;
@property (nonatomic, retain) UIButton *dudHouseWayButton;
@property (nonatomic, retain) UIButton *drawTiles;
@property (nonatomic, retain) UIButton *chooseTiles;
@property (nonatomic, retain) UIButton *chooseDone;
@property (nonatomic, retain) UILabel *chosenTileLabel;

@property (nonatomic, assign) int selectedPos;


-(IBAction) onDrawTilesClick;
-(IBAction) onChooseTilesClick;
-(IBAction) onChooseDone;
-(IBAction) onChooseAndSplitDone;
-(IBAction) onChooseReset;
-(IBAction) onPractice;
-(IBAction) onHelpInfo;
-(IBAction) onBack;
-(IBAction) onCommit;
-(IBAction) onReset;
-(void) clearAllSubviews;
-(void) showDealOrig;
-(NSString*) getHandsDisplayFor:(Hand*) first And: (Hand*) second;

@end

