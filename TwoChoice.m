//
//  TwoChoice.m
//  Typex V2
//
//  Created by Michael Mooney on 22/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "TwoChoice.h"
#import <AVFoundation/AVFoundation.h>

NSString *WordWC;

int TheAmountWC;
int replayWC, ScoreWC;
int psOneWC, psTwoWC, psThreeWC, psFourWC;
NSInteger PanningSensitivityWC;
int PreviousWC, PanningIntWC, PPanningMethodWC;

char cOneWC, cTwoWC, cThreeWC, cFourWC;
char wOneWC, wTwoWC;
char kOneWC, kTwoWC, kThreeWC, kFourWC, kFiveWC, kSixWC, kSevenWC, kEightWC, kNineWC, kTenWC, kElevenWC, kTwelveWC, kThirteenWC, kFourteenWC, kFithteenWC, kSixteenWC, kSeventeenWC, kEighteenWC, kNineteenWC, kTwentyWC, kTwentyOneWC, kTwentyTwoWC, kTwentyThreeWC, kTwentyFourWC, kTwentyFiveWC, kTwentySixWC;

float ikOneWC, ikTwoWC, ikThreeWC, ikFourWC;
float iktOneWC, iktTwoWC, iktThreeWC, iktFourWC;
float iLeftWC, iRightWC, iUpWC, iDownWC;
float pointOfIntrestWC;
float xOneWC, yOneWC, xTwoWC, yTwoWC, xThreeWC, yThreeWC, xFourWC, yFourWC;

CGPoint OneWC, TwoWC, ThreeWC, FourWC, distanceWC;
UISwipeGestureRecognizer *PRightWC, *PLeftWC;

BOOL WordIsAlreadyDoneWC[95];

@interface TwoChoice () <AVAudioPlayerDelegate>
{
    
    AVAudioPlayer *SoundOneWC, *SoundTwoWC, *SwipeSoundWC;
    
#pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeWC, *CheckWC;
    IBOutlet UIImageView *BackGroundOneWC, *BackGroundTwoWC, *BackGroundFourWC;
    
#pragma Mark Game - Grids
    IBOutlet UIImageView *pOneWC, *pTwoWC, *pThreeWC, *pFourWC;
    IBOutlet UILabel *TotalAmountWC;
    IBOutlet UIButton *PauseWC;
    IBOutlet UILabel *TheCurrentWordWC;
    IBOutlet UIImageView *PauseDisplayWC, *SenderDisplayWC;
    IBOutlet UIButton *HomeWC, *PlayWC;
    IBOutlet UIImageView *BarUnderWordWC;
    IBOutlet UIImageView *BBSelectionWC;
    IBOutlet UIImageView *TileOneWC, *TileTwoWC, *TileThreeWC, *TileFourWC;
    
#pragma Mark Selection - Fist Page
    IBOutlet UIButton *gOneWC, *gTwoWC;
    IBOutlet UILabel *ErrorMessageWC;
    IBOutlet UIImageView *pSelectionOneWC, *pSelectionTwoWC, *pSelectionThreeWC, *pSelectionFourWC;
    IBOutlet UIButton *StartWC;
    IBOutlet UIScrollView *WordScrollerWC;
    IBOutlet UILabel *CurrentWordsWC;
    
}
@end

@implementation TwoChoice


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        [self GetDevice];
    }

    BackGroundFourWC.alpha = 0;
    
#pragma Mark The Game Items
    
    ScoreWC = 0;
    PauseWC.alpha = 0;
    CheckWC.alpha = 0;
    TotalAmountWC.alpha = 0;
    
    pOneWC.alpha = 0;
    pTwoWC.alpha = 0;
    pThreeWC.alpha = 0;
    CurrentWordsWC.alpha = 0;
    PlayWC.alpha = 0;
    HomeWC.alpha = 0;
    pFourWC.alpha = 0;
    StartWC.alpha = 0;
    BarUnderWordWC.alpha = 0;
    SenderDisplayWC.alpha = 0;
    TheCurrentWordWC.alpha = 0;
    PauseDisplayWC.alpha = 0;
    
#pragma Mark The Selection Page
    
    ErrorMessageWC.alpha = 0;
    pSelectionTwoWC.alpha = 0;
    pSelectionTwoWC.alpha = 0;
    pSelectionThreeWC.alpha = 0;
    pSelectionFourWC.alpha = 0;
    StartWC.alpha = 0;
    
    ikOneWC = pOneWC.center.x;
    iktOneWC = pOneWC.center.y;
    ikTwoWC = pTwoWC.center.x;
    iktTwoWC = pTwoWC.center.y;
    ikThreeWC = pThreeWC.center.x;
    iktThreeWC = pThreeWC.center.y;
    ikFourWC = pFourWC.center.x;
    iktFourWC = pFourWC.center.y;
    
    kOneWC = 'a';
    kTwoWC = 'b';
    kThreeWC = 'c';
    kFourWC = 'd';
    kFiveWC = 'e';
    kSixWC = 'f';
    kSevenWC = 'g';
    kEightWC = 'h';
    kNineWC = 'i';
    kTenWC = 'j';
    kElevenWC = 'k';
    kTwelveWC = 'l';
    kThirteenWC = 'm';
    kFourteenWC = 'n';
    kFithteenWC = 'o';
    kSixteenWC = 'p';
    kSeventeenWC = 'q';
    kEighteenWC = 'r';
    kNineteenWC = 's';
    kTwentyWC = 't';
    kTwentyOneWC = 'u';
    kTwentyTwoWC = 'v';
    kTwentyThreeWC = 'w';
    kTwentyFourWC = 'x';
    kTwentyFiveWC = 'y';
    kTwentySixWC = 'z';

    pOneWC.center = CGPointMake(ikOneWC, iktOneWC);
    pTwoWC.center = CGPointMake(ikTwoWC, iktTwoWC);
    pThreeWC.center = CGPointMake(ikThreeWC, iktThreeWC);
    pFourWC.center = CGPointMake(ikFourWC, iktFourWC);
    
    CGPoint midPoint;
    midPoint.x = ((pSelectionOneWC.center.x + pSelectionTwoWC.center.x)/2);
    midPoint.y = ((pSelectionOneWC.center.y + pSelectionThreeWC.center.y) / 2);
    
    pSelectionOneWC.center = CGPointMake(midPoint.x, midPoint.y);
    pSelectionTwoWC.center = CGPointMake(midPoint.x, midPoint.y);
    pSelectionThreeWC.center = CGPointMake(midPoint.x, midPoint.y);
    pSelectionFourWC.center = CGPointMake(midPoint.x, midPoint.y);
    
    PauseDisplayWC.backgroundColor = [UIColor blackColor];
    
    BOOL HomeFG = NO;
    [[NSUserDefaults standardUserDefaults] setBool:HomeFG forKey:@"IsItComingInFromHomeScreen"];
    
    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneWC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoWC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSoundWC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
    [self performSelector:@selector(Opening) withObject:nil afterDelay:0.1];
    [self SettingUpFuncionForButtons];
}

