
//
//  FourChoice.m
//  Typex V2
//
//  Created by Michael Mooney on 22/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "FourChoice.h"
#import <AVFoundation/AVFoundation.h>

NSString *WordFC;

int replayFC, ScoreFC, PreviousFC, PanningIntFC, PPanningMethodFC;
NSInteger PanningSensitivityFC;
int TheAmountFC;
int siOneFC, siTwoFC, siThreeFC, siFourFC, siFiveFC, siSixFC, siSevenFC, siEightFC, siNineFC, siTenFC, siTwelveFC, siThirteenFC, siFourteenFC, siFithteenFC, siSixteenFC, siElevenFC;

char cOneFC, cTwoFC, cThreeFC, cFourFC, cFiveFC, cSixFC, cSevenFC, cEightFC, cNineFC, cTenFC, cElevenFC, cTwelveFC, cThirteenFC, cFourteenFC, cFithteenFC, cSixteenFC;
char wOneFC, wTwoFC, wThreeFC, wFourFC;
char  kOneFC, kTwoFC, kThreeFC, kFourFC, kFiveFC, kSixFC, kSevenFC, kEightFC, kNineFC, kTenFC, kElevenFC, kTwelveFC, kThirteenFC, kFourteenFC, kFithteenFC, kSixteenFC, kSeventeenFC, kEighteenFC, kNineteenFC, kTwentyFC, kTwentyOneFC, kTwentyTwoFC, kTwentyThreeFC, kTwentyFourFC, kTwentyFiveFC, kTwentySixFC;

float ikOneFC, ikTwoFC, ikThreeFC, ikFourFC, ikFiveFC, ikSixFC, ikSevenFC, ikEightFC, ikNineFC, ikTenFC, ikElevenFC, ikTwelveFC, ikThirteenFC, ikFourteenFC, ikFithteenFC, ikSixteenFC;
float iktOneFC, iktTwoFC, iktThreeFC, iktFourFC, iktFiveFC, iktSixFC, iktSevenFC, iktEightFC, iktNineFC, iktTenFC, iktElevenFC, iktTwelveFC, iktThirteenFC, iktFourteenFC, iktFithteenFC, iktSixteenFC;
float iLeftFC, iRightFC, iUpFC, iDownFC;
float pointOfIntrestFC;
float xOneFC, yOneFC, xTwoFC, yTwoFC, xThreeFC, yThreeFC, xFourFC, yFourFC, xFiveFC, yFiveFC, xSixFC, ySixFC, xSevenFC, ySevenFC, xEightFC, yEightFC, xNineFC, yNineFC, xTenFC, yTenFC, xElevenFC, yElevenFC, xTwelveFC, yTwelveFC, xThirteenFC, yThirteenFC, xFourteenFC, yFourteenFC, xFithteenFC, yFithteenFC, ySixteenFC, xSixteenFC;

CGPoint OneFC, TwoFC, ThreeFC, FourFC, FiveFC, SixFC, SevenFC, EightFC, NineFC, TenFC, ElevenFC, TwelveFC, ThirteenFC, FourteenFC, FithteenFC, SixteenFC, distanceFC;

BOOL WordIsAlreadyDoneFC[3822];

@interface FourChoice () <AVAudioPlayerDelegate>
{
    AVAudioPlayer *SoundOneFc, *SoundTwoFC, *SoundSwipeFC;
    
    #pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeFC, *CheckFC;
    IBOutlet UIImageView *BackGroundOneFC, *BackGroundTwoFC, *BackGroundThreeFC, *BackGroundFourFC;
    
    #pragma Mark Game - Grids
    IBOutlet UIImageView *pOneFC, *pTwoFC, *pThreeFC, *pFourFC, *pFiveFC, *pSixFC, *pSevenFC, *pEightFC, *pNineFC, *pTenFC, *pElevenFC, *pTwelveFC, *pThirteenFC, *pFourteenFC, *pFithteenFC, *pSixteenFC;
    IBOutlet UILabel *TotalAmountFC;
    IBOutlet UIButton *PauseFC;
    IBOutlet UILabel *TheCurrentWordFC;
    IBOutlet UIImageView *PauseDisplayFC, *SenderDisplayFC;
    IBOutlet UIButton *HomeFC, *PlayFC;
    IBOutlet UIImageView *BarUnderWordFC;
    IBOutlet UIImageView *BBSelectionFC;
    IBOutlet UIImageView *TileOneFC, *TileTwoFC, *TileThreeFC, *TileFourFC, *TileFiveFC, *TileSixFC, *TileSevenFC, *TileEightFC, *TileNineFC, *TileTenFC, *TileElevenFC, *TileTwelveFC, *TileThirteenFC, *TileFourteenFC, *TileFithteenFC, *TileSixteenFC;
    
    #pragma Mark Selection - Fist Page
    IBOutlet UIButton *gOneFC, *gTwoFC, *gThreeFC;
    IBOutlet UIImageView *spOneFC, *spTwoFC, *spThreeFC, *spFourFC, *spFiveFC, *spSixFC, *spSevenFC, *spEightFC, *spNineFC, *spTenFC, *spElevenFC, *spTwelveFC, *spThirteenFC, *spFourteenFC, *spFithteenFC, *spSixteenFC;
    IBOutlet UILabel *ErrorMessageFC;
    IBOutlet UIButton *StartFC;
    IBOutlet UIScrollView *WordScrollerFC;
    IBOutlet UILabel *CurrentWordsFC;
}
@end

@implementation FourChoice


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
    BackGroundFourFC.alpha = 0;
    
#pragma Mark The Game Items
    
    ScoreFC = 0;
    
    PauseFC.alpha = 0;
    CheckFC.alpha = 0;
    TotalAmountFC.alpha = 0;
    
    pOneFC.alpha = 0;
    pTwoFC.alpha = 0;
    pThreeFC.alpha = 0;
    CurrentWordsFC.alpha = 0;
    PlayFC.alpha = 0;
    HomeFC.alpha = 0;
    pFourFC.alpha = 0;
    pFiveFC.alpha = 0;
    pSixFC.alpha = 0;
    pSevenFC.alpha = 0;
    pEightFC.alpha = 0;
    pNineFC.alpha = 0;
    pTenFC.alpha = 0;
    pElevenFC.alpha = 0;
    pTwelveFC.alpha = 0;
    BarUnderWordFC.alpha = 0;
    pThirteenFC.alpha = 0;
    pFourteenFC.alpha = 0;
    pFithteenFC.alpha = 0;
    pSixteenFC.alpha = 0;
    SenderDisplayFC.alpha = 0;
    TheCurrentWordFC.alpha = 0;
    PauseDisplayFC.alpha = 0;
    
#pragma Mark The Selection Page
    
    StartFC.alpha = 0;
    ErrorMessageFC.alpha = 0;
    
    spOneFC.alpha = 0;
    spTwoFC.alpha = 0;
    spThreeFC.alpha = 0;
    spFourFC.alpha = 0;
    spFiveFC.alpha = 0;
    spSixFC.alpha = 0;
    spSevenFC.alpha = 0;
    spEightFC.alpha = 0;
    spNineFC.alpha = 0;
    spTenFC.alpha = 0;
    spElevenFC.alpha = 0;
    spTwelveFC.alpha = 0;
    spThirteenFC.alpha = 0;
    spFourteenFC.alpha = 0;
    spFithteenFC.alpha = 0;
    spSixteenFC.alpha = 0;
    
    ikOneFC = pOneFC.center.x;
    iktOneFC = pOneFC.center.y;
    ikTwoFC = pTwoFC.center.x;
    iktTwoFC = pTwoFC.center.y;
    ikThreeFC = pThreeFC.center.x;
    iktThreeFC = pThreeFC.center.y;
    ikFourFC = pFourFC.center.x;
    iktFourFC = pFourFC.center.y;
    ikFiveFC = pFiveFC.center.x;
    iktFiveFC = pFiveFC.center.y;
    ikSixFC = pSixFC.center.x;
    iktSixFC = pSixFC.center.y;
    ikSevenFC = pSevenFC.center.x;
    iktSevenFC = pSevenFC.center.y;
    ikEightFC = pEightFC.center.x;
    iktEightFC = pEightFC.center.y;
    ikNineFC = pNineFC.center.x;
    iktNineFC = pNineFC.center.y;
    ikTenFC = pTenFC.center.x;
    iktTenFC = pTenFC.center.y;
    ikElevenFC = pElevenFC.center.x;
    iktElevenFC = pElevenFC.center.y;
    ikTwelveFC = pTwelveFC.center.x;
    iktTwelveFC = pTwelveFC.center.y;
    ikThirteenFC = pThirteenFC.center.x;
    iktThirteenFC = pThirteenFC.center.y;
    ikFourteenFC = pFourteenFC.center.x;
    iktFourteenFC = pFourteenFC.center.y;
    ikFithteenFC = pFithteenFC.center.x;
    iktFithteenFC = pFithteenFC.center.y;
    ikSixteenFC = pSixteenFC.center.x;
    iktSixteenFC = pSixteenFC.center.y;
    
    kOneFC = 'a';
    kTwoFC = 'b';
    kThreeFC = 'c';
    kFourFC = 'd';
    kFiveFC = 'e';
    kSixFC = 'f';
    kSevenFC = 'g';
    kEightFC = 'h';
    kNineFC = 'i';
    kTenFC = 'j';
    kElevenFC = 'k';
    kTwelveFC = 'l';
    kThirteenFC = 'm';
    kFourteenFC = 'n';
    kFithteenFC = 'o';
    kSixteenFC = 'p';
    kSeventeenFC = 'q';
    kEighteenFC = 'r';
    kNineteenFC = 's';
    kTwentyFC = 't';
    kTwentyOneFC = 'u';
    kTwentyTwoFC = 'v';
    kTwentyThreeFC = 'w';
    kTwentyFourFC = 'x';
    kTwentyFiveFC = 'y';
    kTwentySixFC = 'z';

    CGPoint midPoint;
    midPoint.x = ((pSevenFC.center.x + pSixFC.center.x) / 2);
    midPoint.y = ((pSixFC.center.y + pTenFC.center.y) / 2);
    
    spOneFC.center = CGPointMake(midPoint.x, midPoint.y);
    spTwoFC.center = CGPointMake(midPoint.x, midPoint.y);
    spThreeFC.center = CGPointMake(midPoint.x, midPoint.y);
    spFourFC.center = CGPointMake(midPoint.x, midPoint.y);
    spFiveFC.center = CGPointMake(midPoint.x, midPoint.y);
    spSixFC.center = CGPointMake(midPoint.x, midPoint.y);
    spSevenFC.center = CGPointMake(midPoint.x, midPoint.y);
    spEightFC.center = CGPointMake(midPoint.x, midPoint.y);
    spNineFC.center = CGPointMake(midPoint.x, midPoint.y);
    spTenFC.center = CGPointMake(midPoint.x, midPoint.y);
    spElevenFC.center = CGPointMake(midPoint.x, midPoint.y);
    spTwelveFC.center = CGPointMake(midPoint.x, midPoint.y);
    spThirteenFC.center = CGPointMake(midPoint.x, midPoint.y);
    spFourteenFC.center = CGPointMake(midPoint.x, midPoint.y);
    spFithteenFC.center = CGPointMake(midPoint.x, midPoint.y);
    spSixteenFC.center = CGPointMake(midPoint.x, midPoint.y);
    PauseDisplayFC.backgroundColor = [UIColor blackColor];
    BOOL HomeFQ = NO;
    [[NSUserDefaults standardUserDefaults] setBool:HomeFQ forKey:@"IsItComingInFromHomeScreen"];
    
        tHomeFC.alpha = 1;
        gOneFC.alpha = 1;
        gTwoFC.alpha = 1;
        gThreeFC.alpha = 1;
        BBSelectionFC.alpha =1;

    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneFc = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoFC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SoundSwipeFC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
    [self performSelector:@selector(Opening) withObject:nil afterDelay:0.1];
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
        
        pOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(33, 220, 60, 60)];
        pTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(98, 220, 60, 60)];
        pThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(163, 220, 60, 60)];
        pFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(228, 220, 60, 60)];
        pFiveFC = [[UIImageView alloc] initWithFrame:CGRectMake(33, 285, 60, 60)];
        pSixFC = [[UIImageView alloc] initWithFrame:CGRectMake(98, 285, 60, 60)];
        pSevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(163, 285, 60, 60)];
        pEightFC = [[UIImageView alloc] initWithFrame:CGRectMake(228, 285, 60, 60)];
        pNineFC = [[UIImageView alloc] initWithFrame:CGRectMake(33, 350, 60, 60)];
        pTenFC = [[UIImageView alloc] initWithFrame:CGRectMake(98, 350, 60, 60)];
        pElevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(163, 350, 60, 60)];
        pTwelveFC = [[UIImageView alloc] initWithFrame:CGRectMake(228, 350, 60, 60)];
        pThirteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(33, 415, 60, 60)];
        pFourteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(98, 415, 60, 60)];
        pFithteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(163, 415, 60, 60)];
        pSixteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(228, 415, 60, 60)];

        BackGroundOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        SenderDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 136, 45)];
        TotalAmountFC = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 131, 38)];
        TotalAmountFC.font = [[TotalAmountFC font] fontWithSize:15];
        PauseFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckFC = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordFC = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordFC = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordFC.font  = [[TheCurrentWordFC font] fontWithSize:15];
        
        tHomeFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneFC = [[UIButton alloc] initWithFrame:CGRectMake(87, 434, 40, 40)];
        gTwoFC = [[UIButton alloc] initWithFrame:CGRectMake(140, 434, 40, 40)];
        gThreeFC = [[UIButton alloc] initWithFrame:CGRectMake(193, 434, 40, 40)];
        BBSelectionFC = [[UIImageView alloc] initWithFrame:CGRectMake(189, 430, 48, 48)];
        
        PlayFC = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeFC = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsFC = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsFC.font  = [[CurrentWordsFC font] fontWithSize:20];
        
        StartFC = [[UIButton alloc] initWithFrame:CGRectMake(110, 85, 98, 40)];
        ErrorMessageFC = [[UILabel alloc] initWithFrame:CGRectMake(94, 32, 173, 45)];
        ErrorMessageFC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 155, 50)];
        TotalAmountFC = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 150, 36)];
        TotalAmountFC.font = [[TotalAmountFC font] fontWithSize:20];
        PauseFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckFC = [[UIButton alloc] initWithFrame:CGRectMake(60, 130, 200, 40)];
        BarUnderWordFC = [[UIImageView alloc] initWithFrame:CGRectMake(40, 228, 240, 2)];
        TheCurrentWordFC = [[UILabel alloc] initWithFrame:CGRectMake(108, 197, 104, 28)];
        TheCurrentWordFC.font  = [[TheCurrentWordFC font] fontWithSize:25];
        
        tHomeFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneFC = [[UIButton alloc] initWithFrame:CGRectMake(89, 520, 40, 40)];
        gTwoFC = [[UIButton alloc] initWithFrame:CGRectMake(139, 520, 40, 40)];
        gThreeFC = [[UIButton alloc] initWithFrame:CGRectMake(192, 520, 40, 40)];
        BBSelectionFC = [[UIImageView alloc] initWithFrame:CGRectMake(189, 517, 46, 46)];
        
        pOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(5, 238, 70, 70)];
        pTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(85, 238, 70, 70)];
        pThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(165, 238, 70, 70)];
        pFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(245, 238, 70, 70)];
        pFiveFC = [[UIImageView alloc] initWithFrame:CGRectMake(5, 318, 70, 70)];
        pSixFC = [[UIImageView alloc] initWithFrame:CGRectMake(85, 318, 70, 70)];
        pSevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(165, 318, 70, 70)];
        pEightFC = [[UIImageView alloc] initWithFrame:CGRectMake(245, 318, 70, 70)];
        pNineFC = [[UIImageView alloc] initWithFrame:CGRectMake(5, 398, 70, 70)];
        pTenFC = [[UIImageView alloc] initWithFrame:CGRectMake(85, 398, 70, 70)];
        pElevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(165, 398, 70, 70)];
        pTwelveFC = [[UIImageView alloc] initWithFrame:CGRectMake(245, 398, 70, 70)];
        pThirteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(5, 478, 70, 70)];
        pFourteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(85, 478, 70, 70)];
        pFithteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(165, 478, 70, 70)];
        pSixteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(245, 478, 70, 70)];
        
        BackGroundOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        PlayFC = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeFC = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsFC = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsFC.font  = [[CurrentWordsFC font] fontWithSize:20];
        
        StartFC = [[UIButton alloc] initWithFrame:CGRectMake(110, 130, 100, 50)];
        ErrorMessageFC = [[UILabel alloc] initWithFrame:CGRectMake(34, 60, 260, 90)];
        ErrorMessageFC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneFC = [[UIButton alloc] initWithFrame:CGRectMake(107, 602, 45, 45)];
        gTwoFC = [[UIButton alloc] initWithFrame:CGRectMake(165, 602, 45, 45)];
        gThreeFC = [[UIButton alloc] initWithFrame:CGRectMake(223, 602, 45, 45)];
        BBSelectionFC = [[UIImageView alloc] initWithFrame:CGRectMake(220, 599, 51, 51)];
        
        BackGroundOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        PlayFC = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeFC = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsFC = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsFC.font = [[CurrentWordsFC font] fontWithSize:25];
        
        pOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(12, 297, 80, 80)];
        pTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(102, 297, 80, 80)];
        pThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(192, 297, 80, 80)];
        pFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(282, 297, 80, 80)];
        pFiveFC = [[UIImageView alloc] initWithFrame:CGRectMake(12, 387, 80, 80)];
        pSixFC = [[UIImageView alloc] initWithFrame:CGRectMake(102, 387, 80, 80)];
        pSevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(192, 387, 80, 80)];
        pEightFC = [[UIImageView alloc] initWithFrame:CGRectMake(282, 387, 80, 80)];
        pNineFC = [[UIImageView alloc] initWithFrame:CGRectMake(12, 477, 80, 80)];
        pTenFC = [[UIImageView alloc] initWithFrame:CGRectMake(102, 477, 80, 80)];
        pElevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(192, 477, 80, 80)];
        pTwelveFC = [[UIImageView alloc] initWithFrame:CGRectMake(282, 477, 80, 80)];
        pThirteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(12, 567, 80, 80)];
        pFourteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(102, 567, 80, 80)];
        pFithteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(192, 567, 80, 80)];
        pSixteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(282, 567, 80, 80)];
        
        BarUnderWordFC = [[UIImageView alloc] initWithFrame:CGRectMake(67, 287, 240, 2)];
        TheCurrentWordFC = [[UILabel alloc] initWithFrame:CGRectMake(123, 254, 128, 35)];
        CheckFC = [[UIButton alloc] initWithFrame:CGRectMake(82, 174, 210, 45)];
        SenderDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 182, 50)];
        TotalAmountFC = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 124, 42)];
        PauseFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWordFC.font  = [[TheCurrentWordFC font] fontWithSize:25];
        TotalAmountFC.font = [[TotalAmountFC font] fontWithSize:22];
        
        StartFC = [[UIButton alloc] initWithFrame:CGRectMake(128, 175, 119, 56)];
        ErrorMessageFC = [[UILabel alloc] initWithFrame:CGRectMake(82, 99, 225, 68)];
        ErrorMessageFC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneFC = [[UIButton alloc] initWithFrame:CGRectMake(127, 687, 45, 45)];
        gTwoFC = [[UIButton alloc] initWithFrame:CGRectMake(185, 687, 45, 45)];
        gThreeFC = [[UIButton alloc] initWithFrame:CGRectMake(243, 687, 45, 45)];
        BBSelectionFC = [[UIImageView alloc] initWithFrame:CGRectMake(240, 684, 51, 51)];
        
        PlayFC = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeFC = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsFC = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsFC.font = [[CurrentWordsFC font] fontWithSize:25];
        
        BarUnderWordFC = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordFC = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckFC = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayFC = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmountFC = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        PauseFC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWordFC.font  = [[TheCurrentWordFC font] fontWithSize:25];
        TotalAmountFC.font = [[TotalAmountFC font] fontWithSize:25];
        
        pOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(30, 376, 85, 85)];
        pTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(120, 376, 85, 85)];
        pThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(210, 376, 85, 85)];
        pFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(300, 376, 85, 85)];
        pFiveFC = [[UIImageView alloc] initWithFrame:CGRectMake(30, 466, 85, 85)];
        pSixFC = [[UIImageView alloc] initWithFrame:CGRectMake(120, 466, 85, 85)];
        pSevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(210, 466, 85, 85)];
        pEightFC = [[UIImageView alloc] initWithFrame:CGRectMake(300, 466, 85, 85)];
        pNineFC = [[UIImageView alloc] initWithFrame:CGRectMake(30, 556, 85, 85)];
        pTenFC = [[UIImageView alloc] initWithFrame:CGRectMake(120, 556, 85, 85)];
        pElevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(210, 556, 85, 85)];
        pTwelveFC = [[UIImageView alloc] initWithFrame:CGRectMake(300, 556, 85, 85)];
        pThirteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(30, 646, 85, 85)];
        pFourteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(120, 646, 85, 85)];
        pFithteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(210, 646, 85, 85)];
        pSixteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(300, 646, 85, 85)];
        
        StartFC = [[UIButton alloc] initWithFrame:CGRectMake(147, 255, 120, 56)];
        ErrorMessageFC = [[UILabel alloc] initWithFrame:CGRectMake(16, 166, 382, 81)];
        ErrorMessageFC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
    }
    
    spOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spFiveFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spSixFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spSevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spEightFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spNineFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spTenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spElevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spTwelveFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spThirteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spFourteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spFithteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    spSixteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x, pOneFC.center.y, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    
    [self.view addSubview:BackGroundOneFC];
    
    [PlayFC setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeFC setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayFC addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeFC addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayFC.showsTouchWhenHighlighted = YES;
    HomeFC.showsTouchWhenHighlighted = YES;
    PlayFC.adjustsImageWhenHighlighted = NO;
    HomeFC.adjustsImageWhenHighlighted = NO;
    CurrentWordsFC.text = @"CURRENT WORDS";
    CurrentWordsFC.textColor = [UIColor whiteColor];
    CurrentWordsFC.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplayFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:HomeFC aboveSubview:PauseDisplayFC];
    [self.view insertSubview:PlayFC aboveSubview:PauseDisplayFC];
    [self.view insertSubview:CurrentWordsFC aboveSubview:PauseDisplayFC];
    
    BarUnderWordFC.backgroundColor = [UIColor blackColor];
    TheCurrentWordFC.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordFC.textColor = [UIColor whiteColor];
    CheckFC.adjustsImageWhenHighlighted = NO;
    tHomeFC.adjustsImageWhenHighlighted = NO;
    tHomeFC.showsTouchWhenHighlighted = YES;
    gOneFC.showsTouchWhenHighlighted = YES;
    gTwoFC.showsTouchWhenHighlighted = YES;
    gThreeFC.showsTouchWhenHighlighted = YES;
    gOneFC.adjustsImageWhenHighlighted = NO;
    gTwoFC.adjustsImageWhenHighlighted = NO;
    gThreeFC.adjustsImageWhenHighlighted = NO;
    BBSelectionFC.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeFC setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [gOneFC setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoFC setImage:[UIImage imageNamed:@"BButtonThree.png"] forState:UIControlStateNormal];
    [gThreeFC setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckFC setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckFC addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseFC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHomeFC addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [PauseFC addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseFC.adjustsImageWhenHighlighted = NO;
    SenderDisplayFC.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountFC.textColor = [UIColor whiteColor];
    TotalAmountFC.textAlignment = NSTextAlignmentCenter;
    [gTwoFC addTarget:self action:@selector(gTwo:) forControlEvents:UIControlEventTouchUpInside];
    [gOneFC addTarget:self action:@selector(gOne:) forControlEvents:UIControlEventTouchUpInside];
    BackGroundTwoFC.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundThreeFC.image = [UIImage imageNamed:@"BackGroundTwo.png"];
    BackGroundOneFC.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourFC.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    StartFC.adjustsImageWhenDisabled = NO;
    ErrorMessageFC.numberOfLines = 2;
    ErrorMessageFC.textAlignment = NSTextAlignmentCenter;
    ErrorMessageFC.text = @"You have not given a box a value (Just tap on it)";
    [StartFC setImage:[UIImage imageNamed:@"Start.png"] forState:UIControlStateNormal];
    [StartFC addTarget:self action:@selector(StartTheGame:) forControlEvents:UIControlEventTouchUpInside];
    ErrorMessageFC.textColor = [UIColor blackColor];
    
    [self.view insertSubview:BackGroundTwoFC belowSubview:BackGroundOneFC];
    [self.view insertSubview:BackGroundThreeFC belowSubview:BackGroundOneFC];
    [self.view insertSubview:SenderDisplayFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:TotalAmountFC aboveSubview:SenderDisplayFC];
    [self.view insertSubview:PauseFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:CheckFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:BarUnderWordFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:TheCurrentWordFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pOneFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pTwoFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pThreeFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pFourFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pFiveFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pSixFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pSevenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pEightFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pNineFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:tHomeFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:gOneFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:gTwoFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:gThreeFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:BBSelectionFC aboveSubview:BackGroundOneFC];
    
    [self.view insertSubview:pOneFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pTwoFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pThreeFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pFourFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pFiveFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pSixFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pSevenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pEightFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pNineFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pTenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pElevenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pTwelveFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pThirteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pFourteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pFithteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:pSixteenFC aboveSubview:BackGroundOneFC];
    
    NSString *imageName = @"Blank.png";
    spOneFC.image = [UIImage imageNamed:imageName];
    spTwoFC.image = [UIImage imageNamed:imageName];
    spThreeFC.image = [UIImage imageNamed:imageName];
    spFourFC.image = [UIImage imageNamed:imageName];
    spFiveFC.image = [UIImage imageNamed:imageName];
    spSixFC.image = [UIImage imageNamed:imageName];
    spSevenFC.image = [UIImage imageNamed:imageName];
    spEightFC.image = [UIImage imageNamed:imageName];
    spNineFC.image = [UIImage imageNamed:imageName];
    spTenFC.image = [UIImage imageNamed:imageName];
    spElevenFC.image = [UIImage imageNamed:imageName];
    spTwelveFC.image = [UIImage imageNamed:imageName];
    spThirteenFC.image = [UIImage imageNamed:imageName];
    spFourteenFC.image = [UIImage imageNamed:imageName];
    spFithteenFC.image = [UIImage imageNamed:imageName];
    spSixteenFC.image = [UIImage imageNamed:imageName];
    
    [self.view insertSubview:spOneFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spTwoFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spThreeFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spFourFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spFiveFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spSixFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spSevenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spEightFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spNineFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spTenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spElevenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spTwelveFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spThirteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spFourteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spFithteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:spSixteenFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:StartFC aboveSubview:BackGroundOneFC];
    [self.view insertSubview:ErrorMessageFC aboveSubview:BackGroundOneFC];
    [self.view addSubview:BackGroundFourFC];
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
    [gOneFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gThreeFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        StartFC.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            StartFC.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                StartFC.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    spOneFC.alpha = 1;
    spTwoFC.alpha = 1;
    spThreeFC.alpha = 1;
    spFourFC.alpha = 1;
    spFiveFC.alpha = 1;
    spSixFC.alpha = 1;
    spSevenFC.alpha = 1;
    spEightFC.alpha = 1;
    spNineFC.alpha = 1;
    spTenFC.alpha = 1;
    spElevenFC.alpha = 1;
    spTwelveFC.alpha = 1;
    spThirteenFC.alpha = 1;
    spFourteenFC.alpha = 1;
    spFithteenFC.alpha = 1;
    spSixteenFC.alpha = 1;
    StartFC.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:1];
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        spOneFC.center = CGPointMake(ikOneFC, iktOneFC-50);
        spTwoFC.center = CGPointMake(ikTwoFC, iktTwoFC-50);
        spThreeFC.center = CGPointMake(ikThreeFC, iktThreeFC-50);
        spFourFC.center = CGPointMake(ikFourFC, iktFourFC-50);
        spFiveFC.center = CGPointMake(ikFiveFC, iktFiveFC-50);
        spSixFC.center = CGPointMake(ikSixFC, iktSixFC-50);
        spSevenFC.center = CGPointMake(ikSevenFC, iktSevenFC-50);
        spEightFC.center = CGPointMake(ikEightFC, iktEightFC-50);
        spNineFC.center = CGPointMake(ikNineFC, iktNineFC-50);
        spTenFC.center = CGPointMake(ikTenFC, iktTenFC-50);
        spElevenFC.center = CGPointMake(ikElevenFC, iktElevenFC-50);
        spTwelveFC.center = CGPointMake(ikTwelveFC, iktTwelveFC-50);
        spThirteenFC.center = CGPointMake(ikThirteenFC, iktThirteenFC-50);
        spFourteenFC.center = CGPointMake(ikFourteenFC, iktFourteenFC-50);
        spFithteenFC.center = CGPointMake(ikFithteenFC, iktFithteenFC-50);
        spSixteenFC.center = CGPointMake(ikSixteenFC, iktSixteenFC-50);
    } else {
        spOneFC.center = CGPointMake(ikOneFC, iktOneFC);
        spTwoFC.center = CGPointMake(ikTwoFC, iktTwoFC);
        spThreeFC.center = CGPointMake(ikThreeFC, iktThreeFC);
        spFourFC.center = CGPointMake(ikFourFC, iktFourFC);
        spFiveFC.center = CGPointMake(ikFiveFC, iktFiveFC);
        spSixFC.center = CGPointMake(ikSixFC, iktSixFC);
        spSevenFC.center = CGPointMake(ikSevenFC, iktSevenFC);
        spEightFC.center = CGPointMake(ikEightFC, iktEightFC);
        spNineFC.center = CGPointMake(ikNineFC, iktNineFC);
        spTenFC.center = CGPointMake(ikTenFC, iktTenFC);
        spElevenFC.center = CGPointMake(ikElevenFC, iktElevenFC);
        spTwelveFC.center = CGPointMake(ikTwelveFC, iktTwelveFC);
        spThirteenFC.center = CGPointMake(ikThirteenFC, iktThirteenFC);
        spFourteenFC.center = CGPointMake(ikFourteenFC, iktFourteenFC);
        spFithteenFC.center = CGPointMake(ikFithteenFC, iktFithteenFC);
        spSixteenFC.center = CGPointMake(ikSixteenFC, iktSixteenFC);
    }
    [UIView commitAnimations];
    [self SettingUpFuncionForButtons];
}

