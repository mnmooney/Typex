//
//  ThreeGrids.m
//  Typex V2
//
//  Created by Michael Mooney on 22/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "ThreeGrids.h"
#import <AVFoundation/AVFoundation.h>

NSInteger WordThree;
NSString *WordTG, *SavedWordTG;

int replayTG, ScoreTG, PreviousTG, PanningIntTG, PPanningMethodTG;
NSInteger PanningSensitivityTG;
int TheAmountTG;

char cOneTG, cTwoTG, cThreeTG, cFourTG, cFiveTG, cSixTG, cSevenTG, cEightTG, cNineTG;
char wOneTG, wTwoTG, wThreeTG;

float ikOneTG, ikTwoTG, ikThreeTG, ikFourTG, ikFiveTG, ikSixTG, ikSevenTG, ikEightTG, ikNineTG;
float iktOneTG, iktTwoTG, iktThreeTG, iktFourTG, iktFiveTG, iktSixTG, iktSevenTG, iktEightTG, iktNineTG;
float iLeftTG, iRightTG, iUpTG, iDownTG;
float pointOfIntrestTG;
float xOneTG, yOneTG, xTwoTG, yTwoTG, xThreeTG, yThreeTG, xFourTG, yFourTG, xFiveTG, yFiveTG, xSixTG, ySixTG, xSevenTG, ySevenTG, xEightTG, yEightTG, xNineTG, yNineTG;
float kSelectionTG;
CGPoint OneTG, TwoTG, ThreeTG, FourTG, FiveTG, SixTG, SevenTG, EightTG, NineTG, distanceTG;

BOOL WordIsAlreadyDoneTG[956];

@interface ThreeGrids () <AVAudioPlayerDelegate>
{
    AVAudioPlayer *SoundOneTG, *SoundTwoTG, *SwipeSoundTG;
    
#pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeTG, *CheckTG;
    IBOutlet UIImageView *BackGroundOneTG, *BackGroundTwoTG, *BackGroundThreeTG, *BackGroundFourTG;
    
#pragma Mark Game - Grids
    IBOutlet UIImageView *pOneTG, *pTwoTG, *pThreeTG, *pFourTG, *pFiveTG, *pSixTG, *pSevenTG, *pEightTG, *pNineTG;
    IBOutlet UILabel *TotalAmountTG;
    IBOutlet UIButton *PauseTG;
    IBOutlet UILabel *TheCurrentWordTG;
    IBOutlet UIImageView *PauseDisplayTG, *SenderDisplayTG;
    IBOutlet UIButton *HomeTG, *PlayTG;
    IBOutlet UIImageView *BarUnderWordTG;
    IBOutlet UIImageView *BBSelectionTG;
    IBOutlet UIImageView *TileOneTG, *TileTwoTG, *TileThreeTG, *TileFourTG, *TileFiveTG, *TileSixTG, *TileSevenTG, *TileEightTG, *TileNineTG;
    
#pragma Mark Selection - Fist Page
    IBOutlet UIButton *sOneTG, *sTwoTG, *sThreeTG, *sFourTG, *sFiveTG, *sSixTG, *sSevenTG, *sEightTG, *sNineTG, *sTenTG, *sElevenTG, *sTwelveTG, *sThirteenTG, *sFourteenTG, *sFithteenTG;
    IBOutlet UIButton *gOneTG, *gTwoTG, *gThreeTG;
    IBOutlet UIScrollView *WordScrollerTG;
    IBOutlet UILabel *CurrentWordsTG;
    NSTimer *moverTG;
}
@end

@implementation ThreeGrids


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

    BackGroundFourTG.alpha = 0;
    
    WordScrollerTG.alpha = 0;
    WordScrollerTG.scrollEnabled = YES;
    WordScrollerTG.userInteractionEnabled = YES;
    
#pragma Mark The Game Items
    
    ScoreTG = 0;
    
    PauseTG.alpha = 0;
    CheckTG.alpha = 0;
    TotalAmountTG.alpha = 0;
    
    pOneTG.alpha = 0;
    pTwoTG.alpha = 0;
    pThreeTG.alpha = 0;
    CurrentWordsTG.alpha = 0;
    PlayTG.alpha = 0;
    HomeTG.alpha = 0;
    pFourTG.alpha = 0;
    pFiveTG.alpha = 0;
    pSixTG.alpha = 0;
    pSevenTG.alpha = 0;
    pEightTG.alpha = 0;
    pNineTG.alpha = 0;
    BarUnderWordTG.alpha = 0;
    SenderDisplayTG.alpha = 0;
    TheCurrentWordTG.alpha = 0;
    PauseDisplayTG.alpha = 0;
    
