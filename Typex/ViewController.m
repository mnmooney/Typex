//
//  ViewController.m
//  Typex V2
//
//  Created by Michael Mooney on 30/05/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
NSInteger MusicInt;
BOOL ComingFromHome;
@interface ViewController () <AVAudioPlayerDelegate>
{
    IBOutlet UIButton *Four, *Three, *Two;
    IBOutlet UIImageView *BgOne, *BgTwo;
    IBOutlet UILabel *T, *Y, *P, *E, *X;
    IBOutlet UIButton *Settings;
    IBOutlet UIButton *Close;
    
    //Current Games
    IBOutlet UILabel *CGHeader, *CGTotal, *CGInGames, *CGReset;
    IBOutlet UIButton *CGStartOver;
    
    //Panning
    IBOutlet UISlider *PSSlider;
    IBOutlet UILabel *PSValue, *PSSaveLabel, *PSHeader;
    IBOutlet UIButton *PSSave;
    
    //Soundeffects
    IBOutlet UILabel *SEHeader;
    IBOutlet UIButton *SEChanger;
}
@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        [self GetDevice];
    }
    
    
    Two.alpha = 0;
    Three.alpha = 0;
    Four.alpha = 0;
    T.alpha = 0;
    Y.alpha = 0;
    P.alpha = 0;
    E.alpha = 0;
    X.alpha = 0;
    Close.alpha = 0;
    Settings.alpha = 0;
    
    PSSlider.alpha = 0;
    PSValue.alpha = 0;
    PSSaveLabel.alpha = 0;
    PSHeader.alpha = 0;
    PSSave.alpha = 0;
    
    CGHeader.alpha = 0;
    CGTotal.alpha = 0;
    CGInGames.alpha = 0;
    CGReset.alpha =0;
    CGStartOver.alpha = 0;
    
    SEHeader.alpha = 0;
    SEChanger.alpha = 0;
    
    Close.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    PSSlider.transform = CGAffineTransformMakeScale(0.001, 0.001);
    PSValue.transform = CGAffineTransformMakeScale(0.001, 0.001);
    PSSaveLabel.transform = CGAffineTransformMakeScale(0.001, 0.001);
    PSHeader.transform = CGAffineTransformMakeScale(0.001, 0.001);
    PSSave.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    CGHeader.transform = CGAffineTransformMakeScale(0.001, 0.001);
    CGTotal.transform = CGAffineTransformMakeScale(0.001, 0.001);
    CGInGames.transform = CGAffineTransformMakeScale(0.001, 0.001);
    CGReset.transform = CGAffineTransformMakeScale(0.001, 0.001);
    CGStartOver.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    SEHeader.transform = CGAffineTransformMakeScale(0.001, 0.001);
    SEChanger.transform = CGAffineTransformMakeScale(0.001, 0.001);
    NSInteger p = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    if (p == 0) {
        p = 20;
        [[NSUserDefaults standardUserDefaults] setInteger:p forKey:@"PSValue"];
    }
    
    PSSlider.maximumValue = 30;
    PSSlider.minimumValue = 10;
    PSSlider.value = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    int svalue = PSSlider.value;
    PSValue.text = [NSString stringWithFormat:@"Sensitivity: %i",svalue];
    
    [self performSelector:@selector(ComingIn) withObject:nil afterDelay:0.01];
    [self GmaesInProg];
    [self TotalGamesPlayed];
    ComingFromHome = YES;
    [[NSUserDefaults standardUserDefaults] setBool:ComingFromHome forKey:@"IsItComingInFromHomeScreen"];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        T = [[UILabel alloc] initWithFrame:CGRectMake(19, 144, 42, 47)];
        Y = [[UILabel alloc] initWithFrame:CGRectMake(79, 144, 42, 50)];
        P = [[UILabel alloc] initWithFrame:CGRectMake(139, 144, 42, 50)];
        E = [[UILabel alloc] initWithFrame:CGRectMake(199, 144, 42, 50)];
        X = [[UILabel alloc] initWithFrame:CGRectMake(259, 144, 42, 50)];
        
        T.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        Y.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        P.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        E.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        X.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        
        Two = [[UIButton alloc] initWithFrame:CGRectMake(63, 262, 90, 90)];
        Three = [[UIButton alloc] initWithFrame:CGRectMake(168, 262, 90, 90)];
        Four = [[UIButton alloc] initWithFrame:CGRectMake(115, 322, 90, 90)];
        
        Settings = [[UIButton alloc] initWithFrame:CGRectMake(146, 20, 40, 40)];
        
        BgOne = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BgTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        CGHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 20, 288, 45)];
        CGTotal = [[UILabel alloc] initWithFrame:CGRectMake(16, 67, 257, 49)];
        CGInGames = [[UILabel alloc] initWithFrame:CGRectMake(16, 106, 257, 49)];
        CGReset = [[UILabel alloc] initWithFrame:CGRectMake(16, 154, 178, 49)];
        CGStartOver = [[UIButton alloc] initWithFrame:CGRectMake(202, 159, 40, 40)];
        
        PSHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 211, 288, 45)];
        PSSaveLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 331, 178, 49)];
        PSSave = [[UIButton alloc] initWithFrame:CGRectMake(202, 334, 40, 40)];
        PSValue = [[UILabel alloc] initWithFrame:CGRectMake(16, 274, 257, 49)];
        PSSlider = [[UISlider alloc] initWithFrame:CGRectMake(16, 250, 114, 30)];
        Close = [[UIButton alloc] initWithFrame:CGRectMake(250, 20, 60, 60)];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        T = [[UILabel alloc] initWithFrame:CGRectMake(19, 196, 42, 47)];
        Y = [[UILabel alloc] initWithFrame:CGRectMake(79, 196, 42, 50)];
        P = [[UILabel alloc] initWithFrame:CGRectMake(139, 196, 42, 50)];
        E = [[UILabel alloc] initWithFrame:CGRectMake(199, 196, 42, 50)];
        X = [[UILabel alloc] initWithFrame:CGRectMake(259, 196, 42, 50)];
        
        T.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        Y.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        P.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        E.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        X.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
        
        Two = [[UIButton alloc] initWithFrame:CGRectMake(44, 323, 100, 100)];
        Three = [[UIButton alloc] initWithFrame:CGRectMake(178, 323, 100, 100)];
        Four = [[UIButton alloc] initWithFrame:CGRectMake(110, 380, 100, 100)];
        
        Settings = [[UIButton alloc] initWithFrame:CGRectMake(146, 20, 40, 40)];
        
        BgOne = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BgTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        CGHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 20, 288, 45)];
        CGTotal = [[UILabel alloc] initWithFrame:CGRectMake(16, 82, 257, 49)];
        CGInGames = [[UILabel alloc] initWithFrame:CGRectMake(16, 139, 257, 49)];
        CGReset = [[UILabel alloc] initWithFrame:CGRectMake(16, 190, 178, 49)];
        CGStartOver = [[UIButton alloc] initWithFrame:CGRectMake(202, 201, 40, 40)];
        
        PSHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 261, 288, 45)];
        PSSaveLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 403, 178, 49)];
        PSSave = [[UIButton alloc] initWithFrame:CGRectMake(202, 408, 40, 40)];
        PSValue = [[UILabel alloc] initWithFrame:CGRectMake(16, 346, 257, 49)];
        PSSlider = [[UISlider alloc] initWithFrame:CGRectMake(16, 301, 114, 30)];
        Close = [[UIButton alloc] initWithFrame:CGRectMake(250, 20, 60, 60)];
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        T = [[UILabel alloc] initWithFrame:CGRectMake(24, 232, 58, 73)];
        Y = [[UILabel alloc] initWithFrame:CGRectMake(94, 232, 58, 73)];
        P = [[UILabel alloc] initWithFrame:CGRectMake(161, 232, 58, 73)];
        E = [[UILabel alloc] initWithFrame:CGRectMake(227, 232, 58, 73)];
        X = [[UILabel alloc] initWithFrame:CGRectMake(293, 232, 58, 73)];
        
        T.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
        Y.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
        P.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
        E.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
        X.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
        
        Two = [[UIButton alloc] initWithFrame:CGRectMake(36, 383, 120, 120)];
        Three = [[UIButton alloc] initWithFrame:CGRectMake(209, 383, 120, 120)];
        Four = [[UIButton alloc] initWithFrame:CGRectMake(125, 457, 120, 120)];
        
        Settings = [[UIButton alloc] initWithFrame:CGRectMake(165, 20, 45, 45)];
        
        BgOne = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BgTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        CGHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 20, 288, 45)];
        CGTotal = [[UILabel alloc] initWithFrame:CGRectMake(16, 82, 257, 49)];
        CGInGames = [[UILabel alloc] initWithFrame:CGRectMake(16, 139, 257, 49)];
        CGReset = [[UILabel alloc] initWithFrame:CGRectMake(16, 190, 178, 49)];
        CGStartOver = [[UIButton alloc] initWithFrame:CGRectMake(202, 201, 40, 40)];
        
        PSHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 261, 288, 45)];
        PSSaveLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 403, 178, 49)];
        PSSave = [[UIButton alloc] initWithFrame:CGRectMake(202, 408, 40, 40)];
        PSValue = [[UILabel alloc] initWithFrame:CGRectMake(16, 346, 257, 49)];
        PSSlider = [[UISlider alloc] initWithFrame:CGRectMake(16, 301, 114, 30)];
        Close = [[UIButton alloc] initWithFrame:CGRectMake(321, 20, 60, 60)];
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        PSSlider.userInteractionEnabled = YES;
        [PSSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        T = [[UILabel alloc] initWithFrame:CGRectMake(1, 253, 74, 100)];
        Y = [[UILabel alloc] initWithFrame:CGRectMake(83, 233, 74, 140)];
        P = [[UILabel alloc] initWithFrame:CGRectMake(171, 233, 74, 140)];
        E = [[UILabel alloc] initWithFrame:CGRectMake(258, 233, 74, 140)];
        X = [[UILabel alloc] initWithFrame:CGRectMake(340, 233, 74, 140)];
        
        T.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:100];
        Y.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:100];
        P.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:100];
        E.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:100];
        X.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:100];
        
        Two = [[UIButton alloc] initWithFrame:CGRectMake(55, 430, 130, 130)];
        Three = [[UIButton alloc] initWithFrame:CGRectMake(230, 430, 130, 130)];
        Four = [[UIButton alloc] initWithFrame:CGRectMake(143, 525, 130, 130)];
        
        Settings = [[UIButton alloc] initWithFrame:CGRectMake(180, 20, 50, 50)];
        
        BgOne = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BgTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        Close = [[UIButton alloc] initWithFrame:CGRectMake(340, 20, 60, 60)];
        
        CGHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 20, 288, 45)];
        CGTotal = [[UILabel alloc] initWithFrame:CGRectMake(16, 82, 257, 49)];
        CGInGames = [[UILabel alloc] initWithFrame:CGRectMake(16, 139, 257, 49)];
        CGReset = [[UILabel alloc] initWithFrame:CGRectMake(16, 190, 178, 49)];
        CGStartOver = [[UIButton alloc] initWithFrame:CGRectMake(202, 201, 40, 40)];
        
        PSHeader = [[UILabel alloc] initWithFrame:CGRectMake(16, 261, 288, 45)];
        PSSaveLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 403, 178, 49)];
        PSSave = [[UIButton alloc] initWithFrame:CGRectMake(202, 408, 40, 40)];
        PSValue = [[UILabel alloc] initWithFrame:CGRectMake(16, 346, 257, 49)];
        PSSlider = [[UISlider alloc] initWithFrame:CGRectMake(16, 301, 114, 30)];

    }
    [Close setTitle:@"X" forState:UIControlStateNormal];
    [Close addTarget:self action:@selector(Close:) forControlEvents:UIControlEventTouchUpInside];
    [Two setImage:[UIImage imageNamed:@"PlayTwo.png"] forState:UIControlStateNormal];
    [Two addTarget:self action:@selector(Two:) forControlEvents:UIControlEventTouchUpInside];
    
    [Three setImage:[UIImage imageNamed:@"PlayThree.png"] forState:UIControlStateNormal];
    [Three addTarget:self action:@selector(Three:) forControlEvents:UIControlEventTouchUpInside];
    
    [Four setImage:[UIImage imageNamed:@"PlayFour.png"] forState:UIControlStateNormal];
    [Four addTarget:self action:@selector(Four:) forControlEvents:UIControlEventTouchUpInside];
    
    [Settings setImage:[UIImage imageNamed:@"Settings.png"] forState:UIControlStateNormal];
    [Settings addTarget:self action:@selector(Settings:) forControlEvents:UIControlEventTouchUpInside];
    [Close setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    BgOne.image = [UIImage imageNamed:@"BackGroundFour.png"];
    BgTwo.image = [UIImage imageNamed:@"BackGroundOne.png"];
    
    T.text = @"T";
    Y.text = @"Y";
    P.text = @"P";
    E.text = @"E";
    X.text = @"X";
    
    CGHeader.text = @"CURRENT PROGRESS";
    CGReset.text = @"Delete all progress:";
    [CGStartOver setImage:[UIImage imageNamed:@"RemoveP.png"] forState:UIControlStateNormal];
    [CGStartOver addTarget:self action:@selector(ResetCGProg:) forControlEvents:UIControlEventTouchUpInside];
    
    PSHeader.text = @"PANNING SENSITIVITY";
    PSSaveLabel.text = @"Save new senitivity:";
    [PSSave setImage:[UIImage imageNamed:@"SaveP.png"] forState:UIControlStateNormal];
    [PSSave addTarget:self action:@selector(SaveSenitivity:) forControlEvents:UIControlEventTouchUpInside];
    
    SEHeader.text = @"SOUND EFFECTS";
    
    [self.view addSubview:BgOne];
    [self.view insertSubview:BgTwo belowSubview:BgOne];
    
    [self.view insertSubview:T aboveSubview:BgOne];
    [self.view insertSubview:Y aboveSubview:BgOne];
    [self.view insertSubview:P aboveSubview:BgOne];
    [self.view insertSubview:E aboveSubview:BgOne];
    [self.view insertSubview:X aboveSubview:BgOne];
    
    [self.view insertSubview:Two aboveSubview:BgOne];
    [self.view insertSubview:Three aboveSubview:BgOne];
    [self.view insertSubview:Four aboveSubview:BgOne];
    
    [self.view insertSubview:Settings aboveSubview:BgOne];
    [self.view insertSubview:Close aboveSubview:BgOne];
    
    [self.view insertSubview:CGHeader aboveSubview:BgOne];
    [self.view insertSubview:CGTotal aboveSubview:BgOne];
    [self.view insertSubview:CGInGames aboveSubview:BgOne];
    [self.view insertSubview:CGReset aboveSubview:BgOne];
    [self.view insertSubview:CGStartOver aboveSubview:BgOne];
    
    [self.view insertSubview:PSSlider aboveSubview:BgOne];
    [self.view insertSubview:PSValue aboveSubview:BgOne];
    [self.view insertSubview:PSSaveLabel aboveSubview:BgOne];
    [self.view insertSubview:PSHeader aboveSubview:BgOne];
    [self.view insertSubview:PSSave aboveSubview:BgOne];
    
    [self.view insertSubview:SEHeader aboveSubview:BgOne];
    [self.view insertSubview:SEChanger aboveSubview:BgOne];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)sliderChanged:(id)sender
{
    int svalue = PSSlider.value;
    PSValue.text = [NSString stringWithFormat:@"Sensitivity: %i",svalue];
}