-(void)Opening
{
    self.view.userInteractionEnabled = YES;
    CABasicAnimation *bounceAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    bounceAnimation.duration = 0.1;
    bounceAnimation.fromValue = [NSNumber numberWithInt:0];
    bounceAnimation.toValue = [NSNumber numberWithInt:10];
    bounceAnimation.repeatCount = 2;
    bounceAnimation.autoreverses = YES;
    bounceAnimation.fillMode = kCAFillModeForwards;
    bounceAnimation.removedOnCompletion = NO;
    bounceAnimation.additive = YES;
    [gOneWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    StartWC.alpha = 1;
    tHomeWC.alpha = 1;
    gOneWC.alpha = 1;
    gTwoWC.alpha = 1;
    BBSelectionWC.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0.5];
    pSelectionOneWC.alpha = 1;
    pSelectionFourWC.alpha = 1;
    pSelectionTwoWC.alpha = 1;
    pSelectionThreeWC.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0.8];
    pSelectionOneWC.center = CGPointMake(ikOneWC, iktOneWC);
    pSelectionTwoWC.center = CGPointMake(ikTwoWC, iktTwoWC);
    pSelectionThreeWC.center = CGPointMake(ikThreeWC, iktThreeWC);
    pSelectionFourWC.center = CGPointMake(ikFourWC, iktFourWC);
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        SenderDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 136, 45)];
        TotalAmountWC = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 131, 38)];
        TotalAmountWC.font = [[TotalAmountWC font] fontWithSize:15];
        PauseWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckWC = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordWC = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordWC = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordWC.font  = [[TheCurrentWordWC font] fontWithSize:15];
        
        BackGroundOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        tHomeWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneWC = [[UIButton alloc] initWithFrame:CGRectMake(114, 434, 40, 40)];
        gTwoWC = [[UIButton alloc] initWithFrame:CGRectMake(167, 434, 40, 40)];
        BBSelectionWC = [[UIImageView alloc] initWithFrame:CGRectMake(110, 430, 48, 48)];
        
        PlayWC = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeWC = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsWC = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsWC.font  = [[CurrentWordsWC font] fontWithSize:20];
        
        StartWC = [[UIButton alloc] initWithFrame:CGRectMake(110, 85, 98, 40)];
        ErrorMessageWC = [[UILabel alloc] initWithFrame:CGRectMake(94, 32, 173, 45)];
        ErrorMessageWC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
        
        pOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(77, 220, 80, 80)];
        pTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(163, 220, 80, 80)];
        pThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(77, 306, 80, 80)];
        pFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(163, 306, 80, 80)];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 155, 50)];
        TotalAmountWC = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 150, 36)];
        TotalAmountWC.font = [[TotalAmountWC font] fontWithSize:20];
        PauseWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckWC = [[UIButton alloc] initWithFrame:CGRectMake(60, 154, 200, 40)];
        BarUnderWordWC = [[UIImageView alloc] initWithFrame:CGRectMake(41, 242, 240, 2)];
        TheCurrentWordWC = [[UILabel alloc] initWithFrame:CGRectMake(117, 215, 87, 28)];
        TheCurrentWordWC.font  = [[TheCurrentWordWC font] fontWithSize:25];
        
        BackGroundOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        PlayWC = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeWC = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsWC = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsWC.font  = [[CurrentWordsWC font] fontWithSize:20];
        
        pOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(63, 265, 90, 90)];
        pTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(167, 265, 90, 90)];
        pThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(63, 369, 90, 90)];
        pFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(167, 369, 90, 90)];
        
        tHomeWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneWC = [[UIButton alloc] initWithFrame:CGRectMake(129, 520, 40, 40)];
        gTwoWC = [[UIButton alloc] initWithFrame:CGRectMake(179, 520, 40, 40)];
        BBSelectionWC = [[UIImageView alloc] initWithFrame:CGRectMake(176, 517, 46, 46)];
        
        ErrorMessageWC = [[UILabel alloc] initWithFrame:CGRectMake(58, 80, 224, 90)];
        ErrorMessageWC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        
        StartWC = [[UIButton alloc] initWithFrame:CGRectMake(104, 180, 100, 50)];
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneWC = [[UIButton alloc] initWithFrame:CGRectMake(134, 602, 45, 45)];
        gTwoWC = [[UIButton alloc] initWithFrame:CGRectMake(192, 602, 45, 45)];
        BBSelectionWC = [[UIImageView alloc] initWithFrame:CGRectMake(131, 599, 51, 51)];
        
        BackGroundOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        PlayWC = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeWC = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsWC = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsWC.font = [[CurrentWordsWC font] fontWithSize:25];
        
        StartWC = [[UIButton alloc] initWithFrame:CGRectMake(128, 209, 119, 56)];
        ErrorMessageWC = [[UILabel alloc] initWithFrame:CGRectMake(82, 133, 225, 68)];
        ErrorMessageWC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        
        BarUnderWordWC = [[UIImageView alloc] initWithFrame:CGRectMake(67, 315, 240, 2)];
        TheCurrentWordWC = [[UILabel alloc] initWithFrame:CGRectMake(123, 282, 128, 35)];
        CheckWC = [[UIButton alloc] initWithFrame:CGRectMake(82, 202, 210, 45)];
        SenderDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 182, 50)];
        TotalAmountWC = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 176, 42)];
        PauseWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWordWC.font  = [[TheCurrentWordWC font] fontWithSize:25];
        TotalAmountWC.font = [[TotalAmountWC font] fontWithSize:22];
        
        pOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(72, 325, 110, 110)];
        pTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(192, 325, 110, 110)];
        pThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(72, 445, 110, 110)];
        pFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(192, 445, 110, 110)];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneWC = [[UIButton alloc] initWithFrame:CGRectMake(156, 671, 45, 45)];
        gTwoWC = [[UIButton alloc] initWithFrame:CGRectMake(214, 671, 45, 45)];
        BBSelectionWC = [[UIImageView alloc] initWithFrame:CGRectMake(211, 668, 51, 51)];
        
        PlayWC = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeWC = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsWC = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsWC.font = [[CurrentWordsWC font] fontWithSize:25];
        
        BarUnderWordWC = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordWC = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckWC = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayWC = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmountWC = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        PauseWC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWordWC.font  = [[TheCurrentWordWC font] fontWithSize:25];
        TotalAmountWC.font = [[TotalAmountWC font] fontWithSize:25];
        
        StartWC = [[UIButton alloc] initWithFrame:CGRectMake(147, 255, 120, 56)];
        ErrorMessageWC = [[UILabel alloc] initWithFrame:CGRectMake(16, 166, 382, 81)];
        ErrorMessageWC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
        
        pOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(92, 375, 110, 110)];
        pTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(212, 375, 110, 110)];
        pThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(92, 495, 110, 110)];
        pFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(212, 495, 110, 110)];
    }
    
    pSelectionOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x, pOneWC.center.y, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
    pSelectionTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x, pOneWC.center.y, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
    pSelectionFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x, pOneWC.center.y, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
    pSelectionThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x, pOneWC.center.y, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
    
    [self.view addSubview:BackGroundOneWC];
    
    BarUnderWordWC.backgroundColor = [UIColor blackColor];
    TheCurrentWordWC.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordWC.textColor = [UIColor whiteColor];
    CheckWC.adjustsImageWhenHighlighted = NO;
    tHomeWC.adjustsImageWhenHighlighted = NO;
    tHomeWC.showsTouchWhenHighlighted = YES;
    gOneWC.showsTouchWhenHighlighted = YES;
    gTwoWC.showsTouchWhenHighlighted = YES;
    gOneWC.adjustsImageWhenHighlighted = NO;
    gTwoWC.adjustsImageWhenHighlighted = NO;
    BBSelectionWC.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeWC setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [gOneWC setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoWC setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckWC setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckWC addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseWC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHomeWC addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [PauseWC addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseWC.adjustsImageWhenHighlighted = NO;
    SenderDisplayWC.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountWC.textColor = [UIColor whiteColor];
    TotalAmountWC.textAlignment = NSTextAlignmentCenter;
    ErrorMessageWC.textAlignment = NSTextAlignmentCenter;
    StartWC.adjustsImageWhenDisabled = NO;
    ErrorMessageWC.numberOfLines =  4;
    ErrorMessageWC.text = @"You have not given a box a value (Just tap on it)";
    [StartWC setImage:[UIImage imageNamed:@"Start.png"] forState:UIControlStateNormal];
    [StartWC addTarget:self action:@selector(Start:) forControlEvents:UIControlEventTouchUpInside];
    ErrorMessageWC.textColor = [UIColor blackColor];
    [gOneWC addTarget:self action:@selector(gOne:) forControlEvents:UIControlEventTouchUpInside];
    BackGroundTwoWC.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundOneWC.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourWC.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [self.view insertSubview:BackGroundTwoWC belowSubview:BackGroundOneWC];
    [self.view insertSubview:SenderDisplayWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:TotalAmountWC aboveSubview:SenderDisplayWC];
    [self.view insertSubview:PauseWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:CheckWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:BarUnderWordWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:TheCurrentWordWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:tHomeWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:gOneWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:gTwoWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:BBSelectionWC aboveSubview:BackGroundOneWC];
    
    [self.view insertSubview:pOneWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:pTwoWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:pThreeWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:pFourWC aboveSubview:BackGroundOneWC];
    
    [PlayWC setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeWC setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayWC addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeWC addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayWC.showsTouchWhenHighlighted = YES;
    HomeWC.showsTouchWhenHighlighted = YES;
    PlayWC.adjustsImageWhenHighlighted = NO;
    HomeWC.adjustsImageWhenHighlighted = NO;
    CurrentWordsWC.text = @"CURRENT WORDS";
    CurrentWordsWC.textColor = [UIColor whiteColor];
    CurrentWordsWC.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view insertSubview:pSelectionOneWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:pSelectionTwoWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:pSelectionThreeWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:pSelectionFourWC aboveSubview:BackGroundOneWC];
    
    pSelectionOneWC.image = [UIImage imageNamed:@"Blank.png"];
    pSelectionTwoWC.image = [UIImage imageNamed:@"Blank.png"];
    pSelectionThreeWC.image = [UIImage imageNamed:@"Blank.png"];
    pSelectionFourWC.image = [UIImage imageNamed:@"Blank.png"];
    
    [self.view insertSubview:PauseDisplayWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:HomeWC aboveSubview:PauseDisplayWC];
    [self.view insertSubview:PlayWC aboveSubview:PauseDisplayWC];
    [self.view insertSubview:CurrentWordsWC aboveSubview:PauseDisplayWC];
    [self.view insertSubview:ErrorMessageWC aboveSubview:BackGroundOneWC];
    [self.view insertSubview:StartWC aboveSubview:BackGroundOneWC];
    [self.view addSubview:BackGroundFourWC];
}

-(void)SettingUpFuncionForButtons
{
    [CheckWC addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [CheckWC addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckWC addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [PauseWC addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [PauseWC addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    [StartWC addTarget:self action:@selector(StartClicked) forControlEvents:UIControlEventTouchUpOutside];
    [StartWC addTarget:self action:@selector(StartClicked) forControlEvents:UIControlEventTouchUpInside];
    [StartWC addTarget:self action:@selector(StartClick) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer *TapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pSOne:)];
    TapOne.numberOfTapsRequired = 1;
    pSelectionOneWC.userInteractionEnabled = YES;
    [pSelectionOneWC addGestureRecognizer:TapOne];
    
    UITapGestureRecognizer *TapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pSTwo:)];
    TapTwo.numberOfTapsRequired = 1;
    pSelectionTwoWC.userInteractionEnabled = YES;
    [pSelectionTwoWC addGestureRecognizer:TapTwo];
    
    UITapGestureRecognizer *TapThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pSThree:)];
    TapThree.numberOfTapsRequired = 1;
    pSelectionThreeWC.userInteractionEnabled = YES;
    [pSelectionThreeWC addGestureRecognizer:TapThree];
    
    UITapGestureRecognizer *TapFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pSFour:)];
    TapFour.numberOfTapsRequired = 1;
    pSelectionFourWC.userInteractionEnabled = YES;
    [pSelectionFourWC addGestureRecognizer:TapFour];
}

