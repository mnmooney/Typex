//
//  ThreeQuestions.m
//  Typex V2
//
//  Created by Michael Mooney on 22/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "ThreeQuestions.h"
#import <AVFoundation/AVFoundation.h>

NSInteger WordThreeQT;
NSString *WordTQ;
NSString *SavedWordsQT;

int replayTQ, ScoreTQ, PreviousTQ, PanningIntTQ, PPanningMethodTQ;
NSInteger PanningSensitivityTQ;

char cOneTQ, cTwoTQ, cThreeTQ, cFourTQ, cFiveTQ, cSixTQ, cSevenTQ, cEightTQ, cNineTQ;
char wOneTQ, wTwoTQ, wThreeTQ;

float ikOneTQ, ikTwoTQ, ikThreeTQ, ikFourTQ, ikFiveTQ, ikSixTQ, ikSevenTQ, ikEightTQ, ikNineTQ;
float iktOneTQ, iktTwoTQ, iktThreeTQ, iktFourTQ, iktFiveTQ, iktSixTQ, iktSevenTQ, iktEightTQ, iktNineTQ;
float iLeftTQ, iRightTQ, iUpTQ, iDownTQ;
float pointOfIntrestTQ;
float xOneTQ, yOneTQ, xTwoTQ, yTwoTQ, xThreeTQ, yThreeTQ, xFourTQ, yFourTQ, xFiveTQ, yFiveTQ, xSixTQ, ySixTQ, xSevenTQ, ySevenTQ, xEightTQ, yEightTQ, xNineTQ, yNineTQ;
float kSelectionTQ;
CGPoint OneTQ, TwoTQ, ThreeTQ, FourTQ, FiveTQ, SixTQ, SevenTQ, EightTQ, NineTQ, distanceTQ;

BOOL WordIsAlreadyDoneTQ[8];

@interface ThreeQuestions () <AVAudioPlayerDelegate>
{
    
    AVAudioPlayer *SoundOneTQ, *SoundTwoTQ, *SwipeSoundTQ;
    
#pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeTQ, *CheckTQ;
    IBOutlet UIImageView *BackGroundOneTQ, *BackGroundTwoTQ, *BackGroundThreeTQ, *BackGroundFourTQ;
    
#pragma Mark Game - Grids
    IBOutlet UIImageView *pOneTQ, *pTwoTQ, *pThreeTQ, *pFourTQ, *pFiveTQ, *pSixTQ, *pSevenTQ, *pEightTQ, *pNineTQ;
    IBOutlet UILabel *TotalAmountTQ;
    IBOutlet UIButton *PauseTQ;
    IBOutlet UILabel *TheCurrentWordTQ;
    IBOutlet UIImageView *PauseDisplayTQ, *SenderDisplayTQ;
    IBOutlet UIButton *HomeTQ, *PlayTQ;
    IBOutlet UIImageView *BarUnderWordTQ;
    IBOutlet UIImageView *BBSelectionTQ;
    IBOutlet UILabel *TheQuestionTQ;
    IBOutlet UIImageView *TileOneTQ, *TileTwoTQ, *TileThreeTQ, *TileFourTQ, *TileFiveTQ, *TileSixTQ, *TileSevenTQ, *TileEightTQ, *TileNineTQ;
    
#pragma Mark Selection - Fist Page
    IBOutlet UIButton *sOneTQ, *sTwoTQ, *sThreeTQ, *sFourTQ, *sFiveTQ, *sSixTQ, *sSevenTQ, *sEightTQ, *sNineTQ;
    IBOutlet UIButton *gOneTQ, *gTwoTQ, *gThreeTQ;
    IBOutlet UIScrollView *WordScrollerTQ;
    IBOutlet UILabel *CurrentWordsTQ;
    
    NSTimer *moverTQ;
}
@end

@implementation ThreeQuestions


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

    
    BackGroundFourTQ.alpha = 0;
    
#pragma Mark The Game Items
    
    ScoreTQ = 0;
    
    PauseTQ.alpha = 0;
    CheckTQ.alpha = 0;
    TotalAmountTQ.alpha = 0;
    
    pOneTQ.alpha = 0;
    pTwoTQ.alpha = 0;
    pThreeTQ.alpha = 0;
    CurrentWordsTQ.alpha = 0;
    PlayTQ.alpha = 0;
    HomeTQ.alpha = 0;
    pFourTQ.alpha = 0;
    pFiveTQ.alpha = 0;
    pSixTQ.alpha = 0;
    pSevenTQ.alpha = 0;
    pEightTQ.alpha = 0;
    pNineTQ.alpha = 0;
    BarUnderWordTQ.alpha = 0;
    SenderDisplayTQ.alpha = 0;
    TheCurrentWordTQ.alpha = 0;
    PauseDisplayTQ.alpha = 0;
    TheQuestionTQ.alpha = 0;
    