-(IBAction)SaveSenitivity:(id)sender
{
    NSInteger savedPSValue = PSSlider.value;
    [[NSUserDefaults standardUserDefaults] setInteger:savedPSValue forKey:@"PSValue"];
}

-(IBAction)Settings:(id)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        T.transform = CGAffineTransformMakeScale(0.001, 0.001);
        Y.transform = CGAffineTransformMakeScale(0.001, 0.001);
        P.transform = CGAffineTransformMakeScale(0.001, 0.001);
        E.transform = CGAffineTransformMakeScale(0.001, 0.001);
        X.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        Two.transform = CGAffineTransformMakeScale(0.001, 0.001);
        Three.transform = CGAffineTransformMakeScale(0.001, 0.001);
        Four.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        Settings.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        Close.alpha = 1;
        Close.transform = CGAffineTransformMakeScale(1, 1);
        
        PSSlider.transform = CGAffineTransformMakeScale(1, 1);
        PSValue.transform = CGAffineTransformMakeScale(1, 1);
        PSSaveLabel.transform = CGAffineTransformMakeScale(1, 1);
        PSHeader.transform = CGAffineTransformMakeScale(1, 1);
        PSSave.transform = CGAffineTransformMakeScale(1, 1);
        
        CGHeader.transform = CGAffineTransformMakeScale(1, 1);
        CGTotal.transform = CGAffineTransformMakeScale(1, 1);
        CGInGames.transform = CGAffineTransformMakeScale(1, 1);
        CGReset.transform = CGAffineTransformMakeScale(1, 1);
        CGStartOver.transform = CGAffineTransformMakeScale(1, 1);
        
        SEHeader.transform = CGAffineTransformMakeScale(1, 1);
        SEChanger.transform = CGAffineTransformMakeScale(1, 1);
    
        PSSlider.alpha = 1;
        PSValue.alpha = 1;
        PSSaveLabel.alpha = 1;
        PSHeader.alpha = 1;
        PSSave.alpha = 1;
        
        CGHeader.alpha = 1;
        CGTotal.alpha = 1;
        CGInGames.alpha = 1;
        CGReset.alpha =1;
        CGStartOver.alpha = 1;
        
        SEHeader.alpha = 1;
        SEChanger.alpha = 1;
    }];
}