-(void)SettingUpFuncionForButtons
{
    [CheckFC addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [CheckFC addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckFC addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [PauseFC addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [PauseFC addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer *tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapOne:)];
    tapOne.cancelsTouchesInView = YES;
    tapOne.numberOfTapsRequired = 1;
    spOneFC.userInteractionEnabled = YES;
    [spOneFC addGestureRecognizer:tapOne];
    
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapTwo:)];
    tapTwo.cancelsTouchesInView = YES;
    tapTwo.numberOfTapsRequired = 1;
    spTwoFC.userInteractionEnabled = YES;
    [spTwoFC addGestureRecognizer:tapTwo];
    
    UITapGestureRecognizer *tapThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapThree:)];
    tapThree.cancelsTouchesInView = YES;
    tapThree.numberOfTapsRequired = 1;
    spThreeFC.userInteractionEnabled = YES;
    [spThreeFC addGestureRecognizer:tapThree];
    
    UITapGestureRecognizer *tapFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapFour:)];
    tapFour.cancelsTouchesInView = YES;
    tapFour.numberOfTapsRequired = 1;
    spFourFC.userInteractionEnabled = YES;
    [spFourFC addGestureRecognizer:tapFour];
    
    UITapGestureRecognizer *tapFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapFive:)];
    tapFive.cancelsTouchesInView = YES;
    tapFive.numberOfTapsRequired = 1;
    spFiveFC.userInteractionEnabled = YES;
    [spFiveFC addGestureRecognizer:tapFive];
    
    UITapGestureRecognizer *tapSix = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSix:)];
    tapSix.cancelsTouchesInView = YES;
    tapSix.numberOfTapsRequired = 1;
    spSixFC.userInteractionEnabled = YES;
    [spSixFC addGestureRecognizer:tapSix];
    
    UITapGestureRecognizer *tapSeven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSeven:)];
    tapSeven.cancelsTouchesInView = YES;
    tapSeven.numberOfTapsRequired = 1;
    spSevenFC.userInteractionEnabled = YES;
    [spSevenFC addGestureRecognizer:tapSeven];
    
    UITapGestureRecognizer *tapEight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapEight:)];
    tapEight.cancelsTouchesInView = YES;
    tapEight.numberOfTapsRequired = 1;
    spEightFC.userInteractionEnabled = YES;
    [spEightFC addGestureRecognizer:tapEight];
    
    UITapGestureRecognizer *tapNine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapNine:)];
    tapNine.cancelsTouchesInView = YES;
    tapNine.numberOfTapsRequired = 1;
    spNineFC.userInteractionEnabled = YES;
    [spNineFC addGestureRecognizer:tapNine];
    
    UITapGestureRecognizer *tapTen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapTen:)];
    tapTen.cancelsTouchesInView = YES;
    tapTen.numberOfTapsRequired = 1;
    spTenFC.userInteractionEnabled = YES;
    [spTenFC addGestureRecognizer:tapTen];
    
    UITapGestureRecognizer *tapEleven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapEleven:)];
    tapEleven.cancelsTouchesInView = YES;
    tapEleven.numberOfTapsRequired = 1;
    spElevenFC.userInteractionEnabled = YES;
    [spElevenFC addGestureRecognizer:tapEleven];
    
    UITapGestureRecognizer *tapTwelve = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapTwelve:)];
    tapTwelve.cancelsTouchesInView = YES;
    tapTwelve.numberOfTapsRequired = 1;
    spTwelveFC.userInteractionEnabled = YES;
    [spTwelveFC addGestureRecognizer:tapTwelve];
    
    UITapGestureRecognizer *tapThirteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapThirteen:)];
    tapThirteen.cancelsTouchesInView = YES;
    tapThirteen.numberOfTapsRequired = 1;
    spThirteenFC.userInteractionEnabled = YES;
    [spThirteenFC addGestureRecognizer:tapThirteen];
    
    UITapGestureRecognizer *tapFourteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapFourteen:)];
    tapFourteen.cancelsTouchesInView = YES;
    tapFourteen.numberOfTapsRequired = 1;
    spFourteenFC.userInteractionEnabled = YES;
    [spFourteenFC addGestureRecognizer:tapFourteen];
    
    UITapGestureRecognizer *tapFithteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapFithteen:)];
    tapFithteen.cancelsTouchesInView = YES;
    tapFithteen.numberOfTapsRequired = 1;
    spFithteenFC.userInteractionEnabled = YES;
    [spFithteenFC addGestureRecognizer:tapFithteen];
    
    UITapGestureRecognizer *tapSixteen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSixteen:)];
    tapSixteen.cancelsTouchesInView = YES;
    tapSixteen.numberOfTapsRequired = 1;
    spSixteenFC.userInteractionEnabled = YES;
    [spSixteenFC addGestureRecognizer:tapSixteen];
    
    [StartFC addTarget:self action:@selector(StartClicked) forControlEvents:UIControlEventTouchUpOutside];
    [StartFC addTarget:self action:@selector(StartClicked) forControlEvents:UIControlEventTouchUpInside];
    [StartFC addTarget:self action:@selector(StartClick) forControlEvents:UIControlEventTouchDown];
}

-(void)StartClicked
{
    [StartFC setImage:[UIImage imageNamed:@"Start.png"] forState:UIControlStateNormal];
    [SoundTwoFC play];
}

-(void)StartClick
{
    [StartFC setImage:[UIImage imageNamed:@"StartFlat.png"] forState:UIControlStateNormal];
    [SoundOneFc play];
}