-(void)PauseClicked
{
    [PauseWC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoWC play];
}

-(void)sPauseClicked
{
    [PauseWC setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOneWC play];
}

-(void)CheckClciked
{
    [CheckWC setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoWC play];
}

-(void)sCheckClicked
{
    [CheckWC setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneWC play];
}

-(void)StartClicked
{
    [StartWC setImage:[UIImage imageNamed:@"Start.png"] forState:UIControlStateNormal];
    [SoundTwoWC play];
}

-(void)StartClick
{
    [StartWC setImage:[UIImage imageNamed:@"StartFlat.png"] forState:UIControlStateNormal];
    [SoundOneWC play];
}

-(void)pSOne: (UITapGestureRecognizer *)sender
{
    if (psOneWC == 0) {
        psOneWC = 1;
        pSelectionOneWC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (psOneWC == 1) {
        psOneWC = 2;
        pSelectionOneWC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (psOneWC == 2) {
        psOneWC = 1;
        pSelectionOneWC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)pSTwo: (UITapGestureRecognizer *)sender
{
    if (psTwoWC == 0) {
        psTwoWC = 1;
        pSelectionTwoWC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (psTwoWC == 1) {
        psTwoWC = 2;
        pSelectionTwoWC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (psTwoWC == 2) {
        psTwoWC = 1;
        pSelectionTwoWC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)pSThree: (UITapGestureRecognizer *)sender
{
    if (psThreeWC == 0) {
        psThreeWC = 1;
        pSelectionThreeWC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (psThreeWC == 1) {
        psThreeWC = 2;
        pSelectionThreeWC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (psThreeWC == 2) {
        psThreeWC = 1;
        pSelectionThreeWC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)pSFour: (UITapGestureRecognizer *)sender
{
    if (psFourWC == 0) {
        psFourWC = 1;
        pSelectionFourWC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (psFourWC == 1) {
        psFourWC = 2;
        pSelectionFourWC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (psFourWC == 2) {
        psFourWC = 1;
        pSelectionFourWC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(IBAction)Start:(id)sender
{
    if (psOneWC == 0 || psTwoWC == 0 || psThreeWC == 0 || psFourWC == 0) {
        ErrorMessageWC.alpha = 1;
    }
    
    if (psOneWC >= 1 && psTwoWC >= 1 && psThreeWC >= 1 && psFourWC >= 1) {
        ErrorMessageWC.alpha = 0;
        StartWC.alpha = 0;

        [self ProduceTheLettersOneGrids];
    }
}

-(void)ProduceTheLettersOneGrids
{
    TheAmountWC = 0;
    
    int WordAmount[27];
    
    for (int i = 0; i <= 26; i++) {
        @autoreleasepool {
            WordAmount[i] = 0;
        }
    }
    
    int pOneInt = 0, pTwoInt = 0, pThreeInt = 0, pFourInt = 0;
    
    if (psOneWC == 1) {
        int oneRandom = arc4random()%6;
        
        switch (oneRandom) {
            case 1:
                    pOneInt = 1;
                    WordAmount[1]++;
                    cOneWC = kOneWC;
                break;
            case 2:
                    pOneInt = 5;
                    WordAmount[5]++;
                    cOneWC = kFiveWC;
                break;
            case 3:
                    pOneInt = 9;
                    WordAmount[9]++;
                    cOneWC = kNineWC;
                break;
            case 4:
                    pOneInt = 15;
                    WordAmount[15]++;
                    cOneWC = kFithteenWC;
                break;
            case 5:
                    pOneInt = 21;
                    WordAmount[21]++;
                    cOneWC = kTwentyOneWC;
                break;
            default:
                break;
        }
    } else if (psOneWC == 2) {
        int oneRandom = arc4random()%22;
        
        switch (oneRandom) {
            case 1:
                pOneInt = 2;
                WordAmount[2]++;
                cOneWC = kTwoWC;
                break;
            case 2:
                pOneInt = 3;
                WordAmount[3]++;
                cOneWC = kThreeWC;
                break;
            case 3:
                pOneInt = 4;
                WordAmount[4]++;
                cOneWC = kFourWC;
                break;
            case 4:
                pOneInt = 6;
                WordAmount[6]++;
                cOneWC = kSixWC;
                break;
            case 5:
                pOneInt = 7;
                WordAmount[7]++;
                cOneWC = kSevenWC;
                break;
            case 6:
                pOneInt = 8;
                WordAmount[8]++;
                cOneWC = kEightWC;
                break;
            case 7:
                pOneInt = 10;
                WordAmount[10]++;
                cOneWC = kTenWC;
                break;
            case 8:
                pOneInt = 11;
                WordAmount[11]++;
                cOneWC = kElevenWC;
                break;
            case 9:
                pOneInt = 12;
                WordAmount[12]++;
                cOneWC = kTwelveWC;
                break;
            case 10:
                pOneInt = 13;
                WordAmount[13]++;
                cOneWC = kThirteenWC;
                break;
            case 11:
                pOneInt = 14;
                WordAmount[14]++;
                cOneWC = kFourteenWC;
                break;
            case 12:
                pOneInt = 16;
                WordAmount[16]++;
                cOneWC = kSixteenWC;
                break;
            case 13:
                pOneInt = 17;
                WordAmount[17]++;
                cOneWC = kSeventeenWC;
                break;
            case 14:
                pOneInt = 18;
                WordAmount[18]++;
                cOneWC = kEighteenWC;
                break;
            case 15:
                pOneInt = 19;
                WordAmount[19]++;
                cOneWC = kNineteenWC;
                break;
            case 16:
                pOneInt = 20;
                WordAmount[20]++;
                cOneWC = kTwentyWC;
                break;
            case 17:
                pOneInt = 22;
                WordAmount[22]++;
                cOneWC = kTwentyTwoWC;
                break;
            case 18:
                pOneInt = 23;
                WordAmount[23]++;
                cOneWC = kTwentyThreeWC;
                break;
            case 19:
                pOneInt = 24;
                WordAmount[24]++;
                cOneWC = kTwentyFourWC;
                break;
            case 20:
                pOneInt = 25;
                WordAmount[25]++;
                cOneWC = kTwentyFiveWC;
                break;
            case 21:
                pOneInt = 26;
                WordAmount[26]++;
                cOneWC = kTwentySixWC;
                break;
            default:
                break;
        }
    }
    
    if (psTwoWC == 1) {
        int twoRandom = arc4random()%6;
        
        switch (twoRandom) {
            case 1:
                pTwoInt = 1;
                WordAmount[1]++;
                cTwoWC = kOneWC;
                break;
            case 2:
                pTwoInt = 5;
                WordAmount[5]++;
                cTwoWC = kFiveWC;
                break;
            case 3:
                pTwoInt = 9;
                WordAmount[9]++;
                cTwoWC = kNineWC;
                break;
            case 4:
                pTwoInt = 15;
                WordAmount[15]++;
                cTwoWC = kFithteenWC;
                break;
            case 5:
                pTwoInt = 21;
                WordAmount[21]++;
                cTwoWC = kTwentyOneWC;
                break;
            default:
                break;
        }
    } else if (psTwoWC == 2) {
        int twoRandom = arc4random()%22;
        
        switch (twoRandom) {
            case 1:
                pTwoInt = 2;
                WordAmount[2]++;
                cTwoWC = kTwoWC;
                break;
            case 2:
                pTwoInt = 3;
                WordAmount[3]++;
                cTwoWC = kThreeWC;
                break;
            case 3:
                pTwoInt = 4;
                WordAmount[4]++;
                cTwoWC = kFourWC;
                break;
            case 4:
                pTwoInt = 6;
                WordAmount[6]++;
                cTwoWC = kSixWC;
                break;
            case 5:
                pTwoInt = 7;
                WordAmount[7]++;
                cTwoWC = kSevenWC;
                break;
            case 6:
                pTwoInt = 8;
                WordAmount[8]++;
                cTwoWC = kEightWC;
                break;
            case 7:
                pTwoInt = 10;
                WordAmount[10]++;
                cTwoWC = kTenWC;
                break;
            case 8:
                pTwoInt = 11;
                WordAmount[11]++;
                cTwoWC = kElevenWC;
                break;
            case 9:
                pTwoInt = 12;
                WordAmount[12]++;
                cTwoWC = kTwelveWC;
                break;
            case 10:
                pTwoInt = 13;
                WordAmount[13]++;
                cTwoWC = kThirteenWC;
                break;
            case 11:
                pTwoInt = 14;
                WordAmount[14]++;
                cTwoWC = kFourteenWC;
                break;
            case 12:
                pTwoInt = 16;
                WordAmount[16]++;
                cTwoWC = kSixteenWC;
                break;
            case 13:
                pTwoInt = 17;
                WordAmount[17]++;
                cTwoWC = kSeventeenWC;
                break;
            case 14:
                pTwoInt = 18;
                WordAmount[18]++;
                cTwoWC = kEighteenWC;
                break;
            case 15:
                pTwoInt = 19;
                WordAmount[19]++;
                cTwoWC = kNineteenWC;
                break;
            case 16:
                pTwoInt = 20;
                WordAmount[20]++;
                cTwoWC = kTwentyWC;
                break;
            case 17:
                pTwoInt = 22;
                WordAmount[22]++;
                cTwoWC = kTwentyTwoWC;
                break;
            case 18:
                pTwoInt = 23;
                WordAmount[23]++;
                cTwoWC = kTwentyThreeWC;
                break;
            case 19:
                pTwoInt = 24;
                WordAmount[24]++;
                cTwoWC = kTwentyFourWC;
                break;
            case 20:
                pTwoInt = 25;
                WordAmount[25]++;
                cTwoWC = kTwentyFiveWC;
                break;
            case 21:
                pTwoInt = 26;
                WordAmount[26]++;
                cTwoWC = kTwentySixWC;
                break;
            default:
                break;
        }
    }
    
    if (psThreeWC == 1) {
        int threeRandom = arc4random()%6;
        
        switch (threeRandom) {
            case 1:
                pThreeInt = 1;
                WordAmount[1]++;
                cThreeWC = kOneWC;
                break;
            case 2:
                pThreeInt = 5;
                WordAmount[5]++;
                cThreeWC = kFiveWC;
                break;
            case 3:
                pThreeInt = 9;
                WordAmount[9]++;
                cThreeWC = kNineWC;
                break;
            case 4:
                pThreeInt = 15;
                WordAmount[15]++;
                cThreeWC = kFithteenWC;
                break;
            case 5:
                pThreeInt = 21;
                WordAmount[21]++;
                cThreeWC = kTwentyOneWC;
                break;
            default:
                break;
        }
    } else if (psThreeWC == 2) {
        int threeRandom = arc4random()%22;
        
        switch (threeRandom) {
            case 1:
                pThreeInt = 2;
                WordAmount[2]++;
                cThreeWC = kTwoWC;
                break;
            case 2:
                pThreeInt = 3;
                WordAmount[3]++;
                cThreeWC = kThreeWC;
                break;
            case 3:
                pThreeInt = 4;
                WordAmount[4]++;
                cThreeWC = kFourWC;
                break;
            case 4:
                pThreeInt = 6;
                WordAmount[6]++;
                cThreeWC = kSixWC;
                break;
            case 5:
                pThreeInt = 7;
                WordAmount[7]++;
                cThreeWC = kSevenWC;
                break;
            case 6:
                pThreeInt = 8;
                WordAmount[8]++;
                cThreeWC = kEightWC;
                break;
            case 7:
                pThreeInt = 10;
                WordAmount[10]++;
                cThreeWC = kTenWC;
                break;
            case 8:
                pThreeInt = 11;
                WordAmount[11]++;
                cThreeWC = kElevenWC;
                break;
            case 9:
                pThreeInt = 12;
                WordAmount[12]++;
                cThreeWC = kTwelveWC;
                break;
            case 10:
                pThreeInt = 13;
                WordAmount[13]++;
                cThreeWC = kThirteenWC;
                break;
            case 11:
                pThreeInt = 14;
                WordAmount[14]++;
                cThreeWC = kFourteenWC;
                break;
            case 12:
                pThreeInt = 16;
                WordAmount[16]++;
                cThreeWC = kSixteenWC;
                break;
            case 13:
                pThreeInt = 17;
                WordAmount[17]++;
                cThreeWC = kSeventeenWC;
                break;
            case 14:
                pThreeInt = 18;
                WordAmount[18]++;
                cThreeWC = kEighteenWC;
                break;
            case 15:
                pThreeInt = 19;
                WordAmount[19]++;
                cThreeWC = kNineteenWC;
                break;
            case 16:
                pThreeInt = 20;
                WordAmount[20]++;
                cThreeWC = kTwentyWC;
                break;
            case 17:
                pThreeInt = 22;
                WordAmount[22]++;
                cThreeWC = kTwentyTwoWC;
                break;
            case 18:
                pThreeInt = 23;
                WordAmount[23]++;
                cThreeWC = kTwentyThreeWC;
                break;
            case 19:
                pThreeInt = 24;
                WordAmount[24]++;
                cThreeWC = kTwentyFourWC;
                break;
            case 20:
                pThreeInt = 25;
                WordAmount[25]++;
                cThreeWC = kTwentyFiveWC;
                break;
            case 21:
                pThreeInt = 26;
                WordAmount[26]++;
                cThreeWC = kTwentySixWC;
                break;
            default:
                break;
        }
    }
    
    if (psFourWC == 1) {
        int fourRandom = arc4random()%6;
        
        switch (fourRandom) {
            case 1:
                pFourInt = 1;
                WordAmount[1]++;
                cFourWC = kOneWC;
                break;
            case 2:
                pFourInt = 5;
                WordAmount[5]++;
                cFourWC = kFiveWC;
                break;
            case 3:
                pFourInt = 9;
                WordAmount[9]++;
                cFourWC = kNineWC;
                break;
            case 4:
                pFourInt = 15;
                WordAmount[15]++;
                cFourWC = kFithteenWC;
                break;
            case 5:
                pFourInt = 21;
                WordAmount[21]++;
                cFourWC = kTwentyOneWC;
                break;
            default:
                break;
        }
    } else if (psFourWC == 2) {
        int fourRandom = arc4random()%22;
        
        switch (fourRandom) {
            case 1:
                pFourInt = 2;
                WordAmount[2]++;
                cFourWC = kTwoWC;
                break;
            case 2:
                pFourInt = 3;
                WordAmount[3]++;
                cFourWC = kThreeWC;
                break;
            case 3:
                pFourInt = 4;
                WordAmount[4]++;
                cFourWC = kFourWC;
                break;
            case 4:
                pFourInt = 6;
                WordAmount[6]++;
                cFourWC = kSixWC;
                break;
            case 5:
                pFourInt = 7;
                WordAmount[7]++;
                cFourWC = kSevenWC;
                break;
            case 6:
                pFourInt = 8;
                WordAmount[8]++;
                cFourWC = kEightWC;
                break;
            case 7:
                pFourInt = 10;
                WordAmount[10]++;
                cFourWC = kTenWC;
                break;
            case 8:
                pFourInt = 11;
                WordAmount[11]++;
                cFourWC = kElevenWC;
                break;
            case 9:
                pFourInt = 12;
                WordAmount[12]++;
                cFourWC = kTwelveWC;
                break;
            case 10:
                pFourInt = 13;
                WordAmount[13]++;
                cFourWC = kThirteenWC;
                break;
            case 11:
                pFourInt = 14;
                WordAmount[14]++;
                cFourWC = kFourteenWC;
                break;
            case 12:
                pFourInt = 16;
                WordAmount[16]++;
                cFourWC = kSixteenWC;
                break;
            case 13:
                pFourInt = 17;
                WordAmount[17]++;
                cFourWC = kSeventeenWC;
                break;
            case 14:
                pFourInt = 18;
                WordAmount[18]++;
                cFourWC = kEighteenWC;
                break;
            case 15:
                pFourInt = 19;
                WordAmount[19]++;
                cFourWC = kNineteenWC;
                break;
            case 16:
                pFourInt = 20;
                WordAmount[20]++;
                cFourWC = kTwentyWC;
                break;
            case 17:
                pFourInt = 22;
                WordAmount[22]++;
                cFourWC = kTwentyTwoWC;
                break;
            case 18:
                pFourInt = 23;
                WordAmount[23]++;
                cFourWC = kTwentyThreeWC;
                break;
            case 19:
                pFourInt = 24;
                WordAmount[24]++;
                cFourWC = kTwentyFourWC;
                break;
            case 20:
                pFourInt = 25;
                WordAmount[25]++;
                cFourWC = kTwentyFiveWC;
                break;
            case 21:
                pFourInt = 26;
                WordAmount[26]++;
                cFourWC = kTwentySixWC;
                break;
            default:
                break;
        }
    }
    
    int z = 0;
    
    for (int i =0; i <= 26; i++) {
        @autoreleasepool {
        if (WordAmount[i] > 1) {
            if (WordAmount[i] == pOneInt) {
                z++;
            }
            if (WordAmount[i] == pTwoInt) {
                z++;
            }
            if (WordAmount[i] == pThreeInt) {
                z++;
            }
            if (WordAmount[i] == pFourInt) {
                z++;
            }
            
            }
        }
    }
    
    NSString *letterOne, *letterTwo, *letterThree, *letterFour;
    
    letterOne = [NSString stringWithFormat:@"%c", cOneWC];
    letterOne = [letterOne capitalizedString];
    
    letterTwo = [NSString stringWithFormat:@"%c", cTwoWC];
    letterTwo = [letterTwo capitalizedString];
    
    letterThree = [NSString stringWithFormat:@"%c", cThreeWC];
    letterThree = [letterThree capitalizedString];
    
    letterFour = [NSString stringWithFormat:@"%c", cFourWC];
    letterFour = [letterFour capitalizedString];
    
    NSString *imgNameOne = [NSString stringWithFormat:@"%@.png", letterOne];
    pOneWC.image = [UIImage imageNamed:imgNameOne];
    
    NSString *imgNameTwo = [NSString stringWithFormat:@"%@.png", letterTwo];
    pTwoWC.image = [UIImage imageNamed:imgNameTwo];
    
    NSString *imgNameThree = [NSString stringWithFormat:@"%@.png", letterThree];
    pThreeWC.image = [UIImage imageNamed:imgNameThree];
    
    NSString *imgNameFour = [NSString stringWithFormat:@"%@.png", letterFour];
    pFourWC.image = [UIImage imageNamed:imgNameFour];
    
    if (z > 1 || !cOneWC || !cTwoWC || !cThreeWC || !cFourWC) {
        [self ProduceTheLettersOneGrids];
    } else {
    
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2) {
        @autoreleasepool {
            NSString *Word = [NSString stringWithFormat:@""];
            unichar One = [str characterAtIndex:0];
            unichar Two = [str characterAtIndex:1];
            BOOL Done[5];
            
            for (int i = 0; i <= 5; i++) {
                Done[i] = NO;
            }
            
            if (One == cOneWC) {
                Word = [NSString stringWithFormat:@"%c", cOneWC];
                Done[1] = YES;
            } else if (One == cTwoWC) {
                Word = [NSString stringWithFormat:@"%c", cTwoWC];
                Done[2] = YES;
            } else if (One == cThreeWC) {
                Word = [NSString stringWithFormat:@"%c", cThreeWC];
                Done[3] = YES;
            } else if (One == cFourWC) {
                Word = [NSString stringWithFormat:@"%c", cFourWC];
                Done[4] = YES;
            }
            
            if (Two == cOneWC && Done[1] == NO) {
                Word = [NSString stringWithFormat:@"%@%c",Word, cOneWC];
            } else if (Two == cTwoWC && Done[2] == NO) {
                Word = [NSString stringWithFormat:@"%@%c",Word, cTwoWC];
            } else if (Two == cThreeWC && Done[3] == NO) {
                Word = [NSString stringWithFormat:@"%@%c",Word, cThreeWC];
            } else if (Two == cFourWC && Done[4] == NO) {
                Word = [NSString stringWithFormat:@"%@%c",Word, cFourWC];
            }
            
            
            if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:Word]) {
                TheAmountWC++;
            }
            
            }
        }
        
    }
    
    if (psOneWC == 2 && psTwoWC == 2 && psThreeWC == 2 && psFourWC == 2) {
        cOneWC = 'h';
        cTwoWC = 'm';
        cThreeWC = 's';
        cFourWC = 'y';
        
        NSString *letterOne, *letterTwo, *letterThree, *letterFour;
        
        letterOne = [NSString stringWithFormat:@"%c", cOneWC];
        letterOne = [letterOne capitalizedString];
        
        letterTwo = [NSString stringWithFormat:@"%c", cTwoWC];
        letterTwo = [letterTwo capitalizedString];
        
        letterThree = [NSString stringWithFormat:@"%c", cThreeWC];
        letterThree = [letterThree capitalizedString];
        
        letterFour = [NSString stringWithFormat:@"%c", cFourWC];
        letterFour = [letterFour capitalizedString];
        
        NSString *imgNameOne = [NSString stringWithFormat:@"%@.png", letterOne];
        pOneWC.image = [UIImage imageNamed:imgNameOne];
        
        NSString *imgNameTwo = [NSString stringWithFormat:@"%@.png", letterTwo];
        pTwoWC.image = [UIImage imageNamed:imgNameTwo];
        
        NSString *imgNameThree = [NSString stringWithFormat:@"%@.png", letterThree];
        pThreeWC.image = [UIImage imageNamed:imgNameThree];
        
        NSString *imgNameFour = [NSString stringWithFormat:@"%@.png", letterFour];
        pFourWC.image = [UIImage imageNamed:imgNameFour];
        
                TheAmountWC = 3;
    }
    
    
    if (TheAmountWC > 12 || TheAmountWC < 0) {
        TheAmountWC = 0;
    }
    
    if (TheAmountWC == 0) {
        [self ProduceTheLettersOneGrids];
    } else {
        TotalAmountWC.text = [NSString stringWithFormat:@"0 OF %i", TheAmountWC];
        
        [self GetTheWord];
        [self preViewDidLoad];
        
        iLeftWC = ikTwoWC - ikOneWC;
        iUpWC = iktOneWC - iktThreeWC;
        }
}

-(void)preViewDidLoad
{
    
    CGPoint midPoint;
    midPoint.x = ((pOneWC.center.x + pTwoWC.center.x) / 2);
    midPoint.y = ((pOneWC.center.y + pThreeWC.center.y) / 2);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    pSelectionOneWC.center = CGPointMake(midPoint.x, midPoint.y);
    pSelectionTwoWC.center = CGPointMake(midPoint.x, midPoint.y);
    pSelectionThreeWC.center = CGPointMake(midPoint.x, midPoint.y);
    pSelectionFourWC.center = CGPointMake(midPoint.x, midPoint.y);
    [UIView commitAnimations];
    
    pOneWC.center = CGPointMake(midPoint.x, midPoint.y);
    pTwoWC.center = CGPointMake(midPoint.x, midPoint.y);
    pThreeWC.center = CGPointMake(midPoint.x, midPoint.y);
    pFourWC.center = CGPointMake(midPoint.x, midPoint.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.6];
    [UIView setAnimationDuration:1];
    [pSelectionOneWC setAlpha:0];
    [pSelectionTwoWC setAlpha:0];
    [pSelectionThreeWC setAlpha:0];
    [pSelectionFourWC setAlpha:0];
    [StartWC setAlpha:0];
    [pOneWC setAlpha:1];
    [pTwoWC setAlpha:1];
    [pThreeWC setAlpha:1];
    [pFourWC setAlpha:1];
    [CheckWC setAlpha:1];
    [TheCurrentWordWC setAlpha:1];
    [PauseWC setAlpha:1];
    [BarUnderWordWC setAlpha:1];
    [TotalAmountWC setAlpha:1];
    [SenderDisplayWC setAlpha:1];
    [tHomeWC setAlpha:0];
    [gOneWC setAlpha:0];
    [gTwoWC setAlpha:0];
    [BBSelectionWC setAlpha:0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.1];
    [UIView setAnimationDuration:1];
    pOneWC.center = CGPointMake(ikOneWC, iktOneWC);
    pTwoWC.center = CGPointMake(ikTwoWC, iktTwoWC);
    pThreeWC.center = CGPointMake(ikThreeWC, iktThreeWC);
    pFourWC.center = CGPointMake(ikFourWC, iktFourWC);
    [self GameSettingUpForGrid];
    [UIView commitAnimations];
    
}

-(void)GameSettingUpForGrid
{
    [self Swipes];
}

-(void)Swipes
{
    PanningSensitivityWC = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneWC.userInteractionEnabled = YES;
    [pOneWC addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoWC.userInteractionEnabled = YES;
    [pTwoWC addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeWC.userInteractionEnabled = YES;
    [pThreeWC addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourWC.userInteractionEnabled = YES;
    [pFourWC addGestureRecognizer:panFour];
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    UISwipeGestureRecognizer *gesture;
    
    distanceWC = [sender translationInView:self.view];
    PanningIntWC++;
    PPanningMethodWC = 1;
    
    
    if ((gesture.direction == UISwipeGestureRecognizerDirectionDown || gesture.direction == UISwipeGestureRecognizerDirectionUp) && PreviousWC == 0) {
        [self Horizontal];
        PreviousWC = 2;
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 1) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Verticle];
            PanningIntWC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 2) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Horizontal];
            PanningIntWC = 0;
        }
    } else if (distanceWC.x > 0 || distanceWC.x < 0) {
        if ((distanceWC.y > 0 || distanceWC.y < 0) && ((distanceWC.x > 0 && distanceWC.x < 10) || (distanceWC.x < 0 && distanceWC.x > -10))) {
            PreviousWC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWC = 1;
        }
    } else if (distanceWC.y > 0 || distanceWC.y < 0) {
        PreviousWC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWC = 0;
        PreviousWC = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceWC = [sender translationInView:self.view];
    PanningIntWC++;
    PPanningMethodWC = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 1) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Verticle];
            PanningIntWC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 2) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Horizontal];
            PanningIntWC = 0;
        }
    } else if (distanceWC.x > 0 || distanceWC.x < 0) {
        if ((distanceWC.y > 0 || distanceWC.y < 0) && ((distanceWC.x > 0 && distanceWC.x < 10) || (distanceWC.x < 0 && distanceWC.x > -10))) {
            PreviousWC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWC = 1;
        }
    } else if (distanceWC.y > 0 || distanceWC.y < 0) {
        PreviousWC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWC = 0;
        PreviousWC = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceWC = [sender translationInView:self.view];
    PanningIntWC++;
    PPanningMethodWC = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 1) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Verticle];
            PanningIntWC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 2) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Horizontal];
            PanningIntWC = 0;
        }
    } else if (distanceWC.x > 0 || distanceWC.x < 0) {
        if ((distanceWC.y > 0 || distanceWC.y < 0) && ((distanceWC.x > 0 && distanceWC.x < 10) || (distanceWC.x < 0 && distanceWC.x > -10))) {
            PreviousWC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWC = 1;
        }
    } else if (distanceWC.y > 0 || distanceWC.y < 0) {
        PreviousWC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWC = 0;
        PreviousWC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceWC = [sender translationInView:self.view];
    PanningIntWC++;
    PPanningMethodWC = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 1) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Verticle];
            PanningIntWC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWC == 2) {
        if (PanningIntWC == PanningSensitivityWC) {
            [self Horizontal];
            PanningIntWC = 0;
        }
    } else if (distanceWC.x > 0 || distanceWC.x < 0) {
        if ((distanceWC.y > 0 || distanceWC.y < 0) && ((distanceWC.x > 0 && distanceWC.x < 10) || (distanceWC.x < 0 && distanceWC.x > -10))) {
            PreviousWC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWC = 1;
        }
    } else if (distanceWC.y > 0 || distanceWC.y < 0) {
        PreviousWC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWC = 0;
        PreviousWC = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneWC = pOneWC.center.x;
    yOneWC = pOneWC.center.y;
    xTwoWC = pTwoWC.center.x;
    yTwoWC = pTwoWC.center.y;
    xThreeWC = pThreeWC.center.x;
    yThreeWC = pThreeWC.center.y;
    xFourWC = pFourWC.center.x;
    yFourWC = pFourWC.center.y;
    
    switch (PPanningMethodWC) {
        case 1:
            pointOfIntrestWC = pOneWC.center.x;
            break;
        case 2:
            pointOfIntrestWC = pTwoWC.center.x;
            break;
        case 3:
            pointOfIntrestWC = pThreeWC.center.x;
            break;
        case 4:
            pointOfIntrestWC = pFourWC.center.x;
            break;
        default:
            break;
    }
    
    if (distanceWC.y < 0) {
        
        if (pointOfIntrestWC == pOneWC.center.x) {
            pOneWC.center = CGPointMake(pOneWC.center.x, pOneWC.center.y - iLeftWC);
        }
        if (pointOfIntrestWC == pTwoWC.center.x) {
            pTwoWC.center = CGPointMake(pTwoWC.center.x, pTwoWC.center.y - iLeftWC);
        }
        if (pointOfIntrestWC == pThreeWC.center.x) {
            pThreeWC.center = CGPointMake(pThreeWC.center.x , pThreeWC.center.y - iLeftWC);
        }
        if (pointOfIntrestWC == pFourWC.center.x) {
            pFourWC.center = CGPointMake(pFourWC.center.x, pFourWC.center.y - iLeftWC);
        }
    } else if (distanceWC.y > 0) {
        
        if (pointOfIntrestWC == pOneWC.center.x) {
            pOneWC.center = CGPointMake(pOneWC.center.x, pOneWC.center.y+ iLeftWC);
        }
        if (pointOfIntrestWC == pTwoWC.center.x) {
            pTwoWC.center = CGPointMake(pTwoWC.center.x, pTwoWC.center.y+ iLeftWC);
        }
        if (pointOfIntrestWC == pThreeWC.center.x) {
            pThreeWC.center = CGPointMake(pThreeWC.center.x , pThreeWC.center.y+ iLeftWC);
        }
        if (pointOfIntrestWC == pFourWC.center.x) {
            pFourWC.center = CGPointMake(pFourWC.center.x, pFourWC.center.y+ iLeftWC);
        }
    }
    
    if (pOneWC.center.x != pointOfIntrestWC) {
        pOneWC.alpha = 1;
        pOneWC.hidden = NO;
        pOneWC.center = CGPointMake(xOneWC, yOneWC);
    }
    if (pTwoWC.center.x != pointOfIntrestWC) {
        pTwoWC.alpha = 1;
        pTwoWC.hidden = NO;
        pTwoWC.center = CGPointMake(xTwoWC, yTwoWC);
    }
    if (pThreeWC.center.x != pointOfIntrestWC) {
        pThreeWC.alpha = 1;
        pThreeWC.hidden = NO;
        pThreeWC.center = CGPointMake(xThreeWC, yThreeWC);
    }
    
    if (pOneWC.center.y > iktThreeWC) {
        pOneWC.center = CGPointMake(pOneWC.center.x, iktOneWC);
    }
    if (pTwoWC.center.y > iktThreeWC) {
        pTwoWC.center = CGPointMake(pTwoWC.center.x, iktOneWC);
    }
    if (pThreeWC.center.y > iktThreeWC) {
        pThreeWC.center = CGPointMake(pThreeWC.center.x, iktOneWC);
    }
    if (pFourWC.center.y > iktThreeWC) {
        pFourWC.center = CGPointMake(pFourWC.center.x,iktOneWC );
    }
    
    if (pOneWC.center.y < iktOneWC) {
        pOneWC.center = CGPointMake(pOneWC.center.x, iktThreeWC);
    }
    if (pTwoWC.center.y < iktOneWC) {
        pTwoWC.center = CGPointMake(pTwoWC.center.x, iktThreeWC);
    }
    if (pThreeWC.center.y < iktOneWC) {
        pThreeWC.center = CGPointMake(pThreeWC.center.x, iktThreeWC);
    }
    if (pFourWC.center.y < iktOneWC) {
        pFourWC.center = CGPointMake(pFourWC.center.x, iktThreeWC);
    }
}