-(void)GmaesInProg
{
    int GameProg = 0;
    
    NSString *str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo1"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo2"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo3"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo4"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo5"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo6"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo7"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo8"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo9"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo10"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo11"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo12"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo13"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo14"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo15"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree1"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree2"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree3"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree4"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree5"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree6"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree7"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree8"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree9"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree1"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree2"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree3"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree4"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree5"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree6"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree7"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree8"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree9"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree10"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree11"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree12"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree13"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree14"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree15"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour1"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour2"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour3"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour4"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour5"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour6"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour7"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour8"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour9"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour10"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour11"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour12"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour13"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour14"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour15"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour1"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour2"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour3"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour4"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour5"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour6"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour7"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour8"];
    if (str.length > 0) {
        GameProg++;
    }
    
    str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour9"];
    if (str.length > 0) {
        GameProg++;
    }
    
    CGInGames.text = [NSString stringWithFormat:@"Current games in progress: %i", GameProg];
}

-(void)TotalGamesPlayed
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    CGTotal.text = [NSString stringWithFormat:@"Total games finished: %li", (long)TotalGames];
}

-(IBAction)ResetCGProg:(id)sender
{
    int z =0;
    [[NSUserDefaults standardUserDefaults] setInteger:z forKey:@"TotalGamesWon"];
    CGTotal.text = [NSString stringWithFormat:@"Total games finished: 0"];
    CGInGames.text = [NSString stringWithFormat:@"Current games in progress: 0"];
    
        NSString *str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo1"];
        str = @"";
        [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo1"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo2"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo2"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo3"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo3"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo4"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo4"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo5"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo5"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo6"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo6"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo7"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo7"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo8"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo8"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo9"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo9"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo10"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo10"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo11"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo11"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo12"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo12"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo13"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo13"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo14"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo14"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo15"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridTwo15"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree1"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree1"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree2"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree2"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree3"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree3"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree4"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree4"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree5"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree5"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree6"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree6"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree7"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree7"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree8"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree8"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree9"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionThree9"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree1"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree1"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree2"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree2"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree3"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree3"];

        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree4"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree4"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree5"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree5"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree6"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree6"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree7"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree7"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree8"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree8"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree9"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree9"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree10"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree10"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree11"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree11"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree12"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree12"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree13"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree13"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree14"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree14"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree15"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SaveTheWordsForGridThree15"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour1"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour1"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour2"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour2"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour3"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour3"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour4"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour4"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour5"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour5"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour6"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour6"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour7"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour7"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour8"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour8"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour9"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour9"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour10"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour10"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour11"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour11"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour12"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour12"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour13"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour13"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour14"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour14"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour15"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheWordForGridFour15"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour1"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour1"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour2"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour2"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour3"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour3"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour4"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour4"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour5"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour5"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour6"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour6"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour7"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour7"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour8"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour8"];
    
        str = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour9"];
    str = @"";
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"SavedTheGridsForQuestionsFour9"];
}