-(void)TapOne: (UITapGestureRecognizer *)sender
{
    if (siOneFC == 0) {
        siOneFC = 1;
        spOneFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siOneFC == 1) {
        siOneFC = 2;
        spOneFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siOneFC == 2) {
        siOneFC = 1;
        spOneFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapTwo: (UITapGestureRecognizer *)sender
{
    if (siTwoFC == 0) {
        siTwoFC = 1;
        spTwoFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siTwoFC == 1) {
        siTwoFC = 2;
        spTwoFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siTwoFC == 2) {
        siTwoFC = 1;
        spTwoFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapThree: (UITapGestureRecognizer *)sender
{
    if (siThreeFC == 0) {
        siThreeFC = 1;
        spThreeFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siThreeFC == 1) {
        siThreeFC = 2;
        spThreeFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siThreeFC == 2) {
        siThreeFC = 1;
        spThreeFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapFour: (UITapGestureRecognizer *)sender
{
    if (siFourFC == 0) {
        siFourFC = 1;
        spFourFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siFourFC == 1) {
        siFourFC = 2;
        spFourFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siFourFC == 2) {
        siFourFC = 1;
        spFourFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapFive: (UITapGestureRecognizer *)sender
{
    if (siFiveFC == 0) {
        siFiveFC = 1;
        spFiveFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siFiveFC == 1) {
        siFiveFC = 2;
        spFiveFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siFiveFC == 2) {
        siFiveFC = 1;
        spFiveFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapSix: (UITapGestureRecognizer *)sender
{
    if (siSixFC == 0) {
        siSixFC = 1;
        spSixFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siSixFC == 1) {
        siSixFC = 2;
        spSixFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siSixFC == 2) {
        siSixFC = 1;
        spSixFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapSeven: (UITapGestureRecognizer *)sender
{
    if (siSevenFC == 0) {
        siSevenFC = 1;
        spSevenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siSevenFC == 1) {
        siSevenFC = 2;
        spSevenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siSevenFC == 2) {
        siSevenFC = 1;
        spSevenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapEight: (UITapGestureRecognizer *)sender
{
    if (siEightFC == 0) {
        siEightFC = 1;
        spEightFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siEightFC == 1) {
        siEightFC = 2;
        spEightFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siEightFC == 2) {
        siEightFC = 1;
        spEightFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapNine: (UITapGestureRecognizer *)sender
{
    if (siNineFC == 0) {
        siNineFC = 1;
        spNineFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siNineFC == 1) {
        siNineFC = 2;
        spNineFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siNineFC == 2) {
        siNineFC = 1;
        spNineFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapTen: (UITapGestureRecognizer *)sender
{
    if (siTenFC == 0) {
        siTenFC = 1;
        spTenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siTenFC == 1) {
        siTenFC = 2;
        spTenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siTenFC == 2) {
        siTenFC = 1;
        spTenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapEleven: (UITapGestureRecognizer *)sender
{
    if (siElevenFC == 0) {
        siElevenFC = 1;
        spElevenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siElevenFC == 1) {
        siElevenFC = 2;
        spElevenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siElevenFC == 2) {
        siElevenFC = 1;
        spElevenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapTwelve: (UITapGestureRecognizer *)sender
{
    if (siTwelveFC == 0) {
        siTwelveFC = 1;
        spTwelveFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siTwelveFC == 1) {
        siTwelveFC = 2;
        spTwelveFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siTwelveFC == 2) {
        siTwelveFC = 1;
        spTwelveFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapThirteen: (UITapGestureRecognizer *)sender
{
    if (siThirteenFC == 0) {
        siThirteenFC = 1;
        spThirteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siThirteenFC == 1) {
        siThirteenFC = 2;
        spThirteenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siThirteenFC == 2) {
        siThirteenFC = 1;
        spThirteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapFourteen: (UITapGestureRecognizer *)sender
{
    if (siFourteenFC == 0) {
        siFourteenFC = 1;
        spFourteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siFourteenFC == 1) {
        siFourteenFC = 2;
        spFourteenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siFourteenFC == 2) {
        siFourteenFC = 1;
        spFourteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapFithteen: (UITapGestureRecognizer *)sender
{
    if (siFithteenFC == 0) {
        siFithteenFC = 1;
        spFithteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siFithteenFC == 1) {
        siFithteenFC = 2;
        spFithteenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siFithteenFC == 2) {
        siFithteenFC = 1;
        spFithteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapSixteen: (UITapGestureRecognizer *)sender
{
    if (siSixteenFC == 0) {
        siSixteenFC = 1;
        spSixteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siSixteenFC == 1) {
        siSixteenFC = 2;
        spSixteenFC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siSixteenFC == 2) {
        siSixteenFC = 1;
        spSixteenFC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)PauseClicked
{
    [PauseFC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoFC play];
}

-(void)sPauseClicked
{
    [PauseFC setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOneFc play];
}

-(void)CheckClciked
{
    [CheckFC setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoFC play];
}

-(void)sCheckClicked
{
    [CheckFC setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneFc play];
}

-(IBAction)StartTheGame:(id)sender
{
    if (siOneFC == 0 || siTwoFC == 0  || siThreeFC == 0 || siFourFC == 0 || siFiveFC == 0 || siSixFC == 0 || siSevenFC == 0 || siEightFC == 0 || siNineFC == 0 || siTenFC == 0 || siElevenFC == 0 || siTwelveFC == 0 || siThirteenFC == 0 || siFourteenFC == 0 || siFithteenFC == 0 || siSixteenFC == 0) {
        ErrorMessageFC.alpha = 1;
        ErrorMessageFC.text = [NSString stringWithFormat:@"You have'nt gave some of the boxes a value (Just tap on it)"];
    } else if (siOneFC==1&&siTwoFC==1&&siThreeFC==1&&siFourFC==1&&siFiveFC==1&&siSixFC==1&&siSevenFC==1&&siEightFC==1&&siNineFC==1&&siTenFC==1&&siElevenFC==1&&siTwelveFC==1&&siThirteenFC==1&&siFourteenFC==1&&siFithteenFC==1&&siSixteenFC==1) {
        ErrorMessageFC.text = [NSString stringWithFormat:@"There are no four letter words with vowels only."];
        ErrorMessageFC.alpha = 1;
    } else if (siOneFC > 0 && siTwoFC > 0 && siThreeFC > 0 && siFourFC > 0 && siFiveFC > 0 && siSixFC > 0 && siSevenFC > 0 && siEightFC > 0 && siNineFC > 0 && siTenFC > 0 && siElevenFC > 0 && siTwelveFC > 0 && siThirteenFC > 0 && siFourteenFC > 0 && siFithteenFC > 0 && siSixteenFC > 0) {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        CGPoint midPoint;
        midPoint.x = ((pSevenFC.center.x + pSixFC.center.x) / 2);
        midPoint.y = ((pSixFC.center.y + pTenFC.center.y) / 2);
        
        spOneFC.center = CGPointMake(midPoint.x, midPoint.y);
        spTwoFC.center = CGPointMake(midPoint.x, midPoint.y);
        spThreeFC.center = CGPointMake(midPoint.x, midPoint.y);
        spFourFC.center = CGPointMake(midPoint.x, midPoint.y);
        spFiveFC.center = CGPointMake(midPoint.x, midPoint.y);
        spSixFC.center = CGPointMake(midPoint.x, midPoint.y);
        spSevenFC.center = CGPointMake(midPoint.x, midPoint.y);
        spEightFC.center = CGPointMake(midPoint.x, midPoint.y);
        spNineFC.center = CGPointMake(midPoint.x, midPoint.y);
        spTenFC.center = CGPointMake(midPoint.x, midPoint.y);
        spElevenFC.center = CGPointMake(midPoint.x, midPoint.y);
        spTwelveFC.center = CGPointMake(midPoint.x, midPoint.y);
        spThirteenFC.center = CGPointMake(midPoint.x, midPoint.y);
        spFourteenFC.center = CGPointMake(midPoint.x, midPoint.y);
        spFithteenFC.center = CGPointMake(midPoint.x, midPoint.y);
        spSixteenFC.center = CGPointMake(midPoint.x, midPoint.y);
        
        [gOneFC setAlpha:0];
        [gTwoFC setAlpha:0];
        [gThreeFC setAlpha:0];
        [BBSelectionFC setAlpha:0];
        [ErrorMessageFC setAlpha:0];
        [StartFC setAlpha:0];
        [tHomeFC setAlpha:0];
        [self GettingTheRightGrid];
        [UIView commitAnimations];
    }
}

-(void)GettingTheRightGrid
{
    TheAmountFC = 0;
    
    int pOneInt = 0, pTwoInt = 0, pThreeInt = 0, pFourInt = 0, pFiveInt = 0, pSixInt = 0, pSevenInt = 0, pEightInt = 0, pNineInt = 0, pTenInt = 0, pElevenInt = 0, pTwelveInt = 0, pThirteenInt = 0, pFourteenInt = 0, pFithteenInt = 0, pSixteenInt = 0;
    
    int WordAmount[27];
    
    for (int i = 0; i <= 26; i++) {
        @autoreleasepool {
            WordAmount[i] = 0;
        }
    }
    
    if (siOneFC == 1) {
        int oneRandom = arc4random()%6;
        
        switch (oneRandom) {
            case 1:
                pOneInt = 1;
                WordAmount[1]++;
                cOneFC = kOneFC;
                break;
            case 2:
                pOneInt = 5;
                WordAmount[5]++;
                cOneFC = kFiveFC;
                break;
            case 3:
                pOneInt = 9;
                WordAmount[9]++;
                cOneFC = kNineFC;
                break;
            case 4:
                pOneInt = 15;
                WordAmount[15]++;
                cOneFC = kFithteenFC;
                break;
            case 5:
                pOneInt = 21;
                WordAmount[21]++;
                cOneFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siOneFC == 2) {
        int oneRandom = arc4random()%22;
        
        switch (oneRandom) {
            case 1:
                pOneInt = 2;
                WordAmount[2]++;
                cOneFC = kTwoFC;
                break;
            case 2:
                pOneInt = 3;
                WordAmount[3]++;
                cOneFC = kThreeFC;
                break;
            case 3:
                pOneInt = 4;
                WordAmount[4]++;
                cOneFC = kFourFC;
                break;
            case 4:
                pOneInt = 6;
                WordAmount[6]++;
                cOneFC = kSixFC;
                break;
            case 5:
                pOneInt = 7;
                WordAmount[7]++;
                cOneFC = kSevenFC;
                break;
            case 6:
                pOneInt = 8;
                WordAmount[8]++;
                cOneFC = kEightFC;
                break;
            case 7:
                pOneInt = 10;
                WordAmount[10]++;
                cOneFC = kTenFC;
                break;
            case 8:
                pOneInt = 11;
                WordAmount[11]++;
                cOneFC = kElevenFC;
                break;
            case 9:
                pOneInt = 12;
                WordAmount[12]++;
                cOneFC = kTwelveFC;
                break;
            case 10:
                pOneInt = 13;
                WordAmount[13]++;
                cOneFC = kThirteenFC;
                break;
            case 11:
                pOneInt = 14;
                WordAmount[14]++;
                cOneFC = kFourteenFC;
                break;
            case 12:
                pOneInt = 16;
                WordAmount[16]++;
                cOneFC = kSixteenFC;
                break;
            case 13:
                pOneInt = 17;
                WordAmount[17]++;
                cOneFC = kSeventeenFC;
                break;
            case 14:
                pOneInt = 18;
                WordAmount[18]++;
                cOneFC = kEighteenFC;
                break;
            case 15:
                pOneInt = 19;
                WordAmount[19]++;
                cOneFC = kNineteenFC;
                break;
            case 16:
                pOneInt = 20;
                WordAmount[20]++;
                cOneFC = kTwentyFC;
                break;
            case 17:
                pOneInt = 22;
                WordAmount[22]++;
                cOneFC = kTwentyTwoFC;
                break;
            case 18:
                pOneInt = 23;
                WordAmount[23]++;
                cOneFC = kTwentyThreeFC;
                break;
            case 19:
                pOneInt = 24;
                WordAmount[24]++;
                cOneFC = kTwentyFourFC;
                break;
            case 20:
                pOneInt = 25;
                WordAmount[25]++;
                cOneFC = kTwentyFiveFC;
                break;
            case 21:
                pOneInt = 26;
                WordAmount[26]++;
                cOneFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siTwoFC == 1) {
        int twoRandom = arc4random()%6;
        
        switch (twoRandom) {
            case 1:
                pTwoInt = 1;
                WordAmount[1]++;
                cTwoFC = kOneFC;
                break;
            case 2:
                pTwoInt = 5;
                WordAmount[5]++;
                cTwoFC = kFiveFC;
                break;
            case 3:
                pTwoInt = 9;
                WordAmount[9]++;
                cTwoFC = kNineFC;
                break;
            case 4:
                pTwoInt = 15;
                WordAmount[15]++;
                cTwoFC = kFithteenFC;
                break;
            case 5:
                pTwoInt = 21;
                WordAmount[21]++;
                cTwoFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siTwoFC == 2) {
        int twoRandom = arc4random()%22;
        
        switch (twoRandom) {
            case 1:
                pTwoInt = 2;
                WordAmount[2]++;
                cTwoFC = kTwoFC;
                break;
            case 2:
                pTwoInt = 3;
                WordAmount[3]++;
                cTwoFC = kThreeFC;
                break;
            case 3:
                pTwoInt = 4;
                WordAmount[4]++;
                cTwoFC = kFourFC;
                break;
            case 4:
                pTwoInt = 6;
                WordAmount[6]++;
                cTwoFC = kSixFC;
                break;
            case 5:
                pTwoInt = 7;
                WordAmount[7]++;
                cTwoFC = kSevenFC;
                break;
            case 6:
                pTwoInt = 8;
                WordAmount[8]++;
                cTwoFC = kEightFC;
                break;
            case 7:
                pTwoInt = 10;
                WordAmount[10]++;
                cTwoFC = kTenFC;
                break;
            case 8:
                pTwoInt = 11;
                WordAmount[11]++;
                cTwoFC = kElevenFC;
                break;
            case 9:
                pTwoInt = 12;
                WordAmount[12]++;
                cTwoFC = kTwelveFC;
                break;
            case 10:
                pTwoInt = 13;
                WordAmount[13]++;
                cTwoFC = kThirteenFC;
                break;
            case 11:
                pTwoInt = 14;
                WordAmount[14]++;
                cTwoFC = kFourteenFC;
                break;
            case 12:
                pTwoInt = 16;
                WordAmount[16]++;
                cTwoFC = kSixteenFC;
                break;
            case 13:
                pTwoInt = 17;
                WordAmount[17]++;
                cTwoFC = kSeventeenFC;
                break;
            case 14:
                pTwoInt = 18;
                WordAmount[18]++;
                cTwoFC = kEighteenFC;
                break;
            case 15:
                pTwoInt = 19;
                WordAmount[19]++;
                cTwoFC = kNineteenFC;
                break;
            case 16:
                pTwoInt = 20;
                WordAmount[20]++;
                cTwoFC = kTwentyFC;
                break;
            case 17:
                pTwoInt = 22;
                WordAmount[22]++;
                cTwoFC = kTwentyTwoFC;
                break;
            case 18:
                pTwoInt = 23;
                WordAmount[23]++;
                cTwoFC = kTwentyThreeFC;
                break;
            case 19:
                pTwoInt = 24;
                WordAmount[24]++;
                cTwoFC = kTwentyFourFC;
                break;
            case 20:
                pTwoInt = 25;
                WordAmount[25]++;
                cTwoFC = kTwentyFiveFC;
                break;
            case 21:
                pTwoInt = 26;
                WordAmount[26]++;
                cTwoFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siThreeFC == 1) {
        int threeRandom = arc4random()%6;
        
        switch (threeRandom) {
            case 1:
                pThreeInt = 1;
                WordAmount[1]++;
                cThreeFC = kOneFC;
                break;
            case 2:
                pThreeInt = 5;
                WordAmount[5]++;
                cThreeFC = kFiveFC;
                break;
            case 3:
                pThreeInt = 9;
                WordAmount[9]++;
                cThreeFC = kNineFC;
                break;
            case 4:
                pThreeInt = 15;
                WordAmount[15]++;
                cThreeFC = kFithteenFC;
                break;
            case 5:
                pThreeInt = 21;
                WordAmount[21]++;
                cThreeFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siThreeFC == 2) {
        int threeRandom = arc4random()%22;
        
        switch (threeRandom) {
            case 1:
                pThreeInt = 2;
                WordAmount[2]++;
                cThreeFC = kTwoFC;
                break;
            case 2:
                pThreeInt = 3;
                WordAmount[3]++;
                cThreeFC = kThreeFC;
                break;
            case 3:
                pThreeInt = 4;
                WordAmount[4]++;
                cThreeFC = kFourFC;
                break;
            case 4:
                pThreeInt = 6;
                WordAmount[6]++;
                cThreeFC = kSixFC;
                break;
            case 5:
                pThreeInt = 7;
                WordAmount[7]++;
                cThreeFC = kSevenFC;
                break;
            case 6:
                pThreeInt = 8;
                WordAmount[8]++;
                cThreeFC = kEightFC;
                break;
            case 7:
                pThreeInt = 10;
                WordAmount[10]++;
                cThreeFC = kTenFC;
                break;
            case 8:
                pThreeInt = 11;
                WordAmount[11]++;
                cThreeFC = kElevenFC;
                break;
            case 9:
                pThreeInt = 12;
                WordAmount[12]++;
                cThreeFC = kTwelveFC;
                break;
            case 10:
                pThreeInt = 13;
                WordAmount[13]++;
                cThreeFC = kThirteenFC;
                break;
            case 11:
                pThreeInt = 14;
                WordAmount[14]++;
                cThreeFC = kFourteenFC;
                break;
            case 12:
                pThreeInt = 16;
                WordAmount[16]++;
                cThreeFC = kSixteenFC;
                break;
            case 13:
                pThreeInt = 17;
                WordAmount[17]++;
                cThreeFC = kSeventeenFC;
                break;
            case 14:
                pThreeInt = 18;
                WordAmount[18]++;
                cThreeFC = kEighteenFC;
                break;
            case 15:
                pThreeInt = 19;
                WordAmount[19]++;
                cThreeFC = kNineteenFC;
                break;
            case 16:
                pThreeInt = 20;
                WordAmount[20]++;
                cThreeFC = kTwentyFC;
                break;
            case 17:
                pThreeInt = 22;
                WordAmount[22]++;
                cThreeFC = kTwentyTwoFC;
                break;
            case 18:
                pThreeInt = 23;
                WordAmount[23]++;
                cThreeFC = kTwentyThreeFC;
                break;
            case 19:
                pThreeInt = 24;
                WordAmount[24]++;
                cThreeFC = kTwentyFourFC;
                break;
            case 20:
                pThreeInt = 25;
                WordAmount[25]++;
                cThreeFC = kTwentyFiveFC;
                break;
            case 21:
                pThreeInt = 26;
                WordAmount[26]++;
                cThreeFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siFourFC == 1) {
        int fourRandom = arc4random()%6;
        
        switch (fourRandom) {
            case 1:
                pFourInt = 1;
                WordAmount[1]++;
                cFourFC = kOneFC;
                break;
            case 2:
                pFourInt = 5;
                WordAmount[5]++;
                cFourFC = kFiveFC;
                break;
            case 3:
                pFourInt = 9;
                WordAmount[9]++;
                cFourFC = kNineFC;
                break;
            case 4:
                pFourInt = 15;
                WordAmount[15]++;
                cFourFC = kFithteenFC;
                break;
            case 5:
                pFourInt = 21;
                WordAmount[21]++;
                cFourFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siFourFC == 2) {
        int fourRandom = arc4random()%22;
        
        switch (fourRandom) {
            case 1:
                pFourInt = 2;
                WordAmount[2]++;
                cFourFC = kTwoFC;
                break;
            case 2:
                pFourInt = 3;
                WordAmount[3]++;
                cFourFC = kThreeFC;
                break;
            case 3:
                pFourInt = 4;
                WordAmount[4]++;
                cFourFC = kFourFC;
                break;
            case 4:
                pFourInt = 6;
                WordAmount[6]++;
                cFourFC = kSixFC;
                break;
            case 5:
                pFourInt = 7;
                WordAmount[7]++;
                cFourFC = kSevenFC;
                break;
            case 6:
                pFourInt = 8;
                WordAmount[8]++;
                cFourFC = kEightFC;
                break;
            case 7:
                pFourInt = 10;
                WordAmount[10]++;
                cFourFC = kTenFC;
                break;
            case 8:
                pFourInt = 11;
                WordAmount[11]++;
                cFourFC = kElevenFC;
                break;
            case 9:
                pFourInt = 12;
                WordAmount[12]++;
                cFourFC = kTwelveFC;
                break;
            case 10:
                pFourInt = 13;
                WordAmount[13]++;
                cFourFC = kThirteenFC;
                break;
            case 11:
                pFourInt = 14;
                WordAmount[14]++;
                cFourFC = kFourteenFC;
                break;
            case 12:
                pFourInt = 16;
                WordAmount[16]++;
                cFourFC = kSixteenFC;
                break;
            case 13:
                pFourInt = 17;
                WordAmount[17]++;
                cFourFC = kSeventeenFC;
                break;
            case 14:
                pFourInt = 18;
                WordAmount[18]++;
                cFourFC = kEighteenFC;
                break;
            case 15:
                pFourInt = 19;
                WordAmount[19]++;
                cFourFC = kNineteenFC;
                break;
            case 16:
                pFourInt = 20;
                WordAmount[20]++;
                cFourFC = kTwentyFC;
                break;
            case 17:
                pFourInt = 22;
                WordAmount[22]++;
                cFourFC = kTwentyTwoFC;
                break;
            case 18:
                pFourInt = 23;
                WordAmount[23]++;
                cFourFC = kTwentyThreeFC;
                break;
            case 19:
                pFourInt = 24;
                WordAmount[24]++;
                cFourFC = kTwentyFourFC;
                break;
            case 20:
                pFourInt = 25;
                WordAmount[25]++;
                cFourFC = kTwentyFiveFC;
                break;
            case 21:
                pFourInt = 26;
                WordAmount[26]++;
                cFourFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siFiveFC == 1) {
        int fiveRandom = arc4random()%6;
        
        switch (fiveRandom) {
            case 1:
                pFiveInt = 1;
                WordAmount[1]++;
                cFiveFC = kOneFC;
                break;
            case 2:
                pFiveInt = 5;
                WordAmount[5]++;
                cFiveFC = kFiveFC;
                break;
            case 3:
                pFiveInt = 9;
                WordAmount[9]++;
                cFiveFC = kNineFC;
                break;
            case 4:
                pFiveInt = 15;
                WordAmount[15]++;
                cFiveFC = kFithteenFC;
                break;
            case 5:
                pFiveInt = 21;
                WordAmount[21]++;
                cFiveFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siFiveFC == 2) {
        int fiveRandom = arc4random()%22;
        
        switch (fiveRandom) {
            case 1:
                pFiveInt = 2;
                WordAmount[2]++;
                cFiveFC = kTwoFC;
                break;
            case 2:
                pFiveInt = 3;
                WordAmount[3]++;
                cFiveFC = kThreeFC;
                break;
            case 3:
                pFiveInt = 4;
                WordAmount[4]++;
                cFiveFC = kFourFC;
                break;
            case 4:
                pFiveInt = 6;
                WordAmount[6]++;
                cFiveFC = kSixFC;
                break;
            case 5:
                pFiveInt = 7;
                WordAmount[7]++;
                cFiveFC = kSevenFC;
                break;
            case 6:
                pFiveInt = 8;
                WordAmount[8]++;
                cFiveFC = kEightFC;
                break;
            case 7:
                pFiveInt = 10;
                WordAmount[10]++;
                cFiveFC = kTenFC;
                break;
            case 8:
                pFiveInt = 11;
                WordAmount[11]++;
                cFiveFC = kElevenFC;
                break;
            case 9:
                pFiveInt = 12;
                WordAmount[12]++;
                cFiveFC = kTwelveFC;
                break;
            case 10:
                pFiveInt = 13;
                WordAmount[13]++;
                cFiveFC = kThirteenFC;
                break;
            case 11:
                pFiveInt = 14;
                WordAmount[14]++;
                cFiveFC = kFourteenFC;
                break;
            case 12:
                pFiveInt = 16;
                WordAmount[16]++;
                cFiveFC = kSixteenFC;
                break;
            case 13:
                pFiveInt = 17;
                WordAmount[17]++;
                cFiveFC = kSeventeenFC;
                break;
            case 14:
                pFiveInt = 18;
                WordAmount[18]++;
                cFiveFC = kEighteenFC;
                break;
            case 15:
                pFiveInt = 19;
                WordAmount[19]++;
                cFiveFC = kNineteenFC;
                break;
            case 16:
                pFiveInt = 20;
                WordAmount[20]++;
                cFiveFC = kTwentyFC;
                break;
            case 17:
                pFiveInt = 22;
                WordAmount[22]++;
                cFiveFC = kTwentyTwoFC;
                break;
            case 18:
                pFiveInt = 23;
                WordAmount[23]++;
                cFiveFC = kTwentyThreeFC;
                break;
            case 19:
                pFiveInt = 24;
                WordAmount[24]++;
                cFiveFC = kTwentyFourFC;
                break;
            case 20:
                pFiveInt = 25;
                WordAmount[25]++;
                cFiveFC = kTwentyFiveFC;
                break;
            case 21:
                pFiveInt = 26;
                WordAmount[26]++;
                cFiveFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siSixFC == 1) {
        int sixRandom = arc4random()%6;
        
        switch (sixRandom) {
            case 1:
                pSixInt = 1;
                WordAmount[1]++;
                cSixFC = kOneFC;
                break;
            case 2:
                pSixInt = 5;
                WordAmount[5]++;
                cSixFC = kFiveFC;
                break;
            case 3:
                pSixInt = 9;
                WordAmount[9]++;
                cSixFC = kNineFC;
                break;
            case 4:
                pSixInt = 15;
                WordAmount[15]++;
                cSixFC = kFithteenFC;
                break;
            case 5:
                pSixInt = 21;
                WordAmount[21]++;
                cSixFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siSixFC == 2) {
        int sixRandom = arc4random()%22;
        
        switch (sixRandom) {
            case 1:
                pSixInt = 2;
                WordAmount[2]++;
                cSixFC = kTwoFC;
                break;
            case 2:
                pSixInt = 3;
                WordAmount[3]++;
                cSixFC = kThreeFC;
                break;
            case 3:
                pSixInt = 4;
                WordAmount[4]++;
                cSixFC = kFourFC;
                break;
            case 4:
                pSixInt = 6;
                WordAmount[6]++;
                cSixFC = kSixFC;
                break;
            case 5:
                pSixInt = 7;
                WordAmount[7]++;
                cSixFC = kSevenFC;
                break;
            case 6:
                pSixInt = 8;
                WordAmount[8]++;
                cSixFC = kEightFC;
                break;
            case 7:
                pSixInt = 10;
                WordAmount[10]++;
                cSixFC = kTenFC;
                break;
            case 8:
                pSixInt = 11;
                WordAmount[11]++;
                cSixFC = kElevenFC;
                break;
            case 9:
                pSixInt = 12;
                WordAmount[12]++;
                cSixFC = kTwelveFC;
                break;
            case 10:
                pSixInt = 13;
                WordAmount[13]++;
                cSixFC = kThirteenFC;
                break;
            case 11:
                pSixInt = 14;
                WordAmount[14]++;
                cSixFC = kFourteenFC;
                break;
            case 12:
                pSixInt = 16;
                WordAmount[16]++;
                cSixFC = kSixteenFC;
                break;
            case 13:
                pSixInt = 17;
                WordAmount[17]++;
                cSixFC = kSeventeenFC;
                break;
            case 14:
                pSixInt = 18;
                WordAmount[18]++;
                cSixFC = kEighteenFC;
                break;
            case 15:
                pSixInt = 19;
                WordAmount[19]++;
                cSixFC = kNineteenFC;
                break;
            case 16:
                pSixInt = 20;
                WordAmount[20]++;
                cSixFC = kTwentyFC;
                break;
            case 17:
                pSixInt = 22;
                WordAmount[22]++;
                cSixFC = kTwentyTwoFC;
                break;
            case 18:
                pSixInt = 23;
                WordAmount[23]++;
                cSixFC = kTwentyThreeFC;
                break;
            case 19:
                pSixInt = 24;
                WordAmount[24]++;
                cSixFC = kTwentyFourFC;
                break;
            case 20:
                pSixInt = 25;
                WordAmount[25]++;
                cSixFC = kTwentyFiveFC;
                break;
            case 21:
                pSixInt = 26;
                WordAmount[26]++;
                cSixFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siSevenFC == 1) {
        int sevenRandom = arc4random()%6;
        
        switch (sevenRandom) {
            case 1:
                pSevenInt = 1;
                WordAmount[1]++;
                cSevenFC = kOneFC;
                break;
            case 2:
                pSevenInt = 5;
                WordAmount[5]++;
                cSevenFC = kFiveFC;
                break;
            case 3:
                pSevenInt = 9;
                WordAmount[9]++;
                cSevenFC = kNineFC;
                break;
            case 4:
                pSevenInt = 15;
                WordAmount[15]++;
                cSevenFC = kFithteenFC;
                break;
            case 5:
                pSevenInt = 21;
                WordAmount[21]++;
                cSevenFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siSevenFC == 2) {
        int sevenRandom = arc4random()%22;
        
        switch (sevenRandom) {
            case 1:
                pSevenInt = 2;
                WordAmount[2]++;
                cSevenFC = kTwoFC;
                break;
            case 2:
                pSevenInt = 3;
                WordAmount[3]++;
                cSevenFC = kThreeFC;
                break;
            case 3:
                pSevenInt = 4;
                WordAmount[4]++;
                cSevenFC = kFourFC;
                break;
            case 4:
                pSevenInt = 6;
                WordAmount[6]++;
                cSevenFC = kSixFC;
                break;
            case 5:
                pSevenInt = 7;
                WordAmount[7]++;
                cSevenFC = kSevenFC;
                break;
            case 6:
                pSevenInt = 8;
                WordAmount[8]++;
                cSevenFC = kEightFC;
                break;
            case 7:
                pSevenInt = 10;
                WordAmount[10]++;
                cSevenFC = kTenFC;
                break;
            case 8:
                pSevenInt = 11;
                WordAmount[11]++;
                cSevenFC = kElevenFC;
                break;
            case 9:
                pSevenInt = 12;
                WordAmount[12]++;
                cSevenFC = kTwelveFC;
                break;
            case 10:
                pSevenInt = 13;
                WordAmount[13]++;
                cSevenFC = kThirteenFC;
                break;
            case 11:
                pSevenInt = 14;
                WordAmount[14]++;
                cSevenFC = kFourteenFC;
                break;
            case 12:
                pSevenInt = 16;
                WordAmount[16]++;
                cSevenFC = kSixteenFC;
                break;
            case 13:
                pSevenInt = 17;
                WordAmount[17]++;
                cSevenFC = kSeventeenFC;
                break;
            case 14:
                pSevenInt = 18;
                WordAmount[18]++;
                cSevenFC = kEighteenFC;
                break;
            case 15:
                pSevenInt = 19;
                WordAmount[19]++;
                cSevenFC = kNineteenFC;
                break;
            case 16:
                pSevenInt = 20;
                WordAmount[20]++;
                cSevenFC = kTwentyFC;
                break;
            case 17:
                pSevenInt = 22;
                WordAmount[22]++;
                cSevenFC = kTwentyTwoFC;
                break;
            case 18:
                pSevenInt = 23;
                WordAmount[23]++;
                cSevenFC = kTwentyThreeFC;
                break;
            case 19:
                pSevenInt = 24;
                WordAmount[24]++;
                cSevenFC = kTwentyFourFC;
                break;
            case 20:
                pSevenInt = 25;
                WordAmount[25]++;
                cSevenFC = kTwentyFiveFC;
                break;
            case 21:
                pSevenInt = 26;
                WordAmount[26]++;
                cSevenFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siEightFC == 1) {
        int eightRandom = arc4random()%6;
        
        switch (eightRandom) {
            case 1:
                pEightInt = 1;
                WordAmount[1]++;
                cEightFC = kOneFC;
                break;
            case 2:
                pEightInt = 5;
                WordAmount[5]++;
                cEightFC = kFiveFC;
                break;
            case 3:
                pEightInt = 9;
                WordAmount[9]++;
                cEightFC = kNineFC;
                break;
            case 4:
                pEightInt = 15;
                WordAmount[15]++;
                cEightFC = kFithteenFC;
                break;
            case 5:
                pEightInt = 21;
                WordAmount[21]++;
                cEightFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siEightFC == 2) {
        int eightRandom = arc4random()%22;
        
        switch (eightRandom) {
            case 1:
                pEightInt = 2;
                WordAmount[2]++;
                cEightFC = kTwoFC;
                break;
            case 2:
                pEightInt = 3;
                WordAmount[3]++;
                cEightFC = kThreeFC;
                break;
            case 3:
                pEightInt = 4;
                WordAmount[4]++;
                cEightFC = kFourFC;
                break;
            case 4:
                pEightInt = 6;
                WordAmount[6]++;
                cEightFC = kSixFC;
                break;
            case 5:
                pEightInt = 7;
                WordAmount[7]++;
                cEightFC = kSevenFC;
                break;
            case 6:
                pEightInt = 8;
                WordAmount[8]++;
                cEightFC = kEightFC;
                break;
            case 7:
                pEightInt = 10;
                WordAmount[10]++;
                cEightFC = kTenFC;
                break;
            case 8:
                pEightInt = 11;
                WordAmount[11]++;
                cEightFC = kElevenFC;
                break;
            case 9:
                pEightInt = 12;
                WordAmount[12]++;
                cEightFC = kTwelveFC;
                break;
            case 10:
                pEightInt = 13;
                WordAmount[13]++;
                cEightFC = kThirteenFC;
                break;
            case 11:
                pEightInt = 14;
                WordAmount[14]++;
                cEightFC = kFourteenFC;
                break;
            case 12:
                pEightInt = 16;
                WordAmount[16]++;
                cEightFC = kSixteenFC;
                break;
            case 13:
                pEightInt = 17;
                WordAmount[17]++;
                cEightFC = kSeventeenFC;
                break;
            case 14:
                pEightInt = 18;
                WordAmount[18]++;
                cEightFC = kEighteenFC;
                break;
            case 15:
                pEightInt = 19;
                WordAmount[19]++;
                cEightFC = kNineteenFC;
                break;
            case 16:
                pEightInt = 20;
                WordAmount[20]++;
                cEightFC = kTwentyFC;
                break;
            case 17:
                pEightInt = 22;
                WordAmount[22]++;
                cEightFC = kTwentyTwoFC;
                break;
            case 18:
                pEightInt = 23;
                WordAmount[23]++;
                cEightFC = kTwentyThreeFC;
                break;
            case 19:
                pEightInt = 24;
                WordAmount[24]++;
                cEightFC = kTwentyFourFC;
                break;
            case 20:
                pEightInt = 25;
                WordAmount[25]++;
                cEightFC = kTwentyFiveFC;
                break;
            case 21:
                pEightInt = 26;
                WordAmount[26]++;
                cEightFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siNineFC == 1) {
        int nineRandom = arc4random()%6;
        
        switch (nineRandom) {
            case 1:
                pNineInt = 1;
                WordAmount[1]++;
                cNineFC = kOneFC;
                break;
            case 2:
                pNineInt = 5;
                WordAmount[5]++;
                cNineFC = kFiveFC;
                break;
            case 3:
                pNineInt = 9;
                WordAmount[9]++;
                cNineFC = kNineFC;
                break;
            case 4:
                pNineInt = 15;
                WordAmount[15]++;
                cNineFC = kFithteenFC;
                break;
            case 5:
                pNineInt = 21;
                WordAmount[21]++;
                cNineFC = kTwentyOneFC;
                break;
            default:
                break;
        }
    } else if (siNineFC == 2) {
        int nineRandom = arc4random()%22;
        
        switch (nineRandom) {
            case 1:
                pNineInt = 2;
                WordAmount[2]++;
                cNineFC = kTwoFC;
                break;
            case 2:
                pNineInt = 3;
                WordAmount[3]++;
                cNineFC = kThreeFC;
                break;
            case 3:
                pNineInt = 4;
                WordAmount[4]++;
                cNineFC = kFourFC;
                break;
            case 4:
                pNineInt = 6;
                WordAmount[6]++;
                cNineFC = kSixFC;
                break;
            case 5:
                pNineInt = 7;
                WordAmount[7]++;
                cNineFC = kSevenFC;
                break;
            case 6:
                pNineInt = 8;
                WordAmount[8]++;
                cNineFC = kEightFC;
                break;
            case 7:
                pNineInt = 10;
                WordAmount[10]++;
                cNineFC = kTenFC;
                break;
            case 8:
                pNineInt = 11;
                WordAmount[11]++;
                cNineFC = kElevenFC;
                break;
            case 9:
                pNineInt = 12;
                WordAmount[12]++;
                cNineFC = kTwelveFC;
                break;
            case 10:
                pNineInt = 13;
                WordAmount[13]++;
                cNineFC = kThirteenFC;
                break;
            case 11:
                pNineInt = 14;
                WordAmount[14]++;
                cNineFC = kFourteenFC;
                break;
            case 12:
                pNineInt = 16;
                WordAmount[16]++;
                cNineFC = kSixteenFC;
                break;
            case 13:
                pNineInt = 17;
                WordAmount[17]++;
                cNineFC = kSeventeenFC;
                break;
            case 14:
                pNineInt = 18;
                WordAmount[18]++;
                cNineFC = kEighteenFC;
                break;
            case 15:
                pNineInt = 19;
                WordAmount[19]++;
                cNineFC = kNineteenFC;
                break;
            case 16:
                pNineInt = 20;
                WordAmount[20]++;
                cNineFC = kTwentyFC;
                break;
            case 17:
                pNineInt = 22;
                WordAmount[22]++;
                cNineFC = kTwentyTwoFC;
                break;
            case 18:
                pNineInt = 23;
                WordAmount[23]++;
                cNineFC = kTwentyThreeFC;
                break;
            case 19:
                pNineInt = 24;
                WordAmount[24]++;
                cNineFC = kTwentyFourFC;
                break;
            case 20:
                pNineInt = 25;
                WordAmount[25]++;
                cNineFC = kTwentyFiveFC;
                break;
            case 21:
                pNineInt = 26;
                WordAmount[26]++;
                cNineFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siTenFC == 1) {
        int tenRandom = arc4random()%6;
        
        switch (tenRandom) {
            case 1:
                pTenInt = 1;
                WordAmount[1]++;
                cTenFC = kOneFC;
                break;
            case 2:
                pTenInt = 5;
                WordAmount[5]++;
                cTenFC = kFiveFC;
                break;
            case 3:
                pTenInt = 9;
                WordAmount[9]++;
                cTenFC = kNineFC;
                break;
            case 4:
                pTenInt = 15;
                WordAmount[15]++;
                cTenFC = kFithteenFC;
                break;
            case 5:
                pTenInt = 21;
                WordAmount[21]++;
                cTenFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siTenFC == 2) {
        int tenRandom = arc4random()%22;
        
        switch (tenRandom) {
            case 1:
                pTenInt = 2;
                WordAmount[2]++;
                cTenFC = kTwoFC;
                break;
            case 2:
                pTenInt = 3;
                WordAmount[3]++;
                cTenFC = kThreeFC;
                break;
            case 3:
                pTenInt = 4;
                WordAmount[4]++;
                cTenFC = kFourFC;
                break;
            case 4:
                pTenInt = 6;
                WordAmount[6]++;
                cTenFC = kSixFC;
                break;
            case 5:
                pTenInt = 7;
                WordAmount[7]++;
                cTenFC = kSevenFC;
                break;
            case 6:
                pTenInt = 8;
                WordAmount[8]++;
                cTenFC = kEightFC;
                break;
            case 7:
                pTenInt = 10;
                WordAmount[10]++;
                cTenFC = kTenFC;
                break;
            case 8:
                pTenInt = 11;
                WordAmount[11]++;
                cTenFC = kElevenFC;
                break;
            case 9:
                pTenInt = 12;
                WordAmount[12]++;
                cTenFC = kTwelveFC;
                break;
            case 10:
                pTenInt = 13;
                WordAmount[13]++;
                cTenFC = kThirteenFC;
                break;
            case 11:
                pTenInt = 14;
                WordAmount[14]++;
                cTenFC = kFourteenFC;
                break;
            case 12:
                pTenInt = 16;
                WordAmount[16]++;
                cTenFC = kSixteenFC;
                break;
            case 13:
                pTenInt = 17;
                WordAmount[17]++;
                cTenFC = kSeventeenFC;
                break;
            case 14:
                pTenInt = 18;
                WordAmount[18]++;
                cTenFC = kEighteenFC;
                break;
            case 15:
                pTenInt = 19;
                WordAmount[19]++;
                cTenFC = kNineteenFC;
                break;
            case 16:
                pTenInt = 20;
                WordAmount[20]++;
                cTenFC = kTwentyFC;
                break;
            case 17:
                pTenInt = 22;
                WordAmount[22]++;
                cTenFC = kTwentyTwoFC;
                break;
            case 18:
                pTenInt = 23;
                WordAmount[23]++;
                cTenFC = kTwentyThreeFC;
                break;
            case 19:
                pTenInt = 24;
                WordAmount[24]++;
                cTenFC = kTwentyFourFC;
                break;
            case 20:
                pTenInt = 25;
                WordAmount[25]++;
                cTenFC = kTwentyFiveFC;
                break;
            case 21:
                pTenInt = 26;
                WordAmount[26]++;
                cTenFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siElevenFC == 1) {
        int elevenRandom = arc4random()%6;
        
        switch (elevenRandom) {
            case 1:
                pElevenInt = 1;
                WordAmount[1]++;
                cElevenFC = kOneFC;
                break;
            case 2:
                pElevenInt = 5;
                WordAmount[5]++;
                cElevenFC = kFiveFC;
                break;
            case 3:
                pElevenInt = 9;
                WordAmount[9]++;
                cElevenFC = kNineFC;
                break;
            case 4:
                pElevenInt = 15;
                WordAmount[15]++;
                cElevenFC = kFithteenFC;
                break;
            case 5:
                pElevenInt = 21;
                WordAmount[21]++;
                cElevenFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siElevenFC == 2) {
        int elevenRandom = arc4random()%22;
        
        switch (elevenRandom) {
            case 1:
                pElevenInt = 2;
                WordAmount[2]++;
                cElevenFC = kTwoFC;
                break;
            case 2:
                pElevenInt = 3;
                WordAmount[3]++;
                cElevenFC = kThreeFC;
                break;
            case 3:
                pElevenInt = 4;
                WordAmount[4]++;
                cElevenFC = kFourFC;
                break;
            case 4:
                pElevenInt = 6;
                WordAmount[6]++;
                cElevenFC = kSixFC;
                break;
            case 5:
                pElevenInt = 7;
                WordAmount[7]++;
                cElevenFC = kSevenFC;
                break;
            case 6:
                pElevenInt = 8;
                WordAmount[8]++;
                cElevenFC = kEightFC;
                break;
            case 7:
                pElevenInt = 10;
                WordAmount[10]++;
                cElevenFC = kTenFC;
                break;
            case 8:
                pElevenInt = 11;
                WordAmount[11]++;
                cElevenFC = kElevenFC;
                break;
            case 9:
                pElevenInt = 12;
                WordAmount[12]++;
                cElevenFC = kTwelveFC;
                break;
            case 10:
                pElevenInt = 13;
                WordAmount[13]++;
                cElevenFC = kThirteenFC;
                break;
            case 11:
                pElevenInt = 14;
                WordAmount[14]++;
                cElevenFC = kFourteenFC;
                break;
            case 12:
                pElevenInt = 16;
                WordAmount[16]++;
                cElevenFC = kSixteenFC;
                break;
            case 13:
                pElevenInt = 17;
                WordAmount[17]++;
                cElevenFC = kSeventeenFC;
                break;
            case 14:
                pElevenInt = 18;
                WordAmount[18]++;
                cElevenFC = kEighteenFC;
                break;
            case 15:
                pElevenInt = 19;
                WordAmount[19]++;
                cElevenFC = kNineteenFC;
                break;
            case 16:
                pElevenInt = 20;
                WordAmount[20]++;
                cElevenFC = kTwentyFC;
                break;
            case 17:
                pElevenInt = 22;
                WordAmount[22]++;
                cElevenFC = kTwentyTwoFC;
                break;
            case 18:
                pElevenInt = 23;
                WordAmount[23]++;
                cElevenFC = kTwentyThreeFC;
                break;
            case 19:
                pElevenInt = 24;
                WordAmount[24]++;
                cElevenFC = kTwentyFourFC;
                break;
            case 20:
                pElevenInt = 25;
                WordAmount[25]++;
                cElevenFC = kTwentyFiveFC;
                break;
            case 21:
                pElevenInt = 26;
                WordAmount[26]++;
                cElevenFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siTwelveFC == 1) {
        int twelveRandom = arc4random()%6;
        
        switch (twelveRandom) {
            case 1:
                pTwelveInt = 1;
                WordAmount[1]++;
                cTwelveFC = kOneFC;
                break;
            case 2:
                pTwelveInt = 5;
                WordAmount[5]++;
                cTwelveFC = kFiveFC;
                break;
            case 3:
                pTwelveInt = 9;
                WordAmount[9]++;
                cTwelveFC = kNineFC;
                break;
            case 4:
                pTwelveInt = 15;
                WordAmount[15]++;
                cTwelveFC = kFithteenFC;
                break;
            case 5:
                pTwelveInt = 21;
                WordAmount[21]++;
                cTwelveFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siTwelveFC == 2) {
        int twelveRandom = arc4random()%22;
        
        switch (twelveRandom) {
            case 1:
                pTwelveInt = 2;
                WordAmount[2]++;
                cTwelveFC = kTwoFC;
                break;
            case 2:
                pTwelveInt = 3;
                WordAmount[3]++;
                cTwelveFC = kThreeFC;
                break;
            case 3:
                pTwelveInt = 4;
                WordAmount[4]++;
                cTwelveFC = kFourFC;
                break;
            case 4:
                pTwelveInt = 6;
                WordAmount[6]++;
                cTwelveFC = kSixFC;
                break;
            case 5:
                pTwelveInt = 7;
                WordAmount[7]++;
                cTwelveFC = kSevenFC;
                break;
            case 6:
                pTwelveInt = 8;
                WordAmount[8]++;
                cTwelveFC = kEightFC;
                break;
            case 7:
                pTwelveInt = 10;
                WordAmount[10]++;
                cTwelveFC = kTenFC;
                break;
            case 8:
                pTwelveInt = 11;
                WordAmount[11]++;
                cTwelveFC = kElevenFC;
                break;
            case 9:
                pTwelveInt = 12;
                WordAmount[12]++;
                cTwelveFC = kTwelveFC;
                break;
            case 10:
                pTwelveInt = 13;
                WordAmount[13]++;
                cTwelveFC = kThirteenFC;
                break;
            case 11:
                pTwelveInt = 14;
                WordAmount[14]++;
                cTwelveFC = kFourteenFC;
                break;
            case 12:
                pTwelveInt = 16;
                WordAmount[16]++;
                cTwelveFC = kSixteenFC;
                break;
            case 13:
                pTwelveInt = 17;
                WordAmount[17]++;
                cTwelveFC = kSeventeenFC;
                break;
            case 14:
                pTwelveInt = 18;
                WordAmount[18]++;
                cTwelveFC = kEighteenFC;
                break;
            case 15:
                pTwelveInt = 19;
                WordAmount[19]++;
                cTwelveFC = kNineteenFC;
                break;
            case 16:
                pTwelveInt = 20;
                WordAmount[20]++;
                cTwelveFC = kTwentyFC;
                break;
            case 17:
                pTwelveInt = 22;
                WordAmount[22]++;
                cTwelveFC = kTwentyTwoFC;
                break;
            case 18:
                pTwelveInt = 23;
                WordAmount[23]++;
                cTwelveFC = kTwentyThreeFC;
                break;
            case 19:
                pTwelveInt = 24;
                WordAmount[24]++;
                cTwelveFC = kTwentyFourFC;
                break;
            case 20:
                pTwelveInt = 25;
                WordAmount[25]++;
                cTwelveFC = kTwentyFiveFC;
                break;
            case 21:
                pTwelveInt = 26;
                WordAmount[26]++;
                cTwelveFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siThirteenFC == 1) {
        int thirteenRandom = arc4random()%6;
        
        switch (thirteenRandom) {
            case 1:
                pThirteenInt = 1;
                WordAmount[1]++;
                cThirteenFC = kOneFC;
                break;
            case 2:
                pThirteenInt = 5;
                WordAmount[5]++;
                cThirteenFC = kFiveFC;
                break;
            case 3:
                pThirteenInt = 9;
                WordAmount[9]++;
                cThirteenFC = kNineFC;
                break;
            case 4:
                pThirteenInt = 15;
                WordAmount[15]++;
                cThirteenFC = kFithteenFC;
                break;
            case 5:
                pThirteenInt = 21;
                WordAmount[21]++;
                cThirteenFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siThirteenFC == 2) {
        int thirteenRandom = arc4random()%22;
        
        switch (thirteenRandom) {
            case 1:
                pThirteenInt = 2;
                WordAmount[2]++;
                cThirteenFC = kTwoFC;
                break;
            case 2:
                pThirteenInt = 3;
                WordAmount[3]++;
                cThirteenFC = kThreeFC;
                break;
            case 3:
                pThirteenInt = 4;
                WordAmount[4]++;
                cThirteenFC = kFourFC;
                break;
            case 4:
                pThirteenInt = 6;
                WordAmount[6]++;
                cThirteenFC = kSixFC;
                break;
            case 5:
                pThirteenInt = 7;
                WordAmount[7]++;
                cThirteenFC = kSevenFC;
                break;
            case 6:
                pThirteenInt = 8;
                WordAmount[8]++;
                cThirteenFC = kEightFC;
                break;
            case 7:
                pThirteenInt = 10;
                WordAmount[10]++;
                cThirteenFC = kTenFC;
                break;
            case 8:
                pThirteenInt = 11;
                WordAmount[11]++;
                cThirteenFC = kElevenFC;
                break;
            case 9:
                pThirteenInt = 12;
                WordAmount[12]++;
                cThirteenFC = kTwelveFC;
                break;
            case 10:
                pThirteenInt = 13;
                WordAmount[13]++;
                cThirteenFC = kThirteenFC;
                break;
            case 11:
                pThirteenInt = 14;
                WordAmount[14]++;
                cThirteenFC = kFourteenFC;
                break;
            case 12:
                pThirteenInt = 16;
                WordAmount[16]++;
                cThirteenFC = kSixteenFC;
                break;
            case 13:
                pThirteenInt = 17;
                WordAmount[17]++;
                cThirteenFC = kSeventeenFC;
                break;
            case 14:
                pThirteenInt = 18;
                WordAmount[18]++;
                cThirteenFC = kEighteenFC;
                break;
            case 15:
                pThirteenInt = 19;
                WordAmount[19]++;
                cThirteenFC = kNineteenFC;
                break;
            case 16:
                pThirteenInt = 20;
                WordAmount[20]++;
                cThirteenFC = kTwentyFC;
                break;
            case 17:
                pThirteenInt = 22;
                WordAmount[22]++;
                cThirteenFC = kTwentyTwoFC;
                break;
            case 18:
                pThirteenInt = 23;
                WordAmount[23]++;
                cThirteenFC = kTwentyThreeFC;
                break;
            case 19:
                pThirteenInt = 24;
                WordAmount[24]++;
                cThirteenFC = kTwentyFourFC;
                break;
            case 20:
                pThirteenInt = 25;
                WordAmount[25]++;
                cThirteenFC = kTwentyFiveFC;
                break;
            case 21:
                pThirteenInt = 26;
                WordAmount[26]++;
                cThirteenFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siFourteenFC == 1) {
        int fourteenRandom = arc4random()%6;
        
        switch (fourteenRandom) {
            case 1:
                pFourteenInt = 1;
                WordAmount[1]++;
                cFourteenFC = kOneFC;
                break;
            case 2:
                pFourteenInt = 5;
                WordAmount[5]++;
                cFourteenFC = kFiveFC;
                break;
            case 3:
                pFourteenInt = 9;
                WordAmount[9]++;
                cFourteenFC = kNineFC;
                break;
            case 4:
                pFourteenInt = 15;
                WordAmount[15]++;
                cFourteenFC = kFithteenFC;
                break;
            case 5:
                pFourteenInt = 21;
                WordAmount[21]++;
                cFourteenFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siFourteenFC == 2) {
        int fourteenRandom = arc4random()%22;
        
        switch (fourteenRandom) {
            case 1:
                pFourteenInt = 2;
                WordAmount[2]++;
                cFourteenFC = kTwoFC;
                break;
            case 2:
                pFourteenInt = 3;
                WordAmount[3]++;
                cFourteenFC = kThreeFC;
                break;
            case 3:
                pFourteenInt = 4;
                WordAmount[4]++;
                cFourteenFC = kFourFC;
                break;
            case 4:
                pFourteenInt = 6;
                WordAmount[6]++;
                cFourteenFC = kSixFC;
                break;
            case 5:
                pFourteenInt = 7;
                WordAmount[7]++;
                cFourteenFC = kSevenFC;
                break;
            case 6:
                pFourteenInt = 8;
                WordAmount[8]++;
                cFourteenFC = kEightFC;
                break;
            case 7:
                pFourteenInt = 10;
                WordAmount[10]++;
                cFourteenFC = kTenFC;
                break;
            case 8:
                pFourteenInt = 11;
                WordAmount[11]++;
                cFourteenFC = kElevenFC;
                break;
            case 9:
                pFourteenInt = 12;
                WordAmount[12]++;
                cFourteenFC = kTwelveFC;
                break;
            case 10:
                pFourteenInt = 13;
                WordAmount[13]++;
                cFourteenFC = kThirteenFC;
                break;
            case 11:
                pFourteenInt = 14;
                WordAmount[14]++;
                cFourteenFC = kFourteenFC;
                break;
            case 12:
                pFourteenInt = 16;
                WordAmount[16]++;
                cFourteenFC = kSixteenFC;
                break;
            case 13:
                pFourteenInt = 17;
                WordAmount[17]++;
                cFourteenFC = kSeventeenFC;
                break;
            case 14:
                pFourteenInt = 18;
                WordAmount[18]++;
                cFourteenFC = kEighteenFC;
                break;
            case 15:
                pFourteenInt = 19;
                WordAmount[19]++;
                cFourteenFC = kNineteenFC;
                break;
            case 16:
                pFourteenInt = 20;
                WordAmount[20]++;
                cFourteenFC = kTwentyFC;
                break;
            case 17:
                pFourteenInt = 22;
                WordAmount[22]++;
                cFourteenFC = kTwentyTwoFC;
                break;
            case 18:
                pFourteenInt = 23;
                WordAmount[23]++;
                cFourteenFC = kTwentyThreeFC;
                break;
            case 19:
                pFourteenInt = 24;
                WordAmount[24]++;
                cFourteenFC = kTwentyFourFC;
                break;
            case 20:
                pFourteenInt = 25;
                WordAmount[25]++;
                cFourteenFC = kTwentyFiveFC;
                break;
            case 21:
                pFourteenInt = 26;
                WordAmount[26]++;
                cFourteenFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siFithteenFC == 1) {
        int fithteenRandom = arc4random()%6;
        
        switch (fithteenRandom) {
            case 1:
                pFithteenInt = 1;
                WordAmount[1]++;
                cFithteenFC = kOneFC;
                break;
            case 2:
                pFithteenInt = 5;
                WordAmount[5]++;
                cFithteenFC = kFiveFC;
                break;
            case 3:
                pFithteenInt = 9;
                WordAmount[9]++;
                cFithteenFC = kNineFC;
                break;
            case 4:
                pFithteenInt = 15;
                WordAmount[15]++;
                cFithteenFC = kFithteenFC;
                break;
            case 5:
                pFithteenInt = 21;
                WordAmount[21]++;
                cFithteenFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siFithteenFC == 2) {
        int fithteenRandom = arc4random()%22;
        
        switch (fithteenRandom) {
            case 1:
                pFithteenInt = 2;
                WordAmount[2]++;
                cFithteenFC = kTwoFC;
                break;
            case 2:
                pFithteenInt = 3;
                WordAmount[3]++;
                cFithteenFC = kThreeFC;
                break;
            case 3:
                pFithteenInt = 4;
                WordAmount[4]++;
                cFithteenFC = kFourFC;
                break;
            case 4:
                pFithteenInt = 6;
                WordAmount[6]++;
                cFithteenFC = kSixFC;
                break;
            case 5:
                pFithteenInt = 7;
                WordAmount[7]++;
                cFithteenFC = kSevenFC;
                break;
            case 6:
                pFithteenInt = 8;
                WordAmount[8]++;
                cFithteenFC = kEightFC;
                break;
            case 7:
                pFithteenInt = 10;
                WordAmount[10]++;
                cFithteenFC = kTenFC;
                break;
            case 8:
                pFithteenInt = 11;
                WordAmount[11]++;
                cFithteenFC = kElevenFC;
                break;
            case 9:
                pFithteenInt = 12;
                WordAmount[12]++;
                cFithteenFC = kTwelveFC;
                break;
            case 10:
                pFithteenInt = 13;
                WordAmount[13]++;
                cFithteenFC = kThirteenFC;
                break;
            case 11:
                pFithteenInt = 14;
                WordAmount[14]++;
                cFithteenFC = kFourteenFC;
                break;
            case 12:
                pFithteenInt = 16;
                WordAmount[16]++;
                cFithteenFC = kSixteenFC;
                break;
            case 13:
                pFithteenInt = 17;
                WordAmount[17]++;
                cFithteenFC = kSeventeenFC;
                break;
            case 14:
                pFithteenInt = 18;
                WordAmount[18]++;
                cFithteenFC = kEighteenFC;
                break;
            case 15:
                pFithteenInt = 19;
                WordAmount[19]++;
                cFithteenFC = kNineteenFC;
                break;
            case 16:
                pFithteenInt = 20;
                WordAmount[20]++;
                cFithteenFC = kTwentyFC;
                break;
            case 17:
                pFithteenInt = 22;
                WordAmount[22]++;
                cFithteenFC = kTwentyTwoFC;
                break;
            case 18:
                pFithteenInt = 23;
                WordAmount[23]++;
                cFithteenFC = kTwentyThreeFC;
                break;
            case 19:
                pFithteenInt = 24;
                WordAmount[24]++;
                cFithteenFC = kTwentyFourFC;
                break;
            case 20:
                pFithteenInt = 25;
                WordAmount[25]++;
                cFithteenFC = kTwentyFiveFC;
                break;
            case 21:
                pFithteenInt = 26;
                WordAmount[26]++;
                cFithteenFC = kTwentySixFC;
                break;
            default:
                break;
        }
    }
    
    if (siSixteenFC == 1) {
        int sixteenRandom = arc4random()%6;
        
        switch (sixteenRandom) {
            case 1:
                pSixteenInt = 1;
                WordAmount[1]++;
                cSixteenFC = kOneFC;
                break;
            case 2:
                pSixteenInt = 5;
                WordAmount[5]++;
                cSixteenFC = kFiveFC;
                break;
            case 3:
                pSixteenInt = 9;
                WordAmount[9]++;
                cSixteenFC = kNineFC;
                break;
            case 4:
                pSixteenInt = 15;
                WordAmount[15]++;
                cSixteenFC = kFithteenFC;
                break;
            case 5:
                pSixteenInt = 21;
                WordAmount[21]++;
                cSixteenFC = kTwentyOneFC;
                break;
            default:
                break;
        }

    } else if (siSixteenFC == 2) {
        int sixteenRandom = arc4random()%22;
        
        switch (sixteenRandom) {
            case 1:
                pSixteenInt = 2;
                WordAmount[2]++;
                cSixteenFC = kTwoFC;
                break;
            case 2:
                pSixteenInt = 3;
                WordAmount[3]++;
                cSixteenFC = kThreeFC;
                break;
            case 3:
                pSixteenInt = 4;
                WordAmount[4]++;
                cSixteenFC = kFourFC;
                break;
            case 4:
                pSixteenInt = 6;
                WordAmount[6]++;
                cSixteenFC = kSixFC;
                break;
            case 5:
                pSixteenInt = 7;
                WordAmount[7]++;
                cSixteenFC = kSevenFC;
                break;
            case 6:
                pSixteenInt = 8;
                WordAmount[8]++;
                cSixteenFC = kEightFC;
                break;
            case 7:
                pSixteenInt = 10;
                WordAmount[10]++;
                cSixteenFC = kTenFC;
                break;
            case 8:
                pSixteenInt = 11;
                WordAmount[11]++;
                cSixteenFC = kElevenFC;
                break;
            case 9:
                pSixteenInt = 12;
                WordAmount[12]++;
                cSixteenFC = kTwelveFC;
                break;
            case 10:
                pSixteenInt = 13;
                WordAmount[13]++;
                cSixteenFC = kThirteenFC;
                break;
            case 11:
                pSixteenInt = 14;
                WordAmount[14]++;
                cSixteenFC = kFourteenFC;
                break;
            case 12:
                pSixteenInt = 16;
                WordAmount[16]++;
                cSixteenFC = kSixteenFC;
                break;
            case 13:
                pSixteenInt = 17;
                WordAmount[17]++;
                cSixteenFC = kSeventeenFC;
                break;
            case 14:
                pSixteenInt = 18;
                WordAmount[18]++;
                cSixteenFC = kEighteenFC;
                break;
            case 15:
                pSixteenInt = 19;
                WordAmount[19]++;
                cSixteenFC = kNineteenFC;
                break;
            case 16:
                pSixteenInt = 20;
                WordAmount[20]++;
                cSixteenFC = kTwentyFC;
                break;
            case 17:
                pSixteenInt = 22;
                WordAmount[22]++;
                cSixteenFC = kTwentyTwoFC;
                break;
            case 18:
                pSixteenInt = 23;
                WordAmount[23]++;
                cSixteenFC = kTwentyThreeFC;
                break;
            case 19:
                pSixteenInt = 24;
                WordAmount[24]++;
                cSixteenFC = kTwentyFourFC;
                break;
            case 20:
                pSixteenInt = 25;
                WordAmount[25]++;
                cSixteenFC = kTwentyFiveFC;
                break;
            case 21:
                pSixteenInt = 26;
                WordAmount[26]++;
                cSixteenFC = kTwentySixFC;
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
                if (WordAmount[i] == pFiveInt) {
                    z++;
                }
                if (WordAmount[i] == pSixInt) {
                    z++;
                }
                if (WordAmount[i] == pSevenInt) {
                    z++;
                }
                if (WordAmount[i] == pEightInt) {
                    z++;
                }
                if (WordAmount[i] == pNineInt) {
                    z++;
                }
                if (WordAmount[i] == pTenInt) {
                    z++;
                }
                if (WordAmount[i] == pElevenInt) {
                    z++;
                }
                if (WordAmount[i] == pTwelveInt) {
                    z++;
                }
                if (WordAmount[i] == pThirteenInt) {
                    z++;
                }
                if (WordAmount[i] == pFourteenInt) {
                    z++;
                }
                if (WordAmount[i] == pFithteenInt) {
                    z++;
                }
                if (WordAmount[i] == pSixteenInt) {
                    z++;
                }
            }
        }
    }
    
    NSString *letterOne, *letterTwo, *letterThree, *letterFour, *letterFive, *letterSix, *letterSeven, *letterEight, *letterNine, *letterTen, *letterEleven, *letterTwelve, *letterThirteen, *letterFourteen, *letterFithteen, *letterSixteen;
    
    letterOne = [NSString stringWithFormat:@"%c", cOneFC];
    letterOne = [letterOne capitalizedString];
    
    letterTwo = [NSString stringWithFormat:@"%c", cTwoFC];
    letterTwo = [letterTwo capitalizedString];
    
    letterThree = [NSString stringWithFormat:@"%c", cThreeFC];
    letterThree = [letterThree capitalizedString];
    
    letterFour = [NSString stringWithFormat:@"%c", cFourFC];
    letterFour = [letterFour capitalizedString];
    
    letterFive = [NSString stringWithFormat:@"%c", cFiveFC];
    letterFive = [letterFive capitalizedString];
    
    letterSix = [NSString stringWithFormat:@"%c", cSixFC];
    letterSix = [letterSix capitalizedString];
    
    letterSeven = [NSString stringWithFormat:@"%c", cSevenFC];
    letterSeven = [letterSeven capitalizedString];
    
    letterEight = [NSString stringWithFormat:@"%c", cEightFC];
    letterEight = [letterEight capitalizedString];
    
    letterNine = [NSString stringWithFormat:@"%c", cNineFC];
    letterNine = [letterNine capitalizedString];
    
    letterTen = [NSString stringWithFormat:@"%c", cTenFC];
    letterTen = [letterTen capitalizedString];
    
    letterEleven = [NSString stringWithFormat:@"%c", cElevenFC];
    letterEleven = [letterEleven capitalizedString];
    
    letterTwelve = [NSString stringWithFormat:@"%c", cTwelveFC];
    letterTwelve = [letterTwelve capitalizedString];
    
    letterThirteen = [NSString stringWithFormat:@"%c", cThirteenFC];
    letterThirteen = [letterThirteen capitalizedString];
    
    letterFourteen = [NSString stringWithFormat:@"%c", cFourteenFC];
    letterFourteen = [letterFourteen capitalizedString];
    
    letterFithteen = [NSString stringWithFormat:@"%c", cFithteenFC];
    letterFithteen = [letterFithteen capitalizedString];
    
    letterSixteen = [NSString stringWithFormat:@"%c", cSixteenFC];
    letterSixteen = [letterSixteen capitalizedString];
    
    NSString *imgNameOne = [NSString stringWithFormat:@"%@.png", letterOne];
    pOneFC.image = [UIImage imageNamed:imgNameOne];
    
    NSString *imgNameTwo = [NSString stringWithFormat:@"%@.png", letterTwo];
    pTwoFC.image = [UIImage imageNamed:imgNameTwo];
    
    NSString *imgNameThree = [NSString stringWithFormat:@"%@.png", letterThree];
    pThreeFC.image = [UIImage imageNamed:imgNameThree];
    
    NSString *imgNameFour = [NSString stringWithFormat:@"%@.png", letterFour];
    pFourFC.image = [UIImage imageNamed:imgNameFour];
    
    NSString *imgNameFive = [NSString stringWithFormat:@"%@.png", letterFive];
    pFiveFC.image = [UIImage imageNamed:imgNameFive];
    
    NSString *imgNameSix = [NSString stringWithFormat:@"%@.png", letterSix];
    pSixFC.image = [UIImage imageNamed:imgNameSix];
    
    NSString *imgNameSeven = [NSString stringWithFormat:@"%@.png", letterSeven];
    pSevenFC.image = [UIImage imageNamed:imgNameSeven];
    
    NSString *imgNameEight = [NSString stringWithFormat:@"%@.png", letterEight];
    pEightFC.image = [UIImage imageNamed:imgNameEight];
    
    NSString *imgNameNine = [NSString stringWithFormat:@"%@.png", letterNine];
    pNineFC.image = [UIImage imageNamed:imgNameNine];
    
    NSString *imgNameTen = [NSString stringWithFormat:@"%@.png", letterTen];
    pTenFC.image = [UIImage imageNamed:imgNameTen];
    
    NSString *imgNameEleven = [NSString stringWithFormat:@"%@.png", letterEleven];
    pElevenFC.image = [UIImage imageNamed:imgNameEleven];
    
    NSString *imgNameTwelve = [NSString stringWithFormat:@"%@.png", letterTwelve];
    pTwelveFC.image = [UIImage imageNamed:imgNameTwelve];
    
    NSString *imgNameThirteen = [NSString stringWithFormat:@"%@.png", letterThirteen];
    pThirteenFC.image = [UIImage imageNamed:imgNameThirteen];
    
    NSString *imgNameFourteen = [NSString stringWithFormat:@"%@.png", letterFourteen];
    pFourteenFC.image = [UIImage imageNamed:imgNameFourteen];
    
    NSString *imgNameFithteen = [NSString stringWithFormat:@"%@.png", letterFithteen];
    pFithteenFC.image = [UIImage imageNamed:imgNameFithteen];
    
    NSString *imgNameSixteen = [NSString stringWithFormat:@"%@.png", letterSixteen];
    pSixteenFC.image = [UIImage imageNamed:imgNameSixteen];
    
    if (z > 4 || !cOneFC || !cTwoFC || !cThreeFC || !cFourFC || !cFiveFC || !cSixFC || !cSevenFC || !cEightFC || !cNineFC || !cTenFC || !cElevenFC || !cTwelveFC || !cThirteenFC || !cFourteenFC || !cFithteenFC || !cSixteenFC) {
        [self GettingTheRightGrid];
    } else {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                NSString *Word = [NSString stringWithFormat:@""];
                unichar One = [str characterAtIndex:0];
                unichar Two = [str characterAtIndex:1];
                unichar Three = [str characterAtIndex:2];
                unichar Four = [str characterAtIndex:3];
                BOOL Done[17];
                
                for (int i = 0; i <= 17; i++) {
                    @autoreleasepool {
                    Done[i] = NO;
                    }
                }
                
                if (One == cOneFC) {
                    Word = [NSString stringWithFormat:@"%c", cOneFC];
                    Done[1] = YES;
                } else if (One == cTwoFC) {
                    Word = [NSString stringWithFormat:@"%c", cTwoFC];
                    Done[2] = YES;
                } else if (One == cThreeFC) {
                    Word = [NSString stringWithFormat:@"%c", cThreeFC];
                    Done[3] = YES;
                } else if (One == cFourFC) {
                    Word = [NSString stringWithFormat:@"%c", cFourFC];
                    Done[4] = YES;
                } else if (One == cFiveFC) {
                    Word = [NSString stringWithFormat:@"%c", cFiveFC];
                    Done[5] = YES;
                } else if (One == cSixFC) {
                    Word = [NSString stringWithFormat:@"%c", cSixFC];
                    Done[6] = YES;
                } else if (One == cSevenFC) {
                    Word = [NSString stringWithFormat:@"%c", cSevenFC];
                    Done[7] = YES;
                } else if (One == cEightFC) {
                    Word = [NSString stringWithFormat:@"%c", cEightFC];
                    Done[8] = YES;
                } else if (One == cNineFC) {
                    Word = [NSString stringWithFormat:@"%c", cNineFC];
                    Done[9] = YES;
                } else if (One == cTenFC) {
                    Word = [NSString stringWithFormat:@"%c", cTenFC];
                    Done[10] = YES;
                } else if (One == cElevenFC) {
                    Word = [NSString stringWithFormat:@"%c", cElevenFC];
                    Done[11] = YES;
                } else if (One == cTwelveFC) {
                    Word = [NSString stringWithFormat:@"%c", cTwelveFC];
                    Done[12] = YES;
                } else if (One == cThirteenFC) {
                    Word = [NSString stringWithFormat:@"%c", cThirteenFC];
                    Done[13] = YES;
                } else if (One == cFourteenFC) {
                    Word = [NSString stringWithFormat:@"%c", cFourteenFC];
                    Done[14] = YES;
                } else if (One == cFithteenFC) {
                    Word = [NSString stringWithFormat:@"%c", cFithteenFC];
                    Done[15] = YES;
                } else if (One == cSixteenFC) {
                    Word = [NSString stringWithFormat:@"%c", cSixteenFC];
                    Done[16] = YES;
                }
                
                if (Two == cOneFC && Done[1] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cOneFC];
                    Done[1] = YES;
                } else if (Two == cTwoFC && Done[2] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwoFC];
                    Done[2] = YES;
                } else if (Two == cThreeFC && Done[3] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThreeFC];
                    Done[3] = YES;
                } else if (Two == cFourFC && Done[4] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourFC];
                    Done[4] = YES;
                } else if (Two == cFiveFC && Done[5] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFiveFC];
                    Done[5] = YES;
                } else if (Two == cSixFC && Done[6] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixFC];
                    Done[6] = YES;
                } else if (Two == cSevenFC && Done[7] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSevenFC];
                    Done[7] = YES;
                } else if (Two == cEightFC && Done[8] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cEightFC];
                    Done[8] = YES;
                } else if (Two == cNineFC && Done[9] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cNineFC];
                    Done[9] = YES;
                } else if (Two == cTenFC && Done[10] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTenFC];
                    Done[10] = YES;
                } else if (Two == cElevenFC && Done[11] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cElevenFC];
                    Done[11] = YES;
                } else if (Two == cTwelveFC && Done[12] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwelveFC];
                    Done[12] = YES;
                } else if (Two == cThirteenFC && Done[13] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThirteenFC];
                    Done[13] = YES;
                } else if (Two == cFourteenFC && Done[14] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourteenFC];
                    Done[14] = YES;
                } else if (Two == cFithteenFC && Done[15] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFithteenFC];
                    Done[15] = YES;
                } else if (Two == cSixteenFC && Done[16] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixteenFC];
                    Done[16] = YES;
                }
                
                if (Three == cOneFC && Done[1] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cOneFC];
                    Done[1] = YES;
                } else if (Three == cTwoFC && Done[2] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwoFC];
                    Done[2] = YES;
                } else if (Three == cThreeFC && Done[3] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThreeFC];
                    Done[3] = YES;
                } else if (Three == cFourFC && Done[4] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourFC];
                    Done[4] = YES;
                } else if (Three == cFiveFC && Done[5] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFiveFC];
                    Done[5] = YES;
                } else if (Three == cSixFC && Done[6] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixFC];
                    Done[6] = YES;
                } else if (Three == cSevenFC && Done[7] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSevenFC];
                    Done[7] = YES;
                } else if (Three == cEightFC && Done[8] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cEightFC];
                    Done[8] = YES;
                } else if (Three == cNineFC && Done[9] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cNineFC];
                    Done[9] = YES;
                } else if (Three == cTenFC && Done[10] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTenFC];
                    Done[10] = YES;
                } else if (Three == cElevenFC && Done[11] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cElevenFC];
                    Done[11] = YES;
                } else if (Three == cTwelveFC && Done[12] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwelveFC];
                    Done[12] = YES;
                } else if (Three == cThirteenFC && Done[13] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThirteenFC];
                    Done[13] = YES;
                } else if (Three == cFourteenFC && Done[14] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourteenFC];
                    Done[14] = YES;
                } else if (Three == cFithteenFC && Done[15] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFithteenFC];
                    Done[15] = YES;
                } else if (Three == cSixteenFC && Done[16] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixteenFC];
                    Done[16] = YES;
                }
                
                if (Four == cOneFC && Done[1] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cOneFC];
                } else if (Four == cTwoFC && Done[2] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwoFC];
                } else if (Four == cThreeFC && Done[3] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThreeFC];
                } else if (Four == cFourFC && Done[4] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourFC];
                } else if (Four == cFiveFC && Done[5] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFiveFC];
                } else if (Four == cSixFC && Done[6] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixFC];
                } else if (Four == cSevenFC && Done[7] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSevenFC];
                } else if (Four == cEightFC && Done[8] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cEightFC];
                } else if (Four == cNineFC && Done[9] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cNineFC];
                } else if (Four == cTenFC && Done[10] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTenFC];
                } else if (Four == cElevenFC && Done[11] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cElevenFC];
                } else if (Four == cTwelveFC && Done[12] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwelveFC];
                } else if (Four == cThirteenFC && Done[13] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThirteenFC];
                } else if (Four == cFourteenFC && Done[14] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourteenFC];
                } else if (Four == cFithteenFC && Done[15] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFithteenFC];
                } else if (Four == cSixteenFC && Done[16] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixteenFC];
                }
                
                if ([str isEqualToString:Word]) {
                    TheAmountFC++;
                }
            }
        }
        
        if (TheAmountFC == 0) {
            [self GettingTheRightGrid];
        } else {
            TotalAmountFC.text = [NSString stringWithFormat:@"0 OF %i", TheAmountFC];
            
            [self GetTheWord];
            [self StartTheGame];
            
            iLeftFC = ikTwoFC - ikOneFC;
            iUpFC = iktOneFC - ikFiveFC;
        }
    }
}


-(void)StartTheGame
{
    
    CGPoint midPoint;
    midPoint.x = ((pSevenFC.center.x + pSixFC.center.x) / 2);
    midPoint.y = ((pSixFC.center.y + pTenFC.center.y) / 2);
    
    pSixFC.center = CGPointMake(midPoint.x, midPoint.y);
    pSevenFC.center = CGPointMake(midPoint.x, midPoint.y);
    pTenFC.center = CGPointMake(midPoint.x, midPoint.y);
    pElevenFC.center = CGPointMake(midPoint.x, midPoint.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1];
    spOneFC.alpha = 0;
    spTwoFC.alpha = 0;
    spThreeFC.alpha = 0;
    spFourFC.alpha = 0;
    spFiveFC.alpha = 0;
    spSixFC.alpha = 0;
    spSevenFC.alpha = 0;
    spEightFC.alpha = 0;
    spNineFC.alpha = 0;
    spTenFC.alpha = 0;
    spElevenFC.alpha = 0;
    spTwelveFC.alpha = 0;
    spThirteenFC.alpha = 0;
    spFourteenFC.alpha = 0;
    spFithteenFC.alpha = 0;
    spSixteenFC.alpha = 0;
    
    [pSixFC setAlpha:1];
    [pSevenFC setAlpha:1];
    [pTenFC setAlpha:1];
    [pElevenFC setAlpha:1];
    [CheckFC setAlpha:1];
    [TheCurrentWordFC setAlpha:1];
    [PauseFC setAlpha:1];
    [BarUnderWordFC setAlpha:1];
    [TotalAmountFC setAlpha:1];
    [SenderDisplayFC setAlpha:1];
    [tHomeFC setAlpha:0];
    
    [gOneFC setAlpha:0];
    [gTwoFC setAlpha:0];
    [gThreeFC setAlpha:0];
    [BBSelectionFC setAlpha:0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    pSixFC.center = CGPointMake(ikSixFC, iktSixFC);
    pSevenFC.center = CGPointMake(ikSevenFC, iktSevenFC);
    pTenFC.center = CGPointMake(ikTenFC, iktTenFC);
    pElevenFC.center = CGPointMake(ikElevenFC, iktElevenFC);
    [UIView commitAnimations];
    
    pOneFC.center = CGPointMake(pSixFC.center.x, pSixFC.center.y);
    pTwoFC.center = CGPointMake(pSixFC.center.x, pSixFC.center.y);
    pFiveFC.center = CGPointMake(pSixFC.center.x, pSixFC.center.y);
    
    pThreeFC.center = CGPointMake(pSevenFC.center.x, pSevenFC.center.y);
    pFourFC.center = CGPointMake(pSevenFC.center.x, pSevenFC.center.y);
    pEightFC.center = CGPointMake(pSevenFC.center.x, pSevenFC.center.y);
    
    pNineFC.center = CGPointMake(pTenFC.center.x, pTenFC.center.y);
    pThirteenFC.center = CGPointMake(pTenFC.center.x, pTenFC.center.y);
    pFourteenFC.center = CGPointMake(pTenFC.center.x, pTenFC.center.y);
    
    pTwelveFC.center = CGPointMake(pElevenFC.center.x, pElevenFC.center.y);
    pFithteenFC.center = CGPointMake(pElevenFC.center.x, pElevenFC.center.y);
    pSixteenFC.center = CGPointMake(pElevenFC.center.x, pElevenFC.center.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationDuration:1.25];
    
    pOneFC.alpha = 1;
    pTwoFC.alpha = 1;
    pThreeFC.alpha = 1;
    pFourFC.alpha = 1;
    
    pFiveFC.alpha = 1;
    pEightFC.alpha = 1;
    
    pNineFC.alpha = 1;
    pTwelveFC.alpha = 1;
    
    pThirteenFC.alpha = 1;
    pFourteenFC.alpha = 1;
    pFithteenFC.alpha  = 1;
    pSixteenFC.alpha = 1;
    
    pOneFC.center = CGPointMake(ikOneFC, iktOneFC);
    pTwoFC.center = CGPointMake(ikTwoFC, iktTwoFC);
    pFiveFC.center = CGPointMake(ikFiveFC, iktFiveFC);
    
    pThreeFC.center = CGPointMake(ikThreeFC, iktThreeFC);
    pFourFC.center = CGPointMake(ikFourFC, iktFourFC);
    pEightFC.center = CGPointMake(ikEightFC, iktEightFC);
    
    pNineFC.center = CGPointMake(ikNineFC, iktNineFC);
    pThirteenFC.center = CGPointMake(ikThirteenFC, iktThirteenFC);
    pFourteenFC.center = CGPointMake(ikFourteenFC, iktFourteenFC);
    
    pTwelveFC.center = CGPointMake(ikTwelveFC, iktTwelveFC);
    pFithteenFC.center = CGPointMake(ikFithteenFC, iktFithteenFC);
    pSixteenFC.center = CGPointMake(ikSixteenFC, iktSixteenFC);
    
    [self Swipes];
    [UIView commitAnimations];
}

-(void)Swipes
{
    PanningSensitivityFC = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneFC.userInteractionEnabled = YES;
    [pOneFC addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoFC.userInteractionEnabled = YES;
    [pTwoFC addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeFC.userInteractionEnabled = YES;
    [pThreeFC addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourFC.userInteractionEnabled = YES;
    [pFourFC addGestureRecognizer:panFour];
    
    UIPanGestureRecognizer *panFive = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FivePan:)];
    pFiveFC.userInteractionEnabled = YES;
    [pFiveFC addGestureRecognizer:panFive];
    
    UIPanGestureRecognizer *panSix = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixPan:)];
    pSixFC.userInteractionEnabled = YES;
    [pSixFC addGestureRecognizer:panSix];
    
    UIPanGestureRecognizer *panSeven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SevenPan:)];
    pSevenFC.userInteractionEnabled = YES;
    [pSevenFC addGestureRecognizer:panSeven];
    
    UIPanGestureRecognizer *panEight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(EightPan:)];
    pEightFC.userInteractionEnabled = YES;
    [pEightFC addGestureRecognizer:panEight];
    
    UIPanGestureRecognizer *panNine = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(NinePan:)];
    pNineFC.userInteractionEnabled = YES;
    [pNineFC addGestureRecognizer:panNine];
    
    UIPanGestureRecognizer *panTen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TenPan:)];
    pTenFC.userInteractionEnabled = YES;
    [pTenFC addGestureRecognizer:panTen];
    
    UIPanGestureRecognizer *panEleven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ElevenPan:)];
    pElevenFC.userInteractionEnabled = YES;
    [pElevenFC addGestureRecognizer:panEleven];
    
    UIPanGestureRecognizer *panTwelve = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwelvePan:)];
    pTwelveFC.userInteractionEnabled = YES;
    [pTwelveFC addGestureRecognizer:panTwelve];
    
    UIPanGestureRecognizer *panThirteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThirteenPan:)];
    pThirteenFC.userInteractionEnabled = YES;
    [pThirteenFC addGestureRecognizer:panThirteen];
    
    UIPanGestureRecognizer *panFourteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourteenPan:)];
    pFourteenFC.userInteractionEnabled = YES;
    [pFourteenFC addGestureRecognizer:panFourteen];
    
    UIPanGestureRecognizer *panFithteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FithteenPan:)];
    pFithteenFC.userInteractionEnabled = YES;
    [pFithteenFC addGestureRecognizer:panFithteen];
    
    UIPanGestureRecognizer *panSixteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixteenPan:)];
    pSixteenFC.userInteractionEnabled = YES;
    [pSixteenFC addGestureRecognizer:panSixteen];
    
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 1;
   
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FivePan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 5;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 6;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)SevenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 7;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)EightPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 8;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
            PreviousFC = 2;
            [self Horizontal];
        }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)NinePan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 9;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)TenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 10;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)ElevenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 11;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)TwelvePan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 12;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThirteenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 13;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourteenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 14;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FithteenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 15;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixteenPan: (UIPanGestureRecognizer *)sender
{
    distanceFC = [sender translationInView:self.view];
    PanningIntFC++;
    PPanningMethodFC = 16;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 1) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Verticle];
            PanningIntFC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousFC == 2) {
        if (PanningIntFC == PanningSensitivityFC) {
            [self Horizontal];
            PanningIntFC = 0;
        }
    } else if (distanceFC.x > 0 || distanceFC.x < 0) {
        if ((distanceFC.y > 0 || distanceFC.y < 0) && ((distanceFC.x > 0 && distanceFC.x < 10) || (distanceFC.x < 0 && distanceFC.x > -10))) {
            PreviousFC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousFC = 1;
        }
    } else if (distanceFC.y > 0 || distanceFC.y < 0) {
        PreviousFC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntFC = 0;
        PreviousFC = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneFC = pOneFC.center.x;
    yOneFC = pOneFC.center.y;
    xTwoFC = pTwoFC.center.x;
    yTwoFC = pTwoFC.center.y;
    xThreeFC = pThreeFC.center.x;
    yThreeFC = pThreeFC.center.y;
    xFourFC = pFourFC.center.x;
    yFourFC = pFourFC.center.y;
    xFiveFC = pFiveFC.center.x;
    yFiveFC = pFiveFC.center.y;
    xSixFC = pSixFC.center.x;
    ySixFC = pSixFC.center.y;
    ySevenFC = pSevenFC.center.y;
    xSevenFC = pSevenFC.center.x;
    xEightFC = pEightFC.center.x;
    yEightFC = pEightFC.center.y;
    yNineFC = pNineFC.center.y;
    xNineFC = pNineFC.center.x;
    xTenFC = pTenFC.center.x;
    yTenFC = pTenFC.center.y;
    xElevenFC = pElevenFC.center.x;
    yElevenFC = pElevenFC.center.y;
    xTwelveFC = pTwelveFC.center.x;
    yTwelveFC = pTwelveFC.center.y;
    xThirteenFC = pThirteenFC.center.x;
    yThirteenFC = pThirteenFC.center.y;
    xFourteenFC = pFourteenFC.center.x;
    yFourteenFC = pFourteenFC.center.y;
    xFithteenFC = pFithteenFC.center.x;
    yFithteenFC = pFithteenFC.center.y;
    xSixteenFC = pSixteenFC.center.x;
    ySixteenFC = pSixteenFC.center.y;
    
    switch (PPanningMethodFC) {
        case 1:
            pointOfIntrestFC = pOneFC.center.x;
            break;
        case 2:
            pointOfIntrestFC = pTwoFC.center.x;
            break;
        case 3:
            pointOfIntrestFC = pThreeFC.center.x;
            break;
        case 4:
            pointOfIntrestFC = pFourFC.center.x;
            break;
        case 5:
            pointOfIntrestFC = pFiveFC.center.x;
            break;
        case 6:
            pointOfIntrestFC = pSixFC.center.x;
            break;
        case 7:
            pointOfIntrestFC = pSevenFC.center.x;
            break;
        case 8:
            pointOfIntrestFC = pEightFC.center.x;
            break;
        case 9:
            pointOfIntrestFC = pNineFC.center.x;
            break;
        case 10:
            pointOfIntrestFC = pTenFC.center.x;
            break;
        case 11:
            pointOfIntrestFC = pElevenFC.center.x;
            break;
        case 12:
            pointOfIntrestFC = pTwelveFC.center.x;
            break;
        case 13:
            pointOfIntrestFC = pThirteenFC.center.x;
            break;
        case 14:
            pointOfIntrestFC = pFourteenFC.center.x;
            break;
        case 15:
            pointOfIntrestFC = pFithteenFC.center.x;
            break;
        case 16:
            pointOfIntrestFC = pSixteenFC.center.x;
            break;
        default:
            break;
    }
    
    if (distanceFC.y < 0) {
        
        if (pointOfIntrestFC == pOneFC.center.x) {
            pOneFC.center = CGPointMake(pOneFC.center.x, pOneFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pTwoFC.center.x) {
            pTwoFC.center = CGPointMake(pTwoFC.center.x, pTwoFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pThreeFC.center.x) {
            pThreeFC.center = CGPointMake(pThreeFC.center.x , pThreeFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pFourFC.center.x) {
            pFourFC.center = CGPointMake(pFourFC.center.x, pFourFC.center.y - iLeftFC);
        }
        if (pFiveFC.center.x == pointOfIntrestFC) {
            pFiveFC.center = CGPointMake(pFiveFC.center.x, pFiveFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pSixFC.center.x) {
            pSixFC.center = CGPointMake(pSixFC.center.x , pSixFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pSevenFC.center.x) {
            pSevenFC.center = CGPointMake(pSevenFC.center.x , pSevenFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pEightFC.center.x) {
            pEightFC.center = CGPointMake(pEightFC.center.x , pEightFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pNineFC.center.x) {
            pNineFC.center = CGPointMake(pNineFC.center.x, pNineFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pTenFC.center.x) {
            pTenFC.center = CGPointMake(pTenFC.center.x, pTenFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pElevenFC.center.x) {
            pElevenFC.center = CGPointMake(pElevenFC.center.x, pElevenFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pTwelveFC.center.x) {
            pTwelveFC.center = CGPointMake(pTwelveFC.center.x, pTwelveFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pThirteenFC.center.x) {
            pThirteenFC.center = CGPointMake(pThirteenFC.center.x , pThirteenFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pFourteenFC.center.x) {
            pFourteenFC.center = CGPointMake(pFourteenFC.center.x, pFourteenFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pFithteenFC.center.x) {
            pFithteenFC.center = CGPointMake(pFithteenFC.center.x, pFithteenFC.center.y - iLeftFC);
        }
        if (pointOfIntrestFC == pSixteenFC.center.x) {
            pSixteenFC.center = CGPointMake(pSixteenFC.center.x, pSixteenFC.center.y - iLeftFC);
        }
    } else if (distanceFC.y > 0) {
        
        if (pointOfIntrestFC == pOneFC.center.x) {
            pOneFC.center = CGPointMake(pOneFC.center.x, pOneFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pTwoFC.center.x) {
            pTwoFC.center = CGPointMake(pTwoFC.center.x, pTwoFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pThreeFC.center.x) {
            pThreeFC.center = CGPointMake(pThreeFC.center.x , pThreeFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pFourFC.center.x) {
            pFourFC.center = CGPointMake(pFourFC.center.x, pFourFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pFiveFC.center.x) {
            pFiveFC.center = CGPointMake(pFiveFC.center.x, pFiveFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pSixFC.center.x) {
            pSixFC.center = CGPointMake(pSixFC.center.x , pSixFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pSevenFC.center.x) {
            pSevenFC.center = CGPointMake(pSevenFC.center.x , pSevenFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pEightFC.center.x) {
            pEightFC.center = CGPointMake(pEightFC.center.x , pEightFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pNineFC.center.x) {
            pNineFC.center = CGPointMake(pNineFC.center.x, pNineFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pTenFC.center.x) {
            pTenFC.center = CGPointMake(pTenFC.center.x, pTenFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pElevenFC.center.x) {
            pElevenFC.center = CGPointMake(pElevenFC.center.x, pElevenFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pTwelveFC.center.x) {
            pTwelveFC.center = CGPointMake(pTwelveFC.center.x, pTwelveFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pThirteenFC.center.x) {
            pThirteenFC.center = CGPointMake(pThirteenFC.center.x , pThirteenFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pFourteenFC.center.x) {
            pFourteenFC.center = CGPointMake(pFourteenFC.center.x, pFourteenFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pFithteenFC.center.x) {
            pFithteenFC.center = CGPointMake(pFithteenFC.center.x, pFithteenFC.center.y+ iLeftFC);
        }
        if (pointOfIntrestFC == pSixteenFC.center.x) {
            pSixteenFC.center = CGPointMake(pSixteenFC.center.x, pSixteenFC.center.y+ iLeftFC);
        }
    }
    
    if (pOneFC.center.x != pointOfIntrestFC) {
        pOneFC.alpha = 1;
        pOneFC.hidden = NO;
        pOneFC.center = CGPointMake(xOneFC, yOneFC);
    }
    if (pTwoFC.center.x != pointOfIntrestFC) {
        pTwoFC.alpha = 1;
        pTwoFC.hidden = NO;
        pTwoFC.center = CGPointMake(xTwoFC, yTwoFC);
    }
    if (pThreeFC.center.x != pointOfIntrestFC) {
        pThreeFC.alpha = 1;
        pThreeFC.hidden = NO;
        pThreeFC.center = CGPointMake(xThreeFC, yThreeFC);
    }
    if (pFourFC.center.x != pointOfIntrestFC) {
        pFourFC.alpha = 1;
        pFourFC.hidden = NO;
        pFourFC.center = CGPointMake(xFourFC, yFourFC);
    }
    if (pFiveFC.center.x != pointOfIntrestFC) {
        pFiveFC.alpha = 1;
        pFiveFC.hidden = NO;
        pFiveFC.center = CGPointMake(xFiveFC, yFiveFC);
    }
    if (pSixFC.center.x != pointOfIntrestFC) {
        pSixFC.alpha = 1;
        pSixFC.hidden = NO;
        pSixFC.center = CGPointMake(xSixFC, ySixFC);
    }
    if (pSevenFC.center.x != pointOfIntrestFC) {
        pSevenFC.alpha = 1;
        pSevenFC.hidden = NO;
        pSevenFC.center = CGPointMake(xSevenFC, ySevenFC);
    }
    if (pEightFC.center.x != pointOfIntrestFC) {
        pEightFC.alpha = 1;
        pEightFC.hidden = NO;
        pEightFC.center = CGPointMake(xEightFC, yEightFC);
    }
    if (pNineFC.center.x != pointOfIntrestFC) {
        pNineFC.alpha = 1;
        pNineFC.hidden = NO;
        pNineFC.center = CGPointMake(xNineFC, yNineFC);
    }
    if (pTenFC.center.x != pointOfIntrestFC) {
        pTenFC.alpha = 1;
        pTenFC.hidden = NO;
        pTenFC.center = CGPointMake(xTenFC, yTenFC);
    }
    if (pElevenFC.center.x != pointOfIntrestFC) {
        pElevenFC.alpha = 1;
        pElevenFC.hidden = NO;
        pElevenFC.center = CGPointMake(xElevenFC, yElevenFC);
    }
    if (pTwelveFC.center.x != pointOfIntrestFC) {
        pTwelveFC.alpha = 1;
        pTwelveFC.hidden = NO;
        pTwelveFC.center = CGPointMake(xTwelveFC, yTwelveFC);
    }
    if (pThirteenFC.center.x != pointOfIntrestFC) {
        pThirteenFC.alpha = 1;
        pThirteenFC.hidden = NO;
        pThirteenFC.center = CGPointMake(xThirteenFC, yThirteenFC);
    }
    if (pFourteenFC.center.x != pointOfIntrestFC) {
        pFourteenFC.alpha = 1;
        pFourteenFC.hidden = NO;
        pFourteenFC.center = CGPointMake(xFourteenFC, yFourteenFC);
    }
    if (pFithteenFC.center.x != pointOfIntrestFC) {
        pFithteenFC.alpha = 1;
        pFithteenFC.hidden = NO;
        pFithteenFC.center = CGPointMake(xFithteenFC, yFithteenFC);
    }
    if (pSixteenFC.center.x != pointOfIntrestFC) {
        pSixteenFC.alpha = 1;
        pSixteenFC.hidden = NO;
        pSixteenFC.center = CGPointMake(xSixteenFC, ySixteenFC);
    }
    
    if (pOneFC.center.y > iktSixteenFC) {
        pOneFC.center = CGPointMake(pOneFC.center.x, iktOneFC);
    }
    if (pTwoFC.center.y > iktSixteenFC) {
        pTwoFC.center = CGPointMake(pTwoFC.center.x, iktOneFC);
    }
    if (pThreeFC.center.y > iktSixteenFC) {
        pThreeFC.center = CGPointMake(pThreeFC.center.x, iktOneFC);
    }
    if (pFourFC.center.y > iktSixteenFC) {
        pFourFC.center = CGPointMake(pFourFC.center.x,iktOneFC );
    }
    if (pFiveFC.center.y > iktSixteenFC) {
        pFiveFC.center = CGPointMake(pFiveFC.center.x, iktOneFC);
    }
    if (pSixFC.center.y > iktSixteenFC) {
        pSixFC.center = CGPointMake(pSixFC.center.x, iktOneFC);
    }
    if (pSevenFC.center.y > iktSixteenFC) {
        pSevenFC.center = CGPointMake(pSevenFC.center.x, iktOneFC);
    }
    if (pEightFC.center.y > iktSixteenFC) {
        pEightFC.center = CGPointMake(pEightFC.center.x, iktOneFC);
    }
    if (pNineFC.center.y > iktSixteenFC) {
        pNineFC.center = CGPointMake(pNineFC.center.x, iktOneFC);
    }
    if (pTenFC.center.y > iktSixteenFC) {
        pTenFC.center = CGPointMake(pTenFC.center.x, iktOneFC);
    }
    if (pElevenFC.center.y > iktSixteenFC) {
        pElevenFC.center = CGPointMake(pElevenFC.center.x, iktOneFC);
    }
    if (pTwelveFC.center.y > iktSixteenFC) {
        pTwelveFC.center = CGPointMake(pTwelveFC.center.x, iktOneFC);
    }
    if (pThirteenFC.center.y > iktSixteenFC) {
        pThirteenFC.center = CGPointMake(pThirteenFC.center.x, iktOneFC);
    }
    if (pFourteenFC.center.y > iktSixteenFC) {
        pFourteenFC.center = CGPointMake(pFourteenFC.center.x, iktOneFC);
    }
    if (pFithteenFC.center.y > iktSixteenFC) {
        pFithteenFC.center = CGPointMake(pFithteenFC.center.x, iktOneFC);
    }
    if (pSixteenFC.center.y > iktSixteenFC) {
        pSixteenFC.center = CGPointMake(pSixteenFC.center.x, iktOneFC);
    }
    
    if (pOneFC.center.y < iktOneFC) {
        pOneFC.center = CGPointMake(pOneFC.center.x, iktSixteenFC);
    }
    if (pTwoFC.center.y < iktOneFC) {
        pTwoFC.center = CGPointMake(pTwoFC.center.x, iktSixteenFC);
    }
    if (pThreeFC.center.y < iktOneFC) {
        pThreeFC.center = CGPointMake(pThreeFC.center.x, iktSixteenFC);
    }
    if (pFourFC.center.y < iktOneFC) {
        pFourFC.center = CGPointMake(pFourFC.center.x, iktSixteenFC);
    }
    if (pFiveFC.center.y < iktOneFC) {
        pFiveFC.center = CGPointMake(pFiveFC.center.x, iktSixteenFC);
    }
    if (pSixFC.center.y < iktOneFC) {
        pSixFC.center = CGPointMake(pSixFC.center.x, iktSixteenFC);
    }
    if (pSevenFC.center.y < iktOneFC) {
        pSevenFC.center = CGPointMake(pSevenFC.center.x, iktSixteenFC);
    }
    if (pEightFC.center.y < iktOneFC) {
        pEightFC.center = CGPointMake(pEightFC.center.x, iktSixteenFC);
    }
    if (pNineFC.center.y < iktOneFC) {
        pNineFC.center = CGPointMake(pNineFC.center.x, iktSixteenFC);
    }
    if (pTenFC.center.y < iktOneFC) {
        pTenFC.center = CGPointMake(pTenFC.center.x, iktSixteenFC);
    }
    if (pElevenFC.center.y < iktOneFC) {
        pElevenFC.center = CGPointMake(pElevenFC.center.x, iktSixteenFC);
    }
    if (pTwelveFC.center.y < iktOneFC) {
        pTwelveFC.center = CGPointMake(pTwelveFC.center.x, iktSixteenFC);
    }
    if (pThirteenFC.center.y < iktOneFC) {
        pThirteenFC.center = CGPointMake(pThirteenFC.center.x, iktSixteenFC);
    }
    if (pFourteenFC.center.y < iktOneFC) {
        pFourteenFC.center = CGPointMake(pFourteenFC.center.x, iktSixteenFC);
    }
    if (pFithteenFC.center.y < iktOneFC) {
        pFithteenFC.center = CGPointMake(pFithteenFC.center.x, iktSixteenFC);
    }
    if (pSixteenFC.center.y < iktOneFC) {
        pSixteenFC.center = CGPointMake(pSixteenFC.center.x, iktSixteenFC);
    }
}

-(void)Verticle
{
    xOneFC = pOneFC.center.x;
    yOneFC = pOneFC.center.y;
    xTwoFC = pTwoFC.center.x;
    yTwoFC = pTwoFC.center.y;
    xThreeFC = pThreeFC.center.x;
    yThreeFC = pThreeFC.center.y;
    xFourFC = pFourFC.center.x;
    yFourFC = pFourFC.center.y;
    xFiveFC = pFiveFC.center.x;
    yFiveFC = pFiveFC.center.y;
    xSixFC = pSixFC.center.x;
    ySixFC = pSixFC.center.y;
    ySevenFC = pSevenFC.center.y;
    xSevenFC = pSevenFC.center.x;
    xEightFC = pEightFC.center.x;
    yEightFC = pEightFC.center.y;
    yNineFC = pNineFC.center.y;
    xNineFC = pNineFC.center.x;
    xTenFC = pTenFC.center.x;
    yTenFC = pTenFC.center.y;
    xElevenFC = pElevenFC.center.x;
    yElevenFC = pElevenFC.center.y;
    xTwelveFC = pTwelveFC.center.x;
    yTwelveFC = pTwelveFC.center.y;
    xThirteenFC = pThirteenFC.center.x;
    yThirteenFC = pThirteenFC.center.y;
    xFourteenFC = pFourteenFC.center.x;
    yFourteenFC = pFourteenFC.center.y;
    xFithteenFC = pFithteenFC.center.x;
    yFithteenFC = pFithteenFC.center.y;
    xSixteenFC = pSixteenFC.center.x;
    ySixteenFC = pSixteenFC.center.y;
    
    switch (PPanningMethodFC) {
        case 1:
            pointOfIntrestFC = pOneFC.center.y;
            break;
        case 2:
            pointOfIntrestFC = pTwoFC.center.y;
            break;
        case 3:
            pointOfIntrestFC = pThreeFC.center.y;
            break;
        case 4:
            pointOfIntrestFC = pFourFC.center.y;
            break;
        case 5:
            pointOfIntrestFC = pFiveFC.center.y;
            break;
        case 6:
            pointOfIntrestFC = pSixFC.center.y;
            break;
        case 7:
            pointOfIntrestFC = pSevenFC.center.y;
            break;
        case 8:
            pointOfIntrestFC = pEightFC.center.y;
            break;
        case 9:
            pointOfIntrestFC = pNineFC.center.y;
            break;
        case 10:
            pointOfIntrestFC = pTenFC.center.y;
            break;
        case 11:
            pointOfIntrestFC = pElevenFC.center.y;
            break;
        case 12:
            pointOfIntrestFC = pTwelveFC.center.y;
            break;
        case 13:
            pointOfIntrestFC = pThirteenFC.center.y;
            break;
        case 14:
            pointOfIntrestFC = pFourteenFC.center.y;
            break;
        case 15:
            pointOfIntrestFC = pFithteenFC.center.y;
            break;
        case 16:
            pointOfIntrestFC = pSixteenFC.center.y;
            break;
        default:
            break;
    }
    
    if (distanceFC.x > 0) {
        
        if (pointOfIntrestFC == pOneFC.center.y) {
            pOneFC.center = CGPointMake(pOneFC.center.x + iLeftFC, pOneFC.center.y);
        }
        if (pointOfIntrestFC == pTwoFC.center.y) {
            pTwoFC.center = CGPointMake(pTwoFC.center.x + iLeftFC, pTwoFC.center.y);
        }
        if (pointOfIntrestFC == pThreeFC.center.y) {
            pThreeFC.center = CGPointMake(pThreeFC.center.x + iLeftFC, pThreeFC.center.y);
        }
        if (pointOfIntrestFC == pFourFC.center.y) {
            pFourFC.center = CGPointMake(pFourFC.center.x + iLeftFC, pFourFC.center.y);
        }
        if (pointOfIntrestFC == pFiveFC.center.y) {
            pFiveFC.center = CGPointMake(pFiveFC.center.x + iLeftFC, pFiveFC.center.y);
        }
        if (pointOfIntrestFC == pSixFC.center.y) {
            pSixFC.center = CGPointMake(pSixFC.center.x + iLeftFC, pSixFC.center.y);
        }
        if (pointOfIntrestFC == pSevenFC.center.y) {
            pSevenFC.center = CGPointMake(pSevenFC.center.x + iLeftFC, pSevenFC.center.y);
        }
        if (pointOfIntrestFC == pEightFC.center.y) {
            pEightFC.center = CGPointMake(pEightFC.center.x + iLeftFC, pEightFC.center.y);
        }
        if (pointOfIntrestFC == pNineFC.center.y) {
            pNineFC.center = CGPointMake(pNineFC.center.x + iLeftFC, pNineFC.center.y);
        }
        if (pointOfIntrestFC == pTenFC.center.y) {
            pTenFC.center = CGPointMake(pTenFC.center.x + iLeftFC, pTenFC.center.y);
        }
        if (pointOfIntrestFC == pElevenFC.center.y) {
            pElevenFC.center = CGPointMake(pElevenFC.center.x + iLeftFC, pElevenFC.center.y);
        }
        if (pointOfIntrestFC == pTwelveFC.center.y) {
            pTwelveFC.center = CGPointMake(pTwelveFC.center.x + iLeftFC, pTwelveFC.center.y);
        }
        if (pointOfIntrestFC == pThirteenFC.center.y) {
            pThirteenFC.center = CGPointMake(pThirteenFC.center.x + iLeftFC, pThirteenFC.center.y);
        }
        if (pointOfIntrestFC == pFourteenFC.center.y) {
            pFourteenFC.center = CGPointMake(pFourteenFC.center.x + iLeftFC, pFourteenFC.center.y);
        }
        if (pointOfIntrestFC == pFithteenFC.center.y) {
            pFithteenFC.center = CGPointMake(pFithteenFC.center.x + iLeftFC, pFithteenFC.center.y);
        }
        if (pointOfIntrestFC == pSixteenFC.center.y) {
            pSixteenFC.center = CGPointMake(pSixteenFC.center.x + iLeftFC, pSixteenFC.center.y);
        }
        
    } else if (distanceFC.x < 0) {
        
        if (pointOfIntrestFC == pOneFC.center.y) {
            pOneFC.center = CGPointMake(pOneFC.center.x - iLeftFC, pOneFC.center.y);
        }
        if (pointOfIntrestFC == pTwoFC.center.y) {
            pTwoFC.center = CGPointMake(pTwoFC.center.x - iLeftFC, pTwoFC.center.y);
        }
        if (pointOfIntrestFC == pThreeFC.center.y) {
            pThreeFC.center = CGPointMake(pThreeFC.center.x - iLeftFC, pThreeFC.center.y);
        }
        if (pointOfIntrestFC == pFourFC.center.y) {
            pFourFC.center = CGPointMake(pFourFC.center.x - iLeftFC, pFourFC.center.y);
        }
        if (pointOfIntrestFC == pFiveFC.center.y) {
            pFiveFC.center = CGPointMake(pFiveFC.center.x - iLeftFC, pFiveFC.center.y);
        }
        if (pointOfIntrestFC == pSixFC.center.y) {
            pSixFC.center = CGPointMake(pSixFC.center.x - iLeftFC, pSixFC.center.y);
        }
        if (pointOfIntrestFC == pSevenFC.center.y) {
            pSevenFC.center = CGPointMake(pSevenFC.center.x - iLeftFC, pSevenFC.center.y);
        }
        if (pointOfIntrestFC == pEightFC.center.y) {
            pEightFC.center = CGPointMake(pEightFC.center.x - iLeftFC, pEightFC.center.y);
        }
        if (pointOfIntrestFC == pNineFC.center.y) {
            pNineFC.center = CGPointMake(pNineFC.center.x - iLeftFC, pNineFC.center.y);
        }
        if (pointOfIntrestFC == pTenFC.center.y) {
            pTenFC.center = CGPointMake(pTenFC.center.x - iLeftFC, pTenFC.center.y);
        }
        if (pointOfIntrestFC == pElevenFC.center.y) {
            pElevenFC.center = CGPointMake(pElevenFC.center.x - iLeftFC, pElevenFC.center.y);
        }
        if (pointOfIntrestFC == pTwelveFC.center.y) {
            pTwelveFC.center = CGPointMake(pTwelveFC.center.x - iLeftFC, pTwelveFC.center.y);
        }
        if (pointOfIntrestFC == pThirteenFC.center.y) {
            pThirteenFC.center = CGPointMake(pThirteenFC.center.x - iLeftFC, pThirteenFC.center.y);
        }
        if (pointOfIntrestFC == pFourteenFC.center.y) {
            pFourteenFC.center = CGPointMake(pFourteenFC.center.x - iLeftFC, pFourteenFC.center.y);
        }
        if (pointOfIntrestFC == pFithteenFC.center.y) {
            pFithteenFC.center = CGPointMake(pFithteenFC.center.x - iLeftFC, pFithteenFC.center.y);
        }
        if (pointOfIntrestFC == pSixteenFC.center.y) {
            pSixteenFC.center = CGPointMake(pSixteenFC.center.x - iLeftFC, pSixteenFC.center.y);
        }
    }
    
    if (pOneFC.center.y != pointOfIntrestFC) {
        pOneFC.alpha = 1;
        pOneFC.hidden = NO;
        pOneFC.center = CGPointMake(xOneFC, yOneFC);
    }
    if (pTwoFC.center.y != pointOfIntrestFC) {
        pTwoFC.alpha = 1;
        pTwoFC.hidden = NO;
        pTwoFC.center = CGPointMake(xTwoFC, yTwoFC);
    }
    if (pThreeFC.center.y != pointOfIntrestFC) {
        pThreeFC.alpha = 1;
        pThreeFC.hidden = NO;
        pThreeFC.center = CGPointMake(xThreeFC, yThreeFC);
    }
    if (pFourFC.center.y != pointOfIntrestFC) {
        pFourFC.alpha = 1;
        pFourFC.hidden = NO;
        pFourFC.center = CGPointMake(xFourFC, yFourFC);
    }
    if (pFiveFC.center.y != pointOfIntrestFC) {
        pFiveFC.alpha = 1;
        pFiveFC.hidden = NO;
        pFiveFC.center = CGPointMake(xFiveFC, yFiveFC);
    }
    if (pSixFC.center.y != pointOfIntrestFC) {
        pSixFC.alpha = 1;
        pSixFC.hidden = NO;
        pSixFC.center = CGPointMake(xSixFC, ySixFC);
    }
    if (pSevenFC.center.y != pointOfIntrestFC) {
        pSevenFC.alpha = 1;
        pSevenFC.hidden = NO;
        pSevenFC.center = CGPointMake(xSevenFC, ySevenFC);
    }
    if (pEightFC.center.y != pointOfIntrestFC) {
        pEightFC.alpha = 1;
        pEightFC.hidden = NO;
        pEightFC.center = CGPointMake(xEightFC, yEightFC);
    }
    if (pNineFC.center.y != pointOfIntrestFC) {
        pNineFC.alpha = 1;
        pNineFC.hidden = NO;
        pNineFC.center = CGPointMake(xNineFC, yNineFC);
    }
    if (pTenFC.center.y != pointOfIntrestFC) {
        pTenFC.alpha = 1;
        pTenFC.hidden = NO;
        pTenFC.center = CGPointMake(xTenFC, yTenFC);
    }
    if (pElevenFC.center.y != pointOfIntrestFC) {
        pElevenFC.alpha = 1;
        pElevenFC.hidden = NO;
        pElevenFC.center = CGPointMake(xElevenFC, yElevenFC);
    }
    if (pTwelveFC.center.y != pointOfIntrestFC) {
        pTwelveFC.alpha = 1;
        pTwelveFC.hidden = NO;
        pTwelveFC.center = CGPointMake(xTwelveFC, yTwelveFC);
    }
    if (pThirteenFC.center.y != pointOfIntrestFC) {
        pThirteenFC.alpha = 1;
        pThirteenFC.hidden = NO;
        pThirteenFC.center = CGPointMake(xThirteenFC, yThirteenFC);
    }
    if (pFourteenFC.center.y != pointOfIntrestFC) {
        pFourteenFC.alpha = 1;
        pFourteenFC.hidden = NO;
        pFourteenFC.center = CGPointMake(xFourteenFC, yFourteenFC);
    }
    if (pFithteenFC.center.y != pointOfIntrestFC) {
        pFithteenFC.alpha = 1;
        pFithteenFC.hidden = NO;
        pFithteenFC.center = CGPointMake(xFithteenFC, yFithteenFC);
    }
    if (pSixteenFC.center.y != pointOfIntrestFC) {
        pSixteenFC.alpha = 1;
        pSixteenFC.hidden = NO;
        pSixteenFC.center = CGPointMake(xSixteenFC, ySixteenFC);
    }
    
    if (pOneFC.center.x < ikOneFC) {
        pOneFC.center = CGPointMake(ikFourFC, pOneFC.center.y);
    }
    if (pTwoFC.center.x < ikOneFC) {
        pTwoFC.center = CGPointMake(ikFourFC, pTwoFC.center.y);
    }
    if (pThreeFC.center.x < ikOneFC) {
        pThreeFC.center = CGPointMake(ikFourFC, pThreeFC.center.y);
    }
    if (pFourFC.center.x < ikOneFC) {
        pFourFC.center = CGPointMake(ikFourFC, pFourFC.center.y);
    }
    if (pFiveFC.center.x < ikOneFC) {
        pFiveFC.center = CGPointMake(ikFourFC, pFiveFC.center.y);
    }
    if (pSixFC.center.x < ikOneFC) {
        pSixFC.center = CGPointMake(ikFourFC, pSixFC.center.y);
    }
    if (pSevenFC.center.x < ikOneFC) {
        pSevenFC.center = CGPointMake(ikFourFC, pSevenFC.center.y);
    }
    if (pEightFC.center.x < ikOneFC) {
        pEightFC.center = CGPointMake(ikFourFC, pEightFC.center.y);
    }
    if (pNineFC.center.x < ikOneFC) {
        pNineFC.center = CGPointMake(ikFourFC, pNineFC.center.y);
    }
    if (pTenFC.center.x < ikOneFC) {
        pTenFC.center = CGPointMake(ikFourFC, pTenFC.center.y);
    }
    if (pElevenFC.center.x < ikOneFC) {
        pElevenFC.center = CGPointMake(ikFourFC, pElevenFC.center.y);
    }
    if (pTwelveFC.center.x < ikOneFC) {
        pTwelveFC.center = CGPointMake(ikFourFC, pTwelveFC.center.y);
    }
    if (pThirteenFC.center.x < ikOneFC) {
        pThirteenFC.center = CGPointMake(ikFourFC, pThirteenFC.center.y);
    }
    if (pFourteenFC.center.x < ikOneFC) {
        pFourteenFC.center = CGPointMake(ikFourFC, pFourteenFC.center.y);
    }
    if (pFithteenFC.center.x < ikOneFC) {
        pFithteenFC.center = CGPointMake(ikFourFC, pFithteenFC.center.y);
    }
    if (pSixteenFC.center.x < ikOneFC) {
        pSixteenFC.center = CGPointMake(ikFourFC, pSixteenFC.center.y);
    }
    
    if (pOneFC.center.x > ikFourFC) {
        pOneFC.center = CGPointMake(ikOneFC, pOneFC.center.y);
    }
    if (pTwoFC.center.x > ikFourFC) {
        pTwoFC.center = CGPointMake(ikOneFC, pTwoFC.center.y);
    }
    if (pThreeFC.center.x > ikFourFC) {
        pThreeFC.center = CGPointMake(ikOneFC, pThreeFC.center.y);
    }
    if (pFourFC.center.x > ikFourFC) {
        pFourFC.center = CGPointMake(ikOneFC, pFourFC.center.y);
    }
    if (pFiveFC.center.x > ikFourFC) {
        pFiveFC.center = CGPointMake(ikOneFC, pFiveFC.center.y);
    }
    if (pSixFC.center.x > ikFourFC) {
        pSixFC.center = CGPointMake(ikOneFC, pSixFC.center.y);
    }
    if (pSevenFC.center.x > ikFourFC) {
        pSevenFC.center = CGPointMake(ikOneFC, pSevenFC.center.y);
    }
    if (pEightFC.center.x > ikFourFC) {
        pEightFC.center = CGPointMake(ikOneFC, pEightFC.center.y);
    }
    if (pNineFC.center.x > ikFourFC) {
        pNineFC.center = CGPointMake(ikOneFC, pNineFC.center.y);
    }
    if (pTenFC.center.x > ikFourFC) {
        pTenFC.center = CGPointMake(ikOneFC, pTenFC.center.y);
    }
    if (pElevenFC.center.x > ikFourFC) {
        pElevenFC.center = CGPointMake(ikOneFC, pElevenFC.center.y);
    }
    if (pTwelveFC.center.x > ikFourFC) {
        pTwelveFC.center = CGPointMake(ikOneFC, pTwelveFC.center.y);
    }
    if (pThirteenFC.center.x > ikFourFC) {
        pThirteenFC.center = CGPointMake(ikOneFC, pThirteenFC.center.y);
    }
    if (pFourteenFC.center.x > ikFourFC) {
        pFourteenFC.center = CGPointMake(ikOneFC, pFourteenFC.center.y);
    }
    if (pFithteenFC.center.x > ikFourFC) {
        pFithteenFC.center = CGPointMake(ikOneFC, pFithteenFC.center.y);
    }
    if (pSixteenFC.center.x > ikFourFC) {
        pSixteenFC.center = CGPointMake(ikOneFC, pSixteenFC.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SoundSwipeFC play];
    [self GetTheWord];
}

-(IBAction)IsItAWaord
{
    
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
    int i = 0;
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2) {
        @autoreleasepool {
            i++;
            if ([str isEqual:WordFC] && WordIsAlreadyDoneFC[i] == NO) {
                WordIsAlreadyDoneFC[i] = YES;
                ScoreFC = ScoreFC + 1;
                TotalAmountFC.text = [NSString stringWithFormat:@"%i OF  %i", ScoreFC, TheAmountFC];
            }
        }
        
    }
    
    if (ScoreFC == TheAmountFC) {
        [self PlayAnimation];
    }
    
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    int a;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        a = 75;
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            a = 60;
            
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            a = 55;
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            a = 58;
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            a = 60;
            
        }
    }
    
    TileOneFC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneFC.center.x - a, pOneFC.center.y - a, pOneFC.bounds.size.width, pOneFC.bounds.size.height)];
    TileTwoFC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoFC.center.x-a, pTwoFC.center.y-a, pTwoFC.bounds.size.width, pTwoFC.bounds.size.height)];
    TileThreeFC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeFC.center.x-a, pThreeFC.center.y-a, pThreeFC.bounds.size.width, pThreeFC.bounds.size.height)];
    TileFourFC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourFC.center.x-a, pFourFC.center.y-a, pFourFC.bounds.size.width, pFourFC.bounds.size.height)];
    TileFiveFC = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveFC.center.x-a, pFiveFC.center.y-a, pFiveFC.bounds.size.width, pFiveFC.bounds.size.height)];
    TileSixFC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixFC.center.x-a, pSixFC.center.y-a, pSixFC.bounds.size.width, pSixFC.bounds.size.height)];
    TileSevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenFC.center.x-a, pSevenFC.center.y-a, pSevenFC.bounds.size.width, pSevenFC.bounds.size.height)];
    TileEightFC = [[UIImageView alloc] initWithFrame:CGRectMake(pEightFC.center.x-a, pEightFC.center.y-a, pEightFC.bounds.size.width, pEightFC.bounds.size.height)];
    TileNineFC = [[UIImageView alloc] initWithFrame:CGRectMake(pNineFC.center.x-a, pNineFC.center.y-a, pNineFC.bounds.size.width, pNineFC.bounds.size.height)];
    TileTenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pTenFC.center.x-a, pTenFC.center.y-a, pTenFC.bounds.size.width, pTenFC.bounds.size.height)];
    TileElevenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pElevenFC.center.x-a, pElevenFC.center.y-a, pElevenFC.bounds.size.width, pElevenFC.bounds.size.height)];
    TileTwelveFC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelveFC.center.x-a, pTwelveFC.center.y-a, pTwelveFC.bounds.size.width, pTwelveFC.bounds.size.height)];
    TileThirteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteenFC.center.x-a, pThirteenFC.center.y-a, pThirteenFC.bounds.size.width, pThirteenFC.bounds.size.height)];
    TileFourteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteenFC.center.x-a, pFourteenFC.center.y-a, pFourteenFC.bounds.size.width, pFourteenFC.bounds.size.height)];
    TileFithteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteenFC.center.x-a, pFithteenFC.center.y-a, pFithteenFC.bounds.size.width, pFithteenFC.bounds.size.height)];
    TileSixteenFC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteenFC.center.x-a, pSixteenFC.center.y-a, pSixteenFC.bounds.size.width, pSixteenFC.bounds.size.height)];
    
    TileOneFC.backgroundColor = [UIColor whiteColor];
    TileTwoFC.backgroundColor = [UIColor whiteColor];
    TileThreeFC.backgroundColor = [UIColor whiteColor];
    TileFourFC.backgroundColor = [UIColor whiteColor];
    TileFiveFC.backgroundColor = [UIColor whiteColor];
    TileSixFC.backgroundColor = [UIColor whiteColor];
    TileSevenFC.backgroundColor = [UIColor whiteColor];
    TileEightFC.backgroundColor = [UIColor whiteColor];
    TileNineFC.backgroundColor = [UIColor whiteColor];
    TileTenFC.backgroundColor = [UIColor whiteColor];
    TileElevenFC.backgroundColor = [UIColor whiteColor];
    TileTwelveFC.backgroundColor = [UIColor whiteColor];
    TileThirteenFC.backgroundColor = [UIColor whiteColor];
    TileFourteenFC.backgroundColor = [UIColor whiteColor];
    TileFithteenFC.backgroundColor = [UIColor whiteColor];
    TileSixteenFC.backgroundColor = [UIColor whiteColor];
    
    TileOneFC.alpha = 0;
    TileTwoFC.alpha = 0;
    TileThreeFC.alpha = 0;
    TileFourFC.alpha = 0;
    TileFiveFC.alpha = 0;
    TileSixFC.alpha = 0;
    TileSevenFC.alpha = 0;
    TileEightFC.alpha = 0;
    TileNineFC.alpha = 0;
    TileTenFC.alpha = 0;
    TileElevenFC.alpha = 0;
    TileTwelveFC.alpha = 0;
    TileThirteenFC.alpha = 0;
    TileFourteenFC.alpha = 0;
    TileFithteenFC.alpha = 0;
    TileSixteenFC.alpha = 0;
    
    [self.view addSubview:TileOneFC];
    [self.view addSubview:TileTwoFC];
    [self.view addSubview:TileThreeFC];
    [self.view addSubview:TileFourFC];
    [self.view addSubview:TileFiveFC];
    [self.view addSubview:TileSixFC];
    [self.view addSubview:TileSevenFC];
    [self.view addSubview:TileEightFC];
    [self.view addSubview:TileNineFC];
    [self.view addSubview:TileTenFC];
    [self.view addSubview:TileElevenFC];
    [self.view addSubview:TileTwelveFC];
    [self.view addSubview:TileThirteenFC];
    [self.view addSubview:TileFourteenFC];
    [self.view addSubview:TileFithteenFC];
    [self.view addSubview:TileSixteenFC];
    
    TileOneFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileElevenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwelveFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThirteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFithteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneFC.alpha = 1;
    TileOneFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoFC.alpha = 1;
    TileTwoFC.transform = CGAffineTransformMakeScale(1, 1);
    TileFiveFC.alpha = 1;
    TileFiveFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileThreeFC.alpha = 1;
    TileThreeFC.transform = CGAffineTransformMakeScale(1, 1);
    TileSixFC.alpha = 1;
    TileSixFC.transform = CGAffineTransformMakeScale(1, 1);
    TileNineFC.alpha = 1;
    TileNineFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileFourFC.alpha = 1;
    TileFourFC.transform = CGAffineTransformMakeScale(1, 1);
    TileSevenFC.alpha = 1;
    TileSevenFC.transform = CGAffineTransformMakeScale(1, 1);
    TileTenFC.alpha = 1;
    TileTenFC.transform = CGAffineTransformMakeScale(1, 1);
    TileThirteenFC.alpha = 1;
    TileThirteenFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileEightFC.alpha = 1;
    TileEightFC.transform = CGAffineTransformMakeScale(1, 1);
    TileElevenFC.alpha = 1;
    TileElevenFC.transform = CGAffineTransformMakeScale(1, 1);
    TileFourteenFC.alpha = 1;
    TileFourteenFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwelveFC.alpha = 1;
    TileTwelveFC.transform = CGAffineTransformMakeScale(1, 1);
    TileFithteenFC.alpha = 1;
    TileFithteenFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileSixteenFC.alpha = 1;
    TileSixteenFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordFC.alpha = 0;
    TheCurrentWordFC.alpha = 0;
    SenderDisplayFC.alpha = 0;
    PauseFC.alpha = 0;
    CheckFC.alpha = 0;
    pOneFC.alpha = 0;
    pTwoFC.alpha = 0;
    pThreeFC.alpha = 0;
    pFourFC.alpha = 0;
    pFiveFC.alpha = 0;
    pSixFC.alpha = 0;
    pSevenFC.alpha = 0;
    pEightFC.alpha = 0;
    pNineFC.alpha = 0;
    pTenFC.alpha = 0;
    pElevenFC.alpha = 0;
    pTwelveFC.alpha = 0;
    pThirteenFC.alpha = 0;
    pFourteenFC.alpha = 0;
    pFithteenFC.alpha = 0;
    pSixteenFC.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountFC.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountFC.alpha = 0;
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
    [TileOneFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFiveFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSevenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEightFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileNineFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileElevenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwelveFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThirteenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourteenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFithteenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixteenFC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFiveFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileSevenFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileEightFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileTenFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileElevenFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwelveFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileThirteenFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourteenFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFithteenFC.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixteenFC.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneFC.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoFC.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeFC.transform = CGAffineTransformMakeScale(10, 10);
    TileFourFC.transform = CGAffineTransformMakeScale(10, 10);
    TileFiveFC.transform = CGAffineTransformMakeScale(10, 10);
    TileSixFC.transform = CGAffineTransformMakeScale(10, 10);
    TileSevenFC.transform = CGAffineTransformMakeScale(10, 10);
    TileEightFC.transform = CGAffineTransformMakeScale(10, 10);
    TileNineFC.transform = CGAffineTransformMakeScale(10, 10);
    TileTenFC.transform = CGAffineTransformMakeScale(10, 10);
    TileElevenFC.transform = CGAffineTransformMakeScale(10, 10);
    TileTwelveFC.transform = CGAffineTransformMakeScale(10, 10);
    TileThirteenFC.transform = CGAffineTransformMakeScale(10, 10);
    TileFourteenFC.transform = CGAffineTransformMakeScale(10, 10);
    TileFithteenFC.transform = CGAffineTransformMakeScale(10, 10);
    TileSixteenFC.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileElevenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwelveFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThirteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFithteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixteenFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountFC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)GetTheWord
{
    xOneFC = pOneFC.center.x;
    yOneFC = pOneFC.center.y;
    xTwoFC = pTwoFC.center.x;
    yTwoFC = pTwoFC.center.y;
    xThreeFC = pThreeFC.center.x;
    yThreeFC = pThreeFC.center.y;
    xFourFC = pFourFC.center.x;
    yFourFC = pFourFC.center.y;
    xFiveFC = pFiveFC.center.x;
    yFiveFC = pFiveFC.center.y;
    xSixFC = pSixFC.center.x;
    ySixFC = pSixFC.center.y;
    ySevenFC = pSevenFC.center.y;
    xSevenFC = pSevenFC.center.x;
    xEightFC = pEightFC.center.x;
    yEightFC = pEightFC.center.y;
    yNineFC = pNineFC.center.y;
    xNineFC = pNineFC.center.x;
    xTenFC = pTenFC.center.x;
    yTenFC = pTenFC.center.y;
    xElevenFC = pElevenFC.center.x;
    yElevenFC = pElevenFC.center.y;
    xTwelveFC = pTwelveFC.center.x;
    yTwelveFC = pTwelveFC.center.y;
    xThirteenFC = pThirteenFC.center.x;
    yThirteenFC = pThirteenFC.center.y;
    xFourteenFC = pFourteenFC.center.x;
    yFourteenFC = pFourteenFC.center.y;
    xFithteenFC = pFithteenFC.center.x;
    yFithteenFC = pFithteenFC.center.y;
    xSixteenFC = pSixteenFC.center.x;
    ySixteenFC = pSixteenFC.center.y;
    
    if (pOneFC.center.y == iktOneFC) {
        if (pOneFC.center.x == ikOneFC) {
            wOneFC = cOneFC;
        } else if (pOneFC.center.x == ikTwoFC) {
            wTwoFC = cOneFC;
        } else if (pOneFC.center.x == ikThreeFC) {
            wThreeFC = cOneFC;
        } else if (pOneFC.center.x == ikFourFC) {
            wFourFC = cOneFC;
        }
    }
    
    if (pTwoFC.center.y == iktOneFC) {
        if (pTwoFC.center.x == ikOneFC) {
            wOneFC = cTwoFC;
        } else if (pTwoFC.center.x == ikTwoFC) {
            wTwoFC = cTwoFC;
        } else if (pTwoFC.center.x == ikThreeFC) {
            wThreeFC = cTwoFC;
        } else if (pTwoFC.center.x == ikFourFC) {
            wFourFC = cTwoFC;
        }
    }
    
    if (pThreeFC.center.y == iktOneFC) {
        if (pThreeFC.center.x == ikOneFC) {
            wOneFC = cThreeFC;
        } else if (pThreeFC.center.x == ikTwoFC) {
            wTwoFC = cThreeFC;
        } else if (pThreeFC.center.x == ikThreeFC) {
            wThreeFC = cThreeFC;
        } else if (pThreeFC.center.x == ikFourFC) {
            wFourFC = cThreeFC;
        }
    }
    
    if (pFourFC.center.y == iktOneFC) {
        if (pFourFC.center.x == ikOneFC) {
            wOneFC = cFourFC;
        } else if (pFourFC.center.x == ikTwoFC) {
            wTwoFC = cFourFC;
        } else if (pFourFC.center.x == ikThreeFC) {
            wThreeFC = cFourFC;
        } else if (pFourFC.center.x == ikFourFC) {
            wFourFC = cFourFC;
        }
    }
    
    if (pFiveFC.center.y == iktOneFC) {
        if (pFiveFC.center.x == ikOneFC) {
            wOneFC = cFiveFC;
        } else if (pFiveFC.center.x == ikTwoFC) {
            wTwoFC = cFiveFC;
        } else if (pFiveFC.center.x == ikThreeFC) {
            wThreeFC = cFiveFC;
        } else if (pFiveFC.center.x == ikFourFC) {
            wFourFC = cFiveFC;
        }
    }
    
    if (pSixFC.center.y == iktOneFC) {
        if (pSixFC.center.x == ikOneFC) {
            wOneFC = cSixFC;
        } else if (pSixFC.center.x == ikTwoFC) {
            wTwoFC = cSixFC;
        } else if (pSixFC.center.x == ikThreeFC) {
            wThreeFC = cSixFC;
        } else if (pSixFC.center.x == ikFourFC) {
            wFourFC = cSixFC;
        }
    }
    
    if (pSevenFC.center.y == iktOneFC) {
        if (pSevenFC.center.x == ikOneFC) {
            wOneFC = cSevenFC;
        } else if (pSevenFC.center.x == ikTwoFC) {
            wTwoFC = cSevenFC;
        } else if (pSevenFC.center.x == ikThreeFC) {
            wThreeFC = cSevenFC;
        } else if (pSevenFC.center.x == ikFourFC) {
            wFourFC = cSevenFC;
        }
    }
    
    if (pEightFC.center.y == iktOneFC) {
        if (pEightFC.center.x == ikOneFC) {
            wOneFC = cEightFC;
        } else if (pEightFC.center.x == ikTwoFC) {
            wTwoFC = cEightFC;
        } else if (pEightFC.center.x == ikThreeFC) {
            wThreeFC = cEightFC;
        } else if (pEightFC.center.x == ikFourFC) {
            wFourFC = cEightFC;
        }
    }
    
    if (pNineFC.center.y == iktOneFC) {
        if (pNineFC.center.x == ikOneFC) {
            wOneFC = cNineFC;
        } else if (pNineFC.center.x == ikTwoFC) {
            wTwoFC = cNineFC;
        } else if (pNineFC.center.x == ikThreeFC) {
            wThreeFC = cNineFC;
        } else if (pNineFC.center.x == ikFourFC) {
            wFourFC = cNineFC;
        }
    }
    
    if (pTenFC.center.y == iktOneFC) {
        if (pTenFC.center.x == ikOneFC) {
            wOneFC = cTenFC;
        } else if (pTenFC.center.x == ikTwoFC) {
            wTwoFC = cTenFC;
        } else if (pTenFC.center.x == ikThreeFC) {
            wThreeFC = cTenFC;
        } else if (pTenFC.center.x == ikFourFC) {
            wFourFC = cTenFC;
        }
    }
    
    if (pElevenFC.center.y == iktOneFC) {
        if (pElevenFC.center.x == ikOneFC) {
            wOneFC = cElevenFC;
        } else if (pElevenFC.center.x == ikTwoFC) {
            wTwoFC = cElevenFC;
        } else if (pElevenFC.center.x == ikThreeFC) {
            wThreeFC = cElevenFC;
        } else if (pElevenFC.center.x == ikFourFC) {
            wFourFC = cElevenFC;
        }
    }
    
    if (pTwelveFC.center.y == iktOneFC) {
        if (pTwelveFC.center.x == ikOneFC) {
            wOneFC = cTwelveFC;
        } else if (pTwelveFC.center.x == ikTwoFC) {
            wTwoFC = cTwelveFC;
        } else if (pTwelveFC.center.x == ikThreeFC) {
            wThreeFC = cTwelveFC;
        } else if (pTwelveFC.center.x == ikFourFC) {
            wFourFC = cTwelveFC;
        }
    }
    
    if (pThirteenFC.center.y == iktOneFC) {
        if (pThirteenFC.center.x == ikOneFC) {
            wOneFC = cThirteenFC;
        } else if (pThirteenFC.center.x == ikTwoFC) {
            wTwoFC = cThirteenFC;
        } else if (pThirteenFC.center.x == ikThreeFC) {
            wThreeFC = cThirteenFC;
        } else if (pThirteenFC.center.x == ikFourFC) {
            wFourFC = cThirteenFC;
        }
    }
    
    if (pFourteenFC.center.y == iktOneFC) {
        if (pFourteenFC.center.x == ikOneFC) {
            wOneFC = cFourteenFC;
        } else if (pFourteenFC.center.x == ikTwoFC) {
            wTwoFC = cFourteenFC;
        } else if (pFourteenFC.center.x == ikThreeFC) {
            wThreeFC = cFourteenFC;
        } else if (pFourteenFC.center.x == ikFourFC) {
            wFourFC = cFourteenFC;
        }
    }
    
    if (pFithteenFC.center.y == iktOneFC) {
        if (pFithteenFC.center.x == ikOneFC) {
            wOneFC = cFithteenFC;
        } else if (pFithteenFC.center.x == ikTwoFC) {
            wTwoFC = cFithteenFC;
        } else if (pFithteenFC.center.x == ikThreeFC) {
            wThreeFC = cFithteenFC;
        } else if (pFithteenFC.center.x == ikFourFC) {
            wFourFC = cFithteenFC;
        }
    }
    
    if (pSixteenFC.center.y == iktOneFC) {
        if (pSixteenFC.center.x == ikOneFC) {
            wOneFC = cSixteenFC;
        } else if (pSixteenFC.center.x == ikTwoFC) {
            wTwoFC = cSixteenFC;
        } else if (pSixteenFC.center.x == ikThreeFC) {
            wThreeFC = cSixteenFC;
        } else if (pSixteenFC.center.x == ikFourFC) {
            wFourFC = cSixteenFC;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneFC];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoFC];
    NSString *Threes = [NSString stringWithFormat:@"%c", wThreeFC];
    NSString *Fours = [NSString stringWithFormat:@"%c", wFourFC];
    
    WordFC = [NSString stringWithFormat:@"%@%@%@%@", Ones, Twos, Threes, Fours];
    TheCurrentWordFC.text = [WordFC uppercaseString];
    
    pOneFC.center = CGPointMake(xOneFC, yOneFC);
    pTwoFC.center = CGPointMake(xTwoFC, yTwoFC);
    pThreeFC.center = CGPointMake(xThreeFC, yThreeFC);
    pFourFC.center = CGPointMake(xFourFC, yFourFC);
    pFiveFC.center = CGPointMake(xFiveFC, yFiveFC);
    pSixFC.center = CGPointMake(xSixFC, ySixFC);
    pSevenFC.center = CGPointMake(xSevenFC, ySevenFC);
    pEightFC.center = CGPointMake(xEightFC, yEightFC);
    pNineFC.center = CGPointMake(xNineFC, yNineFC);
    pTenFC.center = CGPointMake(xTenFC, yTenFC);
    pElevenFC.center = CGPointMake(xElevenFC, yElevenFC);
    pTwelveFC.center = CGPointMake(xTwelveFC, yTwelveFC);
    pThirteenFC.center = CGPointMake(xThirteenFC, yThirteenFC);
    pFourteenFC.center = CGPointMake(xFourteenFC, yFourteenFC);
    pFithteenFC.center = CGPointMake(xFithteenFC, yFithteenFC);
    pSixteenFC.center = CGPointMake(xSixteenFC, ySixteenFC);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseFC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoFC play];
    
    PauseFC.userInteractionEnabled = NO;
    CheckFC.userInteractionEnabled = NO;
    PauseDisplayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayFC.alpha = 1.0;
        
        CurrentWordsFC.alpha = 1;
        PlayFC.alpha = 1;
        HomeFC.alpha = 1;
        
        PauseFC.alpha = 0;
        TotalAmountFC.alpha = 0;
        SenderDisplayFC.alpha = 0;
        BarUnderWordFC.alpha = 0;
        TheCurrentWordFC.alpha = 0;
        CheckFC.alpha = 0;
        
        PauseDisplayFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWordsFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        PauseFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CheckFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        [pOneFC setAlpha:0];
        [pTwoFC setAlpha:0];
        [pThreeFC setAlpha:0];
        [pFourFC setAlpha:0];
        [pFiveFC setAlpha:0];
        [pSixFC setAlpha:0];
        [pSevenFC setAlpha:0];
        [pEightFC setAlpha:0];
        [pNineFC setAlpha:0];
        [pTenFC setAlpha:0];
        [pElevenFC setAlpha:0];
        [pTwelveFC setAlpha:0];
        [BarUnderWordFC setAlpha:0];
        [pThirteenFC setAlpha:0];
        [pFourteenFC setAlpha:0];
        [pFithteenFC setAlpha:0];
        [pSixteenFC setAlpha:0];
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerFC = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerFC = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerFC = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerFC = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerFC = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerFC.scrollEnabled = YES;
    WordScrollerFC.userInteractionEnabled = YES;
    WordScrollerFC.backgroundColor = [UIColor blackColor];
    WordScrollerFC.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerFC.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerFC aboveSubview:PauseDisplayFC];
    if (ScoreFC > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        int z = 1;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
                {
                    if (WordIsAlreadyDoneFC[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerFC.subviews) {
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
                            WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerFC addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneFC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerFC.subviews) {
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
                                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerFC addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneFC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerFC.subviews) {
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
                                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerFC addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneFC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerFC.subviews) {
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
                                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerFC addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneFC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerFC.subviews) {
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
                                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerFC addSubview:lbl];
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
            [WordScrollerFC addSubview:lbll];
            WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                // do iPhone 4s stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerFC addSubview:lbll];
                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerFC addSubview:lbll];
                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerFC addSubview:lbll];
                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerFC addSubview:lbll];
                WordScrollerFC.contentSize = CGSizeMake(WordScrollerFC.bounds.size.width, lbll.center.y + 50);
            }
        }
    }

}