#pragma Mark The Selection Page
    
    sOneTG.alpha = 0;
    sTwoTG.alpha = 0;
    sThreeTG.alpha = 0;
    sFourTG.alpha = 0;
    sFiveTG.alpha = 0;
    sSixTG.alpha = 0;
    sSevenTG.alpha = 0;
    sEightTG.alpha = 0;
    sNineTG.alpha = 0;
    sTenTG.alpha = 0;
    sElevenTG.alpha = 0;
    sTwelveTG.alpha = 0;
    sThirteenTG.alpha = 0;
    sFourteenTG.alpha = 0;
    sFithteenTG.alpha = 0;
    PauseDisplayTG.backgroundColor = [UIColor blackColor];
    BOOL HomeFG = [[NSUserDefaults standardUserDefaults] boolForKey:@"IsItComingInFromHomeScreen"];
    
    if (HomeFG == YES) {
        tHomeTG.alpha = 0;
        gOneTG.alpha = 0;
        gTwoTG.alpha = 0;
        gThreeTG.alpha = 0;
        BBSelectionTG.alpha = 0;
    } else {
        tHomeTG.alpha = 1;
        gOneTG.alpha = 1;
        gTwoTG.alpha = 1;
        gThreeTG.alpha = 1;
        BBSelectionTG.alpha =1;
    }
    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneTG = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoTG = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSoundTG = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
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
    [gOneTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gThreeTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        sOneTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwoTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThreeTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFiveTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSixTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSevenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sEightTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sNineTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sElevenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwelveTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThirteenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourteenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFithteenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            sOneTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwoTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThreeTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFiveTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSixTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSevenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sEightTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sNineTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sElevenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwelveTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThirteenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourteenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFithteenTG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                sOneTG.transform = CGAffineTransformIdentity;
                sTwoTG.transform = CGAffineTransformIdentity;
                sThreeTG.transform = CGAffineTransformIdentity;
                sFourTG.transform = CGAffineTransformIdentity;
                sFiveTG.transform = CGAffineTransformIdentity;
                sSixTG.transform = CGAffineTransformIdentity;
                sSevenTG.transform = CGAffineTransformIdentity;
                sEightTG.transform = CGAffineTransformIdentity;
                sNineTG.transform = CGAffineTransformIdentity;
                sTenTG.transform = CGAffineTransformIdentity;
                sElevenTG.transform = CGAffineTransformIdentity;
                sTwelveTG.transform = CGAffineTransformIdentity;
                sThirteenTG.transform = CGAffineTransformIdentity;
                sFourteenTG.transform = CGAffineTransformIdentity;
                sFithteenTG.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    tHomeTG.alpha = 1;
    gOneTG.alpha = 1;
    gTwoTG.alpha = 1;
    gThreeTG.alpha = 1;
    BBSelectionTG.alpha = 1;
    sOneTG.alpha = 1;
    sTwoTG.alpha = 1;
    sThreeTG.alpha = 1;
    sFourTG.alpha = 1;
    sFiveTG.alpha = 1;
    sSixTG.alpha = 1;
    sSevenTG.alpha = 1;
    sEightTG.alpha = 1;
    sNineTG.alpha = 1;
    sTenTG.alpha = 1;
    sElevenTG.alpha = 1;
    sTwelveTG.alpha = 1;
    sThirteenTG.alpha = 1;
    sFourteenTG.alpha = 1;
    sFithteenTG.alpha = 1;
    [UIView commitAnimations];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        SenderDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 136, 45)];
        TotalAmountTG = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 131, 38)];
        TotalAmountTG.font = [[TotalAmountTG font] fontWithSize:15];
        PauseTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckTG = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordTG = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordTG = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordTG.font  = [[TheCurrentWordTG font] fontWithSize:15];
        
        BackGroundOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        tHomeTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneTG = [[UIButton alloc] initWithFrame:CGRectMake(87, 434, 40, 40)];
        gTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(140, 434, 40, 40)];
        gThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(193, 434, 40, 40)];
        BBSelectionTG = [[UIImageView alloc] initWithFrame:CGRectMake(83, 430, 48, 48)];
        
        sOneTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 45, 100, 40)];
        sTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 45, 100, 40)];
        sThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 93, 100, 40)];
        sFourTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 93, 100, 40)];
        sFiveTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 141, 100, 40)];
        sSixTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 141, 100, 40)];
        sSevenTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 189, 100, 40)];
        sEightTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 189, 100, 40)];
        sNineTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 237, 100, 40)];
        sTenTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 237, 100, 40)];
        sElevenTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 285, 100, 40)];
        sTwelveTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 285, 100, 40)];
        sThirteenTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 333, 100, 40)];
        sFourteenTG = [[UIButton alloc] initWithFrame:CGRectMake(180, 333, 100, 40)];
        sFithteenTG = [[UIButton alloc] initWithFrame:CGRectMake(72, 381, 100, 40)];
        
        PlayTG = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeTG = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsTG = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsTG.font  = [[CurrentWordsTG font] fontWithSize:20];
        
        pOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(49, 229, 70, 70)];
        pTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(125, 229, 70, 70)];
        pThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(201, 229, 70, 70)];
        pFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(49, 305, 70, 70)];
        pFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(125, 305, 70, 70)];
        pSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(201, 305, 70, 70)];
        pSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(49, 481, 70, 70)];
        pEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(125, 481, 70, 70)];
        pNineTG  = [[UIImageView alloc] initWithFrame:CGRectMake(201, 481, 70, 70)];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 155, 50)];
        TotalAmountTG = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 150, 36)];
        TotalAmountTG.font = [[TotalAmountTG font] fontWithSize:20];
        PauseTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckTG = [[UIButton alloc] initWithFrame:CGRectMake(60, 154, 200, 40)];
        BarUnderWordTG = [[UIImageView alloc] initWithFrame:CGRectMake(41, 242, 240, 2)];
        TheCurrentWordTG = [[UILabel alloc] initWithFrame:CGRectMake(117, 215, 87, 28)];
        TheCurrentWordTG.font  = [[TheCurrentWordTG font] fontWithSize:25];
        
        pOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(16, 258, 90, 90)];
        pTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(116, 258, 90, 90)];
        pThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(216, 258, 90, 90)];
        pFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(16, 358, 90, 90)];
        pFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(116, 358, 90, 90)];
        pSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(216, 358, 90, 90)];
        pSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(16, 458, 90, 90)];
        pEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(116, 458, 90, 90)];
        pNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(216, 458, 90, 90)];
        
        tHomeTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneTG = [[UIButton alloc] initWithFrame:CGRectMake(89, 520, 40, 40)];
        gTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(139, 520, 40, 40)];
        gThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(192, 520, 40, 40)];
        BBSelectionTG = [[UIImageView alloc] initWithFrame:CGRectMake(86, 517, 46, 46)];
        
        sOneTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 106, 110, 45)];
        sTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 106, 110, 45)];
        sThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 156, 110, 45)];
        sFourTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 156, 110, 45)];
        sFiveTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 206, 110, 45)];
        sSixTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 206, 110, 45)];
        sSevenTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 256, 110, 45)];
        sEightTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 256, 110, 45)];
        sNineTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 306, 110, 45)];
        sTenTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 306, 110, 45)];
        sElevenTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 356, 110, 45)];
        sTwelveTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 356, 110, 45)];
        sThirteenTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 406, 110, 45)];
        sFourteenTG = [[UIButton alloc] initWithFrame:CGRectMake(182, 406, 110, 45)];
        sFithteenTG = [[UIButton alloc] initWithFrame:CGRectMake(48, 456, 110, 45)];
        
        BackGroundOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        PlayTG = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeTG = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsTG = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsTG.font  = [[CurrentWordsTG font] fontWithSize:20];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneTG = [[UIButton alloc] initWithFrame:CGRectMake(107, 602, 45, 45)];
        gTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(165, 602, 45, 45)];
        gThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(223, 602, 45, 45)];
        BBSelectionTG = [[UIImageView alloc] initWithFrame:CGRectMake(104, 599, 51, 51)];
        
        sOneTG = [[UIButton alloc] initWithFrame:CGRectMake(12, 193, 110, 50)];
        sTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(130, 193, 110, 50)];
        sThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(252, 193, 110, 50)];
        sFourTG = [[UIButton alloc] initWithFrame:CGRectMake(12, 251, 110, 50)];
        sFiveTG = [[UIButton alloc] initWithFrame:CGRectMake(130, 251, 110, 50)];
        sSixTG = [[UIButton alloc] initWithFrame:CGRectMake(252, 251, 110, 50)];
        sSevenTG = [[UIButton alloc] initWithFrame:CGRectMake(12, 309, 110, 50)];
        sEightTG = [[UIButton alloc] initWithFrame:CGRectMake(130, 309, 110, 50)];
        sNineTG = [[UIButton alloc] initWithFrame:CGRectMake(252, 309, 110, 50)];
        sTenTG = [[UIButton alloc] initWithFrame:CGRectMake(12, 367, 110, 50)];
        sElevenTG = [[UIButton alloc] initWithFrame:CGRectMake(130, 367, 110, 50)];
        sTwelveTG = [[UIButton alloc] initWithFrame:CGRectMake(252, 367, 110, 50)];
        sThirteenTG = [[UIButton alloc] initWithFrame:CGRectMake(12, 425, 110, 50)];
        sFourteenTG = [[UIButton alloc] initWithFrame:CGRectMake(130, 425, 110, 50)];
        sFithteenTG = [[UIButton alloc] initWithFrame:CGRectMake(252, 425, 110, 50)];
        
        BackGroundOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        pOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(27, 327, 100, 100)];
        pTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(137, 327, 100, 100)];
        pThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(247, 327, 100, 100)];
        pFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(27, 437, 100, 100)];
        pFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(137, 437, 100, 100)];
        pSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(247, 437, 100, 100)];
        pSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(27, 547, 100, 100)];
        pEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(137, 547, 100, 100)];
        pNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(247, 547, 100, 100)];
        
        BarUnderWordTG = [[UIImageView alloc] initWithFrame:CGRectMake(67, 315, 240, 2)];
        TheCurrentWordTG = [[UILabel alloc] initWithFrame:CGRectMake(123, 282, 128, 35)];
        CheckTG = [[UIButton alloc] initWithFrame:CGRectMake(82, 202, 210, 45)];
        SenderDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 182, 50)];
        TotalAmountTG = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 176, 42)];
        PauseTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWordTG.font  = [[TheCurrentWordTG font] fontWithSize:25];
        TotalAmountTG.font = [[TotalAmountTG font] fontWithSize:22];
        
        PlayTG = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeTG = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsTG = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsTG.font = [[CurrentWordsTG font] fontWithSize:25];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneTG = [[UIButton alloc] initWithFrame:CGRectMake(127, 671, 45, 45)];
        gTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(185, 671, 45, 45)];
        gThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(243, 671, 45, 45)];
        BBSelectionTG = [[UIImageView alloc] initWithFrame:CGRectMake(124, 668, 51, 51)];
        
        PlayTG = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeTG = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsTG = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsTG.font = [[CurrentWordsTG font] fontWithSize:25];
        
        sOneTG = [[UIButton alloc] initWithFrame:CGRectMake(19, 227, 120, 50)];
        sTwoTG = [[UIButton alloc] initWithFrame:CGRectMake(147, 227, 120, 50)];
        sThreeTG = [[UIButton alloc] initWithFrame:CGRectMake(275, 227, 120, 50)];
        sFourTG = [[UIButton alloc] initWithFrame:CGRectMake(19, 285, 120, 50)];
        sFiveTG = [[UIButton alloc] initWithFrame:CGRectMake(147, 285, 120, 50)];
        sSixTG = [[UIButton alloc] initWithFrame:CGRectMake(275, 285, 120, 50)];
        sSevenTG = [[UIButton alloc] initWithFrame:CGRectMake(19, 343, 120, 50)];
        sEightTG = [[UIButton alloc] initWithFrame:CGRectMake(147, 343, 120, 50)];
        sNineTG = [[UIButton alloc] initWithFrame:CGRectMake(275, 343, 120, 50)];
        sTenTG = [[UIButton alloc] initWithFrame:CGRectMake(19, 401, 120, 50)];
        sElevenTG = [[UIButton alloc] initWithFrame:CGRectMake(147, 401, 120, 50)];
        sTwelveTG = [[UIButton alloc] initWithFrame:CGRectMake(275, 401, 120, 50)];
        sThirteenTG = [[UIButton alloc] initWithFrame:CGRectMake(19, 459, 120, 50)];
        sFourteenTG = [[UIButton alloc] initWithFrame:CGRectMake(147, 459, 120, 50)];
        sFithteenTG = [[UIButton alloc] initWithFrame:CGRectMake(275, 459, 120, 50)];
        
        BarUnderWordTG = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordTG = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckTG = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayTG = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmountTG = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        PauseTG = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWordTG.font  = [[TheCurrentWordTG font] fontWithSize:25];
        TotalAmountTG.font = [[TotalAmountTG font] fontWithSize:25];
        
        pOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(62, 399, 90, 90)];
        pTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(162, 399, 90, 90)];
        pThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(262, 399, 90, 90)];
        pFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(62, 499, 90, 90)];
        pFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(162, 499, 90, 90)];
        pSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(262, 499, 90, 90)];
        pSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(62, 599, 90, 90)];
        pEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(162, 599, 90, 90)];
        pNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(262, 599, 90, 90)];
    }
    
    [self.view addSubview:BackGroundOneTG];
    
    [PlayTG setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeTG setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayTG addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeTG addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayTG.showsTouchWhenHighlighted = YES;
    HomeTG.showsTouchWhenHighlighted = YES;
    PlayTG.adjustsImageWhenHighlighted = NO;
    HomeTG.adjustsImageWhenHighlighted = NO;
    CurrentWordsTG.text = @"CURRENT WORDS";
    CurrentWordsTG.textColor = [UIColor whiteColor];
    CurrentWordsTG.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplayTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:HomeTG aboveSubview:PauseDisplayTG];
    [self.view insertSubview:PlayTG aboveSubview:PauseDisplayTG];
    [self.view insertSubview:CurrentWordsTG aboveSubview:PauseDisplayTG];
    
    BarUnderWordTG.backgroundColor = [UIColor blackColor];
    TheCurrentWordTG.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordTG.textColor = [UIColor whiteColor];
    CheckTG.adjustsImageWhenHighlighted = NO;
    tHomeTG.adjustsImageWhenHighlighted = NO;
    tHomeTG.showsTouchWhenHighlighted = YES;
    gOneTG.showsTouchWhenHighlighted = YES;
    gTwoTG.showsTouchWhenHighlighted = YES;
    gThreeTG.showsTouchWhenHighlighted = YES;
    gOneTG.adjustsImageWhenHighlighted = NO;
    gTwoTG.adjustsImageWhenHighlighted = NO;
    gThreeTG.adjustsImageWhenHighlighted = NO;
    BBSelectionTG.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeTG setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [gOneTG setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoTG setImage:[UIImage imageNamed:@"BButtonThree.png"] forState:UIControlStateNormal];
    [gThreeTG setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckTG setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckTG addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseTG setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHomeTG addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [PauseTG addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseTG.adjustsImageWhenHighlighted = NO;
    SenderDisplayTG.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountTG.textColor = [UIColor whiteColor];
    TotalAmountTG.textAlignment = NSTextAlignmentCenter;
    [gTwoTG addTarget:self action:@selector(gTwo:) forControlEvents:UIControlEventTouchUpInside];
    [gThreeTG addTarget:self action:@selector(gThree:) forControlEvents:UIControlEventTouchUpInside];
    BackGroundOneTG.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundTwoTG.image = [UIImage imageNamed:@"BackGroundTwo.png"];
    BackGroundThreeTG.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourTG.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [self.view insertSubview:BackGroundTwoTG belowSubview:BackGroundOneTG];
    [self.view insertSubview:BackGroundThreeTG belowSubview:BackGroundOneTG];
    [self.view insertSubview:SenderDisplayTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:TotalAmountTG aboveSubview:SenderDisplayTG];
    [self.view insertSubview:PauseTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:CheckTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:BarUnderWordTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:TheCurrentWordTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pOneTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pTwoTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pThreeTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pFourTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pFiveTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pSixTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pSevenTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pEightTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:pNineTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:tHomeTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:gOneTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:gTwoTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:gThreeTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:BBSelectionTG aboveSubview:BackGroundOneTG];
    
    [sOneTG setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [sTwoTG setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [sThreeTG setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [sFourTG setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [sFiveTG setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [sSixTG setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [sSevenTG setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [sEightTG setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [sNineTG setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [sTenTG setImage:[UIImage imageNamed:@"Ten.png"] forState:UIControlStateNormal];
    [sElevenTG setImage:[UIImage imageNamed:@"Eleven.png"] forState:UIControlStateNormal];
    [sTwelveTG setImage:[UIImage imageNamed:@"Twelve.png"] forState:UIControlStateNormal];
    [sThirteenTG setImage:[UIImage imageNamed:@"Thirteen.png"] forState:UIControlStateNormal];
    [sFourteenTG setImage:[UIImage imageNamed:@"Fourteen.png"] forState:UIControlStateNormal];
    [sFithteenTG setImage:[UIImage imageNamed:@"Fithteen.png"] forState:UIControlStateNormal];
    
    [sOneTG addTarget:self action:@selector(One:) forControlEvents:UIControlEventTouchUpInside];
    [sTwoTG addTarget:self action:@selector(Two:) forControlEvents:UIControlEventTouchUpInside];
    [sThreeTG addTarget:self action:@selector(Three:) forControlEvents:UIControlEventTouchUpInside];
    [sFourTG addTarget:self action:@selector(Four:) forControlEvents:UIControlEventTouchUpInside];
    [sFiveTG addTarget:self action:@selector(Five:) forControlEvents:UIControlEventTouchUpInside];
    [sSixTG addTarget:self action:@selector(Six:) forControlEvents:UIControlEventTouchUpInside];
    [sSevenTG addTarget:self action:@selector(Seven:) forControlEvents:UIControlEventTouchUpInside];
    [sEightTG addTarget:self action:@selector(Eight:) forControlEvents:UIControlEventTouchUpInside];
    [sNineTG addTarget:self action:@selector(Nine:) forControlEvents:UIControlEventTouchUpInside];
    [sTenTG addTarget:self action:@selector(Ten:) forControlEvents:UIControlEventTouchUpInside];
    [sElevenTG addTarget:self action:@selector(Eleven:) forControlEvents:UIControlEventTouchUpInside];
    [sTwelveTG addTarget:self action:@selector(Twelve:) forControlEvents:UIControlEventTouchUpInside];
    [sThirteenTG addTarget:self action:@selector(Thirteen:) forControlEvents:UIControlEventTouchUpInside];
    [sFourteenTG addTarget:self action:@selector(Fourteen:) forControlEvents:UIControlEventTouchUpInside];
    [sFithteenTG addTarget:self action:@selector(Fithteen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:sOneTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sTwoTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sThreeTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sFourTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sFiveTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sSixTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sSevenTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sEightTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sNineTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sTenTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sElevenTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sTwelveTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sThirteenTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sFourteenTG aboveSubview:BackGroundOneTG];
    [self.view insertSubview:sFithteenTG aboveSubview:BackGroundOneTG];
    [self.view addSubview:BackGroundFourTG];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)SettingUpFuncionForButtons
{
    [CheckTG addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [CheckTG addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckTG addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [PauseTG addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [PauseTG addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    [sOneTG addTarget:self action:@selector(sOneClicked) forControlEvents:UIControlEventTouchDown];
    [sOneTG addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpInside];
    [sOneTG addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwoTG addTarget:self action:@selector(sTwoClicked) forControlEvents:UIControlEventTouchDown];
    [sTwoTG addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwoTG addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThreeTG addTarget:self action:@selector(sThreeClicked) forControlEvents:UIControlEventTouchDown];
    [sThreeTG addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThreeTG addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourTG addTarget:self action:@selector(sFourClicked) forControlEvents:UIControlEventTouchDown];
    [sFourTG addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFourTG addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFiveTG addTarget:self action:@selector(sFiveClicked) forControlEvents:UIControlEventTouchDown];
    [sFiveTG addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFiveTG addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSixTG addTarget:self action:@selector(sSixClicked) forControlEvents:UIControlEventTouchDown];
    [sSixTG addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSixTG addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSevenTG addTarget:self action:@selector(sSevenClicked) forControlEvents:UIControlEventTouchDown];
    [sSevenTG addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSevenTG addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sEightTG addTarget:self action:@selector(sEightClicked) forControlEvents:UIControlEventTouchDown];
    [sEightTG addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpInside];
    [sEightTG addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sNineTG addTarget:self action:@selector(sNineClicked) forControlEvents:UIControlEventTouchDown];
    [sNineTG addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpInside];
    [sNineTG addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTenTG addTarget:self action:@selector(sTenClicked) forControlEvents:UIControlEventTouchDown];
    [sTenTG addTarget:self action:@selector(sTenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTenTG addTarget:self action:@selector(sTenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sElevenTG addTarget:self action:@selector(sElevenClicked) forControlEvents:UIControlEventTouchDown];
    [sElevenTG addTarget:self action:@selector(sElevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sElevenTG addTarget:self action:@selector(sElevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwelveTG addTarget:self action:@selector(sTwelveClicked) forControlEvents:UIControlEventTouchDown];
    [sTwelveTG addTarget:self action:@selector(sTwelveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwelveTG addTarget:self action:@selector(sTwelveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThirteenTG addTarget:self action:@selector(sThirteenClicked) forControlEvents:UIControlEventTouchDown];
    [sThirteenTG addTarget:self action:@selector(sThirteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThirteenTG addTarget:self action:@selector(sThirteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourteenTG addTarget:self action:@selector(sFourteenClicked) forControlEvents:UIControlEventTouchDown];
    [sFourteenTG addTarget:self action:@selector(sFourteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFourteenTG addTarget:self action:@selector(sFourteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFithteenTG addTarget:self action:@selector(sFithteenClicked) forControlEvents:UIControlEventTouchDown];
    [sFithteenTG addTarget:self action:@selector(sFithteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFithteenTG addTarget:self action:@selector(sFithteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    ikOneTG = pOneTG.center.x;
    iktOneTG = pOneTG.center.y;
    ikTwoTG = pTwoTG.center.x;
    iktTwoTG = pTwoTG.center.y;
    ikThreeTG = pThreeTG.center.x;
    iktThreeTG = pThreeTG.center.y;
    ikFourTG = pFourTG.center.x;
    iktFourTG = pFourTG.center.y;
    ikFiveTG = pFiveTG.center.x;
    iktFiveTG = pFiveTG.center.y;
    ikSixTG = pSixTG.center.x;
    iktSixTG = pSixTG.center.y;
    ikSevenTG = pSevenTG.center.x;
    iktSevenTG = pSevenTG.center.y;
    ikEightTG = pEightTG.center.x;
    iktEightTG = pEightTG.center.y;
    ikNineTG = pNineTG.center.x;
    iktNineTG = pNineTG.center.y;
    kSelectionTG = sNineTG.center.y;
}

-(void)sOneClicked
{
    [sOneTG setImage:[UIImage imageNamed:@"OnePlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sOneClick
{
    [sOneTG setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sTwoClicked
{
    [sTwoTG setImage:[UIImage imageNamed:@"TwoPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sTwoClick
{
    [sTwoTG setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sThreeClicked
{
    [sThreeTG setImage:[UIImage imageNamed:@"ThreePlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sThreeClick
{
    [sThreeTG setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sFourClicked
{
    [sFourTG setImage:[UIImage imageNamed:@"FourPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sFourClick
{
    [sFourTG setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sFiveClicked
{
    [sFiveTG setImage:[UIImage imageNamed:@"FivePlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sFiveClick
{
    [sFiveTG setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sSixClicked
{
    [sSixTG setImage:[UIImage imageNamed:@"SixPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sSixClick
{
    [sSixTG setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sSevenClicked
{
    [sSevenTG setImage:[UIImage imageNamed:@"SevenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sSevenClick
{
    [sSevenTG setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sEightClicked
{
    [sEightTG setImage:[UIImage imageNamed:@"EightPlain.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sEightClick
{
    [sEightTG setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sNineClicked
{
    [sNineTG setImage:[UIImage imageNamed:@"NinePlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sNineClick
{
    [sNineTG setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sTenClicked
{
    [sTenTG setImage:[UIImage imageNamed:@"TenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sTenClick
{
    [sTenTG setImage:[UIImage imageNamed:@"Ten.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sElevenClicked
{
    [sElevenTG setImage:[UIImage imageNamed:@"ElevenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sElevenClick
{
    [sElevenTG setImage:[UIImage imageNamed:@"Eleven.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sTwelveClicked
{
    [sTwelveTG setImage:[UIImage imageNamed:@"TwelvePlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sTwelveClick
{
    [sTwelveTG setImage:[UIImage imageNamed:@"Twelve.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sThirteenClicked
{
    [sThirteenTG setImage:[UIImage imageNamed:@"ThirteenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sThirteenClick
{
    [sThirteenTG setImage:[UIImage imageNamed:@"Thirteen.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sFourteenClicked
{
    [sFourteenTG setImage:[UIImage imageNamed:@"FourteenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sFourteenClick
{
    [sFourteenTG setImage:[UIImage imageNamed:@"Fourteen.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sFithteenClicked
{
    [sFithteenTG setImage:[UIImage imageNamed:@"FithteenPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)sFithteenClick
{
    [sFithteenTG setImage:[UIImage imageNamed:@"Fithteen.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)PauseClicked
{
    [PauseTG setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sPauseClicked
{
    [PauseTG setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(void)CheckClciked
{
    [CheckTG setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
}

-(void)sCheckClicked
{
    [CheckTG setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneTG play];
}

-(IBAction)One:(id)sender
{
    WordThree = 1;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree1"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Two:(id)sender
{
    WordThree = 2;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree2"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Three:(id)sender
{
    WordThree = 3;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree3"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Four:(id)sender
{
    WordThree = 4;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree4"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Five:(id)sender
{
    WordThree = 5;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree5"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Six:(id)sender
{
    WordThree = 6;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree6"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Seven:(id)sender
{
    WordThree = 7;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree7"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eight:(id)sender
{
    WordThree = 8;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree8"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Nine:(id)sender
{
    WordThree = 9;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree9"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Ten:(id)sender
{
    WordThree = 10;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree10"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eleven:(id)sender
{
    WordThree = 11;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree11"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Twelve:(id)sender
{
    WordThree = 12;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree12"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Thirteen:(id)sender
{
    WordThree = 13;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree13"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Fourteen:(id)sender
{
    WordThree = 14;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree14"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Fithteen:(id)sender
{
    WordThree = 15;
    SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree15"];
    if ([SavedWordTG length] > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWordTG rangeOfString:str].length == 3) {
                    ScoreTG++;
                    WordIsAlreadyDoneTG[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(void)preViewDidLoad
{
    [self GettingTheRightGrid];
    moverTG = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjects) userInfo:nil repeats:YES];

        pOneTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pTwoTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pThreeTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pFourTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pSixTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pSevenTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pEightTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pNineTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDelay:0.0];
        [UIView setAnimationDuration:1];
        
        [pFiveTG setAlpha:1];
        [CheckTG setAlpha:1];
        [TheCurrentWordTG setAlpha:1];
        [PauseTG setAlpha:1];
        [BarUnderWordTG setAlpha:1];
        [TotalAmountTG setAlpha:1];
        [SenderDisplayTG setAlpha:1];
        [tHomeTG setAlpha:0];
        
        [sOneTG setAlpha:0];
        [sTwoTG setAlpha:0];
        [sThreeTG setAlpha:0];
        [sFourTG setAlpha:0];
        [sFiveTG setAlpha:0];
        [sSixTG setAlpha:0];
        [sSevenTG setAlpha:0];
        [sEightTG setAlpha:0];
        [sNineTG setAlpha:0];
        [sTenTG setAlpha:0];
        [sElevenTG setAlpha:0];
        [sTwelveTG setAlpha:0];
        [sThirteenTG setAlpha:0];
        [sFourteenTG setAlpha:0];
        [sFithteenTG setAlpha:0];
        
        [gOneTG setAlpha:0];
        [gTwoTG setAlpha:0];
        [gThreeTG setAlpha:0];
        [BBSelectionTG setAlpha:0];
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDelay:0.4];
        [UIView setAnimationDuration:1];
        pFourTG.alpha = 1;
        pSixTG.alpha = 1;
        
        pFourTG.center = CGPointMake(ikFourTG, iktFourTG);
        pSixTG.center = CGPointMake(ikSixTG, iktSixTG);
        
        pOneTG.center = CGPointMake(ikFourTG, iktFourTG);
        pSevenTG.center = CGPointMake(ikFourTG, iktFourTG);
        
        pTwoTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        pEightTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y);
        
        pThreeTG.center = CGPointMake(ikSixTG, iktSixTG);
        pNineTG.center = CGPointMake(ikSixTG, iktSixTG);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDelay:1.4];
        [UIView setAnimationDuration:1];
        pOneTG.alpha = 1;
        pTwoTG.alpha = 1;
        pThreeTG.alpha = 1;
        
        pSevenTG.alpha = 1;
        pEightTG.alpha = 1;
        pNineTG.alpha = 1;
        
        pOneTG.center = CGPointMake(ikOneTG, iktOneTG);
        pSevenTG.center = CGPointMake(ikSevenTG, iktSevenTG);
        
        pTwoTG.center = CGPointMake(ikTwoTG, iktTwoTG);
        pEightTG.center = CGPointMake(ikEightTG, iktEightTG);
        
        pThreeTG.center = CGPointMake(ikThreeTG, iktThreeTG);
        pNineTG.center = CGPointMake(ikNineTG, iktNineTG);
        [self Swipes];
        [UIView commitAnimations];    
}

-(void)MovingTheObjects
{
    int a;
    a = 1;
    sOneTG.center = CGPointMake(sOneTG.center.x, sOneTG.center.y - a);
    sTwoTG.center = CGPointMake(sTwoTG.center.x , sTwoTG.center.y - a);
    sThreeTG.center = CGPointMake(sThreeTG.center.x , sThreeTG.center.y - a);
    sFourTG.center = CGPointMake(sFourTG.center.x , sFourTG.center.y - a);
    sFiveTG.center = CGPointMake(sFiveTG.center.x , sFiveTG.center.y - a);
    sSixTG.center = CGPointMake(sSixTG.center.x , sSixTG.center.y - a);
    sSevenTG.center = CGPointMake(sSevenTG.center.x , sSevenTG.center.y - a);
    sEightTG.center = CGPointMake(sEightTG.center.x , sEightTG.center.y - a);
    sNineTG.center = CGPointMake(sNineTG.center.x , sNineTG.center.y - a);
    sTenTG.center = CGPointMake(sTenTG.center.x , sTenTG.center.y - a);
    sElevenTG.center = CGPointMake(sElevenTG.center.x , sElevenTG.center.y - a);
    sTwelveTG.center = CGPointMake(sTwelveTG.center.x , sTwelveTG.center.y - a);
    sThirteenTG.center = CGPointMake(sThirteenTG.center.x , sThirteenTG.center.y - a);
    sFourteenTG.center = CGPointMake(sFourteenTG.center.x , sFourteenTG.center.y - a);
    sFithteenTG.center = CGPointMake(sFithteenTG.center.x , sFithteenTG.center.y - a);
    if (-155 >= sFithteenTG.center.y) {
        [moverTG invalidate];
        moverTG = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
    
}

-(void)GameSettingUpForGrid
{
    [self GettingTheRightGrid];
}

-(void)GettingTheRightGrid
{
    switch (WordThree) {
        case 1:
            cOneTG = 'a';
            cTwoTG = 'w';
            cThreeTG = 't';
            cFourTG = 'c';
            cFiveTG = 'y';
            cSixTG = 'e';
            cSevenTG = 'o';
            cEightTG = 'n';
            cNineTG = 'm';
            
            pOneTG.image = [UIImage imageNamed:@"A.png"];
            pTwoTG.image = [UIImage imageNamed:@"W.png"];
            pThreeTG.image = [UIImage imageNamed:@"T.png"];
            pFourTG.image = [UIImage imageNamed:@"C.png"];
            pFiveTG.image = [UIImage imageNamed:@"Y.png"];
            pSixTG.image = [UIImage imageNamed:@"E.png"];
            pSevenTG.image = [UIImage imageNamed:@"O.png"];
            pEightTG.image = [UIImage imageNamed:@"N.png"];
            pNineTG.image = [UIImage imageNamed:@"M.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 85", ScoreTG];
            TheAmountTG = 85;
            break;
        case 2:
            cOneTG = 'a';
            cTwoTG = 'r';
            cThreeTG = 'o';
            cFourTG = 'b';
            cFiveTG = 't';
            cSixTG = 'n';
            cSevenTG = 'c';
            cEightTG = 'y';
            cNineTG = 'l';
            
            pOneTG.image = [UIImage imageNamed:@"A.png"];
            pTwoTG.image = [UIImage imageNamed:@"R.png"];
            pThreeTG.image = [UIImage imageNamed:@"O.png"];
            pFourTG.image = [UIImage imageNamed:@"B.png"];
            pFiveTG.image = [UIImage imageNamed:@"T.png"];
            pSixTG.image = [UIImage imageNamed:@"N.png"];
            pSevenTG.image = [UIImage imageNamed:@"C.png"];
            pEightTG.image = [UIImage imageNamed:@"Y.png"];
            pNineTG.image = [UIImage imageNamed:@"L.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 67", ScoreTG];
            TheAmountTG = 67;
            break;
        case 3:
            cOneTG = 't';
            cTwoTG = 's';
            cThreeTG = 'i';
            cFourTG = 'b';
            cFiveTG = 'h';
            cSixTG = 'o';
            cSevenTG = 'm';
            cEightTG = 'd';
            cNineTG = 'a';
            
            pOneTG.image = [UIImage imageNamed:@"T.png"];
            pTwoTG.image = [UIImage imageNamed:@"S.png"];
            pThreeTG.image = [UIImage imageNamed:@"I.png"];
            pFourTG.image = [UIImage imageNamed:@"B.png"];
            pFiveTG.image = [UIImage imageNamed:@"H.png"];
            pSixTG.image = [UIImage imageNamed:@"O.png"];
            pSevenTG.image = [UIImage imageNamed:@"M.png"];
            pEightTG.image = [UIImage imageNamed:@"D.png"];
            pNineTG.image = [UIImage imageNamed:@"A.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 82", ScoreTG];
            TheAmountTG = 82;
            break;
        case 4:
            cOneTG = 'e';
            cTwoTG = 't';
            cThreeTG = 'x';
            cFourTG = 'a';
            cFiveTG = 'n';
            cSixTG = 'i';
            cSevenTG = 'l';
            cEightTG = 'p';
            cNineTG = 'z';
            
            pOneTG.image = [UIImage imageNamed:@"E.png"];
            pTwoTG.image = [UIImage imageNamed:@"T.png"];
            pThreeTG.image = [UIImage imageNamed:@"X.png"];
            pFourTG.image = [UIImage imageNamed:@"A.png"];
            pFiveTG.image = [UIImage imageNamed:@"N.png"];
            pSixTG.image = [UIImage imageNamed:@"I.png"];
            pSevenTG.image = [UIImage imageNamed:@"L.png"];
            pEightTG.image = [UIImage imageNamed:@"P.png"];
            pNineTG.image = [UIImage imageNamed:@"Z.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 60", ScoreTG];
            TheAmountTG = 60;
            break;
        case 5:
            cOneTG = 'u';
            cTwoTG = 'r';
            cThreeTG = 'n';
            cFourTG = 'b';
            cFiveTG = 'g';
            cSixTG = 'e';
            cSevenTG = 'w';
            cEightTG = 't';
            cNineTG = 'o';
            
            pOneTG.image = [UIImage imageNamed:@"U.png"];
            pTwoTG.image = [UIImage imageNamed:@"R.png"];
            pThreeTG.image = [UIImage imageNamed:@"N.png"];
            pFourTG.image = [UIImage imageNamed:@"B.png"];
            pFiveTG.image = [UIImage imageNamed:@"G.png"];
            pSixTG.image = [UIImage imageNamed:@"E.png"];
            pSevenTG.image = [UIImage imageNamed:@"W.png"];
            pEightTG.image = [UIImage imageNamed:@"T.png"];
            pNineTG.image = [UIImage imageNamed:@"O.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 73", ScoreTG];
            TheAmountTG = 73;
            break;
        case 6:
            cOneTG = 's';
            cTwoTG = 'b';
            cThreeTG = 'i';
            cFourTG = 'k';
            cFiveTG = 'e';
            cSixTG = 'o';
            cSevenTG = 'y';
            cEightTG = 't';
            cNineTG = 'p';
            
            pOneTG.image = [UIImage imageNamed:@"S.png"];
            pTwoTG.image = [UIImage imageNamed:@"B.png"];
            pThreeTG.image = [UIImage imageNamed:@"I.png"];
            pFourTG.image = [UIImage imageNamed:@"K.png"];
            pFiveTG.image = [UIImage imageNamed:@"E.png"];
            pSixTG.image = [UIImage imageNamed:@"O.png"];
            pSevenTG.image = [UIImage imageNamed:@"Y.png"];
            pEightTG.image = [UIImage imageNamed:@"T.png"];
            pNineTG.image = [UIImage imageNamed:@"P.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 63", ScoreTG];
            TheAmountTG = 63;
            break;
        case 7:
            cOneTG = 'e';
            cTwoTG = 'j';
            cThreeTG = 't';
            cFourTG = 'a';
            cFiveTG = 'o';
            cSixTG = 'y';
            cSevenTG = 'm';
            cEightTG = 'b';
            cNineTG = 'w';
            
            pOneTG.image = [UIImage imageNamed:@"E.png"];
            pTwoTG.image = [UIImage imageNamed:@"J.png"];
            pThreeTG.image = [UIImage imageNamed:@"T.png"];
            pFourTG.image = [UIImage imageNamed:@"A.png"];
            pFiveTG.image = [UIImage imageNamed:@"O.png"];
            pSixTG.image = [UIImage imageNamed:@"Y.png"];
            pSevenTG.image = [UIImage imageNamed:@"M.png"];
            pEightTG.image = [UIImage imageNamed:@"B.png"];
            pNineTG.image = [UIImage imageNamed:@"W.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 71", ScoreTG];
            TheAmountTG = 71;
            break;
        case 8:
            cOneTG = 'k';
            cTwoTG = 'g';
            cThreeTG = 'e';
            cFourTG = 'l';
            cFiveTG = 'a';
            cSixTG = 'r';
            cSevenTG = 't';
            cEightTG = 'i';
            cNineTG = 'd';
            
            pOneTG.image = [UIImage imageNamed:@"K.png"];
            pTwoTG.image = [UIImage imageNamed:@"G.png"];
            pThreeTG.image = [UIImage imageNamed:@"E.png"];
            pFourTG.image = [UIImage imageNamed:@"L.png"];
            pFiveTG.image = [UIImage imageNamed:@"A.png"];
            pSixTG.image = [UIImage imageNamed:@"R.png"];
            pSevenTG.image = [UIImage imageNamed:@"T.png"];
            pEightTG.image = [UIImage imageNamed:@"I.png"];
            pNineTG.image = [UIImage imageNamed:@"D.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 80", ScoreTG];
            TheAmountTG = 80;
            break;
        case 9:
            cOneTG = 'h';
            cTwoTG = 'u';
            cThreeTG = 'e';
            cFourTG = 't';
            cFiveTG = 'g';
            cSixTG = 'm';
            cSevenTG = 'r';
            cEightTG = 'd';
            cNineTG = 's';
            
            pOneTG.image = [UIImage imageNamed:@"H.png"];
            pTwoTG.image = [UIImage imageNamed:@"U.png"];
            pThreeTG.image = [UIImage imageNamed:@"E.png"];
            pFourTG.image = [UIImage imageNamed:@"T.png"];
            pFiveTG.image = [UIImage imageNamed:@"G.png"];
            pSixTG.image = [UIImage imageNamed:@"M.png"];
            pSevenTG.image = [UIImage imageNamed:@"R.png"];
            pEightTG.image = [UIImage imageNamed:@"D.png"];
            pNineTG.image = [UIImage imageNamed:@"S.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 51", ScoreTG];
            TheAmountTG = 51;
            break;
        case 10:
            cOneTG = 'o';
            cTwoTG = 'x';
            cThreeTG = 'b';
            cFourTG = 'f';
            cFiveTG = 'i';
            cSixTG = 's';
            cSevenTG = 't';
            cEightTG = 'n';
            cNineTG = 'p';
            
            pOneTG.image = [UIImage imageNamed:@"O.png"];
            pTwoTG.image = [UIImage imageNamed:@"X.png"];
            pThreeTG.image = [UIImage imageNamed:@"B.png"];
            pFourTG.image = [UIImage imageNamed:@"F.png"];
            pFiveTG.image = [UIImage imageNamed:@"I.png"];
            pSixTG.image = [UIImage imageNamed:@"S.png"];
            pSevenTG.image = [UIImage imageNamed:@"T.png"];
            pEightTG.image = [UIImage imageNamed:@"N.png"];
            pNineTG.image = [UIImage imageNamed:@"P.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 54", ScoreTG];
            TheAmountTG = 54;
            break;
        case 11:
            cOneTG = 'm';
            cTwoTG = 'p';
            cThreeTG = 'a';
            cFourTG = 'n';
            cFiveTG = 't';
            cSixTG = 'u';
            cSevenTG = 'b';
            cEightTG = 'f';
            cNineTG = 'r';
            
            pOneTG.image = [UIImage imageNamed:@"M.png"];
            pTwoTG.image = [UIImage imageNamed:@"P.png"];
            pThreeTG.image = [UIImage imageNamed:@"A.png"];
            pFourTG.image = [UIImage imageNamed:@"N.png"];
            pFiveTG.image = [UIImage imageNamed:@"T.png"];
            pSixTG.image = [UIImage imageNamed:@"U.png"];
            pSevenTG.image = [UIImage imageNamed:@"B.png"];
            pEightTG.image = [UIImage imageNamed:@"F.png"];
            pNineTG.image = [UIImage imageNamed:@"R.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 64", ScoreTG];
            TheAmountTG = 64;
            break;
        case 12:
            cOneTG = 'z';
            cTwoTG = 'x';
            cThreeTG = 'a';
            cFourTG = 't';
            cFiveTG = 'w';
            cSixTG = 'e';
            cSevenTG = 'd';
            cEightTG = 'o';
            cNineTG = 'p';
            
            pOneTG.image = [UIImage imageNamed:@"Z.png"];
            pTwoTG.image = [UIImage imageNamed:@"X.png"];
            pThreeTG.image = [UIImage imageNamed:@"A.png"];
            pFourTG.image = [UIImage imageNamed:@"T.png"];
            pFiveTG.image = [UIImage imageNamed:@"W.png"];
            pSixTG.image = [UIImage imageNamed:@"E.png"];
            pSevenTG.image = [UIImage imageNamed:@"D.png"];
            pEightTG.image = [UIImage imageNamed:@"O.png"];
            pNineTG.image = [UIImage imageNamed:@"P.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 62", ScoreTG];
            TheAmountTG = 62;
            break;
        case 13:
            cOneTG = 'w';
            cTwoTG = 'r';
            cThreeTG = 'y';
            cFourTG = 'b';
            cFiveTG = 'd';
            cSixTG = 'a';
            cSevenTG = 'p';
            cEightTG = 't';
            cNineTG = 'u';
            
            pOneTG.image = [UIImage imageNamed:@"W.png"];
            pTwoTG.image = [UIImage imageNamed:@"R.png"];
            pThreeTG.image = [UIImage imageNamed:@"Y.png"];
            pFourTG.image = [UIImage imageNamed:@"B.png"];
            pFiveTG.image = [UIImage imageNamed:@"D.png"];
            pSixTG.image = [UIImage imageNamed:@"A.png"];
            pSevenTG.image = [UIImage imageNamed:@"P.png"];
            pEightTG.image = [UIImage imageNamed:@"T.png"];
            pNineTG.image = [UIImage imageNamed:@"U.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 64", ScoreTG];
            TheAmountTG = 64;
            break;
        case 14:
            cOneTG = 'y';
            cTwoTG = 'i';
            cThreeTG = 'v';
            cFourTG = 'e';
            cFiveTG = 'g';
            cSixTG = 't';
            cSevenTG = 'a';
            cEightTG = 'n';
            cNineTG = 'm';
            
            pOneTG.image = [UIImage imageNamed:@"Y.png"];
            pTwoTG.image = [UIImage imageNamed:@"I.png"];
            pThreeTG.image = [UIImage imageNamed:@"V.png"];
            pFourTG.image = [UIImage imageNamed:@"E.png"];
            pFiveTG.image = [UIImage imageNamed:@"G.png"];
            pSixTG.image = [UIImage imageNamed:@"T.png"];
            pSevenTG.image = [UIImage imageNamed:@"A.png"];
            pEightTG.image = [UIImage imageNamed:@"N.png"];
            pNineTG.image = [UIImage imageNamed:@"M.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 68", ScoreTG];
            TheAmountTG = 68;
            break;
        case 15:
            cOneTG = 'w';
            cTwoTG = 'o';
            cThreeTG = 'v';
            cFourTG = 'y';
            cFiveTG = 'x';
            cSixTG = 'a';
            cSevenTG = 't';
            cEightTG = 'b';
            cNineTG = 'e';
            
            pOneTG.image = [UIImage imageNamed:@"W.png"];
            pTwoTG.image = [UIImage imageNamed:@"O.png"];
            pThreeTG.image = [UIImage imageNamed:@"V.png"];
            pFourTG.image = [UIImage imageNamed:@"Y.png"];
            pFiveTG.image = [UIImage imageNamed:@"X.png"];
            pSixTG.image = [UIImage imageNamed:@"A.png"];
            pSevenTG.image = [UIImage imageNamed:@"T.png"];
            pEightTG.image = [UIImage imageNamed:@"B.png"];
            pNineTG.image = [UIImage imageNamed:@"E.png"];
            
            TotalAmountTG.text = [NSString stringWithFormat:@"%i OF 61", ScoreTG];
            TheAmountTG = 61;
            break;
        default:
            break;
    }
    
    [self GetTheWord];
    
    iLeftTG = ikTwoTG - ikOneTG;
    iUpTG = iktOneTG - iktFiveTG;
}

-(void)Swipes
{
    PanningSensitivityTG = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneTG.userInteractionEnabled = YES;
    [pOneTG addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoTG.userInteractionEnabled = YES;
    [pTwoTG addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeTG.userInteractionEnabled = YES;
    [pThreeTG addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourTG.userInteractionEnabled = YES;
    [pFourTG addGestureRecognizer:panFour];
    
    UIPanGestureRecognizer *panFive = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FivePan:)];
    pFiveTG.userInteractionEnabled = YES;
    [pFiveTG addGestureRecognizer:panFive];
    
    UIPanGestureRecognizer *panSix = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixPan:)];
    pSixTG.userInteractionEnabled = YES;
    [pSixTG addGestureRecognizer:panSix];
    
    UIPanGestureRecognizer *panSeven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SevenPan:)];
    pSevenTG.userInteractionEnabled = YES;
    [pSevenTG addGestureRecognizer:panSeven];
    
    UIPanGestureRecognizer *panEight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(EightPan:)];
    pEightTG.userInteractionEnabled = YES;
    [pEightTG addGestureRecognizer:panEight];
    
    UIPanGestureRecognizer *panNine = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(NinePan:)];
    pNineTG.userInteractionEnabled = YES;
    [pNineTG addGestureRecognizer:panNine];
    
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    UISwipeGestureRecognizer *gesture;
    
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 1;
    
    
    if ((gesture.direction == UISwipeGestureRecognizerDirectionDown || gesture.direction == UISwipeGestureRecognizerDirectionUp) && PreviousTG == 0) {
        [self Horizontal];
        PreviousTG = 2;
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)FivePan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 5;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixPan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 6;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)SevenPan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 7;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)EightPan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 8;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
            PreviousTG = 2;
            [self Horizontal];
        }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

-(void)NinePan: (UIPanGestureRecognizer *)sender
{
    distanceTG = [sender translationInView:self.view];
    PanningIntTG++;
    PPanningMethodTG = 9;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 1) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Verticle];
            PanningIntTG = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTG == 2) {
        if (PanningIntTG == PanningSensitivityTG) {
            [self Horizontal];
            PanningIntTG = 0;
        }
    } else if (distanceTG.x > 0 || distanceTG.x < 0) {
        if ((distanceTG.y > 0 || distanceTG.y < 0) && ((distanceTG.x > 0 && distanceTG.x < 10) || (distanceTG.x < 0 && distanceTG.x > -10))) {
            PreviousTG = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTG = 1;
        }
    } else if (distanceTG.y > 0 || distanceTG.y < 0) {
        PreviousTG = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTG = 0;
        PreviousTG = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneTG = pOneTG.center.x;
    yOneTG = pOneTG.center.y;
    xTwoTG = pTwoTG.center.x;
    yTwoTG = pTwoTG.center.y;
    xThreeTG = pThreeTG.center.x;
    yThreeTG = pThreeTG.center.y;
    xFourTG = pFourTG.center.x;
    yFourTG = pFourTG.center.y;
    xFiveTG = pFiveTG.center.x;
    yFiveTG = pFiveTG.center.y;
    xSixTG = pSixTG.center.x;
    ySixTG = pSixTG.center.y;
    ySevenTG = pSevenTG.center.y;
    xSevenTG = pSevenTG.center.x;
    xEightTG = pEightTG.center.x;
    yEightTG = pEightTG.center.y;
    yNineTG = pNineTG.center.y;
    xNineTG = pNineTG.center.x;
    
    switch (PPanningMethodTG) {
        case 1:
            pointOfIntrestTG = pOneTG.center.x;
            break;
        case 2:
            pointOfIntrestTG = pTwoTG.center.x;
            break;
        case 3:
            pointOfIntrestTG = pThreeTG.center.x;
            break;
        case 4:
            pointOfIntrestTG = pFourTG.center.x;
            break;
        case 5:
            pointOfIntrestTG = pFiveTG.center.x;
            break;
        case 6:
            pointOfIntrestTG = pSixTG.center.x;
            break;
        case 7:
            pointOfIntrestTG = pSevenTG.center.x;
            break;
        case 8:
            pointOfIntrestTG = pEightTG.center.x;
            break;
        case 9:
            pointOfIntrestTG = pNineTG.center.x;
            break;
        default:
            break;
    }
    
    if (distanceTG.y < 0) {
        
        if (pointOfIntrestTG == pOneTG.center.x) {
            pOneTG.center = CGPointMake(pOneTG.center.x, pOneTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pTwoTG.center.x) {
            pTwoTG.center = CGPointMake(pTwoTG.center.x, pTwoTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pThreeTG.center.x) {
            pThreeTG.center = CGPointMake(pThreeTG.center.x , pThreeTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pFourTG.center.x) {
            pFourTG.center = CGPointMake(pFourTG.center.x, pFourTG.center.y - iLeftTG);
        }
        if (pFiveTG.center.x == pointOfIntrestTG) {
            pFiveTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pSixTG.center.x) {
            pSixTG.center = CGPointMake(pSixTG.center.x , pSixTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pSevenTG.center.x) {
            pSevenTG.center = CGPointMake(pSevenTG.center.x , pSevenTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pEightTG.center.x) {
            pEightTG.center = CGPointMake(pEightTG.center.x , pEightTG.center.y - iLeftTG);
        }
        if (pointOfIntrestTG == pNineTG.center.x) {
            pNineTG.center = CGPointMake(pNineTG.center.x, pNineTG.center.y - iLeftTG);
        }
    } else if (distanceTG.y > 0) {
        
        if (pointOfIntrestTG == pOneTG.center.x) {
            pOneTG.center = CGPointMake(pOneTG.center.x, pOneTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pTwoTG.center.x) {
            pTwoTG.center = CGPointMake(pTwoTG.center.x, pTwoTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pThreeTG.center.x) {
            pThreeTG.center = CGPointMake(pThreeTG.center.x , pThreeTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pFourTG.center.x) {
            pFourTG.center = CGPointMake(pFourTG.center.x, pFourTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pFiveTG.center.x) {
            pFiveTG.center = CGPointMake(pFiveTG.center.x, pFiveTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pSixTG.center.x) {
            pSixTG.center = CGPointMake(pSixTG.center.x , pSixTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pSevenTG.center.x) {
            pSevenTG.center = CGPointMake(pSevenTG.center.x , pSevenTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pEightTG.center.x) {
            pEightTG.center = CGPointMake(pEightTG.center.x , pEightTG.center.y+ iLeftTG);
        }
        if (pointOfIntrestTG == pNineTG.center.x) {
            pNineTG.center = CGPointMake(pNineTG.center.x, pNineTG.center.y+ iLeftTG);
        }
    }
    
    if (pOneTG.center.x != pointOfIntrestTG) {
        pOneTG.alpha = 1;
        pOneTG.hidden = NO;
        pOneTG.center = CGPointMake(xOneTG, yOneTG);
    }
    if (pTwoTG.center.x != pointOfIntrestTG) {
        pTwoTG.alpha = 1;
        pTwoTG.hidden = NO;
        pTwoTG.center = CGPointMake(xTwoTG, yTwoTG);
    }
    if (pThreeTG.center.x != pointOfIntrestTG) {
        pThreeTG.alpha = 1;
        pThreeTG.hidden = NO;
        pThreeTG.center = CGPointMake(xThreeTG, yThreeTG);
    }
    if (pFourTG.center.x != pointOfIntrestTG) {
        pFourTG.alpha = 1;
        pFourTG.hidden = NO;
        pFourTG.center = CGPointMake(xFourTG, yFourTG);
    }
    if (pFiveTG.center.x != pointOfIntrestTG) {
        pFiveTG.alpha = 1;
        pFiveTG.hidden = NO;
        pFiveTG.center = CGPointMake(xFiveTG, yFiveTG);
    }
    if (pSixTG.center.x != pointOfIntrestTG) {
        pSixTG.alpha = 1;
        pSixTG.hidden = NO;
        pSixTG.center = CGPointMake(xSixTG, ySixTG);
    }
    if (pSevenTG.center.x != pointOfIntrestTG) {
        pSevenTG.alpha = 1;
        pSevenTG.hidden = NO;
        pSevenTG.center = CGPointMake(xSevenTG, ySevenTG);
    }
    if (pEightTG.center.x != pointOfIntrestTG) {
        pEightTG.alpha = 1;
        pEightTG.hidden = NO;
        pEightTG.center = CGPointMake(xEightTG, yEightTG);
    }
    if (pNineTG.center.x != pointOfIntrestTG) {
        pNineTG.alpha = 1;
        pNineTG.hidden = NO;
        pNineTG.center = CGPointMake(xNineTG, yNineTG);
    }
    
    if (pOneTG.center.y > iktNineTG) {
        pOneTG.center = CGPointMake(pOneTG.center.x, iktOneTG);
    }
    if (pTwoTG.center.y > iktNineTG) {
        pTwoTG.center = CGPointMake(pTwoTG.center.x, iktOneTG);
    }
    if (pThreeTG.center.y > iktNineTG) {
        pThreeTG.center = CGPointMake(pThreeTG.center.x, iktOneTG);
    }
    if (pFourTG.center.y > iktNineTG) {
        pFourTG.center = CGPointMake(pFourTG.center.x,iktOneTG );
    }
    if (pFiveTG.center.y > iktNineTG) {
        pFiveTG.center = CGPointMake(pFiveTG.center.x, iktOneTG);
    }
    if (pSixTG.center.y > iktNineTG) {
        pSixTG.center = CGPointMake(pSixTG.center.x, iktOneTG);
    }
    if (pSevenTG.center.y > iktNineTG) {
        pSevenTG.center = CGPointMake(pSevenTG.center.x, iktOneTG);
    }
    if (pEightTG.center.y > iktNineTG) {
        pEightTG.center = CGPointMake(pEightTG.center.x, iktOneTG);
    }
    if (pNineTG.center.y > iktNineTG) {
        pNineTG.center = CGPointMake(pNineTG.center.x, iktOneTG);
    }
    
    if (pOneTG.center.y < iktOneTG) {
        pOneTG.center = CGPointMake(pOneTG.center.x, iktNineTG);
    }
    if (pTwoTG.center.y < iktOneTG) {
        pTwoTG.center = CGPointMake(pTwoTG.center.x, iktNineTG);
    }
    if (pThreeTG.center.y < iktOneTG) {
        pThreeTG.center = CGPointMake(pThreeTG.center.x, iktNineTG);
    }
    if (pFourTG.center.y < iktOneTG) {
        pFourTG.center = CGPointMake(pFourTG.center.x, iktNineTG);
    }
    if (pFiveTG.center.y < iktOneTG) {
        pFiveTG.center = CGPointMake(pFiveTG.center.x, iktNineTG);
    }
    if (pSixTG.center.y < iktOneTG) {
        pSixTG.center = CGPointMake(pSixTG.center.x, iktNineTG);
    }
    if (pSevenTG.center.y < iktOneTG) {
        pSevenTG.center = CGPointMake(pSevenTG.center.x, iktNineTG);
    }
    if (pEightTG.center.y < iktOneTG) {
        pEightTG.center = CGPointMake(pEightTG.center.x, iktNineTG);
    }
    if (pNineTG.center.y < iktOneTG) {
        pNineTG.center = CGPointMake(pNineTG.center.x, iktNineTG);
    }
}

-(void)Verticle
{
    xOneTG = pOneTG.center.x;
    yOneTG = pOneTG.center.y;
    xTwoTG = pTwoTG.center.x;
    yTwoTG = pTwoTG.center.y;
    xThreeTG = pThreeTG.center.x;
    yThreeTG = pThreeTG.center.y;
    xFourTG = pFourTG.center.x;
    yFourTG = pFourTG.center.y;
    xFiveTG = pFiveTG.center.x;
    yFiveTG = pFiveTG.center.y;
    xSixTG = pSixTG.center.x;
    ySixTG = pSixTG.center.y;
    ySevenTG = pSevenTG.center.y;
    xSevenTG = pSevenTG.center.x;
    xEightTG = pEightTG.center.x;
    yEightTG = pEightTG.center.y;
    yNineTG = pNineTG.center.y;
    xNineTG = pNineTG.center.x;
    
    switch (PPanningMethodTG) {
        case 1:
            pointOfIntrestTG = pOneTG.center.y;
            break;
        case 2:
            pointOfIntrestTG = pTwoTG.center.y;
            break;
        case 3:
            pointOfIntrestTG = pThreeTG.center.y;
            break;
        case 4:
            pointOfIntrestTG = pFourTG.center.y;
            break;
        case 5:
            pointOfIntrestTG = pFiveTG.center.y;
            break;
        case 6:
            pointOfIntrestTG = pSixTG.center.y;
            break;
        case 7:
            pointOfIntrestTG = pSevenTG.center.y;
            break;
        case 8:
            pointOfIntrestTG = pEightTG.center.y;
            break;
        case 9:
            pointOfIntrestTG = pNineTG.center.y;
            break;
        default:
            break;
    }
    
    if (distanceTG.x > 0) {
        
        if (pointOfIntrestTG == pOneTG.center.y) {
            pOneTG.center = CGPointMake(pOneTG.center.x + iLeftTG, pOneTG.center.y);
        }
        if (pointOfIntrestTG == pTwoTG.center.y) {
            pTwoTG.center = CGPointMake(pTwoTG.center.x + iLeftTG, pTwoTG.center.y);
        }
        if (pointOfIntrestTG == pThreeTG.center.y) {
            pThreeTG.center = CGPointMake(pThreeTG.center.x + iLeftTG, pThreeTG.center.y);
        }
        if (pointOfIntrestTG == pFourTG.center.y) {
            pFourTG.center = CGPointMake(pFourTG.center.x + iLeftTG, pFourTG.center.y);
        }
        if (pointOfIntrestTG == pFiveTG.center.y) {
            pFiveTG.center = CGPointMake(pFiveTG.center.x + iLeftTG, pFiveTG.center.y);
        }
        if (pointOfIntrestTG == pSixTG.center.y) {
            pSixTG.center = CGPointMake(pSixTG.center.x + iLeftTG, pSixTG.center.y);
        }
        if (pointOfIntrestTG == pSevenTG.center.y) {
            pSevenTG.center = CGPointMake(pSevenTG.center.x + iLeftTG, pSevenTG.center.y);
        }
        if (pointOfIntrestTG == pEightTG.center.y) {
            pEightTG.center = CGPointMake(pEightTG.center.x + iLeftTG, pEightTG.center.y);
        }
        if (pointOfIntrestTG == pNineTG.center.y) {
            pNineTG.center = CGPointMake(pNineTG.center.x + iLeftTG, pNineTG.center.y);
        }
        
    } else if (distanceTG.x < 0) {
        
        if (pointOfIntrestTG == pOneTG.center.y) {
            pOneTG.center = CGPointMake(pOneTG.center.x - iLeftTG, pOneTG.center.y);
        }
        if (pointOfIntrestTG == pTwoTG.center.y) {
            pTwoTG.center = CGPointMake(pTwoTG.center.x - iLeftTG, pTwoTG.center.y);
        }
        if (pointOfIntrestTG == pThreeTG.center.y) {
            pThreeTG.center = CGPointMake(pThreeTG.center.x - iLeftTG, pThreeTG.center.y);
        }
        if (pointOfIntrestTG == pFourTG.center.y) {
            pFourTG.center = CGPointMake(pFourTG.center.x - iLeftTG, pFourTG.center.y);
        }
        if (pointOfIntrestTG == pFiveTG.center.y) {
            pFiveTG.center = CGPointMake(pFiveTG.center.x - iLeftTG, pFiveTG.center.y);
        }
        if (pointOfIntrestTG == pSixTG.center.y) {
            pSixTG.center = CGPointMake(pSixTG.center.x - iLeftTG, pSixTG.center.y);
        }
        if (pointOfIntrestTG == pSevenTG.center.y) {
            pSevenTG.center = CGPointMake(pSevenTG.center.x - iLeftTG, pSevenTG.center.y);
        }
        if (pointOfIntrestTG == pEightTG.center.y) {
            pEightTG.center = CGPointMake(pEightTG.center.x - iLeftTG, pEightTG.center.y);
        }
        if (pointOfIntrestTG == pNineTG.center.y) {
            pNineTG.center = CGPointMake(pNineTG.center.x - iLeftTG, pNineTG.center.y);
        }
    }
    
    if (pOneTG.center.y != pointOfIntrestTG) {
        pOneTG.alpha = 1;
        pOneTG.hidden = NO;
        pOneTG.center = CGPointMake(xOneTG, yOneTG);
    }
    if (pTwoTG.center.y != pointOfIntrestTG) {
        pTwoTG.alpha = 1;
        pTwoTG.hidden = NO;
        pTwoTG.center = CGPointMake(xTwoTG, yTwoTG);
    }
    if (pThreeTG.center.y != pointOfIntrestTG) {
        pThreeTG.alpha = 1;
        pThreeTG.hidden = NO;
        pThreeTG.center = CGPointMake(xThreeTG, yThreeTG);
    }
    if (pFourTG.center.y != pointOfIntrestTG) {
        pFourTG.alpha = 1;
        pFourTG.hidden = NO;
        pFourTG.center = CGPointMake(xFourTG, yFourTG);
    }
    if (pFiveTG.center.y != pointOfIntrestTG) {
        pFiveTG.alpha = 1;
        pFiveTG.hidden = NO;
        pFiveTG.center = CGPointMake(xFiveTG, yFiveTG);
    }
    if (pSixTG.center.y != pointOfIntrestTG) {
        pSixTG.alpha = 1;
        pSixTG.hidden = NO;
        pSixTG.center = CGPointMake(xSixTG, ySixTG);
    }
    if (pSevenTG.center.y != pointOfIntrestTG) {
        pSevenTG.alpha = 1;
        pSevenTG.hidden = NO;
        pSevenTG.center = CGPointMake(xSevenTG, ySevenTG);
    }
    if (pEightTG.center.y != pointOfIntrestTG) {
        pEightTG.alpha = 1;
        pEightTG.hidden = NO;
        pEightTG.center = CGPointMake(xEightTG, yEightTG);
    }
    if (pNineTG.center.y != pointOfIntrestTG) {
        pNineTG.alpha = 1;
        pNineTG.hidden = NO;
        pNineTG.center = CGPointMake(xNineTG, yNineTG);
    }
    
    if (pOneTG.center.x < ikOneTG) {
        pOneTG.center = CGPointMake(ikThreeTG, pOneTG.center.y);
    }
    if (pTwoTG.center.x < ikOneTG) {
        pTwoTG.center = CGPointMake(ikThreeTG, pTwoTG.center.y);
    }
    if (pThreeTG.center.x < ikOneTG) {
        pThreeTG.center = CGPointMake(ikThreeTG, pThreeTG.center.y);
    }
    if (pFourTG.center.x < ikOneTG) {
        pFourTG.center = CGPointMake(ikThreeTG, pFourTG.center.y);
    }
    if (pFiveTG.center.x < ikOneTG) {
        pFiveTG.center = CGPointMake(ikThreeTG, pFiveTG.center.y);
    }
    if (pSixTG.center.x < ikOneTG) {
        pSixTG.center = CGPointMake(ikThreeTG, pSixTG.center.y);
    }
    if (pSevenTG.center.x < ikOneTG) {
        pSevenTG.center = CGPointMake(ikThreeTG, pSevenTG.center.y);
    }
    if (pEightTG.center.x < ikOneTG) {
        pEightTG.center = CGPointMake(ikThreeTG, pEightTG.center.y);
    }
    if (pNineTG.center.x < ikOneTG) {
        pNineTG.center = CGPointMake(ikThreeTG, pNineTG.center.y);
    }
    
    if (pOneTG.center.x > ikThreeTG) {
        pOneTG.center = CGPointMake(ikOneTG, pOneTG.center.y);
    }
    if (pTwoTG.center.x > ikThreeTG) {
        pTwoTG.center = CGPointMake(ikOneTG, pTwoTG.center.y);
    }
    if (pThreeTG.center.x > ikThreeTG) {
        pThreeTG.center = CGPointMake(ikOneTG, pThreeTG.center.y);
    }
    if (pFourTG.center.x > ikThreeTG) {
        pFourTG.center = CGPointMake(ikOneTG, pFourTG.center.y);
    }
    if (pFiveTG.center.x > ikThreeTG) {
        pFiveTG.center = CGPointMake(ikOneTG, pFiveTG.center.y);
    }
    if (pSixTG.center.x > ikThreeTG) {
        pSixTG.center = CGPointMake(ikOneTG, pSixTG.center.y);
    }
    if (pSevenTG.center.x > ikThreeTG) {
        pSevenTG.center = CGPointMake(ikOneTG, pSevenTG.center.y);
    }
    if (pEightTG.center.x > ikThreeTG) {
        pEightTG.center = CGPointMake(ikOneTG, pEightTG.center.y);
    }
    if (pNineTG.center.x > ikThreeTG) {
        pNineTG.center = CGPointMake(ikOneTG, pNineTG.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SwipeSoundTG play];
    [self GetTheWord];
}

-(IBAction)IsItAWaord
{    
    if ([UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:WordTG]) {
        ScoreTG++;
        TotalAmountTG.text = [NSString stringWithFormat:@"%i OF  %i", ScoreTG, TheAmountTG];
    }
    if (WordThree == 1) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree1"];
    } else if (WordThree == 2) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree2"];
    } else if (WordThree == 3) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree3"];
    } else if (WordThree == 4) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree4"];
    } else if (WordThree == 5) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree5"];
    } else if (WordThree == 6) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree6"];
    } else if (WordThree == 7) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree7"];
    } else if (WordThree == 8) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree8"];
    } else if (WordThree == 9) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree9"];
    } else if (WordThree == 10) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree10"];
    } else if (WordThree == 11) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree11"];
    } else if (WordThree == 12) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree12"];
    } else if (WordThree == 13) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree13"];
    } else if (WordThree == 14) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree14"];
    } else if (WordThree == 15) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree15"];
    }
    
    if (ScoreTG == TheAmountTG) {
        [self PlayAnimation];
    }
    
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    if (WordThree == 1) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree1"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree1"];
    } else if (WordThree == 2) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree2"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree2"];
    } else if (WordThree == 3) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree3"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree3"];
    } else if (WordThree == 4) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree4"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree4"];
    } else if (WordThree == 5) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree5"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree5"];
    } else if (WordThree == 6) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree6"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree6"];
    } else if (WordThree == 7) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree7"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree7"];
    } else if (WordThree == 8) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree8"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree8"];
    } else if (WordThree == 9) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree9"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree9"];
    } else if (WordThree == 10) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree10"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree10"];
    } else if (WordThree == 11) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree11"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree11"];
    } else if (WordThree == 12) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree12"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree12"];
    } else if (WordThree == 13) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree13"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree13"];
    } else if (WordThree == 14) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree14"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree14"];
    } else if (WordThree == 15) {
        SavedWordTG = [[NSUserDefaults standardUserDefaults] stringForKey:@"SaveTheWordsForGridThree15"];
        SavedWordTG = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWordTG forKey:@"SaveTheWordsForGridThree15"];
    }
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        TileOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTG.center.x - 75, pOneTG.center.y - 75, pOneTG.bounds.size.width, pOneTG.bounds.size.height)];
        TileTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTG.center.x-75, pTwoTG.center.y-75, pTwoTG.bounds.size.width, pTwoTG.bounds.size.height)];
        TileThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTG.center.x-75, pThreeTG.center.y-75, pThreeTG.bounds.size.width, pThreeTG.bounds.size.height)];
        TileFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTG.center.x-75, pFourTG.center.y-75, pFourTG.bounds.size.width, pFourTG.bounds.size.height)];
        TileFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTG.center.x-75, pFiveTG.center.y-75, pFiveTG.bounds.size.width, pFiveTG.bounds.size.height)];
        TileSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTG.center.x-75, pSixTG.center.y-75, pSixTG.bounds.size.width, pSixTG.bounds.size.height)];
        TileSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTG.center.x-75, pSevenTG.center.y-75, pSevenTG.bounds.size.width, pSevenTG.bounds.size.height)];
        TileEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTG.center.x-75, pEightTG.center.y-75, pEightTG.bounds.size.width, pEightTG.bounds.size.height)];
        TileNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTG.center.x-75, pNineTG.center.y-75, pNineTG.bounds.size.width, pNineTG.bounds.size.height)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            TileOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTG.center.x - 50, pOneTG.center.y -50, pOneTG.bounds.size.width, pOneTG.bounds.size.height)];
            TileTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTG.center.x-50, pTwoTG.center.y-50, pTwoTG.bounds.size.width, pTwoTG.bounds.size.height)];
            TileThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTG.center.x-50, pThreeTG.center.y-50, pThreeTG.bounds.size.width, pThreeTG.bounds.size.height)];
            TileFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTG.center.x-50, pFourTG.center.y-50, pFourTG.bounds.size.width, pFourTG.bounds.size.height)];
            TileFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTG.center.x-50, pFiveTG.center.y-50, pFiveTG.bounds.size.width, pFiveTG.bounds.size.height)];
            TileSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTG.center.x-50, pSixTG.center.y-50, pSixTG.bounds.size.width, pSixTG.bounds.size.height)];
            TileSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTG.center.x-50, pSevenTG.center.y-50, pSevenTG.bounds.size.width, pSevenTG.bounds.size.height)];
            TileEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTG.center.x-50, pEightTG.center.y-50, pEightTG.bounds.size.width, pEightTG.bounds.size.height)];
            TileNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTG.center.x-50, pNineTG.center.y-50, pNineTG.bounds.size.width, pNineTG.bounds.size.height)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            
            TileOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTG.center.x - 55, pOneTG.center.y - 55, pOneTG.bounds.size.width, pOneTG.bounds.size.height)];
            TileTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTG.center.x-55, pTwoTG.center.y-55, pTwoTG.bounds.size.width, pTwoTG.bounds.size.height)];
            TileThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTG.center.x-55, pThreeTG.center.y-55, pThreeTG.bounds.size.width, pThreeTG.bounds.size.height)];
            TileFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTG.center.x-55, pFourTG.center.y-55, pFourTG.bounds.size.width, pFourTG.bounds.size.height)];
            TileFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTG.center.x-55, pFiveTG.center.y-55, pFiveTG.bounds.size.width, pFiveTG.bounds.size.height)];
            TileSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTG.center.x-55, pSixTG.center.y-55, pSixTG.bounds.size.width, pSixTG.bounds.size.height)];
            TileSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTG.center.x-55, pSevenTG.center.y-55, pSevenTG.bounds.size.width, pSevenTG.bounds.size.height)];
            TileEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTG.center.x-55, pEightTG.center.y-55, pEightTG.bounds.size.width, pEightTG.bounds.size.height)];
            TileNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTG.center.x-55, pNineTG.center.y-55, pNineTG.bounds.size.width, pNineTG.bounds.size.height)];
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            TileOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTG.center.x - 58, pOneTG.center.y - 58, pOneTG.bounds.size.width, pOneTG.bounds.size.height)];
            TileTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTG.center.x-58, pTwoTG.center.y-58, pTwoTG.bounds.size.width, pTwoTG.bounds.size.height)];
            TileThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTG.center.x-58, pThreeTG.center.y-58, pThreeTG.bounds.size.width, pThreeTG.bounds.size.height)];
            TileFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTG.center.x-58, pFourTG.center.y-58, pFourTG.bounds.size.width, pFourTG.bounds.size.height)];
            TileFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTG.center.x-58, pFiveTG.center.y-58, pFiveTG.bounds.size.width, pFiveTG.bounds.size.height)];
            TileSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTG.center.x-58, pSixTG.center.y-58, pSixTG.bounds.size.width, pSixTG.bounds.size.height)];
            TileSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTG.center.x-58, pSevenTG.center.y-58, pSevenTG.bounds.size.width, pSevenTG.bounds.size.height)];
            TileEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTG.center.x-58, pEightTG.center.y-58, pEightTG.bounds.size.width, pEightTG.bounds.size.height)];
            TileNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTG.center.x-58, pNineTG.center.y-58, pNineTG.bounds.size.width, pNineTG.bounds.size.height)];
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            TileOneTG = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTG.center.x - 60, pOneTG.center.y - 60, pOneTG.bounds.size.width, pOneTG.bounds.size.height)];
            TileTwoTG = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTG.center.x-60, pTwoTG.center.y-60, pTwoTG.bounds.size.width, pTwoTG.bounds.size.height)];
            TileThreeTG = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTG.center.x-60, pThreeTG.center.y-60, pThreeTG.bounds.size.width, pThreeTG.bounds.size.height)];
            TileFourTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTG.center.x-60, pFourTG.center.y-60, pFourTG.bounds.size.width, pFourTG.bounds.size.height)];
            TileFiveTG = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTG.center.x-60, pFiveTG.center.y-60, pFiveTG.bounds.size.width, pFiveTG.bounds.size.height)];
            TileSixTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTG.center.x-60, pSixTG.center.y-60, pSixTG.bounds.size.width, pSixTG.bounds.size.height)];
            TileSevenTG = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTG.center.x-60, pSevenTG.center.y-60, pSevenTG.bounds.size.width, pSevenTG.bounds.size.height)];
            TileEightTG = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTG.center.x-60, pEightTG.center.y-60, pEightTG.bounds.size.width, pEightTG.bounds.size.height)];
            TileNineTG = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTG.center.x-60, pNineTG.center.y-60, pNineTG.bounds.size.width, pNineTG.bounds.size.height)];
        }
    }

    TileOneTG.backgroundColor = [UIColor whiteColor];
    TileTwoTG.backgroundColor = [UIColor whiteColor];
    TileThreeTG.backgroundColor = [UIColor whiteColor];
    TileFourTG.backgroundColor = [UIColor whiteColor];
    TileFiveTG.backgroundColor = [UIColor whiteColor];
    TileSixTG.backgroundColor = [UIColor whiteColor];
    TileSevenTG.backgroundColor = [UIColor whiteColor];
    TileEightTG.backgroundColor = [UIColor whiteColor];
    TileNineTG.backgroundColor = [UIColor whiteColor];
    
    TileOneTG.alpha = 0;
    TileTwoTG.alpha = 0;
    TileThreeTG.alpha = 0;
    TileFourTG.alpha = 0;
    TileFiveTG.alpha = 0;
    TileSixTG.alpha = 0;
    TileSevenTG.alpha = 0;
    TileEightTG.alpha = 0;
    TileNineTG.alpha = 0;
    
    [self.view addSubview:TileOneTG];
    [self.view addSubview:TileTwoTG];
    [self.view addSubview:TileThreeTG];
    [self.view addSubview:TileFourTG];
    [self.view addSubview:TileFiveTG];
    [self.view addSubview:TileSixTG];
    [self.view addSubview:TileSevenTG];
    [self.view addSubview:TileEightTG];
    [self.view addSubview:TileNineTG];
    
    TileOneTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneTG.alpha = 1;
    TileOneTG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoTG.alpha = 1;
    TileTwoTG.transform = CGAffineTransformMakeScale(1, 1);
    TileFourTG.alpha = 1;
    TileFourTG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileThreeTG.alpha = 1;
    TileThreeTG.transform = CGAffineTransformMakeScale(1, 1);
    TileFiveTG.alpha = 1;
    TileFiveTG.transform = CGAffineTransformMakeScale(1, 1);
    TileSevenTG.alpha = 1;
    TileSevenTG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileSixTG.alpha = 1;
    TileSixTG.transform = CGAffineTransformMakeScale(1, 1);
    TileEightTG.alpha = 1;
    TileEightTG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileNineTG.alpha = 1;
    TileNineTG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordTG.alpha = 0;
    TheCurrentWordTG.alpha = 0;
    SenderDisplayTG.alpha = 0;
    PauseTG.alpha = 0;
    CheckTG.alpha = 0;
    pOneTG.alpha = 0;
    pTwoTG.alpha = 0;
    pThreeTG.alpha = 0;
    pFourTG.alpha = 0;
    pFiveTG.alpha = 0;
    pSixTG.alpha = 0;
    pSevenTG.alpha = 0;
    pEightTG.alpha = 0;
    pNineTG.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountTG.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountTG.alpha = 0;
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
    [TileOneTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFiveTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSevenTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEightTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileNineTG.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileFiveTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileSevenTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileEightTG.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineTG.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneTG.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoTG.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeTG.transform = CGAffineTransformMakeScale(10, 10);
    TileFourTG.transform = CGAffineTransformMakeScale(10, 10);
    TileFiveTG.transform = CGAffineTransformMakeScale(10, 10);
    TileSixTG.transform = CGAffineTransformMakeScale(10, 10);
    TileSevenTG.transform = CGAffineTransformMakeScale(10, 10);
    TileEightTG.transform = CGAffineTransformMakeScale(10, 10);
    TileNineTG.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountTG.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)GetTheWord
{
    xOneTG = pOneTG.center.x;
    yOneTG = pOneTG.center.y;
    xTwoTG = pTwoTG.center.x;
    yTwoTG = pTwoTG.center.y;
    xThreeTG = pThreeTG.center.x;
    yThreeTG = pThreeTG.center.y;
    xFourTG = pFourTG.center.x;
    yFourTG = pFourTG.center.y;
    xFiveTG = pFiveTG.center.x;
    yFiveTG = pFiveTG.center.y;
    xSixTG = pSixTG.center.x;
    ySixTG = pSixTG.center.y;
    ySevenTG = pSevenTG.center.y;
    xSevenTG = pSevenTG.center.x;
    xEightTG = pEightTG.center.x;
    yEightTG = pEightTG.center.y;
    yNineTG = pNineTG.center.y;
    xNineTG = pNineTG.center.x;
    
    if (pOneTG.center.y == iktOneTG) {
        if (pOneTG.center.x == ikOneTG) {
            wOneTG = cOneTG;
        } else if (pOneTG.center.x == ikTwoTG) {
            wTwoTG = cOneTG;
        } else if (pOneTG.center.x == ikThreeTG) {
            wThreeTG = cOneTG;
        }
    }
    
    if (pTwoTG.center.y == iktOneTG) {
        if (pTwoTG.center.x == ikOneTG) {
            wOneTG = cTwoTG;
        } else if (pTwoTG.center.x == ikTwoTG) {
            wTwoTG = cTwoTG;
        } else if (pTwoTG.center.x == ikThreeTG) {
            wThreeTG = cTwoTG;
        }
    }
    
    if (pThreeTG.center.y == iktOneTG) {
        if (pThreeTG.center.x == ikOneTG) {
            wOneTG = cThreeTG;
        } else if (pThreeTG.center.x == ikTwoTG) {
            wTwoTG = cThreeTG;
        } else if (pThreeTG.center.x == ikThreeTG) {
            wThreeTG = cThreeTG;
        }
    }
    
    if (pFourTG.center.y == iktOneTG) {
        if (pFourTG.center.x == ikOneTG) {
            wOneTG = cFourTG;
        } else if (pFourTG.center.x == ikTwoTG) {
            wTwoTG = cFourTG;
        } else if (pFourTG.center.x == ikThreeTG) {
            wThreeTG = cFourTG;
        }
    }
    
    if (pFiveTG.center.y == iktOneTG) {
        if (pFiveTG.center.x == ikOneTG) {
            wOneTG = cFiveTG;
        } else if (pFiveTG.center.x == ikTwoTG) {
            wTwoTG = cFiveTG;
        } else if (pFiveTG.center.x == ikThreeTG) {
            wThreeTG = cFiveTG;
        }
    }
    
    if (pSixTG.center.y == iktOneTG) {
        if (pSixTG.center.x == ikOneTG) {
            wOneTG = cSixTG;
        } else if (pSixTG.center.x == ikTwoTG) {
            wTwoTG = cSixTG;
        } else if (pSixTG.center.x == ikThreeTG) {
            wThreeTG = cSixTG;
        }
    }
    
    if (pSevenTG.center.y == iktOneTG) {
        if (pSevenTG.center.x == ikOneTG) {
            wOneTG = cSevenTG;
        } else if (pSevenTG.center.x == ikTwoTG) {
            wTwoTG = cSevenTG;
        } else if (pSevenTG.center.x == ikThreeTG) {
            wThreeTG = cSevenTG;
        }
    }
    
    if (pEightTG.center.y == iktOneTG) {
        if (pEightTG.center.x == ikOneTG) {
            wOneTG = cEightTG;
        } else if (pEightTG.center.x == ikTwoTG) {
            wTwoTG = cEightTG;
        } else if (pEightTG.center.x == ikThreeTG) {
            wThreeTG = cEightTG;
        }
    }
    
    if (pNineTG.center.y == iktOneTG) {
        if (pNineTG.center.x == ikOneTG) {
            wOneTG = cNineTG;
        } else if (pNineTG.center.x == ikTwoTG) {
            wTwoTG = cNineTG;
        } else if (pNineTG.center.x == ikThreeTG) {
            wThreeTG = cNineTG;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneTG];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoTG];
    NSString *Threes = [NSString stringWithFormat:@"%c", wThreeTG];
    
    WordTG = [NSString stringWithFormat:@"%@%@%@", Ones, Twos, Threes];
    TheCurrentWordTG.text = [WordTG uppercaseString];
    
    pOneTG.center = CGPointMake(xOneTG, yOneTG);
    pTwoTG.center = CGPointMake(xTwoTG, yTwoTG);
    pThreeTG.center = CGPointMake(xThreeTG, yThreeTG);
    pFourTG.center = CGPointMake(xFourTG, yFourTG);
    pFiveTG.center = CGPointMake(xFiveTG, yFiveTG);
    pSixTG.center = CGPointMake(xSixTG, ySixTG);
    pSevenTG.center = CGPointMake(xSevenTG, ySevenTG);
    pEightTG.center = CGPointMake(xEightTG, yEightTG);
    pNineTG.center = CGPointMake(xNineTG, yNineTG);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseTG setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoTG play];
    
    PauseTG.userInteractionEnabled = NO;
    CheckTG.userInteractionEnabled = NO;
    PauseDisplayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsTG.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeTG.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTG.alpha = 1.0;
        
        CurrentWordsTG.alpha = 1;
        PlayTG.alpha = 1;
        HomeTG.alpha = 1;
        
        PauseDisplayTG.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeTG.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayTG.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWordsTG.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        CheckTG.alpha = 0;
        TheCurrentWordTG.alpha = 0;
        BarUnderWordTG.alpha = 0;
        SenderDisplayTG.alpha = 0;
        TotalAmountTG.alpha = 0;
        PauseTG.alpha = 0;
        
        CheckTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        PauseTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        pOneTG.alpha = 0;
        pTwoTG.alpha = 0;
        pThreeTG.alpha = 0;
        pFourTG.alpha = 0;
        pFiveTG.alpha = 0;
        pSixTG.alpha = 0;
        pSevenTG.alpha  =0;
        pEightTG.alpha = 0;
        pNineTG.alpha = 0;
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerTG = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerTG = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerTG = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerTG = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerTG = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerTG.scrollEnabled = YES;
    WordScrollerTG.userInteractionEnabled = YES;
    WordScrollerTG.backgroundColor = [UIColor blackColor];
    WordScrollerTG.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerTG.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerTG aboveSubview:PauseDisplayTG];
    if (ScoreTG > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        int i = 0;
        int z = 1;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
                {
                    if (WordIsAlreadyDoneTG[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerTG.subviews) {
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
                            WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerTG addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneTG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTG.subviews) {
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
                                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTG addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneTG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTG.subviews) {
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
                                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTG addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneTG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTG.subviews) {
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
                                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTG addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneTG[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTG.subviews) {
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
                                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerTG addSubview:lbl];
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
            [WordScrollerTG addSubview:lbll];
            WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTG addSubview:lbll];
                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTG addSubview:lbll];
                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTG addSubview:lbll];
                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTG addSubview:lbll];
                WordScrollerTG.contentSize = CGSizeMake(WordScrollerTG.bounds.size.width, lbll.center.y + 50);
            }
        }
    }
}