-(void)Verticle
{
    xOneWC = pOneWC.center.x;
    yOneWC = pOneWC.center.y;
    xTwoWC = pTwoWC.center.x;
    yTwoWC = pTwoWC.center.y;
    xThreeWC = pThreeWC.center.x;
    yThreeWC = pThreeWC.center.y;
    xFourWC = pFourWC.center.x;
    yFourWC = pFourWC.center.y;
    
    switch (PPanningMethodWC) {
        case 1:
            pointOfIntrestWC = pOneWC.center.y;
            break;
        case 2:
            pointOfIntrestWC = pTwoWC.center.y;
            break;
        case 3:
            pointOfIntrestWC = pThreeWC.center.y;
            break;
        case 4:
            pointOfIntrestWC = pFourWC.center.y;
            break;
        default:
            break;
    }
    
    if (distanceWC.x > 0) {
        
        if (pointOfIntrestWC == pOneWC.center.y) {
            pOneWC.center = CGPointMake(pOneWC.center.x + iLeftWC, pOneWC.center.y);
        }
        if (pointOfIntrestWC == pTwoWC.center.y) {
            pTwoWC.center = CGPointMake(pTwoWC.center.x + iLeftWC, pTwoWC.center.y);
        }
        if (pointOfIntrestWC == pThreeWC.center.y) {
            pThreeWC.center = CGPointMake(pThreeWC.center.x + iLeftWC, pThreeWC.center.y);
        }
        if (pointOfIntrestWC == pFourWC.center.y) {
            pFourWC.center = CGPointMake(pFourWC.center.x + iLeftWC, pFourWC.center.y);
        }
        
    } else if (distanceWC.x < 0) {
        
        if (pointOfIntrestWC == pOneWC.center.y) {
            pOneWC.center = CGPointMake(pOneWC.center.x - iLeftWC, pOneWC.center.y);
        }
        if (pointOfIntrestWC == pTwoWC.center.y) {
            pTwoWC.center = CGPointMake(pTwoWC.center.x - iLeftWC, pTwoWC.center.y);
        }
        if (pointOfIntrestWC == pThreeWC.center.y) {
            pThreeWC.center = CGPointMake(pThreeWC.center.x - iLeftWC, pThreeWC.center.y);
        }
        if (pointOfIntrestWC == pFourWC.center.y) {
            pFourWC.center = CGPointMake(pFourWC.center.x - iLeftWC, pFourWC.center.y);
        }
    }
    
    if (pOneWC.center.y != pointOfIntrestWC) {
        pOneWC.alpha = 1;
        pOneWC.hidden = NO;
        pOneWC.center = CGPointMake(xOneWC, yOneWC);
    }
    if (pTwoWC.center.y != pointOfIntrestWC) {
        pTwoWC.alpha = 1;
        pTwoWC.hidden = NO;
        pTwoWC.center = CGPointMake(xTwoWC, yTwoWC);
    }
    if (pThreeWC.center.y != pointOfIntrestWC) {
        pThreeWC.alpha = 1;
        pThreeWC.hidden = NO;
        pThreeWC.center = CGPointMake(xThreeWC, yThreeWC);
    }
    if (pFourWC.center.y != pointOfIntrestWC) {
        pFourWC.alpha = 1;
        pFourWC.hidden = NO;
        pFourWC.center = CGPointMake(xFourWC, yFourWC);
    }
    
    if (pOneWC.center.x < ikOneWC) {
        pOneWC.center = CGPointMake(ikTwoWC, pOneWC.center.y);
    }
    if (pTwoWC.center.x < ikOneWC) {
        pTwoWC.center = CGPointMake(ikTwoWC, pTwoWC.center.y);
    }
    if (pThreeWC.center.x < ikOneWC) {
        pThreeWC.center = CGPointMake(ikTwoWC, pThreeWC.center.y);
    }
    if (pFourWC.center.x < ikOneWC) {
        pFourWC.center = CGPointMake(ikTwoWC, pFourWC.center.y);
    }
    
    if (pOneWC.center.x > ikTwoWC) {
        pOneWC.center = CGPointMake(ikOneWC, pOneWC.center.y);
    }
    if (pTwoWC.center.x > ikTwoWC) {
        pTwoWC.center = CGPointMake(ikOneWC, pTwoWC.center.y);
    }
    if (pThreeWC.center.x > ikTwoWC) {
        pThreeWC.center = CGPointMake(ikOneWC, pThreeWC.center.y);
    }
    if (pFourWC.center.x > ikTwoWC) {
        pFourWC.center = CGPointMake(ikOneWC, pFourWC.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

-(void)EndSwipingSettings
{
    [SwipeSoundWC play];
    [self GetTheWord];
}

-(IBAction)IsItAWaord
{
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
    int i = 0;
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2) {
        @autoreleasepool {
            i++;
            if ([str isEqual:WordWC] && WordIsAlreadyDoneWC[i] == NO) {
                WordIsAlreadyDoneWC[i] = YES;
                ScoreWC = ScoreWC + 1;
                TotalAmountWC.text = [NSString stringWithFormat:@"%i OF  %i", ScoreWC, TheAmountWC];
            }
        }
        
    }
    
    if (ScoreWC == TheAmountWC) {
        [self PlayAnimation];
    }
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        TileOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x - 75, pOneWC.center.y - 75, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
        TileTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWC.center.x-75, pTwoWC.center.y-75, pTwoWC.bounds.size.width, pTwoWC.bounds.size.height)];
        TileThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWC.center.x-75, pThreeWC.center.y-75, pThreeWC.bounds.size.width, pThreeWC.bounds.size.height)];
        TileFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWC.center.x-75, pFourWC.center.y-75, pFourWC.bounds.size.width, pFourWC.bounds.size.height)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            TileOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x-50, pOneWC.center.y-50, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
            TileTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWC.center.x-50, pTwoWC.center.y-50, pTwoWC.bounds.size.width, pTwoWC.bounds.size.height)];
            TileThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWC.center.x-50, pThreeWC.center.y-50, pThreeWC.bounds.size.width, pThreeWC.bounds.size.height)];
            TileFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWC.center.x-50, pFourWC.center.y-50, pFourWC.bounds.size.width, pFourWC.bounds.size.height)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            
            TileOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x-55, pOneWC.center.y-55, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
            TileTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWC.center.x-55, pTwoWC.center.y-55, pTwoWC.bounds.size.width, pTwoWC.bounds.size.height)];
            TileThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWC.center.x-55, pThreeWC.center.y-55, pThreeWC.bounds.size.width, pThreeWC.bounds.size.height)];
            TileFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWC.center.x-55, pFourWC.center.y-55, pFourWC.bounds.size.width, pFourWC.bounds.size.height)];
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            TileOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x-58, pOneWC.center.y-58, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
            TileTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWC.center.x-58, pTwoWC.center.y-58, pTwoWC.bounds.size.width, pTwoWC.bounds.size.height)];
            TileThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWC.center.x-58, pThreeWC.center.y-58, pThreeWC.bounds.size.width, pThreeWC.bounds.size.height)];
            TileFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWC.center.x-58, pFourWC.center.y-58, pFourWC.bounds.size.width, pFourWC.bounds.size.height)];
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            TileOneWC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWC.center.x-60, pOneWC.center.y-60, pOneWC.bounds.size.width, pOneWC.bounds.size.height)];
            TileTwoWC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWC.center.x-60, pTwoWC.center.y-60, pTwoWC.bounds.size.width, pTwoWC.bounds.size.height)];
            TileThreeWC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWC.center.x-60, pThreeWC.center.y-60, pThreeWC.bounds.size.width, pThreeWC.bounds.size.height)];
            TileFourWC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWC.center.x-60, pFourWC.center.y-60, pFourWC.bounds.size.width, pFourWC.bounds.size.height)];
        }
    }

    
    TileOneWC.backgroundColor = [UIColor whiteColor];
    TileTwoWC.backgroundColor = [UIColor whiteColor];
    TileThreeWC.backgroundColor = [UIColor whiteColor];
    TileFourWC.backgroundColor = [UIColor whiteColor];
    
    TileOneWC.alpha = 0;
    TileTwoWC.alpha = 0;
    TileThreeWC.alpha = 0;
    TileFourWC.alpha = 0;
    
    [self.view addSubview:TileOneWC];
    [self.view addSubview:TileTwoWC];
    [self.view addSubview:TileThreeWC];
    [self.view addSubview:TileFourWC];
    
    TileOneWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneWC.alpha = 1;
    TileOneWC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoWC.alpha = 1;
    TileTwoWC.transform = CGAffineTransformMakeScale(1, 1);
    TileThreeWC.alpha = 1;
    TileThreeWC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileFourWC.alpha = 1;
    TileFourWC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordWC.alpha = 0;
    TheCurrentWordWC.alpha = 0;
    SenderDisplayWC.alpha = 0;
    PauseWC.alpha = 0;
    CheckWC.alpha = 0;
    pOneWC.alpha = 0;
    pTwoWC.alpha = 0;
    pThreeWC.alpha = 0;
    pFourWC.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountWC.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountWC.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelay:1];
    
    self.view.userInteractionEnabled = YES;
    CABasicAnimation *bounceAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    bounceAnimation.duration = 0.1;
    bounceAnimation.fromValue = [NSNumber numberWithInt:0];
    bounceAnimation.toValue = [NSNumber numberWithInt:10];
    bounceAnimation.repeatCount = 100;
    bounceAnimation.autoreverses = YES;
    bounceAnimation.fillMode = kCAFillModeForwards;
    bounceAnimation.removedOnCompletion = NO;
    bounceAnimation.additive = YES;
    [TileOneWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourWC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneWC.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoWC.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeWC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourWC.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneWC.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoWC.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeWC.transform = CGAffineTransformMakeScale(10, 10);
    TileFourWC.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountWC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
}

