//
//  main.m
//  PaiGow
//
//  Created by Shriniwas Kulkarni on 10/5/10.
//  Copyright ASU 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    //int retVal = UIApplicationMain(argc, argv, nil, nil);
    int retVal = UIApplicationMain(argc, argv, nil, @"PaiGowAppDelegate");
    [pool release];
    return retVal;
}