#pragma Mark The Selection Page
    
    sOneTQ.alpha = 0;
    sTwoTQ.alpha = 0;
    sThreeTQ.alpha = 0;
    sFourTQ.alpha = 0;
    sFiveTQ.alpha = 0;
    sSixTQ.alpha = 0;
    sSevenTQ.alpha = 0;
    sEightTQ.alpha = 0;
    sNineTQ.alpha = 0;
    PauseDisplayTQ.backgroundColor = [UIColor blackColor];
    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneTQ = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoTQ = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSoundTQ = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
    [self performSelector:@selector(Opening) withObject:nil afterDelay:0.1];
    [self SettingUpFuncionForButtons];
    
    BOOL HomeFQ = NO;
    [[NSUserDefaults standardUserDefaults] setBool:HomeFQ forKey:@"IsItComingInFromHomeScreen"];   
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
    [gOneTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gThreeTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        sOneTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwoTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThreeTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFiveTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSixTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSevenTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sEightTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sNineTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            sOneTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwoTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThreeTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFiveTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSixTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSevenTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sEightTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sNineTQ.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                sOneTQ.transform = CGAffineTransformIdentity;
                sTwoTQ.transform = CGAffineTransformIdentity;
                sThreeTQ.transform = CGAffineTransformIdentity;
                sFourTQ.transform = CGAffineTransformIdentity;
                sFiveTQ.transform = CGAffineTransformIdentity;
                sSixTQ.transform = CGAffineTransformIdentity;
                sSevenTQ.transform = CGAffineTransformIdentity;
                sEightTQ.transform = CGAffineTransformIdentity;
                sNineTQ.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    tHomeTQ.alpha = 1;
    gOneTQ.alpha = 1;
    gTwoTQ.alpha = 1;
    gThreeTQ.alpha = 1;
    BBSelectionTQ.alpha = 1;
    sOneTQ.alpha = 1;
    sTwoTQ.alpha = 1;
    sThreeTQ.alpha = 1;
    sFourTQ.alpha = 1;
    sFiveTQ.alpha = 1;
    sSixTQ.alpha = 1;
    sSevenTQ.alpha = 1;
    sEightTQ.alpha = 1;
    sNineTQ.alpha = 1;
    [UIView commitAnimations];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        SenderDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 250, 45)];
        TotalAmountTQ = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 76, 38)];
        TotalAmountTQ.font = [[TotalAmountTQ font] fontWithSize:15];
        PauseTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckTQ = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordTQ = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordTQ = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordTQ.font  = [[TheCurrentWordTQ font] fontWithSize:15];
        TheQuestionTQ = [[UILabel alloc] initWithFrame:CGRectMake(143, 20, 161, 38)];
        TheQuestionTQ.font  = [[TheQuestionTQ font] fontWithSize:16];
        
        BackGroundOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        tHomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(87, 434, 40, 40)];
        gTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(140, 434, 40, 40)];
        gThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(193, 434, 40, 40)];
        BBSelectionTQ = [[UIImageView alloc] initWithFrame:CGRectMake(136, 430, 48, 48)];
        
        sOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(72, 45, 100, 40)];
        sTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(180, 45, 100, 40)];
        sThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(72, 93, 100, 40)];
        sFourTQ = [[UIButton alloc] initWithFrame:CGRectMake(180, 93, 100, 40)];
        sFiveTQ = [[UIButton alloc] initWithFrame:CGRectMake(72, 141, 100, 40)];
        sSixTQ = [[UIButton alloc] initWithFrame:CGRectMake(180, 141, 100, 40)];
        sSevenTQ = [[UIButton alloc] initWithFrame:CGRectMake(72, 189, 100, 40)];
        sEightTQ = [[UIButton alloc] initWithFrame:CGRectMake(180, 189, 100, 40)];
        sNineTQ = [[UIButton alloc] initWithFrame:CGRectMake(72, 237, 100, 40)];
        
        PlayTQ = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsTQ = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsTQ.font  = [[CurrentWordsTQ font] fontWithSize:20];
        
        pOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(49, 229, 70, 70)];
        pTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(125, 229, 70, 70)];
        pThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(201, 229, 70, 70)];
        pFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(49, 305, 70, 70)];
        pFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(125, 305, 70, 70)];
        pSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(201, 305, 70, 70)];
        pSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(49, 481, 70, 70)];
        pEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(125, 481, 70, 70)];
        pNineTQ  = [[UIImageView alloc] initWithFrame:CGRectMake(201, 481, 70, 70)];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 240, 50)];
        TotalAmountTQ = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 89, 36)];
        TotalAmountTQ.font = [[TotalAmountTQ font] fontWithSize:20];
        PauseTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckTQ = [[UIButton alloc] initWithFrame:CGRectMake(60, 154, 200, 40)];
        BarUnderWordTQ = [[UIImageView alloc] initWithFrame:CGRectMake(41, 242, 240, 2)];
        TheCurrentWordTQ = [[UILabel alloc] initWithFrame:CGRectMake(117, 215, 87, 28)];
        TheCurrentWordTQ.font  = [[TheCurrentWordTQ font] fontWithSize:25];
        pOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(16, 258, 90, 90)];
        pTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(116, 258, 90, 90)];
        pThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(216, 258, 90, 90)];
        pFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(16, 358, 90, 90)];
        pFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(116, 358, 90, 90)];
        pSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(216, 358, 90, 90)];
        pSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(16, 458, 90, 90)];
        pEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(116, 458, 90, 90)];
        pNineTQ  = [[UIImageView alloc] initWithFrame:CGRectMake(216, 458, 90, 90)];
        TheQuestionTQ = [[UILabel alloc] initWithFrame:CGRectMake(154, 20, 140, 36)];
        
        tHomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(89, 520, 40, 40)];
        gTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(139, 520, 40, 40)];
        gThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(192, 520, 40, 40)];
        BBSelectionTQ = [[UIImageView alloc] initWithFrame:CGRectMake(136, 517, 46, 46)];
        
        sOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(48, 106, 110, 45)];
        sTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(182, 106, 110, 45)];
        sThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(48, 156, 110, 45)];
        sFourTQ = [[UIButton alloc] initWithFrame:CGRectMake(182, 156, 110, 45)];
        sFiveTQ = [[UIButton alloc] initWithFrame:CGRectMake(48, 206, 110, 45)];
        sSixTQ = [[UIButton alloc] initWithFrame:CGRectMake(182, 206, 110, 45)];
        sSevenTQ = [[UIButton alloc] initWithFrame:CGRectMake(48, 256, 110, 45)];
        sEightTQ = [[UIButton alloc] initWithFrame:CGRectMake(182, 256, 110, 45)];
        sNineTQ = [[UIButton alloc] initWithFrame:CGRectMake(48, 306, 110, 45)];
        
        PlayTQ = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsTQ = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsTQ.font  = [[CurrentWordsTQ font] fontWithSize:20];
        TheQuestionTQ.font  = [[TheQuestionTQ font] fontWithSize:20];
        
        BackGroundOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(107, 602, 45, 45)];
        gTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(165, 602, 45, 45)];
        gThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(223, 602, 45, 45)];
        BBSelectionTQ = [[UIImageView alloc] initWithFrame:CGRectMake(162, 599, 51, 51)];
        
        sOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(12, 251, 110, 50)];
        sTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(130, 251, 110, 50)];
        sThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(252, 251, 110, 50)];
        sFourTQ = [[UIButton alloc] initWithFrame:CGRectMake(12, 309, 110, 50)];
        sFiveTQ = [[UIButton alloc] initWithFrame:CGRectMake(130, 309, 110, 50)];
        sSixTQ = [[UIButton alloc] initWithFrame:CGRectMake(252, 309, 110, 50)];
        sSevenTQ = [[UIButton alloc] initWithFrame:CGRectMake(12, 367, 110, 50)];
        sEightTQ = [[UIButton alloc] initWithFrame:CGRectMake(130, 367, 110, 50)];
        sNineTQ = [[UIButton alloc] initWithFrame:CGRectMake(252, 367, 110, 50)];
        
        BackGroundOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        pOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(27, 327, 100, 100)];
        pTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(137, 327, 100, 100)];
        pThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(247, 327, 100, 100)];
        pFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(27, 437, 100, 100)];
        pFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(137, 437, 100, 100)];
        pSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(247, 437, 100, 100)];
        pSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(27, 547, 100, 100)];
        pEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(137, 547, 100, 100)];
        pNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(247, 547, 100, 100)];
        
        BarUnderWordTQ = [[UIImageView alloc] initWithFrame:CGRectMake(67, 315, 240, 2)];
        TheCurrentWordTQ = [[UILabel alloc] initWithFrame:CGRectMake(123, 282, 128, 35)];
        CheckTQ = [[UIButton alloc] initWithFrame:CGRectMake(82, 202, 210, 45)];
        SenderDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 293, 50)];
        TotalAmountTQ = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 124, 42)];
        PauseTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        TheQuestionTQ = [[UILabel alloc] initWithFrame:CGRectMake(188, 20, 164, 41)];
        
        TheCurrentWordTQ.font  = [[TheCurrentWordTQ font] fontWithSize:25];
        TheQuestionTQ.font  = [[TheQuestionTQ font] fontWithSize:20];
        TotalAmountTQ.font = [[TotalAmountTQ font] fontWithSize:22];
        
        PlayTQ = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsTQ = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsTQ.font = [[CurrentWordsTQ font] fontWithSize:25];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(127, 671, 45, 45)];
        gTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(185, 671, 45, 45)];
        gThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(243, 671, 45, 45)];
        BBSelectionTQ = [[UIImageView alloc] initWithFrame:CGRectMake(181, 668, 51, 51)];
        
        PlayTQ = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeTQ = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsTQ = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsTQ.font = [[CurrentWordsTQ font] fontWithSize:25];
        
        sOneTQ = [[UIButton alloc] initWithFrame:CGRectMake(19, 285, 120, 50)];
        sTwoTQ = [[UIButton alloc] initWithFrame:CGRectMake(147, 285, 120, 50)];
        sThreeTQ = [[UIButton alloc] initWithFrame:CGRectMake(275, 285, 120, 50)];
        sFourTQ = [[UIButton alloc] initWithFrame:CGRectMake(19, 343, 120, 50)];
        sFiveTQ = [[UIButton alloc] initWithFrame:CGRectMake(147, 343, 120, 50)];
        sSixTQ = [[UIButton alloc] initWithFrame:CGRectMake(275, 343, 120, 50)];
        sSevenTQ = [[UIButton alloc] initWithFrame:CGRectMake(19, 401, 120, 50)];
        sEightTQ = [[UIButton alloc] initWithFrame:CGRectMake(147, 401, 120, 50)];
        sNineTQ = [[UIButton alloc] initWithFrame:CGRectMake(275, 401, 120, 50)];
        
        BarUnderWordTQ = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordTQ = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckTQ = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmountTQ = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        PauseTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWordTQ.font  = [[TheCurrentWordTQ font] fontWithSize:25];
        TotalAmountTQ.font = [[TotalAmountTQ font] fontWithSize:25];
        
        BarUnderWordTQ = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordTQ = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckTQ = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayTQ = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 329, 55)];
        TotalAmountTQ = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 105, 45)];
        PauseTQ = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        TheQuestionTQ = [[UILabel alloc] initWithFrame:CGRectMake(182, 20, 208, 45)];
        TheQuestionTQ.font  = [[TheQuestionTQ font] fontWithSize:20];
        
        pOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(62, 399, 90, 90)];
        pTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(162, 399, 90, 90)];
        pThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(262, 399, 90, 90)];
        pFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(62, 499, 90, 90)];
        pFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(162, 499, 90, 90)];
        pSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(262, 499, 90, 90)];
        pSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(62, 599, 90, 90)];
        pEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(162, 599, 90, 90)];
        pNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(262, 599, 90, 90)];
    }
    
    [self.view addSubview:BackGroundOneTQ];
    [self.view insertSubview:BackGroundTwoTQ belowSubview:BackGroundOneTQ];
    [self.view insertSubview:BackGroundThreeTQ belowSubview:BackGroundOneTQ];
    
    BackGroundTwoTQ.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundOneTQ.image = [UIImage imageNamed:@"BackGroundTwo.png"];
    BackGroundThreeTQ.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourTQ.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [PlayTQ setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeTQ setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayTQ addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeTQ addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayTQ.showsTouchWhenHighlighted = YES;
    HomeTQ.showsTouchWhenHighlighted = YES;
    PlayTQ.adjustsImageWhenHighlighted = NO;
    HomeTQ.adjustsImageWhenHighlighted = NO;
    CurrentWordsTQ.text = @"CURRENT WORDS";
    CurrentWordsTQ.textColor = [UIColor whiteColor];
    CurrentWordsTQ.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplayTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:HomeTQ aboveSubview:PauseDisplayTQ];
    [self.view insertSubview:PlayTQ aboveSubview:PauseDisplayTQ];
    [self.view insertSubview:CurrentWordsTQ aboveSubview:PauseDisplayTQ];
    
    BarUnderWordTQ.backgroundColor = [UIColor blackColor];
    TheCurrentWordTQ.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordTQ.textColor = [UIColor whiteColor];
    CheckTQ.adjustsImageWhenHighlighted = NO;
    tHomeTQ.adjustsImageWhenHighlighted = NO;
    tHomeTQ.showsTouchWhenHighlighted = YES;
    gOneTQ.showsTouchWhenHighlighted = YES;
    gTwoTQ.showsTouchWhenHighlighted = YES;
    TheQuestionTQ.textColor = [UIColor whiteColor];
    TheQuestionTQ.textAlignment = NSTextAlignmentCenter;
    gThreeTQ.showsTouchWhenHighlighted = YES;
    gOneTQ.adjustsImageWhenHighlighted = NO;
    gTwoTQ.adjustsImageWhenHighlighted = NO;
    gThreeTQ.adjustsImageWhenHighlighted = NO;
    BBSelectionTQ.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeTQ setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [tHomeTQ addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [gOneTQ addTarget:self action:@selector(gOne:) forControlEvents:UIControlEventTouchUpInside];
    [gThreeTQ addTarget:self action:@selector(GoToChoice:) forControlEvents:UIControlEventTouchUpInside];
    [gOneTQ setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoTQ setImage:[UIImage imageNamed:@"BButtonThree.png"] forState:UIControlStateNormal];
    [gThreeTQ setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckTQ setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckTQ addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseTQ setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [PauseTQ addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseTQ.adjustsImageWhenHighlighted = NO;
    SenderDisplayTQ.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountTQ.textColor = [UIColor whiteColor];
    TotalAmountTQ.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:SenderDisplayTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:TotalAmountTQ aboveSubview:SenderDisplayTQ];
    [self.view insertSubview:PauseTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:CheckTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:BarUnderWordTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:TheCurrentWordTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pOneTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pTwoTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pThreeTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pFourTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pFiveTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pSixTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pSevenTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pEightTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:pNineTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:tHomeTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:gOneTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:gTwoTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:gThreeTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:BBSelectionTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:TheQuestionTQ aboveSubview:SenderDisplayTQ];
    
    [sOneTQ setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [sTwoTQ setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [sThreeTQ setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [sFourTQ setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [sFiveTQ setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [sSixTQ setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [sSevenTQ setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [sEightTQ setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [sNineTQ setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    
    [sOneTQ addTarget:self action:@selector(One:) forControlEvents:UIControlEventTouchUpInside];
    [sTwoTQ addTarget:self action:@selector(Two:) forControlEvents:UIControlEventTouchUpInside];
    [sThreeTQ addTarget:self action:@selector(Three:) forControlEvents:UIControlEventTouchUpInside];
    [sFourTQ addTarget:self action:@selector(Four:) forControlEvents:UIControlEventTouchUpInside];
    [sFiveTQ addTarget:self action:@selector(Five:) forControlEvents:UIControlEventTouchUpInside];
    [sSixTQ addTarget:self action:@selector(Six:) forControlEvents:UIControlEventTouchUpInside];
    [sSevenTQ addTarget:self action:@selector(Seven:) forControlEvents:UIControlEventTouchUpInside];
    [sEightTQ addTarget:self action:@selector(Eight:) forControlEvents:UIControlEventTouchUpInside];
    [sNineTQ addTarget:self action:@selector(Nine:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:sOneTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sTwoTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sThreeTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sFourTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sFiveTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sSixTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sSevenTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sEightTQ aboveSubview:BackGroundOneTQ];
    [self.view insertSubview:sNineTQ aboveSubview:BackGroundOneTQ];
    [self.view addSubview:BackGroundFourTQ];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)SettingUpFuncionForButtons
{
    [CheckTQ addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [CheckTQ addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckTQ addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [PauseTQ addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [PauseTQ addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    [sOneTQ addTarget:self action:@selector(sOneClicked) forControlEvents:UIControlEventTouchDown];
    [sOneTQ addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpInside];
    [sOneTQ addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwoTQ addTarget:self action:@selector(sTwoClicked) forControlEvents:UIControlEventTouchDown];
    [sTwoTQ addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwoTQ addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThreeTQ addTarget:self action:@selector(sThreeClicked) forControlEvents:UIControlEventTouchDown];
    [sThreeTQ addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThreeTQ addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourTQ addTarget:self action:@selector(sFourClicked) forControlEvents:UIControlEventTouchDown];
    [sFourTQ addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFourTQ addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFiveTQ addTarget:self action:@selector(sFiveClicked) forControlEvents:UIControlEventTouchDown];
    [sFiveTQ addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFiveTQ addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSixTQ addTarget:self action:@selector(sSixClicked) forControlEvents:UIControlEventTouchDown];
    [sSixTQ addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSixTQ addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSevenTQ addTarget:self action:@selector(sSevenClicked) forControlEvents:UIControlEventTouchDown];
    [sSevenTQ addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSevenTQ addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sEightTQ addTarget:self action:@selector(sEightClicked) forControlEvents:UIControlEventTouchDown];
    [sEightTQ addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpInside];
    [sEightTQ addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sNineTQ addTarget:self action:@selector(sNineClicked) forControlEvents:UIControlEventTouchDown];
    [sNineTQ addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpInside];
    [sNineTQ addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    ikOneTQ = pOneTQ.center.x;
    iktOneTQ = pOneTQ.center.y;
    ikTwoTQ = pTwoTQ.center.x;
    iktTwoTQ = pTwoTQ.center.y;
    ikThreeTQ = pThreeTQ.center.x;
    iktThreeTQ = pThreeTQ.center.y;
    ikFourTQ = pFourTQ.center.x;
    iktFourTQ = pFourTQ.center.y;
    ikFiveTQ = pFiveTQ.center.x;
    iktFiveTQ = pFiveTQ.center.y;
    ikSixTQ = pSixTQ.center.x;
    iktSixTQ = pSixTQ.center.y;
    ikSevenTQ = pSevenTQ.center.x;
    iktSevenTQ = pSevenTQ.center.y;
    ikEightTQ = pEightTQ.center.x;
    iktEightTQ = pEightTQ.center.y;
    ikNineTQ = pNineTQ.center.x;
    iktNineTQ = pNineTQ.center.y;
    kSelectionTQ = sNineTQ.center.y;
}

-(void)sOneClicked
{
    [sOneTQ setImage:[UIImage imageNamed:@"OnePlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sOneClick
{
    [sOneTQ setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sTwoClicked
{
    [sTwoTQ setImage:[UIImage imageNamed:@"TwoPlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sTwoClick
{
    [sTwoTQ setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sThreeClicked
{
    [sThreeTQ setImage:[UIImage imageNamed:@"ThreePlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sThreeClick
{
    [sThreeTQ setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sFourClicked
{
    [sFourTQ setImage:[UIImage imageNamed:@"FourPlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sFourClick
{
    [sFourTQ setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sFiveClicked
{
    [sFiveTQ setImage:[UIImage imageNamed:@"FivePlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sFiveClick
{
    [sFiveTQ setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sSixClicked
{
    [sSixTQ setImage:[UIImage imageNamed:@"SixPlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sSixClick
{
    [sSixTQ setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sSevenClicked
{
    [sSevenTQ setImage:[UIImage imageNamed:@"SevenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sSevenClick
{
    [sSevenTQ setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sEightClicked
{
    [sEightTQ setImage:[UIImage imageNamed:@"EightPlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sEightClick
{
    [sEightTQ setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sNineClicked
{
    [sNineTQ setImage:[UIImage imageNamed:@"NinePlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)sNineClick
{
    [sNineTQ setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}
-(void)PauseClicked
{
    [PauseTQ setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sPauseClicked
{
    [PauseTQ setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(void)CheckClciked
{
    [CheckTQ setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
}

-(void)sCheckClicked
{
    [CheckTQ setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneTQ play];
}

-(IBAction)One:(id)sender
{
    WordThreeQT = 1;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree1"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsOne" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    
    [self preViewDidLoad];
}

-(IBAction)Two:(id)sender
{
    WordThreeQT = 2;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree2"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsTwo" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Three:(id)sender
{
    WordThreeQT = 3;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree3"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsThree" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Four:(id)sender
{
    WordThreeQT = 4;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree4"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsFour" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Five:(id)sender
{
    WordThreeQT = 5;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree5"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsFive" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Six:(id)sender
{
    WordThreeQT = 6;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree6"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsSix" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Seven:(id)sender
{
    WordThreeQT = 7;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree7"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsSeven" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eight:(id)sender
{
    WordThreeQT = 8;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree8"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsEight" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Nine:(id)sender
{
    WordThreeQT = 9;
    SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree9"];
    if (SavedWordsQT.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"3QuestionsNine" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SavedWordsQT rangeOfString:str].length == 2) {
                ScoreTQ++;
                WordIsAlreadyDoneTQ[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(void)preViewDidLoad
{
    [self GettingTheRightGrid];
    moverTQ = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjects) userInfo:nil repeats:YES];
    
    pOneTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pTwoTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pThreeTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pFourTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pSixTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pSevenTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pEightTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pNineTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDuration:1];
    
    [pFiveTQ setAlpha:1];
    [CheckTQ setAlpha:1];
    [TheCurrentWordTQ setAlpha:1];
    [PauseTQ setAlpha:1];
    [BarUnderWordTQ setAlpha:1];
    [TotalAmountTQ setAlpha:1];
    [SenderDisplayTQ setAlpha:1];
    [TheQuestionTQ setAlpha:1];
    [tHomeTQ setAlpha:0];
    
    [sOneTQ setAlpha:0];
    [sTwoTQ setAlpha:0];
    [sThreeTQ setAlpha:0];
    [sFourTQ setAlpha:0];
    [sFiveTQ setAlpha:0];
    [sSixTQ setAlpha:0];
    [sSevenTQ setAlpha:0];
    [sEightTQ setAlpha:0];
    [sNineTQ setAlpha:0];
    
    [gOneTQ setAlpha:0];
    [gTwoTQ setAlpha:0];
    [gThreeTQ setAlpha:0];
    [BBSelectionTQ setAlpha:0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.4];
    [UIView setAnimationDuration:1];
    pFourTQ.alpha = 1;
    pSixTQ.alpha = 1;
    
    pFourTQ.center = CGPointMake(ikFourTQ, iktFourTQ);
    pSixTQ.center = CGPointMake(ikSixTQ, iktSixTQ);
    
    pOneTQ.center = CGPointMake(ikFourTQ, iktFourTQ);
    pSevenTQ.center = CGPointMake(ikFourTQ, iktFourTQ);
    
    pTwoTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    pEightTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y);
    
    pThreeTQ.center = CGPointMake(ikSixTQ, iktSixTQ);
    pNineTQ.center = CGPointMake(ikSixTQ, iktSixTQ);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationDuration:1];
    pOneTQ.alpha = 1;
    pTwoTQ.alpha = 1;
    pThreeTQ.alpha = 1;
    
    pSevenTQ.alpha = 1;
    pEightTQ.alpha = 1;
    pNineTQ.alpha = 1;
    
    pOneTQ.center = CGPointMake(ikOneTQ, iktOneTQ);
    pSevenTQ.center = CGPointMake(ikSevenTQ, iktSevenTQ);
    
    pTwoTQ.center = CGPointMake(ikTwoTQ, iktTwoTQ);
    pEightTQ.center = CGPointMake(ikEightTQ, iktEightTQ);
    
    pThreeTQ.center = CGPointMake(ikThreeTQ, iktThreeTQ);
    pNineTQ.center = CGPointMake(ikNineTQ, iktNineTQ);
    [self Swipes];
    [UIView commitAnimations];
}

-(void)MovingTheObjects
{
    int a;
    a = 1;
    sOneTQ.center = CGPointMake(sOneTQ.center.x, sOneTQ.center.y - a);
    sTwoTQ.center = CGPointMake(sTwoTQ.center.x , sTwoTQ.center.y - a);
    sThreeTQ.center = CGPointMake(sThreeTQ.center.x , sThreeTQ.center.y - a);
    sFourTQ.center = CGPointMake(sFourTQ.center.x , sFourTQ.center.y - a);
    sFiveTQ.center = CGPointMake(sFiveTQ.center.x , sFiveTQ.center.y - a);
    sSixTQ.center = CGPointMake(sSixTQ.center.x , sSixTQ.center.y - a);
    sSevenTQ.center = CGPointMake(sSevenTQ.center.x , sSevenTQ.center.y - a);
    sEightTQ.center = CGPointMake(sEightTQ.center.x , sEightTQ.center.y - a);
    sNineTQ.center = CGPointMake(sNineTQ.center.x , sNineTQ.center.y - a);
    if (-155 >= sNineTQ.center.y) {
        [moverTQ invalidate];
        moverTQ = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
    
}

-(void)GameSettingUpForGrid
{
    [self GettingTheRightGrid];
}

-(void)GettingTheRightGrid
{
    switch (WordThreeQT) {
        case 1:
            cOneTQ = 'f';
            cTwoTQ = 'g';
            cThreeTQ = 'k';
            cFourTQ = 's';
            cFiveTQ = 'o';
            cSixTQ = 'i';
            cSevenTQ = 'r';
            cEightTQ = 'a';
            cNineTQ = 'h';
            
            pOneTQ.image = [UIImage imageNamed:@"F.png"];
            pTwoTQ.image = [UIImage imageNamed:@"G.png"];
            pThreeTQ.image = [UIImage imageNamed:@"K.png"];
            pFourTQ.image = [UIImage imageNamed:@"S.png"];
            pFiveTQ.image = [UIImage imageNamed:@"O.png"];
            pSixTQ.image = [UIImage imageNamed:@"I.png"];
            pSevenTQ.image = [UIImage imageNamed:@"R.png"];
            pEightTQ.image = [UIImage imageNamed:@"A.png"];
            pNineTQ.image = [UIImage imageNamed:@"H.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 4", ScoreTQ];
            TheQuestionTQ.text = @"TREES";
            break;
        case 2:
            cOneTQ = 'l';
            cTwoTQ = 'e';
            cThreeTQ = 'a';
            cFourTQ = 'r';
            cFiveTQ = 'g';
            cSixTQ = 'i';
            cSevenTQ = 'p';
            cEightTQ = 'h';
            cNineTQ = 'm';
            
            pOneTQ.image = [UIImage imageNamed:@"L.png"];
            pTwoTQ.image = [UIImage imageNamed:@"E.png"];
            pThreeTQ.image = [UIImage imageNamed:@"A.png"];
            pFourTQ.image = [UIImage imageNamed:@"R.png"];
            pFiveTQ.image = [UIImage imageNamed:@"G.png"];
            pSixTQ.image = [UIImage imageNamed:@"I.png"];
            pSevenTQ.image = [UIImage imageNamed:@"P.png"];
            pEightTQ.image = [UIImage imageNamed:@"H.png"];
            pNineTQ.image = [UIImage imageNamed:@"M.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 5", ScoreTQ];
            TheQuestionTQ.text = @"BODY PARTS";
            break;
        case 3:
            cOneTQ = 'o';
            cTwoTQ = 't';
            cThreeTQ = 'i';
            cFourTQ = 'x';
            cFiveTQ = 'w';
            cSixTQ = 'n';
            cSevenTQ = 'e';
            cEightTQ = 's';
            cNineTQ = 'h';
            
            pOneTQ.image = [UIImage imageNamed:@"O.png"];
            pTwoTQ.image = [UIImage imageNamed:@"T.png"];
            pThreeTQ.image = [UIImage imageNamed:@"I.png"];
            pFourTQ.image = [UIImage imageNamed:@"X.png"];
            pFiveTQ.image = [UIImage imageNamed:@"W.png"];
            pSixTQ.image = [UIImage imageNamed:@"N.png"];
            pSevenTQ.image = [UIImage imageNamed:@"E.png"];
            pEightTQ.image = [UIImage imageNamed:@"S.png"];
            pNineTQ.image = [UIImage imageNamed:@"H.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 4", ScoreTQ];
            TheQuestionTQ.text = @"NUMBERS";
            break;
        case 4:
            cOneTQ = 't';
            cTwoTQ = 'r';
            cThreeTQ = 'g';
            cFourTQ = 'i';
            cFiveTQ = 'u';
            cSixTQ = 'e';
            cSevenTQ = 'a';
            cEightTQ = 'm';
            cNineTQ = 'n';
            
            pOneTQ.image = [UIImage imageNamed:@"T.png"];
            pTwoTQ.image = [UIImage imageNamed:@"R.png"];
            pThreeTQ.image = [UIImage imageNamed:@"G.png"];
            pFourTQ.image = [UIImage imageNamed:@"I.png"];
            pFiveTQ.image = [UIImage imageNamed:@"U.png"];
            pSixTQ.image = [UIImage imageNamed:@"E.png"];
            pSevenTQ.image = [UIImage imageNamed:@"A.png"];
            pEightTQ.image = [UIImage imageNamed:@"M.png"];
            pNineTQ.image = [UIImage imageNamed:@"N.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 3", ScoreTQ];
            TheQuestionTQ.text = @"DRINK";
            break;
        case 5:
            cOneTQ = 'f';
            cTwoTQ = 'c';
            cThreeTQ = 'b';
            cFourTQ = 'w';
            cFiveTQ = 'a';
            cSixTQ = 'o';
            cSevenTQ = 'x';
            cEightTQ = 't';
            cNineTQ = 'u';
            
            pOneTQ.image = [UIImage imageNamed:@"F.png"];
            pTwoTQ.image = [UIImage imageNamed:@"C.png"];
            pThreeTQ.image = [UIImage imageNamed:@"B.png"];
            pFourTQ.image = [UIImage imageNamed:@"W.png"];
            pFiveTQ.image = [UIImage imageNamed:@"A.png"];
            pSixTQ.image = [UIImage imageNamed:@"O.png"];
            pSevenTQ.image = [UIImage imageNamed:@"X.png"];
            pEightTQ.image = [UIImage imageNamed:@"T.png"];
            pNineTQ.image = [UIImage imageNamed:@"U.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 5", ScoreTQ];
            TheQuestionTQ.text = @"ANIMALS";
            break;
        case 6:
            cOneTQ = 'v';
            cTwoTQ = 'c';
            cThreeTQ = 'u';
            cFourTQ = 's';
            cFiveTQ = 'r';
            cSixTQ = 'a';
            cSevenTQ = 'n';
            cEightTQ = 'b';
            cNineTQ = 'o';
            
            pOneTQ.image = [UIImage imageNamed:@"V.png"];
            pTwoTQ.image = [UIImage imageNamed:@"C.png"];
            pThreeTQ.image = [UIImage imageNamed:@"U.png"];
            pFourTQ.image = [UIImage imageNamed:@"S.png"];
            pFiveTQ.image = [UIImage imageNamed:@"R.png"];
            pSixTQ.image = [UIImage imageNamed:@"A.png"];
            pSevenTQ.image = [UIImage imageNamed:@"N.png"];
            pEightTQ.image = [UIImage imageNamed:@"B.png"];
            pNineTQ.image = [UIImage imageNamed:@"O.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 7", ScoreTQ];
            TheQuestionTQ.text = @"TRANSPORT";
            break;
        case 7:
            cOneTQ = 'f';
            cTwoTQ = 'p';
            cThreeTQ = 'y';
            cFourTQ = 'm';
            cFiveTQ = 'e';
            cSixTQ = 'i';
            cSevenTQ = 'g';
            cEightTQ = 'a';
            cNineTQ = 'h';
            
            pOneTQ.image = [UIImage imageNamed:@"F.png"];
            pTwoTQ.image = [UIImage imageNamed:@"P.png"];
            pThreeTQ.image = [UIImage imageNamed:@"Y.png"];
            pFourTQ.image = [UIImage imageNamed:@"M.png"];
            pFiveTQ.image = [UIImage imageNamed:@"E.png"];
            pSixTQ.image = [UIImage imageNamed:@"I.png"];
            pSevenTQ.image = [UIImage imageNamed:@"G.png"];
            pEightTQ.image = [UIImage imageNamed:@"A.png"];
            pNineTQ.image = [UIImage imageNamed:@"H.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 5", ScoreTQ];
            TheQuestionTQ.text = @"FOOD";
            break;
        case 8:
            cOneTQ = 'k';
            cTwoTQ = 'c';
            cThreeTQ = 'e';
            cFourTQ = 'l';
            cFiveTQ = 'd';
            cSixTQ = 'o';
            cSevenTQ = 'i';
            cEightTQ = 'e';
            cNineTQ = 'r';
            
            pOneTQ.image = [UIImage imageNamed:@"K.png"];
            pTwoTQ.image = [UIImage imageNamed:@"C.png"];
            pThreeTQ.image = [UIImage imageNamed:@"E.png"];
            pFourTQ.image = [UIImage imageNamed:@"L.png"];
            pFiveTQ.image = [UIImage imageNamed:@"D.png"];
            pSixTQ.image = [UIImage imageNamed:@"O.png"];
            pSevenTQ.image = [UIImage imageNamed:@"I.png"];
            pEightTQ.image = [UIImage imageNamed:@"E.png"];
            pNineTQ.image = [UIImage imageNamed:@"R.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 5", ScoreTQ];
            TheQuestionTQ.text = @"FISH";
            break;
        case 9:
            cOneTQ = 'o';
            cTwoTQ = 'h';
            cThreeTQ = 'm';
            cFourTQ = 'u';
            cFiveTQ = 'e';
            cSixTQ = 'w';
            cSevenTQ = 'l';
            cEightTQ = 'n';
            cNineTQ = 'a';
            
            pOneTQ.image = [UIImage imageNamed:@"O.png"];
            pTwoTQ.image = [UIImage imageNamed:@"H.png"];
            pThreeTQ.image = [UIImage imageNamed:@"M.png"];
            pFourTQ.image = [UIImage imageNamed:@"U.png"];
            pFiveTQ.image = [UIImage imageNamed:@"E.png"];
            pSixTQ.image = [UIImage imageNamed:@"W.png"];
            pSevenTQ.image = [UIImage imageNamed:@"L.png"];
            pEightTQ.image = [UIImage imageNamed:@"N.png"];
            pNineTQ.image = [UIImage imageNamed:@"A.png"];
            
            TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF 4", ScoreTQ];
            TheQuestionTQ.text = @"BIRDS";
            break;
        default:
            break;
    }
    
    [self GetTheWord];
    
    iLeftTQ = ikTwoTQ - ikOneTQ;
    iUpTQ = iktOneTQ - iktFiveTQ;
}

-(void)Swipes
{
    PanningSensitivityTQ = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneTQ.userInteractionEnabled = YES;
    [pOneTQ addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoTQ.userInteractionEnabled = YES;
    [pTwoTQ addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeTQ.userInteractionEnabled = YES;
    [pThreeTQ addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourTQ.userInteractionEnabled = YES;
    [pFourTQ addGestureRecognizer:panFour];
    
    UIPanGestureRecognizer *panFive = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FivePan:)];
    pFiveTQ.userInteractionEnabled = YES;
    [pFiveTQ addGestureRecognizer:panFive];
    
    UIPanGestureRecognizer *panSix = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixPan:)];
    pSixTQ.userInteractionEnabled = YES;
    [pSixTQ addGestureRecognizer:panSix];
    
    UIPanGestureRecognizer *panSeven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SevenPan:)];
    pSevenTQ.userInteractionEnabled = YES;
    [pSevenTQ addGestureRecognizer:panSeven];
    
    UIPanGestureRecognizer *panEight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(EightPan:)];
    pEightTQ.userInteractionEnabled = YES;
    [pEightTQ addGestureRecognizer:panEight];
    
    UIPanGestureRecognizer *panNine = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(NinePan:)];
    pNineTQ.userInteractionEnabled = YES;
    [pNineTQ addGestureRecognizer:panNine];
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 1;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)FivePan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 5;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixPan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 6;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)SevenPan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 7;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)EightPan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 8;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
            PreviousTQ = 2;
            [self Horizontal];
        }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

-(void)NinePan: (UIPanGestureRecognizer *)sender
{
    distanceTQ = [sender translationInView:self.view];
    PanningIntTQ++;
    PPanningMethodTQ = 9;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 1) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Verticle];
            PanningIntTQ = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTQ == 2) {
        if (PanningIntTQ == PanningSensitivityTQ) {
            [self Horizontal];
            PanningIntTQ = 0;
        }
    } else if (distanceTQ.x > 0 || distanceTQ.x < 0) {
        if ((distanceTQ.y > 0 || distanceTQ.y < 0) && ((distanceTQ.x > 0 && distanceTQ.x < 10) || (distanceTQ.x < 0 && distanceTQ.x > -10))) {
            PreviousTQ = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTQ = 1;
        }
    } else if (distanceTQ.y > 0 || distanceTQ.y < 0) {
        PreviousTQ = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTQ = 0;
        PreviousTQ = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneTQ = pOneTQ.center.x;
    yOneTQ = pOneTQ.center.y;
    xTwoTQ = pTwoTQ.center.x;
    yTwoTQ = pTwoTQ.center.y;
    xThreeTQ = pThreeTQ.center.x;
    yThreeTQ = pThreeTQ.center.y;
    xFourTQ = pFourTQ.center.x;
    yFourTQ = pFourTQ.center.y;
    xFiveTQ = pFiveTQ.center.x;
    yFiveTQ = pFiveTQ.center.y;
    xSixTQ = pSixTQ.center.x;
    ySixTQ = pSixTQ.center.y;
    ySevenTQ = pSevenTQ.center.y;
    xSevenTQ = pSevenTQ.center.x;
    xEightTQ = pEightTQ.center.x;
    yEightTQ = pEightTQ.center.y;
    yNineTQ = pNineTQ.center.y;
    xNineTQ = pNineTQ.center.x;
    
    switch (PPanningMethodTQ) {
        case 1:
            pointOfIntrestTQ = pOneTQ.center.x;
            break;
        case 2:
            pointOfIntrestTQ = pTwoTQ.center.x;
            break;
        case 3:
            pointOfIntrestTQ = pThreeTQ.center.x;
            break;
        case 4:
            pointOfIntrestTQ = pFourTQ.center.x;
            break;
        case 5:
            pointOfIntrestTQ = pFiveTQ.center.x;
            break;
        case 6:
            pointOfIntrestTQ = pSixTQ.center.x;
            break;
        case 7:
            pointOfIntrestTQ = pSevenTQ.center.x;
            break;
        case 8:
            pointOfIntrestTQ = pEightTQ.center.x;
            break;
        case 9:
            pointOfIntrestTQ = pNineTQ.center.x;
            break;
        default:
            break;
    }
    
    if (distanceTQ.y < 0) {
        
        if (pointOfIntrestTQ == pOneTQ.center.x) {
            pOneTQ.center = CGPointMake(pOneTQ.center.x, pOneTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pTwoTQ.center.x) {
            pTwoTQ.center = CGPointMake(pTwoTQ.center.x, pTwoTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pThreeTQ.center.x) {
            pThreeTQ.center = CGPointMake(pThreeTQ.center.x , pThreeTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pFourTQ.center.x) {
            pFourTQ.center = CGPointMake(pFourTQ.center.x, pFourTQ.center.y - iLeftTQ);
        }
        if (pFiveTQ.center.x == pointOfIntrestTQ) {
            pFiveTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pSixTQ.center.x) {
            pSixTQ.center = CGPointMake(pSixTQ.center.x , pSixTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pSevenTQ.center.x) {
            pSevenTQ.center = CGPointMake(pSevenTQ.center.x , pSevenTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pEightTQ.center.x) {
            pEightTQ.center = CGPointMake(pEightTQ.center.x , pEightTQ.center.y - iLeftTQ);
        }
        if (pointOfIntrestTQ == pNineTQ.center.x) {
            pNineTQ.center = CGPointMake(pNineTQ.center.x, pNineTQ.center.y - iLeftTQ);
        }
    } else if (distanceTQ.y > 0) {
        
        if (pointOfIntrestTQ == pOneTQ.center.x) {
            pOneTQ.center = CGPointMake(pOneTQ.center.x, pOneTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pTwoTQ.center.x) {
            pTwoTQ.center = CGPointMake(pTwoTQ.center.x, pTwoTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pThreeTQ.center.x) {
            pThreeTQ.center = CGPointMake(pThreeTQ.center.x , pThreeTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pFourTQ.center.x) {
            pFourTQ.center = CGPointMake(pFourTQ.center.x, pFourTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pFiveTQ.center.x) {
            pFiveTQ.center = CGPointMake(pFiveTQ.center.x, pFiveTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pSixTQ.center.x) {
            pSixTQ.center = CGPointMake(pSixTQ.center.x , pSixTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pSevenTQ.center.x) {
            pSevenTQ.center = CGPointMake(pSevenTQ.center.x , pSevenTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pEightTQ.center.x) {
            pEightTQ.center = CGPointMake(pEightTQ.center.x , pEightTQ.center.y+ iLeftTQ);
        }
        if (pointOfIntrestTQ == pNineTQ.center.x) {
            pNineTQ.center = CGPointMake(pNineTQ.center.x, pNineTQ.center.y+ iLeftTQ);
        }
    }
    
    if (pOneTQ.center.x != pointOfIntrestTQ) {
        pOneTQ.alpha = 1;
        pOneTQ.hidden = NO;
        pOneTQ.center = CGPointMake(xOneTQ, yOneTQ);
    }
    if (pTwoTQ.center.x != pointOfIntrestTQ) {
        pTwoTQ.alpha = 1;
        pTwoTQ.hidden = NO;
        pTwoTQ.center = CGPointMake(xTwoTQ, yTwoTQ);
    }
    if (pThreeTQ.center.x != pointOfIntrestTQ) {
        pThreeTQ.alpha = 1;
        pThreeTQ.hidden = NO;
        pThreeTQ.center = CGPointMake(xThreeTQ, yThreeTQ);
    }
    if (pFourTQ.center.x != pointOfIntrestTQ) {
        pFourTQ.alpha = 1;
        pFourTQ.hidden = NO;
        pFourTQ.center = CGPointMake(xFourTQ, yFourTQ);
    }
    if (pFiveTQ.center.x != pointOfIntrestTQ) {
        pFiveTQ.alpha = 1;
        pFiveTQ.hidden = NO;
        pFiveTQ.center = CGPointMake(xFiveTQ, yFiveTQ);
    }
    if (pSixTQ.center.x != pointOfIntrestTQ) {
        pSixTQ.alpha = 1;
        pSixTQ.hidden = NO;
        pSixTQ.center = CGPointMake(xSixTQ, ySixTQ);
    }
    if (pSevenTQ.center.x != pointOfIntrestTQ) {
        pSevenTQ.alpha = 1;
        pSevenTQ.hidden = NO;
        pSevenTQ.center = CGPointMake(xSevenTQ, ySevenTQ);
    }
    if (pEightTQ.center.x != pointOfIntrestTQ) {
        pEightTQ.alpha = 1;
        pEightTQ.hidden = NO;
        pEightTQ.center = CGPointMake(xEightTQ, yEightTQ);
    }
    if (pNineTQ.center.x != pointOfIntrestTQ) {
        pNineTQ.alpha = 1;
        pNineTQ.hidden = NO;
        pNineTQ.center = CGPointMake(xNineTQ, yNineTQ);
    }
    
    if (pOneTQ.center.y > iktNineTQ) {
        pOneTQ.center = CGPointMake(pOneTQ.center.x, iktOneTQ);
    }
    if (pTwoTQ.center.y > iktNineTQ) {
        pTwoTQ.center = CGPointMake(pTwoTQ.center.x, iktOneTQ);
    }
    if (pThreeTQ.center.y > iktNineTQ) {
        pThreeTQ.center = CGPointMake(pThreeTQ.center.x, iktOneTQ);
    }
    if (pFourTQ.center.y > iktNineTQ) {
        pFourTQ.center = CGPointMake(pFourTQ.center.x,iktOneTQ );
    }
    if (pFiveTQ.center.y > iktNineTQ) {
        pFiveTQ.center = CGPointMake(pFiveTQ.center.x, iktOneTQ);
    }
    if (pSixTQ.center.y > iktNineTQ) {
        pSixTQ.center = CGPointMake(pSixTQ.center.x, iktOneTQ);
    }
    if (pSevenTQ.center.y > iktNineTQ) {
        pSevenTQ.center = CGPointMake(pSevenTQ.center.x, iktOneTQ);
    }
    if (pEightTQ.center.y > iktNineTQ) {
        pEightTQ.center = CGPointMake(pEightTQ.center.x, iktOneTQ);
    }
    if (pNineTQ.center.y > iktNineTQ) {
        pNineTQ.center = CGPointMake(pNineTQ.center.x, iktOneTQ);
    }
    
    if (pOneTQ.center.y < iktOneTQ) {
        pOneTQ.center = CGPointMake(pOneTQ.center.x, iktNineTQ);
    }
    if (pTwoTQ.center.y < iktOneTQ) {
        pTwoTQ.center = CGPointMake(pTwoTQ.center.x, iktNineTQ);
    }
    if (pThreeTQ.center.y < iktOneTQ) {
        pThreeTQ.center = CGPointMake(pThreeTQ.center.x, iktNineTQ);
    }
    if (pFourTQ.center.y < iktOneTQ) {
        pFourTQ.center = CGPointMake(pFourTQ.center.x, iktNineTQ);
    }
    if (pFiveTQ.center.y < iktOneTQ) {
        pFiveTQ.center = CGPointMake(pFiveTQ.center.x, iktNineTQ);
    }
    if (pSixTQ.center.y < iktOneTQ) {
        pSixTQ.center = CGPointMake(pSixTQ.center.x, iktNineTQ);
    }
    if (pSevenTQ.center.y < iktOneTQ) {
        pSevenTQ.center = CGPointMake(pSevenTQ.center.x, iktNineTQ);
    }
    if (pEightTQ.center.y < iktOneTQ) {
        pEightTQ.center = CGPointMake(pEightTQ.center.x, iktNineTQ);
    }
    if (pNineTQ.center.y < iktOneTQ) {
        pNineTQ.center = CGPointMake(pNineTQ.center.x, iktNineTQ);
    }
}

-(void)Verticle
{
    xOneTQ = pOneTQ.center.x;
    yOneTQ = pOneTQ.center.y;
    xTwoTQ = pTwoTQ.center.x;
    yTwoTQ = pTwoTQ.center.y;
    xThreeTQ = pThreeTQ.center.x;
    yThreeTQ = pThreeTQ.center.y;
    xFourTQ = pFourTQ.center.x;
    yFourTQ = pFourTQ.center.y;
    xFiveTQ = pFiveTQ.center.x;
    yFiveTQ = pFiveTQ.center.y;
    xSixTQ = pSixTQ.center.x;
    ySixTQ = pSixTQ.center.y;
    ySevenTQ = pSevenTQ.center.y;
    xSevenTQ = pSevenTQ.center.x;
    xEightTQ = pEightTQ.center.x;
    yEightTQ = pEightTQ.center.y;
    yNineTQ = pNineTQ.center.y;
    xNineTQ = pNineTQ.center.x;
    
    switch (PPanningMethodTQ) {
        case 1:
            pointOfIntrestTQ = pOneTQ.center.y;
            break;
        case 2:
            pointOfIntrestTQ = pTwoTQ.center.y;
            break;
        case 3:
            pointOfIntrestTQ = pThreeTQ.center.y;
            break;
        case 4:
            pointOfIntrestTQ = pFourTQ.center.y;
            break;
        case 5:
            pointOfIntrestTQ = pFiveTQ.center.y;
            break;
        case 6:
            pointOfIntrestTQ = pSixTQ.center.y;
            break;
        case 7:
            pointOfIntrestTQ = pSevenTQ.center.y;
            break;
        case 8:
            pointOfIntrestTQ = pEightTQ.center.y;
            break;
        case 9:
            pointOfIntrestTQ = pNineTQ.center.y;
            break;
        default:
            break;
    }
    
    if (distanceTQ.x > 0) {
        
        if (pointOfIntrestTQ == pOneTQ.center.y) {
            pOneTQ.center = CGPointMake(pOneTQ.center.x + iLeftTQ, pOneTQ.center.y);
        }
        if (pointOfIntrestTQ == pTwoTQ.center.y) {
            pTwoTQ.center = CGPointMake(pTwoTQ.center.x + iLeftTQ, pTwoTQ.center.y);
        }
        if (pointOfIntrestTQ == pThreeTQ.center.y) {
            pThreeTQ.center = CGPointMake(pThreeTQ.center.x + iLeftTQ, pThreeTQ.center.y);
        }
        if (pointOfIntrestTQ == pFourTQ.center.y) {
            pFourTQ.center = CGPointMake(pFourTQ.center.x + iLeftTQ, pFourTQ.center.y);
        }
        if (pointOfIntrestTQ == pFiveTQ.center.y) {
            pFiveTQ.center = CGPointMake(pFiveTQ.center.x + iLeftTQ, pFiveTQ.center.y);
        }
        if (pointOfIntrestTQ == pSixTQ.center.y) {
            pSixTQ.center = CGPointMake(pSixTQ.center.x + iLeftTQ, pSixTQ.center.y);
        }
        if (pointOfIntrestTQ == pSevenTQ.center.y) {
            pSevenTQ.center = CGPointMake(pSevenTQ.center.x + iLeftTQ, pSevenTQ.center.y);
        }
        if (pointOfIntrestTQ == pEightTQ.center.y) {
            pEightTQ.center = CGPointMake(pEightTQ.center.x + iLeftTQ, pEightTQ.center.y);
        }
        if (pointOfIntrestTQ == pNineTQ.center.y) {
            pNineTQ.center = CGPointMake(pNineTQ.center.x + iLeftTQ, pNineTQ.center.y);
        }
        
    } else if (distanceTQ.x < 0) {
        
        if (pointOfIntrestTQ == pOneTQ.center.y) {
            pOneTQ.center = CGPointMake(pOneTQ.center.x - iLeftTQ, pOneTQ.center.y);
        }
        if (pointOfIntrestTQ == pTwoTQ.center.y) {
            pTwoTQ.center = CGPointMake(pTwoTQ.center.x - iLeftTQ, pTwoTQ.center.y);
        }
        if (pointOfIntrestTQ == pThreeTQ.center.y) {
            pThreeTQ.center = CGPointMake(pThreeTQ.center.x - iLeftTQ, pThreeTQ.center.y);
        }
        if (pointOfIntrestTQ == pFourTQ.center.y) {
            pFourTQ.center = CGPointMake(pFourTQ.center.x - iLeftTQ, pFourTQ.center.y);
        }
        if (pointOfIntrestTQ == pFiveTQ.center.y) {
            pFiveTQ.center = CGPointMake(pFiveTQ.center.x - iLeftTQ, pFiveTQ.center.y);
        }
        if (pointOfIntrestTQ == pSixTQ.center.y) {
            pSixTQ.center = CGPointMake(pSixTQ.center.x - iLeftTQ, pSixTQ.center.y);
        }
        if (pointOfIntrestTQ == pSevenTQ.center.y) {
            pSevenTQ.center = CGPointMake(pSevenTQ.center.x - iLeftTQ, pSevenTQ.center.y);
        }
        if (pointOfIntrestTQ == pEightTQ.center.y) {
            pEightTQ.center = CGPointMake(pEightTQ.center.x - iLeftTQ, pEightTQ.center.y);
        }
        if (pointOfIntrestTQ == pNineTQ.center.y) {
            pNineTQ.center = CGPointMake(pNineTQ.center.x - iLeftTQ, pNineTQ.center.y);
        }
    }
    
    if (pOneTQ.center.y != pointOfIntrestTQ) {
        pOneTQ.alpha = 1;
        pOneTQ.hidden = NO;
        pOneTQ.center = CGPointMake(xOneTQ, yOneTQ);
    }
    if (pTwoTQ.center.y != pointOfIntrestTQ) {
        pTwoTQ.alpha = 1;
        pTwoTQ.hidden = NO;
        pTwoTQ.center = CGPointMake(xTwoTQ, yTwoTQ);
    }
    if (pThreeTQ.center.y != pointOfIntrestTQ) {
        pThreeTQ.alpha = 1;
        pThreeTQ.hidden = NO;
        pThreeTQ.center = CGPointMake(xThreeTQ, yThreeTQ);
    }
    if (pFourTQ.center.y != pointOfIntrestTQ) {
        pFourTQ.alpha = 1;
        pFourTQ.hidden = NO;
        pFourTQ.center = CGPointMake(xFourTQ, yFourTQ);
    }
    if (pFiveTQ.center.y != pointOfIntrestTQ) {
        pFiveTQ.alpha = 1;
        pFiveTQ.hidden = NO;
        pFiveTQ.center = CGPointMake(xFiveTQ, yFiveTQ);
    }
    if (pSixTQ.center.y != pointOfIntrestTQ) {
        pSixTQ.alpha = 1;
        pSixTQ.hidden = NO;
        pSixTQ.center = CGPointMake(xSixTQ, ySixTQ);
    }
    if (pSevenTQ.center.y != pointOfIntrestTQ) {
        pSevenTQ.alpha = 1;
        pSevenTQ.hidden = NO;
        pSevenTQ.center = CGPointMake(xSevenTQ, ySevenTQ);
    }
    if (pEightTQ.center.y != pointOfIntrestTQ) {
        pEightTQ.alpha = 1;
        pEightTQ.hidden = NO;
        pEightTQ.center = CGPointMake(xEightTQ, yEightTQ);
    }
    if (pNineTQ.center.y != pointOfIntrestTQ) {
        pNineTQ.alpha = 1;
        pNineTQ.hidden = NO;
        pNineTQ.center = CGPointMake(xNineTQ, yNineTQ);
    }
    
    if (pOneTQ.center.x < ikOneTQ) {
        pOneTQ.center = CGPointMake(ikThreeTQ, pOneTQ.center.y);
    }
    if (pTwoTQ.center.x < ikOneTQ) {
        pTwoTQ.center = CGPointMake(ikThreeTQ, pTwoTQ.center.y);
    }
    if (pThreeTQ.center.x < ikOneTQ) {
        pThreeTQ.center = CGPointMake(ikThreeTQ, pThreeTQ.center.y);
    }
    if (pFourTQ.center.x < ikOneTQ) {
        pFourTQ.center = CGPointMake(ikThreeTQ, pFourTQ.center.y);
    }
    if (pFiveTQ.center.x < ikOneTQ) {
        pFiveTQ.center = CGPointMake(ikThreeTQ, pFiveTQ.center.y);
    }
    if (pSixTQ.center.x < ikOneTQ) {
        pSixTQ.center = CGPointMake(ikThreeTQ, pSixTQ.center.y);
    }
    if (pSevenTQ.center.x < ikOneTQ) {
        pSevenTQ.center = CGPointMake(ikThreeTQ, pSevenTQ.center.y);
    }
    if (pEightTQ.center.x < ikOneTQ) {
        pEightTQ.center = CGPointMake(ikThreeTQ, pEightTQ.center.y);
    }
    if (pNineTQ.center.x < ikOneTQ) {
        pNineTQ.center = CGPointMake(ikThreeTQ, pNineTQ.center.y);
    }
    
    if (pOneTQ.center.x > ikThreeTQ) {
        pOneTQ.center = CGPointMake(ikOneTQ, pOneTQ.center.y);
    }
    if (pTwoTQ.center.x > ikThreeTQ) {
        pTwoTQ.center = CGPointMake(ikOneTQ, pTwoTQ.center.y);
    }
    if (pThreeTQ.center.x > ikThreeTQ) {
        pThreeTQ.center = CGPointMake(ikOneTQ, pThreeTQ.center.y);
    }
    if (pFourTQ.center.x > ikThreeTQ) {
        pFourTQ.center = CGPointMake(ikOneTQ, pFourTQ.center.y);
    }
    if (pFiveTQ.center.x > ikThreeTQ) {
        pFiveTQ.center = CGPointMake(ikOneTQ, pFiveTQ.center.y);
    }
    if (pSixTQ.center.x > ikThreeTQ) {
        pSixTQ.center = CGPointMake(ikOneTQ, pSixTQ.center.y);
    }
    if (pSevenTQ.center.x > ikThreeTQ) {
        pSevenTQ.center = CGPointMake(ikOneTQ, pSevenTQ.center.y);
    }
    if (pEightTQ.center.x > ikThreeTQ) {
        pEightTQ.center = CGPointMake(ikOneTQ, pEightTQ.center.y);
    }
    if (pNineTQ.center.x > ikThreeTQ) {
        pNineTQ.center = CGPointMake(ikOneTQ, pNineTQ.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SwipeSoundTQ play];
    [self GetTheWord];
}

-(IBAction)IsItAWaord
{
    
    NSString *path;
    int TheAmount = 0;
    switch (WordThreeQT) {
        case 1:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsOne" ofType:@"plist"];
            TheAmount = 4;
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsTwo" ofType:@"plist"];
            TheAmount = 5;
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsThree" ofType:@"plist"];
            TheAmount = 4;
            break;
        case 4:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsFour" ofType:@"plist"];
            TheAmount = 3;
            break;
        case 5:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsFive" ofType:@"plist"];
            TheAmount = 5;
            break;
        case 6:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsSix" ofType:@"plist"];
            TheAmount = 7;
            break;
        case 7:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsSeven" ofType:@"plist"];
            TheAmount = 5;
            break;
        case 8:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsEight" ofType:@"plist"];
            TheAmount = 5;
            break;
        case 9:
            path = [[NSBundle mainBundle] pathForResource:@"3QuestionsNine" ofType:@"plist"];
            TheAmount = 4;
            break;
        default:
            break;
    }
    
    int i = 0;
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2) {
        @autoreleasepool {
            i++;
            if ([str isEqual:WordTQ] && WordIsAlreadyDoneTQ[i] == NO) {
                WordIsAlreadyDoneTQ[i] = YES;
                ScoreTQ = ScoreTQ + 1;
                TotalAmountTQ.text = [NSString stringWithFormat:@"%i OF  %i", ScoreTQ, TheAmount];
                SavedWordsQT = [NSString stringWithFormat:@"%@ %@", SavedWordsQT, str];
            }
        }
        
    }
    
    if (WordThreeQT == 1) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree1"];
    } else if (WordThreeQT == 2) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree2"];
    } else if (WordThreeQT == 3) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree3"];
    } else if (WordThreeQT == 4) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree4"];
    } else if (WordThreeQT == 5) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree5"];
    } else if (WordThreeQT == 6) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree6"];
    } else if (WordThreeQT == 7) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree7"];
    } else if (WordThreeQT == 8) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree8"];
    } else if (WordThreeQT == 9) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree9"];
    }
    
    if (ScoreTQ == TheAmount) {
        [self PlayAnimation];
    }
    
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    switch (WordThreeQT) {
        case 1:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree1"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree1"];
            break;
        case 2:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree2"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree2"];
            break;
        case 3:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree3"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree3"];
            break;
        case 4:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree4"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree4"];
            break;
        case 5:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree5"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree5"];
            break;
        case 6:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree6"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree6"];
            break;
        case 7:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree7"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree7"];
            break;
        case 8:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree8"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree8"];
            break;
        case 9:
            SavedWordsQT = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionThree9"];
            SavedWordsQT = @"";
            [[NSUserDefaults standardUserDefaults] setObject:SavedWordsQT forKey:@"SavedTheGridsForQuestionThree9"];
            break;
        default:
            break;
    }

    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        TileOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTQ.center.x - 75, pOneTQ.center.y - 75, pOneTQ.bounds.size.width, pOneTQ.bounds.size.height)];
        TileTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTQ.center.x-75, pTwoTQ.center.y-75, pTwoTQ.bounds.size.width, pTwoTQ.bounds.size.height)];
        TileThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTQ.center.x-75, pThreeTQ.center.y-75, pThreeTQ.bounds.size.width, pThreeTQ.bounds.size.height)];
        TileFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTQ.center.x-75, pFourTQ.center.y-75, pFourTQ.bounds.size.width, pFourTQ.bounds.size.height)];
        TileFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTQ.center.x-75, pFiveTQ.center.y-75, pFiveTQ.bounds.size.width, pFiveTQ.bounds.size.height)];
        TileSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTQ.center.x-75, pSixTQ.center.y-75, pSixTQ.bounds.size.width, pSixTQ.bounds.size.height)];
        TileSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTQ.center.x-75, pSevenTQ.center.y-75, pSevenTQ.bounds.size.width, pSevenTQ.bounds.size.height)];
        TileEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTQ.center.x-75, pEightTQ.center.y-75, pEightTQ.bounds.size.width, pEightTQ.bounds.size.height)];
        TileNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTQ.center.x-75, pNineTQ.center.y-75, pNineTQ.bounds.size.width, pNineTQ.bounds.size.height)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            TileOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTQ.center.x - 50, pOneTQ.center.y - 50, pOneTQ.bounds.size.width, pOneTQ.bounds.size.height)];
            TileTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTQ.center.x-50, pTwoTQ.center.y-50, pTwoTQ.bounds.size.width, pTwoTQ.bounds.size.height)];
            TileThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTQ.center.x-50, pThreeTQ.center.y-50, pThreeTQ.bounds.size.width, pThreeTQ.bounds.size.height)];
            TileFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTQ.center.x-50, pFourTQ.center.y-50, pFourTQ.bounds.size.width, pFourTQ.bounds.size.height)];
            TileFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTQ.center.x-50, pFiveTQ.center.y-50, pFiveTQ.bounds.size.width, pFiveTQ.bounds.size.height)];
            TileSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTQ.center.x-50, pSixTQ.center.y-50, pSixTQ.bounds.size.width, pSixTQ.bounds.size.height)];
            TileSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTQ.center.x-50, pSevenTQ.center.y-50, pSevenTQ.bounds.size.width, pSevenTQ.bounds.size.height)];
            TileEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTQ.center.x-50, pEightTQ.center.y-50, pEightTQ.bounds.size.width, pEightTQ.bounds.size.height)];
            TileNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTQ.center.x-50, pNineTQ.center.y-50, pNineTQ.bounds.size.width, pNineTQ.bounds.size.height)];

            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            
            TileOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTQ.center.x - 55, pOneTQ.center.y - 55, pOneTQ.bounds.size.width, pOneTQ.bounds.size.height)];
            TileTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTQ.center.x-55, pTwoTQ.center.y-55, pTwoTQ.bounds.size.width, pTwoTQ.bounds.size.height)];
            TileThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTQ.center.x-55, pThreeTQ.center.y-55, pThreeTQ.bounds.size.width, pThreeTQ.bounds.size.height)];
            TileFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTQ.center.x-55, pFourTQ.center.y-55, pFourTQ.bounds.size.width, pFourTQ.bounds.size.height)];
            TileFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTQ.center.x-55, pFiveTQ.center.y-55, pFiveTQ.bounds.size.width, pFiveTQ.bounds.size.height)];
            TileSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTQ.center.x-55, pSixTQ.center.y-55, pSixTQ.bounds.size.width, pSixTQ.bounds.size.height)];
            TileSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTQ.center.x-55, pSevenTQ.center.y-55, pSevenTQ.bounds.size.width, pSevenTQ.bounds.size.height)];
            TileEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTQ.center.x-55, pEightTQ.center.y-55, pEightTQ.bounds.size.width, pEightTQ.bounds.size.height)];
            TileNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTQ.center.x-5, pNineTQ.center.y-55, pNineTQ.bounds.size.width, pNineTQ.bounds.size.height)];

        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            TileOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTQ.center.x - 58, pOneTQ.center.y - 58, pOneTQ.bounds.size.width, pOneTQ.bounds.size.height)];
            TileTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTQ.center.x-58, pTwoTQ.center.y-58, pTwoTQ.bounds.size.width, pTwoTQ.bounds.size.height)];
            TileThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTQ.center.x-58, pThreeTQ.center.y-58, pThreeTQ.bounds.size.width, pThreeTQ.bounds.size.height)];
            TileFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTQ.center.x-58, pFourTQ.center.y-58, pFourTQ.bounds.size.width, pFourTQ.bounds.size.height)];
            TileFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTQ.center.x-58, pFiveTQ.center.y-58, pFiveTQ.bounds.size.width, pFiveTQ.bounds.size.height)];
            TileSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTQ.center.x-58, pSixTQ.center.y-58, pSixTQ.bounds.size.width, pSixTQ.bounds.size.height)];
            TileSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTQ.center.x-58, pSevenTQ.center.y-58, pSevenTQ.bounds.size.width, pSevenTQ.bounds.size.height)];
            TileEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTQ.center.x-58, pEightTQ.center.y-58, pEightTQ.bounds.size.width, pEightTQ.bounds.size.height)];
            TileNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTQ.center.x-58, pNineTQ.center.y-58, pNineTQ.bounds.size.width, pNineTQ.bounds.size.height)];

        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            TileOneTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTQ.center.x - 60, pOneTQ.center.y - 60, pOneTQ.bounds.size.width, pOneTQ.bounds.size.height)];
            TileTwoTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTQ.center.x-60, pTwoTQ.center.y-60, pTwoTQ.bounds.size.width, pTwoTQ.bounds.size.height)];
            TileThreeTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTQ.center.x-60, pThreeTQ.center.y-60, pThreeTQ.bounds.size.width, pThreeTQ.bounds.size.height)];
            TileFourTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTQ.center.x-60, pFourTQ.center.y-60, pFourTQ.bounds.size.width, pFourTQ.bounds.size.height)];
            TileFiveTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTQ.center.x-60, pFiveTQ.center.y-60, pFiveTQ.bounds.size.width, pFiveTQ.bounds.size.height)];
            TileSixTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTQ.center.x-60, pSixTQ.center.y-60, pSixTQ.bounds.size.width, pSixTQ.bounds.size.height)];
            TileSevenTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTQ.center.x-60, pSevenTQ.center.y-60, pSevenTQ.bounds.size.width, pSevenTQ.bounds.size.height)];
            TileEightTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTQ.center.x-60, pEightTQ.center.y-60, pEightTQ.bounds.size.width, pEightTQ.bounds.size.height)];
            TileNineTQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTQ.center.x-60, pNineTQ.center.y-60, pNineTQ.bounds.size.width, pNineTQ.bounds.size.height)];

        }
    }
    
    TileOneTQ.backgroundColor = [UIColor whiteColor];
    TileTwoTQ.backgroundColor = [UIColor whiteColor];
    TileThreeTQ.backgroundColor = [UIColor whiteColor];
    TileFourTQ.backgroundColor = [UIColor whiteColor];
    TileFiveTQ.backgroundColor = [UIColor whiteColor];
    TileSixTQ.backgroundColor = [UIColor whiteColor];
    TileSevenTQ.backgroundColor = [UIColor whiteColor];
    TileEightTQ.backgroundColor = [UIColor whiteColor];
    TileNineTQ.backgroundColor = [UIColor whiteColor];
    
    TileOneTQ.alpha = 0;
    TileTwoTQ.alpha = 0;
    TileThreeTQ.alpha = 0;
    TileFourTQ.alpha = 0;
    TileFiveTQ.alpha = 0;
    TileSixTQ.alpha = 0;
    TileSevenTQ.alpha = 0;
    TileEightTQ.alpha = 0;
    TileNineTQ.alpha = 0;
    
    [self.view addSubview:TileOneTQ];
    [self.view addSubview:TileTwoTQ];
    [self.view addSubview:TileThreeTQ];
    [self.view addSubview:TileFourTQ];
    [self.view addSubview:TileFiveTQ];
    [self.view addSubview:TileSixTQ];
    [self.view addSubview:TileSevenTQ];
    [self.view addSubview:TileEightTQ];
    [self.view addSubview:TileNineTQ];
    
    TileOneTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneTQ.alpha = 1;
    TileOneTQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoTQ.alpha = 1;
    TileTwoTQ.transform = CGAffineTransformMakeScale(1, 1);
    TileFourTQ.alpha = 1;
    TileFourTQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileThreeTQ.alpha = 1;
    TileThreeTQ.transform = CGAffineTransformMakeScale(1, 1);
    TileFiveTQ.alpha = 1;
    TileFiveTQ.transform = CGAffineTransformMakeScale(1, 1);
    TileSevenTQ.alpha = 1;
    TileSevenTQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileSixTQ.alpha = 1;
    TileSixTQ.transform = CGAffineTransformMakeScale(1, 1);
    TileEightTQ.alpha = 1;
    TileEightTQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileNineTQ.alpha = 1;
    TileNineTQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordTQ.alpha = 0;
    TheQuestionTQ.alpha = 0;
    TheCurrentWordTQ.alpha = 0;
    SenderDisplayTQ.alpha = 0;
    PauseTQ.alpha = 0;
    CheckTQ.alpha = 0;
    pOneTQ.alpha = 0;
    pTwoTQ.alpha = 0;
    pThreeTQ.alpha = 0;
    pFourTQ.alpha = 0;
    pFiveTQ.alpha = 0;
    pSixTQ.alpha = 0;
    pSevenTQ.alpha = 0;
    pEightTQ.alpha = 0;
    pNineTQ.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountTQ.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountTQ.alpha = 0;
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
    [TileOneTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFiveTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSevenTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEightTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileNineTQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileFiveTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileSevenTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileEightTQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineTQ.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileFourTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileFiveTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileSixTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileSevenTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileEightTQ.transform = CGAffineTransformMakeScale(10, 10);
    TileNineTQ.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountTQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)GetTheWord
{
    xOneTQ = pOneTQ.center.x;
    yOneTQ = pOneTQ.center.y;
    xTwoTQ = pTwoTQ.center.x;
    yTwoTQ = pTwoTQ.center.y;
    xThreeTQ = pThreeTQ.center.x;
    yThreeTQ = pThreeTQ.center.y;
    xFourTQ = pFourTQ.center.x;
    yFourTQ = pFourTQ.center.y;
    xFiveTQ = pFiveTQ.center.x;
    yFiveTQ = pFiveTQ.center.y;
    xSixTQ = pSixTQ.center.x;
    ySixTQ = pSixTQ.center.y;
    ySevenTQ = pSevenTQ.center.y;
    xSevenTQ = pSevenTQ.center.x;
    xEightTQ = pEightTQ.center.x;
    yEightTQ = pEightTQ.center.y;
    yNineTQ = pNineTQ.center.y;
    xNineTQ = pNineTQ.center.x;
    
    if (pOneTQ.center.y == iktOneTQ) {
        if (pOneTQ.center.x == ikOneTQ) {
            wOneTQ = cOneTQ;
        } else if (pOneTQ.center.x == ikTwoTQ) {
            wTwoTQ = cOneTQ;
        } else if (pOneTQ.center.x == ikThreeTQ) {
            wThreeTQ = cOneTQ;
        }
    }
    
    if (pTwoTQ.center.y == iktOneTQ) {
        if (pTwoTQ.center.x == ikOneTQ) {
            wOneTQ = cTwoTQ;
        } else if (pTwoTQ.center.x == ikTwoTQ) {
            wTwoTQ = cTwoTQ;
        } else if (pTwoTQ.center.x == ikThreeTQ) {
            wThreeTQ = cTwoTQ;
        }
    }
    
    if (pThreeTQ.center.y == iktOneTQ) {
        if (pThreeTQ.center.x == ikOneTQ) {
            wOneTQ = cThreeTQ;
        } else if (pThreeTQ.center.x == ikTwoTQ) {
            wTwoTQ = cThreeTQ;
        } else if (pThreeTQ.center.x == ikThreeTQ) {
            wThreeTQ = cThreeTQ;
        }
    }
    
    if (pFourTQ.center.y == iktOneTQ) {
        if (pFourTQ.center.x == ikOneTQ) {
            wOneTQ = cFourTQ;
        } else if (pFourTQ.center.x == ikTwoTQ) {
            wTwoTQ = cFourTQ;
        } else if (pFourTQ.center.x == ikThreeTQ) {
            wThreeTQ = cFourTQ;
        }
    }
    
    if (pFiveTQ.center.y == iktOneTQ) {
        if (pFiveTQ.center.x == ikOneTQ) {
            wOneTQ = cFiveTQ;
        } else if (pFiveTQ.center.x == ikTwoTQ) {
            wTwoTQ = cFiveTQ;
        } else if (pFiveTQ.center.x == ikThreeTQ) {
            wThreeTQ = cFiveTQ;
        }
    }
    
    if (pSixTQ.center.y == iktOneTQ) {
        if (pSixTQ.center.x == ikOneTQ) {
            wOneTQ = cSixTQ;
        } else if (pSixTQ.center.x == ikTwoTQ) {
            wTwoTQ = cSixTQ;
        } else if (pSixTQ.center.x == ikThreeTQ) {
            wThreeTQ = cSixTQ;
        }
    }
    
    if (pSevenTQ.center.y == iktOneTQ) {
        if (pSevenTQ.center.x == ikOneTQ) {
            wOneTQ = cSevenTQ;
        } else if (pSevenTQ.center.x == ikTwoTQ) {
            wTwoTQ = cSevenTQ;
        } else if (pSevenTQ.center.x == ikThreeTQ) {
            wThreeTQ = cSevenTQ;
        }
    }
    
    if (pEightTQ.center.y == iktOneTQ) {
        if (pEightTQ.center.x == ikOneTQ) {
            wOneTQ = cEightTQ;
        } else if (pEightTQ.center.x == ikTwoTQ) {
            wTwoTQ = cEightTQ;
        } else if (pEightTQ.center.x == ikThreeTQ) {
            wThreeTQ = cEightTQ;
        }
    }
    
    if (pNineTQ.center.y == iktOneTQ) {
        if (pNineTQ.center.x == ikOneTQ) {
            wOneTQ = cNineTQ;
        } else if (pNineTQ.center.x == ikTwoTQ) {
            wTwoTQ = cNineTQ;
        } else if (pNineTQ.center.x == ikThreeTQ) {
            wThreeTQ = cNineTQ;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneTQ];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoTQ];
    NSString *Threes = [NSString stringWithFormat:@"%c", wThreeTQ];
    
    WordTQ = [NSString stringWithFormat:@"%@%@%@", Ones, Twos, Threes];
    TheCurrentWordTQ.text = [WordTQ uppercaseString];
    
    pOneTQ.center = CGPointMake(xOneTQ, yOneTQ);
    pTwoTQ.center = CGPointMake(xTwoTQ, yTwoTQ);
    pThreeTQ.center = CGPointMake(xThreeTQ, yThreeTQ);
    pFourTQ.center = CGPointMake(xFourTQ, yFourTQ);
    pFiveTQ.center = CGPointMake(xFiveTQ, yFiveTQ);
    pSixTQ.center = CGPointMake(xSixTQ, ySixTQ);
    pSevenTQ.center = CGPointMake(xSevenTQ, ySevenTQ);
    pEightTQ.center = CGPointMake(xEightTQ, yEightTQ);
    pNineTQ.center = CGPointMake(xNineTQ, yNineTQ);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseTQ setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoTQ play];
    
    PauseTQ.userInteractionEnabled = NO;
    CheckTQ.userInteractionEnabled = NO;
    PauseDisplayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTQ.alpha = 1.0;
        
        CurrentWordsTQ.alpha = 1;
        PlayTQ.alpha = 1;
        HomeTQ.alpha = 1;
        
        PauseDisplayTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWordsTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        CheckTQ.alpha = 0;
        TheCurrentWordTQ.alpha = 0;
        BarUnderWordTQ.alpha = 0;
        SenderDisplayTQ.alpha = 0;
        TotalAmountTQ.alpha = 0;
        PauseTQ.alpha = 0;
        TheQuestionTQ.alpha = 0;
        
        CheckTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        PauseTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheQuestionTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        pOneTQ.alpha = 0;
        pTwoTQ.alpha = 0;
        pThreeTQ.alpha = 0;
        pFourTQ.alpha = 0;
        pFiveTQ.alpha = 0;
        pSixTQ.alpha = 0;
        pSevenTQ.alpha = 0;
        pEightTQ.alpha = 0;
        pNineTQ.alpha = 0;
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerTQ = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerTQ = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerTQ = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerTQ = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerTQ = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerTQ.scrollEnabled = YES;
    WordScrollerTQ.userInteractionEnabled = YES;
    WordScrollerTQ.backgroundColor = [UIColor blackColor];
    WordScrollerTQ.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerTQ.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerTQ aboveSubview:PauseDisplayTQ];
    if (ScoreTQ > 0) {
        NSString *path;
        switch (WordThreeQT) {
            case 1:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsOne" ofType:@"plist"];
                break;
            case 2:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsTwo" ofType:@"plist"];
                break;
            case 3:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsThree" ofType:@"plist"];
                break;
            case 4:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsFour" ofType:@"plist"];
                break;
            case 5:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsFive" ofType:@"plist"];
                break;
            case 6:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsSix" ofType:@"plist"];
                break;
            case 7:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsSeven" ofType:@"plist"];
                break;
            case 8:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsEight" ofType:@"plist"];
                break;
            case 9:
                path = [[NSBundle mainBundle] pathForResource:@"3QuestionsNine" ofType:@"plist"];
                break;
            default:
                break;
        }
        int i = 0;
        int z = 1;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
                {
                    if (WordIsAlreadyDoneTQ[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerTQ.subviews) {
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
                            WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerTQ addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneTQ[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTQ.subviews) {
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
                                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTQ addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneTQ[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTQ.subviews) {
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
                                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTQ addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneTQ[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTQ.subviews) {
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
                                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTQ addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneTQ[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTQ.subviews) {
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
                                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerTQ addSubview:lbl];
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
            [WordScrollerTQ addSubview:lbll];
            WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTQ addSubview:lbll];
                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTQ addSubview:lbll];
                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTQ addSubview:lbll];
                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTQ addSubview:lbll];
                WordScrollerTQ.contentSize = CGSizeMake(WordScrollerTQ.bounds.size.width, lbll.center.y + 50);
            }
        }
    }

}

