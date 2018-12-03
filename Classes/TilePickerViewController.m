//
//  TilePickerViewController.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 11/5/10.
//  Copyright 2010 ASU. All rights reserved.
//

#import "TilePickerViewController.h"
#import "Deck.h"
#import "PaiGowAppDelegate.h"
#import <QuartzCore/CALayer.h>
#import <QuartzCore/CAGradientLayer.h>


@implementation TilePickerViewController
@synthesize questionTile, drawnTiles, answerStatus, isPairMode, correct, answerExplain;
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

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

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

-(UIImage*) getScaledImage:(UIImage *) sourceImage scaleBy:(float) fraction {
	
	UIImage *newImage = nil;
	
	CGSize imageSize = sourceImage.size;
	
	CGRect thumbnailRect = CGRectZero;
	
	thumbnailRect.size.width  = imageSize.width * (float) fraction;
	thumbnailRect.size.height = imageSize.height * (float) fraction;
	UIGraphicsBeginImageContext(CGSizeMake(thumbnailRect.size.width, thumbnailRect.size.height));
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
	
}

- (void)dealloc {
    [super dealloc];
}

//

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"-- I AM TOUCHED End --");
	// get touch event
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint touchLocation = [touch locationInView:self.view];		
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.6];
	float xmid = 150; // work on 4
	
	
	for (UIView* aSubview in self.view.subviews) {
		if(![aSubview isKindOfClass:[UIImageView class]] || questionAnswerPos == -1 ||touchLocation.y <= yOrig) continue;
		CGRect labelFrame; 
		UILabel* nameLabel;
		int answered = 2;
		CGRect frame = [aSubview frame];
		
		if(isPairMode) { 
			xmid = 155;
			if (touchLocation.x < xmid) {
				answered = 1;
			} else {
				answered = 2;
			}
			// t1
			labelFrame = CGRectMake(xOrig0+5, frame.origin.y + frame.size.height + 10, 45, 30);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
			//nameLabel.text =[NSString stringWithFormat:@"%@\nRank:%d", questionHand1.tileOne.shortName,  questionHand1.tileOne.position];
            nameLabel.text =[NSString stringWithFormat:@"%@ \nRank: %d\nDots: %d", questionHand1.tileOne.shortName, questionHand1.tileOne.position, questionHand1.tileOne.numberDots];
			nameLabel.textAlignment = NSTextAlignmentCenter;
			nameLabel.numberOfLines = 3;
			if([questionHand1 getHighTile] == questionHand1.tileOne) {
				nameLabel.font = [UIFont boldSystemFontOfSize: 9.0];
			} else {
				nameLabel.font = [UIFont systemFontOfSize: 9.0];
			}
			nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [nameLabel sizeToFit];
			nameLabel.backgroundColor = [UIColor clearColor]; 	
			
			[self.view addSubview:nameLabel];
			
			//t2
			labelFrame = CGRectMake(xOrig0+xWidth, frame.origin.y + frame.size.height + 10, 45, 30);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
            nameLabel.text =[NSString stringWithFormat:@"%@ \nRank: %d\nDots: %d", questionHand1.tileTwo.shortName, questionHand1.tileTwo.position, questionHand1.tileTwo.numberDots];
			nameLabel.textAlignment = NSTextAlignmentCenter;
			nameLabel.numberOfLines = 3;
			if([questionHand1 getHighTile] == questionHand1.tileTwo) {
				nameLabel.font = [UIFont boldSystemFontOfSize: 9.0];
			} else {
				nameLabel.font = [UIFont systemFontOfSize: 9.0];
			}
            [nameLabel sizeToFit];
			nameLabel.lineBreakMode = NSLineBreakByWordWrapping;						
			nameLabel.backgroundColor = [UIColor clearColor]; 
			[self.view addSubview:nameLabel];
			
			//t3
			labelFrame = CGRectMake(xOrig0+2*xWidth+60, frame.origin.y + frame.size.height + 10, 45, 30);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
			//nameLabel.text =[NSString stringWithFormat:@"%@\nRank:%d", questionHand2.tileOne.shortName,  questionHand2.tileOne.position];
            nameLabel.text =[NSString stringWithFormat:@"%@ \nRank: %d\nDots: %d", questionHand2.tileOne.shortName, questionHand2.tileOne.position, questionHand2.tileOne.numberDots];
			nameLabel.textAlignment = NSTextAlignmentCenter;
			nameLabel.numberOfLines = 3;
			if([questionHand2 getHighTile] == questionHand2.tileOne) {
				nameLabel.font = [UIFont boldSystemFontOfSize: 9.0];
			} else {
				nameLabel.font = [UIFont systemFontOfSize: 9.0];
			}
            [nameLabel sizeToFit];
            nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
			nameLabel.backgroundColor = [UIColor clearColor];
			[self.view addSubview:nameLabel];
			 
			
			//t4
			labelFrame = CGRectMake(xOrig0+2*xWidth+115, frame.origin.y + frame.size.height + 10, 45, 30);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
			//nameLabel.text =[NSString stringWithFormat:@"%@\nRank:%d", questionHand2.tileTwo.shortName,  questionHand2.tileTwo.position];
            nameLabel.text =[NSString stringWithFormat:@"%@ \nRank: %d\nDots: %d", questionHand2.tileTwo.shortName, questionHand2.tileTwo.position, questionHand2.tileTwo.numberDots];
			nameLabel.textAlignment = NSTextAlignmentCenter;
			nameLabel.numberOfLines = 3;
			if([questionHand2 getHighTile] == questionHand2.tileTwo) {
				nameLabel.font = [UIFont boldSystemFontOfSize: 9.0];
			} else {
				nameLabel.font = [UIFont systemFontOfSize: 9.0];
			}			nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [nameLabel sizeToFit];
			nameLabel.backgroundColor = [UIColor clearColor]; 
			[self.view addSubview:nameLabel];
			
			
			// h1
			labelFrame = CGRectMake(xOrig0-5, frame.origin.y + frame.size.height + 35, 125, 30);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
			nameLabel.text =[NSString stringWithFormat:@"%@", [questionHand1 getHandDisplay]];
			nameLabel.textAlignment = NSTextAlignmentCenter;
			nameLabel.font = [UIFont systemFontOfSize: 14.0];
			nameLabel.backgroundColor = [UIColor clearColor]; 
			nameLabel.textColor = [UIColor yellowColor];
			[self.view addSubview:nameLabel];
			
			//h2
			labelFrame = CGRectMake(xOrig0+ 2*xWidth + 50, frame.origin.y + frame.size.height + 35, 125, 30);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
			nameLabel.text =[NSString stringWithFormat:@"%@", [questionHand2 getHandDisplay]];
			nameLabel.textAlignment = NSTextAlignmentCenter;
			
			nameLabel.font = [UIFont systemFontOfSize: 14.0];
			nameLabel.textColor = [UIColor yellowColor];									
			nameLabel.backgroundColor = [UIColor clearColor];
			[self.view addSubview:nameLabel];
			NSString* signSymbol = @"=";
			if(questionAnswerPos == 1) {
				signSymbol = @">";
			} else if(questionAnswerPos == 2) {
				signSymbol = @"<";				
			}
			if(questionAnswerPos == 3) {
				answerStatus.text = @"Both hands are equal (banker wins)";
			} else	if(answered == questionAnswerPos) {
				answerStatus.text = @"Correct ";
			} else {
				answerStatus.text = @"Incorrect ";
			}
			
			// h1
			labelFrame = CGRectMake(xmid - 5, frame.origin.y + frame.size.height/2, 15, 25);
			nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
			nameLabel.text = signSymbol;
			nameLabel.textAlignment = NSTextAlignmentCenter;
			nameLabel.font = [UIFont systemFontOfSize: 20.0];
			nameLabel.backgroundColor = [UIColor clearColor]; 
			[self.view addSubview:nameLabel];
			

			// Move the images by rank
			for (UIView* aSubview2 in self.view.subviews) {
				CGRect frame2 = [aSubview2 frame];
				if([aSubview2 isKindOfClass:[UIImageView class]]) {
					// pair positions
					if( frame2.origin.x < xmid && questionAnswerPos == 1) {
						frame2.origin.y -= 15;
						[aSubview2 setFrame:frame2];
					} else if (frame2.origin.x > xmid && questionAnswerPos == 2) {
						frame2.origin.y -= 15;
						[aSubview2 setFrame:frame2];
					}
				}
			}
			questionAnswerPos = -1;
			nextQuestion.hidden = false;
			break;
			
		} else {
			if([aSubview pointInside: [self.view convertPoint:touchLocation toView:aSubview] withEvent:event]) {
				
				if(aSubview.frame.origin.x < xmid) {
					answered = 1;
				} 
				
				labelFrame = CGRectMake(xOrig0+5, frame.origin.y + frame.size.height + 20, 55, 50);
				nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
				nameLabel.text =[NSString stringWithFormat:@"%@ \nRank: %d\nDots: %d", questionDomino1.shortName, questionDomino1.position, questionDomino1.numberDots];
				nameLabel.textAlignment = NSTextAlignmentCenter;
				nameLabel.numberOfLines = 3;
				nameLabel.textColor = [UIColor yellowColor];
				nameLabel.font = [UIFont systemFontOfSize:11.0];
				nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
				nameLabel.backgroundColor = [UIColor clearColor]; // [UIColor brownColor];
				
				[self.view addSubview:nameLabel];
				
				labelFrame = CGRectMake(xOrig0+xWidth+5, frame.origin.y + frame.size.height + 20, 55, 50);
				nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
				nameLabel.text =[NSString stringWithFormat:@"%@ \nRank: %d\nDots: %d", questionDomino2.shortName, questionDomino2.position, questionDomino2.numberDots];
				nameLabel.textAlignment = NSTextAlignmentCenter;
				nameLabel.numberOfLines = 3;
				nameLabel.textColor = [UIColor yellowColor];				
				nameLabel.font = [UIFont systemFontOfSize: 11.0];
				nameLabel.lineBreakMode = NSLineBreakByWordWrapping;						
				nameLabel.backgroundColor = [UIColor clearColor]; // [UIColor brownColor];
				
				[self.view addSubview:nameLabel];
				
				if(answered == questionAnswerPos) {
					answerStatus.text = @"Correct ";
					
					frame.origin.y -= 15;
					[aSubview setFrame:frame];
					
				} else {
					answerStatus.text = @"Incorrect ";
					CGRect frame = [aSubview frame];
					
					frame.origin.y += 15;
					[aSubview setFrame:frame];
				}
				
				if(questionDomino2.position == 1 || questionDomino1.position == 1) {
					answerStatus.text = @"Note: GeeJoon Tile (Supreme) is actually considered lower as a tie-breaker even though the pair rank is 1";
				}
				
				[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:aSubview cache:YES];
				
				questionAnswerPos = -1;
				nextQuestion.hidden = false;
				
				break;			
				
			}
			
		}
	}
	[UIView commitAnimations];
}