-(IBAction)Play:(id)sender
{
    [SoundOneTG play];
    [SoundTwoTG play];
    
    for (UIView *v in WordScrollerTG.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerTG removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTG.alpha = 0;
        HomeTG.alpha = 0;
        PlayTG.alpha = 0;
        CurrentWordsTG.alpha = 0;
        
        CheckTG.userInteractionEnabled = YES;
        PauseTG.userInteractionEnabled = YES;
        
        PauseDisplayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        CheckTG.alpha = 1;
        TheCurrentWordTG.alpha = 1;
        BarUnderWordTG.alpha = 1;
        SenderDisplayTG.alpha = 1;
        TotalAmountTG.alpha = 1;
        PauseTG.alpha = 1;
        
        CheckTG.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordTG.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordTG.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayTG.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountTG.transform =CGAffineTransformMakeScale(1,1);
        PauseTG.transform =CGAffineTransformMakeScale(1,1);
        
        pOneTG.alpha = 1;
        pTwoTG.alpha = 1;
        pThreeTG.alpha = 1;
        pFourTG.alpha = 1;
        pFiveTG.alpha = 1;
        pSixTG.alpha = 1;
        pSevenTG.alpha  =1;
        pEightTG.alpha = 1;
        pNineTG.alpha = 1;
        
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneTG play];
    [SoundTwoTG play];
    
    for (UIView *v in WordScrollerTG.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerTG removeFromSuperview];
    
    CheckTG.transform =CGAffineTransformMakeScale(1,1);
    TheCurrentWordTG.transform =CGAffineTransformMakeScale(1,1);
    BarUnderWordTG.transform =CGAffineTransformMakeScale(1,1);
    SenderDisplayTG.transform =CGAffineTransformMakeScale(1,1);
    TotalAmountTG.transform =CGAffineTransformMakeScale(1,1);
    PauseTG.transform =CGAffineTransformMakeScale(1,1);
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTG.alpha = 0;
        HomeTG.alpha = 0;
        PlayTG.alpha = 0;
        CurrentWordsTG.alpha = 0;
        
        CheckTG.userInteractionEnabled = YES;
        PauseTG.userInteractionEnabled = YES;
        
        PauseDisplayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeTG.transform =CGAffineTransformMakeScale(1.3,1.3);
    }];
    
    [pOneTG setAlpha:0];
    [pTwoTG setAlpha:0];
    [pThreeTG setAlpha:0];
    [pFourTG setAlpha:0];
    [pFiveTG setAlpha:0];
    [pSixTG setAlpha:0];
    [pSevenTG setAlpha:0];
    [pEightTG setAlpha:0];
    [pNineTG setAlpha:0];
    [BarUnderWordTG setAlpha:0];
    [TheCurrentWordTG setAlpha:0];
    [CheckTG setAlpha:0];
    [PauseTG setAlpha:0];
    [SenderDisplayTG setAlpha:0];
    [TotalAmountTG setAlpha:0];
    
    [self BackToHome];
}

