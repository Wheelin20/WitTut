//
//  ViewController.h
//  WitTut
//
//  Created by Kevin Emigh on 7/16/15.
//  Copyright (c) 2015 Kevin Emigh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Wit/Wit.h>

@interface ViewController : UIViewController <WitDelegate>

-(void)changeBackgroundColor:(NSString*)colorTxt;

@end