-(void)GetTheWord
{
    xOneWC = pOneWC.center.x;
    yOneWC = pOneWC.center.y;
    xTwoWC = pTwoWC.center.x;
    yTwoWC = pTwoWC.center.y;
    xThreeWC = pThreeWC.center.x;
    yThreeWC = pThreeWC.center.y;
    xFourWC = pFourWC.center.x;
    yFourWC = pFourWC.center.y;
    
    if (pOneWC.center.y == iktOneWC) {
        if (pOneWC.center.x == ikOneWC) {
            wOneWC = cOneWC;
        } else if (pOneWC.center.x == ikTwoWC) {
            wTwoWC = cOneWC;
        }
    }
    
    if (pTwoWC.center.y == iktOneWC) {
        if (pTwoWC.center.x == ikOneWC) {
            wOneWC = cTwoWC;
        } else if (pTwoWC.center.x == ikTwoWC) {
            wTwoWC = cTwoWC;
        }
    }
    
    if (pThreeWC.center.y == iktOneWC) {
        if (pThreeWC.center.x == ikOneWC) {
            wOneWC = cThreeWC;
        } else if (pThreeWC.center.x == ikTwoWC) {
            wTwoWC = cThreeWC;
        }
    }
    
    if (pFourWC.center.y == iktOneWC) {
        if (pFourWC.center.x == ikOneWC) {
            wOneWC = cFourWC;
        } else if (pFourWC.center.x == ikTwoWC) {
            wTwoWC = cFourWC;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneWC];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoWC];
    
    WordWC = [NSString stringWithFormat:@"%@%@", Ones, Twos];
    TheCurrentWordWC.text = [WordWC uppercaseString];
    
    pOneWC.center = CGPointMake(xOneWC, yOneWC);
    pTwoWC.center = CGPointMake(xTwoWC, yTwoWC);
    pThreeWC.center = CGPointMake(xThreeWC, yThreeWC);
    pFourWC.center = CGPointMake(xFourWC, yFourWC);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseWC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoWC play];
    
    PauseWC.userInteractionEnabled = NO;
    CheckWC.userInteractionEnabled = NO;
    PauseDisplayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayWC.alpha = 1.0;
        
        CurrentWordsWC.alpha = 1;
        PlayWC.alpha = 1;
        HomeWC.alpha = 1;
        
        PauseDisplayWC.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeWC.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayWC.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWordsWC.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        CheckWC.alpha = 0;
        TheCurrentWordWC.alpha = 0;
        BarUnderWordWC.alpha = 0;
        SenderDisplayWC.alpha = 0;
        TotalAmountWC.alpha = 0;
        PauseWC.alpha = 0;
        
        CheckWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PauseWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        pOneWC.alpha = 0;
        pTwoWC.alpha = 0;
        pThreeWC.alpha = 0;
        pFourWC.alpha = 0;
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerWC = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerWC = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerWC = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerWC = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerWC = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerWC.scrollEnabled = YES;
    WordScrollerWC.userInteractionEnabled = YES;
    WordScrollerWC.backgroundColor = [UIColor blackColor];
    WordScrollerWC.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerWC.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerWC aboveSubview:PauseDisplayWC];
    if (ScoreWC > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        int z = 1;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
                {
                    if (WordIsAlreadyDoneWC[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerWC.subviews) {
                            if (v.center.y == lbl.center.y) {
                                if (v.center.x == 50) {
                                    lbl.center = CGPointMake(150, lbl.center.y);
                                } else if (v.center.x == 150) {
                                    lbl.center = CGPointMake(250, lbl.center.y);
                                } else if (v.center.x == 250) {
                                    lbl.center = CGPointMake(350, lbl.center.y);
                                    z++;
                                }
                            }
                            WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerWC addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneWC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWC.subviews) {
                                if (v.center.y == lbl.center.y) {
                                    if (v.center.x == 50) {
                                        lbl.center = CGPointMake(110, lbl.center.y);
                                    } else if (v.center.x == 110) {
                                        lbl.center = CGPointMake(170, lbl.center.y);
                                    } else if (v.center.x == 170) {
                                        lbl.center = CGPointMake(230, lbl.center.y);
                                        z++;
                                    }
                                }
                                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerWC addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneWC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWC.subviews) {
                                if (v.center.y == lbl.center.y) {
                                    if (v.center.x == 50) {
                                        lbl.center = CGPointMake(110, lbl.center.y);
                                    } else if (v.center.x == 110) {
                                        lbl.center = CGPointMake(170, lbl.center.y);
                                    } else if (v.center.x == 170) {
                                        lbl.center = CGPointMake(230, lbl.center.y);
                                        z++;
                                    }
                                }
                                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerWC addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneWC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWC.subviews) {
                                if (v.center.y == lbl.center.y) {
                                    if (v.center.x == 50) {
                                        lbl.center = CGPointMake(110, lbl.center.y);
                                    } else if (v.center.x == 110) {
                                        lbl.center = CGPointMake(170, lbl.center.y);
                                    } else if (v.center.x == 170) {
                                        lbl.center = CGPointMake(230, lbl.center.y);
                                        z++;
                                    }
                                }
                                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerWC addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneWC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWC.subviews) {
                                if (v.center.y == lbl.center.y) {
                                    if (v.center.x == 50) {
                                        lbl.center = CGPointMake(110, lbl.center.y);
                                    } else if (v.center.x == 110) {
                                        lbl.center = CGPointMake(170, lbl.center.y);
                                    } else if (v.center.x == 170) {
                                        lbl.center = CGPointMake(230, lbl.center.y);
                                        z++;
                                    }
                                }
                                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerWC addSubview:lbl];
                            }
                        }
                        
                    }
                }
            }
        }
    }
    
    if (SomethingOneView == NO) {
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(40, 50, 300, 30)];
            lbll.text = @"YOU HAVE NO WORDS";
            lbll.textColor = [UIColor whiteColor];
            lbll.font = [lbll.font fontWithSize:25];
            [WordScrollerWC addSubview:lbll];
            WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWC addSubview:lbll];
                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWC addSubview:lbll];
                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWC addSubview:lbll];
                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWC addSubview:lbll];
                WordScrollerWC.contentSize = CGSizeMake(WordScrollerWC.bounds.size.width, lbll.center.y + 50);
            }
        }
    }
}

