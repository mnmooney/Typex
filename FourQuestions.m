//
//  FourQuestions.m
//  Typex V2
//
//  Created by Michael Mooney on 20/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "FourQuestions.h"
#import <AVFoundation/AVFoundation.h>

NSInteger WordFourQF;
NSString *WordQF;
NSString *SaveWordsQF;

int replayQF, ScoreQF, PreviousQF, PanningIntQF, PPanningMethodQF;
NSInteger PanningSensitivityQF;

char cOneQF, cTwoQF, cThreeQF, cFourQF, cFiveQF, cSixQF, cSevenQF, cEightQF, cNineQF, cTenQF, cElevenQF, cTwelveQF, cThirteenQF, cFourteenQF, cFithteenQF, cSixteenQF;
char wOneQF, wTwoQF, wThreeQF, wFourQF;

float ikOneQF, ikTwoQF, ikThreeQF, ikFourQF, ikFiveQF, ikSixQF, ikSevenQF, ikEightQF, ikNineQF, ikTenQF, ikElevenQF, ikTwelveQF, ikThirteenQF, ikFourteenQF, ikFithteenQF, ikSixteenQF;
float iktOneQF, iktTwoQF, iktThreeQF, iktFourQF, iktFiveQF, iktSixQF, iktSevenQF, iktEightQF, iktNineQF, iktTenQF, iktElevenQF, iktTwelveQF, iktThirteenQF, iktFourteenQF, iktFithteenQF, iktSixteenQF;
float iLeftQF, iRightQF, iUpQF, iDownQF;
float pointOfIntrestQF;
float xOneQF, yOneQF, xTwoQF, yTwoQF, xThreeQF, yThreeQF, xFourQF, yFourQF, xFiveQF, yFiveQF, xSixQF, ySixQF, xSevenQF, ySevenQF, xEightQF, yEightQF, xNineQF, yNineQF, xTenQF, yTenQF, xElevenQF, yElevenQF, xTwelveQF, yTwelveQF, xThirteenQF, yThirteenQF, xFourteenQF, yFourteenQF, xFithteenQF, yFithteenQF, ySixteenQF, xSixteenQF;
float kSelectionQF;

CGPoint OneQF, TwoQF, ThreeQF, FourQF, FiveQF, SixQF, SevenQF, EightQF, NineQF, TenQF, ElevenQF, TwelveQF, ThirteenQF, FourteenQF, FithteenQF, SixteenQF, distanceQF;

BOOL WordIsAlreadyDoneQF[23];

@interface FourQuestions () <AVAudioPlayerDelegate>
{
    AVAudioPlayer *SoundOneQF, *SoundTwoQF, *SwipeSoundQF;
    
#pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeQF, *CheckQF;
    IBOutlet UIImageView *BackGroundOneQF, *BackGroundTwoQF, *BackGroundThreeQF, *BackGroundFourQF;
    
#pragma Mark Game - Grids
    IBOutlet UIImageView *pOneQF, *pTwoQF, *pThreeQF, *pFourQF, *pFiveQF, *pSixQF, *pSevenQF, *pEightQF, *pNineQF, *pTenQF, *pElevenQF, *pTwelveQF, *pThirteenQF, *pFourteenQF, *pFithteenQF, *pSixteenQF;
    IBOutlet UILabel *TotalAmountQF;
    IBOutlet UIButton *PauseQF;
    IBOutlet UILabel *TheCurrentWordQF;
    IBOutlet UIImageView *PauseDisplayQF, *SenderDisplayQF;
    IBOutlet UIButton *HomeQF, *PlayQF;
    IBOutlet UIImageView *BarUnderWordQF;
    IBOutlet UIImageView *BBSelectionQF;
    IBOutlet UILabel *TheQuestionQF;
    IBOutlet UIImageView *TileOneFQ, *TileTwoFQ, *TileThreeFQ, *TileFourFQ, *TileFiveFQ, *TileSixFQ, *TileSevenFQ, *TileEightFQ, *TileNineFQ, *TileTenFQ, *TileElevenFQ, *TileTwelveFQ, *TileThirteenFQ, *TileFourteenFQ, *TileFithteenFQ, *TileSixteenFQ;
    
#pragma Mark Selection - Fist Page
    IBOutlet UIButton *sOneQF, *sTwoQF, *sThreeQF, *sFourQF, *sFiveQF, *sSixQF, *sSevenQF, *sEightQF, *sNineQF;
    IBOutlet UIButton *gOneQF, *gTwoQF, *gThreeQF;
    IBOutlet UIScrollView *WordScrollerQF;
    IBOutlet UILabel *CurrentWordsQF;
    
    NSTimer *moverQF;
}
@end

@implementation FourQuestions


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

    BackGroundFourQF.alpha = 0;
    
#pragma Mark The Game Items
    
    ScoreQF = 0;
    
    PauseQF.alpha = 0;
    CheckQF.alpha = 0;
    TotalAmountQF.alpha = 0;
    
    pOneQF.alpha = 0;
    pTwoQF.alpha = 0;
    pThreeQF.alpha = 0;
    CurrentWordsQF.alpha = 0;
    PlayQF.alpha = 0;
    HomeQF.alpha = 0;
    pFourQF.alpha = 0;
    pFiveQF.alpha = 0;
    pSixQF.alpha = 0;
    pSevenQF.alpha = 0;
    pEightQF.alpha = 0;
    pNineQF.alpha = 0;
    pTenQF.alpha = 0;
    pElevenQF.alpha = 0;
    pTwelveQF.alpha = 0;
    BarUnderWordQF.alpha = 0;
    pThirteenQF.alpha = 0;
    pFourteenQF.alpha = 0;
    pFithteenQF.alpha = 0;
    pSixteenQF.alpha = 0;
    SenderDisplayQF.alpha = 0;
    TheCurrentWordQF.alpha = 0;
    PauseDisplayQF.alpha = 0;
    TheQuestionQF.alpha = 0;
    