-(IBAction)Play:(id)sender
{
    [SoundOneFc play];
    [SoundTwoFC play];
    
    for (UIView *v in WordScrollerFC.subviews) {
        [v removeFromSuperview];
    }
    [WordScrollerFC removeFromSuperview];
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayFC.alpha = 0;
        HomeFC.alpha = 0;
        PlayFC.alpha = 0;
        CurrentWordsFC.alpha = 0;
        
        CheckFC.userInteractionEnabled = YES;
        PauseFC.userInteractionEnabled = YES;
        
        PauseFC.alpha = 1;
        TotalAmountFC.alpha = 1;
        SenderDisplayFC.alpha =1;
        BarUnderWordFC.alpha = 1;
        TheCurrentWordFC.alpha =1;
        CheckFC.alpha = 1;
        
        PauseDisplayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        PauseFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        TotalAmountFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        SenderDisplayFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        BarUnderWordFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        CheckFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        TheCurrentWordFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        [pOneFC setAlpha:1];
        [pTwoFC setAlpha:1];
        [pThreeFC setAlpha:1];
        [pFourFC setAlpha:1];
        [pFiveFC setAlpha:1];
        [pSixFC setAlpha:1];
        [pSevenFC setAlpha:1];
        [pEightFC setAlpha:1];
        [pNineFC setAlpha:1];
        [pTenFC setAlpha:1];
        [pElevenFC setAlpha:1];
        [pTwelveFC setAlpha:1];
        [BarUnderWordFC setAlpha:1];
        [pThirteenFC setAlpha:1];
        [pFourteenFC setAlpha:1];
        [pFithteenFC setAlpha:1];
        [pSixteenFC setAlpha:1];
        
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneFc play];
    [SoundTwoFC play];
    
    for (UIView *v in WordScrollerFC.subviews) {
        [v removeFromSuperview];
    }
    [WordScrollerFC removeFromSuperview];
    
    
    for (int i = 0; i <= 3822; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneFC[i] = NO;
        }
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayFC.alpha = 0;
        HomeFC.alpha = 0;
        PlayFC.alpha = 0;
        CurrentWordsFC.alpha = 0;
        
        CheckFC.userInteractionEnabled = YES;
        PauseFC.userInteractionEnabled = YES;
        
        PauseDisplayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeFC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        PauseFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        TotalAmountFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        SenderDisplayFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        BarUnderWordFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        CheckFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        TheCurrentWordFC.transform =CGAffineTransformMakeScale(1.0,1.0);
    }];
    
    [pOneFC setAlpha:0];
    [pTwoFC setAlpha:0];
    [pThreeFC setAlpha:0];
    [pFourFC setAlpha:0];
    [pFiveFC setAlpha:0];
    [pSixFC setAlpha:0];
    [pSevenFC setAlpha:0];
    [pEightFC setAlpha:0];
    [pNineFC setAlpha:0];
    [pTenFC setAlpha:0];
    [pElevenFC setAlpha:0];
    [pTwelveFC setAlpha:0];
    [BarUnderWordFC setAlpha:0];
    [pThirteenFC setAlpha:0];
    [pFourteenFC setAlpha:0];
    [pFithteenFC setAlpha:0];
    [pSixteenFC setAlpha:0];
    [TheCurrentWordFC setAlpha:0];
    [CheckFC setAlpha:0];
    [PauseFC setAlpha:0];
    [SenderDisplayFC setAlpha:0];
    [TotalAmountFC setAlpha:0];
    [self BackToHome];
}

