//
//  TwoGrids.m
//  Typex V2
//
//  Created by Michael Mooney on 22/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "TwoGrids.h"
#import <AVFoundation/AVFoundation.h>

NSInteger WordTwo;
NSString *WordWG;

int TheAmountWG;
int replayWG, ScoreWG, PreviousWG, PanningIntWG, PPanningMethodWG;
NSInteger PanningSensitivityWG;

char cOneWG, cTwoWG, cThreeWG, cFourWG;
char wOneWG, wTwoWG;

float ikOneWG, ikTwoWG, ikThreeWG, ikFourWG;
float iktOneWG, iktTwoWG, iktThreeWG, iktFourWG;
float iLeftWG, iRightWG, iUpWG, iDownWG;
float pointOfIntrestWG;
float xOneWG, yOneWG, xTwoWG, yTwoWG, xThreeWG, yThreeWG, xFourWG, yFourWG;
float kSelectionWG;
CGPoint OneWG, TwoWG, ThreeWG, FourWG, distanceWG;
UISwipeGestureRecognizer *PRightWG, *PLeftWG;
NSString *SaveWordsWG;

BOOL WordIsAlreadyDoneWG[93];

@interface TwoGrids () <AVAudioPlayerDelegate>
{
    AVAudioPlayer *SoundOneWG, *SoundTwoWG, *SwipeSoundWG;
    
#pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeWG, *CheckWG;
    IBOutlet UIImageView *BackGroundOneWG, *BackGroundTwoWG, *BackGroundFourWG;
    
#pragma Mark Game - Grids
    IBOutlet UIImageView *pOneWG, *pTwoWG, *pThreeWG, *pFourWG;
    IBOutlet UILabel *TotalAmountWG;
    IBOutlet UIButton *PauseWG;
    IBOutlet UILabel *TheCurrentWordWG;
    IBOutlet UIImageView *PauseDisplayWG, *SenderDisplayWG;
    IBOutlet UIButton *HomeWG, *PlayWG;
    IBOutlet UIImageView *BarUnderWordWG;
    IBOutlet UIImageView *BBSelectionWG;
    IBOutlet UIImageView *TileOneWG, *TileTwoWG, *TileThreeWG, *TileFourWG;
    
#pragma Mark Selection - Fist Page
    IBOutlet UIButton *sOneWG, *sTwoWG, *sThreeWG, *sFourWG, *sFiveWG, *sSixWG, *sSevenWG, *sEightWG, *sNineWG, *sTenWG, *sElevenWG, *sTwelveWG, *sThirteenWG, *sFourteenWG, *sFithteenWG;
    IBOutlet UIButton *gOneWG, *gTwoWG;
    NSTimer *moverWG;
    IBOutlet UIScrollView *WordScrollerWG;
    IBOutlet UILabel *CurrentWordsWG;
}
@end

@implementation TwoGrids


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

    BackGroundFourWG.alpha = 0;
    
    WordScrollerWG.scrollEnabled = YES;
    WordScrollerWG.userInteractionEnabled = YES;
    
#pragma Mark The Game Items
    
    ScoreWG = 0;
    
    PauseWG.alpha = 0;
    CheckWG.alpha = 0;
    TotalAmountWG.alpha = 0;
    
    pOneWG.alpha = 0;
    pTwoWG.alpha = 0;
    pThreeWG.alpha = 0;
    PlayWG.alpha = 0;
    HomeWG.alpha = 0;
    pFourWG.alpha = 0;
    BarUnderWordWG.alpha = 0;
    SenderDisplayWG.alpha = 0;
    CurrentWordsWG.alpha = 0;
    TheCurrentWordWG.alpha = 0;
    PauseDisplayWG.alpha = 0;
    
#pragma Mark The Selection Page
    
    sOneWG.alpha = 0;
    sTwoWG.alpha = 0;
    sThreeWG.alpha = 0;
    sFourWG.alpha = 0;
    sFiveWG.alpha = 0;
    sSixWG.alpha = 0;
    sSevenWG.alpha = 0;
    sEightWG.alpha = 0;
    WordScrollerWG.alpha = 0;
    sNineWG.alpha = 0;
    sTenWG.alpha = 0;
    sElevenWG.alpha = 0;
    sTwelveWG.alpha = 0;
    sThirteenWG.alpha = 0;
    sFourteenWG.alpha = 0;
    sFithteenWG.alpha = 0;
    PauseDisplayWG.backgroundColor = [UIColor blackColor];
    BOOL HomeFG = [[NSUserDefaults standardUserDefaults] boolForKey:@"IsItComingInFromHomeScreen"];
    
    if (HomeFG == YES) {
        tHomeWG.alpha = 0;
        gOneWG.alpha = 0;
        gTwoWG.alpha = 0;
        BBSelectionWG.alpha = 0;
    } else {
        tHomeWG.alpha = 1;
        gOneWG.alpha = 1;
        gTwoWG.alpha = 1;
        BBSelectionWG.alpha =1;
    }
    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneWG = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoWG = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSoundWG = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
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
    [gOneWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        sOneWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwoWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThreeWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFiveWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSixWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSevenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sEightWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sNineWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sElevenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwelveWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThirteenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourteenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFithteenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            sOneWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwoWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThreeWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFiveWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSixWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSevenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sEightWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sNineWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sElevenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwelveWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThirteenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourteenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFithteenWG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                sOneWG.transform = CGAffineTransformIdentity;
                sTwoWG.transform = CGAffineTransformIdentity;
                sThreeWG.transform = CGAffineTransformIdentity;
                sFourWG.transform = CGAffineTransformIdentity;
                sFiveWG.transform = CGAffineTransformIdentity;
                sSixWG.transform = CGAffineTransformIdentity;
                sSevenWG.transform = CGAffineTransformIdentity;
                sEightWG.transform = CGAffineTransformIdentity;
                sNineWG.transform = CGAffineTransformIdentity;
                sTenWG.transform = CGAffineTransformIdentity;
                sElevenWG.transform = CGAffineTransformIdentity;
                sTwelveWG.transform = CGAffineTransformIdentity;
                sThirteenWG.transform = CGAffineTransformIdentity;
                sFourteenWG.transform = CGAffineTransformIdentity;
                sFithteenWG.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    tHomeWG.alpha = 1;
    gOneWG.alpha = 1;
    gTwoWG.alpha = 1;
    BBSelectionWG.alpha = 1;
    sOneWG.alpha = 1;
    sTwoWG.alpha = 1;
    sThreeWG.alpha = 1;
    sFourWG.alpha = 1;
    sFiveWG.alpha = 1;
    sSixWG.alpha = 1;
    sSevenWG.alpha = 1;
    sEightWG.alpha = 1;
    sNineWG.alpha = 1;
    sTenWG.alpha = 1;
    sElevenWG.alpha = 1;
    sTwelveWG.alpha = 1;
    sThirteenWG.alpha = 1;
    sFourteenWG.alpha = 1;
    sFithteenWG.alpha = 1;
    [UIView commitAnimations];
}