-(IBAction)Play:(id)sender
{
    [SoundOneTQ play];
    [SoundTwoTQ play];
    
    for (UIView *v in WordScrollerTQ.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerTQ removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTQ.alpha = 0;
        HomeTQ.alpha = 0;
        PlayTQ.alpha = 0;
        CurrentWordsTQ.alpha = 0;
        
        CheckTQ.userInteractionEnabled = YES;
        PauseTQ.userInteractionEnabled = YES;
        
        PauseDisplayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        CheckTQ.alpha = 1;
        TheCurrentWordTQ.alpha = 1;
        BarUnderWordTQ.alpha = 1;
        SenderDisplayTQ.alpha = 1;
        TotalAmountTQ.alpha = 1;
        PauseTQ.alpha = 1;
        TheQuestionTQ.alpha = 1;
        
        CheckTQ.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordTQ.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordTQ.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayTQ.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountTQ.transform =CGAffineTransformMakeScale(1,1);
        PauseTQ.transform =CGAffineTransformMakeScale(1,1);
        TheQuestionTQ.transform =CGAffineTransformMakeScale(1,1);
        
        pOneTQ.alpha = 1;
        pTwoTQ.alpha = 1;
        pThreeTQ.alpha = 1;
        pFourTQ.alpha = 1;
        pFiveTQ.alpha = 1;
        pSixTQ.alpha = 1;
        pSevenTQ.alpha = 1;
        pEightTQ.alpha = 1;
        pNineTQ.alpha = 1;
        
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneTQ play];
    [SoundTwoTQ play];
    
    for (UIView *v in WordScrollerTQ.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerTQ removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTQ.alpha = 0;
        HomeTQ.alpha = 0;
        PlayTQ.alpha = 0;
        CurrentWordsTQ.alpha = 0;
        
        CheckTQ.userInteractionEnabled = YES;
        PauseTQ.userInteractionEnabled = YES;
        
        PauseDisplayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        CheckTQ.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordTQ.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordTQ.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayTQ.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountTQ.transform =CGAffineTransformMakeScale(1,1);
        PauseTQ.transform =CGAffineTransformMakeScale(1,1);
        TheQuestionTQ.transform =CGAffineTransformMakeScale(1,1);
    }];
    
    [pOneTQ setAlpha:0];
    [pTwoTQ setAlpha:0];
    [pThreeTQ setAlpha:0];
    [pFourTQ setAlpha:0];
    [pFiveTQ setAlpha:0];
    [pSixTQ setAlpha:0];
    [pSevenTQ setAlpha:0];
    [pEightTQ setAlpha:0];
    [pNineTQ setAlpha:0];
    [BarUnderWordTQ setAlpha:0];
    [TheCurrentWordTQ setAlpha:0];
    [CheckTQ setAlpha:0];
    [PauseTQ setAlpha:0];
    [SenderDisplayTQ setAlpha:0];
    [TotalAmountTQ setAlpha:0];
    [TheQuestionTQ setAlpha:0];
    
    [self BackToHome];
}