-(void)BackToHome
{
    
    for (int i = 0; i <= 3822; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneFC[i] = NO;
        }
    }
    
    ScoreFC = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    [tHomeFC setAlpha:1];
    [UIView commitAnimations];
    
    [TileOneFC removeFromSuperview];
    [TileTwoFC removeFromSuperview];
    [TileThreeFC removeFromSuperview];
    [TileFourFC removeFromSuperview];
    [TileFiveFC removeFromSuperview];
    [TileSixFC removeFromSuperview];
    [TileSevenFC removeFromSuperview];
    [TileEightFC removeFromSuperview];
    [TileNineFC removeFromSuperview];
    [TileTenFC removeFromSuperview];
    [TileElevenFC removeFromSuperview];
    [TileTwelveFC removeFromSuperview];
    [TileThirteenFC removeFromSuperview];
    [TileFourteenFC removeFromSuperview];
    [TileFithteenFC removeFromSuperview];
    [TileSixteenFC removeFromSuperview];
    
    pOneFC.center = CGPointMake(ikOneFC, iktOneFC);
    pTwoFC.center = CGPointMake(ikTwoFC, iktTwoFC);
    pThreeFC.center = CGPointMake(ikThreeFC, iktThreeFC);
    pFourFC.center = CGPointMake(ikFourFC, iktFourFC);
    pFiveFC.center = CGPointMake(ikFiveFC, iktFiveFC);
    pSixFC.center = CGPointMake(ikSixFC, iktSixFC);
    pSevenFC.center = CGPointMake(ikSevenFC, iktSevenFC);
    pEightFC.center = CGPointMake(ikEightFC, iktEightFC);
    pNineFC.center = CGPointMake(ikNineFC, iktNineFC);
    pTenFC.center = CGPointMake(ikTenFC, iktTenFC);
    pElevenFC.center = CGPointMake(ikElevenFC, iktElevenFC);
    pTwelveFC.center = CGPointMake(ikTwelveFC, iktTwelveFC);
    pThirteenFC.center = CGPointMake(ikThirteenFC, iktThirteenFC);
    pFourteenFC.center = CGPointMake(ikFourteenFC, iktFourteenFC);
    pFithteenFC.center = CGPointMake(ikFithteenFC, iktFithteenFC);
    pSixteenFC.center = CGPointMake(ikSixteenFC, iktSixteenFC);
    
    BBSelectionFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gThreeFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gTwoFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gOneFC.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        gOneFC.alpha = 1.0;
        gTwoFC.alpha = 1;
        gThreeFC.alpha = 1;
        BBSelectionFC.alpha = 1;
        
        gOneFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        gTwoFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        gThreeFC.transform =CGAffineTransformMakeScale(1.0,1.0);
        BBSelectionFC.transform =CGAffineTransformMakeScale(1.0,1.0);
    }];
    
    siOneFC = 0;
    siTwoFC = 0;
    siThreeFC = 0;
    siFourFC = 0;
    siFiveFC = 0;
    siSixFC = 0;
    siSevenFC = 0;
    siEightFC = 0;
    siNineFC = 0;
    siTenFC = 0;
    siElevenFC = 0;
    siTwelveFC = 0;
    siThirteenFC = 0;
    siFourteenFC = 0;
    siFithteenFC = 0;
    siSixteenFC = 0;
    
    NSString *imageName = @"Blank.png";
    spOneFC.image = [UIImage imageNamed:imageName];
    spTwoFC.image = [UIImage imageNamed:imageName];
    spThreeFC.image = [UIImage imageNamed:imageName];
    spFourFC.image = [UIImage imageNamed:imageName];
    spFiveFC.image = [UIImage imageNamed:imageName];
    spSixFC.image = [UIImage imageNamed:imageName];
    spSevenFC.image = [UIImage imageNamed:imageName];
    spEightFC.image = [UIImage imageNamed:imageName];
    spNineFC.image = [UIImage imageNamed:imageName];
    spTenFC.image = [UIImage imageNamed:imageName];
    spElevenFC.image = [UIImage imageNamed:imageName];
    spTwelveFC.image = [UIImage imageNamed:imageName];
    spThirteenFC.image = [UIImage imageNamed:imageName];
    spFourteenFC.image = [UIImage imageNamed:imageName];
    spFithteenFC.image = [UIImage imageNamed:imageName];
    spSixteenFC.image = [UIImage imageNamed:imageName];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:0.5];
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        spOneFC.center = CGPointMake(ikOneFC, iktOneFC-50);
        spTwoFC.center = CGPointMake(ikTwoFC, iktTwoFC-50);
        spThreeFC.center = CGPointMake(ikThreeFC, iktThreeFC-50);
        spFourFC.center = CGPointMake(ikFourFC, iktFourFC-50);
        spFiveFC.center = CGPointMake(ikFiveFC, iktFiveFC-50);
        spSixFC.center = CGPointMake(ikSixFC, iktSixFC-50);
        spSevenFC.center = CGPointMake(ikSevenFC, iktSevenFC-50);
        spEightFC.center = CGPointMake(ikEightFC, iktEightFC-50);
        spNineFC.center = CGPointMake(ikNineFC, iktNineFC-50);
        spTenFC.center = CGPointMake(ikTenFC, iktTenFC-50);
        spElevenFC.center = CGPointMake(ikElevenFC, iktElevenFC-50);
        spTwelveFC.center = CGPointMake(ikTwelveFC, iktTwelveFC-50);
        spThirteenFC.center = CGPointMake(ikThirteenFC, iktThirteenFC-50);
        spFourteenFC.center = CGPointMake(ikFourteenFC, iktFourteenFC-50);
        spFithteenFC.center = CGPointMake(ikFithteenFC, iktFithteenFC-50);
        spSixteenFC.center = CGPointMake(ikSixteenFC, iktSixteenFC-50);
    } else {
        spOneFC.center = CGPointMake(ikOneFC, iktOneFC);
        spTwoFC.center = CGPointMake(ikTwoFC, iktTwoFC);
        spThreeFC.center = CGPointMake(ikThreeFC, iktThreeFC);
        spFourFC.center = CGPointMake(ikFourFC, iktFourFC);
        spFiveFC.center = CGPointMake(ikFiveFC, iktFiveFC);
        spSixFC.center = CGPointMake(ikSixFC, iktSixFC);
        spSevenFC.center = CGPointMake(ikSevenFC, iktSevenFC);
        spEightFC.center = CGPointMake(ikEightFC, iktEightFC);
        spNineFC.center = CGPointMake(ikNineFC, iktNineFC);
        spTenFC.center = CGPointMake(ikTenFC, iktTenFC);
        spElevenFC.center = CGPointMake(ikElevenFC, iktElevenFC);
        spTwelveFC.center = CGPointMake(ikTwelveFC, iktTwelveFC);
        spThirteenFC.center = CGPointMake(ikThirteenFC, iktThirteenFC);
        spFourteenFC.center = CGPointMake(ikFourteenFC, iktFourteenFC);
        spFithteenFC.center = CGPointMake(ikFithteenFC, iktFithteenFC);
        spSixteenFC.center = CGPointMake(ikSixteenFC, iktSixteenFC);
    }
    
    spOneFC.alpha = 1;
    spTwoFC.alpha = 1;
    spThreeFC.alpha = 1;
    spFourFC.alpha = 1;
    spFiveFC.alpha = 1;
    spSixFC.alpha = 1;
    spSevenFC.alpha = 1;
    spEightFC.alpha = 1;
    spNineFC.alpha = 1;
    spTenFC.alpha = 1;
    spElevenFC.alpha = 1;
    spTwelveFC.alpha = 1;
    spThirteenFC.alpha = 1;
    spFourteenFC.alpha = 1;
    spFithteenFC.alpha = 1;
    spSixteenFC.alpha = 1;
    StartFC.alpha = 1;
    [UIView commitAnimations];
}