-(void)GetDevice
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        SenderDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 136, 45)];
        TotalAmountWG = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 131, 38)];
        TotalAmountWG.font = [[TotalAmountWG font] fontWithSize:15];
        PauseWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckWG = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordWG = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordWG = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordWG.font  = [[TheCurrentWordWG font] fontWithSize:15];
        
        BackGroundOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        tHomeWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneWG = [[UIButton alloc] initWithFrame:CGRectMake(114, 434, 40, 40)];
        gTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(167, 434, 40, 40)];
        BBSelectionWG = [[UIImageView alloc] initWithFrame:CGRectMake(110, 430, 48, 48)];
        
        sOneWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 45, 100, 40)];
        sTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 45, 100, 40)];
        sThreeWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 93, 100, 40)];
        sFourWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 93, 100, 40)];
        sFiveWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 141, 100, 40)];
        sSixWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 141, 100, 40)];
        sSevenWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 189, 100, 40)];
        sEightWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 189, 100, 40)];
        sNineWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 237, 100, 40)];
        sTenWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 237, 100, 40)];
        sElevenWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 285, 100, 40)];
        sTwelveWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 285, 100, 40)];
        sThirteenWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 333, 100, 40)];
        sFourteenWG = [[UIButton alloc] initWithFrame:CGRectMake(180, 333, 100, 40)];
        sFithteenWG = [[UIButton alloc] initWithFrame:CGRectMake(72, 381, 100, 40)];
        
        PlayWG = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeWG = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsWG = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsWG.font  = [[CurrentWordsWG font] fontWithSize:20];
        
        pOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(77, 220, 80, 80)];
        pTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(163, 220, 80, 80)];
        pThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(77, 306, 80, 80)];
        pFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(163, 306, 80, 80)];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 155, 50)];
        TotalAmountWG = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 150, 36)];
        TotalAmountWG.font = [[TotalAmountWG font] fontWithSize:20];
        PauseWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckWG = [[UIButton alloc] initWithFrame:CGRectMake(60, 154, 200, 40)];
        BarUnderWordWG = [[UIImageView alloc] initWithFrame:CGRectMake(41, 242, 240, 2)];
        TheCurrentWordWG = [[UILabel alloc] initWithFrame:CGRectMake(117, 215, 87, 28)];
        TheCurrentWordWG.font  = [[TheCurrentWordWG font] fontWithSize:25];
        
        sOneWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 106, 110, 45)];
        sTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 106, 110, 45)];
        sThreeWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 156, 110, 45)];
        sFourWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 156, 110, 45)];
        sFiveWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 206, 110, 45)];
        sSixWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 206, 110, 45)];
        sSevenWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 256, 110, 45)];
        sEightWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 256, 110, 45)];
        sNineWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 306, 110, 45)];
        sTenWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 306, 110, 45)];
        sElevenWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 356, 110, 45)];
        sTwelveWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 356, 110, 45)];
        sThirteenWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 406, 110, 45)];
        sFourteenWG = [[UIButton alloc] initWithFrame:CGRectMake(182, 406, 110, 45)];
        sFithteenWG = [[UIButton alloc] initWithFrame:CGRectMake(48, 456, 110, 45)];
        
        BackGroundOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        PlayWG = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeWG = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsWG = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsWG.font  = [[CurrentWordsWG font] fontWithSize:20];
        
        pOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(63, 265, 90, 90)];
        pTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(168, 265, 90, 90)];
        pThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(63, 370, 90, 90)];
        pFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(168, 370, 90, 90)];
        
        tHomeWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneWG = [[UIButton alloc] initWithFrame:CGRectMake(129, 520, 40, 40)];
        gTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(179, 520, 40, 40)];
        BBSelectionWG = [[UIImageView alloc] initWithFrame:CGRectMake(126, 517, 46, 46)];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneWG = [[UIButton alloc] initWithFrame:CGRectMake(134, 602, 45, 45)];
        gTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(192, 602, 45, 45)];
        BBSelectionWG = [[UIImageView alloc] initWithFrame:CGRectMake(131, 599, 51, 51)];
        
        sOneWG = [[UIButton alloc] initWithFrame:CGRectMake(12, 193, 110, 50)];
        sTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(130, 193, 110, 50)];
        sThreeWG = [[UIButton alloc] initWithFrame:CGRectMake(252, 193, 110, 50)];
        sFourWG = [[UIButton alloc] initWithFrame:CGRectMake(12, 251, 110, 50)];
        sFiveWG = [[UIButton alloc] initWithFrame:CGRectMake(130, 251, 110, 50)];
        sSixWG = [[UIButton alloc] initWithFrame:CGRectMake(252, 251, 110, 50)];
        sSevenWG = [[UIButton alloc] initWithFrame:CGRectMake(12, 309, 110, 50)];
        sEightWG = [[UIButton alloc] initWithFrame:CGRectMake(130, 309, 110, 50)];
        sNineWG = [[UIButton alloc] initWithFrame:CGRectMake(252, 309, 110, 50)];
        sTenWG = [[UIButton alloc] initWithFrame:CGRectMake(12, 367, 110, 50)];
        sElevenWG = [[UIButton alloc] initWithFrame:CGRectMake(130, 367, 110, 50)];
        sTwelveWG = [[UIButton alloc] initWithFrame:CGRectMake(252, 367, 110, 50)];
        sThirteenWG = [[UIButton alloc] initWithFrame:CGRectMake(12, 425, 110, 50)];
        sFourteenWG = [[UIButton alloc] initWithFrame:CGRectMake(130, 425, 110, 50)];
        sFithteenWG = [[UIButton alloc] initWithFrame:CGRectMake(252, 425, 110, 50)];
        
        BackGroundOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        PlayWG = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeWG = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsWG = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsWG.font = [[CurrentWordsWG font] fontWithSize:25];
        
        BarUnderWordWG = [[UIImageView alloc] initWithFrame:CGRectMake(67, 315, 240, 2)];
        TheCurrentWordWG = [[UILabel alloc] initWithFrame:CGRectMake(123, 282, 128, 35)];
        CheckWG = [[UIButton alloc] initWithFrame:CGRectMake(82, 202, 210, 45)];
        SenderDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 182, 50)];
        TotalAmountWG = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 176, 42)];
        PauseWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWordWG.font  = [[TheCurrentWordWG font] fontWithSize:25];
        TotalAmountWG.font = [[TotalAmountWG font] fontWithSize:22];
        
        pOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(72, 325, 110, 110)];
        pTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(192, 325, 110, 110)];
        pThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(72, 445, 110, 110)];
        pFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(192, 445, 110, 110)];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneWG = [[UIButton alloc] initWithFrame:CGRectMake(156, 671, 45, 45)];
        gTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(214, 671, 45, 45)];
        BBSelectionWG = [[UIImageView alloc] initWithFrame:CGRectMake(153, 668, 51, 51)];
        
        PlayWG = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeWG = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsWG = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsWG.font = [[CurrentWordsWG font] fontWithSize:25];
        
        sOneWG = [[UIButton alloc] initWithFrame:CGRectMake(19, 227, 120, 50)];
        sTwoWG = [[UIButton alloc] initWithFrame:CGRectMake(147, 227, 120, 50)];
        sThreeWG = [[UIButton alloc] initWithFrame:CGRectMake(275, 227, 120, 50)];
        sFourWG = [[UIButton alloc] initWithFrame:CGRectMake(19, 285, 120, 50)];
        sFiveWG = [[UIButton alloc] initWithFrame:CGRectMake(147, 285, 120, 50)];
        sSixWG = [[UIButton alloc] initWithFrame:CGRectMake(275, 285, 120, 50)];
        sSevenWG = [[UIButton alloc] initWithFrame:CGRectMake(19, 343, 120, 50)];
        sEightWG = [[UIButton alloc] initWithFrame:CGRectMake(147, 343, 120, 50)];
        sNineWG = [[UIButton alloc] initWithFrame:CGRectMake(275, 343, 120, 50)];
        sTenWG = [[UIButton alloc] initWithFrame:CGRectMake(19, 401, 120, 50)];
        sElevenWG = [[UIButton alloc] initWithFrame:CGRectMake(147, 401, 120, 50)];
        sTwelveWG = [[UIButton alloc] initWithFrame:CGRectMake(275, 401, 120, 50)];
        sThirteenWG = [[UIButton alloc] initWithFrame:CGRectMake(19, 459, 120, 50)];
        sFourteenWG = [[UIButton alloc] initWithFrame:CGRectMake(147, 459, 120, 50)];
        sFithteenWG = [[UIButton alloc] initWithFrame:CGRectMake(275, 459, 120, 50)];
        
        BarUnderWordWG = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordWG = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckWG = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayWG = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmountWG = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        PauseWG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWordWG.font  = [[TheCurrentWordWG font] fontWithSize:25];
        TotalAmountWG.font = [[TotalAmountWG font] fontWithSize:25];
        
        pOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(92, 375, 110, 110)];
        pTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(212, 375, 110, 110)];
        pThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(92, 495, 110, 110)];
        pFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(212, 495, 110, 110)];
    }
    
    [self.view addSubview:BackGroundOneWG];
    
    BarUnderWordWG.backgroundColor = [UIColor blackColor];
    TheCurrentWordWG.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordWG.textColor = [UIColor whiteColor];
    CheckWG.adjustsImageWhenHighlighted = NO;
    tHomeWG.adjustsImageWhenHighlighted = NO;
    tHomeWG.showsTouchWhenHighlighted = YES;
    gOneWG.showsTouchWhenHighlighted = YES;
    gTwoWG.showsTouchWhenHighlighted = YES;
    gOneWG.adjustsImageWhenHighlighted = NO;
    gTwoWG.adjustsImageWhenHighlighted = NO;
    BBSelectionWG.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeWG setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [gOneWG setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoWG setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckWG setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckWG addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseWG setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHomeWG addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [PauseWG addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseWG.adjustsImageWhenHighlighted = NO;
    SenderDisplayWG.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountWG.textColor = [UIColor whiteColor];
    TotalAmountWG.textAlignment = NSTextAlignmentCenter;
    [gTwoWG addTarget:self action:@selector(gTwo:) forControlEvents:UIControlEventTouchUpInside];
    BackGroundOneWG.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundTwoWG.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourWG.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [self.view insertSubview:BackGroundTwoWG belowSubview:BackGroundOneWG];
    [self.view insertSubview:SenderDisplayWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:TotalAmountWG aboveSubview:SenderDisplayWG];
    [self.view insertSubview:PauseWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:CheckWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:BarUnderWordWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:TheCurrentWordWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:tHomeWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:gOneWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:gTwoWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:BBSelectionWG aboveSubview:BackGroundOneWG];
    
    [self.view insertSubview:pOneWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:pTwoWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:pThreeWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:pFourWG aboveSubview:BackGroundOneWG];
    
    [PlayWG setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeWG setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayWG addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeWG addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayWG.showsTouchWhenHighlighted = YES;
    HomeWG.showsTouchWhenHighlighted = YES;
    PlayWG.adjustsImageWhenHighlighted = NO;
    HomeWG.adjustsImageWhenHighlighted = NO;
    CurrentWordsWG.text = @"CURRENT WORDS";
    CurrentWordsWG.textColor = [UIColor whiteColor];
    CurrentWordsWG.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplayWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:HomeWG aboveSubview:PauseDisplayWG];
    [self.view insertSubview:PlayWG aboveSubview:PauseDisplayWG];
    [self.view insertSubview:CurrentWordsWG aboveSubview:PauseDisplayWG];
    
    [sOneWG setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [sTwoWG setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [sThreeWG setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [sFourWG setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [sFiveWG setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [sSixWG setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [sSevenWG setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [sEightWG setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [sNineWG setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [sTenWG setImage:[UIImage imageNamed:@"Ten.png"] forState:UIControlStateNormal];
    [sElevenWG setImage:[UIImage imageNamed:@"Eleven.png"] forState:UIControlStateNormal];
    [sTwelveWG setImage:[UIImage imageNamed:@"Twelve.png"] forState:UIControlStateNormal];
    [sThirteenWG setImage:[UIImage imageNamed:@"Thirteen.png"] forState:UIControlStateNormal];
    [sFourteenWG setImage:[UIImage imageNamed:@"Fourteen.png"] forState:UIControlStateNormal];
    [sFithteenWG setImage:[UIImage imageNamed:@"Fithteen.png"] forState:UIControlStateNormal];
    
    [sOneWG addTarget:self action:@selector(One:) forControlEvents:UIControlEventTouchUpInside];
    [sTwoWG addTarget:self action:@selector(Two:) forControlEvents:UIControlEventTouchUpInside];
    [sThreeWG addTarget:self action:@selector(Three:) forControlEvents:UIControlEventTouchUpInside];
    [sFourWG addTarget:self action:@selector(Four:) forControlEvents:UIControlEventTouchUpInside];
    [sFiveWG addTarget:self action:@selector(Five:) forControlEvents:UIControlEventTouchUpInside];
    [sSixWG addTarget:self action:@selector(Six:) forControlEvents:UIControlEventTouchUpInside];
    [sSevenWG addTarget:self action:@selector(Seven:) forControlEvents:UIControlEventTouchUpInside];
    [sEightWG addTarget:self action:@selector(Eight:) forControlEvents:UIControlEventTouchUpInside];
    [sNineWG addTarget:self action:@selector(Nine:) forControlEvents:UIControlEventTouchUpInside];
    [sTenWG addTarget:self action:@selector(Ten:) forControlEvents:UIControlEventTouchUpInside];
    [sElevenWG addTarget:self action:@selector(Eleven:) forControlEvents:UIControlEventTouchUpInside];
    [sTwelveWG addTarget:self action:@selector(Twelve:) forControlEvents:UIControlEventTouchUpInside];
    [sThirteenWG addTarget:self action:@selector(Thirteen:) forControlEvents:UIControlEventTouchUpInside];
    [sFourteenWG addTarget:self action:@selector(Fourteen:) forControlEvents:UIControlEventTouchUpInside];
    [sFithteenWG addTarget:self action:@selector(Fithteen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:sOneWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sTwoWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sThreeWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sFourWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sFiveWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sSixWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sSevenWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sEightWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sNineWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sTenWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sElevenWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sTwelveWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sThirteenWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sFourteenWG aboveSubview:BackGroundOneWG];
    [self.view insertSubview:sFithteenWG aboveSubview:BackGroundOneWG];
    [self.view addSubview:BackGroundFourWG];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)SettingUpFuncionForButtons
{
    [CheckWG addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [CheckWG addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckWG addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [PauseWG addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [PauseWG addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    [sOneWG addTarget:self action:@selector(sOneClicked) forControlEvents:UIControlEventTouchDown];
    [sOneWG addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpInside];
    [sOneWG addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwoWG addTarget:self action:@selector(sTwoClicked) forControlEvents:UIControlEventTouchDown];
    [sTwoWG addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwoWG addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThreeWG addTarget:self action:@selector(sThreeClicked) forControlEvents:UIControlEventTouchDown];
    [sThreeWG addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThreeWG addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourWG addTarget:self action:@selector(sFourClicked) forControlEvents:UIControlEventTouchDown];
    [sFourWG addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFourWG addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFiveWG addTarget:self action:@selector(sFiveClicked) forControlEvents:UIControlEventTouchDown];
    [sFiveWG addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFiveWG addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSixWG addTarget:self action:@selector(sSixClicked) forControlEvents:UIControlEventTouchDown];
    [sSixWG addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSixWG addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSevenWG addTarget:self action:@selector(sSevenClicked) forControlEvents:UIControlEventTouchDown];
    [sSevenWG addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSevenWG addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sEightWG addTarget:self action:@selector(sEightClicked) forControlEvents:UIControlEventTouchDown];
    [sEightWG addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpInside];
    [sEightWG addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sNineWG addTarget:self action:@selector(sNineClicked) forControlEvents:UIControlEventTouchDown];
    [sNineWG addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpInside];
    [sNineWG addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTenWG addTarget:self action:@selector(sTenClicked) forControlEvents:UIControlEventTouchDown];
    [sTenWG addTarget:self action:@selector(sTenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTenWG addTarget:self action:@selector(sTenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sElevenWG addTarget:self action:@selector(sElevenClicked) forControlEvents:UIControlEventTouchDown];
    [sElevenWG addTarget:self action:@selector(sElevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sElevenWG addTarget:self action:@selector(sElevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwelveWG addTarget:self action:@selector(sTwelveClicked) forControlEvents:UIControlEventTouchDown];
    [sTwelveWG addTarget:self action:@selector(sTwelveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwelveWG addTarget:self action:@selector(sTwelveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThirteenWG addTarget:self action:@selector(sThirteenClicked) forControlEvents:UIControlEventTouchDown];
    [sThirteenWG addTarget:self action:@selector(sThirteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThirteenWG addTarget:self action:@selector(sThirteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourteenWG addTarget:self action:@selector(sFourteenClicked) forControlEvents:UIControlEventTouchDown];
    [sFourteenWG addTarget:self action:@selector(sFourteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFourteenWG addTarget:self action:@selector(sFourteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFithteenWG addTarget:self action:@selector(sFithteenClicked) forControlEvents:UIControlEventTouchDown];
    [sFithteenWG addTarget:self action:@selector(sFithteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFithteenWG addTarget:self action:@selector(sFithteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    ikOneWG = pOneWG.center.x;
    iktOneWG = pOneWG.center.y;
    ikTwoWG = pTwoWG.center.x;
    iktTwoWG = pTwoWG.center.y;
    ikThreeWG = pThreeWG.center.x;
    iktThreeWG = pThreeWG.center.y;
    ikFourWG = pFourWG.center.x;
    iktFourWG = pFourWG.center.y;
    kSelectionWG = sNineWG.center.y;
}

-(void)sOneClicked
{
    [sOneWG setImage:[UIImage imageNamed:@"OnePlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sOneClick
{
    [sOneWG setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sTwoClicked
{
    [sTwoWG setImage:[UIImage imageNamed:@"TwoPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sTwoClick
{
    [sTwoWG setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sThreeClicked
{
    [sThreeWG setImage:[UIImage imageNamed:@"ThreePlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sThreeClick
{
    [sThreeWG setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sFourClicked
{
    [sFourWG setImage:[UIImage imageNamed:@"FourPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sFourClick
{
    [sFourWG setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sFiveClicked
{
    [sFiveWG setImage:[UIImage imageNamed:@"FivePlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sFiveClick
{
    [sFiveWG setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sSixClicked
{
    [sSixWG setImage:[UIImage imageNamed:@"SixPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sSixClick
{
    [sSixWG setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sSevenClicked
{
    [sSevenWG setImage:[UIImage imageNamed:@"SevenPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sSevenClick
{
    [sSevenWG setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sEightClicked
{
    [sEightWG setImage:[UIImage imageNamed:@"EightPlain.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sEightClick
{
    [sEightWG setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sNineClicked
{
    [sNineWG setImage:[UIImage imageNamed:@"NinePlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sNineClick
{
    [sNineWG setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sTenClicked
{
    [sTenWG setImage:[UIImage imageNamed:@"TenPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sTenClick
{
    [sTenWG setImage:[UIImage imageNamed:@"Ten.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sElevenClicked
{
    [sElevenWG setImage:[UIImage imageNamed:@"ElevenPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sElevenClick
{
    [sElevenWG setImage:[UIImage imageNamed:@"Eleven.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sTwelveClicked
{
    [sTwelveWG setImage:[UIImage imageNamed:@"TwelvePlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sTwelveClick
{
    [sTwelveWG setImage:[UIImage imageNamed:@"Twelve.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sThirteenClicked
{
    [sThirteenWG setImage:[UIImage imageNamed:@"ThirteenPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sThirteenClick
{
    [sThirteenWG setImage:[UIImage imageNamed:@"Thirteen.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sFourteenClicked
{
    [sFourteenWG setImage:[UIImage imageNamed:@"FourteenPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sFourteenClick
{
    [sFourteenWG setImage:[UIImage imageNamed:@"Fourteen.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sFithteenClicked
{
    [sFithteenWG setImage:[UIImage imageNamed:@"FithteenPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)sFithteenClick
{
    [sFithteenWG setImage:[UIImage imageNamed:@"Fithteen.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)PauseClicked
{
    [PauseWG setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sPauseClicked
{
    [PauseWG setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(void)CheckClciked
{
    [CheckWG setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
}

-(void)sCheckClicked
{
    [CheckWG setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneWG play];
}

-(IBAction)One:(id)sender
{
    WordTwo = 1;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo1"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
        }
    }
}
    [self preViewDidLoad];
}

-(IBAction)Two:(id)sender
{
    WordTwo = 2;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo2"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Three:(id)sender
{
    WordTwo = 3;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo3"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Four:(id)sender
{
    WordTwo = 4;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo4"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Five:(id)sender
{
    WordTwo = 5;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo5"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Six:(id)sender
{
    WordTwo = 6;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo6"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Seven:(id)sender
{
    WordTwo = 7;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo7"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eight:(id)sender
{
    WordTwo = 8;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo8"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Nine:(id)sender
{
    WordTwo = 9;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo9"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Ten:(id)sender
{
    WordTwo = 10;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo10"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eleven:(id)sender
{
    WordTwo = 11;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo11"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Twelve:(id)sender
{
    WordTwo = 12;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo12"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Thirteen:(id)sender
{
    WordTwo = 13;
    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo13"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Fourteen:(id)sender
{
    WordTwo = 14;

    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo14"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Fithteen:(id)sender
{
    WordTwo = 15;

    SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo15"];
    if ([SaveWordsWG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"2Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SaveWordsWG rangeOfString:str].length == 2) {
                    ScoreWG++;
                    WordIsAlreadyDoneWG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(void)preViewDidLoad
{
    [self GettingTheRightGrid];
    
    CGPoint midPoint;
    midPoint.x = ((pOneWG.center.x + pTwoWG.center.x) / 2);
    midPoint.y = ((pOneWG.center.y + pThreeWG.center.y) / 2);
    
    pOneWG.center = CGPointMake(midPoint.x, midPoint.y);
    pTwoWG.center = CGPointMake(midPoint.x, midPoint.y);
    pThreeWG.center = CGPointMake(midPoint.x, midPoint.y);
    pFourWG.center = CGPointMake(midPoint.x, midPoint.y);
    
    
    moverWG = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjects) userInfo:nil repeats:YES];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0];
    [UIView setAnimationDuration:1];
    
    [pOneWG setAlpha:1];
    [pTwoWG setAlpha:1];
    [pThreeWG setAlpha:1];
    [pFourWG setAlpha:1];
    [CheckWG setAlpha:1];
    [TheCurrentWordWG setAlpha:1];
    [PauseWG setAlpha:1];
    [BarUnderWordWG setAlpha:1];
    [TotalAmountWG setAlpha:1];
    [SenderDisplayWG setAlpha:1];
    [tHomeWG setAlpha:0];
    
    [sOneWG setAlpha:0];
    [sTwoWG setAlpha:0];
    [sThreeWG setAlpha:0];
    [sFourWG setAlpha:0];
    [sFiveWG setAlpha:0];
    [sSixWG setAlpha:0];
    [sSevenWG setAlpha:0];
    [sEightWG setAlpha:0];
    [sNineWG setAlpha:0];
    [sTenWG setAlpha:0];
    [sElevenWG setAlpha:0];
    [sTwelveWG setAlpha:0];
    [sThirteenWG setAlpha:0];
    [sFourteenWG setAlpha:0];
    [sFithteenWG setAlpha:0];
    
    [gOneWG setAlpha:0];
    [gTwoWG setAlpha:0];
    [BBSelectionWG setAlpha:0];
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:1];
    pOneWG.center = CGPointMake(ikOneWG, iktOneWG);
    pTwoWG.center = CGPointMake(ikTwoWG, iktTwoWG);
    pThreeWG.center = CGPointMake(ikThreeWG, iktThreeWG);
    pFourWG.center = CGPointMake(ikFourWG, iktFourWG);
    [self GameSettingUpForGrid];
    [UIView commitAnimations];
}

-(void)MovingTheObjects
{
    int a;
    a = 1;
    sOneWG.center = CGPointMake(sOneWG.center.x, sOneWG.center.y - a);
    sTwoWG.center = CGPointMake(sTwoWG.center.x , sTwoWG.center.y - a);
    sThreeWG.center = CGPointMake(sThreeWG.center.x , sThreeWG.center.y - a);
    sFourWG.center = CGPointMake(sFourWG.center.x , sFourWG.center.y - a);
    sFiveWG.center = CGPointMake(sFiveWG.center.x , sFiveWG.center.y - a);
    sSixWG.center = CGPointMake(sSixWG.center.x , sSixWG.center.y - a);
    sSevenWG.center = CGPointMake(sSevenWG.center.x , sSevenWG.center.y - a);
    sEightWG.center = CGPointMake(sEightWG.center.x , sEightWG.center.y - a);
    sNineWG.center = CGPointMake(sNineWG.center.x , sNineWG.center.y - a);
    sTenWG.center = CGPointMake(sTenWG.center.x , sTenWG.center.y - a);
    sElevenWG.center = CGPointMake(sElevenWG.center.x , sElevenWG.center.y - a);
    sTwelveWG.center = CGPointMake(sTwelveWG.center.x , sTwelveWG.center.y - a);
    sThirteenWG.center = CGPointMake(sThirteenWG.center.x , sThirteenWG.center.y - a);
    sFourteenWG.center = CGPointMake(sFourteenWG.center.x , sFourteenWG.center.y - a);
    sFithteenWG.center = CGPointMake(sFithteenWG.center.x , sFithteenWG.center.y - a);
    if (-155 >= sFithteenWG.center.y) {
        [moverWG invalidate];
        moverWG = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
    
}

-(void)GameSettingUpForGrid
{
    [self Swipes];
}

-(void)GettingTheRightGrid
{
    switch (WordTwo) {
        case 1:
            cOneWG = 'a';
            cTwoWG = 'h';
            cThreeWG = 'e';
            cFourWG = 'd';
            
            pOneWG.image = [UIImage imageNamed:@"A.png"];
            pTwoWG.image = [UIImage imageNamed:@"H.png"];
            pThreeWG.image = [UIImage imageNamed:@"E.png"];
            pFourWG.image = [UIImage imageNamed:@"D.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 8", ScoreWG];
            TheAmountWG = 8;
            break;
        case 2:
            cOneWG = 'b';
            cTwoWG = 'a';
            cThreeWG = 'e';
            cFourWG = 'i';
            
            pOneWG.image = [UIImage imageNamed:@"B.png"];
            pTwoWG.image = [UIImage imageNamed:@"A.png"];
            pThreeWG.image = [UIImage imageNamed:@"E.png"];
            pFourWG.image = [UIImage imageNamed:@"I.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 5", ScoreWG];
            TheAmountWG = 5;
            break;
        case 3:
            cOneWG = 'e';
            cTwoWG = 'm';
            cThreeWG = 'x';
            cFourWG = 'n';
            
            pOneWG.image = [UIImage imageNamed:@"E.png"];
            pTwoWG.image = [UIImage imageNamed:@"M.png"];
            pThreeWG.image = [UIImage imageNamed:@"X.png"];
            pFourWG.image = [UIImage imageNamed:@"N.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 5", ScoreWG];
            TheAmountWG = 5;
            break;
        case 4:
            cOneWG = 'h';
            cTwoWG = 'm';
            cThreeWG = 'o';
            cFourWG = 'i';
            
            pOneWG.image = [UIImage imageNamed:@"H.png"];
            pTwoWG.image = [UIImage imageNamed:@"M.png"];
            pThreeWG.image = [UIImage imageNamed:@"O.png"];
            pFourWG.image = [UIImage imageNamed:@"I.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 7", ScoreWG];
            TheAmountWG = 7;
            break;
        case 5:
            cOneWG = 'm';
            cTwoWG = 'o';
            cThreeWG = 'n';
            cFourWG = 'a';
            
            pOneWG.image = [UIImage imageNamed:@"M.png"];
            pTwoWG.image = [UIImage imageNamed:@"O.png"];
            pThreeWG.image = [UIImage imageNamed:@"N.png"];
            pFourWG.image = [UIImage imageNamed:@"A.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 8", ScoreWG];
            TheAmountWG = 8;
            break;
        case 6:
            cOneWG = 'n';
            cTwoWG = 'e';
            cThreeWG = 'u';
            cFourWG = 'o';
            
            pOneWG.image = [UIImage imageNamed:@"N.png"];
            pTwoWG.image = [UIImage imageNamed:@"E.png"];
            pThreeWG.image = [UIImage imageNamed:@"U.png"];
            pFourWG.image = [UIImage imageNamed:@"O.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 7", ScoreWG];
            TheAmountWG = 7;
            break;
        case 7:
            cOneWG = 'o';
            cTwoWG = 'm';
            cThreeWG = 'h';
            cFourWG = 'e';
            
            pOneWG.image = [UIImage imageNamed:@"O.png"];
            pTwoWG.image = [UIImage imageNamed:@"M.png"];
            pThreeWG.image = [UIImage imageNamed:@"H.png"];
            pFourWG.image = [UIImage imageNamed:@"E.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 7", ScoreWG];
            TheAmountWG = 7;
            break;
        case 8:
            cOneWG = 'o';
            cTwoWG = 'p';
            cThreeWG = 'r';
            cFourWG = 'n';
            
            pOneWG.image = [UIImage imageNamed:@"O.png"];
            pTwoWG.image = [UIImage imageNamed:@"P.png"];
            pThreeWG.image = [UIImage imageNamed:@"R.png"];
            pFourWG.image = [UIImage imageNamed:@"N.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 4", ScoreWG];
            TheAmountWG = 4;
            break;
        case 9:
            cOneWG = 'o';
            cTwoWG = 'w';
            cThreeWG = 'x';
            cFourWG = 'y';
            
            pOneWG.image = [UIImage imageNamed:@"O.png"];
            pTwoWG.image = [UIImage imageNamed:@"W.png"];
            pThreeWG.image = [UIImage imageNamed:@"X.png"];
            pFourWG.image = [UIImage imageNamed:@"Y.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 4", ScoreWG];
            TheAmountWG = 4;
            break;
        case 10:
            cOneWG = 't';
            cTwoWG = 'a';
            cThreeWG = 'i';
            cFourWG = 'o';
            
            pOneWG.image = [UIImage imageNamed:@"T.png"];
            pTwoWG.image = [UIImage imageNamed:@"A.png"];
            pThreeWG.image = [UIImage imageNamed:@"I.png"];
            pFourWG.image = [UIImage imageNamed:@"O.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 6", ScoreWG];
            TheAmountWG = 6;
            break;
        case 11:
            cOneWG = 'u';
            cTwoWG = 'm';
            cThreeWG = 'n';
            cFourWG = 'h';
            
            pOneWG.image = [UIImage imageNamed:@"U.png"];
            pTwoWG.image = [UIImage imageNamed:@"M.png"];
            pThreeWG.image = [UIImage imageNamed:@"N.png"];
            pFourWG.image = [UIImage imageNamed:@"H.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 6", ScoreWG];
            TheAmountWG = 6;
            break;
        case 12:
            cOneWG = 'x';
            cTwoWG = 'i';
            cThreeWG = 'u';
            cFourWG = 'p';
            
            pOneWG.image = [UIImage imageNamed:@"X.png"];
            pTwoWG.image = [UIImage imageNamed:@"I.png"];
            pThreeWG.image = [UIImage imageNamed:@"U.png"];
            pFourWG.image = [UIImage imageNamed:@"P.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 4", ScoreWG];
            TheAmountWG = 4;
            break;
        case 13:
            cOneWG = 'y';
            cTwoWG = 'a';
            cThreeWG = 'e';
            cFourWG = 'x';
            
            pOneWG.image = [UIImage imageNamed:@"Y.png"];
            pTwoWG.image = [UIImage imageNamed:@"A.png"];
            pThreeWG.image = [UIImage imageNamed:@"E.png"];
            pFourWG.image = [UIImage imageNamed:@"X.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 6", ScoreWG];
            TheAmountWG = 6;
            break;
        case 14:
            cOneWG = 'w';
            cTwoWG = 'o';
            cThreeWG = 'e';
            cFourWG = 't';
            
            pOneWG.image = [UIImage imageNamed:@"W.png"];
            pTwoWG.image = [UIImage imageNamed:@"O.png"];
            pThreeWG.image = [UIImage imageNamed:@"E.png"];
            pFourWG.image = [UIImage imageNamed:@"T.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 6", ScoreWG];
            TheAmountWG = 6;
            break;
        case 15:
            cOneWG = 't';
            cTwoWG = 'u';
            cThreeWG = 'z';
            cFourWG = 'p';
            
            pOneWG.image = [UIImage imageNamed:@"T.png"];
            pTwoWG.image = [UIImage imageNamed:@"U.png"];
            pThreeWG.image = [UIImage imageNamed:@"Z.png"];
            pFourWG.image = [UIImage imageNamed:@"P.png"];
            
            TotalAmountWG.text = [NSString stringWithFormat:@"%i OF 2", ScoreWG];
            TheAmountWG = 2;
            break;
        default:
            break;
    }
    
    [self GetTheWord];
    
    iLeftWG = ikTwoWG - ikOneWG;
    iUpWG = iktOneWG - iktThreeWG;
}

-(void)Swipes
{
    PanningSensitivityWG = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneWG.userInteractionEnabled = YES;
    [pOneWG addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoWG.userInteractionEnabled = YES;
    [pTwoWG addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeWG.userInteractionEnabled = YES;
    [pThreeWG addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourWG.userInteractionEnabled = YES;
    [pFourWG addGestureRecognizer:panFour];
    
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    UISwipeGestureRecognizer *gesture;
    
    distanceWG = [sender translationInView:self.view];
    PanningIntWG++;
    PPanningMethodWG = 1;
    
    
    if ((gesture.direction == UISwipeGestureRecognizerDirectionDown || gesture.direction == UISwipeGestureRecognizerDirectionUp) && PreviousWG == 0) {
        [self Horizontal];
        PreviousWG = 2;
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 1) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Verticle];
            PanningIntWG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 2) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Horizontal];
            PanningIntWG = 0;
        }
    } else if (distanceWG.x > 0 || distanceWG.x < 0) {
        if ((distanceWG.y > 0 || distanceWG.y < 0) && ((distanceWG.x > 0 && distanceWG.x < 10) || (distanceWG.x < 0 && distanceWG.x > -10))) {
            PreviousWG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWG = 1;
        }
    } else if (distanceWG.y > 0 || distanceWG.y < 0) {
        PreviousWG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWG = 0;
        PreviousWG = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceWG = [sender translationInView:self.view];
    PanningIntWG++;
    PPanningMethodWG = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 1) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Verticle];
            PanningIntWG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 2) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Horizontal];
            PanningIntWG = 0;
        }
    } else if (distanceWG.x > 0 || distanceWG.x < 0) {
        if ((distanceWG.y > 0 || distanceWG.y < 0) && ((distanceWG.x > 0 && distanceWG.x < 10) || (distanceWG.x < 0 && distanceWG.x > -10))) {
            PreviousWG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWG = 1;
        }
    } else if (distanceWG.y > 0 || distanceWG.y < 0) {
        PreviousWG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWG = 0;
        PreviousWG = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceWG = [sender translationInView:self.view];
    PanningIntWG++;
    PPanningMethodWG = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 1) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Verticle];
            PanningIntWG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 2) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Horizontal];
            PanningIntWG = 0;
        }
    } else if (distanceWG.x > 0 || distanceWG.x < 0) {
        if ((distanceWG.y > 0 || distanceWG.y < 0) && ((distanceWG.x > 0 && distanceWG.x < 10) || (distanceWG.x < 0 && distanceWG.x > -10))) {
            PreviousWG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWG = 1;
        }
    } else if (distanceWG.y > 0 || distanceWG.y < 0) {
        PreviousWG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWG = 0;
        PreviousWG = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceWG = [sender translationInView:self.view];
    PanningIntWG++;
    PPanningMethodWG = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 1) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Verticle];
            PanningIntWG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousWG == 2) {
        if (PanningIntWG == PanningSensitivityWG) {
            [self Horizontal];
            PanningIntWG = 0;
        }
    } else if (distanceWG.x > 0 || distanceWG.x < 0) {
        if ((distanceWG.y > 0 || distanceWG.y < 0) && ((distanceWG.x > 0 && distanceWG.x < 10) || (distanceWG.x < 0 && distanceWG.x > -10))) {
            PreviousWG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousWG = 1;
        }
    } else if (distanceWG.y > 0 || distanceWG.y < 0) {
        PreviousWG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntWG = 0;
        PreviousWG = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneWG = pOneWG.center.x;
    yOneWG = pOneWG.center.y;
    xTwoWG = pTwoWG.center.x;
    yTwoWG = pTwoWG.center.y;
    xThreeWG = pThreeWG.center.x;
    yThreeWG = pThreeWG.center.y;
    xFourWG = pFourWG.center.x;
    yFourWG = pFourWG.center.y;
    
    switch (PPanningMethodWG) {
        case 1:
            pointOfIntrestWG = pOneWG.center.x;
            break;
        case 2:
            pointOfIntrestWG = pTwoWG.center.x;
            break;
        case 3:
            pointOfIntrestWG = pThreeWG.center.x;
            break;
        case 4:
            pointOfIntrestWG = pFourWG.center.x;
            break;
        default:
            break;
    }
    
    if (distanceWG.y < 0) {
        
        if (pointOfIntrestWG == pOneWG.center.x) {
            pOneWG.center = CGPointMake(pOneWG.center.x, pOneWG.center.y - iLeftWG);
        }
        if (pointOfIntrestWG == pTwoWG.center.x) {
            pTwoWG.center = CGPointMake(pTwoWG.center.x, pTwoWG.center.y - iLeftWG);
        }
        if (pointOfIntrestWG == pThreeWG.center.x) {
            pThreeWG.center = CGPointMake(pThreeWG.center.x , pThreeWG.center.y - iLeftWG);
        }
        if (pointOfIntrestWG == pFourWG.center.x) {
            pFourWG.center = CGPointMake(pFourWG.center.x, pFourWG.center.y - iLeftWG);
        }
    } else if (distanceWG.y > 0) {
        
        if (pointOfIntrestWG == pOneWG.center.x) {
            pOneWG.center = CGPointMake(pOneWG.center.x, pOneWG.center.y+ iLeftWG);
        }
        if (pointOfIntrestWG == pTwoWG.center.x) {
            pTwoWG.center = CGPointMake(pTwoWG.center.x, pTwoWG.center.y+ iLeftWG);
        }
        if (pointOfIntrestWG == pThreeWG.center.x) {
            pThreeWG.center = CGPointMake(pThreeWG.center.x , pThreeWG.center.y+ iLeftWG);
        }
        if (pointOfIntrestWG == pFourWG.center.x) {
            pFourWG.center = CGPointMake(pFourWG.center.x, pFourWG.center.y+ iLeftWG);
        }
    }
    
    if (pOneWG.center.x != pointOfIntrestWG) {
        pOneWG.alpha = 1;
        pOneWG.hidden = NO;
        pOneWG.center = CGPointMake(xOneWG, yOneWG);
    }
    if (pTwoWG.center.x != pointOfIntrestWG) {
        pTwoWG.alpha = 1;
        pTwoWG.hidden = NO;
        pTwoWG.center = CGPointMake(xTwoWG, yTwoWG);
    }
    if (pThreeWG.center.x != pointOfIntrestWG) {
        pThreeWG.alpha = 1;
        pThreeWG.hidden = NO;
        pThreeWG.center = CGPointMake(xThreeWG, yThreeWG);
    }
    
    if (pOneWG.center.y > iktThreeWG) {
        pOneWG.center = CGPointMake(pOneWG.center.x, iktOneWG);
    }
    if (pTwoWG.center.y > iktThreeWG) {
        pTwoWG.center = CGPointMake(pTwoWG.center.x, iktOneWG);
    }
    if (pThreeWG.center.y > iktThreeWG) {
        pThreeWG.center = CGPointMake(pThreeWG.center.x, iktOneWG);
    }
    if (pFourWG.center.y > iktThreeWG) {
        pFourWG.center = CGPointMake(pFourWG.center.x,iktOneWG );
    }
    
    if (pOneWG.center.y < iktOneWG) {
        pOneWG.center = CGPointMake(pOneWG.center.x, iktThreeWG);
    }
    if (pTwoWG.center.y < iktOneWG) {
        pTwoWG.center = CGPointMake(pTwoWG.center.x, iktThreeWG);
    }
    if (pThreeWG.center.y < iktOneWG) {
        pThreeWG.center = CGPointMake(pThreeWG.center.x, iktThreeWG);
    }
    if (pFourWG.center.y < iktOneWG) {
        pFourWG.center = CGPointMake(pFourWG.center.x, iktThreeWG);
    }
}

-(void)Verticle
{
    xOneWG = pOneWG.center.x;
    yOneWG = pOneWG.center.y;
    xTwoWG = pTwoWG.center.x;
    yTwoWG = pTwoWG.center.y;
    xThreeWG = pThreeWG.center.x;
    yThreeWG = pThreeWG.center.y;
    xFourWG = pFourWG.center.x;
    yFourWG = pFourWG.center.y;
    
    switch (PPanningMethodWG) {
        case 1:
            pointOfIntrestWG = pOneWG.center.y;
            break;
        case 2:
            pointOfIntrestWG = pTwoWG.center.y;
            break;
        case 3:
            pointOfIntrestWG = pThreeWG.center.y;
            break;
        case 4:
            pointOfIntrestWG = pFourWG.center.y;
            break;
        default:
            break;
    }
    
    if (distanceWG.x > 0) {
        
        if (pointOfIntrestWG == pOneWG.center.y) {
            pOneWG.center = CGPointMake(pOneWG.center.x + iLeftWG, pOneWG.center.y);
        }
        if (pointOfIntrestWG == pTwoWG.center.y) {
            pTwoWG.center = CGPointMake(pTwoWG.center.x + iLeftWG, pTwoWG.center.y);
        }
        if (pointOfIntrestWG == pThreeWG.center.y) {
            pThreeWG.center = CGPointMake(pThreeWG.center.x + iLeftWG, pThreeWG.center.y);
        }
        if (pointOfIntrestWG == pFourWG.center.y) {
            pFourWG.center = CGPointMake(pFourWG.center.x + iLeftWG, pFourWG.center.y);
        }
        
    } else if (distanceWG.x < 0) {
        
        if (pointOfIntrestWG == pOneWG.center.y) {
            pOneWG.center = CGPointMake(pOneWG.center.x - iLeftWG, pOneWG.center.y);
        }
        if (pointOfIntrestWG == pTwoWG.center.y) {
            pTwoWG.center = CGPointMake(pTwoWG.center.x - iLeftWG, pTwoWG.center.y);
        }
        if (pointOfIntrestWG == pThreeWG.center.y) {
            pThreeWG.center = CGPointMake(pThreeWG.center.x - iLeftWG, pThreeWG.center.y);
        }
        if (pointOfIntrestWG == pFourWG.center.y) {
            pFourWG.center = CGPointMake(pFourWG.center.x - iLeftWG, pFourWG.center.y);
        }
    }
    
    if (pOneWG.center.y != pointOfIntrestWG) {
        pOneWG.alpha = 1;
        pOneWG.hidden = NO;
        pOneWG.center = CGPointMake(xOneWG, yOneWG);
    }
    if (pTwoWG.center.y != pointOfIntrestWG) {
        pTwoWG.alpha = 1;
        pTwoWG.hidden = NO;
        pTwoWG.center = CGPointMake(xTwoWG, yTwoWG);
    }
    if (pThreeWG.center.y != pointOfIntrestWG) {
        pThreeWG.alpha = 1;
        pThreeWG.hidden = NO;
        pThreeWG.center = CGPointMake(xThreeWG, yThreeWG);
    }
    if (pFourWG.center.y != pointOfIntrestWG) {
        pFourWG.alpha = 1;
        pFourWG.hidden = NO;
        pFourWG.center = CGPointMake(xFourWG, yFourWG);
    }
    
    if (pOneWG.center.x < ikOneWG) {
        pOneWG.center = CGPointMake(ikTwoWG, pOneWG.center.y);
    }
    if (pTwoWG.center.x < ikOneWG) {
        pTwoWG.center = CGPointMake(ikTwoWG, pTwoWG.center.y);
    }
    if (pThreeWG.center.x < ikOneWG) {
        pThreeWG.center = CGPointMake(ikTwoWG, pThreeWG.center.y);
    }
    if (pFourWG.center.x < ikOneWG) {
        pFourWG.center = CGPointMake(ikTwoWG, pFourWG.center.y);
    }
    
    if (pOneWG.center.x > ikTwoWG) {
        pOneWG.center = CGPointMake(ikOneWG, pOneWG.center.y);
    }
    if (pTwoWG.center.x > ikTwoWG) {
        pTwoWG.center = CGPointMake(ikOneWG, pTwoWG.center.y);
    }
    if (pThreeWG.center.x > ikTwoWG) {
        pThreeWG.center = CGPointMake(ikOneWG, pThreeWG.center.y);
    }
    if (pFourWG.center.x > ikTwoWG) {
        pFourWG.center = CGPointMake(ikOneWG, pFourWG.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SwipeSoundWG play];
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
            if ([str isEqual:WordWG] && WordIsAlreadyDoneWG[i] == NO) {
                WordIsAlreadyDoneWG[i] = YES;
                ScoreWG = ScoreWG + 1;
                TotalAmountWG.text = [NSString stringWithFormat:@"%i OF  %i", ScoreWG, TheAmountWG];
                SaveWordsWG = [NSString stringWithFormat:@"%@ %@", SaveWordsWG, str];
            }
        }
        
    }
    
    if (WordTwo == 1) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo1"];
    } else if (WordTwo == 2) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo2"];
    } else if (WordTwo == 3) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo3"];
    } else if (WordTwo == 4) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo4"];
    } else if (WordTwo == 5) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo5"];
    } else if (WordTwo == 6) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo6"];
    } else if (WordTwo == 7) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo7"];
    } else if (WordTwo == 8) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo8"];
    } else if (WordTwo == 9) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo9"];
    } else if (WordTwo == 10) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo10"];
    } else if (WordTwo == 11) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo11"];
    } else if (WordTwo == 12) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo12"];
    } else if (WordTwo == 13) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo13"];
    } else if (WordTwo == 14) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo14"];
    } else if (WordTwo == 15) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo15"];
    }
    
    if (ScoreWG == TheAmountWG) {
        [self PlayAnimation];
    }
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    if (WordTwo == 1) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo1"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo1"];
    } else if (WordTwo == 2) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo2"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo2"];
    } else if (WordTwo == 3) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo3"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo3"];
    } else if (WordTwo == 4) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo4"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo4"];
    } else if (WordTwo == 5) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo5"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo5"];
    } else if (WordTwo == 6) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo6"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo6"];
    } else if (WordTwo == 7) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo7"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo7"];
    } else if (WordTwo == 8) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo8"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo8"];
    } else if (WordTwo == 9) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo9"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo9"];
    } else if (WordTwo == 10) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo10"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo10"];
    } else if (WordTwo == 11) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo11"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo11"];
    } else if (WordTwo == 12) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo12"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo12"];
    } else if (WordTwo == 13) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo13"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo13"];
    } else if (WordTwo == 14) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo14"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo14"];
    } else if (WordTwo == 15) {
        SaveWordsWG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridTwo15"];
        SaveWordsWG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsWG forKey:@"SaveTheWordsForGridTwo15"];
    }
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        TileOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWG.center.x - 75, pOneWG.center.y - 75, pOneWG.bounds.size.width, pOneWG.bounds.size.height)];
        TileTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWG.center.x-75, pTwoWG.center.y-75, pTwoWG.bounds.size.width, pTwoWG.bounds.size.height)];
        TileThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWG.center.x-75, pThreeWG.center.y-75, pThreeWG.bounds.size.width, pThreeWG.bounds.size.height)];
        TileFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWG.center.x-75, pFourWG.center.y-75, pFourWG.bounds.size.width, pFourWG.bounds.size.height)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            TileOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWG.center.x-50, pOneWG.center.y-50, pOneWG.bounds.size.width, pOneWG.bounds.size.height)];
            TileTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWG.center.x-50, pTwoWG.center.y-50, pTwoWG.bounds.size.width, pTwoWG.bounds.size.height)];
            TileThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWG.center.x-50, pThreeWG.center.y-50, pThreeWG.bounds.size.width, pThreeWG.bounds.size.height)];
            TileFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWG.center.x-50, pFourWG.center.y-50, pFourWG.bounds.size.width, pFourWG.bounds.size.height)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            
            TileOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWG.center.x-55, pOneWG.center.y-55, pOneWG.bounds.size.width, pOneWG.bounds.size.height)];
            TileTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWG.center.x-55, pTwoWG.center.y-55, pTwoWG.bounds.size.width, pTwoWG.bounds.size.height)];
            TileThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWG.center.x-55, pThreeWG.center.y-55, pThreeWG.bounds.size.width, pThreeWG.bounds.size.height)];
            TileFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWG.center.x-55, pFourWG.center.y-55, pFourWG.bounds.size.width, pFourWG.bounds.size.height)];
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            TileOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWG.center.x-58, pOneWG.center.y-58, pOneWG.bounds.size.width, pOneWG.bounds.size.height)];
            TileTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWG.center.x-58, pTwoWG.center.y-58, pTwoWG.bounds.size.width, pTwoWG.bounds.size.height)];
            TileThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWG.center.x-58, pThreeWG.center.y-58, pThreeWG.bounds.size.width, pThreeWG.bounds.size.height)];
            TileFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWG.center.x-58, pFourWG.center.y-58, pFourWG.bounds.size.width, pFourWG.bounds.size.height)];
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            TileOneWG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneWG.center.x-60, pOneWG.center.y-60, pOneWG.bounds.size.width, pOneWG.bounds.size.height)];
            TileTwoWG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoWG.center.x-60, pTwoWG.center.y-60, pTwoWG.bounds.size.width, pTwoWG.bounds.size.height)];
            TileThreeWG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeWG.center.x-60, pThreeWG.center.y-60, pThreeWG.bounds.size.width, pThreeWG.bounds.size.height)];
            TileFourWG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourWG.center.x-60, pFourWG.center.y-60, pFourWG.bounds.size.width, pFourWG.bounds.size.height)];
        }
    }
    
    TileOneWG.backgroundColor = [UIColor whiteColor];
    TileTwoWG.backgroundColor = [UIColor whiteColor];
    TileThreeWG.backgroundColor = [UIColor whiteColor];
    TileFourWG.backgroundColor = [UIColor whiteColor];
    
    TileOneWG.alpha = 0;
    TileTwoWG.alpha = 0;
    TileThreeWG.alpha = 0;
    TileFourWG.alpha = 0;
    
    [self.view addSubview:TileOneWG];
    [self.view addSubview:TileTwoWG];
    [self.view addSubview:TileThreeWG];
    [self.view addSubview:TileFourWG];
    
    TileOneWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneWG.alpha = 1;
    TileOneWG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoWG.alpha = 1;
    TileTwoWG.transform = CGAffineTransformMakeScale(1, 1);
    TileThreeWG.alpha = 1;
    TileThreeWG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileFourWG.alpha = 1;
    TileFourWG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordWG.alpha = 0;
    TheCurrentWordWG.alpha = 0;
    SenderDisplayWG.alpha = 0;
    PauseWG.alpha = 0;
    CheckWG.alpha = 0;
    pOneWG.alpha = 0;
    pTwoWG.alpha = 0;
    pThreeWG.alpha = 0;
    pFourWG.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountWG.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountWG.alpha = 0;
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
    [TileOneWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourWG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneWG.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoWG.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeWG.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourWG.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneWG.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoWG.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeWG.transform = CGAffineTransformMakeScale(10, 10);
    TileFourWG.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountWG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
}

-(void)GetTheWord
{
    xOneWG = pOneWG.center.x;
    yOneWG = pOneWG.center.y;
    xTwoWG = pTwoWG.center.x;
    yTwoWG = pTwoWG.center.y;
    xThreeWG = pThreeWG.center.x;
    yThreeWG = pThreeWG.center.y;
    xFourWG = pFourWG.center.x;
    yFourWG = pFourWG.center.y;
    
    if (pOneWG.center.y == iktOneWG) {
        if (pOneWG.center.x == ikOneWG) {
            wOneWG = cOneWG;
        } else if (pOneWG.center.x == ikTwoWG) {
            wTwoWG = cOneWG;
        }
    }
    
    if (pTwoWG.center.y == iktOneWG) {
        if (pTwoWG.center.x == ikOneWG) {
            wOneWG = cTwoWG;
        } else if (pTwoWG.center.x == ikTwoWG) {
            wTwoWG = cTwoWG;
        }
    }
    
    if (pThreeWG.center.y == iktOneWG) {
        if (pThreeWG.center.x == ikOneWG) {
            wOneWG = cThreeWG;
        } else if (pThreeWG.center.x == ikTwoWG) {
            wTwoWG = cThreeWG;
        }
    }
    
    if (pFourWG.center.y == iktOneWG) {
        if (pFourWG.center.x == ikOneWG) {
            wOneWG = cFourWG;
        } else if (pFourWG.center.x == ikTwoWG) {
            wTwoWG = cFourWG;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneWG];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoWG];

    WordWG = [NSString stringWithFormat:@"%@%@", Ones, Twos];
    TheCurrentWordWG.text = [WordWG uppercaseString];
    
    pOneWG.center = CGPointMake(xOneWG, yOneWG);
    pTwoWG.center = CGPointMake(xTwoWG, yTwoWG);
    pThreeWG.center = CGPointMake(xThreeWG, yThreeWG);
    pFourWG.center = CGPointMake(xFourWG, yFourWG);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseWG setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoWG play];
    
    PauseWG.userInteractionEnabled = NO;
    CheckWG.userInteractionEnabled = NO;
    PauseDisplayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsWG.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeWG.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayWG.alpha = 1.0;
        CurrentWordsWG.alpha = 1;
        PlayWG.alpha = 1;
        HomeWG.alpha = 1;
        PauseDisplayWG.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeWG.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayWG.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        CheckWG.alpha = 0;
        TheCurrentWordWG.alpha = 0;
        BarUnderWordWG.alpha = 0;
        SenderDisplayWG.alpha = 0;
        TotalAmountWG.alpha = 0;
        PauseWG.alpha = 0;
        
        CheckWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        PauseWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        pOneWG.alpha = 0;
        pTwoWG.alpha = 0;
        pThreeWG.alpha = 0;
        pFourWG.alpha = 0;
    }];
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerWG = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerWG = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerWG = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerWG = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerWG = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerWG.scrollEnabled = YES;
    WordScrollerWG.userInteractionEnabled = YES;
    WordScrollerWG.backgroundColor = [UIColor blackColor];
    WordScrollerWG.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerWG.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerWG aboveSubview:PauseDisplayWG];
    if (ScoreWG > 0) {
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
                    if (WordIsAlreadyDoneWG[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerWG.subviews) {
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
                            WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerWG addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneWG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWG.subviews) {
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
                                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerWG addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneWG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWG.subviews) {
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
                                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerWG addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneWG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWG.subviews) {
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
                                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerWG addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneWG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerWG.subviews) {
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
                                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerWG addSubview:lbl];
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
            [WordScrollerWG addSubview:lbll];
            WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWG addSubview:lbll];
                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWG addSubview:lbll];
                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWG addSubview:lbll];
                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerWG addSubview:lbll];
                WordScrollerWG.contentSize = CGSizeMake(WordScrollerWG.bounds.size.width, lbll.center.y + 50);
            }
        }
    }}

-(IBAction)Play:(id)sender
{
    [SoundOneWG play];
    [SoundTwoWG play];
    
    for (UIView *v in WordScrollerWG.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerWG removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayWG.alpha = 0;
        HomeWG.alpha = 0;
        PlayWG.alpha = 0;
        CurrentWordsWG.alpha = 0;
        CheckWG.userInteractionEnabled = YES;
        PauseWG.userInteractionEnabled = YES;
        
        PauseDisplayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        CheckWG.alpha = 1;
        TheCurrentWordWG.alpha = 1;
        BarUnderWordWG.alpha = 1;
        SenderDisplayWG.alpha = 1;
        TotalAmountWG.alpha = 1;
        PauseWG.alpha = 1;
        
        CheckWG.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordWG.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordWG.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayWG.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountWG.transform =CGAffineTransformMakeScale(1,1);
        PauseWG.transform =CGAffineTransformMakeScale(1,1);
        
        pOneWG.alpha = 1;
        pTwoWG.alpha = 1;
        pThreeWG.alpha = 1;
        pFourWG.alpha = 1;
        
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneWG play];
    [SoundTwoWG play];
    
    for (UIView *v in WordScrollerWG.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerWG removeFromSuperview];
    CheckWG.transform =CGAffineTransformMakeScale(1,1);
    BarUnderWordWG.transform =CGAffineTransformMakeScale(1,1);
    SenderDisplayWG.transform =CGAffineTransformMakeScale(1,1);
    TotalAmountWG.transform =CGAffineTransformMakeScale(1,1);
    PauseWG.transform =CGAffineTransformMakeScale(1,1);
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayWG.alpha = 0;
        HomeWG.alpha = 0;
        PlayWG.alpha = 0;
        CurrentWordsWG.alpha = 0;
        
        CheckWG.userInteractionEnabled = YES;
        PauseWG.userInteractionEnabled = YES;
        
        PauseDisplayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeWG.transform =CGAffineTransformMakeScale(1.3,1.3);
    }];
    
    [pOneWG setAlpha:0];
    [pTwoWG setAlpha:0];
    [pThreeWG setAlpha:0];
    [pFourWG setAlpha:0];
    [BarUnderWordWG setAlpha:0];
    [TheCurrentWordWG setAlpha:0];
    [CheckWG setAlpha:0];
    [PauseWG setAlpha:0];
    [SenderDisplayWG setAlpha:0];
    [TotalAmountWG setAlpha:0];

    [self BackToHome];
}

-(void)BackToHome
{
    for (int i = 0; i <= 93; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneWG[i] = NO;
        }
    }
    
    moverWG = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjectsBack) userInfo:nil repeats:YES];
    
    ScoreWG = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    
    [tHomeWG setAlpha:1];
    
    [sOneWG setAlpha:1];
    [sTwoWG setAlpha:1];
    [sThreeWG setAlpha:1];
    [sFourWG setAlpha:1];
    [sFiveWG setAlpha:1];
    [sSixWG setAlpha:1];
    [sSevenWG setAlpha:1];
    [sEightWG setAlpha:1];
    [sNineWG setAlpha:1];
    [sTenWG setAlpha:1];
    [sElevenWG setAlpha:1];
    [sTwelveWG setAlpha:1];
    [sThirteenWG setAlpha:1];
    [sFourteenWG setAlpha:1];
    [sFithteenWG setAlpha:1];
    
    [UIView commitAnimations];
    
    [TileOneWG removeFromSuperview];
    [TileTwoWG removeFromSuperview];
    [TileThreeWG removeFromSuperview];
    [TileFourWG removeFromSuperview];
    
    pOneWG.center = CGPointMake(ikOneWG, iktOneWG);
    pTwoWG.center = CGPointMake(ikTwoWG, iktTwoWG);
    pThreeWG.center = CGPointMake(ikThreeWG, iktThreeWG);
    pFourWG.center = CGPointMake(ikFourWG, iktFourWG);
}

-(void)MovingTheObjectsBack
{
    int a;
    a = 1;
    
    sOneWG.center = CGPointMake(sOneWG.center.x, sOneWG.center.y + a);
    sTwoWG.center = CGPointMake(sTwoWG.center.x , sTwoWG.center.y + a);
    sThreeWG.center = CGPointMake(sThreeWG.center.x , sThreeWG.center.y + a);
    sFourWG.center = CGPointMake(sFourWG.center.x , sFourWG.center.y + a);
    sFiveWG.center = CGPointMake(sFiveWG.center.x , sFiveWG.center.y + a);
    sSixWG.center = CGPointMake(sSixWG.center.x , sSixWG.center.y + a);
    sSevenWG.center = CGPointMake(sSevenWG.center.x , sSevenWG.center.y + a);
    sEightWG.center = CGPointMake(sEightWG.center.x , sEightWG.center.y + a);
    sNineWG.center = CGPointMake(sNineWG.center.x , sNineWG.center.y + a);
    sTenWG.center = CGPointMake(sTenWG.center.x , sTenWG.center.y + a);
    sElevenWG.center = CGPointMake(sElevenWG.center.x , sElevenWG.center.y + a);
    sTwelveWG.center = CGPointMake(sTwelveWG.center.x , sTwelveWG.center.y + a);
    sThirteenWG.center = CGPointMake(sThirteenWG.center.x , sThirteenWG.center.y + a);
    sFourteenWG.center = CGPointMake(sFourteenWG.center.x , sFourteenWG.center.y + a);
    sFithteenWG.center = CGPointMake(sFithteenWG.center.x , sFithteenWG.center.y + a);
    
    if (sNineWG.center.y >= kSelectionWG) {
        [moverWG invalidate];
        moverWG = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        
        BBSelectionWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        gTwoWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        gOneWG.transform =CGAffineTransformMakeScale(1.3,1.3);
        [UIView animateWithDuration:0.25 animations:^{
            gOneWG.alpha = 1.0;
            gTwoWG.alpha = 1;
            BBSelectionWG.alpha = 1;
            
            gOneWG.transform =CGAffineTransformMakeScale(1.0,1.0);
            gTwoWG.transform =CGAffineTransformMakeScale(1.0,1.0);
            BBSelectionWG.transform =CGAffineTransformMakeScale(1.0,1.0);
        }];
    }
}

-(IBAction)gTwo:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOneWG setAlpha:0];
    [sTwoWG setAlpha:0];
    [sThreeWG setAlpha:0];
    [sFourWG setAlpha:0];
    [sFiveWG setAlpha:0];
    [sSixWG setAlpha:0];
    [sSevenWG setAlpha:0];
    [sEightWG setAlpha:0];
    [sNineWG setAlpha:0];
    [sTenWG setAlpha:0];
    [sElevenWG setAlpha:0];
    [sTwelveWG setAlpha:0];
    [sThirteenWG setAlpha:0];
    [sFourteenWG setAlpha:0];
    [sFithteenWG setAlpha:0];
    [BBSelectionWG setAlpha:0];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneWG.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"GTCTwo" sender:self];
}

-(IBAction)tHome:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourWG.alpha = 0;
        BackGroundFourWG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourWG.alpha = 1;
                             BackGroundFourWG.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoToHomeFromTwoGrids" sender:self];
}

@end