-(void)BackToHome
{
    for (int i = 0; i <= 8; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneTQ[i] = NO;
        }
    }
    
    moverTQ = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjectsBack) userInfo:nil repeats:YES];
    
    ScoreTQ = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    
    [tHomeTQ setAlpha:1];
    
    [sOneTQ setAlpha:1];
    [sTwoTQ setAlpha:1];
    [sThreeTQ setAlpha:1];
    [sFourTQ setAlpha:1];
    [sFiveTQ setAlpha:1];
    [sSixTQ setAlpha:1];
    [sSevenTQ setAlpha:1];
    [sEightTQ setAlpha:1];
    [sNineTQ setAlpha:1];
    
    [UIView commitAnimations];
    
    [TileOneTQ removeFromSuperview];
    [TileTwoTQ removeFromSuperview];
    [TileThreeTQ removeFromSuperview];
    [TileFourTQ removeFromSuperview];
    [TileFiveTQ removeFromSuperview];
    [TileSixTQ removeFromSuperview];
    [TileSevenTQ removeFromSuperview];
    [TileEightTQ removeFromSuperview];
    [TileNineTQ removeFromSuperview];
    
    pOneTQ.center = CGPointMake(ikOneTQ, iktOneTQ);
    pTwoTQ.center = CGPointMake(ikTwoTQ, iktTwoTQ);
    pThreeTQ.center = CGPointMake(ikThreeTQ, iktThreeTQ);
    pFourTQ.center = CGPointMake(ikFourTQ, iktFourTQ);
    pFiveTQ.center = CGPointMake(ikFiveTQ, iktFiveTQ);
    pSixTQ.center = CGPointMake(ikSixTQ, iktSixTQ);
    pSevenTQ.center = CGPointMake(ikSevenTQ, iktSevenTQ);
    pEightTQ.center = CGPointMake(ikEightTQ, iktEightTQ);
    pNineTQ.center = CGPointMake(ikNineTQ, iktNineTQ);
}