-(IBAction)Play:(id)sender
{
    [SoundOneWC play];
    [SoundTwoWC play];
    
    for (UIView *v in WordScrollerWC.subviews) {
        [v removeFromSuperview];
    }
    [WordScrollerWC removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayWC.alpha = 0;
        HomeWC.alpha = 0;
        PlayWC.alpha = 0;
        CurrentWordsWC.alpha = 0;
        
        CheckWC.userInteractionEnabled = YES;
        PauseWC.userInteractionEnabled = YES;
        
        PauseDisplayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        CheckWC.alpha = 1;
        TheCurrentWordWC.alpha = 1;
        BarUnderWordWC.alpha = 1;
        SenderDisplayWC.alpha = 1;
        TotalAmountWC.alpha = 1;
        PauseWC.alpha = 1;
        
        CheckWC.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordWC.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordWC.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayWC.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountWC.transform =CGAffineTransformMakeScale(1,1);
        PauseWC.transform =CGAffineTransformMakeScale(1,1);
        
        pOneWC.alpha = 1;
        pTwoWC.alpha = 1;
        pThreeWC.alpha = 1;
        pFourWC.alpha = 1;
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneWC play];
    [SoundTwoWC play];
    
    for (UIView *v in WordScrollerWC.subviews) {
        [v removeFromSuperview];
    }
    [WordScrollerWC removeFromSuperview];
    CheckWC.transform =CGAffineTransformMakeScale(1,1);
    TheCurrentWordWC.transform =CGAffineTransformMakeScale(1,1);
    BarUnderWordWC.transform =CGAffineTransformMakeScale(1,1);
    SenderDisplayWC.transform =CGAffineTransformMakeScale(1,1);
    TotalAmountWC.transform =CGAffineTransformMakeScale(1,1);
    PauseWC.transform =CGAffineTransformMakeScale(1,1);
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayWC.alpha = 0;
        HomeWC.alpha = 0;
        PlayWC.alpha = 0;
        CurrentWordsWC.alpha = 0;
        
        CheckWC.userInteractionEnabled = YES;
        PauseWC.userInteractionEnabled = YES;
        
        PauseDisplayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsWC.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    }];
    
    [pOneWC setAlpha:0];
    [pTwoWC setAlpha:0];
    [pThreeWC setAlpha:0];
    [pFourWC setAlpha:0];
    [BarUnderWordWC setAlpha:0];
    [TheCurrentWordWC setAlpha:0];
    [CheckWC setAlpha:0];
    [PauseWC setAlpha:0];
    [SenderDisplayWC setAlpha:0];
    [TotalAmountWC setAlpha:0];
    [self BackToHome];
}