#pragma Mark The Selection Page
    
    sOneQF.alpha = 0;
    sTwoQF.alpha = 0;
    sThreeQF.alpha = 0;
    sFourQF.alpha = 0;
    sFiveQF.alpha = 0;
    sSixQF.alpha = 0;
    sSevenQF.alpha = 0;
    sEightQF.alpha = 0;
    sNineQF.alpha = 0;
    BBSelectionQF.alpha = 0;
    PauseDisplayQF.backgroundColor = [UIColor blackColor];
    self.view.userInteractionEnabled = NO;
    [self performSelector:@selector(Opening) withObject:nil afterDelay:0.1];
    [self SettingUpFuncionForButtons];
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneQF = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoQF = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSoundQF = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
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
    [gOneQF.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoQF.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gThreeQF.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeQF.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        sOneQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwoQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThreeQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFiveQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSixQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSevenQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sEightQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sNineQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            sOneQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwoQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThreeQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFiveQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSixQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSevenQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sEightQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sNineQF.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                sOneQF.transform = CGAffineTransformIdentity;
                sTwoQF.transform = CGAffineTransformIdentity;
                sThreeQF.transform = CGAffineTransformIdentity;
                sFourQF.transform = CGAffineTransformIdentity;
                sFiveQF.transform = CGAffineTransformIdentity;
                sSixQF.transform = CGAffineTransformIdentity;
                sSevenQF.transform = CGAffineTransformIdentity;
                sEightQF.transform = CGAffineTransformIdentity;
                sNineQF.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    gOneQF.alpha = 1;
    gTwoQF.alpha = 1;
    gThreeQF.alpha = 1;
    BBSelectionQF.alpha = 1;
    sOneQF.alpha = 1;
    sTwoQF.alpha = 1;
    sThreeQF.alpha = 1;
    sFourQF.alpha = 1;
    sFiveQF.alpha = 1;
    sSixQF.alpha = 1;
    sSevenQF.alpha = 1;
    sEightQF.alpha = 1;
    sNineQF.alpha = 1;
    [UIView commitAnimations];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        pOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(33, 220, 60, 60)];
        pTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(98, 220, 60, 60)];
        pThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(163, 220, 60, 60)];
        pFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(228, 220, 60, 60)];
        pFiveQF = [[UIImageView alloc] initWithFrame:CGRectMake(33, 285, 60, 60)];
        pSixQF = [[UIImageView alloc] initWithFrame:CGRectMake(98, 285, 60, 60)];
        pSevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(163, 285, 60, 60)];
        pEightQF = [[UIImageView alloc] initWithFrame:CGRectMake(228, 285, 60, 60)];
        pNineQF = [[UIImageView alloc] initWithFrame:CGRectMake(33, 350, 60, 60)];
        pTenQF = [[UIImageView alloc] initWithFrame:CGRectMake(98, 350, 60, 60)];
        pElevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(163, 350, 60, 60)];
        pTwelveQF = [[UIImageView alloc] initWithFrame:CGRectMake(228, 350, 60, 60)];
        pThirteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(33, 415, 60, 60)];
        pFourteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(98, 415, 60, 60)];
        pFithteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(163, 415, 60, 60)];
        pSixteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(228, 415, 60, 60)];

        BackGroundOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        SenderDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 250, 45)];
        TotalAmountQF = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 76, 38)];
        TotalAmountQF.font = [[TotalAmountQF font] fontWithSize:15];
        PauseQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckQF = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordQF = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordQF = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordQF.font  = [[TheCurrentWordQF font] fontWithSize:15];
        TheQuestionQF = [[UILabel alloc] initWithFrame:CGRectMake(143, 20, 161, 38)];
        TheQuestionQF.font  = [[TheQuestionQF font] fontWithSize:16];
        
        tHomeQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneQF = [[UIButton alloc] initWithFrame:CGRectMake(87, 434, 40, 40)];
        gTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(140, 434, 40, 40)];
        gThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(193, 434, 40, 40)];
        BBSelectionQF = [[UIImageView alloc] initWithFrame:CGRectMake(136, 430, 48, 48)];
        
        sOneQF = [[UIButton alloc] initWithFrame:CGRectMake(72, 45, 100, 40)];
        sTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(180, 45, 100, 40)];
        sThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(72, 93, 100, 40)];
        sFourQF = [[UIButton alloc] initWithFrame:CGRectMake(180, 93, 100, 40)];
        sFiveQF = [[UIButton alloc] initWithFrame:CGRectMake(72, 141, 100, 40)];
        sSixQF = [[UIButton alloc] initWithFrame:CGRectMake(180, 141, 100, 40)];
        sSevenQF = [[UIButton alloc] initWithFrame:CGRectMake(72, 189, 100, 40)];
        sEightQF = [[UIButton alloc] initWithFrame:CGRectMake(180, 189, 100, 40)];
        sNineQF = [[UIButton alloc] initWithFrame:CGRectMake(72, 237, 100, 40)];
        
        PlayQF = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeQF = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsQF = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsQF.font  = [[CurrentWordsQF font] fontWithSize:20];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 240, 50)];
        TotalAmountQF = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 89, 36)];
        TotalAmountQF.font = [[TotalAmountQF font] fontWithSize:16];
        PauseQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckQF = [[UIButton alloc] initWithFrame:CGRectMake(60, 130, 200, 40)];
        BarUnderWordQF = [[UIImageView alloc] initWithFrame:CGRectMake(40, 228, 240, 2)];
        TheCurrentWordQF = [[UILabel alloc] initWithFrame:CGRectMake(108, 197, 104, 28)];
        TheCurrentWordQF.font  = [[TheCurrentWordQF font] fontWithSize:25];
        TheQuestionQF = [[UILabel alloc] initWithFrame:CGRectMake(154, 20, 140, 36)];
        
        tHomeQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneQF = [[UIButton alloc] initWithFrame:CGRectMake(89, 520, 40, 40)];
        gTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(139, 520, 40, 40)];
        gThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(192, 520, 40, 40)];
        BBSelectionQF = [[UIImageView alloc] initWithFrame:CGRectMake(136, 517, 46, 46)];
        
        sOneQF = [[UIButton alloc] initWithFrame:CGRectMake(48, 106, 110, 45)];
        sTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(182, 106, 110, 45)];
        sThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(48, 156, 110, 45)];
        sFourQF = [[UIButton alloc] initWithFrame:CGRectMake(182, 156, 110, 45)];
        sFiveQF = [[UIButton alloc] initWithFrame:CGRectMake(48, 206, 110, 45)];
        sSixQF = [[UIButton alloc] initWithFrame:CGRectMake(182, 206, 110, 45)];
        sSevenQF = [[UIButton alloc] initWithFrame:CGRectMake(48, 256, 110, 45)];
        sEightQF = [[UIButton alloc] initWithFrame:CGRectMake(182, 256, 110, 45)];
        sNineQF = [[UIButton alloc] initWithFrame:CGRectMake(48, 306, 110, 45)];
        
        pOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(5, 238, 70, 70)];
        pTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(85, 238, 70, 70)];
        pThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(165, 238, 70, 70)];
        pFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(245, 238, 70, 70)];
        pFiveQF = [[UIImageView alloc] initWithFrame:CGRectMake(5, 318, 70, 70)];
        pSixQF = [[UIImageView alloc] initWithFrame:CGRectMake(85, 318, 70, 70)];
        pSevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(165, 318, 70, 70)];
        pEightQF = [[UIImageView alloc] initWithFrame:CGRectMake(245, 318, 70, 70)];
        pNineQF = [[UIImageView alloc] initWithFrame:CGRectMake(5, 398, 70, 70)];
        pTenQF = [[UIImageView alloc] initWithFrame:CGRectMake(85, 398, 70, 70)];
        pElevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(165, 398, 70, 70)];
        pTwelveQF = [[UIImageView alloc] initWithFrame:CGRectMake(245, 398, 70, 70)];
        pThirteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(5, 478, 70, 70)];
        pFourteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(85, 478, 70, 70)];
        pFithteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(165, 478, 70, 70)];
        pSixteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(245, 478, 70, 70)];
        
        BackGroundOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        PlayQF = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeQF = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsQF = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsQF.font  = [[CurrentWordsQF font] fontWithSize:20];
        TheQuestionQF.font  = [[TheQuestionQF font] fontWithSize:16];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneQF = [[UIButton alloc] initWithFrame:CGRectMake(107, 602, 45, 45)];
        gTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(165, 602, 45, 45)];
        gThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(223, 602, 45, 45)];
        BBSelectionQF = [[UIImageView alloc] initWithFrame:CGRectMake(162, 599, 51, 51)];
        
        sOneQF = [[UIButton alloc] initWithFrame:CGRectMake(12, 251, 110, 50)];
        sTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(130, 251, 110, 50)];
        sThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(252, 251, 110, 50)];
        sFourQF = [[UIButton alloc] initWithFrame:CGRectMake(12, 309, 110, 50)];
        sFiveQF = [[UIButton alloc] initWithFrame:CGRectMake(130, 309, 110, 50)];
        sSixQF = [[UIButton alloc] initWithFrame:CGRectMake(252, 309, 110, 50)];
        sSevenQF = [[UIButton alloc] initWithFrame:CGRectMake(12, 367, 110, 50)];
        sEightQF = [[UIButton alloc] initWithFrame:CGRectMake(130, 367, 110, 50)];
        sNineQF = [[UIButton alloc] initWithFrame:CGRectMake(252, 367, 110, 50)];
        
        BackGroundOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        PlayQF = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeQF = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsQF = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsQF.font = [[CurrentWordsQF font] fontWithSize:25];
        
        pOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(12, 297, 80, 80)];
        pTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(102, 297, 80, 80)];
        pThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(192, 297, 80, 80)];
        pFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(282, 297, 80, 80)];
        pFiveQF = [[UIImageView alloc] initWithFrame:CGRectMake(12, 387, 80, 80)];
        pSixQF = [[UIImageView alloc] initWithFrame:CGRectMake(102, 387, 80, 80)];
        pSevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(192, 387, 80, 80)];
        pEightQF = [[UIImageView alloc] initWithFrame:CGRectMake(282, 387, 80, 80)];
        pNineQF = [[UIImageView alloc] initWithFrame:CGRectMake(12, 477, 80, 80)];
        pTenQF = [[UIImageView alloc] initWithFrame:CGRectMake(102, 477, 80, 80)];
        pElevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(192, 477, 80, 80)];
        pTwelveQF = [[UIImageView alloc] initWithFrame:CGRectMake(282, 477, 80, 80)];
        pThirteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(12, 567, 80, 80)];
        pFourteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(102, 567, 80, 80)];
        pFithteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(192, 567, 80, 80)];
        pSixteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(282, 567, 80, 80)];
        
        BarUnderWordQF = [[UIImageView alloc] initWithFrame:CGRectMake(67, 287, 240, 2)];
        TheCurrentWordQF = [[UILabel alloc] initWithFrame:CGRectMake(123, 254, 128, 35)];
        CheckQF = [[UIButton alloc] initWithFrame:CGRectMake(82, 174, 210, 45)];
        SenderDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 293, 50)];
        TotalAmountQF = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 105, 42)];
        TheQuestionQF = [[UILabel alloc] initWithFrame:CGRectMake(165, 20, 187, 41)];
        PauseQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWordQF.font  = [[TheCurrentWordQF font] fontWithSize:25];
        TotalAmountQF.font = [[TotalAmountQF font] fontWithSize:22];
        TheQuestionQF.font  = [[TheQuestionQF font] fontWithSize:20];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneQF = [[UIButton alloc] initWithFrame:CGRectMake(127, 671, 45, 45)];
        gTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(185, 671, 45, 45)];
        gThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(243, 671, 45, 45)];
        BBSelectionQF = [[UIImageView alloc] initWithFrame:CGRectMake(181, 668, 51, 51)];
        
        PlayQF = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeQF = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsQF = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsQF.font = [[CurrentWordsQF font] fontWithSize:25];
        
        sOneQF = [[UIButton alloc] initWithFrame:CGRectMake(19, 285, 120, 50)];
        sTwoQF = [[UIButton alloc] initWithFrame:CGRectMake(147, 285, 120, 50)];
        sThreeQF = [[UIButton alloc] initWithFrame:CGRectMake(275, 285, 120, 50)];
        sFourQF = [[UIButton alloc] initWithFrame:CGRectMake(19, 343, 120, 50)];
        sFiveQF = [[UIButton alloc] initWithFrame:CGRectMake(147, 343, 120, 50)];
        sSixQF = [[UIButton alloc] initWithFrame:CGRectMake(275, 343, 120, 50)];
        sSevenQF = [[UIButton alloc] initWithFrame:CGRectMake(19, 401, 120, 50)];
        sEightQF = [[UIButton alloc] initWithFrame:CGRectMake(147, 401, 120, 50)];
        sNineQF = [[UIButton alloc] initWithFrame:CGRectMake(275, 401, 120, 50)];
        
        BarUnderWordQF = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordQF = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckQF = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayQF = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 329, 55)];
        TotalAmountQF = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 105, 45)];
        PauseQF = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        TheQuestionQF = [[UILabel alloc] initWithFrame:CGRectMake(182, 20, 208, 45)];
        TheQuestionQF.font  = [[TheQuestionQF font] fontWithSize:20];
        
        TheCurrentWordQF.font  = [[TheCurrentWordQF font] fontWithSize:25];
        TotalAmountQF.font = [[TotalAmountQF font] fontWithSize:25];
        
        pOneQF = [[UIImageView alloc] initWithFrame:CGRectMake(30, 376, 85, 85)];
        pTwoQF = [[UIImageView alloc] initWithFrame:CGRectMake(120, 376, 85, 85)];
        pThreeQF = [[UIImageView alloc] initWithFrame:CGRectMake(210, 376, 85, 85)];
        pFourQF = [[UIImageView alloc] initWithFrame:CGRectMake(300, 376, 85, 85)];
        pFiveQF = [[UIImageView alloc] initWithFrame:CGRectMake(30, 466, 85, 85)];
        pSixQF = [[UIImageView alloc] initWithFrame:CGRectMake(120, 466, 85, 85)];
        pSevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(210, 466, 85, 85)];
        pEightQF = [[UIImageView alloc] initWithFrame:CGRectMake(300, 466, 85, 85)];
        pNineQF = [[UIImageView alloc] initWithFrame:CGRectMake(30, 556, 85, 85)];
        pTenQF = [[UIImageView alloc] initWithFrame:CGRectMake(120, 556, 85, 85)];
        pElevenQF = [[UIImageView alloc] initWithFrame:CGRectMake(210, 556, 85, 85)];
        pTwelveQF = [[UIImageView alloc] initWithFrame:CGRectMake(300, 556, 85, 85)];
        pThirteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(30, 646, 85, 85)];
        pFourteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(120, 646, 85, 85)];
        pFithteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(210, 646, 85, 85)];
        pSixteenQF = [[UIImageView alloc] initWithFrame:CGRectMake(300, 646, 85, 85)];
    }
    
    [self.view addSubview:BackGroundOneQF];
    
    [PlayQF setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeQF setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayQF addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeQF addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayQF.showsTouchWhenHighlighted = YES;
    HomeQF.showsTouchWhenHighlighted = YES;
    PlayQF.adjustsImageWhenHighlighted = NO;
    HomeQF.adjustsImageWhenHighlighted = NO;
    CurrentWordsQF.text = @"CURRENT WORDS";
    CurrentWordsQF.textColor = [UIColor whiteColor];
    CurrentWordsQF.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplayQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:HomeQF aboveSubview:PauseDisplayQF];
    [self.view insertSubview:PlayQF aboveSubview:PauseDisplayQF];
    [self.view insertSubview:CurrentWordsQF aboveSubview:PauseDisplayQF];
    
    BarUnderWordQF.backgroundColor = [UIColor blackColor];
    TheCurrentWordQF.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordQF.textColor = [UIColor whiteColor];
    CheckQF.adjustsImageWhenHighlighted = NO;
    tHomeQF.adjustsImageWhenHighlighted = NO;
    tHomeQF.showsTouchWhenHighlighted = YES;
    gOneQF.showsTouchWhenHighlighted = YES;
    gTwoQF.showsTouchWhenHighlighted = YES;
    TheQuestionQF.textColor = [UIColor whiteColor];
    TheQuestionQF.textAlignment = NSTextAlignmentCenter;
    gThreeQF.showsTouchWhenHighlighted = YES;
    gOneQF.adjustsImageWhenHighlighted = NO;
    gTwoQF.adjustsImageWhenHighlighted = NO;
    gThreeQF.adjustsImageWhenHighlighted = NO;
    BBSelectionQF.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeQF setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [gOneQF setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoQF setImage:[UIImage imageNamed:@"BButtonThree.png"] forState:UIControlStateNormal];
    [gThreeQF setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckQF setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckQF addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseQF setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHomeQF addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [PauseQF addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseQF.adjustsImageWhenHighlighted = NO;
    SenderDisplayQF.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountQF.textColor = [UIColor whiteColor];
    TotalAmountQF.textAlignment = NSTextAlignmentCenter;
    [gOneQF addTarget:self action:@selector(gOne:) forControlEvents:UIControlEventTouchUpInside];
    [gThreeQF addTarget:self action:@selector(gThree:) forControlEvents:UIControlEventTouchUpInside];
    BackGroundTwoQF.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundOneQF.image = [UIImage imageNamed:@"BackGroundTwo.png"];
    BackGroundThreeQF.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourQF.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [self.view insertSubview:BackGroundTwoQF belowSubview:BackGroundOneQF];
    [self.view insertSubview:BackGroundThreeQF belowSubview:BackGroundOneQF];
    [self.view insertSubview:SenderDisplayQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:TotalAmountQF aboveSubview:SenderDisplayQF];
    [self.view insertSubview:PauseQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:CheckQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:BarUnderWordQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:TheCurrentWordQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pOneQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pTwoQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pThreeQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pFourQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pFiveQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pSixQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pSevenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pEightQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pNineQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:tHomeQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:gOneQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:gTwoQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:gThreeQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:BBSelectionQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:TheQuestionQF aboveSubview:SenderDisplayQF];
    
    [self.view insertSubview:pOneQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pTwoQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pThreeQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pFourQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pFiveQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pSixQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pSevenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pEightQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pNineQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pTenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pElevenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pTwelveQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pThirteenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pFourteenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pFithteenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:pSixteenQF aboveSubview:BackGroundOneQF];
    
    [sOneQF setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [sTwoQF setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [sThreeQF setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [sFourQF setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [sFiveQF setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [sSixQF setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [sSevenQF setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [sEightQF setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [sNineQF setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    
    [sOneQF addTarget:self action:@selector(One:) forControlEvents:UIControlEventTouchUpInside];
    [sTwoQF addTarget:self action:@selector(Two:) forControlEvents:UIControlEventTouchUpInside];
    [sThreeQF addTarget:self action:@selector(Three:) forControlEvents:UIControlEventTouchUpInside];
    [sFourQF addTarget:self action:@selector(Four:) forControlEvents:UIControlEventTouchUpInside];
    [sFiveQF addTarget:self action:@selector(Five:) forControlEvents:UIControlEventTouchUpInside];
    [sSixQF addTarget:self action:@selector(Six:) forControlEvents:UIControlEventTouchUpInside];
    [sSevenQF addTarget:self action:@selector(Seven:) forControlEvents:UIControlEventTouchUpInside];
    [sEightQF addTarget:self action:@selector(Eight:) forControlEvents:UIControlEventTouchUpInside];
    [sNineQF addTarget:self action:@selector(Nine:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:sOneQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sTwoQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sThreeQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sFourQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sFiveQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sSixQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sSevenQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sEightQF aboveSubview:BackGroundOneQF];
    [self.view insertSubview:sNineQF aboveSubview:BackGroundOneQF];
    [self.view addSubview:BackGroundFourQF];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)SettingUpFuncionForButtons
{
    [CheckQF addTarget:self action:@selector(CheckClciked) forControlEvents:UIControlEventTouchUpOutside];
    [CheckQF addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckQF addTarget:self action:@selector(CheckClciked) forControlEvents:UIControlEventTouchUpInside];
    
    [PauseQF addTarget:self action:@selector(PauseClicked) forControlEvents:UIControlEventTouchUpOutside];
    [PauseQF addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    [sOneQF addTarget:self action:@selector(sOneClicked) forControlEvents:UIControlEventTouchDown];
    [sOneQF addTarget:self action:@selector(sOneClick) forControlEvents:UIControlEventTouchUpInside];
    [sOneQF addTarget:self action:@selector(sOneClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwoQF addTarget:self action:@selector(sTwoClicked) forControlEvents:UIControlEventTouchDown];
    [sTwoQF addTarget:self action:@selector(sTwoClick) forControlEvents:UIControlEventTouchUpInside];
    [sTwoQF addTarget:self action:@selector(sTwoClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sThreeQF addTarget:self action:@selector(sThreeClicked) forControlEvents:UIControlEventTouchDown];
    [sThreeQF addTarget:self action:@selector(sThreeClick) forControlEvents:UIControlEventTouchUpInside];
    [sThreeQF addTarget:self action:@selector(sThreeClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourQF addTarget:self action:@selector(sFourClicked) forControlEvents:UIControlEventTouchDown];
    [sFourQF addTarget:self action:@selector(sFourClick) forControlEvents:UIControlEventTouchUpInside];
    [sFourQF addTarget:self action:@selector(sFourClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sFiveQF addTarget:self action:@selector(sFiveClicked) forControlEvents:UIControlEventTouchDown];
    [sFiveQF addTarget:self action:@selector(sFiveClick) forControlEvents:UIControlEventTouchUpInside];
    [sFiveQF addTarget:self action:@selector(sFiveClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sSixQF addTarget:self action:@selector(sSixClicked) forControlEvents:UIControlEventTouchDown];
    [sSixQF addTarget:self action:@selector(sSixClick) forControlEvents:UIControlEventTouchUpInside];
    [sSixQF addTarget:self action:@selector(sSixClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sSevenQF addTarget:self action:@selector(sSevenClicked) forControlEvents:UIControlEventTouchDown];
    [sSevenQF addTarget:self action:@selector(sSevenClick) forControlEvents:UIControlEventTouchUpInside];
    [sSevenQF addTarget:self action:@selector(sSevenClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sEightQF addTarget:self action:@selector(sEightClicked) forControlEvents:UIControlEventTouchDown];
    [sEightQF addTarget:self action:@selector(sEightClick) forControlEvents:UIControlEventTouchUpInside];
    [sEightQF addTarget:self action:@selector(sEightClick) forControlEvents:UIControlEventTouchUpOutside];
    
    [sNineQF addTarget:self action:@selector(sNineClicked) forControlEvents:UIControlEventTouchDown];
    [sNineQF addTarget:self action:@selector(sNineClick) forControlEvents:UIControlEventTouchUpInside];
    [sNineQF addTarget:self action:@selector(sNineClick) forControlEvents:UIControlEventTouchUpOutside];
    
    ikOneQF = pOneQF.center.x;
    iktOneQF = pOneQF.center.y;
    ikTwoQF = pTwoQF.center.x;
    iktTwoQF = pTwoQF.center.y;
    ikThreeQF = pThreeQF.center.x;
    iktThreeQF = pThreeQF.center.y;
    ikFourQF = pFourQF.center.x;
    iktFourQF = pFourQF.center.y;
    ikFiveQF = pFiveQF.center.x;
    iktFiveQF = pFiveQF.center.y;
    ikSixQF = pSixQF.center.x;
    iktSixQF = pSixQF.center.y;
    ikSevenQF = pSevenQF.center.x;
    iktSevenQF = pSevenQF.center.y;
    ikEightQF = pEightQF.center.x;
    iktEightQF = pEightQF.center.y;
    ikNineQF = pNineQF.center.x;
    iktNineQF = pNineQF.center.y;
    ikTenQF = pTenQF.center.x;
    iktTenQF = pTenQF.center.y;
    ikElevenQF = pElevenQF.center.x;
    iktElevenQF = pElevenQF.center.y;
    ikTwelveQF = pTwelveQF.center.x;
    iktTwelveQF = pTwelveQF.center.y;
    ikThirteenQF = pThirteenQF.center.x;
    iktThirteenQF = pThirteenQF.center.y;
    ikFourteenQF = pFourteenQF.center.x;
    iktFourteenQF = pFourteenQF.center.y;
    ikFithteenQF = pFithteenQF.center.x;
    iktFithteenQF = pFithteenQF.center.y;
    ikSixteenQF = pSixteenQF.center.x;
    iktSixteenQF = pSixteenQF.center.y;
    kSelectionQF = sNineQF.center.y;
}

-(void)sOneClicked
{
    [sOneQF setImage:[UIImage imageNamed:@"OnePlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sOneClick
{
    [sOneQF setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sTwoClicked
{
    [sTwoQF setImage:[UIImage imageNamed:@"TwoPlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sTwoClick
{
    [sTwoQF setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sThreeClicked
{
    [sThreeQF setImage:[UIImage imageNamed:@"ThreePlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sThreeClick
{
    [sThreeQF setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sFourClicked
{
    [sFourQF setImage:[UIImage imageNamed:@"FourPlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sFourClick
{
    [sFourQF setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sFiveClicked
{
    [sFiveQF setImage:[UIImage imageNamed:@"FivePlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sFiveClick
{
    [sFiveQF setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sSixClicked
{
    [sSixQF setImage:[UIImage imageNamed:@"SixPlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sSixClick
{
    [sSixQF setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sSevenClicked
{
    [sSevenQF setImage:[UIImage imageNamed:@"SevenPlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sSevenClick
{
    [sSevenQF setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sEightClicked
{
    [sEightQF setImage:[UIImage imageNamed:@"EightPlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sEightClick
{
    [sEightQF setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sNineClicked
{
    [sNineQF setImage:[UIImage imageNamed:@"NinePlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sNineClick
{
    [sNineQF setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)PauseClicked
{
    [PauseQF setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(void)sPauseClicked
{
    [PauseQF setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)CheckClciked
{
    [CheckQF setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
}

-(void)sCheckClicked
{
    [CheckQF setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneQF play];
}

-(IBAction)One:(id)sender
{
    WordFourQF = 1;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour1"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsOne" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Two:(id)sender
{
    WordFourQF = 2;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour2"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsTwo" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Three:(id)sender
{
    WordFourQF = 3;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour3"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsThree" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Four:(id)sender
{
    WordFourQF = 4;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour4"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsFour" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Five:(id)sender
{
    WordFourQF = 5;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour5"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsFive" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Six:(id)sender
{
    WordFourQF = 6;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour6"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsSix" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Seven:(id)sender
{
    WordFourQF = 7;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour7"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsSeven" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eight:(id)sender
{
    WordFourQF = 8;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour8"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsEight" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Nine:(id)sender
{
    WordFourQF = 9;
    SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour9"];
    if (SaveWordsQF.length > 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"4QuestionsNine" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            i++;
            if ([SaveWordsQF rangeOfString:str].length == 4) {
                ScoreQF++;
                WordIsAlreadyDoneQF[i] = YES;
            }
        }
    }
    [self preViewDidLoad];
}

-(void)preViewDidLoad
{
    [self GameSettingUpForGrid];
    moverQF = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjects) userInfo:nil repeats:YES];
    
    pOneQF.center = CGPointMake(pSixQF.center.x, pSixQF.center.y);
    pTwoQF.center = CGPointMake(pSixQF.center.x, pSixQF.center.y);
    pFiveQF.center = CGPointMake(pSixQF.center.x, pSixQF.center.y);
    
    pThreeQF.center = CGPointMake(pSevenQF.center.x, pSevenQF.center.y);
    pFourQF.center = CGPointMake(pSevenQF.center.x, pSevenQF.center.y);
    pEightQF.center = CGPointMake(pSevenQF.center.x, pSevenQF.center.y);
    
    pNineQF.center = CGPointMake(pTenQF.center.x, pTenQF.center.y);
    pThirteenQF.center = CGPointMake(pTenQF.center.x, pTenQF.center.y);
    pFourteenQF.center = CGPointMake(pTenQF.center.x, pTenQF.center.y);
    
    pTwelveQF.center = CGPointMake(pElevenQF.center.x, pElevenQF.center.y);
    pFithteenQF.center = CGPointMake(pElevenQF.center.x, pElevenQF.center.y);
    pSixteenQF.center = CGPointMake(pElevenQF.center.x, pElevenQF.center.y);
    
    CGPoint midPoint;
    midPoint.x = ((pSevenQF.center.x + pSixQF.center.x) / 2);
    midPoint.y = ((pSixQF.center.y + pTenQF.center.y) / 2);
    
    pSixQF.center = CGPointMake(midPoint.x, midPoint.y);
    pSevenQF.center = CGPointMake(midPoint.x, midPoint.y);
    pTenQF.center = CGPointMake(midPoint.x, midPoint.y);
    pElevenQF.center = CGPointMake(midPoint.x, midPoint.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1];
    [pSixQF setAlpha:1];
    [pSevenQF setAlpha:1];
    [pTenQF setAlpha:1];
    [pElevenQF setAlpha:1];
    [CheckQF setAlpha:1];
    [TheCurrentWordQF setAlpha:1];
    [PauseQF setAlpha:1];
    [BarUnderWordQF setAlpha:1];
    [TotalAmountQF setAlpha:1];
    [SenderDisplayQF setAlpha:1];
    [tHomeQF setAlpha:0];
    [TheQuestionQF setAlpha:1];
    
    [sOneQF setAlpha:0];
    [sTwoQF setAlpha:0];
    [sThreeQF setAlpha:0];
    [sFourQF setAlpha:0];
    [sFiveQF setAlpha:0];
    [sSixQF setAlpha:0];
    [sSevenQF setAlpha:0];
    [sEightQF setAlpha:0];
    [sNineQF setAlpha:0];
    [gOneQF setAlpha:0];
    [gTwoQF setAlpha:0];
    [gThreeQF setAlpha:0];
    [BBSelectionQF setAlpha:0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    pSixQF.center = CGPointMake(ikSixQF, iktSixQF);
    pSevenQF.center = CGPointMake(ikSevenQF, iktSevenQF);
    pTenQF.center = CGPointMake(ikTenQF, iktTenQF);
    pElevenQF.center = CGPointMake(ikElevenQF, iktElevenQF);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationDuration:1.25];
    
    pOneQF.alpha = 1;
    pTwoQF.alpha = 1;
    pThreeQF.alpha = 1;
    pFourQF.alpha = 1;
    
    pFiveQF.alpha = 1;
    pEightQF.alpha = 1;
    
    pNineQF.alpha = 1;
    pTwelveQF.alpha = 1;
    
    pThirteenQF.alpha = 1;
    pFourteenQF.alpha = 1;
    pFithteenQF.alpha  = 1;
    pSixteenQF.alpha = 1;
    
    pOneQF.center = CGPointMake(ikOneQF, iktOneQF);
    pTwoQF.center = CGPointMake(ikTwoQF, iktTwoQF);
    pFiveQF.center = CGPointMake(ikFiveQF, iktFiveQF);
    
    pThreeQF.center = CGPointMake(ikThreeQF, iktThreeQF);
    pFourQF.center = CGPointMake(ikFourQF, iktFourQF);
    pEightQF.center = CGPointMake(ikEightQF, iktEightQF);
    
    pNineQF.center = CGPointMake(ikNineQF, iktNineQF);
    pThirteenQF.center = CGPointMake(ikThirteenQF, iktThirteenQF);
    pFourteenQF.center = CGPointMake(ikFourteenQF, iktFourteenQF);
    
    pTwelveQF.center = CGPointMake(ikTwelveQF, iktTwelveQF);
    pFithteenQF.center = CGPointMake(ikFithteenQF, iktFithteenQF);
    pSixteenQF.center = CGPointMake(ikSixteenQF, iktSixteenQF);
    
    [self Swipes];
    [UIView commitAnimations];

}

-(void)MovingTheObjects
{
    int a;
    a = 1;
    sOneQF.center = CGPointMake(sOneQF.center.x, sOneQF.center.y - a);
    sTwoQF.center = CGPointMake(sTwoQF.center.x , sTwoQF.center.y - a);
    sThreeQF.center = CGPointMake(sThreeQF.center.x , sThreeQF.center.y - a);
    sFourQF.center = CGPointMake(sFourQF.center.x , sFourQF.center.y - a);
    sFiveQF.center = CGPointMake(sFiveQF.center.x , sFiveQF.center.y - a);
    sSixQF.center = CGPointMake(sSixQF.center.x , sSixQF.center.y - a);
    sSevenQF.center = CGPointMake(sSevenQF.center.x , sSevenQF.center.y - a);
    sEightQF.center = CGPointMake(sEightQF.center.x , sEightQF.center.y - a);
    sNineQF.center = CGPointMake(sNineQF.center.x , sNineQF.center.y - a);
    
    if (-155 > sNineQF.center.y) {
        [moverQF invalidate];
        moverQF = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }
    
}

-(void)GameSettingUpForGrid
{
    [self GettingTheRightGrid];
}

-(void)GettingTheRightGrid
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    switch (WordFourQF) {
        case 1:
            cOneQF = 'z';
            cTwoQF = 'n';
            cThreeQF = 'i';
            cFourQF = 'o';
            cFiveQF = 'e';
            cSixQF = 'i';
            cSevenQF = 's';
            cEightQF = 'h';
            cNineQF = 't';
            cTenQF = 'y';
            cElevenQF = 'r';
            cTwelveQF = 's';
            cThirteenQF = 'l';
            cFourteenQF = 'a';
            cFithteenQF = 'k';
            cSixteenQF = 'u';
            
            pOneQF.image = [UIImage imageNamed:@"Z.png"];
            pTwoQF.image = [UIImage imageNamed:@"N.png"];
            pThreeQF.image = [UIImage imageNamed:@"I.png"];
            pFourQF.image = [UIImage imageNamed:@"O.png"];
            pFiveQF.image = [UIImage imageNamed:@"E.png"];
            pSixQF.image = [UIImage imageNamed:@"I.png"];
            pSevenQF.image = [UIImage imageNamed:@"S.png"];
            pEightQF.image = [UIImage imageNamed:@"H.png"];
            pNineQF.image = [UIImage imageNamed:@"T.png"];
            pTenQF.image = [UIImage imageNamed:@"Y.png"];
            pElevenQF.image = [UIImage imageNamed:@"R.png"];
            pTwelveQF.image = [UIImage imageNamed:@"S.png"];
            pThirteenQF.image = [UIImage imageNamed:@"L.png"];
            pFourteenQF.image = [UIImage imageNamed:@"A.png"];
            pFithteenQF.image = [UIImage imageNamed:@"K.png"];
            pSixteenQF.image = [UIImage imageNamed:@"U.png"];
            
            TheQuestionQF.text = [NSString stringWithFormat:@"GREEK GODS"];
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 8", ScoreQF];
            break;
        case 2:
            cOneQF = 'm';
            cTwoQF = 'e';
            cThreeQF = 'l';
            cFourQF = 't';
            cFiveQF = 'u';
            cSixQF = 'o';
            cSevenQF = 'l';
            cEightQF = 'o';
            cNineQF = 'h';
            cTenQF = 'd';
            cElevenQF = 's';
            cTwelveQF = 'b';
            cThirteenQF = 'a';
            cFourteenQF = 's';
            cFithteenQF = 'r';
            cSixteenQF = 'n';
            
            pOneQF.image = [UIImage imageNamed:@"M.png"];
            pTwoQF.image = [UIImage imageNamed:@"E.png"];
            pThreeQF.image = [UIImage imageNamed:@"L.png"];
            pFourQF.image = [UIImage imageNamed:@"T.png"];
            pFiveQF.image = [UIImage imageNamed:@"U.png"];
            pSixQF.image = [UIImage imageNamed:@"O.png"];
            pSevenQF.image = [UIImage imageNamed:@"L.png"];
            pEightQF.image = [UIImage imageNamed:@"O.png"];
            pNineQF.image = [UIImage imageNamed:@"H.png"];
            pTenQF.image = [UIImage imageNamed:@"D.png"];
            pElevenQF.image = [UIImage imageNamed:@"S.png"];
            pTwelveQF.image = [UIImage imageNamed:@"B.png"];
            pThirteenQF.image = [UIImage imageNamed:@"A.png"];
            pFourteenQF.image = [UIImage imageNamed:@"S.png"];
            pFithteenQF.image = [UIImage imageNamed:@"R.png"];
            pSixteenQF.image = [UIImage imageNamed:@"N.png"];
            
            TheQuestionQF.text = [NSString stringWithFormat:@"MUSICAL TERMS & INSTRUMENTS"];
            if (screenHeight >= 480) {
                TheQuestionQF.text = [NSString stringWithFormat:@"MUSIC RELATED"];
            }
            
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 11", ScoreQF];
            break;
        case 3:
            cOneQF = 'o';
            cTwoQF = 'r';
            cThreeQF = 'g';
            cFourQF = 'b';
            cFiveQF = 'n';
            cSixQF = 'a';
            cSevenQF = 'm';
            cEightQF = 's';
            cNineQF = 'l';
            cTenQF = 'e';
            cElevenQF = 'k';
            cTwelveQF = 'u';
            cThirteenQF = 'u';
            cFourteenQF = 'v';
            cFithteenQF = 'i';
            cSixteenQF = 'o';
            
            pOneQF.image = [UIImage imageNamed:@"O.png"];
            pTwoQF.image = [UIImage imageNamed:@"R.png"];
            pThreeQF.image = [UIImage imageNamed:@"G.png"];
            pFourQF.image = [UIImage imageNamed:@"B.png"];
            pFiveQF.image = [UIImage imageNamed:@"N.png"];
            pSixQF.image = [UIImage imageNamed:@"A.png"];
            pSevenQF.image = [UIImage imageNamed:@"M.png"];
            pEightQF.image = [UIImage imageNamed:@"S.png"];
            pNineQF.image = [UIImage imageNamed:@"L.png"];
            pTenQF.image = [UIImage imageNamed:@"E.png"];
            pElevenQF.image = [UIImage imageNamed:@"K.png"];
            pTwelveQF.image = [UIImage imageNamed:@"U.png"];
            pThirteenQF.image = [UIImage imageNamed:@"U.png"];
            pFourteenQF.image = [UIImage imageNamed:@"V.png"];
            pFithteenQF.image = [UIImage imageNamed:@"I.png"];
            pSixteenQF.image = [UIImage imageNamed:@"O.png"];
            
            TheQuestionQF.text = [NSString stringWithFormat:@"EUROPEAN CAPITAL CITIES"];
            if (screenHeight >= 480) {
                TheQuestionQF.text = [NSString stringWithFormat:@"European Capitals"];
            }
            
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 6", ScoreQF];
            break;
        case 4:
            cOneQF = 'i';
            cTwoQF = 'q';
            cThreeQF = 'm';
            cFourQF = 'c';
            cFiveQF = 'b';
            cSixQF = 'p';
            cSevenQF = 'l';
            cEightQF = 'r';
            cNineQF = 'a';
            cTenQF = 'o';
            cElevenQF = 'e';
            cTwelveQF = 'h';
            cThirteenQF = 'n';
            cFourteenQF = 's';
            cFithteenQF = 'u';
            cSixteenQF = 'd';
            
            pOneQF.image = [UIImage imageNamed:@"I.png"];
            pTwoQF.image = [UIImage imageNamed:@"Q.png"];
            pThreeQF.image = [UIImage imageNamed:@"M.png"];
            pFourQF.image = [UIImage imageNamed:@"C.png"];
            pFiveQF.image = [UIImage imageNamed:@"B.png"];
            pSixQF.image = [UIImage imageNamed:@"P.png"];
            pSevenQF.image = [UIImage imageNamed:@"L.png"];
            pEightQF.image = [UIImage imageNamed:@"R.png"];
            pNineQF.image = [UIImage imageNamed:@"A.png"];
            pTenQF.image = [UIImage imageNamed:@"O.png"];
            pElevenQF.image = [UIImage imageNamed:@"E.png"];
            pTwelveQF.image = [UIImage imageNamed:@"H.png"];
            pThirteenQF.image = [UIImage imageNamed:@"N.png"];
            pFourteenQF.image = [UIImage imageNamed:@"S.png"];
            pFithteenQF.image = [UIImage imageNamed:@"U.png"];
            pSixteenQF.image = [UIImage imageNamed:@"D.png"];
            
            TheQuestionQF.text = [NSString stringWithFormat:@"COUNTRIES OF THE WORLD"];
            if (screenHeight >= 480) {
                TheQuestionQF.text = [NSString stringWithFormat:@"COUNTRIES"];
            }
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 8", ScoreQF];
            break;
        case 5:
            cOneQF = 'p';
            cTwoQF = 's';
            cThreeQF = 'd';
            cFourQF = 'i';
            cFiveQF = 'n';
            cSixQF = 'g';
            cSevenQF = 'u';
            cEightQF = 'o';
            cNineQF = 'l';
            cTenQF = 'm';
            cElevenQF = 'f';
            cTwelveQF = 'b';
            cThirteenQF = 'c';
            cFourteenQF = 'y';
            cFithteenQF = 'j';
            cSixteenQF = 'o';
            
            pOneQF.image = [UIImage imageNamed:@"P.png"];
            pTwoQF.image = [UIImage imageNamed:@"S.png"];
            pThreeQF.image = [UIImage imageNamed:@"D.png"];
            pFourQF.image = [UIImage imageNamed:@"I.png"];
            pFiveQF.image = [UIImage imageNamed:@"N.png"];
            pSixQF.image = [UIImage imageNamed:@"G.png"];
            pSevenQF.image = [UIImage imageNamed:@"U.png"];
            pEightQF.image = [UIImage imageNamed:@"O.png"];
            pNineQF.image = [UIImage imageNamed:@"L.png"];
            pTenQF.image = [UIImage imageNamed:@"M.png"];
            pElevenQF.image = [UIImage imageNamed:@"F.png"];
            pTwelveQF.image = [UIImage imageNamed:@"B.png"];
            pThirteenQF.image = [UIImage imageNamed:@"C.png"];
            pFourteenQF.image = [UIImage imageNamed:@"Y.png"];
            pFithteenQF.image = [UIImage imageNamed:@"J.png"];
            pSixteenQF.image = [UIImage imageNamed:@"O.png"];
            TheQuestionQF.text = [NSString stringWithFormat:@"SPORTS & GAMES"];
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 10", ScoreQF];
            break;
        case 6:
            cOneQF = 'g';
            cTwoQF = 'i';
            cThreeQF = 'a';
            cFourQF = 't';
            cFiveQF = 'e';
            cSixQF = 'n';
            cSevenQF = 'r';
            cEightQF = 'o';
            cNineQF = 'l';
            cTenQF = 'n';
            cElevenQF = 'z';
            cTwelveQF = 'y';
            cThirteenQF = 'd';
            cFourteenQF = 'c';
            cFithteenQF = 'e';
            cSixteenQF = 'd';
            
            pOneQF.image = [UIImage imageNamed:@"G.png"];
            pTwoQF.image = [UIImage imageNamed:@"I.png"];
            pThreeQF.image = [UIImage imageNamed:@"A.png"];
            pFourQF.image = [UIImage imageNamed:@"T.png"];
            pFiveQF.image = [UIImage imageNamed:@"E.png"];
            pSixQF.image = [UIImage imageNamed:@"N.png"];
            pSevenQF.image = [UIImage imageNamed:@"R.png"];
            pEightQF.image = [UIImage imageNamed:@"O.png"];
            pNineQF.image = [UIImage imageNamed:@"L.png"];
            pTenQF.image = [UIImage imageNamed:@"N.png"];
            pElevenQF.image = [UIImage imageNamed:@"Z.png"];
            pTwelveQF.image = [UIImage imageNamed:@"Y.png"];
            pThirteenQF.image = [UIImage imageNamed:@"D.png"];
            pFourteenQF.image = [UIImage imageNamed:@"C.png"];
            pFithteenQF.image = [UIImage imageNamed:@"E.png"];
            pSixteenQF.image = [UIImage imageNamed:@"D.png"];
            TheQuestionQF.text = [NSString stringWithFormat:@"CHEMICAL ELEMENTS"];
            if (screenHeight >= 480) {
                TheQuestionQF.text = [NSString stringWithFormat:@"ELEMENTS"];
            }
            
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 5", ScoreQF];
            break;
        case 7:
            cOneQF = 'p';
            cTwoQF = 'l';
            cThreeQF = 'k';
            cFourQF = 't';
            cFiveQF = 'n';
            cSixQF = 'w';
            cSevenQF = 'i';
            cEightQF = 'e';
            cNineQF = 'a';
            cTenQF = 'm';
            cElevenQF = 'i';
            cTwelveQF = 'e';
            cThirteenQF = 'l';
            cFourteenQF = 'd';
            cFithteenQF = 'u';
            cSixteenQF = 'r';
            
            pOneQF.image = [UIImage imageNamed:@"P.png"];
            pTwoQF.image = [UIImage imageNamed:@"L.png"];
            pThreeQF.image = [UIImage imageNamed:@"K.png"];
            pFourQF.image = [UIImage imageNamed:@"T.png"];
            pFiveQF.image = [UIImage imageNamed:@"N.png"];
            pSixQF.image = [UIImage imageNamed:@"W.png"];
            pSevenQF.image = [UIImage imageNamed:@"I.png"];
            pEightQF.image = [UIImage imageNamed:@"E.png"];
            pNineQF.image = [UIImage imageNamed:@"A.png"];
            pTenQF.image = [UIImage imageNamed:@"M.png"];
            pElevenQF.image = [UIImage imageNamed:@"I.png"];
            pTwelveQF.image = [UIImage imageNamed:@"E.png"];
            pThirteenQF.image = [UIImage imageNamed:@"L.png"];
            pFourteenQF.image = [UIImage imageNamed:@"D.png"];
            pFithteenQF.image = [UIImage imageNamed:@"U.png"];
            pSixteenQF.image = [UIImage imageNamed:@"R.png"];
            TheQuestionQF.text = [NSString stringWithFormat:@"FRUIT"];
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 5", ScoreQF];
            break;
        case 8:
            cOneQF = 'l';
            cTwoQF = 'a';
            cThreeQF = 'e';
            cFourQF = 'f';
            cFiveQF = 'h';
            cSixQF = 'g';
            cSevenQF = 'm';
            cEightQF = 'i';
            cNineQF = 'o';
            cTenQF = 'b';
            cElevenQF = 't';
            cTwelveQF = 'y';
            cThirteenQF = 'x';
            cFourteenQF = 'w';
            cFithteenQF = 'r';
            cSixteenQF = 'n';
            
            pOneQF.image = [UIImage imageNamed:@"L.png"];
            pTwoQF.image = [UIImage imageNamed:@"A.png"];
            pThreeQF.image = [UIImage imageNamed:@"E.png"];
            pFourQF.image = [UIImage imageNamed:@"F.png"];
            pFiveQF.image = [UIImage imageNamed:@"H.png"];
            pSixQF.image = [UIImage imageNamed:@"G.png"];
            pSevenQF.image = [UIImage imageNamed:@"M.png"];
            pEightQF.image = [UIImage imageNamed:@"I.png"];
            pNineQF.image = [UIImage imageNamed:@"O.png"];
            pTenQF.image = [UIImage imageNamed:@"B.png"];
            pElevenQF.image = [UIImage imageNamed:@"T.png"];
            pTwelveQF.image = [UIImage imageNamed:@"Y.png"];
            pThirteenQF.image = [UIImage imageNamed:@"X.png"];
            pFourteenQF.image = [UIImage imageNamed:@"W.png"];
            pFithteenQF.image = [UIImage imageNamed:@"R.png"];
            pSixteenQF.image = [UIImage imageNamed:@"N.png"];
            TheQuestionQF.text = [NSString stringWithFormat:@"ANIMALS"];
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 21", ScoreQF];
            break;
        case 9:
            cOneQF = 'h';
            cTwoQF = 'n';
            cThreeQF = 'i';
            cFourQF = 'o';
            cFiveQF = 'r';
            cSixQF = 'l';
            cSevenQF = 'c';
            cEightQF = 'e';
            cNineQF = 'a';
            cTenQF = 'k';
            cElevenQF = 'e';
            cTwelveQF = 'm';
            cThirteenQF = 'p';
            cFourteenQF = 's';
            cFithteenQF = 'b';
            cSixteenQF = 'd';
            
            pOneQF.image = [UIImage imageNamed:@"H.png"];
            pTwoQF.image = [UIImage imageNamed:@"N.png"];
            pThreeQF.image = [UIImage imageNamed:@"I.png"];
            pFourQF.image = [UIImage imageNamed:@"O.png"];
            pFiveQF.image = [UIImage imageNamed:@"R.png"];
            pSixQF.image = [UIImage imageNamed:@"L.png"];
            pSevenQF.image = [UIImage imageNamed:@"C.png"];
            pEightQF.image = [UIImage imageNamed:@"E.png"];
            pNineQF.image = [UIImage imageNamed:@"A.png"];
            pTenQF.image = [UIImage imageNamed:@"K.png"];
            pElevenQF.image = [UIImage imageNamed:@"E.png"];
            pTwelveQF.image = [UIImage imageNamed:@"M.png"];
            pThirteenQF.image = [UIImage imageNamed:@"P.png"];
            pFourteenQF.image = [UIImage imageNamed:@"S.png"];
            pFithteenQF.image = [UIImage imageNamed:@"B.png"];
            pSixteenQF.image = [UIImage imageNamed:@"D.png"];
            TheQuestionQF.text = [NSString stringWithFormat:@"BODY PARTS"];
            TotalAmountQF.text = [NSString stringWithFormat:@"%i 0F 22", ScoreQF];
            break;
        default:
            break;
    }
    
    [self GetTheWord];
    
    iLeftQF = ikTwoQF - ikOneQF;
    iUpQF = iktOneQF - iktFiveQF;
}

-(void)Swipes
{
    PanningSensitivityQF = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneQF.userInteractionEnabled = YES;
    [pOneQF addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoQF.userInteractionEnabled = YES;
    [pTwoQF addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeQF.userInteractionEnabled = YES;
    [pThreeQF addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourQF.userInteractionEnabled = YES;
    [pFourQF addGestureRecognizer:panFour];
    
    UIPanGestureRecognizer *panFive = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FivePan:)];
    pFiveQF.userInteractionEnabled = YES;
    [pFiveQF addGestureRecognizer:panFive];
    
    UIPanGestureRecognizer *panSix = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixPan:)];
    pSixQF.userInteractionEnabled = YES;
    [pSixQF addGestureRecognizer:panSix];
    
    UIPanGestureRecognizer *panSeven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SevenPan:)];
    pSevenQF.userInteractionEnabled = YES;
    [pSevenQF addGestureRecognizer:panSeven];
    
    UIPanGestureRecognizer *panEight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(EightPan:)];
    pEightQF.userInteractionEnabled = YES;
    [pEightQF addGestureRecognizer:panEight];
    
    UIPanGestureRecognizer *panNine = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(NinePan:)];
    pNineQF.userInteractionEnabled = YES;
    [pNineQF addGestureRecognizer:panNine];
    
    UIPanGestureRecognizer *panTen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TenPan:)];
    pTenQF.userInteractionEnabled = YES;
    [pTenQF addGestureRecognizer:panTen];
    
    UIPanGestureRecognizer *panEleven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ElevenPan:)];
    pElevenQF.userInteractionEnabled = YES;
    [pElevenQF addGestureRecognizer:panEleven];
    
    UIPanGestureRecognizer *panTwelve = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwelvePan:)];
    pTwelveQF.userInteractionEnabled = YES;
    [pTwelveQF addGestureRecognizer:panTwelve];
    
    UIPanGestureRecognizer *panThirteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThirteenPan:)];
    pThirteenQF.userInteractionEnabled = YES;
    [pThirteenQF addGestureRecognizer:panThirteen];
    
    UIPanGestureRecognizer *panFourteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourteenPan:)];
    pFourteenQF.userInteractionEnabled = YES;
    [pFourteenQF addGestureRecognizer:panFourteen];
    
    UIPanGestureRecognizer *panFithteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FithteenPan:)];
    pFithteenQF.userInteractionEnabled = YES;
    [pFithteenQF addGestureRecognizer:panFithteen];
    
    UIPanGestureRecognizer *panSixteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixteenPan:)];
    pSixteenQF.userInteractionEnabled = YES;
    [pSixteenQF addGestureRecognizer:panSixteen];
    
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    UISwipeGestureRecognizer *gesture;
    
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 1;
    
    
    if ((gesture.direction == UISwipeGestureRecognizerDirectionDown || gesture.direction == UISwipeGestureRecognizerDirectionUp) && PreviousQF == 0) {
        [self Horizontal];
        PreviousQF = 2;
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)FivePan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 5;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 6;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)SevenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 7;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)EightPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 8;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
            PreviousQF = 2;
            [self Horizontal];
        }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)NinePan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 9;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)TenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 10;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)ElevenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 11;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)TwelvePan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 12;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThirteenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 13;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourteenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 14;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)FithteenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 15;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixteenPan: (UIPanGestureRecognizer *)sender
{
    distanceQF = [sender translationInView:self.view];
    PanningIntQF++;
    PPanningMethodQF = 16;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 1) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Verticle];
            PanningIntQF = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousQF == 2) {
        if (PanningIntQF == PanningSensitivityQF) {
            [self Horizontal];
            PanningIntQF = 0;
        }
    } else if (distanceQF.x > 0 || distanceQF.x < 0) {
        if ((distanceQF.y > 0 || distanceQF.y < 0) && ((distanceQF.x > 0 && distanceQF.x < 10) || (distanceQF.x < 0 && distanceQF.x > -10))) {
            PreviousQF = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousQF = 1;
        }
    } else if (distanceQF.y > 0 || distanceQF.y < 0) {
        PreviousQF = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntQF = 0;
        PreviousQF = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneQF = pOneQF.center.x;
    yOneQF = pOneQF.center.y;
    xTwoQF = pTwoQF.center.x;
    yTwoQF = pTwoQF.center.y;
    xThreeQF = pThreeQF.center.x;
    yThreeQF = pThreeQF.center.y;
    xFourQF = pFourQF.center.x;
    yFourQF = pFourQF.center.y;
    xFiveQF = pFiveQF.center.x;
    yFiveQF = pFiveQF.center.y;
    xSixQF = pSixQF.center.x;
    ySixQF = pSixQF.center.y;
    ySevenQF = pSevenQF.center.y;
    xSevenQF = pSevenQF.center.x;
    xEightQF = pEightQF.center.x;
    yEightQF = pEightQF.center.y;
    yNineQF = pNineQF.center.y;
    xNineQF = pNineQF.center.x;
    xTenQF = pTenQF.center.x;
    yTenQF = pTenQF.center.y;
    xElevenQF = pElevenQF.center.x;
    yElevenQF = pElevenQF.center.y;
    xTwelveQF = pTwelveQF.center.x;
    yTwelveQF = pTwelveQF.center.y;
    xThirteenQF = pThirteenQF.center.x;
    yThirteenQF = pThirteenQF.center.y;
    xFourteenQF = pFourteenQF.center.x;
    yFourteenQF = pFourteenQF.center.y;
    xFithteenQF = pFithteenQF.center.x;
    yFithteenQF = pFithteenQF.center.y;
    xSixteenQF = pSixteenQF.center.x;
    ySixteenQF = pSixteenQF.center.y;
    
    switch (PPanningMethodQF) {
        case 1:
            pointOfIntrestQF = pOneQF.center.x;
            break;
        case 2:
            pointOfIntrestQF = pTwoQF.center.x;
            break;
        case 3:
            pointOfIntrestQF = pThreeQF.center.x;
            break;
        case 4:
            pointOfIntrestQF = pFourQF.center.x;
            break;
        case 5:
            pointOfIntrestQF = pFiveQF.center.x;
            break;
        case 6:
            pointOfIntrestQF = pSixQF.center.x;
            break;
        case 7:
            pointOfIntrestQF = pSevenQF.center.x;
            break;
        case 8:
            pointOfIntrestQF = pEightQF.center.x;
            break;
        case 9:
            pointOfIntrestQF = pNineQF.center.x;
            break;
        case 10:
            pointOfIntrestQF = pTenQF.center.x;
            break;
        case 11:
            pointOfIntrestQF = pElevenQF.center.x;
            break;
        case 12:
            pointOfIntrestQF = pTwelveQF.center.x;
            break;
        case 13:
            pointOfIntrestQF = pThirteenQF.center.x;
            break;
        case 14:
            pointOfIntrestQF = pFourteenQF.center.x;
            break;
        case 15:
            pointOfIntrestQF = pFithteenQF.center.x;
            break;
        case 16:
            pointOfIntrestQF = pSixteenQF.center.x;
            break;
        default:
            break;
    }
    
    if (distanceQF.y < 0) {
        
        if (pointOfIntrestQF == pOneQF.center.x) {
            pOneQF.center = CGPointMake(pOneQF.center.x, pOneQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pTwoQF.center.x) {
            pTwoQF.center = CGPointMake(pTwoQF.center.x, pTwoQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pThreeQF.center.x) {
            pThreeQF.center = CGPointMake(pThreeQF.center.x , pThreeQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pFourQF.center.x) {
            pFourQF.center = CGPointMake(pFourQF.center.x, pFourQF.center.y - iLeftQF);
        }
        if (pFiveQF.center.x == pointOfIntrestQF) {
            pFiveQF.center = CGPointMake(pFiveQF.center.x, pFiveQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pSixQF.center.x) {
            pSixQF.center = CGPointMake(pSixQF.center.x , pSixQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pSevenQF.center.x) {
            pSevenQF.center = CGPointMake(pSevenQF.center.x , pSevenQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pEightQF.center.x) {
            pEightQF.center = CGPointMake(pEightQF.center.x , pEightQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pNineQF.center.x) {
            pNineQF.center = CGPointMake(pNineQF.center.x, pNineQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pTenQF.center.x) {
            pTenQF.center = CGPointMake(pTenQF.center.x, pTenQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pElevenQF.center.x) {
            pElevenQF.center = CGPointMake(pElevenQF.center.x, pElevenQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pTwelveQF.center.x) {
            pTwelveQF.center = CGPointMake(pTwelveQF.center.x, pTwelveQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pThirteenQF.center.x) {
            pThirteenQF.center = CGPointMake(pThirteenQF.center.x , pThirteenQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pFourteenQF.center.x) {
            pFourteenQF.center = CGPointMake(pFourteenQF.center.x, pFourteenQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pFithteenQF.center.x) {
            pFithteenQF.center = CGPointMake(pFithteenQF.center.x, pFithteenQF.center.y - iLeftQF);
        }
        if (pointOfIntrestQF == pSixteenQF.center.x) {
            pSixteenQF.center = CGPointMake(pSixteenQF.center.x, pSixteenQF.center.y - iLeftQF);
        }
    } else if (distanceQF.y > 0) {
        
        if (pointOfIntrestQF == pOneQF.center.x) {
            pOneQF.center = CGPointMake(pOneQF.center.x, pOneQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pTwoQF.center.x) {
            pTwoQF.center = CGPointMake(pTwoQF.center.x, pTwoQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pThreeQF.center.x) {
            pThreeQF.center = CGPointMake(pThreeQF.center.x , pThreeQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pFourQF.center.x) {
            pFourQF.center = CGPointMake(pFourQF.center.x, pFourQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pFiveQF.center.x) {
            pFiveQF.center = CGPointMake(pFiveQF.center.x, pFiveQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pSixQF.center.x) {
            pSixQF.center = CGPointMake(pSixQF.center.x , pSixQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pSevenQF.center.x) {
            pSevenQF.center = CGPointMake(pSevenQF.center.x , pSevenQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pEightQF.center.x) {
            pEightQF.center = CGPointMake(pEightQF.center.x , pEightQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pNineQF.center.x) {
            pNineQF.center = CGPointMake(pNineQF.center.x, pNineQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pTenQF.center.x) {
            pTenQF.center = CGPointMake(pTenQF.center.x, pTenQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pElevenQF.center.x) {
            pElevenQF.center = CGPointMake(pElevenQF.center.x, pElevenQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pTwelveQF.center.x) {
            pTwelveQF.center = CGPointMake(pTwelveQF.center.x, pTwelveQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pThirteenQF.center.x) {
            pThirteenQF.center = CGPointMake(pThirteenQF.center.x , pThirteenQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pFourteenQF.center.x) {
            pFourteenQF.center = CGPointMake(pFourteenQF.center.x, pFourteenQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pFithteenQF.center.x) {
            pFithteenQF.center = CGPointMake(pFithteenQF.center.x, pFithteenQF.center.y+ iLeftQF);
        }
        if (pointOfIntrestQF == pSixteenQF.center.x) {
            pSixteenQF.center = CGPointMake(pSixteenQF.center.x, pSixteenQF.center.y+ iLeftQF);
        }
    }
    
    if (pOneQF.center.x != pointOfIntrestQF) {
        pOneQF.alpha = 1;
        pOneQF.hidden = NO;
        pOneQF.center = CGPointMake(xOneQF, yOneQF);
    }
    if (pTwoQF.center.x != pointOfIntrestQF) {
        pTwoQF.alpha = 1;
        pTwoQF.hidden = NO;
        pTwoQF.center = CGPointMake(xTwoQF, yTwoQF);
    }
    if (pThreeQF.center.x != pointOfIntrestQF) {
        pThreeQF.alpha = 1;
        pThreeQF.hidden = NO;
        pThreeQF.center = CGPointMake(xThreeQF, yThreeQF);
    }
    if (pFourQF.center.x != pointOfIntrestQF) {
        pFourQF.alpha = 1;
        pFourQF.hidden = NO;
        pFourQF.center = CGPointMake(xFourQF, yFourQF);
    }
    if (pFiveQF.center.x != pointOfIntrestQF) {
        pFiveQF.alpha = 1;
        pFiveQF.hidden = NO;
        pFiveQF.center = CGPointMake(xFiveQF, yFiveQF);
    }
    if (pSixQF.center.x != pointOfIntrestQF) {
        pSixQF.alpha = 1;
        pSixQF.hidden = NO;
        pSixQF.center = CGPointMake(xSixQF, ySixQF);
    }
    if (pSevenQF.center.x != pointOfIntrestQF) {
        pSevenQF.alpha = 1;
        pSevenQF.hidden = NO;
        pSevenQF.center = CGPointMake(xSevenQF, ySevenQF);
    }
    if (pEightQF.center.x != pointOfIntrestQF) {
        pEightQF.alpha = 1;
        pEightQF.hidden = NO;
        pEightQF.center = CGPointMake(xEightQF, yEightQF);
    }
    if (pNineQF.center.x != pointOfIntrestQF) {
        pNineQF.alpha = 1;
        pNineQF.hidden = NO;
        pNineQF.center = CGPointMake(xNineQF, yNineQF);
    }
    if (pTenQF.center.x != pointOfIntrestQF) {
        pTenQF.alpha = 1;
        pTenQF.hidden = NO;
        pTenQF.center = CGPointMake(xTenQF, yTenQF);
    }
    if (pElevenQF.center.x != pointOfIntrestQF) {
        pElevenQF.alpha = 1;
        pElevenQF.hidden = NO;
        pElevenQF.center = CGPointMake(xElevenQF, yElevenQF);
    }
    if (pTwelveQF.center.x != pointOfIntrestQF) {
        pTwelveQF.alpha = 1;
        pTwelveQF.hidden = NO;
        pTwelveQF.center = CGPointMake(xTwelveQF, yTwelveQF);
    }
    if (pThirteenQF.center.x != pointOfIntrestQF) {
        pThirteenQF.alpha = 1;
        pThirteenQF.hidden = NO;
        pThirteenQF.center = CGPointMake(xThirteenQF, yThirteenQF);
    }
    if (pFourteenQF.center.x != pointOfIntrestQF) {
        pFourteenQF.alpha = 1;
        pFourteenQF.hidden = NO;
        pFourteenQF.center = CGPointMake(xFourteenQF, yFourteenQF);
    }
    if (pFithteenQF.center.x != pointOfIntrestQF) {
        pFithteenQF.alpha = 1;
        pFithteenQF.hidden = NO;
        pFithteenQF.center = CGPointMake(xFithteenQF, yFithteenQF);
    }
    if (pSixteenQF.center.x != pointOfIntrestQF) {
        pSixteenQF.alpha = 1;
        pSixteenQF.hidden = NO;
        pSixteenQF.center = CGPointMake(xSixteenQF, ySixteenQF);
    }
    
    if (pOneQF.center.y > iktSixteenQF) {
        pOneQF.center = CGPointMake(pOneQF.center.x, iktOneQF);
    }
    if (pTwoQF.center.y > iktSixteenQF) {
        pTwoQF.center = CGPointMake(pTwoQF.center.x, iktOneQF);
    }
    if (pThreeQF.center.y > iktSixteenQF) {
        pThreeQF.center = CGPointMake(pThreeQF.center.x, iktOneQF);
    }
    if (pFourQF.center.y > iktSixteenQF) {
        pFourQF.center = CGPointMake(pFourQF.center.x,iktOneQF );
    }
    if (pFiveQF.center.y > iktSixteenQF) {
        pFiveQF.center = CGPointMake(pFiveQF.center.x, iktOneQF);
    }
    if (pSixQF.center.y > iktSixteenQF) {
        pSixQF.center = CGPointMake(pSixQF.center.x, iktOneQF);
    }
    if (pSevenQF.center.y > iktSixteenQF) {
        pSevenQF.center = CGPointMake(pSevenQF.center.x, iktOneQF);
    }
    if (pEightQF.center.y > iktSixteenQF) {
        pEightQF.center = CGPointMake(pEightQF.center.x, iktOneQF);
    }
    if (pNineQF.center.y > iktSixteenQF) {
        pNineQF.center = CGPointMake(pNineQF.center.x, iktOneQF);
    }
    if (pTenQF.center.y > iktSixteenQF) {
        pTenQF.center = CGPointMake(pTenQF.center.x, iktOneQF);
    }
    if (pElevenQF.center.y > iktSixteenQF) {
        pElevenQF.center = CGPointMake(pElevenQF.center.x, iktOneQF);
    }
    if (pTwelveQF.center.y > iktSixteenQF) {
        pTwelveQF.center = CGPointMake(pTwelveQF.center.x, iktOneQF);
    }
    if (pThirteenQF.center.y > iktSixteenQF) {
        pThirteenQF.center = CGPointMake(pThirteenQF.center.x, iktOneQF);
    }
    if (pFourteenQF.center.y > iktSixteenQF) {
        pFourteenQF.center = CGPointMake(pFourteenQF.center.x, iktOneQF);
    }
    if (pFithteenQF.center.y > iktSixteenQF) {
        pFithteenQF.center = CGPointMake(pFithteenQF.center.x, iktOneQF);
    }
    if (pSixteenQF.center.y > iktSixteenQF) {
        pSixteenQF.center = CGPointMake(pSixteenQF.center.x, iktOneQF);
    }
    
    if (pOneQF.center.y < iktOneQF) {
        pOneQF.center = CGPointMake(pOneQF.center.x, iktSixteenQF);
    }
    if (pTwoQF.center.y < iktOneQF) {
        pTwoQF.center = CGPointMake(pTwoQF.center.x, iktSixteenQF);
    }
    if (pThreeQF.center.y < iktOneQF) {
        pThreeQF.center = CGPointMake(pThreeQF.center.x, iktSixteenQF);
    }
    if (pFourQF.center.y < iktOneQF) {
        pFourQF.center = CGPointMake(pFourQF.center.x, iktSixteenQF);
    }
    if (pFiveQF.center.y < iktOneQF) {
        pFiveQF.center = CGPointMake(pFiveQF.center.x, iktSixteenQF);
    }
    if (pSixQF.center.y < iktOneQF) {
        pSixQF.center = CGPointMake(pSixQF.center.x, iktSixteenQF);
    }
    if (pSevenQF.center.y < iktOneQF) {
        pSevenQF.center = CGPointMake(pSevenQF.center.x, iktSixteenQF);
    }
    if (pEightQF.center.y < iktOneQF) {
        pEightQF.center = CGPointMake(pEightQF.center.x, iktSixteenQF);
    }
    if (pNineQF.center.y < iktOneQF) {
        pNineQF.center = CGPointMake(pNineQF.center.x, iktSixteenQF);
    }
    if (pTenQF.center.y < iktOneQF) {
        pTenQF.center = CGPointMake(pTenQF.center.x, iktSixteenQF);
    }
    if (pElevenQF.center.y < iktOneQF) {
        pElevenQF.center = CGPointMake(pElevenQF.center.x, iktSixteenQF);
    }
    if (pTwelveQF.center.y < iktOneQF) {
        pTwelveQF.center = CGPointMake(pTwelveQF.center.x, iktSixteenQF);
    }
    if (pThirteenQF.center.y < iktOneQF) {
        pThirteenQF.center = CGPointMake(pThirteenQF.center.x, iktSixteenQF);
    }
    if (pFourteenQF.center.y < iktOneQF) {
        pFourteenQF.center = CGPointMake(pFourteenQF.center.x, iktSixteenQF);
    }
    if (pFithteenQF.center.y < iktOneQF) {
        pFithteenQF.center = CGPointMake(pFithteenQF.center.x, iktSixteenQF);
    }
    if (pSixteenQF.center.y < iktOneQF) {
        pSixteenQF.center = CGPointMake(pSixteenQF.center.x, iktSixteenQF);
    }
}

-(void)Verticle
{
    xOneQF = pOneQF.center.x;
    yOneQF = pOneQF.center.y;
    xTwoQF = pTwoQF.center.x;
    yTwoQF = pTwoQF.center.y;
    xThreeQF = pThreeQF.center.x;
    yThreeQF = pThreeQF.center.y;
    xFourQF = pFourQF.center.x;
    yFourQF = pFourQF.center.y;
    xFiveQF = pFiveQF.center.x;
    yFiveQF = pFiveQF.center.y;
    xSixQF = pSixQF.center.x;
    ySixQF = pSixQF.center.y;
    ySevenQF = pSevenQF.center.y;
    xSevenQF = pSevenQF.center.x;
    xEightQF = pEightQF.center.x;
    yEightQF = pEightQF.center.y;
    yNineQF = pNineQF.center.y;
    xNineQF = pNineQF.center.x;
    xTenQF = pTenQF.center.x;
    yTenQF = pTenQF.center.y;
    xElevenQF = pElevenQF.center.x;
    yElevenQF = pElevenQF.center.y;
    xTwelveQF = pTwelveQF.center.x;
    yTwelveQF = pTwelveQF.center.y;
    xThirteenQF = pThirteenQF.center.x;
    yThirteenQF = pThirteenQF.center.y;
    xFourteenQF = pFourteenQF.center.x;
    yFourteenQF = pFourteenQF.center.y;
    xFithteenQF = pFithteenQF.center.x;
    yFithteenQF = pFithteenQF.center.y;
    xSixteenQF = pSixteenQF.center.x;
    ySixteenQF = pSixteenQF.center.y;
    
    switch (PPanningMethodQF) {
        case 1:
            pointOfIntrestQF = pOneQF.center.y;
            break;
        case 2:
            pointOfIntrestQF = pTwoQF.center.y;
            break;
        case 3:
            pointOfIntrestQF = pThreeQF.center.y;
            break;
        case 4:
            pointOfIntrestQF = pFourQF.center.y;
            break;
        case 5:
            pointOfIntrestQF = pFiveQF.center.y;
            break;
        case 6:
            pointOfIntrestQF = pSixQF.center.y;
            break;
        case 7:
            pointOfIntrestQF = pSevenQF.center.y;
            break;
        case 8:
            pointOfIntrestQF = pEightQF.center.y;
            break;
        case 9:
            pointOfIntrestQF = pNineQF.center.y;
            break;
        case 10:
            pointOfIntrestQF = pTenQF.center.y;
            break;
        case 11:
            pointOfIntrestQF = pElevenQF.center.y;
            break;
        case 12:
            pointOfIntrestQF = pTwelveQF.center.y;
            break;
        case 13:
            pointOfIntrestQF = pThirteenQF.center.y;
            break;
        case 14:
            pointOfIntrestQF = pFourteenQF.center.y;
            break;
        case 15:
            pointOfIntrestQF = pFithteenQF.center.y;
            break;
        case 16:
            pointOfIntrestQF = pSixteenQF.center.y;
            break;
        default:
            break;
    }
    
    if (distanceQF.x > 0) {
        
        if (pointOfIntrestQF == pOneQF.center.y) {
            pOneQF.center = CGPointMake(pOneQF.center.x + iLeftQF, pOneQF.center.y);
        }
        if (pointOfIntrestQF == pTwoQF.center.y) {
            pTwoQF.center = CGPointMake(pTwoQF.center.x + iLeftQF, pTwoQF.center.y);
        }
        if (pointOfIntrestQF == pThreeQF.center.y) {
            pThreeQF.center = CGPointMake(pThreeQF.center.x + iLeftQF, pThreeQF.center.y);
        }
        if (pointOfIntrestQF == pFourQF.center.y) {
            pFourQF.center = CGPointMake(pFourQF.center.x + iLeftQF, pFourQF.center.y);
        }
        if (pointOfIntrestQF == pFiveQF.center.y) {
            pFiveQF.center = CGPointMake(pFiveQF.center.x + iLeftQF, pFiveQF.center.y);
        }
        if (pointOfIntrestQF == pSixQF.center.y) {
            pSixQF.center = CGPointMake(pSixQF.center.x + iLeftQF, pSixQF.center.y);
        }
        if (pointOfIntrestQF == pSevenQF.center.y) {
            pSevenQF.center = CGPointMake(pSevenQF.center.x + iLeftQF, pSevenQF.center.y);
        }
        if (pointOfIntrestQF == pEightQF.center.y) {
            pEightQF.center = CGPointMake(pEightQF.center.x + iLeftQF, pEightQF.center.y);
        }
        if (pointOfIntrestQF == pNineQF.center.y) {
            pNineQF.center = CGPointMake(pNineQF.center.x + iLeftQF, pNineQF.center.y);
        }
        if (pointOfIntrestQF == pTenQF.center.y) {
            pTenQF.center = CGPointMake(pTenQF.center.x + iLeftQF, pTenQF.center.y);
        }
        if (pointOfIntrestQF == pElevenQF.center.y) {
            pElevenQF.center = CGPointMake(pElevenQF.center.x + iLeftQF, pElevenQF.center.y);
        }
        if (pointOfIntrestQF == pTwelveQF.center.y) {
            pTwelveQF.center = CGPointMake(pTwelveQF.center.x + iLeftQF, pTwelveQF.center.y);
        }
        if (pointOfIntrestQF == pThirteenQF.center.y) {
            pThirteenQF.center = CGPointMake(pThirteenQF.center.x + iLeftQF, pThirteenQF.center.y);
        }
        if (pointOfIntrestQF == pFourteenQF.center.y) {
            pFourteenQF.center = CGPointMake(pFourteenQF.center.x + iLeftQF, pFourteenQF.center.y);
        }
        if (pointOfIntrestQF == pFithteenQF.center.y) {
            pFithteenQF.center = CGPointMake(pFithteenQF.center.x + iLeftQF, pFithteenQF.center.y);
        }
        if (pointOfIntrestQF == pSixteenQF.center.y) {
            pSixteenQF.center = CGPointMake(pSixteenQF.center.x + iLeftQF, pSixteenQF.center.y);
        }
        
    } else if (distanceQF.x < 0) {
        
        if (pointOfIntrestQF == pOneQF.center.y) {
            pOneQF.center = CGPointMake(pOneQF.center.x - iLeftQF, pOneQF.center.y);
        }
        if (pointOfIntrestQF == pTwoQF.center.y) {
            pTwoQF.center = CGPointMake(pTwoQF.center.x - iLeftQF, pTwoQF.center.y);
        }
        if (pointOfIntrestQF == pThreeQF.center.y) {
            pThreeQF.center = CGPointMake(pThreeQF.center.x - iLeftQF, pThreeQF.center.y);
        }
        if (pointOfIntrestQF == pFourQF.center.y) {
            pFourQF.center = CGPointMake(pFourQF.center.x - iLeftQF, pFourQF.center.y);
        }
        if (pointOfIntrestQF == pFiveQF.center.y) {
            pFiveQF.center = CGPointMake(pFiveQF.center.x - iLeftQF, pFiveQF.center.y);
        }
        if (pointOfIntrestQF == pSixQF.center.y) {
            pSixQF.center = CGPointMake(pSixQF.center.x - iLeftQF, pSixQF.center.y);
        }
        if (pointOfIntrestQF == pSevenQF.center.y) {
            pSevenQF.center = CGPointMake(pSevenQF.center.x - iLeftQF, pSevenQF.center.y);
        }
        if (pointOfIntrestQF == pEightQF.center.y) {
            pEightQF.center = CGPointMake(pEightQF.center.x - iLeftQF, pEightQF.center.y);
        }
        if (pointOfIntrestQF == pNineQF.center.y) {
            pNineQF.center = CGPointMake(pNineQF.center.x - iLeftQF, pNineQF.center.y);
        }
        if (pointOfIntrestQF == pTenQF.center.y) {
            pTenQF.center = CGPointMake(pTenQF.center.x - iLeftQF, pTenQF.center.y);
        }
        if (pointOfIntrestQF == pElevenQF.center.y) {
            pElevenQF.center = CGPointMake(pElevenQF.center.x - iLeftQF, pElevenQF.center.y);
        }
        if (pointOfIntrestQF == pTwelveQF.center.y) {
            pTwelveQF.center = CGPointMake(pTwelveQF.center.x - iLeftQF, pTwelveQF.center.y);
        }
        if (pointOfIntrestQF == pThirteenQF.center.y) {
            pThirteenQF.center = CGPointMake(pThirteenQF.center.x - iLeftQF, pThirteenQF.center.y);
        }
        if (pointOfIntrestQF == pFourteenQF.center.y) {
            pFourteenQF.center = CGPointMake(pFourteenQF.center.x - iLeftQF, pFourteenQF.center.y);
        }
        if (pointOfIntrestQF == pFithteenQF.center.y) {
            pFithteenQF.center = CGPointMake(pFithteenQF.center.x - iLeftQF, pFithteenQF.center.y);
        }
        if (pointOfIntrestQF == pSixteenQF.center.y) {
            pSixteenQF.center = CGPointMake(pSixteenQF.center.x - iLeftQF, pSixteenQF.center.y);
        }
    }
    
    if (pOneQF.center.y != pointOfIntrestQF) {
        pOneQF.alpha = 1;
        pOneQF.hidden = NO;
        pOneQF.center = CGPointMake(xOneQF, yOneQF);
    }
    if (pTwoQF.center.y != pointOfIntrestQF) {
        pTwoQF.alpha = 1;
        pTwoQF.hidden = NO;
        pTwoQF.center = CGPointMake(xTwoQF, yTwoQF);
    }
    if (pThreeQF.center.y != pointOfIntrestQF) {
        pThreeQF.alpha = 1;
        pThreeQF.hidden = NO;
        pThreeQF.center = CGPointMake(xThreeQF, yThreeQF);
    }
    if (pFourQF.center.y != pointOfIntrestQF) {
        pFourQF.alpha = 1;
        pFourQF.hidden = NO;
        pFourQF.center = CGPointMake(xFourQF, yFourQF);
    }
    if (pFiveQF.center.y != pointOfIntrestQF) {
        pFiveQF.alpha = 1;
        pFiveQF.hidden = NO;
        pFiveQF.center = CGPointMake(xFiveQF, yFiveQF);
    }
    if (pSixQF.center.y != pointOfIntrestQF) {
        pSixQF.alpha = 1;
        pSixQF.hidden = NO;
        pSixQF.center = CGPointMake(xSixQF, ySixQF);
    }
    if (pSevenQF.center.y != pointOfIntrestQF) {
        pSevenQF.alpha = 1;
        pSevenQF.hidden = NO;
        pSevenQF.center = CGPointMake(xSevenQF, ySevenQF);
    }
    if (pEightQF.center.y != pointOfIntrestQF) {
        pEightQF.alpha = 1;
        pEightQF.hidden = NO;
        pEightQF.center = CGPointMake(xEightQF, yEightQF);
    }
    if (pNineQF.center.y != pointOfIntrestQF) {
        pNineQF.alpha = 1;
        pNineQF.hidden = NO;
        pNineQF.center = CGPointMake(xNineQF, yNineQF);
    }
    if (pTenQF.center.y != pointOfIntrestQF) {
        pTenQF.alpha = 1;
        pTenQF.hidden = NO;
        pTenQF.center = CGPointMake(xTenQF, yTenQF);
    }
    if (pElevenQF.center.y != pointOfIntrestQF) {
        pElevenQF.alpha = 1;
        pElevenQF.hidden = NO;
        pElevenQF.center = CGPointMake(xElevenQF, yElevenQF);
    }
    if (pTwelveQF.center.y != pointOfIntrestQF) {
        pTwelveQF.alpha = 1;
        pTwelveQF.hidden = NO;
        pTwelveQF.center = CGPointMake(xTwelveQF, yTwelveQF);
    }
    if (pThirteenQF.center.y != pointOfIntrestQF) {
        pThirteenQF.alpha = 1;
        pThirteenQF.hidden = NO;
        pThirteenQF.center = CGPointMake(xThirteenQF, yThirteenQF);
    }
    if (pFourteenQF.center.y != pointOfIntrestQF) {
        pFourteenQF.alpha = 1;
        pFourteenQF.hidden = NO;
        pFourteenQF.center = CGPointMake(xFourteenQF, yFourteenQF);
    }
    if (pFithteenQF.center.y != pointOfIntrestQF) {
        pFithteenQF.alpha = 1;
        pFithteenQF.hidden = NO;
        pFithteenQF.center = CGPointMake(xFithteenQF, yFithteenQF);
    }
    if (pSixteenQF.center.y != pointOfIntrestQF) {
        pSixteenQF.alpha = 1;
        pSixteenQF.hidden = NO;
        pSixteenQF.center = CGPointMake(xSixteenQF, ySixteenQF);
    }
    
    if (pOneQF.center.x < ikOneQF) {
        pOneQF.center = CGPointMake(ikFourQF, pOneQF.center.y);
    }
    if (pTwoQF.center.x < ikOneQF) {
        pTwoQF.center = CGPointMake(ikFourQF, pTwoQF.center.y);
    }
    if (pThreeQF.center.x < ikOneQF) {
        pThreeQF.center = CGPointMake(ikFourQF, pThreeQF.center.y);
    }
    if (pFourQF.center.x < ikOneQF) {
        pFourQF.center = CGPointMake(ikFourQF, pFourQF.center.y);
    }
    if (pFiveQF.center.x < ikOneQF) {
        pFiveQF.center = CGPointMake(ikFourQF, pFiveQF.center.y);
    }
    if (pSixQF.center.x < ikOneQF) {
        pSixQF.center = CGPointMake(ikFourQF, pSixQF.center.y);
    }
    if (pSevenQF.center.x < ikOneQF) {
        pSevenQF.center = CGPointMake(ikFourQF, pSevenQF.center.y);
    }
    if (pEightQF.center.x < ikOneQF) {
        pEightQF.center = CGPointMake(ikFourQF, pEightQF.center.y);
    }
    if (pNineQF.center.x < ikOneQF) {
        pNineQF.center = CGPointMake(ikFourQF, pNineQF.center.y);
    }
    if (pTenQF.center.x < ikOneQF) {
        pTenQF.center = CGPointMake(ikFourQF, pTenQF.center.y);
    }
    if (pElevenQF.center.x < ikOneQF) {
        pElevenQF.center = CGPointMake(ikFourQF, pElevenQF.center.y);
    }
    if (pTwelveQF.center.x < ikOneQF) {
        pTwelveQF.center = CGPointMake(ikFourQF, pTwelveQF.center.y);
    }
    if (pThirteenQF.center.x < ikOneQF) {
        pThirteenQF.center = CGPointMake(ikFourQF, pThirteenQF.center.y);
    }
    if (pFourteenQF.center.x < ikOneQF) {
        pFourteenQF.center = CGPointMake(ikFourQF, pFourteenQF.center.y);
    }
    if (pFithteenQF.center.x < ikOneQF) {
        pFithteenQF.center = CGPointMake(ikFourQF, pFithteenQF.center.y);
    }
    if (pSixteenQF.center.x < ikOneQF) {
        pSixteenQF.center = CGPointMake(ikFourQF, pSixteenQF.center.y);
    }
    
    if (pOneQF.center.x > ikFourQF) {
        pOneQF.center = CGPointMake(ikOneQF, pOneQF.center.y);
    }
    if (pTwoQF.center.x > ikFourQF) {
        pTwoQF.center = CGPointMake(ikOneQF, pTwoQF.center.y);
    }
    if (pThreeQF.center.x > ikFourQF) {
        pThreeQF.center = CGPointMake(ikOneQF, pThreeQF.center.y);
    }
    if (pFourQF.center.x > ikFourQF) {
        pFourQF.center = CGPointMake(ikOneQF, pFourQF.center.y);
    }
    if (pFiveQF.center.x > ikFourQF) {
        pFiveQF.center = CGPointMake(ikOneQF, pFiveQF.center.y);
    }
    if (pSixQF.center.x > ikFourQF) {
        pSixQF.center = CGPointMake(ikOneQF, pSixQF.center.y);
    }
    if (pSevenQF.center.x > ikFourQF) {
        pSevenQF.center = CGPointMake(ikOneQF, pSevenQF.center.y);
    }
    if (pEightQF.center.x > ikFourQF) {
        pEightQF.center = CGPointMake(ikOneQF, pEightQF.center.y);
    }
    if (pNineQF.center.x > ikFourQF) {
        pNineQF.center = CGPointMake(ikOneQF, pNineQF.center.y);
    }
    if (pTenQF.center.x > ikFourQF) {
        pTenQF.center = CGPointMake(ikOneQF, pTenQF.center.y);
    }
    if (pElevenQF.center.x > ikFourQF) {
        pElevenQF.center = CGPointMake(ikOneQF, pElevenQF.center.y);
    }
    if (pTwelveQF.center.x > ikFourQF) {
        pTwelveQF.center = CGPointMake(ikOneQF, pTwelveQF.center.y);
    }
    if (pThirteenQF.center.x > ikFourQF) {
        pThirteenQF.center = CGPointMake(ikOneQF, pThirteenQF.center.y);
    }
    if (pFourteenQF.center.x > ikFourQF) {
        pFourteenQF.center = CGPointMake(ikOneQF, pFourteenQF.center.y);
    }
    if (pFithteenQF.center.x > ikFourQF) {
        pFithteenQF.center = CGPointMake(ikOneQF, pFithteenQF.center.y);
    }
    if (pSixteenQF.center.x > ikFourQF) {
        pSixteenQF.center = CGPointMake(ikOneQF, pSixteenQF.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SwipeSoundQF play];
    [self GetTheWord];
}

-(IBAction)IsItAWaord
{
    
    NSString *path;
    int TheAmount = 0;
    switch (WordFourQF) {
        case 1:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsOne" ofType:@"plist"];
            TheAmount = 8;
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsTwo" ofType:@"plist"];
            TheAmount = 11;
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsThree" ofType:@"plist"];
            TheAmount = 6;
            break;
        case 4:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsFour" ofType:@"plist"];
            TheAmount = 8;
            break;
        case 5:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsFive" ofType:@"plist"];
            TheAmount = 10;
            break;
        case 6:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsSix" ofType:@"plist"];
            TheAmount = 5;
            break;
        case 7:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsSeven" ofType:@"plist"];
            TheAmount = 5;
            break;
        case 8:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsEight" ofType:@"plist"];
            TheAmount = 21;
            break;
        case 9:
            path = [[NSBundle mainBundle] pathForResource:@"4QuestionsNine" ofType:@"plist"];
            TheAmount = 22;
            break;
        default:
            break;
    }
    
    int i = 0;
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2) {
        @autoreleasepool {
        i++;
        
        if ([str isEqual:WordQF] && WordIsAlreadyDoneQF[i] == NO) {
            WordIsAlreadyDoneQF[i] = YES;
            ScoreQF = ScoreQF + 1;
            TotalAmountQF.text = [NSString stringWithFormat:@"%i OF  %i", ScoreQF, TheAmount];
            SaveWordsQF = [NSString stringWithFormat:@"%@ %@", SaveWordsQF, str];
            }
        }
    }
    
    if (WordFourQF == 1) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour1"];
    } else if (WordFourQF == 2) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour2"];
    } else if (WordFourQF == 3) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour3"];
    } else if (WordFourQF == 4) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour4"];
    } else if (WordFourQF == 5) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour5"];
    } else if (WordFourQF == 6) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour6"];
    } else if (WordFourQF == 7) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour7"];
    } else if (WordFourQF == 8) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour8"];
    } else if (WordFourQF == 9) {
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour9"];
    }
    
    if (TheAmount == ScoreQF) {
        [self PlayAnimation];
    }
    
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    if (WordFourQF == 1) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour1"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour1"];
    } else if (WordFourQF == 2) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour2"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour2"];
    } else if (WordFourQF == 3) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour3"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour3"];
    } else if (WordFourQF == 4) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour4"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour4"];
    } else if (WordFourQF == 5) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour5"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour5"];
    } else if (WordFourQF == 6) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour6"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour6"];
    } else if (WordFourQF == 7) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour7"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour7"];
    } else if (WordFourQF == 8) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour8"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour8"];
    } else if (WordFourQF == 9) {
        SaveWordsQF = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheGridsForQuestionsFour9"];
        SaveWordsQF = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SaveWordsQF forKey:@"SavedTheGridsForQuestionsFour9"];
    }
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        TileOneFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneQF.center.x - 75, pOneQF.center.y - 75, pOneQF.bounds.size.width, pOneQF.bounds.size.height)];
        TileTwoFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoQF.center.x-75, pTwoQF.center.y-75, pTwoQF.bounds.size.width, pTwoQF.bounds.size.height)];
        TileThreeFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeQF.center.x-75, pThreeQF.center.y-75, pThreeQF.bounds.size.width, pThreeQF.bounds.size.height)];
        TileFourFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourQF.center.x-75, pFourQF.center.y-75, pFourQF.bounds.size.width, pFourQF.bounds.size.height)];
        TileFiveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveQF.center.x-75, pFiveQF.center.y-75, pFiveQF.bounds.size.width, pFiveQF.bounds.size.height)];
        TileSixFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixQF.center.x-75, pSixQF.center.y-75, pSixQF.bounds.size.width, pSixQF.bounds.size.height)];
        TileSevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenQF.center.x-75, pSevenQF.center.y-75, pSevenQF.bounds.size.width, pSevenQF.bounds.size.height)];
        TileEightFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightQF.center.x-75, pEightQF.center.y-75, pEightQF.bounds.size.width, pEightQF.bounds.size.height)];
        TileNineFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineQF.center.x-75, pNineQF.center.y-75, pNineQF.bounds.size.width, pNineQF.bounds.size.height)];
        TileTenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTenQF.center.x-75, pTenQF.center.y-75, pTenQF.bounds.size.width, pTenQF.bounds.size.height)];
        TileElevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pElevenQF.center.x-75, pElevenQF.center.y-75, pElevenQF.bounds.size.width, pElevenQF.bounds.size.height)];
        TileTwelveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelveQF.center.x-75, pTwelveQF.center.y-75, pTwelveQF.bounds.size.width, pTwelveQF.bounds.size.height)];
        TileThirteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteenQF.center.x-75, pThirteenQF.center.y-75, pThirteenQF.bounds.size.width, pThirteenQF.bounds.size.height)];
        TileFourteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteenQF.center.x-75, pFourteenQF.center.y-75, pFourteenQF.bounds.size.width, pFourteenQF.bounds.size.height)];
        TileFithteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteenQF.center.x-75, pFithteenQF.center.y-75, pFithteenQF.bounds.size.width, pFithteenQF.bounds.size.height)];
        TileSixteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteenQF.center.x-75, pSixteenQF.center.y-75, pSixteenQF.bounds.size.width, pSixteenQF.bounds.size.height)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            TileOneFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneQF.center.x - 50, pOneQF.center.y - 50, pOneQF.bounds.size.width, pOneQF.bounds.size.height)];
            TileTwoFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoQF.center.x-50, pTwoQF.center.y-50, pTwoQF.bounds.size.width, pTwoQF.bounds.size.height)];
            TileThreeFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeQF.center.x-50, pThreeQF.center.y-50, pThreeQF.bounds.size.width, pThreeQF.bounds.size.height)];
            TileFourFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourQF.center.x-50, pFourQF.center.y-50, pFourQF.bounds.size.width, pFourQF.bounds.size.height)];
            TileFiveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveQF.center.x-50, pFiveQF.center.y-50, pFiveQF.bounds.size.width, pFiveQF.bounds.size.height)];
            TileSixFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixQF.center.x-50, pSixQF.center.y-50, pSixQF.bounds.size.width, pSixQF.bounds.size.height)];
            TileSevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenQF.center.x-50, pSevenQF.center.y-50, pSevenQF.bounds.size.width, pSevenQF.bounds.size.height)];
            TileEightFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightQF.center.x-50, pEightQF.center.y-50, pEightQF.bounds.size.width, pEightQF.bounds.size.height)];
            TileNineFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineQF.center.x-50, pNineQF.center.y-50, pNineQF.bounds.size.width, pNineQF.bounds.size.height)];
            TileTenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTenQF.center.x-50, pTenQF.center.y-50, pTenQF.bounds.size.width, pTenQF.bounds.size.height)];
            TileElevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pElevenQF.center.x-50, pElevenQF.center.y-50, pElevenQF.bounds.size.width, pElevenQF.bounds.size.height)];
            TileTwelveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelveQF.center.x-50, pTwelveQF.center.y-50, pTwelveQF.bounds.size.width, pTwelveQF.bounds.size.height)];
            TileThirteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteenQF.center.x-50, pThirteenQF.center.y-50, pThirteenQF.bounds.size.width, pThirteenQF.bounds.size.height)];
            TileFourteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteenQF.center.x-50, pFourteenQF.center.y-50, pFourteenQF.bounds.size.width, pFourteenQF.bounds.size.height)];
            TileFithteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteenQF.center.x-50, pFithteenQF.center.y-50, pFithteenQF.bounds.size.width, pFithteenQF.bounds.size.height)];
            TileSixteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteenQF.center.x-50, pSixteenQF.center.y-50, pSixteenQF.bounds.size.width, pSixteenQF.bounds.size.height)];
            
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            
            TileOneFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneQF.center.x - 55, pOneQF.center.y - 55, pOneQF.bounds.size.width, pOneQF.bounds.size.height)];
            TileTwoFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoQF.center.x-55, pTwoQF.center.y-55, pTwoQF.bounds.size.width, pTwoQF.bounds.size.height)];
            TileThreeFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeQF.center.x-55, pThreeQF.center.y-55, pThreeQF.bounds.size.width, pThreeQF.bounds.size.height)];
            TileFourFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourQF.center.x-55, pFourQF.center.y-55, pFourQF.bounds.size.width, pFourQF.bounds.size.height)];
            TileFiveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveQF.center.x-55, pFiveQF.center.y-55, pFiveQF.bounds.size.width, pFiveQF.bounds.size.height)];
            TileSixFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixQF.center.x-55, pSixQF.center.y-55, pSixQF.bounds.size.width, pSixQF.bounds.size.height)];
            TileSevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenQF.center.x-55, pSevenQF.center.y-55, pSevenQF.bounds.size.width, pSevenQF.bounds.size.height)];
            TileEightFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightQF.center.x-55, pEightQF.center.y-55, pEightQF.bounds.size.width, pEightQF.bounds.size.height)];
            TileNineFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineQF.center.x-55, pNineQF.center.y-55, pNineQF.bounds.size.width, pNineQF.bounds.size.height)];
            TileTenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTenQF.center.x-55, pTenQF.center.y-55, pTenQF.bounds.size.width, pTenQF.bounds.size.height)];
            TileElevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pElevenQF.center.x-55, pElevenQF.center.y-55, pElevenQF.bounds.size.width, pElevenQF.bounds.size.height)];
            TileTwelveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelveQF.center.x-55, pTwelveQF.center.y-55, pTwelveQF.bounds.size.width, pTwelveQF.bounds.size.height)];
            TileThirteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteenQF.center.x-55, pThirteenQF.center.y-55, pThirteenQF.bounds.size.width, pThirteenQF.bounds.size.height)];
            TileFourteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteenQF.center.x-55, pFourteenQF.center.y-55, pFourteenQF.bounds.size.width, pFourteenQF.bounds.size.height)];
            TileFithteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteenQF.center.x-55, pFithteenQF.center.y-55, pFithteenQF.bounds.size.width, pFithteenQF.bounds.size.height)];
            TileSixteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteenQF.center.x-55, pSixteenQF.center.y-55, pSixteenQF.bounds.size.width, pSixteenQF.bounds.size.height)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            TileOneFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneQF.center.x - 58, pOneQF.center.y - 58, pOneQF.bounds.size.width, pOneQF.bounds.size.height)];
            TileTwoFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoQF.center.x-58, pTwoQF.center.y-58, pTwoQF.bounds.size.width, pTwoQF.bounds.size.height)];
            TileThreeFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeQF.center.x-58, pThreeQF.center.y-58, pThreeQF.bounds.size.width, pThreeQF.bounds.size.height)];
            TileFourFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourQF.center.x-58, pFourQF.center.y-58, pFourQF.bounds.size.width, pFourQF.bounds.size.height)];
            TileFiveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveQF.center.x-58, pFiveQF.center.y-58, pFiveQF.bounds.size.width, pFiveQF.bounds.size.height)];
            TileSixFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixQF.center.x-58, pSixQF.center.y-58, pSixQF.bounds.size.width, pSixQF.bounds.size.height)];
            TileSevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenQF.center.x-58, pSevenQF.center.y-58, pSevenQF.bounds.size.width, pSevenQF.bounds.size.height)];
            TileEightFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightQF.center.x-58, pEightQF.center.y-58, pEightQF.bounds.size.width, pEightQF.bounds.size.height)];
            TileNineFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineQF.center.x-58, pNineQF.center.y-58, pNineQF.bounds.size.width, pNineQF.bounds.size.height)];
            TileTenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTenQF.center.x-58, pTenQF.center.y-58, pTenQF.bounds.size.width, pTenQF.bounds.size.height)];
            TileElevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pElevenQF.center.x-58, pElevenQF.center.y-58, pElevenQF.bounds.size.width, pElevenQF.bounds.size.height)];
            TileTwelveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelveQF.center.x-58, pTwelveQF.center.y-58, pTwelveQF.bounds.size.width, pTwelveQF.bounds.size.height)];
            TileThirteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteenQF.center.x-58, pThirteenQF.center.y-58, pThirteenQF.bounds.size.width, pThirteenQF.bounds.size.height)];
            TileFourteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteenQF.center.x-58, pFourteenQF.center.y-58, pFourteenQF.bounds.size.width, pFourteenQF.bounds.size.height)];
            TileFithteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteenQF.center.x-58, pFithteenQF.center.y-58, pFithteenQF.bounds.size.width, pFithteenQF.bounds.size.height)];
            TileSixteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteenQF.center.x-58, pSixteenQF.center.y-58, pSixteenQF.bounds.size.width, pSixteenQF.bounds.size.height)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            TileOneFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pOneQF.center.x - 60, pOneQF.center.y - 60, pOneQF.bounds.size.width, pOneQF.bounds.size.height)];
            TileTwoFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoQF.center.x-60, pTwoQF.center.y-60, pTwoQF.bounds.size.width, pTwoQF.bounds.size.height)];
            TileThreeFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeQF.center.x-60, pThreeQF.center.y-60, pThreeQF.bounds.size.width, pThreeQF.bounds.size.height)];
            TileFourFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourQF.center.x-60, pFourQF.center.y-60, pFourQF.bounds.size.width, pFourQF.bounds.size.height)];
            TileFiveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveQF.center.x-60, pFiveQF.center.y-60, pFiveQF.bounds.size.width, pFiveQF.bounds.size.height)];
            TileSixFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixQF.center.x-60, pSixQF.center.y-60, pSixQF.bounds.size.width, pSixQF.bounds.size.height)];
            TileSevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenQF.center.x-60, pSevenQF.center.y-60, pSevenQF.bounds.size.width, pSevenQF.bounds.size.height)];
            TileEightFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pEightQF.center.x-60, pEightQF.center.y-60, pEightQF.bounds.size.width, pEightQF.bounds.size.height)];
            TileNineFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pNineQF.center.x-60, pNineQF.center.y-60, pNineQF.bounds.size.width, pNineQF.bounds.size.height)];
            TileTenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTenQF.center.x-60, pTenQF.center.y-60, pTenQF.bounds.size.width, pTenQF.bounds.size.height)];
            TileElevenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pElevenQF.center.x-60, pElevenQF.center.y-60, pElevenQF.bounds.size.width, pElevenQF.bounds.size.height)];
            TileTwelveFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelveQF.center.x-60, pTwelveQF.center.y-60, pTwelveQF.bounds.size.width, pTwelveQF.bounds.size.height)];
            TileThirteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteenQF.center.x-60, pThirteenQF.center.y-60, pThirteenQF.bounds.size.width, pThirteenQF.bounds.size.height)];
            TileFourteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteenQF.center.x-60, pFourteenQF.center.y-60, pFourteenQF.bounds.size.width, pFourteenQF.bounds.size.height)];
            TileFithteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteenQF.center.x-60, pFithteenQF.center.y-60, pFithteenQF.bounds.size.width, pFithteenQF.bounds.size.height)];
            TileSixteenFQ = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteenQF.center.x-60, pSixteenQF.center.y-60, pSixteenQF.bounds.size.width, pSixteenQF.bounds.size.height)];
            
        }
    }
    
    TileOneFQ.backgroundColor = [UIColor whiteColor];
    TileTwoFQ.backgroundColor = [UIColor whiteColor];
    TileThreeFQ.backgroundColor = [UIColor whiteColor];
    TileFourFQ.backgroundColor = [UIColor whiteColor];
    TileFiveFQ.backgroundColor = [UIColor whiteColor];
    TileSixFQ.backgroundColor = [UIColor whiteColor];
    TileSevenFQ.backgroundColor = [UIColor whiteColor];
    TileEightFQ.backgroundColor = [UIColor whiteColor];
    TileNineFQ.backgroundColor = [UIColor whiteColor];
    TileTenFQ.backgroundColor = [UIColor whiteColor];
    TileElevenFQ.backgroundColor = [UIColor whiteColor];
    TileTwelveFQ.backgroundColor = [UIColor whiteColor];
    TileThirteenFQ.backgroundColor = [UIColor whiteColor];
    TileFourteenFQ.backgroundColor = [UIColor whiteColor];
    TileFithteenFQ.backgroundColor = [UIColor whiteColor];
    TileSixteenFQ.backgroundColor = [UIColor whiteColor];
    
    TileOneFQ.alpha = 0;
    TileTwoFQ.alpha = 0;
    TileThreeFQ.alpha = 0;
    TileFourFQ.alpha = 0;
    TileFiveFQ.alpha = 0;
    TileSixFQ.alpha = 0;
    TileSevenFQ.alpha = 0;
    TileEightFQ.alpha = 0;
    TileNineFQ.alpha = 0;
    TileTenFQ.alpha = 0;
    TileElevenFQ.alpha = 0;
    TileTwelveFQ.alpha = 0;
    TileThirteenFQ.alpha = 0;
    TileFourteenFQ.alpha = 0;
    TileFithteenFQ.alpha = 0;
    TileSixteenFQ.alpha = 0;
    
    [self.view addSubview:TileOneFQ];
    [self.view addSubview:TileTwoFQ];
    [self.view addSubview:TileThreeFQ];
    [self.view addSubview:TileFourFQ];
    [self.view addSubview:TileFiveFQ];
    [self.view addSubview:TileSixFQ];
    [self.view addSubview:TileSevenFQ];
    [self.view addSubview:TileEightFQ];
    [self.view addSubview:TileNineFQ];
    [self.view addSubview:TileTenFQ];
    [self.view addSubview:TileElevenFQ];
    [self.view addSubview:TileTwelveFQ];
    [self.view addSubview:TileThirteenFQ];
    [self.view addSubview:TileFourteenFQ];
    [self.view addSubview:TileFithteenFQ];
    [self.view addSubview:TileSixteenFQ];
    
    TileOneFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileElevenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwelveFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThirteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFithteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneFQ.alpha = 1;
    TileOneFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoFQ.alpha = 1;
    TileTwoFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileFiveFQ.alpha = 1;
    TileFiveFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileThreeFQ.alpha = 1;
    TileThreeFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileSixFQ.alpha = 1;
    TileSixFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileNineFQ.alpha = 1;
    TileNineFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileFourFQ.alpha = 1;
    TileFourFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileSevenFQ.alpha = 1;
    TileSevenFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileTenFQ.alpha = 1;
    TileTenFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileThirteenFQ.alpha = 1;
    TileThirteenFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileEightFQ.alpha = 1;
    TileEightFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileElevenFQ.alpha = 1;
    TileElevenFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileFourteenFQ.alpha = 1;
    TileFourteenFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwelveFQ.alpha = 1;
    TileTwelveFQ.transform = CGAffineTransformMakeScale(1, 1);
    TileFithteenFQ.alpha = 1;
    TileFithteenFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileSixteenFQ.alpha = 1;
    TileSixteenFQ.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordQF.alpha = 0;
    TheCurrentWordQF.alpha = 0;
    SenderDisplayQF.alpha = 0;
    TheQuestionQF.alpha = 0;
    PauseQF.alpha = 0;
    CheckQF.alpha = 0;
    pOneQF.alpha = 0;
    pTwoQF.alpha = 0;
    pThreeQF.alpha = 0;
    pFourQF.alpha = 0;
    pFiveQF.alpha = 0;
    pSixQF.alpha = 0;
    pSevenQF.alpha = 0;
    pEightQF.alpha = 0;
    pNineQF.alpha = 0;
    pTenQF.alpha = 0;
    pElevenQF.alpha = 0;
    pTwelveQF.alpha = 0;
    pThirteenQF.alpha = 0;
    pFourteenQF.alpha = 0;
    pFithteenQF.alpha = 0;
    pSixteenQF.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountQF.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountQF.alpha = 0;
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
    [TileOneFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFiveFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSevenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEightFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileNineFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileElevenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwelveFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThirteenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourteenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFithteenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixteenFQ.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileFiveFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileSevenFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileEightFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileTenFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileElevenFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwelveFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileThirteenFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourteenFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileFithteenFQ.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixteenFQ.layer addAnimation:rotation forKey:@"Spin"];
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileFourFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileFiveFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileSixFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileSevenFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileEightFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileNineFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileTenFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileElevenFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileTwelveFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileThirteenFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileFourteenFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileFithteenFQ.transform = CGAffineTransformMakeScale(10, 10);
    TileSixteenFQ.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileElevenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwelveFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThirteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFithteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixteenFQ.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountQF.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)GetTheWord
{
    xOneQF = pOneQF.center.x;
    yOneQF = pOneQF.center.y;
    xTwoQF = pTwoQF.center.x;
    yTwoQF = pTwoQF.center.y;
    xThreeQF = pThreeQF.center.x;
    yThreeQF = pThreeQF.center.y;
    xFourQF = pFourQF.center.x;
    yFourQF = pFourQF.center.y;
    xFiveQF = pFiveQF.center.x;
    yFiveQF = pFiveQF.center.y;
    xSixQF = pSixQF.center.x;
    ySixQF = pSixQF.center.y;
    ySevenQF = pSevenQF.center.y;
    xSevenQF = pSevenQF.center.x;
    xEightQF = pEightQF.center.x;
    yEightQF = pEightQF.center.y;
    yNineQF = pNineQF.center.y;
    xNineQF = pNineQF.center.x;
    xTenQF = pTenQF.center.x;
    yTenQF = pTenQF.center.y;
    xElevenQF = pElevenQF.center.x;
    yElevenQF = pElevenQF.center.y;
    xTwelveQF = pTwelveQF.center.x;
    yTwelveQF = pTwelveQF.center.y;
    xThirteenQF = pThirteenQF.center.x;
    yThirteenQF = pThirteenQF.center.y;
    xFourteenQF = pFourteenQF.center.x;
    yFourteenQF = pFourteenQF.center.y;
    xFithteenQF = pFithteenQF.center.x;
    yFithteenQF = pFithteenQF.center.y;
    xSixteenQF = pSixteenQF.center.x;
    ySixteenQF = pSixteenQF.center.y;
    
    if (pOneQF.center.y == iktOneQF) {
        if (pOneQF.center.x == ikOneQF) {
            wOneQF = cOneQF;
        } else if (pOneQF.center.x == ikTwoQF) {
            wTwoQF = cOneQF;
        } else if (pOneQF.center.x == ikThreeQF) {
            wThreeQF = cOneQF;
        } else if (pOneQF.center.x == ikFourQF) {
            wFourQF = cOneQF;
        }
    }
    
    if (pTwoQF.center.y == iktOneQF) {
        if (pTwoQF.center.x == ikOneQF) {
            wOneQF = cTwoQF;
        } else if (pTwoQF.center.x == ikTwoQF) {
            wTwoQF = cTwoQF;
        } else if (pTwoQF.center.x == ikThreeQF) {
            wThreeQF = cTwoQF;
        } else if (pTwoQF.center.x == ikFourQF) {
            wFourQF = cTwoQF;
        }
    }
    
    if (pThreeQF.center.y == iktOneQF) {
        if (pThreeQF.center.x == ikOneQF) {
            wOneQF = cThreeQF;
        } else if (pThreeQF.center.x == ikTwoQF) {
            wTwoQF = cThreeQF;
        } else if (pThreeQF.center.x == ikThreeQF) {
            wThreeQF = cThreeQF;
        } else if (pThreeQF.center.x == ikFourQF) {
            wFourQF = cThreeQF;
        }
    }
    
    if (pFourQF.center.y == iktOneQF) {
        if (pFourQF.center.x == ikOneQF) {
            wOneQF = cFourQF;
        } else if (pFourQF.center.x == ikTwoQF) {
            wTwoQF = cFourQF;
        } else if (pFourQF.center.x == ikThreeQF) {
            wThreeQF = cFourQF;
        } else if (pFourQF.center.x == ikFourQF) {
            wFourQF = cFourQF;
        }
    }
    
    if (pFiveQF.center.y == iktOneQF) {
        if (pFiveQF.center.x == ikOneQF) {
            wOneQF = cFiveQF;
        } else if (pFiveQF.center.x == ikTwoQF) {
            wTwoQF = cFiveQF;
        } else if (pFiveQF.center.x == ikThreeQF) {
            wThreeQF = cFiveQF;
        } else if (pFiveQF.center.x == ikFourQF) {
            wFourQF = cFiveQF;
        }
    }
    
    if (pSixQF.center.y == iktOneQF) {
        if (pSixQF.center.x == ikOneQF) {
            wOneQF = cSixQF;
        } else if (pSixQF.center.x == ikTwoQF) {
            wTwoQF = cSixQF;
        } else if (pSixQF.center.x == ikThreeQF) {
            wThreeQF = cSixQF;
        } else if (pSixQF.center.x == ikFourQF) {
            wFourQF = cSixQF;
        }
    }
    
    if (pSevenQF.center.y == iktOneQF) {
        if (pSevenQF.center.x == ikOneQF) {
            wOneQF = cSevenQF;
        } else if (pSevenQF.center.x == ikTwoQF) {
            wTwoQF = cSevenQF;
        } else if (pSevenQF.center.x == ikThreeQF) {
            wThreeQF = cSevenQF;
        } else if (pSevenQF.center.x == ikFourQF) {
            wFourQF = cSevenQF;
        }
    }
    
    if (pEightQF.center.y == iktOneQF) {
        if (pEightQF.center.x == ikOneQF) {
            wOneQF = cEightQF;
        } else if (pEightQF.center.x == ikTwoQF) {
            wTwoQF = cEightQF;
        } else if (pEightQF.center.x == ikThreeQF) {
            wThreeQF = cEightQF;
        } else if (pEightQF.center.x == ikFourQF) {
            wFourQF = cEightQF;
        }
    }
    
    if (pNineQF.center.y == iktOneQF) {
        if (pNineQF.center.x == ikOneQF) {
            wOneQF = cNineQF;
        } else if (pNineQF.center.x == ikTwoQF) {
            wTwoQF = cNineQF;
        } else if (pNineQF.center.x == ikThreeQF) {
            wThreeQF = cNineQF;
        } else if (pNineQF.center.x == ikFourQF) {
            wFourQF = cNineQF;
        }
    }
    
    if (pTenQF.center.y == iktOneQF) {
        if (pTenQF.center.x == ikOneQF) {
            wOneQF = cTenQF;
        } else if (pTenQF.center.x == ikTwoQF) {
            wTwoQF = cTenQF;
        } else if (pTenQF.center.x == ikThreeQF) {
            wThreeQF = cTenQF;
        } else if (pTenQF.center.x == ikFourQF) {
            wFourQF = cTenQF;
        }
    }
    
    if (pElevenQF.center.y == iktOneQF) {
        if (pElevenQF.center.x == ikOneQF) {
            wOneQF = cElevenQF;
        } else if (pElevenQF.center.x == ikTwoQF) {
            wTwoQF = cElevenQF;
        } else if (pElevenQF.center.x == ikThreeQF) {
            wThreeQF = cElevenQF;
        } else if (pElevenQF.center.x == ikFourQF) {
            wFourQF = cElevenQF;
        }
    }
    
    if (pTwelveQF.center.y == iktOneQF) {
        if (pTwelveQF.center.x == ikOneQF) {
            wOneQF = cTwelveQF;
        } else if (pTwelveQF.center.x == ikTwoQF) {
            wTwoQF = cTwelveQF;
        } else if (pTwelveQF.center.x == ikThreeQF) {
            wThreeQF = cTwelveQF;
        } else if (pTwelveQF.center.x == ikFourQF) {
            wFourQF = cTwelveQF;
        }
    }
    
    if (pThirteenQF.center.y == iktOneQF) {
        if (pThirteenQF.center.x == ikOneQF) {
            wOneQF = cThirteenQF;
        } else if (pThirteenQF.center.x == ikTwoQF) {
            wTwoQF = cThirteenQF;
        } else if (pThirteenQF.center.x == ikThreeQF) {
            wThreeQF = cThirteenQF;
        } else if (pThirteenQF.center.x == ikFourQF) {
            wFourQF = cThirteenQF;
        }
    }
    
    if (pFourteenQF.center.y == iktOneQF) {
        if (pFourteenQF.center.x == ikOneQF) {
            wOneQF = cFourteenQF;
        } else if (pFourteenQF.center.x == ikTwoQF) {
            wTwoQF = cFourteenQF;
        } else if (pFourteenQF.center.x == ikThreeQF) {
            wThreeQF = cFourteenQF;
        } else if (pFourteenQF.center.x == ikFourQF) {
            wFourQF = cFourteenQF;
        }
    }
    
    if (pFithteenQF.center.y == iktOneQF) {
        if (pFithteenQF.center.x == ikOneQF) {
            wOneQF = cFithteenQF;
        } else if (pFithteenQF.center.x == ikTwoQF) {
            wTwoQF = cFithteenQF;
        } else if (pFithteenQF.center.x == ikThreeQF) {
            wThreeQF = cFithteenQF;
        } else if (pFithteenQF.center.x == ikFourQF) {
            wFourQF = cFithteenQF;
        }
    }
    
    if (pSixteenQF.center.y == iktOneQF) {
        if (pSixteenQF.center.x == ikOneQF) {
            wOneQF = cSixteenQF;
        } else if (pSixteenQF.center.x == ikTwoQF) {
            wTwoQF = cSixteenQF;
        } else if (pSixteenQF.center.x == ikThreeQF) {
            wThreeQF = cSixteenQF;
        } else if (pSixteenQF.center.x == ikFourQF) {
            wFourQF = cSixteenQF;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneQF];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoQF];
    NSString *Threes = [NSString stringWithFormat:@"%c", wThreeQF];
    NSString *Fours = [NSString stringWithFormat:@"%c", wFourQF];
    
    WordQF = [NSString stringWithFormat:@"%@%@%@%@", Ones, Twos, Threes, Fours];
    TheCurrentWordQF.text = [WordQF uppercaseString];
    
    pOneQF.center = CGPointMake(xOneQF, yOneQF);
    pTwoQF.center = CGPointMake(xTwoQF, yTwoQF);
    pThreeQF.center = CGPointMake(xThreeQF, yThreeQF);
    pFourQF.center = CGPointMake(xFourQF, yFourQF);
    pFiveQF.center = CGPointMake(xFiveQF, yFiveQF);
    pSixQF.center = CGPointMake(xSixQF, ySixQF);
    pSevenQF.center = CGPointMake(xSevenQF, ySevenQF);
    pEightQF.center = CGPointMake(xEightQF, yEightQF);
    pNineQF.center = CGPointMake(xNineQF, yNineQF);
    pTenQF.center = CGPointMake(xTenQF, yTenQF);
    pElevenQF.center = CGPointMake(xElevenQF, yElevenQF);
    pTwelveQF.center = CGPointMake(xTwelveQF, yTwelveQF);
    pThirteenQF.center = CGPointMake(xThirteenQF, yThirteenQF);
    pFourteenQF.center = CGPointMake(xFourteenQF, yFourteenQF);
    pFithteenQF.center = CGPointMake(xFithteenQF, yFithteenQF);
    pSixteenQF.center = CGPointMake(xSixteenQF, ySixteenQF);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseQF setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoQF play];
    
    PauseQF.userInteractionEnabled = NO;
    CheckQF.userInteractionEnabled = NO;
    PauseDisplayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsQF.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeQF.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayQF.alpha = 1.0;
        
        CurrentWordsQF.alpha = 1;
        PlayQF.alpha = 1;
        HomeQF.alpha = 1;
        
        PauseDisplayQF.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeQF.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayQF.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWordsQF.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        PauseQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheQuestionQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        CheckQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        PauseQF.alpha = 0;
        SenderDisplayQF.alpha = 0;
        TotalAmountQF.alpha = 0;
        TheCurrentWordQF.alpha = 0;
        CheckQF.alpha = 0;
        BarUnderWordQF.alpha = 0;
        TheCurrentWordQF.alpha = 0;
        TheQuestionQF.alpha = 0;
        
        [pOneQF setAlpha:0];
        [pTwoQF setAlpha:0];
        [pThreeQF setAlpha:0];
        [pFourQF setAlpha:0];
        [pFiveQF setAlpha:0];
        [pSixQF setAlpha:0];
        [pSevenQF setAlpha:0];
        [pEightQF setAlpha:0];
        [pNineQF setAlpha:0];
        [pTenQF setAlpha:0];
        [pElevenQF setAlpha:0];
        [pTwelveQF setAlpha:0];
        [BarUnderWordQF setAlpha:0];
        [pThirteenQF setAlpha:0];
        [pFourteenQF setAlpha:0];
        [pFithteenQF setAlpha:0];
        [pSixteenQF setAlpha:0];
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerQF = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerQF = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerQF = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerQF = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerQF = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerQF.scrollEnabled = YES;
    WordScrollerQF.userInteractionEnabled = YES;
    WordScrollerQF.backgroundColor = [UIColor blackColor];
    WordScrollerQF.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerQF.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerQF aboveSubview:PauseDisplayQF];
    if (ScoreQF > 0) {
        NSString *path;
        switch (WordFourQF) {
            case 1:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsOne" ofType:@"plist"];
                break;
            case 2:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsTwo" ofType:@"plist"];
                break;
            case 3:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsThree" ofType:@"plist"];
                break;
            case 4:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsFour" ofType:@"plist"];
                break;
            case 5:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsFive" ofType:@"plist"];
                break;
            case 6:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsSix" ofType:@"plist"];
                break;
            case 7:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsSeven" ofType:@"plist"];
                break;
            case 8:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsEight" ofType:@"plist"];
                break;
            case 9:
                path = [[NSBundle mainBundle] pathForResource:@"4QuestionsNine" ofType:@"plist"];
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
                    if (WordIsAlreadyDoneQF[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerQF.subviews) {
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
                            WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerQF addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneQF[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerQF.subviews) {
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
                                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerQF addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneQF[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerQF.subviews) {
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
                                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerQF addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneQF[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerQF.subviews) {
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
                                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerQF addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneQF[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerQF.subviews) {
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
                                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerQF addSubview:lbl];
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
            [WordScrollerQF addSubview:lbll];
            WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerQF addSubview:lbll];
                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerQF addSubview:lbll];
                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerQF addSubview:lbll];
                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerQF addSubview:lbll];
                WordScrollerQF.contentSize = CGSizeMake(WordScrollerQF.bounds.size.width, lbll.center.y + 50);
            }
        }
    }
    
}

