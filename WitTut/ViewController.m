//
//  ViewController.m
//  WitTut
//
//  Created by Kevin Emigh on 7/16/15.
//  Copyright (c) 2015 Kevin Emigh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UILabel *intentLabel;
UILabel *colorLabel;
UILabel *textLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // set the WitDelegate object
    [Wit sharedInstance].delegate = self;
    
    // create the button
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat w = 100;
    CGRect rect = CGRectMake(screen.size.width/2 - w/2, 60, w, 100);
    
    WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
    [self.view addSubview:witButton];
    
    // create the label
    intentLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 200, screen.size.width, 50)];
    intentLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:intentLabel];
    
    colorLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 230, screen.size.width, 50)];
    colorLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:colorLabel];
    
    textLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 170, screen.size.width, 50)];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)witDidGraspIntent:(NSArray *)outcomes messageId:(NSString *)messageId customData:(id) customData error:(NSError*)e
{
    if(e)
    {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        intentLabel.text = [e localizedDescription];
        [self.view addSubview:intentLabel];
        return;
    }
    
    NSDictionary *firstOutcome = [outcomes objectAtIndex:0];
    NSDictionary *entities = [firstOutcome objectForKey:@"entities"];
    NSArray *entityVals = [entities objectForKey:@"colour"];
    NSString *resultColor = [[entityVals objectAtIndex:0] objectForKey:@"value"];
    NSString *intent = [firstOutcome objectForKey:@"intent"];
    NSString *resultText = [firstOutcome objectForKey:@"_text"];
    
    textLabel.text = resultText;
    intentLabel.text = [NSString stringWithFormat:@"intent = %@", intent];
    colorLabel.text = [NSString stringWithFormat:@"color = %@", resultColor];
    
    [self changeBackgroundColor:resultColor];
    
    [self.view addSubview: textLabel];
    [self.view addSubview:intentLabel];
    [self.view addSubview:colorLabel];
}

- (void)changeBackgroundColor:(NSString *)colorTxt
{
    if([[colorTxt lowercaseString] isEqualToString:@"red"] || [[colorTxt lowercaseString] isEqualToString:@"read"])
    {
        self.view.backgroundColor = [UIColor redColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"green"])
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"gray"] || [[colorTxt lowercaseString] isEqualToString:@"grey"])
    {
        self.view.backgroundColor = [UIColor grayColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"blue"])
    {
        self.view.backgroundColor = [UIColor blueColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"yellow"])
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"purple"])
    {
        self.view.backgroundColor = [UIColor purpleColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"brown"])
    {
        self.view.backgroundColor = [UIColor brownColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"green"])
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"black"])
    {
        self.view.backgroundColor = [UIColor blackColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"white"])
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"cyan"])
    {
        self.view.backgroundColor = [UIColor cyanColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"magenta"])
    {
        self.view.backgroundColor = [UIColor magentaColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"orange"])
    {
        self.view.backgroundColor = [UIColor orangeColor];
    }
    else if([[colorTxt lowercaseString] isEqualToString:@"pink"])
    {
        self.view.backgroundColor = [UIColor colorWithRed: 1.0 green:0.5 blue:0.5 alpha:1.0];
    }
}

@end