-(void)MovingTheObjectsBack
{
    int a;
    a = 1;
    
    sOneTQ.center = CGPointMake(sOneTQ.center.x, sOneTQ.center.y + a);
    sTwoTQ.center = CGPointMake(sTwoTQ.center.x , sTwoTQ.center.y + a);
    sThreeTQ.center = CGPointMake(sThreeTQ.center.x , sThreeTQ.center.y + a);
    sFourTQ.center = CGPointMake(sFourTQ.center.x , sFourTQ.center.y + a);
    sFiveTQ.center = CGPointMake(sFiveTQ.center.x , sFiveTQ.center.y + a);
    sSixTQ.center = CGPointMake(sSixTQ.center.x , sSixTQ.center.y + a);
    sSevenTQ.center = CGPointMake(sSevenTQ.center.x , sSevenTQ.center.y + a);
    sEightTQ.center = CGPointMake(sEightTQ.center.x , sEightTQ.center.y + a);
    sNineTQ.center = CGPointMake(sNineTQ.center.x , sNineTQ.center.y + a);
    if (sNineTQ.center.y >= kSelectionTQ) {
        [moverTQ invalidate];
        moverTQ = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        
        BBSelectionTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        gThreeTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        gTwoTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        gOneTQ.transform =CGAffineTransformMakeScale(1.3,1.3);
        [UIView animateWithDuration:0.25 animations:^{
            gOneTQ.alpha = 1.0;
            gTwoTQ.alpha = 1;
            gThreeTQ.alpha = 1;
            BBSelectionTQ.alpha = 1;
            
            gOneTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
            gTwoTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
            gThreeTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
            BBSelectionTQ.transform =CGAffineTransformMakeScale(1.0,1.0);
        }];
    }
}