-(IBAction)Play:(id)sender
{
    [SoundOneQF play];
    [SoundTwoQF play];
    
    for (UIView *v in WordScrollerQF.subviews) {
        [v removeFromSuperview];
    }
    [WordScrollerQF removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayQF.alpha = 0;
        HomeQF.alpha = 0;
        PlayQF.alpha = 0;
        CurrentWordsQF.alpha = 0;
        
        CheckQF.userInteractionEnabled = YES;
        PauseQF.userInteractionEnabled = YES;
        
        PauseDisplayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        PauseQF.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayQF.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountQF.transform =CGAffineTransformMakeScale(1,1);
        TheQuestionQF.transform =CGAffineTransformMakeScale(1,1);
        CheckQF.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordQF.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordQF.transform =CGAffineTransformMakeScale(1,1);
        
        PauseQF.alpha = 1;
        SenderDisplayQF.alpha = 1;
        TotalAmountQF.alpha = 1;
        TheCurrentWordQF.alpha = 1;
        CheckQF.alpha = 1;
        BarUnderWordQF.alpha = 1;
        TheCurrentWordQF.alpha = 1;
        TheQuestionQF.alpha = 1;
        
        [pOneQF setAlpha:1];
        [pTwoQF setAlpha:1];
        [pThreeQF setAlpha:1];
        [pFourQF setAlpha:1];
        [pFiveQF setAlpha:1];
        [pSixQF setAlpha:1];
        [pSevenQF setAlpha:1];
        [pEightQF setAlpha:1];
        [pNineQF setAlpha:1];
        [pTenQF setAlpha:1];
        [pElevenQF setAlpha:1];
        [pTwelveQF setAlpha:1];
        [BarUnderWordQF setAlpha:1];
        [pThirteenQF setAlpha:1];
        [pFourteenQF setAlpha:1];
        [pFithteenQF setAlpha:1];
        [pSixteenQF setAlpha:1];
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneQF play];
    [SoundTwoQF play];
    
    for (UIView *v in WordScrollerQF.subviews) {
        [v removeFromSuperview];
    }
    [WordScrollerQF removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayQF.alpha = 0;
        HomeQF.alpha = 0;
        PlayQF.alpha = 0;
        CurrentWordsQF.alpha = 0;
        
        CheckQF.userInteractionEnabled = YES;
        PauseQF.userInteractionEnabled = YES;
        
        PauseDisplayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        PauseQF.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayQF.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountQF.transform =CGAffineTransformMakeScale(1,1);
        TheQuestionQF.transform =CGAffineTransformMakeScale(1,1);
        CheckQF.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordQF.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordQF.transform =CGAffineTransformMakeScale(1,1);
    }];
    
    [pOneQF setAlpha:0];
    [pTwoQF setAlpha:0];
    [pThreeQF setAlpha:0];
    [pFourQF setAlpha:0];
    [pFiveQF setAlpha:0];
    [pSixQF setAlpha:0];
    [pSevenQF setAlpha:0];
    [pEightQF setAlpha:0];
    [pNineQF setAlpha:0];
    [pTenQF setAlpha:0];
    [pElevenQF setAlpha:0];
    [pTwelveQF setAlpha:0];
    [BarUnderWordQF setAlpha:0];
    [pThirteenQF setAlpha:0];
    [pFourteenQF setAlpha:0];
    [pFithteenQF setAlpha:0];
    [pSixteenQF setAlpha:0];
    [TheCurrentWordQF setAlpha:0];
    [CheckQF setAlpha:0];
    [PauseQF setAlpha:0];
    [SenderDisplayQF setAlpha:0];
    [TotalAmountQF setAlpha:0];
    [TheQuestionQF setAlpha:0];
    [self BackToHome];
}