-(IBAction)gTwo:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [BBSelectionFC setAlpha:0];
    
    spOneFC.alpha = 0;
    spTwoFC.alpha = 0;
    spThreeFC.alpha = 0;
    spFourFC.alpha = 0;
    spFiveFC.alpha = 0;
    spSixFC.alpha = 0;
    spSevenFC.alpha = 0;
    spEightFC.alpha = 0;
    spNineFC.alpha = 0;
    spTenFC.alpha = 0;
    spElevenFC.alpha = 0;
    spTwelveFC.alpha = 0;
    spThirteenFC.alpha = 0;
    spFourteenFC.alpha = 0;
    spFithteenFC.alpha = 0;
    spSixteenFC.alpha = 0;
    StartFC.alpha = 0;
    ErrorMessageFC.alpha = 0;
    [UIView commitAnimations];
    BackGroundTwoFC.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneFC.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"GTQuestionsFour" sender:self];
}

-(IBAction)gOne:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [BBSelectionFC setAlpha:0];
    
    spOneFC.alpha = 0;
    spTwoFC.alpha = 0;
    spThreeFC.alpha = 0;
    spFourFC.alpha = 0;
    spFiveFC.alpha = 0;
    spSixFC.alpha = 0;
    spSevenFC.alpha = 0;
    spEightFC.alpha = 0;
    spNineFC.alpha = 0;
    spTenFC.alpha = 0;
    spElevenFC.alpha = 0;
    spTwelveFC.alpha = 0;
    spThirteenFC.alpha = 0;
    spFourteenFC.alpha = 0;
    spFithteenFC.alpha = 0;
    spSixteenFC.alpha = 0;
    StartFC.alpha = 0;
    ErrorMessageFC.alpha = 0;
    [UIView commitAnimations];
    BackGroundThreeFC.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneFC.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameOne) withObject:nil afterDelay:1];
}

-(void)GoToGameOne
{
    [self performSegueWithIdentifier:@"GTGridsFour" sender:self];
}

-(IBAction)tHome:(id)sender
{
    [SoundOneFc play];
    [SoundTwoFC play];
    
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourFC.alpha = 0;
        BackGroundFourFC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourFC.alpha = 1;
                             BackGroundFourFC.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoingToHomeFromFourChoice" sender:self];
}

@end