-(void)BackToHome
{
    for (int i = 0; i <= 95; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneWC[i] = NO;
        }
    }
    
    psOneWC = 0;
    psTwoWC = 0;
    psThreeWC = 0;
    psFourWC = 0;
    
    pSelectionOneWC.image = [UIImage imageNamed:@"Blank.png"];
    pSelectionTwoWC.image = [UIImage imageNamed:@"Blank.png"];
    pSelectionThreeWC.image = [UIImage imageNamed:@"Blank.png"];
    pSelectionFourWC.image = [UIImage imageNamed:@"Blank.png"];
    
    ScoreWC = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    [pSelectionOneWC setAlpha:1];
    [pSelectionTwoWC setAlpha:1];
    [pSelectionThreeWC setAlpha:1];
    [pSelectionFourWC setAlpha:1];
    [StartWC setAlpha:1];
    pSelectionOneWC.center = CGPointMake(ikOneWC, iktOneWC);
    pSelectionTwoWC.center = CGPointMake(ikTwoWC, iktTwoWC);
    pSelectionThreeWC.center = CGPointMake(ikThreeWC, iktThreeWC);
    pSelectionFourWC.center = CGPointMake(ikFourWC, iktFourWC);
    [tHomeWC setAlpha:1];
    [UIView commitAnimations];
    
    [TileOneWC removeFromSuperview];
    [TileTwoWC removeFromSuperview];
    [TileThreeWC removeFromSuperview];
    [TileFourWC removeFromSuperview];
    
    BBSelectionWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gTwoWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gOneWC.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        gOneWC.alpha = 1.0;
        gTwoWC.alpha = 1;
        BBSelectionWC.alpha = 1;
        
        gOneWC.transform =CGAffineTransformMakeScale(1.0,1.0);
        gTwoWC.transform =CGAffineTransformMakeScale(1.0,1.0);
        BBSelectionWC.transform =CGAffineTransformMakeScale(1.0,1.0);
    }];
    
    pOneWC.center = CGPointMake(ikOneWC, iktOneWC);
    pTwoWC.center = CGPointMake(ikTwoWC, iktTwoWC);
    pThreeWC.center = CGPointMake(ikThreeWC, iktThreeWC);
    pFourWC.center = CGPointMake(ikFourWC, iktFourWC);
}

-(IBAction)gOne:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [BBSelectionWC setAlpha:0];
    [pSelectionOneWC setAlpha:0];
    [pSelectionTwoWC setAlpha:0];
    [pSelectionThreeWC setAlpha:0];
    [pSelectionFourWC setAlpha:0];
    [ErrorMessageWC setAlpha:0];
    [StartWC setAlpha:0];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneWC.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"CTTGrids" sender:self];
}

-(IBAction)tHome:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourWC.alpha = 0;
        BackGroundFourWC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourWC.alpha = 1;
                             BackGroundFourWC.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoToHomeFromTwoChoice" sender:self];
}

@end