-(void)BackToHome
{
    for (int i = 0; i <= 23; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneQF[i] = NO;
        }
    }
    
    moverQF = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjectsBack) userInfo:nil repeats:YES];
    ScoreQF = 0;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    
    [tHomeQF setAlpha:1];
    
    [sOneQF setAlpha:1];
    [sTwoQF setAlpha:1];
    [sThreeQF setAlpha:1];
    [sFourQF setAlpha:1];
    [sFiveQF setAlpha:1];
    [sSixQF setAlpha:1];
    [sSevenQF setAlpha:1];
    [sEightQF setAlpha:1];
    [sNineQF setAlpha:1];
    
    [UIView commitAnimations];
    
    [TileOneFQ removeFromSuperview];
    [TileTwoFQ removeFromSuperview];
    [TileThreeFQ removeFromSuperview];
    [TileFourFQ removeFromSuperview];
    [TileFiveFQ removeFromSuperview];
    [TileSixFQ removeFromSuperview];
    [TileSevenFQ removeFromSuperview];
    [TileEightFQ removeFromSuperview];
    [TileNineFQ removeFromSuperview];
    [TileTenFQ removeFromSuperview];
    [TileElevenFQ removeFromSuperview];
    [TileTwelveFQ removeFromSuperview];
    [TileThirteenFQ removeFromSuperview];
    [TileFourteenFQ removeFromSuperview];
    [TileFithteenFQ removeFromSuperview];
    [TileSixteenFQ removeFromSuperview];
    
    pOneQF.center = CGPointMake(ikOneQF, iktOneQF);
    pTwoQF.center = CGPointMake(ikTwoQF, iktTwoQF);
    pThreeQF.center = CGPointMake(ikThreeQF, iktThreeQF);
    pFourQF.center = CGPointMake(ikFourQF, iktFourQF);
    pFiveQF.center = CGPointMake(ikFiveQF, iktFiveQF);
    pSixQF.center = CGPointMake(ikSixQF, iktSixQF);
    pSevenQF.center = CGPointMake(ikSevenQF, iktSevenQF);
    pEightQF.center = CGPointMake(ikEightQF, iktEightQF);
    pNineQF.center = CGPointMake(ikNineQF, iktNineQF);
    pTenQF.center = CGPointMake(ikTenQF, iktTenQF);
    pElevenQF.center = CGPointMake(ikElevenQF, iktElevenQF);
    pTwelveQF.center = CGPointMake(ikTwelveQF, iktTwelveQF);
    pThirteenQF.center = CGPointMake(ikThirteenQF, iktThirteenQF);
    pFourteenQF.center = CGPointMake(ikFourteenQF, iktFourteenQF);
    pFithteenQF.center = CGPointMake(ikFithteenQF, iktFithteenQF);
    pSixteenQF.center = CGPointMake(ikSixteenQF, iktSixteenQF);
}