-(IBAction) onBack {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"HomeScreen"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}

-(void) showDealOrig {
	yOrig = 225.0;
	xOrig0 = 85.0;
	xWidth = 90.0;
	
	if(!isPairMode) {
		for (int i = 0; i < 2; i++) {
			
			Domino* drawnTile = (Domino *) [drawnTiles objectAtIndex:i];
			NSString *tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
			UIImage* image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.18f ];
			UIImageView *tileImage = [[UIImageView alloc] initWithImage:image];
			
			CGRect frame = [tileImage frame];
			frame.origin.x = xOrig0 + i*xWidth + 5;
			frame.origin.y = -100;
			frame.size.height = image.size.height + 3;
			frame.size.width = image.size.width + 3;
			[tileImage setFrame:frame];
			
			[self.view addSubview:tileImage];
			
		}
		
	} else {
		
		yOrig = 225.0;
		xOrig0 = 30.0;
		
		for (int i = 0; i < 4; i++) {
			
			Domino* drawnTile = (Domino *) [drawnTiles objectAtIndex:i];
			NSString *tileImageFileName = [drawnTile.name stringByAppendingString:@".png"];
			UIImage* image = [self getScaledImage:[UIImage imageNamed:tileImageFileName] scaleBy:0.18f ];
			UIImageView *tileImage = [[UIImageView alloc] initWithImage:image];
            xWidth = image.size.width;
			CGRect frame = [tileImage frame];
			
			frame.origin.x = xOrig0 + i*xWidth + 5;
            if(i == 1 || i == 3)  frame.origin.x += 5;
			if(i > 1) frame.origin.x += 50;
			frame.origin.y = -100;
			frame.size.height = image.size.height + 3;
			frame.size.width = image.size.width + 3;

            [tileImage setFrame:frame];
			[self.view addSubview:tileImage];
		}
	}
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration: 0.6];
	for (NSObject *aSubview in self.view.subviews) {
		UIImageView* tileImage = (UIImageView*) aSubview;
		
		CGRect frame = [tileImage frame];
		if(frame.size.height > 80) {
			//frame.origin.x = xOrig0 + count*xWidth + 2;
			frame.origin.y = yOrig + 2;
			//count++;
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:tileImage cache:YES];
			[tileImage setFrame:frame];
		}
	}	
	[UIView commitAnimations];	
}