-(void)BackToHome
{
    for (int i = 0; i <= 956; i++) {
        @autoreleasepool {
        WordIsAlreadyDoneTG[i] = NO;
        }
    }
    
    moverTG = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjectsBack) userInfo:nil repeats:YES];
    
    ScoreTG = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    
    [tHomeTG setAlpha:1];
    
    [sOneTG setAlpha:1];
    [sTwoTG setAlpha:1];
    [sThreeTG setAlpha:1];
    [sFourTG setAlpha:1];
    [sFiveTG setAlpha:1];
    [sSixTG setAlpha:1];
    [sSevenTG setAlpha:1];
    [sEightTG setAlpha:1];
    [sNineTG setAlpha:1];
    [sTenTG setAlpha:1];
    [sElevenTG setAlpha:1];
    [sTwelveTG setAlpha:1];
    [sThirteenTG setAlpha:1];
    [sFourteenTG setAlpha:1];
    [sFithteenTG setAlpha:1];
    [UIView commitAnimations];
    
    [TileOneTG removeFromSuperview];
    [TileTwoTG removeFromSuperview];
    [TileThreeTG removeFromSuperview];
    [TileFourTG removeFromSuperview];
    [TileFiveTG removeFromSuperview];
    [TileSixTG removeFromSuperview];
    [TileSevenTG removeFromSuperview];
    [TileEightTG removeFromSuperview];
    [TileNineTG removeFromSuperview];
    
    pOneTG.center = CGPointMake(ikOneTG, iktOneTG);
    pTwoTG.center = CGPointMake(ikTwoTG, iktTwoTG);
    pThreeTG.center = CGPointMake(ikThreeTG, iktThreeTG);
    pFourTG.center = CGPointMake(ikFourTG, iktFourTG);
    pFiveTG.center = CGPointMake(ikFiveTG, iktFiveTG);
    pSixTG.center = CGPointMake(ikSixTG, iktSixTG);
    pSevenTG.center = CGPointMake(ikSevenTG, iktSevenTG);
    pEightTG.center = CGPointMake(ikEightTG, iktEightTG);
    pNineTG.center = CGPointMake(ikNineTG, iktNineTG);
}