-(void)MovingTheObjectsBack
{
    int a;
    a = 1;
    
    sOneQF.center = CGPointMake(sOneQF.center.x, sOneQF.center.y + a);
    sTwoQF.center = CGPointMake(sTwoQF.center.x , sTwoQF.center.y + a);
    sThreeQF.center = CGPointMake(sThreeQF.center.x , sThreeQF.center.y + a);
    sFourQF.center = CGPointMake(sFourQF.center.x , sFourQF.center.y + a);
    sFiveQF.center = CGPointMake(sFiveQF.center.x , sFiveQF.center.y + a);
    sSixQF.center = CGPointMake(sSixQF.center.x , sSixQF.center.y + a);
    sSevenQF.center = CGPointMake(sSevenQF.center.x , sSevenQF.center.y + a);
    sEightQF.center = CGPointMake(sEightQF.center.x , sEightQF.center.y + a);
    sNineQF.center = CGPointMake(sNineQF.center.x , sNineQF.center.y + a);
    
    if (sNineQF.center.y >= kSelectionQF) {
        [moverQF invalidate];
        moverQF = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        
        BBSelectionQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        gThreeQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        gTwoQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        gOneQF.transform =CGAffineTransformMakeScale(1.3,1.3);
        [UIView animateWithDuration:0.25 animations:^{
            gOneQF.alpha = 1.0;
            gTwoQF.alpha = 1;
            gThreeQF.alpha = 1;
            BBSelectionQF.alpha = 1;
            
            gOneQF.transform =CGAffineTransformMakeScale(1.0,1.0);
            gTwoQF.transform =CGAffineTransformMakeScale(1.0,1.0);
            gThreeQF.transform =CGAffineTransformMakeScale(1.0,1.0);
            BBSelectionQF.transform =CGAffineTransformMakeScale(1.0,1.0);
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
    [sOneQF setAlpha:0];
    [sTwoQF setAlpha:0];
    [sThreeQF setAlpha:0];
    [sFourQF setAlpha:0];
    [sFiveQF setAlpha:0];
    [sSixQF setAlpha:0];
    [sSevenQF setAlpha:0];
    [sEightQF setAlpha:0];
    [sNineQF setAlpha:0];
    [BBSelectionQF setAlpha:0];
    [UIView commitAnimations];
    BackGroundThreeQF.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneQF.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneQF.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"QTGridsFour" sender:self];
}

-(IBAction)gThree:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOneQF setAlpha:0];
    [sTwoQF setAlpha:0];
    [sThreeQF setAlpha:0];
    [sFourQF setAlpha:0];
    [sFiveQF setAlpha:0];
    [sSixQF setAlpha:0];
    [sSevenQF setAlpha:0];
    [sEightQF setAlpha:0];
    [sNineQF setAlpha:0];
    [BBSelectionQF setAlpha:0];
    [UIView commitAnimations];
    BackGroundTwoQF.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneQF.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneQF.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameThree) withObject:nil afterDelay:1];
}

-(void)GoToGameThree
{
    [self performSegueWithIdentifier:@"QTChoiceFour" sender:self];
}

-(IBAction)tHome:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourQF.alpha = 0;
        BackGroundFourQF.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourQF.alpha = 1;
                             BackGroundFourQF.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoingToHomeFromFourQuestions" sender:self];
}

@end