-(IBAction)gOne:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOneTQ setAlpha:0];
    [sTwoTQ setAlpha:0];
    [sThreeTQ setAlpha:0];
    [sFourTQ setAlpha:0];
    [sFiveTQ setAlpha:0];
    [sSixTQ setAlpha:0];
    [sSevenTQ setAlpha:0];
    [sEightTQ setAlpha:0];
    [sNineTQ setAlpha:0];
    [BBSelectionTQ setAlpha:0];
    [UIView commitAnimations];
    BackGroundThreeTQ.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneTQ.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"QTGridsThree" sender:self];
}

-(IBAction)GoToChoice:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOneTQ setAlpha:0];
    [sTwoTQ setAlpha:0];
    [sThreeTQ setAlpha:0];
    [sFourTQ setAlpha:0];
    [sFiveTQ setAlpha:0];
    [sSixTQ setAlpha:0];
    [sSevenTQ setAlpha:0];
    [sEightTQ setAlpha:0];
    [sNineTQ setAlpha:0];
    [BBSelectionTQ setAlpha:0];
    [UIView commitAnimations];
    BackGroundTwoTQ.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneTQ.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameThree) withObject:nil afterDelay:1];
}

-(void)GoToGameThree
{
     [self performSegueWithIdentifier:@"QTChoiceThree" sender:self];
}

-(IBAction)tHome:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourTQ.alpha = 0;
        BackGroundFourTQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourTQ.alpha = 1;
                             BackGroundFourTQ.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoToHomeFromThreeQuestions" sender:self];
}

@end