-(void)MovingTheObjectsBack
{
    int a;
    a = 1;
    
    sOneTG.center = CGPointMake(sOneTG.center.x, sOneTG.center.y + a);
    sTwoTG.center = CGPointMake(sTwoTG.center.x , sTwoTG.center.y + a);
    sThreeTG.center = CGPointMake(sThreeTG.center.x , sThreeTG.center.y + a);
    sFourTG.center = CGPointMake(sFourTG.center.x , sFourTG.center.y + a);
    sFiveTG.center = CGPointMake(sFiveTG.center.x , sFiveTG.center.y + a);
    sSixTG.center = CGPointMake(sSixTG.center.x , sSixTG.center.y + a);
    sSevenTG.center = CGPointMake(sSevenTG.center.x , sSevenTG.center.y + a);
    sEightTG.center = CGPointMake(sEightTG.center.x , sEightTG.center.y + a);
    sNineTG.center = CGPointMake(sNineTG.center.x , sNineTG.center.y + a);
    sTenTG.center = CGPointMake(sTenTG.center.x , sTenTG.center.y + a);
    sElevenTG.center = CGPointMake(sElevenTG.center.x , sElevenTG.center.y + a);
    sTwelveTG.center = CGPointMake(sTwelveTG.center.x , sTwelveTG.center.y + a);
    sThirteenTG.center = CGPointMake(sThirteenTG.center.x , sThirteenTG.center.y + a);
    sFourteenTG.center = CGPointMake(sFourteenTG.center.x , sFourteenTG.center.y + a);
    sFithteenTG.center = CGPointMake(sFithteenTG.center.x , sFithteenTG.center.y + a);
    
    if (sNineTG.center.y >= kSelectionTG) {
        [moverTG invalidate];
        moverTG = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        
        BBSelectionTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        gThreeTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        gTwoTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        gOneTG.transform =CGAffineTransformMakeScale(1.3,1.3);
        [UIView animateWithDuration:0.25 animations:^{
            gOneTG.alpha = 1.0;
            gTwoTG.alpha = 1;
            gThreeTG.alpha = 1;
            BBSelectionTG.alpha = 1;
            
            gOneTG.transform =CGAffineTransformMakeScale(1.0,1.0);
            gTwoTG.transform =CGAffineTransformMakeScale(1.0,1.0);
            gThreeTG.transform =CGAffineTransformMakeScale(1.0,1.0);
            BBSelectionTG.transform =CGAffineTransformMakeScale(1.0,1.0);
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
    [sOneTG setAlpha:0];
    [sTwoTG setAlpha:0];
    [sThreeTG setAlpha:0];
    [sFourTG setAlpha:0];
    [sFiveTG setAlpha:0];
    [sSixTG setAlpha:0];
    [sSevenTG setAlpha:0];
    [sEightTG setAlpha:0];
    [sNineTG setAlpha:0];
    [sTenTG setAlpha:0];
    [sElevenTG setAlpha:0];
    [sTwelveTG setAlpha:0];
    [sThirteenTG setAlpha:0];
    [sFourteenTG setAlpha:0];
    [sFithteenTG setAlpha:0];
    [BBSelectionTG setAlpha:0];
    [UIView commitAnimations];
    BackGroundThreeTG.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneTG.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:0.9];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"GTQuestionsThree" sender:self];
}

-(IBAction)gThree:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOneTG setAlpha:0];
    [sTwoTG setAlpha:0];
    [sThreeTG setAlpha:0];
    [sFourTG setAlpha:0];
    [sFiveTG setAlpha:0];
    [sSixTG setAlpha:0];
    [sSevenTG setAlpha:0];
    [sEightTG setAlpha:0];
    [sNineTG setAlpha:0];
    [sTenTG setAlpha:0];
    [sElevenTG setAlpha:0];
    [sTwelveTG setAlpha:0];
    [sThirteenTG setAlpha:0];
    [sFourteenTG setAlpha:0];
    [sFithteenTG setAlpha:0];
    [BBSelectionTG setAlpha:0];
    [UIView commitAnimations];
    BackGroundTwoTG.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneTG.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameThree) withObject:nil afterDelay:1];
}

-(void)GoToGameThree
{
    [self performSegueWithIdentifier:@"GTChoiceThree" sender:self];
}

-(IBAction)tHome:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourTG.alpha = 0;
        BackGroundFourTG.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourTG.alpha = 1;
                             BackGroundFourTG.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoToHomeFromThreeGrids" sender:self];
}

@end