-(IBAction) onNewQuestionClick {
	[self clearAllSubviews];
	//NSLog([NSString stringWithFormat:@"ispos %d ", isPositionMode]);
	
	Deck * d = [[Deck alloc] init];
	//[d printDeck];
	[d shuffle];
	if (isPairMode) {
		drawnTiles = (NSMutableArray *)[d dealWith:4];
	} else {
		drawnTiles = (NSMutableArray *)[d dealUniqueValueWith:2];
	}
	[self showDealOrig];
	[d release];
	
	if(!isPairMode) {
		questionDomino1 = (Domino*) [drawnTiles objectAtIndex:0];
		questionDomino2 = (Domino *) [drawnTiles objectAtIndex:1];
		if(questionDomino1.position == 1) {
			questionAnswerPos = 2;
		} else if(questionDomino2.position == 1) {
			questionAnswerPos = 2;			
		} else {
			questionAnswerPos = (questionDomino1.position < questionDomino2.position)?1:2;		
		}

		questionTile.text = [NSString stringWithFormat:@"Which Individual Tile is higher?"] ;
        answerStatus.text = @"";
	} else {
		questionHand1 = [[Hand alloc] initWithTileOne:[drawnTiles objectAtIndex:0] tileTwo:[drawnTiles objectAtIndex:1]]; 
		questionHand2 = [[Hand alloc] initWithTileOne:[drawnTiles objectAtIndex:2] tileTwo:[drawnTiles objectAtIndex:3]]; 
		NSComparisonResult handsCompare = [questionHand1 compareHand:questionHand2];
		if(handsCompare == NSOrderedSame) {
			questionAnswerPos = 3;
		} else if (handsCompare == NSOrderedAscending) {
			questionAnswerPos = 1;
		} else {
			questionAnswerPos = 2;			
		}
		questionTile.text = [NSString stringWithFormat:@"Which Hand (2 Tile Combination) is higher?"] ;
	}
	nextQuestion.hidden = true;
	
}

- (void) clearAllSubviews {
	for (UIView *view in [self.view subviews]) {
		if([view isKindOfClass: [UILabel class]] && view.frame.origin.y > 250) {
			[view removeFromSuperview];
		}
		
		if([view isKindOfClass: [UIImageView class]] && view.frame.size.height > 55) {
			UIImageView *img = (UIImageView*) view;
			//NSLog([NSString stringWithFormat:@"removing image height %d" ,view.frame.size.height]); 
			if(img.frame.size.height > 80.00)
				[view removeFromSuperview];
		}
	}
	nextQuestion.hidden = false;
	questionTile.text = @"Press New Set to start training";
	answerExplain.text = @"";
	
}


@end