-(IBAction)Info:(id)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        T.transform = CGAffineTransformMakeScale(0.001, 0.001);
        Y.transform = CGAffineTransformMakeScale(0.001, 0.001);
        P.transform = CGAffineTransformMakeScale(0.001, 0.001);
        E.transform = CGAffineTransformMakeScale(0.001, 0.001);
        X.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        Two.transform = CGAffineTransformMakeScale(0.001, 0.001);
        Three.transform = CGAffineTransformMakeScale(0.001, 0.001);
        Four.transform = CGAffineTransformMakeScale(0.001, 0.001);
            Settings.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        Close.alpha = 1;
        Close.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

-(IBAction)Close:(id)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        T.transform = CGAffineTransformMakeScale(1, 1);
        Y.transform = CGAffineTransformMakeScale(1, 1);
        P.transform = CGAffineTransformMakeScale(1, 1);
        E.transform = CGAffineTransformMakeScale(1, 1);
        X.transform = CGAffineTransformMakeScale(1, 1);
        
        Two.transform = CGAffineTransformMakeScale(1, 1);
        Three.transform = CGAffineTransformMakeScale(1, 1);
        Four.transform = CGAffineTransformMakeScale(1, 1);
        
        Settings.transform = CGAffineTransformMakeScale(1, 1);
        
        Close.alpha = 0;
        Close.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        PSSlider.alpha = 0;
        PSValue.alpha = 0;
        PSSaveLabel.alpha = 0;
        PSHeader.alpha = 0;
        PSSave.alpha = 0;
        
        CGHeader.alpha = 0;
        CGTotal.alpha = 0;
        CGInGames.alpha = 0;
        CGReset.alpha =0;
        CGStartOver.alpha = 0;
        
        SEHeader.alpha = 0;
        SEChanger.alpha = 0;
        
        PSSlider.transform = CGAffineTransformMakeScale(0.001, 0.001);
        PSValue.transform = CGAffineTransformMakeScale(0.001, 0.001);
        PSSaveLabel.transform = CGAffineTransformMakeScale(0.001, 0.001);
        PSHeader.transform = CGAffineTransformMakeScale(0.001, 0.001);
        PSSave.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        CGHeader.transform = CGAffineTransformMakeScale(0.001, 0.001);
        CGTotal.transform = CGAffineTransformMakeScale(0.001, 0.001);
        CGInGames.transform = CGAffineTransformMakeScale(0.001, 0.001);
        CGReset.transform = CGAffineTransformMakeScale(0.001, 0.001);
        CGStartOver.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        SEHeader.transform = CGAffineTransformMakeScale(0.001, 0.001);
        SEChanger.transform = CGAffineTransformMakeScale(0.001, 0.001);
       
    }];
}

-(void)ComingIn
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    E.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0.8];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    Y.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1.1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    X.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    P.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1.7];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    T.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:2];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    Two.alpha = 1;
    Three.alpha = 1;
    Four.alpha = 1;
    Settings.alpha = 1;
    [UIView commitAnimations];
}

-(IBAction)Two:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    Four.alpha = 0;
    Three.alpha = 0;
    Two.alpha = 0;
    T.alpha = 0;
    Y.alpha = 0;
    P.alpha = 0;
    E.alpha = 0;
    X.alpha = 0;
    Settings.alpha = 0;
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1 animations:^{
        BgOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BgOne.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(PerformTwo) withObject:nil afterDelay:1];
}

-(IBAction)Three:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    Four.alpha = 0;
    Three.alpha = 0;
    Two.alpha = 0;
    T.alpha = 0;
    Y.alpha = 0;
    P.alpha = 0;
    E.alpha = 0;
    X.alpha = 0;
    Settings.alpha = 0;
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1 animations:^{
        BgOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BgOne.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(PerformThree) withObject:nil afterDelay:1];
}

-(IBAction)Four:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    Four.alpha = 0;
    Three.alpha = 0;
    Two.alpha = 0;
    T.alpha = 0;
    Y.alpha = 0;
    P.alpha = 0;
    Settings.alpha = 0;
    E.alpha = 0;
    X.alpha = 0;
    [UIView commitAnimations];
    
        [UIView animateWithDuration:1 animations:^{
            BgOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
        }
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:2.0 animations:^{
                                 BgOne.alpha = 0;
                             }];
                         }];
    [self performSelector:@selector(PreferomFour) withObject:nil afterDelay:1];
}

-(void)PreferomFour
{
    [self performSegueWithIdentifier:@"FourWords" sender:self];
}

-(void)PerformThree
{
    [self performSegueWithIdentifier:@"UsingThreeWords" sender:self];
}

-(void)PerformTwo
{
    [self performSegueWithIdentifier:@"TwoWords" sender:self];
}

@end