//
//  ThreeChoice.m
//  Typex V2
//
//  Created by Michael Mooney on 22/06/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//

#import "ThreeChoice.h"
#import <AVFoundation/AVFoundation.h>

NSString *WordTC;

int replayTC, ScoreTC, PreviousTC, PanningIntTC, PPanningMethodTC;
NSInteger PanningSensitivityTC;
int TheAmountTC;
int siOneTC, siTwoTC, siThreeTC, siFourTC, siFiveTC, siSixTC, siSevenTC, siEightTC, siNineTC;

char cOneTC, cTwoTC, cThreeTC, cFourTC, cFiveTC, cSixTC, cSevenTC, cEightTC, cNineTC;
char wOneTC, wTwoTC, wThreeTC;
char  kOneTC, kTwoTC, kThreeTC, kFourTC, kFiveTC, kSixTC, kSevenTC, kEightTC, kNineTC, kTenTC, kElevenTC, kTwelveTC, kThirteenTC, kFourteenTC, kFithteenTC, kSixteenTC, kSeventeenTC, kEighteenTC, kNineteenTC, kTwentyTC, kTwentyOneTC, kTwentyTwoTC, kTwentyThreeTC, kTwentyFourTC, kTwentyFiveTC, kTwentySixTC;

float ikOneTC, ikTwoTC, ikThreeTC, ikFourTC, ikFiveTC, ikSixTC, ikSevenTC, ikEightTC, ikNineTC;
float iktOneTC, iktTwoTC, iktThreeTC, iktFourTC, iktFiveTC, iktSixTC, iktSevenTC, iktEightTC, iktNineTC;
float iLeftTC, iRightTC, iUpTC, iDownTC;
float pointOfIntrestTC;
float xOneTC, yOneTC, xTwoTC, yTwoTC, xThreeTC, yThreeTC, xFourTC, yFourTC, xFiveTC, yFiveTC, xSixTC, ySixTC, xSevenTC, ySevenTC, xEightTC, yEightTC, xNineTC, yNineTC;

CGPoint OneTC, TwoTC, ThreeTC, FourTC, FiveTC, SixTC, SevenTC, EightTC, NineTC, distanceTC;

BOOL WordIsAlreadyDoneTC[956];

@interface ThreeChoice () <AVAudioPlayerDelegate>
{
    AVAudioPlayer *SoundOneTC, *SoundTwoTC, *SwipeSoundTC;
    
#pragma Mark Global - Used throughout
    IBOutlet UIButton *tHomeTC, *CheckTC;
    IBOutlet UIImageView *BackGroundOneTC, *BackGroundTwoTC, *BackGroundThreeTC, *BackGroundFourTC;
    
#pragma Mark Game - Grids
    IBOutlet UIImageView *pOneTC, *pTwoTC, *pThreeTC, *pFourTC, *pFiveTC, *pSixTC, *pSevenTC, *pEightTC, *pNineTC;
    IBOutlet UILabel *TotalAmountTC;
    IBOutlet UIButton *PauseTC;
    IBOutlet UILabel *TheCurrentWordTC;
    IBOutlet UIImageView *PauseDisplayTC, *SenderDisplayTC;
    IBOutlet UIButton *HomeTC, *PlayTC;
    IBOutlet UIImageView *BarUnderWordTC;
    IBOutlet UIImageView *BBSelectionTC;
    IBOutlet UIImageView *TileOneTC, *TileTwoTC, *TileThreeTC, *TileFourTC, *TileFiveTC, *TileSixTC, *TileSevenTC, *TileEightTC, *TileNineTC;
    IBOutlet UIImageView *spOneTC, *spTwoTC, *spThreeTC, *spFourTC, *spFiveTC, *spSixTC, *spSevenTC, *spEightTC, *spNineTC;
    
#pragma Mark Selection - Fist Page
    IBOutlet UIButton *gOneTC, *gTwoTC, *gThreeTC;
    IBOutlet UIButton *StartTC;
    IBOutlet UILabel *ErrorMessageTC;
    
    IBOutlet UIScrollView *WordScrollerTC;
    IBOutlet UILabel *CurrentWordsTC;
}
@end

@implementation ThreeChoice


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

    BackGroundFourTC.alpha = 0;
    
#pragma Mark The Game Items
    
    ScoreTC = 0;
    
    PauseTC.alpha = 0;
    CheckTC.alpha = 0;
    TotalAmountTC.alpha = 0;
    
    pOneTC.alpha = 0;
    pTwoTC.alpha = 0;
    pThreeTC.alpha = 0;
    CurrentWordsTC.alpha = 0;
    PlayTC.alpha = 0;
    HomeTC.alpha = 0;
    pFourTC.alpha = 0;
    pFiveTC.alpha = 0;
    pSixTC.alpha = 0;
    pSevenTC.alpha = 0;
    pEightTC.alpha = 0;
    pNineTC.alpha = 0;
    BarUnderWordTC.alpha = 0;
    SenderDisplayTC.alpha = 0;
    TheCurrentWordTC.alpha = 0;
    PauseDisplayTC.alpha = 0;
    StartTC.alpha = 0;
    
#pragma Mark The Selection Page
    
    tHomeTC.alpha = 1;
    gOneTC.alpha = 1;
    gTwoTC.alpha = 1;
    gThreeTC.alpha = 1;
    BBSelectionTC.alpha =1;
    
    spOneTC.alpha = 0;
    spTwoTC.alpha = 0;
    spThreeTC.alpha = 0;
    spFourTC.alpha = 0;
    spFiveTC.alpha = 0;
    spSixTC.alpha = 0;
    spSevenTC.alpha = 0;
    spEightTC.alpha = 0;
    spNineTC.alpha = 0;
    ErrorMessageTC.alpha = 0;
    
    ikOneTC = pOneTC.center.x;
    iktOneTC = pOneTC.center.y;
    ikTwoTC = pTwoTC.center.x;
    iktTwoTC = pTwoTC.center.y;
    ikThreeTC = pThreeTC.center.x;
    iktThreeTC = pThreeTC.center.y;
    ikFourTC = pFourTC.center.x;
    iktFourTC = pFourTC.center.y;
    ikFiveTC = pFiveTC.center.x;
    iktFiveTC = pFiveTC.center.y;
    ikSixTC = pSixTC.center.x;
    iktSixTC = pSixTC.center.y;
    ikSevenTC = pSevenTC.center.x;
    iktSevenTC = pSevenTC.center.y;
    ikEightTC = pEightTC.center.x;
    iktEightTC = pEightTC.center.y;
    ikNineTC = pNineTC.center.x;
    iktNineTC = pNineTC.center.y;
    
    
    kOneTC = 'a';
    kTwoTC = 'b';
    kThreeTC = 'c';
    kFourTC = 'd';
    kFiveTC = 'e';
    kSixTC = 'f';
    kSevenTC = 'g';
    kEightTC = 'h';
    kNineTC = 'i';
    kTenTC = 'j';
    kElevenTC = 'k';
    kTwelveTC = 'l';
    kThirteenTC = 'm';
    kFourteenTC = 'n';
    kFithteenTC = 'o';
    kSixteenTC = 'p';
    kSeventeenTC = 'q';
    kEighteenTC = 'r';
    kNineteenTC = 's';
    kTwentyTC = 't';
    kTwentyOneTC = 'u';
    kTwentyTwoTC = 'v';
    kTwentyThreeTC = 'w';
    kTwentyFourTC = 'x';
    kTwentyFiveTC = 'y';
    kTwentySixTC = 'z';
    
    spOneTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spTwoTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spThreeTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spFourTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spSixTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spSevenTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spEightTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    spNineTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    PauseDisplayTC.backgroundColor = [UIColor blackColor];
    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOneTC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwoTC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSoundTC = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
    BOOL HomeFQ = NO;
    [[NSUserDefaults standardUserDefaults] setBool:HomeFQ forKey:@"IsItComingInFromHomeScreen"];
    
    [self performSelector:@selector(Opening) withObject:nil afterDelay:0.1];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        SenderDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 136, 45)];
        TotalAmountTC = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 131, 38)];
        TotalAmountTC.font = [[TotalAmountTC font] fontWithSize:15];
        PauseTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        CheckTC = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWordTC = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWordTC = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWordTC.font  = [[TheCurrentWordTC font] fontWithSize:15];
        
        BackGroundOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        tHomeTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        gOneTC = [[UIButton alloc] initWithFrame:CGRectMake(87, 434, 40, 40)];
        gTwoTC = [[UIButton alloc] initWithFrame:CGRectMake(140, 434, 40, 40)];
        gThreeTC = [[UIButton alloc] initWithFrame:CGRectMake(193, 434, 40, 40)];
        BBSelectionTC = [[UIImageView alloc] initWithFrame:CGRectMake(189, 430, 48, 48)];
        
        PlayTC = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        HomeTC = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWordsTC = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWordsTC.font  = [[CurrentWordsTC font] fontWithSize:20];
        
        StartTC = [[UIButton alloc] initWithFrame:CGRectMake(110, 85, 98, 40)];
        ErrorMessageTC = [[UILabel alloc] initWithFrame:CGRectMake(94, 32, 173, 45)];
        ErrorMessageTC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
        
        pOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(49, 229, 70, 70)];
        pTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(125, 229, 70, 70)];
        pThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(201, 229, 70, 70)];
        pFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(49, 305, 70, 70)];
        pFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(125, 305, 70, 70)];
        pSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(201, 305, 70, 70)];
        pSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(49, 481, 70, 70)];
        pEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(125, 481, 70, 70)];
        pNineTC  = [[UIImageView alloc] initWithFrame:CGRectMake(201, 481, 70, 70)];
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 155, 50)];
        TotalAmountTC = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 150, 36)];
        TotalAmountTC.font = [[TotalAmountTC font] fontWithSize:20];
        PauseTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        CheckTC = [[UIButton alloc] initWithFrame:CGRectMake(60, 154, 200, 40)];
        BarUnderWordTC = [[UIImageView alloc] initWithFrame:CGRectMake(41, 242, 240, 2)];
        TheCurrentWordTC = [[UILabel alloc] initWithFrame:CGRectMake(117, 215, 87, 28)];
        TheCurrentWordTC.font  = [[TheCurrentWordTC font] fontWithSize:25];
        pOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(16, 258, 90, 90)];
        pTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(116, 258, 90, 90)];
        pThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(216, 258, 90, 90)];
        pFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(16, 358, 90, 90)];
        pFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(116, 358, 90, 90)];
        pSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(216, 358, 90, 90)];
        pSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(16, 458, 90, 90)];
        pEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(116, 458, 90, 90)];
        pNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(216, 458, 90, 90)];
        
        tHomeTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneTC = [[UIButton alloc] initWithFrame:CGRectMake(89, 520, 40, 40)];
        gTwoTC = [[UIButton alloc] initWithFrame:CGRectMake(139, 520, 40, 40)];
        gThreeTC = [[UIButton alloc] initWithFrame:CGRectMake(192, 520, 40, 40)];
        BBSelectionTC = [[UIImageView alloc] initWithFrame:CGRectMake(189, 517, 46, 46)];
        
        BackGroundOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        PlayTC = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        HomeTC = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWordsTC = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWordsTC.font  = [[CurrentWordsTC font] fontWithSize:20];
        
        StartTC = [[UIButton alloc] initWithFrame:CGRectMake(110, 150, 100, 50)];
        ErrorMessageTC = [[UILabel alloc] initWithFrame:CGRectMake(58, 60, 224, 90)];
        ErrorMessageTC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHomeTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        gOneTC = [[UIButton alloc] initWithFrame:CGRectMake(107, 602, 45, 45)];
        gTwoTC = [[UIButton alloc] initWithFrame:CGRectMake(165, 602, 45, 45)];
        gThreeTC = [[UIButton alloc] initWithFrame:CGRectMake(223, 602, 45, 45)];
        BBSelectionTC = [[UIImageView alloc] initWithFrame:CGRectMake(220, 599, 51, 51)];
        
        BackGroundOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        pOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(27, 327, 100, 100)];
        pTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(137, 327, 100, 100)];
        pThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(247, 327, 100, 100)];
        pFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(27, 437, 100, 100)];
        pFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(137, 437, 100, 100)];
        pSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(247, 437, 100, 100)];
        pSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(27, 547, 100, 100)];
        pEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(137, 547, 100, 100)];
        pNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(247, 547, 100, 100)];
        
        BarUnderWordTC = [[UIImageView alloc] initWithFrame:CGRectMake(67, 315, 240, 2)];
        TheCurrentWordTC = [[UILabel alloc] initWithFrame:CGRectMake(123, 282, 128, 35)];
        CheckTC = [[UIButton alloc] initWithFrame:CGRectMake(82, 202, 210, 45)];
        SenderDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 182, 50)];
        TotalAmountTC = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 176, 42)];
        PauseTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWordTC.font  = [[TheCurrentWordTC font] fontWithSize:25];
        TotalAmountTC.font = [[TotalAmountTC font] fontWithSize:22];
        
        PlayTC = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        HomeTC = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWordsTC = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWordsTC.font = [[CurrentWordsTC font] fontWithSize:25];
        
        StartTC = [[UIButton alloc] initWithFrame:CGRectMake(128, 209, 119, 56)];
        ErrorMessageTC = [[UILabel alloc] initWithFrame:CGRectMake(82, 133, 225, 68)];
        ErrorMessageTC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHomeTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        gOneTC = [[UIButton alloc] initWithFrame:CGRectMake(127, 671, 45, 45)];
        gTwoTC = [[UIButton alloc] initWithFrame:CGRectMake(185, 671, 45, 45)];
        gThreeTC = [[UIButton alloc] initWithFrame:CGRectMake(243, 671, 45, 45)];
        BBSelectionTC = [[UIImageView alloc] initWithFrame:CGRectMake(240, 668, 51, 51)];
        
        PlayTC = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        HomeTC = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWordsTC = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWordsTC.font = [[CurrentWordsTC font] fontWithSize:25];
        
        BarUnderWordTC = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWordTC = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        CheckTC = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplayTC = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmountTC = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        PauseTC = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWordTC.font  = [[TheCurrentWordTC font] fontWithSize:25];
        TotalAmountTC.font = [[TotalAmountTC font] fontWithSize:25];
        
        StartTC = [[UIButton alloc] initWithFrame:CGRectMake(147, 255, 120, 56)];
        ErrorMessageTC = [[UILabel alloc] initWithFrame:CGRectMake(16, 166, 382, 81)];
        ErrorMessageTC.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
        
        pOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(62, 399, 90, 90)];
        pTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(162, 399, 90, 90)];
        pThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(262, 399, 90, 90)];
        pFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(62, 499, 90, 90)];
        pFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(162, 499, 90, 90)];
        pSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(262, 499, 90, 90)];
        pSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(62, 599, 90, 90)];
        pEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(162, 599, 90, 90)];
        pNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(262, 599, 90, 90)];
    }
    
    spOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spThreeTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spFourTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spFiveTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spSixTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spSevenTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spEightTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    spNineTC= [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x, pOneTC.center.y, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
    
    [self.view addSubview:BackGroundOneTC];
    
    [PlayTC setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [HomeTC setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [PlayTC addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [HomeTC addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    PlayTC.showsTouchWhenHighlighted = YES;
    HomeTC.showsTouchWhenHighlighted = YES;
    PlayTC.adjustsImageWhenHighlighted = NO;
    HomeTC.adjustsImageWhenHighlighted = NO;
    CurrentWordsTC.text = @"CURRENT WORDS";
    CurrentWordsTC.textColor = [UIColor whiteColor];
    CurrentWordsTC.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplayTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:HomeTC aboveSubview:PauseDisplayTC];
    [self.view insertSubview:PlayTC aboveSubview:PauseDisplayTC];
    [self.view insertSubview:CurrentWordsTC aboveSubview:PauseDisplayTC];
    
    BarUnderWordTC.backgroundColor = [UIColor blackColor];
    TheCurrentWordTC.textAlignment = NSTextAlignmentCenter;
    TheCurrentWordTC.textColor = [UIColor whiteColor];
    CheckTC.adjustsImageWhenHighlighted = NO;
    tHomeTC.adjustsImageWhenHighlighted = NO;
    tHomeTC.showsTouchWhenHighlighted = YES;
    gOneTC.showsTouchWhenHighlighted = YES;
    gTwoTC.showsTouchWhenHighlighted = YES;
    gThreeTC.showsTouchWhenHighlighted = YES;
    gOneTC.adjustsImageWhenHighlighted = NO;
    StartTC.adjustsImageWhenDisabled = NO;
    ErrorMessageTC.numberOfLines =  4;
    ErrorMessageTC.text = @"You have not given a box a value (Just tap on it)";
    [StartTC setImage:[UIImage imageNamed:@"Start.png"] forState:UIControlStateNormal];
    [StartTC addTarget:self action:@selector(StartTheGame:) forControlEvents:UIControlEventTouchUpInside];
    ErrorMessageTC.textColor = [UIColor blackColor];
    gTwoTC.adjustsImageWhenHighlighted = NO;
    ErrorMessageTC.textAlignment = NSTextAlignmentCenter;
    gThreeTC.adjustsImageWhenHighlighted = NO;
    BBSelectionTC.image = [UIImage imageNamed:@"BBSelection.png"];
    [tHomeTC setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [gOneTC setImage:[UIImage imageNamed:@"BButtonTwo.png"] forState:UIControlStateNormal];
    [gTwoTC setImage:[UIImage imageNamed:@"BButtonThree.png"] forState:UIControlStateNormal];
    [gThreeTC setImage:[UIImage imageNamed:@"BButtonOne.png"] forState:UIControlStateNormal];
    [CheckTC setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [CheckTC addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [PauseTC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHomeTC addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [PauseTC addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    PauseTC.adjustsImageWhenHighlighted = NO;
    SenderDisplayTC.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmountTC.textColor = [UIColor whiteColor];
    TotalAmountTC.textAlignment = NSTextAlignmentCenter;
    [gTwoTC addTarget:self action:@selector(gTwo:) forControlEvents:UIControlEventTouchUpInside];
    [gOneTC addTarget:self action:@selector(gOne:) forControlEvents:UIControlEventTouchUpInside];
    BackGroundTwoTC.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundThreeTC.image = [UIImage imageNamed:@"BackGroundTwo.png"];
    BackGroundOneTC.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFourTC.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [self.view insertSubview:BackGroundTwoTC belowSubview:BackGroundOneTC];
    [self.view insertSubview:BackGroundThreeTC belowSubview:BackGroundOneTC];
    [self.view insertSubview:SenderDisplayTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:TotalAmountTC aboveSubview:SenderDisplayTC];
    [self.view insertSubview:PauseTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:CheckTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:BarUnderWordTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:TheCurrentWordTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pOneTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pTwoTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:StartTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:ErrorMessageTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pThreeTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pFourTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pFiveTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pSixTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pSevenTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pEightTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:pNineTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:tHomeTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:gOneTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:gTwoTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:gThreeTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:BBSelectionTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spOneTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spTwoTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spThreeTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spFourTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spFiveTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spSixTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spSevenTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spEightTC aboveSubview:BackGroundOneTC];
    [self.view insertSubview:spNineTC aboveSubview:BackGroundOneTC];
    
    spOneTC.image = [UIImage imageNamed:@"Blank.png"];
    spTwoTC.image = [UIImage imageNamed:@"Blank.png"];
    spThreeTC.image = [UIImage imageNamed:@"Blank.png"];
    spFourTC.image = [UIImage imageNamed:@"Blank.png"];
    spFiveTC.image = [UIImage imageNamed:@"Blank.png"];
    spSixTC.image = [UIImage imageNamed:@"Blank.png"];
    spSevenTC.image = [UIImage imageNamed:@"Blank.png"];
    spEightTC.image = [UIImage imageNamed:@"Blank.png"];
    spNineTC.image = [UIImage imageNamed:@"Blank.png"];
    
    [self.view addSubview:BackGroundFourTC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    [gOneTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gTwoTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [gThreeTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [tHomeTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        StartTC.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
             StartTC.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                StartTC.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    spOneTC.alpha = 1;
    spTwoTC.alpha = 1;
    spThreeTC.alpha = 1;
    spFourTC.alpha = 1;
    spFiveTC.alpha = 1;
    spSixTC.alpha = 1;
    spSevenTC.alpha = 1;
    spEightTC.alpha = 1;
    spNineTC.alpha = 1;
    StartTC.alpha = 1;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:1];
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        spOneTC.center = CGPointMake(ikOneTC, iktOneTC-50);
        spTwoTC.center = CGPointMake(ikTwoTC, iktTwoTC-50);
        spThreeTC.center = CGPointMake(ikThreeTC, iktThreeTC-50);
        spFourTC.center = CGPointMake(ikFourTC, iktFourTC-50);
        spFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC-50);
        spSixTC.center = CGPointMake(ikSixTC, iktSixTC-50);
        spSevenTC.center = CGPointMake(ikSevenTC, iktSevenTC-50);
        spEightTC.center = CGPointMake(ikEightTC, iktEightTC-50);
        spNineTC.center = CGPointMake(ikNineTC, iktNineTC-50);
    } else {
        spOneTC.center = CGPointMake(ikOneTC, iktOneTC);
        spTwoTC.center = CGPointMake(ikTwoTC, iktTwoTC);
        spThreeTC.center = CGPointMake(ikThreeTC, iktThreeTC);
        spFourTC.center = CGPointMake(ikFourTC, iktFourTC);
        spFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spSixTC.center = CGPointMake(ikSixTC, iktSixTC);
        spSevenTC.center = CGPointMake(ikSevenTC, iktSevenTC);
        spEightTC.center = CGPointMake(ikEightTC, iktEightTC);
        spNineTC.center = CGPointMake(ikNineTC, iktNineTC);
    }
    [UIView commitAnimations];
    [self SettingUpFuncionForButtons];
}

-(void)SettingUpFuncionForButtons
{
    [CheckTC addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [CheckTC addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [CheckTC addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [PauseTC addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [PauseTC addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    UITapGestureRecognizer *tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapOne:)];
    tapOne.cancelsTouchesInView = YES;
    tapOne.numberOfTapsRequired = 1;
    spOneTC.userInteractionEnabled = YES;
    [spOneTC addGestureRecognizer:tapOne];
    
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapTwo:)];
    tapTwo.cancelsTouchesInView = YES;
    tapTwo.numberOfTapsRequired = 1;
    spTwoTC.userInteractionEnabled = YES;
    [spTwoTC addGestureRecognizer:tapTwo];
    
    UITapGestureRecognizer *tapThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapThree:)];
    tapThree.cancelsTouchesInView = YES;
    tapThree.numberOfTapsRequired = 1;
    spThreeTC.userInteractionEnabled = YES;
    [spThreeTC addGestureRecognizer:tapThree];
    
    UITapGestureRecognizer *tapFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapFour:)];
    tapFour.cancelsTouchesInView = YES;
    tapFour.numberOfTapsRequired = 1;
    spFourTC.userInteractionEnabled = YES;
    [spFourTC addGestureRecognizer:tapFour];
    
    UITapGestureRecognizer *tapFive = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapFive:)];
    tapFive.cancelsTouchesInView = YES;
    tapFive.numberOfTapsRequired = 1;
    spFiveTC.userInteractionEnabled = YES;
    [spFiveTC addGestureRecognizer:tapFive];
    
    UITapGestureRecognizer *tapSix = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSix:)];
    tapSix.cancelsTouchesInView = YES;
    tapSix.numberOfTapsRequired = 1;
    spSixTC.userInteractionEnabled = YES;
    [spSixTC addGestureRecognizer:tapSix];
    
    UITapGestureRecognizer *tapSeven = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSeven:)];
    tapSeven.cancelsTouchesInView = YES;
    tapSeven.numberOfTapsRequired = 1;
    spSevenTC.userInteractionEnabled = YES;
    [spSevenTC addGestureRecognizer:tapSeven];
    
    UITapGestureRecognizer *tapEight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapEight:)];
    tapEight.cancelsTouchesInView = YES;
    tapEight.numberOfTapsRequired = 1;
    spEightTC.userInteractionEnabled = YES;
    [spEightTC addGestureRecognizer:tapEight];
    
    UITapGestureRecognizer *tapNine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapNine:)];
    tapNine.cancelsTouchesInView = YES;
    tapNine.numberOfTapsRequired = 1;
    spNineTC.userInteractionEnabled = YES;
    [spNineTC addGestureRecognizer:tapNine];
    
    [StartTC addTarget:self action:@selector(StartClicked) forControlEvents:UIControlEventTouchUpOutside];
    [StartTC addTarget:self action:@selector(StartClicked) forControlEvents:UIControlEventTouchUpInside];
    [StartTC addTarget:self action:@selector(StartClick) forControlEvents:UIControlEventTouchDown];
}

-(void)StartClicked
{
    [StartTC setImage:[UIImage imageNamed:@"Start.png"] forState:UIControlStateNormal];
    [SoundTwoTC play];
}

-(void)StartClick
{
    [StartTC setImage:[UIImage imageNamed:@"StartFlat.png"] forState:UIControlStateNormal];
    [SoundOneTC play];
}

-(void)TapOne: (UITapGestureRecognizer *)sender
{
    if (siOneTC == 0) {
        siOneTC = 1;
        spOneTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siOneTC == 1) {
        siOneTC = 2;
        spOneTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siOneTC == 2) {
        siOneTC = 1;
        spOneTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapTwo: (UITapGestureRecognizer *)sender
{
    if (siTwoTC == 0) {
        siTwoTC = 1;
        spTwoTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siTwoTC == 1) {
        siTwoTC = 2;
        spTwoTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siTwoTC == 2) {
        siTwoTC = 1;
        spTwoTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapThree: (UITapGestureRecognizer *)sender
{
    if (siThreeTC == 0) {
        siThreeTC = 1;
        spThreeTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siThreeTC == 1) {
        siThreeTC = 2;
        spThreeTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siThreeTC == 2) {
        siThreeTC = 1;
        spThreeTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapFour: (UITapGestureRecognizer *)sender
{
    if (siFourTC == 0) {
        siFourTC = 1;
        spFourTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siFourTC == 1) {
        siFourTC = 2;
        spFourTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siFourTC == 2) {
        siFourTC = 1;
        spFourTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapFive: (UITapGestureRecognizer *)sender
{
    if (siFiveTC == 0) {
        siFiveTC = 1;
        spFiveTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siFiveTC == 1) {
        siFiveTC = 2;
        spFiveTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siFiveTC == 2) {
        siFiveTC = 1;
        spFiveTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapSix: (UITapGestureRecognizer *)sender
{
    if (siSixTC == 0) {
        siSixTC = 1;
        spSixTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siSixTC == 1) {
        siSixTC = 2;
        spSixTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siSixTC == 2) {
        siSixTC = 1;
        spSixTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapSeven: (UITapGestureRecognizer *)sender
{
    if (siSevenTC == 0) {
        siSevenTC = 1;
        spSevenTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siSevenTC == 1) {
        siSevenTC = 2;
        spSevenTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siSevenTC == 2) {
        siSevenTC = 1;
        spSevenTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapEight: (UITapGestureRecognizer *)sender
{
    if (siEightTC == 0) {
        siEightTC = 1;
        spEightTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siEightTC == 1) {
        siEightTC = 2;
        spEightTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siEightTC == 2) {
        siEightTC = 1;
        spEightTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)TapNine: (UITapGestureRecognizer *)sender
{
    if (siNineTC == 0) {
        siNineTC = 1;
        spNineTC.image = [UIImage imageNamed:@"Vowel.png"];
    } else if (siNineTC == 1) {
        siNineTC = 2;
        spNineTC.image = [UIImage imageNamed:@"Consonant.png"];
    } else if (siNineTC == 2) {
        siNineTC = 1;
        spNineTC.image = [UIImage imageNamed:@"Vowel.png"];
    }
}

-(void)PauseClicked
{
    [PauseTC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoTC play];
}

-(void)sPauseClicked
{
    [PauseTC setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOneTC play];
}

-(void)CheckClciked
{
    [CheckTC setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwoTC play];
}

-(void)sCheckClicked
{
    [CheckTC setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOneTC play];
}

-(IBAction)StartTheGame:(id)sender
{
    if (siOneTC == 0 || siTwoTC == 0  || siThreeTC == 0 || siFourTC == 0 || siFiveTC == 0 || siSixTC == 0 || siSevenTC == 0 || siEightTC == 0 || siNineTC == 0) {
        ErrorMessageTC.alpha = 1;
    } else if (siOneTC > 0 && siTwoTC > 0 && siThreeTC > 0 && siFourTC > 0 && siFiveTC > 0 && siSixTC > 0 && siSevenTC > 0 && siEightTC > 0 && siNineTC > 0) {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        spOneTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spTwoTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spThreeTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spFourTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spSixTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spSevenTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spEightTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spNineTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        
        [gOneTC setAlpha:0];
        [gTwoTC setAlpha:0];
        [gThreeTC setAlpha:0];
        [BBSelectionTC setAlpha:0];
        [ErrorMessageTC setAlpha:0];
        [StartTC setAlpha:0];
        [tHomeTC setAlpha:0];
        [self GettingTheRightGrid];
        [UIView commitAnimations];
    }
}

-(void)GettingTheRightGrid
{
    TheAmountTC = 0;
    
    int pOneInt = 0, pTwoInt = 0, pThreeInt = 0, pFourInt = 0, pFiveInt = 0, pSixInt = 0, pSevenInt = 0, pEightInt = 0, pNineInt = 0;
    
    int WordAmount[27];
    
    for (int i = 0; i <= 26; i++) {
        @autoreleasepool {
            WordAmount[i] = 0;
        }
    }
    
    if (siOneTC == 1) {
        int oneRandom = arc4random()%6;
        
        switch (oneRandom) {
            case 1:
                pOneInt = 1;
                WordAmount[1]++;
                cOneTC = kOneTC;
                break;
            case 2:
                pOneInt = 5;
                WordAmount[5]++;
                cOneTC = kFiveTC;
                break;
            case 3:
                pOneInt = 9;
                WordAmount[9]++;
                cOneTC = kNineTC;
                break;
            case 4:
                pOneInt = 15;
                WordAmount[15]++;
                cOneTC = kFithteenTC;
                break;
            case 5:
                pOneInt = 21;
                WordAmount[21]++;
                cOneTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siOneTC == 2) {
        int oneRandom = arc4random()%22;
        
        switch (oneRandom) {
            case 1:
                pOneInt = 2;
                WordAmount[2]++;
                cOneTC = kTwoTC;
                break;
            case 2:
                pOneInt = 3;
                WordAmount[3]++;
                cOneTC = kThreeTC;
                break;
            case 3:
                pOneInt = 4;
                WordAmount[4]++;
                cOneTC = kFourTC;
                break;
            case 4:
                pOneInt = 6;
                WordAmount[6]++;
                cOneTC = kSixTC;
                break;
            case 5:
                pOneInt = 7;
                WordAmount[7]++;
                cOneTC = kSevenTC;
                break;
            case 6:
                pOneInt = 8;
                WordAmount[8]++;
                cOneTC = kEightTC;
                break;
            case 7:
                pOneInt = 10;
                WordAmount[10]++;
                cOneTC = kTenTC;
                break;
            case 8:
                pOneInt = 11;
                WordAmount[11]++;
                cOneTC = kElevenTC;
                break;
            case 9:
                pOneInt = 12;
                WordAmount[12]++;
                cOneTC = kTwelveTC;
                break;
            case 10:
                pOneInt = 13;
                WordAmount[13]++;
                cOneTC = kThirteenTC;
                break;
            case 11:
                pOneInt = 14;
                WordAmount[14]++;
                cOneTC = kFourteenTC;
                break;
            case 12:
                pOneInt = 16;
                WordAmount[16]++;
                cOneTC = kSixteenTC;
                break;
            case 13:
                pOneInt = 17;
                WordAmount[17]++;
                cOneTC = kSeventeenTC;
                break;
            case 14:
                pOneInt = 18;
                WordAmount[18]++;
                cOneTC = kEighteenTC;
                break;
            case 15:
                pOneInt = 19;
                WordAmount[19]++;
                cOneTC = kNineteenTC;
                break;
            case 16:
                pOneInt = 20;
                WordAmount[20]++;
                cOneTC = kTwentyTC;
                break;
            case 17:
                pOneInt = 22;
                WordAmount[22]++;
                cOneTC = kTwentyTwoTC;
                break;
            case 18:
                pOneInt = 23;
                WordAmount[23]++;
                cOneTC = kTwentyThreeTC;
                break;
            case 19:
                pOneInt = 24;
                WordAmount[24]++;
                cOneTC = kTwentyFourTC;
                break;
            case 20:
                pOneInt = 25;
                WordAmount[25]++;
                cOneTC = kTwentyFiveTC;
                break;
            case 21:
                pOneInt = 26;
                WordAmount[26]++;
                cOneTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siTwoTC == 1) {
        int twoRandom = arc4random()%6;
        
        switch (twoRandom) {
            case 1:
                pTwoInt = 1;
                WordAmount[1]++;
                cTwoTC = kOneTC;
                break;
            case 2:
                pTwoInt = 5;
                WordAmount[5]++;
                cTwoTC = kFiveTC;
                break;
            case 3:
                pTwoInt = 9;
                WordAmount[9]++;
                cTwoTC = kNineTC;
                break;
            case 4:
                pTwoInt = 15;
                WordAmount[15]++;
                cTwoTC = kFithteenTC;
                break;
            case 5:
                pTwoInt = 21;
                WordAmount[21]++;
                cTwoTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siTwoTC == 2) {
        int twoRandom = arc4random()%22;
        
        switch (twoRandom) {
            case 1:
                pTwoInt = 2;
                WordAmount[2]++;
                cTwoTC = kTwoTC;
                break;
            case 2:
                pTwoInt = 3;
                WordAmount[3]++;
                cTwoTC = kThreeTC;
                break;
            case 3:
                pTwoInt = 4;
                WordAmount[4]++;
                cTwoTC = kFourTC;
                break;
            case 4:
                pTwoInt = 6;
                WordAmount[6]++;
                cTwoTC = kSixTC;
                break;
            case 5:
                pTwoInt = 7;
                WordAmount[7]++;
                cTwoTC = kSevenTC;
                break;
            case 6:
                pTwoInt = 8;
                WordAmount[8]++;
                cTwoTC = kEightTC;
                break;
            case 7:
                pTwoInt = 10;
                WordAmount[10]++;
                cTwoTC = kTenTC;
                break;
            case 8:
                pTwoInt = 11;
                WordAmount[11]++;
                cTwoTC = kElevenTC;
                break;
            case 9:
                pTwoInt = 12;
                WordAmount[12]++;
                cTwoTC = kTwelveTC;
                break;
            case 10:
                pTwoInt = 13;
                WordAmount[13]++;
                cTwoTC = kThirteenTC;
                break;
            case 11:
                pTwoInt = 14;
                WordAmount[14]++;
                cTwoTC = kFourteenTC;
                break;
            case 12:
                pTwoInt = 16;
                WordAmount[16]++;
                cTwoTC = kSixteenTC;
                break;
            case 13:
                pTwoInt = 17;
                WordAmount[17]++;
                cTwoTC = kSeventeenTC;
                break;
            case 14:
                pTwoInt = 18;
                WordAmount[18]++;
                cTwoTC = kEighteenTC;
                break;
            case 15:
                pTwoInt = 19;
                WordAmount[19]++;
                cTwoTC = kNineteenTC;
                break;
            case 16:
                pTwoInt = 20;
                WordAmount[20]++;
                cTwoTC = kTwentyTC;
                break;
            case 17:
                pTwoInt = 22;
                WordAmount[22]++;
                cTwoTC = kTwentyTwoTC;
                break;
            case 18:
                pTwoInt = 23;
                WordAmount[23]++;
                cTwoTC = kTwentyThreeTC;
                break;
            case 19:
                pTwoInt = 24;
                WordAmount[24]++;
                cTwoTC = kTwentyFourTC;
                break;
            case 20:
                pTwoInt = 25;
                WordAmount[25]++;
                cTwoTC = kTwentyFiveTC;
                break;
            case 21:
                pTwoInt = 26;
                WordAmount[26]++;
                cTwoTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siThreeTC == 1) {
        int threeRandom = arc4random()%6;
        
        switch (threeRandom) {
            case 1:
                pThreeInt = 1;
                WordAmount[1]++;
                cThreeTC = kOneTC;
                break;
            case 2:
                pThreeInt = 5;
                WordAmount[5]++;
                cThreeTC = kFiveTC;
                break;
            case 3:
                pThreeInt = 9;
                WordAmount[9]++;
                cThreeTC = kNineTC;
                break;
            case 4:
                pThreeInt = 15;
                WordAmount[15]++;
                cThreeTC = kFithteenTC;
                break;
            case 5:
                pThreeInt = 21;
                WordAmount[21]++;
                cThreeTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siThreeTC == 2) {
        int threeRandom = arc4random()%22;
        
        switch (threeRandom) {
            case 1:
                pThreeInt = 2;
                WordAmount[2]++;
                cThreeTC = kTwoTC;
                break;
            case 2:
                pThreeInt = 3;
                WordAmount[3]++;
                cThreeTC = kThreeTC;
                break;
            case 3:
                pThreeInt = 4;
                WordAmount[4]++;
                cThreeTC = kFourTC;
                break;
            case 4:
                pThreeInt = 6;
                WordAmount[6]++;
                cThreeTC = kSixTC;
                break;
            case 5:
                pThreeInt = 7;
                WordAmount[7]++;
                cThreeTC = kSevenTC;
                break;
            case 6:
                pThreeInt = 8;
                WordAmount[8]++;
                cThreeTC = kEightTC;
                break;
            case 7:
                pThreeInt = 10;
                WordAmount[10]++;
                cThreeTC = kTenTC;
                break;
            case 8:
                pThreeInt = 11;
                WordAmount[11]++;
                cThreeTC = kElevenTC;
                break;
            case 9:
                pThreeInt = 12;
                WordAmount[12]++;
                cThreeTC = kTwelveTC;
                break;
            case 10:
                pThreeInt = 13;
                WordAmount[13]++;
                cThreeTC = kThirteenTC;
                break;
            case 11:
                pThreeInt = 14;
                WordAmount[14]++;
                cThreeTC = kFourteenTC;
                break;
            case 12:
                pThreeInt = 16;
                WordAmount[16]++;
                cThreeTC = kSixteenTC;
                break;
            case 13:
                pThreeInt = 17;
                WordAmount[17]++;
                cThreeTC = kSeventeenTC;
                break;
            case 14:
                pThreeInt = 18;
                WordAmount[18]++;
                cThreeTC = kEighteenTC;
                break;
            case 15:
                pThreeInt = 19;
                WordAmount[19]++;
                cThreeTC = kNineteenTC;
                break;
            case 16:
                pThreeInt = 20;
                WordAmount[20]++;
                cThreeTC = kTwentyTC;
                break;
            case 17:
                pThreeInt = 22;
                WordAmount[22]++;
                cThreeTC = kTwentyTwoTC;
                break;
            case 18:
                pThreeInt = 23;
                WordAmount[23]++;
                cThreeTC = kTwentyThreeTC;
                break;
            case 19:
                pThreeInt = 24;
                WordAmount[24]++;
                cThreeTC = kTwentyFourTC;
                break;
            case 20:
                pThreeInt = 25;
                WordAmount[25]++;
                cThreeTC = kTwentyFiveTC;
                break;
            case 21:
                pThreeInt = 26;
                WordAmount[26]++;
                cThreeTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siFourTC == 1) {
        int fourRandom = arc4random()%6;
        
        switch (fourRandom) {
            case 1:
                pFourInt = 1;
                WordAmount[1]++;
                cFourTC = kOneTC;
                break;
            case 2:
                pFourInt = 5;
                WordAmount[5]++;
                cFourTC = kFiveTC;
                break;
            case 3:
                pFourInt = 9;
                WordAmount[9]++;
                cFourTC = kNineTC;
                break;
            case 4:
                pFourInt = 15;
                WordAmount[15]++;
                cFourTC = kFithteenTC;
                break;
            case 5:
                pFourInt = 21;
                WordAmount[21]++;
                cFourTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siFourTC == 2) {
        int fourRandom = arc4random()%22;
        
        switch (fourRandom) {
            case 1:
                pFourInt = 2;
                WordAmount[2]++;
                cFourTC = kTwoTC;
                break;
            case 2:
                pFourInt = 3;
                WordAmount[3]++;
                cFourTC = kThreeTC;
                break;
            case 3:
                pFourInt = 4;
                WordAmount[4]++;
                cFourTC = kFourTC;
                break;
            case 4:
                pFourInt = 6;
                WordAmount[6]++;
                cFourTC = kSixTC;
                break;
            case 5:
                pFourInt = 7;
                WordAmount[7]++;
                cFourTC = kSevenTC;
                break;
            case 6:
                pFourInt = 8;
                WordAmount[8]++;
                cFourTC = kEightTC;
                break;
            case 7:
                pFourInt = 10;
                WordAmount[10]++;
                cFourTC = kTenTC;
                break;
            case 8:
                pFourInt = 11;
                WordAmount[11]++;
                cFourTC = kElevenTC;
                break;
            case 9:
                pFourInt = 12;
                WordAmount[12]++;
                cFourTC = kTwelveTC;
                break;
            case 10:
                pFourInt = 13;
                WordAmount[13]++;
                cFourTC = kThirteenTC;
                break;
            case 11:
                pFourInt = 14;
                WordAmount[14]++;
                cFourTC = kFourteenTC;
                break;
            case 12:
                pFourInt = 16;
                WordAmount[16]++;
                cFourTC = kSixteenTC;
                break;
            case 13:
                pFourInt = 17;
                WordAmount[17]++;
                cFourTC = kSeventeenTC;
                break;
            case 14:
                pFourInt = 18;
                WordAmount[18]++;
                cFourTC = kEighteenTC;
                break;
            case 15:
                pFourInt = 19;
                WordAmount[19]++;
                cFourTC = kNineteenTC;
                break;
            case 16:
                pFourInt = 20;
                WordAmount[20]++;
                cFourTC = kTwentyTC;
                break;
            case 17:
                pFourInt = 22;
                WordAmount[22]++;
                cFourTC = kTwentyTwoTC;
                break;
            case 18:
                pFourInt = 23;
                WordAmount[23]++;
                cFourTC = kTwentyThreeTC;
                break;
            case 19:
                pFourInt = 24;
                WordAmount[24]++;
                cFourTC = kTwentyFourTC;
                break;
            case 20:
                pFourInt = 25;
                WordAmount[25]++;
                cFourTC = kTwentyFiveTC;
                break;
            case 21:
                pFourInt = 26;
                WordAmount[26]++;
                cFourTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siFiveTC == 1) {
        int fiveRandom = arc4random()%6;
        
        switch (fiveRandom) {
            case 1:
                pFiveInt = 1;
                WordAmount[1]++;
                cFiveTC = kOneTC;
                break;
            case 2:
                pFiveInt = 5;
                WordAmount[5]++;
                cFiveTC = kFiveTC;
                break;
            case 3:
                pFiveInt = 9;
                WordAmount[9]++;
                cFiveTC = kNineTC;
                break;
            case 4:
                pFiveInt = 15;
                WordAmount[15]++;
                cFiveTC = kFithteenTC;
                break;
            case 5:
                pFiveInt = 21;
                WordAmount[21]++;
                cFiveTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siFiveTC == 2) {
        int fiveRandom = arc4random()%22;
        
        switch (fiveRandom) {
            case 1:
                pFiveInt = 2;
                WordAmount[2]++;
                cFiveTC = kTwoTC;
                break;
            case 2:
                pFiveInt = 3;
                WordAmount[3]++;
                cFiveTC = kThreeTC;
                break;
            case 3:
                pFiveInt = 4;
                WordAmount[4]++;
                cFiveTC = kFourTC;
                break;
            case 4:
                pFiveInt = 6;
                WordAmount[6]++;
                cFiveTC = kSixTC;
                break;
            case 5:
                pFiveInt = 7;
                WordAmount[7]++;
                cFiveTC = kSevenTC;
                break;
            case 6:
                pFiveInt = 8;
                WordAmount[8]++;
                cFiveTC = kEightTC;
                break;
            case 7:
                pFiveInt = 10;
                WordAmount[10]++;
                cFiveTC = kTenTC;
                break;
            case 8:
                pFiveInt = 11;
                WordAmount[11]++;
                cFiveTC = kElevenTC;
                break;
            case 9:
                pFiveInt = 12;
                WordAmount[12]++;
                cFiveTC = kTwelveTC;
                break;
            case 10:
                pFiveInt = 13;
                WordAmount[13]++;
                cFiveTC = kThirteenTC;
                break;
            case 11:
                pFiveInt = 14;
                WordAmount[14]++;
                cFiveTC = kFourteenTC;
                break;
            case 12:
                pFiveInt = 16;
                WordAmount[16]++;
                cFiveTC = kSixteenTC;
                break;
            case 13:
                pFiveInt = 17;
                WordAmount[17]++;
                cFiveTC = kSeventeenTC;
                break;
            case 14:
                pFiveInt = 18;
                WordAmount[18]++;
                cFiveTC = kEighteenTC;
                break;
            case 15:
                pFiveInt = 19;
                WordAmount[19]++;
                cFiveTC = kNineteenTC;
                break;
            case 16:
                pFiveInt = 20;
                WordAmount[20]++;
                cFiveTC = kTwentyTC;
                break;
            case 17:
                pFiveInt = 22;
                WordAmount[22]++;
                cFiveTC = kTwentyTwoTC;
                break;
            case 18:
                pFiveInt = 23;
                WordAmount[23]++;
                cFiveTC = kTwentyThreeTC;
                break;
            case 19:
                pFiveInt = 24;
                WordAmount[24]++;
                cFiveTC = kTwentyFourTC;
                break;
            case 20:
                pFiveInt = 25;
                WordAmount[25]++;
                cFiveTC = kTwentyFiveTC;
                break;
            case 21:
                pFiveInt = 26;
                WordAmount[26]++;
                cFiveTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siSixTC == 1) {
        int sixRandom = arc4random()%6;
        
        switch (sixRandom) {
            case 1:
                pSixInt = 1;
                WordAmount[1]++;
                cSixTC = kOneTC;
                break;
            case 2:
                pSixInt = 5;
                WordAmount[5]++;
                cSixTC = kFiveTC;
                break;
            case 3:
                pSixInt = 9;
                WordAmount[9]++;
                cSixTC = kNineTC;
                break;
            case 4:
                pSixInt = 15;
                WordAmount[15]++;
                cSixTC = kFithteenTC;
                break;
            case 5:
                pSixInt = 21;
                WordAmount[21]++;
                cSixTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siSixTC == 2) {
        int sixRandom = arc4random()%22;
        
        switch (sixRandom) {
            case 1:
                pSixInt = 2;
                WordAmount[2]++;
                cSixTC = kTwoTC;
                break;
            case 2:
                pSixInt = 3;
                WordAmount[3]++;
                cSixTC = kThreeTC;
                break;
            case 3:
                pSixInt = 4;
                WordAmount[4]++;
                cSixTC = kFourTC;
                break;
            case 4:
                pSixInt = 6;
                WordAmount[6]++;
                cSixTC = kSixTC;
                break;
            case 5:
                pSixInt = 7;
                WordAmount[7]++;
                cSixTC = kSevenTC;
                break;
            case 6:
                pSixInt = 8;
                WordAmount[8]++;
                cSixTC = kEightTC;
                break;
            case 7:
                pSixInt = 10;
                WordAmount[10]++;
                cSixTC = kTenTC;
                break;
            case 8:
                pSixInt = 11;
                WordAmount[11]++;
                cSixTC = kElevenTC;
                break;
            case 9:
                pSixInt = 12;
                WordAmount[12]++;
                cSixTC = kTwelveTC;
                break;
            case 10:
                pSixInt = 13;
                WordAmount[13]++;
                cSixTC = kThirteenTC;
                break;
            case 11:
                pSixInt = 14;
                WordAmount[14]++;
                cSixTC = kFourteenTC;
                break;
            case 12:
                pSixInt = 16;
                WordAmount[16]++;
                cSixTC = kSixteenTC;
                break;
            case 13:
                pSixInt = 17;
                WordAmount[17]++;
                cSixTC = kSeventeenTC;
                break;
            case 14:
                pSixInt = 18;
                WordAmount[18]++;
                cSixTC = kEighteenTC;
                break;
            case 15:
                pSixInt = 19;
                WordAmount[19]++;
                cSixTC = kNineteenTC;
                break;
            case 16:
                pSixInt = 20;
                WordAmount[20]++;
                cSixTC = kTwentyTC;
                break;
            case 17:
                pSixInt = 22;
                WordAmount[22]++;
                cSixTC = kTwentyTwoTC;
                break;
            case 18:
                pSixInt = 23;
                WordAmount[23]++;
                cSixTC = kTwentyThreeTC;
                break;
            case 19:
                pSixInt = 24;
                WordAmount[24]++;
                cSixTC = kTwentyFourTC;
                break;
            case 20:
                pSixInt = 25;
                WordAmount[25]++;
                cSixTC = kTwentyFiveTC;
                break;
            case 21:
                pSixInt = 26;
                WordAmount[26]++;
                cSixTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siSevenTC == 1) {
        int sevenRandom = arc4random()%6;
        
        switch (sevenRandom) {
            case 1:
                pSevenInt = 1;
                WordAmount[1]++;
                cSevenTC = kOneTC;
                break;
            case 2:
                pSevenInt = 5;
                WordAmount[5]++;
                cSevenTC = kFiveTC;
                break;
            case 3:
                pSevenInt = 9;
                WordAmount[9]++;
                cSevenTC = kNineTC;
                break;
            case 4:
                pSevenInt = 15;
                WordAmount[15]++;
                cSevenTC = kFithteenTC;
                break;
            case 5:
                pSevenInt = 21;
                WordAmount[21]++;
                cSevenTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siSevenTC == 2) {
        int sevenRandom = arc4random()%22;
        
        switch (sevenRandom) {
            case 1:
                pSevenInt = 2;
                WordAmount[2]++;
                cSevenTC = kTwoTC;
                break;
            case 2:
                pSevenInt = 3;
                WordAmount[3]++;
                cSevenTC = kThreeTC;
                break;
            case 3:
                pSevenInt = 4;
                WordAmount[4]++;
                cSevenTC = kFourTC;
                break;
            case 4:
                pSevenInt = 6;
                WordAmount[6]++;
                cSevenTC = kSixTC;
                break;
            case 5:
                pSevenInt = 7;
                WordAmount[7]++;
                cSevenTC = kSevenTC;
                break;
            case 6:
                pSevenInt = 8;
                WordAmount[8]++;
                cSevenTC = kEightTC;
                break;
            case 7:
                pSevenInt = 10;
                WordAmount[10]++;
                cSevenTC = kTenTC;
                break;
            case 8:
                pSevenInt = 11;
                WordAmount[11]++;
                cSevenTC = kElevenTC;
                break;
            case 9:
                pSevenInt = 12;
                WordAmount[12]++;
                cSevenTC = kTwelveTC;
                break;
            case 10:
                pSevenInt = 13;
                WordAmount[13]++;
                cSevenTC = kThirteenTC;
                break;
            case 11:
                pSevenInt = 14;
                WordAmount[14]++;
                cSevenTC = kFourteenTC;
                break;
            case 12:
                pSevenInt = 16;
                WordAmount[16]++;
                cSevenTC = kSixteenTC;
                break;
            case 13:
                pSevenInt = 17;
                WordAmount[17]++;
                cSevenTC = kSeventeenTC;
                break;
            case 14:
                pSevenInt = 18;
                WordAmount[18]++;
                cSevenTC = kEighteenTC;
                break;
            case 15:
                pSevenInt = 19;
                WordAmount[19]++;
                cSevenTC = kNineteenTC;
                break;
            case 16:
                pSevenInt = 20;
                WordAmount[20]++;
                cSevenTC = kTwentyTC;
                break;
            case 17:
                pSevenInt = 22;
                WordAmount[22]++;
                cSevenTC = kTwentyTwoTC;
                break;
            case 18:
                pSevenInt = 23;
                WordAmount[23]++;
                cSevenTC = kTwentyThreeTC;
                break;
            case 19:
                pSevenInt = 24;
                WordAmount[24]++;
                cSevenTC = kTwentyFourTC;
                break;
            case 20:
                pSevenInt = 25;
                WordAmount[25]++;
                cSevenTC = kTwentyFiveTC;
                break;
            case 21:
                pSevenInt = 26;
                WordAmount[26]++;
                cSevenTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siEightTC == 1) {
        int eightRandom = arc4random()%6;
        
        switch (eightRandom) {
            case 1:
                pEightInt = 1;
                WordAmount[1]++;
                cEightTC = kOneTC;
                break;
            case 2:
                pEightInt = 5;
                WordAmount[5]++;
                cEightTC = kFiveTC;
                break;
            case 3:
                pEightInt = 9;
                WordAmount[9]++;
                cEightTC = kNineTC;
                break;
            case 4:
                pEightInt = 15;
                WordAmount[15]++;
                cEightTC = kFithteenTC;
                break;
            case 5:
                pEightInt = 21;
                WordAmount[21]++;
                cEightTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siEightTC == 2) {
        int eightRandom = arc4random()%22;
        
        switch (eightRandom) {
            case 1:
                pEightInt = 2;
                WordAmount[2]++;
                cEightTC = kTwoTC;
                break;
            case 2:
                pEightInt = 3;
                WordAmount[3]++;
                cEightTC = kThreeTC;
                break;
            case 3:
                pEightInt = 4;
                WordAmount[4]++;
                cEightTC = kFourTC;
                break;
            case 4:
                pEightInt = 6;
                WordAmount[6]++;
                cEightTC = kSixTC;
                break;
            case 5:
                pEightInt = 7;
                WordAmount[7]++;
                cEightTC = kSevenTC;
                break;
            case 6:
                pEightInt = 8;
                WordAmount[8]++;
                cEightTC = kEightTC;
                break;
            case 7:
                pEightInt = 10;
                WordAmount[10]++;
                cEightTC = kTenTC;
                break;
            case 8:
                pEightInt = 11;
                WordAmount[11]++;
                cEightTC = kElevenTC;
                break;
            case 9:
                pEightInt = 12;
                WordAmount[12]++;
                cEightTC = kTwelveTC;
                break;
            case 10:
                pEightInt = 13;
                WordAmount[13]++;
                cEightTC = kThirteenTC;
                break;
            case 11:
                pEightInt = 14;
                WordAmount[14]++;
                cEightTC = kFourteenTC;
                break;
            case 12:
                pEightInt = 16;
                WordAmount[16]++;
                cEightTC = kSixteenTC;
                break;
            case 13:
                pEightInt = 17;
                WordAmount[17]++;
                cEightTC = kSeventeenTC;
                break;
            case 14:
                pEightInt = 18;
                WordAmount[18]++;
                cEightTC = kEighteenTC;
                break;
            case 15:
                pEightInt = 19;
                WordAmount[19]++;
                cEightTC = kNineteenTC;
                break;
            case 16:
                pEightInt = 20;
                WordAmount[20]++;
                cEightTC = kTwentyTC;
                break;
            case 17:
                pEightInt = 22;
                WordAmount[22]++;
                cEightTC = kTwentyTwoTC;
                break;
            case 18:
                pEightInt = 23;
                WordAmount[23]++;
                cEightTC = kTwentyThreeTC;
                break;
            case 19:
                pEightInt = 24;
                WordAmount[24]++;
                cEightTC = kTwentyFourTC;
                break;
            case 20:
                pEightInt = 25;
                WordAmount[25]++;
                cEightTC = kTwentyFiveTC;
                break;
            case 21:
                pEightInt = 26;
                WordAmount[26]++;
                cEightTC = kTwentySixTC;
                break;
            default:
                break;
        }
    }
    
    if (siNineTC == 1) {
        int nineRandom = arc4random()%6;
        
        switch (nineRandom) {
            case 1:
                pNineInt = 1;
                WordAmount[1]++;
                cNineTC = kOneTC;
                break;
            case 2:
                pNineInt = 5;
                WordAmount[5]++;
                cNineTC = kFiveTC;
                break;
            case 3:
                pNineInt = 9;
                WordAmount[9]++;
                cNineTC = kNineTC;
                break;
            case 4:
                pNineInt = 15;
                WordAmount[15]++;
                cNineTC = kFithteenTC;
                break;
            case 5:
                pNineInt = 21;
                WordAmount[21]++;
                cNineTC = kTwentyOneTC;
                break;
            default:
                break;
        }
    } else if (siNineTC == 2) {
        int nineRandom = arc4random()%22;
        
        switch (nineRandom) {
            case 1:
                pNineInt = 2;
                WordAmount[2]++;
                cNineTC = kTwoTC;
                break;
            case 2:
                pNineInt = 3;
                WordAmount[3]++;
                cNineTC = kThreeTC;
                break;
            case 3:
                pNineInt = 4;
                WordAmount[4]++;
                cNineTC = kFourTC;
                break;
            case 4:
                pNineInt = 6;
                WordAmount[6]++;
                cNineTC = kSixTC;
                break;
            case 5:
                pNineInt = 7;
                WordAmount[7]++;
                cNineTC = kSevenTC;
                break;
            case 6:
                pNineInt = 8;
                WordAmount[8]++;
                cNineTC = kEightTC;
                break;
            case 7:
                pNineInt = 10;
                WordAmount[10]++;
                cNineTC = kTenTC;
                break;
            case 8:
                pNineInt = 11;
                WordAmount[11]++;
                cNineTC = kElevenTC;
                break;
            case 9:
                pNineInt = 12;
                WordAmount[12]++;
                cNineTC = kTwelveTC;
                break;
            case 10:
                pNineInt = 13;
                WordAmount[13]++;
                cNineTC = kThirteenTC;
                break;
            case 11:
                pNineInt = 14;
                WordAmount[14]++;
                cNineTC = kFourteenTC;
                break;
            case 12:
                pNineInt = 16;
                WordAmount[16]++;
                cNineTC = kSixteenTC;
                break;
            case 13:
                pNineInt = 17;
                WordAmount[17]++;
                cNineTC = kSeventeenTC;
                break;
            case 14:
                pNineInt = 18;
                WordAmount[18]++;
                cNineTC = kEighteenTC;
                break;
            case 15:
                pNineInt = 19;
                WordAmount[19]++;
                cNineTC = kNineteenTC;
                break;
            case 16:
                pNineInt = 20;
                WordAmount[20]++;
                cNineTC = kTwentyTC;
                break;
            case 17:
                pNineInt = 22;
                WordAmount[22]++;
                cNineTC = kTwentyTwoTC;
                break;
            case 18:
                pNineInt = 23;
                WordAmount[23]++;
                cNineTC = kTwentyThreeTC;
                break;
            case 19:
                pNineInt = 24;
                WordAmount[24]++;
                cNineTC = kTwentyFourTC;
                break;
            case 20:
                pNineInt = 25;
                WordAmount[25]++;
                cNineTC = kTwentyFiveTC;
                break;
            case 21:
                pNineInt = 26;
                WordAmount[26]++;
                cNineTC = kTwentySixTC;
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
                
            }
        }
    }
    
    NSString *letterOne, *letterTwo, *letterThree, *letterFour, *letterFive, *letterSix, *letterSeven, *letterEight, *letterNine;
    
    letterOne = [NSString stringWithFormat:@"%c", cOneTC];
    letterOne = [letterOne capitalizedString];
    
    letterTwo = [NSString stringWithFormat:@"%c", cTwoTC];
    letterTwo = [letterTwo capitalizedString];
    
    letterThree = [NSString stringWithFormat:@"%c", cThreeTC];
    letterThree = [letterThree capitalizedString];
    
    letterFour = [NSString stringWithFormat:@"%c", cFourTC];
    letterFour = [letterFour capitalizedString];
    
    letterFive = [NSString stringWithFormat:@"%c", cFiveTC];
    letterFive = [letterFive capitalizedString];
    
    letterSix = [NSString stringWithFormat:@"%c", cSixTC];
    letterSix = [letterSix capitalizedString];
    
    letterSeven = [NSString stringWithFormat:@"%c", cSevenTC];
    letterSeven = [letterSeven capitalizedString];
    
    letterEight = [NSString stringWithFormat:@"%c", cEightTC];
    letterEight = [letterEight capitalizedString];
    
    letterNine = [NSString stringWithFormat:@"%c", cNineTC];
    letterNine = [letterNine capitalizedString];
    
    NSString *imgNameOne = [NSString stringWithFormat:@"%@.png", letterOne];
    pOneTC.image = [UIImage imageNamed:imgNameOne];
    
    NSString *imgNameTwo = [NSString stringWithFormat:@"%@.png", letterTwo];
    pTwoTC.image = [UIImage imageNamed:imgNameTwo];
    
    NSString *imgNameThree = [NSString stringWithFormat:@"%@.png", letterThree];
    pThreeTC.image = [UIImage imageNamed:imgNameThree];
    
    NSString *imgNameFour = [NSString stringWithFormat:@"%@.png", letterFour];
    pFourTC.image = [UIImage imageNamed:imgNameFour];
   
    NSString *imgNameFive = [NSString stringWithFormat:@"%@.png", letterFive];
    pFiveTC.image = [UIImage imageNamed:imgNameFive];
    
    NSString *imgNameSix = [NSString stringWithFormat:@"%@.png", letterSix];
    pSixTC.image = [UIImage imageNamed:imgNameSix];
    
    NSString *imgNameSeven = [NSString stringWithFormat:@"%@.png", letterSeven];
    pSevenTC.image = [UIImage imageNamed:imgNameSeven];
    
    NSString *imgNameEight = [NSString stringWithFormat:@"%@.png", letterEight];
    pEightTC.image = [UIImage imageNamed:imgNameEight];
    
    NSString *imgNameNine = [NSString stringWithFormat:@"%@.png", letterNine];
    pNineTC.image = [UIImage imageNamed:imgNameNine];
    
    if (z > 2 || !cOneTC || !cTwoTC || !cThreeTC || !cFourTC || !cFiveTC || !cSixTC || !cSevenTC || !cEightTC || !cNineTC) {
        [self GettingTheRightGrid];
    } else {
        
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                NSString *Word = [NSString stringWithFormat:@""];
                unichar One = [str characterAtIndex:0];
                unichar Two = [str characterAtIndex:1];
                unichar Three = [str characterAtIndex:2];
                BOOL Done[10];
                
                for (int i = 0; i <= 10; i++) {
                    Done[i] = NO;
                }
                
                if (One == cOneTC) {
                    Word = [NSString stringWithFormat:@"%c", cOneTC];
                    Done[1] = YES;
                } else if (One == cTwoTC) {
                    Word = [NSString stringWithFormat:@"%c", cTwoTC];
                    Done[2] = YES;
                } else if (One == cThreeTC) {
                    Word = [NSString stringWithFormat:@"%c", cThreeTC];
                    Done[3] = YES;
                } else if (One == cFourTC) {
                    Word = [NSString stringWithFormat:@"%c", cFourTC];
                    Done[4] = YES;
                } else if (One == cFiveTC) {
                    Word = [NSString stringWithFormat:@"%c", cFiveTC];
                    Done[5] = YES;
                } else if (One == cSixTC) {
                    Word = [NSString stringWithFormat:@"%c", cSixTC];
                    Done[6] = YES;
                } else if (One == cSevenTC) {
                    Word = [NSString stringWithFormat:@"%c", cSevenTC];
                    Done[7] = YES;
                } else if (One == cEightTC) {
                    Word = [NSString stringWithFormat:@"%c", cEightTC];
                    Done[8] = YES;
                } else if (One == cNineTC) {
                    Word = [NSString stringWithFormat:@"%c", cNineTC];
                    Done[9] = YES;
                }
                
                if (Two == cOneTC && Done[1] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cOneTC];
                    Done[1] = YES;
                } else if (Two == cTwoTC && Done[2] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwoTC];
                    Done[2] = YES;
                } else if (Two == cThreeTC && Done[3] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThreeTC];
                    Done[3] = YES;
                } else if (Two == cFourTC && Done[4] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourTC];
                    Done[4] = YES;
                } else if (Two == cFiveTC && Done[5] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFiveTC];
                    Done[5] = YES;
                } else if (Two == cSixTC && Done[6] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixTC];
                    Done[6] = YES;
                } else if (Two == cSevenTC && Done[7] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSevenTC];
                    Done[7] = YES;
                } else if (Two == cEightTC && Done[8] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cEightTC];
                    Done[8] = YES;
                } else if (Two == cNineTC && Done[9] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cNineTC];
                    Done[9] = YES;
                }
                
                if (Three == cOneTC && Done[1] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cOneTC];
                } else if (Three == cTwoTC && Done[2] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cTwoTC];
                } else if (Three == cThreeTC && Done[3] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cThreeTC];
                } else if (Three == cFourTC && Done[4] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFourTC];
                } else if (Three == cFiveTC && Done[5] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cFiveTC];
                } else if (Three == cSixTC && Done[6] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSixTC];
                } else if (Three == cSevenTC && Done[7] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cSevenTC];
                } else if (Three == cEightTC && Done[8] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cEightTC];
                } else if (Three == cNineTC && Done[9] == NO) {
                    Word = [NSString stringWithFormat:@"%@%c", Word, cNineTC];
                }
                
                if ([str isEqualToString:Word]) {
                    TheAmountTC++;
                }
            }
            
        }
        if (TheAmountTC == 0) {
            [self GettingTheRightGrid];
        } else {
            TotalAmountTC.text = [NSString stringWithFormat:@"0 OF %i", TheAmountTC];
            
            [self GetTheWord];
            [self StartTheGame];
            
            iLeftTC = ikTwoTC - ikOneTC;
            iUpTC = iktOneTC - iktThreeTC;
        }
    }

}

-(void)StartTheGame
{
    
    pOneTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pTwoTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pThreeTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pFourTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pSixTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pSevenTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pEightTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pNineTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDuration:1];
    [spOneTC setAlpha:0];
    [spTwoTC setAlpha:0];
    [spThreeTC setAlpha:0];
    [spFourTC setAlpha:0];
    [spFiveTC setAlpha:0];
    [spSixTC setAlpha:0];
    [spSevenTC setAlpha:0];
    [spEightTC setAlpha:0];
    [spNineTC setAlpha:0];
    [pFiveTC setAlpha:1];
    [CheckTC setAlpha:1];
    [TheCurrentWordTC setAlpha:1];
    [PauseTC setAlpha:1];
    [BarUnderWordTC setAlpha:1];
    [TotalAmountTC setAlpha:1];
    [SenderDisplayTC setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.4];
    [UIView setAnimationDuration:1];
    pFourTC.alpha = 1;
    pSixTC.alpha = 1;
    
    pFourTC.center = CGPointMake(ikFourTC, iktFourTC);
    pSixTC.center = CGPointMake(ikSixTC, iktSixTC);
    
    pOneTC.center = CGPointMake(ikFourTC, iktFourTC);
    pSevenTC.center = CGPointMake(ikFourTC, iktFourTC);
    
    pTwoTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    pEightTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y);
    
    pThreeTC.center = CGPointMake(ikSixTC, iktSixTC);
    pNineTC.center = CGPointMake(ikSixTC, iktSixTC);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationDuration:1];
    pOneTC.alpha = 1;
    pTwoTC.alpha = 1;
    pThreeTC.alpha = 1;
    
    pSevenTC.alpha = 1;
    pEightTC.alpha = 1;
    pNineTC.alpha = 1;
    
    pOneTC.center = CGPointMake(ikOneTC, iktOneTC);
    pSevenTC.center = CGPointMake(ikSevenTC, iktSevenTC);
    
    pTwoTC.center = CGPointMake(ikTwoTC, iktTwoTC);
    pEightTC.center = CGPointMake(ikEightTC, iktEightTC);
    
    pThreeTC.center = CGPointMake(ikThreeTC, iktThreeTC);
    pNineTC.center = CGPointMake(ikNineTC, iktNineTC);
    [self Swipes];
    [UIView commitAnimations];
    
}

-(void)Swipes
{
    PanningSensitivityTC = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOneTC.userInteractionEnabled = YES;
    [pOneTC addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwoTC.userInteractionEnabled = YES;
    [pTwoTC addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThreeTC.userInteractionEnabled = YES;
    [pThreeTC addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFourTC.userInteractionEnabled = YES;
    [pFourTC addGestureRecognizer:panFour];
    
    UIPanGestureRecognizer *panFive = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FivePan:)];
    pFiveTC.userInteractionEnabled = YES;
    [pFiveTC addGestureRecognizer:panFive];
    
    UIPanGestureRecognizer *panSix = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixPan:)];
    pSixTC.userInteractionEnabled = YES;
    [pSixTC addGestureRecognizer:panSix];
    
    UIPanGestureRecognizer *panSeven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SevenPan:)];
    pSevenTC.userInteractionEnabled = YES;
    [pSevenTC addGestureRecognizer:panSeven];
    
    UIPanGestureRecognizer *panEight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(EightPan:)];
    pEightTC.userInteractionEnabled = YES;
    [pEightTC addGestureRecognizer:panEight];
    
    UIPanGestureRecognizer *panNine = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(NinePan:)];
    pNineTC.userInteractionEnabled = YES;
    [pNineTC addGestureRecognizer:panNine];
    
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    UISwipeGestureRecognizer *gesture;
    
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 1;
    
    
    if ((gesture.direction == UISwipeGestureRecognizerDirectionDown || gesture.direction == UISwipeGestureRecognizerDirectionUp) && PreviousTC == 0) {
        [self Horizontal];
        PreviousTC = 2;
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)FivePan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 5;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixPan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 6;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)SevenPan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 7;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)EightPan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 8;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
            PreviousTC = 2;
            [self Horizontal];
        }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

-(void)NinePan: (UIPanGestureRecognizer *)sender
{
    distanceTC = [sender translationInView:self.view];
    PanningIntTC++;
    PPanningMethodTC = 9;
    
    if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 1) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Verticle];
            PanningIntTC = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && PreviousTC == 2) {
        if (PanningIntTC == PanningSensitivityTC) {
            [self Horizontal];
            PanningIntTC = 0;
        }
    } else if (distanceTC.x > 0 || distanceTC.x < 0) {
        if ((distanceTC.y > 0 || distanceTC.y < 0) && ((distanceTC.x > 0 && distanceTC.x < 10) || (distanceTC.x < 0 && distanceTC.x > -10))) {
            PreviousTC = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            PreviousTC = 1;
        }
    } else if (distanceTC.y > 0 || distanceTC.y < 0) {
        PreviousTC = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningIntTC = 0;
        PreviousTC = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOneTC = pOneTC.center.x;
    yOneTC = pOneTC.center.y;
    xTwoTC = pTwoTC.center.x;
    yTwoTC = pTwoTC.center.y;
    xThreeTC = pThreeTC.center.x;
    yThreeTC = pThreeTC.center.y;
    xFourTC = pFourTC.center.x;
    yFourTC = pFourTC.center.y;
    xFiveTC = pFiveTC.center.x;
    yFiveTC = pFiveTC.center.y;
    xSixTC = pSixTC.center.x;
    ySixTC = pSixTC.center.y;
    ySevenTC = pSevenTC.center.y;
    xSevenTC = pSevenTC.center.x;
    xEightTC = pEightTC.center.x;
    yEightTC = pEightTC.center.y;
    yNineTC = pNineTC.center.y;
    xNineTC = pNineTC.center.x;
    
    switch (PPanningMethodTC) {
        case 1:
            pointOfIntrestTC = pOneTC.center.x;
            break;
        case 2:
            pointOfIntrestTC = pTwoTC.center.x;
            break;
        case 3:
            pointOfIntrestTC = pThreeTC.center.x;
            break;
        case 4:
            pointOfIntrestTC = pFourTC.center.x;
            break;
        case 5:
            pointOfIntrestTC = pFiveTC.center.x;
            break;
        case 6:
            pointOfIntrestTC = pSixTC.center.x;
            break;
        case 7:
            pointOfIntrestTC = pSevenTC.center.x;
            break;
        case 8:
            pointOfIntrestTC = pEightTC.center.x;
            break;
        case 9:
            pointOfIntrestTC = pNineTC.center.x;
            break;
        default:
            break;
    }
    
    if (distanceTC.y < 0) {
        
        if (pointOfIntrestTC == pOneTC.center.x) {
            pOneTC.center = CGPointMake(pOneTC.center.x, pOneTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pTwoTC.center.x) {
            pTwoTC.center = CGPointMake(pTwoTC.center.x, pTwoTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pThreeTC.center.x) {
            pThreeTC.center = CGPointMake(pThreeTC.center.x , pThreeTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pFourTC.center.x) {
            pFourTC.center = CGPointMake(pFourTC.center.x, pFourTC.center.y - iLeftTC);
        }
        if (pFiveTC.center.x == pointOfIntrestTC) {
            pFiveTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pSixTC.center.x) {
            pSixTC.center = CGPointMake(pSixTC.center.x , pSixTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pSevenTC.center.x) {
            pSevenTC.center = CGPointMake(pSevenTC.center.x , pSevenTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pEightTC.center.x) {
            pEightTC.center = CGPointMake(pEightTC.center.x , pEightTC.center.y - iLeftTC);
        }
        if (pointOfIntrestTC == pNineTC.center.x) {
            pNineTC.center = CGPointMake(pNineTC.center.x, pNineTC.center.y - iLeftTC);
        }
    } else if (distanceTC.y > 0) {
        
        if (pointOfIntrestTC == pOneTC.center.x) {
            pOneTC.center = CGPointMake(pOneTC.center.x, pOneTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pTwoTC.center.x) {
            pTwoTC.center = CGPointMake(pTwoTC.center.x, pTwoTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pThreeTC.center.x) {
            pThreeTC.center = CGPointMake(pThreeTC.center.x , pThreeTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pFourTC.center.x) {
            pFourTC.center = CGPointMake(pFourTC.center.x, pFourTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pFiveTC.center.x) {
            pFiveTC.center = CGPointMake(pFiveTC.center.x, pFiveTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pSixTC.center.x) {
            pSixTC.center = CGPointMake(pSixTC.center.x , pSixTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pSevenTC.center.x) {
            pSevenTC.center = CGPointMake(pSevenTC.center.x , pSevenTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pEightTC.center.x) {
            pEightTC.center = CGPointMake(pEightTC.center.x , pEightTC.center.y+ iLeftTC);
        }
        if (pointOfIntrestTC == pNineTC.center.x) {
            pNineTC.center = CGPointMake(pNineTC.center.x, pNineTC.center.y+ iLeftTC);
        }
    }
    
    if (pOneTC.center.x != pointOfIntrestTC) {
        pOneTC.alpha = 1;
        pOneTC.hidden = NO;
        pOneTC.center = CGPointMake(xOneTC, yOneTC);
    }
    if (pTwoTC.center.x != pointOfIntrestTC) {
        pTwoTC.alpha = 1;
        pTwoTC.hidden = NO;
        pTwoTC.center = CGPointMake(xTwoTC, yTwoTC);
    }
    if (pThreeTC.center.x != pointOfIntrestTC) {
        pThreeTC.alpha = 1;
        pThreeTC.hidden = NO;
        pThreeTC.center = CGPointMake(xThreeTC, yThreeTC);
    }
    if (pFourTC.center.x != pointOfIntrestTC) {
        pFourTC.alpha = 1;
        pFourTC.hidden = NO;
        pFourTC.center = CGPointMake(xFourTC, yFourTC);
    }
    if (pFiveTC.center.x != pointOfIntrestTC) {
        pFiveTC.alpha = 1;
        pFiveTC.hidden = NO;
        pFiveTC.center = CGPointMake(xFiveTC, yFiveTC);
    }
    if (pSixTC.center.x != pointOfIntrestTC) {
        pSixTC.alpha = 1;
        pSixTC.hidden = NO;
        pSixTC.center = CGPointMake(xSixTC, ySixTC);
    }
    if (pSevenTC.center.x != pointOfIntrestTC) {
        pSevenTC.alpha = 1;
        pSevenTC.hidden = NO;
        pSevenTC.center = CGPointMake(xSevenTC, ySevenTC);
    }
    if (pEightTC.center.x != pointOfIntrestTC) {
        pEightTC.alpha = 1;
        pEightTC.hidden = NO;
        pEightTC.center = CGPointMake(xEightTC, yEightTC);
    }
    if (pNineTC.center.x != pointOfIntrestTC) {
        pNineTC.alpha = 1;
        pNineTC.hidden = NO;
        pNineTC.center = CGPointMake(xNineTC, yNineTC);
    }
    
    if (pOneTC.center.y > iktNineTC) {
        pOneTC.center = CGPointMake(pOneTC.center.x, iktOneTC);
    }
    if (pTwoTC.center.y > iktNineTC) {
        pTwoTC.center = CGPointMake(pTwoTC.center.x, iktOneTC);
    }
    if (pThreeTC.center.y > iktNineTC) {
        pThreeTC.center = CGPointMake(pThreeTC.center.x, iktOneTC);
    }
    if (pFourTC.center.y > iktNineTC) {
        pFourTC.center = CGPointMake(pFourTC.center.x,iktOneTC );
    }
    if (pFiveTC.center.y > iktNineTC) {
        pFiveTC.center = CGPointMake(pFiveTC.center.x, iktOneTC);
    }
    if (pSixTC.center.y > iktNineTC) {
        pSixTC.center = CGPointMake(pSixTC.center.x, iktOneTC);
    }
    if (pSevenTC.center.y > iktNineTC) {
        pSevenTC.center = CGPointMake(pSevenTC.center.x, iktOneTC);
    }
    if (pEightTC.center.y > iktNineTC) {
        pEightTC.center = CGPointMake(pEightTC.center.x, iktOneTC);
    }
    if (pNineTC.center.y > iktNineTC) {
        pNineTC.center = CGPointMake(pNineTC.center.x, iktOneTC);
    }
    
    if (pOneTC.center.y < iktOneTC) {
        pOneTC.center = CGPointMake(pOneTC.center.x, iktNineTC);
    }
    if (pTwoTC.center.y < iktOneTC) {
        pTwoTC.center = CGPointMake(pTwoTC.center.x, iktNineTC);
    }
    if (pThreeTC.center.y < iktOneTC) {
        pThreeTC.center = CGPointMake(pThreeTC.center.x, iktNineTC);
    }
    if (pFourTC.center.y < iktOneTC) {
        pFourTC.center = CGPointMake(pFourTC.center.x, iktNineTC);
    }
    if (pFiveTC.center.y < iktOneTC) {
        pFiveTC.center = CGPointMake(pFiveTC.center.x, iktNineTC);
    }
    if (pSixTC.center.y < iktOneTC) {
        pSixTC.center = CGPointMake(pSixTC.center.x, iktNineTC);
    }
    if (pSevenTC.center.y < iktOneTC) {
        pSevenTC.center = CGPointMake(pSevenTC.center.x, iktNineTC);
    }
    if (pEightTC.center.y < iktOneTC) {
        pEightTC.center = CGPointMake(pEightTC.center.x, iktNineTC);
    }
    if (pNineTC.center.y < iktOneTC) {
        pNineTC.center = CGPointMake(pNineTC.center.x, iktNineTC);
    }
}

-(void)Verticle
{
    xOneTC = pOneTC.center.x;
    yOneTC = pOneTC.center.y;
    xTwoTC = pTwoTC.center.x;
    yTwoTC = pTwoTC.center.y;
    xThreeTC = pThreeTC.center.x;
    yThreeTC = pThreeTC.center.y;
    xFourTC = pFourTC.center.x;
    yFourTC = pFourTC.center.y;
    xFiveTC = pFiveTC.center.x;
    yFiveTC = pFiveTC.center.y;
    xSixTC = pSixTC.center.x;
    ySixTC = pSixTC.center.y;
    ySevenTC = pSevenTC.center.y;
    xSevenTC = pSevenTC.center.x;
    xEightTC = pEightTC.center.x;
    yEightTC = pEightTC.center.y;
    yNineTC = pNineTC.center.y;
    xNineTC = pNineTC.center.x;
    
    switch (PPanningMethodTC) {
        case 1:
            pointOfIntrestTC = pOneTC.center.y;
            break;
        case 2:
            pointOfIntrestTC = pTwoTC.center.y;
            break;
        case 3:
            pointOfIntrestTC = pThreeTC.center.y;
            break;
        case 4:
            pointOfIntrestTC = pFourTC.center.y;
            break;
        case 5:
            pointOfIntrestTC = pFiveTC.center.y;
            break;
        case 6:
            pointOfIntrestTC = pSixTC.center.y;
            break;
        case 7:
            pointOfIntrestTC = pSevenTC.center.y;
            break;
        case 8:
            pointOfIntrestTC = pEightTC.center.y;
            break;
        case 9:
            pointOfIntrestTC = pNineTC.center.y;
            break;
        default:
            break;
    }
    
    if (distanceTC.x > 0) {
        
        if (pointOfIntrestTC == pOneTC.center.y) {
            pOneTC.center = CGPointMake(pOneTC.center.x + iLeftTC, pOneTC.center.y);
        }
        if (pointOfIntrestTC == pTwoTC.center.y) {
            pTwoTC.center = CGPointMake(pTwoTC.center.x + iLeftTC, pTwoTC.center.y);
        }
        if (pointOfIntrestTC == pThreeTC.center.y) {
            pThreeTC.center = CGPointMake(pThreeTC.center.x + iLeftTC, pThreeTC.center.y);
        }
        if (pointOfIntrestTC == pFourTC.center.y) {
            pFourTC.center = CGPointMake(pFourTC.center.x + iLeftTC, pFourTC.center.y);
        }
        if (pointOfIntrestTC == pFiveTC.center.y) {
            pFiveTC.center = CGPointMake(pFiveTC.center.x + iLeftTC, pFiveTC.center.y);
        }
        if (pointOfIntrestTC == pSixTC.center.y) {
            pSixTC.center = CGPointMake(pSixTC.center.x + iLeftTC, pSixTC.center.y);
        }
        if (pointOfIntrestTC == pSevenTC.center.y) {
            pSevenTC.center = CGPointMake(pSevenTC.center.x + iLeftTC, pSevenTC.center.y);
        }
        if (pointOfIntrestTC == pEightTC.center.y) {
            pEightTC.center = CGPointMake(pEightTC.center.x + iLeftTC, pEightTC.center.y);
        }
        if (pointOfIntrestTC == pNineTC.center.y) {
            pNineTC.center = CGPointMake(pNineTC.center.x + iLeftTC, pNineTC.center.y);
        }
        
    } else if (distanceTC.x < 0) {
        
        if (pointOfIntrestTC == pOneTC.center.y) {
            pOneTC.center = CGPointMake(pOneTC.center.x - iLeftTC, pOneTC.center.y);
        }
        if (pointOfIntrestTC == pTwoTC.center.y) {
            pTwoTC.center = CGPointMake(pTwoTC.center.x - iLeftTC, pTwoTC.center.y);
        }
        if (pointOfIntrestTC == pThreeTC.center.y) {
            pThreeTC.center = CGPointMake(pThreeTC.center.x - iLeftTC, pThreeTC.center.y);
        }
        if (pointOfIntrestTC == pFourTC.center.y) {
            pFourTC.center = CGPointMake(pFourTC.center.x - iLeftTC, pFourTC.center.y);
        }
        if (pointOfIntrestTC == pFiveTC.center.y) {
            pFiveTC.center = CGPointMake(pFiveTC.center.x - iLeftTC, pFiveTC.center.y);
        }
        if (pointOfIntrestTC == pSixTC.center.y) {
            pSixTC.center = CGPointMake(pSixTC.center.x - iLeftTC, pSixTC.center.y);
        }
        if (pointOfIntrestTC == pSevenTC.center.y) {
            pSevenTC.center = CGPointMake(pSevenTC.center.x - iLeftTC, pSevenTC.center.y);
        }
        if (pointOfIntrestTC == pEightTC.center.y) {
            pEightTC.center = CGPointMake(pEightTC.center.x - iLeftTC, pEightTC.center.y);
        }
        if (pointOfIntrestTC == pNineTC.center.y) {
            pNineTC.center = CGPointMake(pNineTC.center.x - iLeftTC, pNineTC.center.y);
        }
    }
    
    if (pOneTC.center.y != pointOfIntrestTC) {
        pOneTC.alpha = 1;
        pOneTC.hidden = NO;
        pOneTC.center = CGPointMake(xOneTC, yOneTC);
    }
    if (pTwoTC.center.y != pointOfIntrestTC) {
        pTwoTC.alpha = 1;
        pTwoTC.hidden = NO;
        pTwoTC.center = CGPointMake(xTwoTC, yTwoTC);
    }
    if (pThreeTC.center.y != pointOfIntrestTC) {
        pThreeTC.alpha = 1;
        pThreeTC.hidden = NO;
        pThreeTC.center = CGPointMake(xThreeTC, yThreeTC);
    }
    if (pFourTC.center.y != pointOfIntrestTC) {
        pFourTC.alpha = 1;
        pFourTC.hidden = NO;
        pFourTC.center = CGPointMake(xFourTC, yFourTC);
    }
    if (pFiveTC.center.y != pointOfIntrestTC) {
        pFiveTC.alpha = 1;
        pFiveTC.hidden = NO;
        pFiveTC.center = CGPointMake(xFiveTC, yFiveTC);
    }
    if (pSixTC.center.y != pointOfIntrestTC) {
        pSixTC.alpha = 1;
        pSixTC.hidden = NO;
        pSixTC.center = CGPointMake(xSixTC, ySixTC);
    }
    if (pSevenTC.center.y != pointOfIntrestTC) {
        pSevenTC.alpha = 1;
        pSevenTC.hidden = NO;
        pSevenTC.center = CGPointMake(xSevenTC, ySevenTC);
    }
    if (pEightTC.center.y != pointOfIntrestTC) {
        pEightTC.alpha = 1;
        pEightTC.hidden = NO;
        pEightTC.center = CGPointMake(xEightTC, yEightTC);
    }
    if (pNineTC.center.y != pointOfIntrestTC) {
        pNineTC.alpha = 1;
        pNineTC.hidden = NO;
        pNineTC.center = CGPointMake(xNineTC, yNineTC);
    }
    
    if (pOneTC.center.x < ikOneTC) {
        pOneTC.center = CGPointMake(ikThreeTC, pOneTC.center.y);
    }
    if (pTwoTC.center.x < ikOneTC) {
        pTwoTC.center = CGPointMake(ikThreeTC, pTwoTC.center.y);
    }
    if (pThreeTC.center.x < ikOneTC) {
        pThreeTC.center = CGPointMake(ikThreeTC, pThreeTC.center.y);
    }
    if (pFourTC.center.x < ikOneTC) {
        pFourTC.center = CGPointMake(ikThreeTC, pFourTC.center.y);
    }
    if (pFiveTC.center.x < ikOneTC) {
        pFiveTC.center = CGPointMake(ikThreeTC, pFiveTC.center.y);
    }
    if (pSixTC.center.x < ikOneTC) {
        pSixTC.center = CGPointMake(ikThreeTC, pSixTC.center.y);
    }
    if (pSevenTC.center.x < ikOneTC) {
        pSevenTC.center = CGPointMake(ikThreeTC, pSevenTC.center.y);
    }
    if (pEightTC.center.x < ikOneTC) {
        pEightTC.center = CGPointMake(ikThreeTC, pEightTC.center.y);
    }
    if (pNineTC.center.x < ikOneTC) {
        pNineTC.center = CGPointMake(ikThreeTC, pNineTC.center.y);
    }
    
    if (pOneTC.center.x > ikThreeTC) {
        pOneTC.center = CGPointMake(ikOneTC, pOneTC.center.y);
    }
    if (pTwoTC.center.x > ikThreeTC) {
        pTwoTC.center = CGPointMake(ikOneTC, pTwoTC.center.y);
    }
    if (pThreeTC.center.x > ikThreeTC) {
        pThreeTC.center = CGPointMake(ikOneTC, pThreeTC.center.y);
    }
    if (pFourTC.center.x > ikThreeTC) {
        pFourTC.center = CGPointMake(ikOneTC, pFourTC.center.y);
    }
    if (pFiveTC.center.x > ikThreeTC) {
        pFiveTC.center = CGPointMake(ikOneTC, pFiveTC.center.y);
    }
    if (pSixTC.center.x > ikThreeTC) {
        pSixTC.center = CGPointMake(ikOneTC, pSixTC.center.y);
    }
    if (pSevenTC.center.x > ikThreeTC) {
        pSevenTC.center = CGPointMake(ikOneTC, pSevenTC.center.y);
    }
    if (pEightTC.center.x > ikThreeTC) {
        pEightTC.center = CGPointMake(ikOneTC, pEightTC.center.y);
    }
    if (pNineTC.center.x > ikThreeTC) {
        pNineTC.center = CGPointMake(ikOneTC, pNineTC.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SwipeSoundTC play];
    [self GetTheWord];
}

-(IBAction)IsItAWaord
{
    
    NSString *path;
    path = [[NSBundle mainBundle] pathForResource:@"3Choice" ofType:@"plist"];
    int i = 0;
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array2) {
        @autoreleasepool {
            i++;
            if ([str isEqual:WordTC] && WordIsAlreadyDoneTC[i] == NO) {
                WordIsAlreadyDoneTC[i] = YES;
                ScoreTC = ScoreTC + 1;
                TotalAmountTC.text = [NSString stringWithFormat:@"%i OF  %i", ScoreTC, TheAmountTC];
            }
        }
        
    }
    
    if (ScoreTC == TheAmountTC) {
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
        TileOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x - 75, pOneTC.center.y - 75, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
        TileTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTC.center.x-75, pTwoTC.center.y-75, pTwoTC.bounds.size.width, pTwoTC.bounds.size.height)];
        TileThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTC.center.x-75, pThreeTC.center.y-75, pThreeTC.bounds.size.width, pThreeTC.bounds.size.height)];
        TileFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTC.center.x-75, pFourTC.center.y-75, pFourTC.bounds.size.width, pFourTC.bounds.size.height)];
        TileFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTC.center.x-75, pFiveTC.center.y-75, pFiveTC.bounds.size.width, pFiveTC.bounds.size.height)];
        TileSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTC.center.x-75, pSixTC.center.y-75, pSixTC.bounds.size.width, pSixTC.bounds.size.height)];
        TileSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTC.center.x-75, pSevenTC.center.y-75, pSevenTC.bounds.size.width, pSevenTC.bounds.size.height)];
        TileEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTC.center.x-75, pEightTC.center.y-75, pEightTC.bounds.size.width, pEightTC.bounds.size.height)];
        TileNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTC.center.x-75, pNineTC.center.y-75, pNineTC.bounds.size.width, pNineTC.bounds.size.height)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            TileOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x - 50, pOneTC.center.y - 50, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
            TileTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTC.center.x-50, pTwoTC.center.y-50, pTwoTC.bounds.size.width, pTwoTC.bounds.size.height)];
            TileThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTC.center.x-50, pThreeTC.center.y-50, pThreeTC.bounds.size.width, pThreeTC.bounds.size.height)];
            TileFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTC.center.x-50, pFourTC.center.y-50, pFourTC.bounds.size.width, pFourTC.bounds.size.height)];
            TileFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTC.center.x-50, pFiveTC.center.y-50, pFiveTC.bounds.size.width, pFiveTC.bounds.size.height)];
            TileSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTC.center.x-50, pSixTC.center.y-50, pSixTC.bounds.size.width, pSixTC.bounds.size.height)];
            TileSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTC.center.x-50, pSevenTC.center.y-50, pSevenTC.bounds.size.width, pSevenTC.bounds.size.height)];
            TileEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTC.center.x-50, pEightTC.center.y-50, pEightTC.bounds.size.width, pEightTC.bounds.size.height)];
            TileNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTC.center.x-50, pNineTC.center.y-50, pNineTC.bounds.size.width, pNineTC.bounds.size.height)];
            
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            
            TileOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x - 55, pOneTC.center.y - 55, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
            TileTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTC.center.x-55, pTwoTC.center.y-55, pTwoTC.bounds.size.width, pTwoTC.bounds.size.height)];
            TileThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTC.center.x-55, pThreeTC.center.y-55, pThreeTC.bounds.size.width, pThreeTC.bounds.size.height)];
            TileFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTC.center.x-5, pFourTC.center.y-55, pFourTC.bounds.size.width, pFourTC.bounds.size.height)];
            TileFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTC.center.x-55, pFiveTC.center.y-55, pFiveTC.bounds.size.width, pFiveTC.bounds.size.height)];
            TileSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTC.center.x-55, pSixTC.center.y-55, pSixTC.bounds.size.width, pSixTC.bounds.size.height)];
            TileSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTC.center.x-55, pSevenTC.center.y-55, pSevenTC.bounds.size.width, pSevenTC.bounds.size.height)];
            TileEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTC.center.x-55, pEightTC.center.y-55, pEightTC.bounds.size.width, pEightTC.bounds.size.height)];
            TileNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTC.center.x-55, pNineTC.center.y-55, pNineTC.bounds.size.width, pNineTC.bounds.size.height)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            TileOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x - 58, pOneTC.center.y - 58, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
            TileTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTC.center.x-58, pTwoTC.center.y-58, pTwoTC.bounds.size.width, pTwoTC.bounds.size.height)];
            TileThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTC.center.x-58, pThreeTC.center.y-58, pThreeTC.bounds.size.width, pThreeTC.bounds.size.height)];
            TileFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTC.center.x-58, pFourTC.center.y-58, pFourTC.bounds.size.width, pFourTC.bounds.size.height)];
            TileFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTC.center.x-58, pFiveTC.center.y-58, pFiveTC.bounds.size.width, pFiveTC.bounds.size.height)];
            TileSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTC.center.x-58, pSixTC.center.y-58, pSixTC.bounds.size.width, pSixTC.bounds.size.height)];
            TileSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTC.center.x-58, pSevenTC.center.y-58, pSevenTC.bounds.size.width, pSevenTC.bounds.size.height)];
            TileEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTC.center.x-58, pEightTC.center.y-58, pEightTC.bounds.size.width, pEightTC.bounds.size.height)];
            TileNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTC.center.x-58, pNineTC.center.y-58, pNineTC.bounds.size.width, pNineTC.bounds.size.height)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            TileOneTC = [[UIImageView alloc] initWithFrame:CGRectMake(pOneTC.center.x - 60, pOneTC.center.y - 60, pOneTC.bounds.size.width, pOneTC.bounds.size.height)];
            TileTwoTC = [[UIImageView alloc] initWithFrame:CGRectMake(pTwoTC.center.x-60, pTwoTC.center.y-60, pTwoTC.bounds.size.width, pTwoTC.bounds.size.height)];
            TileThreeTC = [[UIImageView alloc] initWithFrame:CGRectMake(pThreeTC.center.x-60, pThreeTC.center.y-60, pThreeTC.bounds.size.width, pThreeTC.bounds.size.height)];
            TileFourTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFourTC.center.x-60, pFourTC.center.y-60, pFourTC.bounds.size.width, pFourTC.bounds.size.height)];
            TileFiveTC = [[UIImageView alloc] initWithFrame:CGRectMake(pFiveTC.center.x-60, pFiveTC.center.y-60, pFiveTC.bounds.size.width, pFiveTC.bounds.size.height)];
            TileSixTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSixTC.center.x-60, pSixTC.center.y-60, pSixTC.bounds.size.width, pSixTC.bounds.size.height)];
            TileSevenTC = [[UIImageView alloc] initWithFrame:CGRectMake(pSevenTC.center.x-60, pSevenTC.center.y-60, pSevenTC.bounds.size.width, pSevenTC.bounds.size.height)];
            TileEightTC = [[UIImageView alloc] initWithFrame:CGRectMake(pEightTC.center.x-60, pEightTC.center.y-60, pEightTC.bounds.size.width, pEightTC.bounds.size.height)];
            TileNineTC = [[UIImageView alloc] initWithFrame:CGRectMake(pNineTC.center.x-60, pNineTC.center.y-60, pNineTC.bounds.size.width, pNineTC.bounds.size.height)];
            
        }
    }
    
    
    TileOneTC.backgroundColor = [UIColor whiteColor];
    TileTwoTC.backgroundColor = [UIColor whiteColor];
    TileThreeTC.backgroundColor = [UIColor whiteColor];
    TileFourTC.backgroundColor = [UIColor whiteColor];
    TileFiveTC.backgroundColor = [UIColor whiteColor];
    TileSixTC.backgroundColor = [UIColor whiteColor];
    TileSevenTC.backgroundColor = [UIColor whiteColor];
    TileEightTC.backgroundColor = [UIColor whiteColor];
    TileNineTC.backgroundColor = [UIColor whiteColor];
    
    TileOneTC.alpha = 0;
    TileTwoTC.alpha = 0;
    TileThreeTC.alpha = 0;
    TileFourTC.alpha = 0;
    TileFiveTC.alpha = 0;
    TileSixTC.alpha = 0;
    TileSevenTC.alpha = 0;
    TileEightTC.alpha = 0;
    TileNineTC.alpha = 0;
    
    [self.view addSubview:TileOneTC];
    [self.view addSubview:TileTwoTC];
    [self.view addSubview:TileThreeTC];
    [self.view addSubview:TileFourTC];
    [self.view addSubview:TileFiveTC];
    [self.view addSubview:TileSixTC];
    [self.view addSubview:TileSevenTC];
    [self.view addSubview:TileEightTC];
    [self.view addSubview:TileNineTC];
    
    TileOneTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOneTC.alpha = 1;
    TileOneTC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwoTC.alpha = 1;
    TileTwoTC.transform = CGAffineTransformMakeScale(1, 1);
    TileFourTC.alpha = 1;
    TileFourTC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileThreeTC.alpha = 1;
    TileThreeTC.transform = CGAffineTransformMakeScale(1, 1);
    TileFiveTC.alpha = 1;
    TileFiveTC.transform = CGAffineTransformMakeScale(1, 1);
    TileSevenTC.alpha = 1;
    TileSevenTC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileSixTC.alpha = 1;
    TileSixTC.transform = CGAffineTransformMakeScale(1, 1);
    TileEightTC.alpha = 1;
    TileEightTC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileNineTC.alpha = 1;
    TileNineTC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWordTC.alpha = 0;
    TheCurrentWordTC.alpha = 0;
    SenderDisplayTC.alpha = 0;
    PauseTC.alpha = 0;
    CheckTC.alpha = 0;
    pOneTC.alpha = 0;
    pTwoTC.alpha = 0;
    pThreeTC.alpha = 0;
    pFourTC.alpha = 0;
    pFiveTC.alpha = 0;
    pSixTC.alpha = 0;
    pSevenTC.alpha = 0;
    pEightTC.alpha = 0;
    pNineTC.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmountTC.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmountTC.alpha = 0;
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
    [TileOneTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwoTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThreeTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFiveTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSevenTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEightTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileNineTC.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOneTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwoTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileThreeTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileFiveTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileSevenTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileEightTC.layer addAnimation:rotation forKey:@"Spin"];
    [TileNineTC.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOneTC.transform = CGAffineTransformMakeScale(10, 10);
    TileTwoTC.transform = CGAffineTransformMakeScale(10, 10);
    TileThreeTC.transform = CGAffineTransformMakeScale(10, 10);
    TileFourTC.transform = CGAffineTransformMakeScale(10, 10);
    TileFiveTC.transform = CGAffineTransformMakeScale(10, 10);
    TileSixTC.transform = CGAffineTransformMakeScale(10, 10);
    TileSevenTC.transform = CGAffineTransformMakeScale(10, 10);
    TileEightTC.transform = CGAffineTransformMakeScale(10, 10);
    TileNineTC.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOneTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwoTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThreeTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFiveTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSevenTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEightTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNineTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmountTC.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)GetTheWord
{
    xOneTC = pOneTC.center.x;
    yOneTC = pOneTC.center.y;
    xTwoTC = pTwoTC.center.x;
    yTwoTC = pTwoTC.center.y;
    xThreeTC = pThreeTC.center.x;
    yThreeTC = pThreeTC.center.y;
    xFourTC = pFourTC.center.x;
    yFourTC = pFourTC.center.y;
    xFiveTC = pFiveTC.center.x;
    yFiveTC = pFiveTC.center.y;
    xSixTC = pSixTC.center.x;
    ySixTC = pSixTC.center.y;
    ySevenTC = pSevenTC.center.y;
    xSevenTC = pSevenTC.center.x;
    xEightTC = pEightTC.center.x;
    yEightTC = pEightTC.center.y;
    yNineTC = pNineTC.center.y;
    xNineTC = pNineTC.center.x;
    
    if (pOneTC.center.y == iktOneTC) {
        if (pOneTC.center.x == ikOneTC) {
            wOneTC = cOneTC;
        } else if (pOneTC.center.x == ikTwoTC) {
            wTwoTC = cOneTC;
        } else if (pOneTC.center.x == ikThreeTC) {
            wThreeTC = cOneTC;
        }
    }
    
    if (pTwoTC.center.y == iktOneTC) {
        if (pTwoTC.center.x == ikOneTC) {
            wOneTC = cTwoTC;
        } else if (pTwoTC.center.x == ikTwoTC) {
            wTwoTC = cTwoTC;
        } else if (pTwoTC.center.x == ikThreeTC) {
            wThreeTC = cTwoTC;
        }
    }
    
    if (pThreeTC.center.y == iktOneTC) {
        if (pThreeTC.center.x == ikOneTC) {
            wOneTC = cThreeTC;
        } else if (pThreeTC.center.x == ikTwoTC) {
            wTwoTC = cThreeTC;
        } else if (pThreeTC.center.x == ikThreeTC) {
            wThreeTC = cThreeTC;
        }
    }
    
    if (pFourTC.center.y == iktOneTC) {
        if (pFourTC.center.x == ikOneTC) {
            wOneTC = cFourTC;
        } else if (pFourTC.center.x == ikTwoTC) {
            wTwoTC = cFourTC;
        } else if (pFourTC.center.x == ikThreeTC) {
            wThreeTC = cFourTC;
        }
    }
    
    if (pFiveTC.center.y == iktOneTC) {
        if (pFiveTC.center.x == ikOneTC) {
            wOneTC = cFiveTC;
        } else if (pFiveTC.center.x == ikTwoTC) {
            wTwoTC = cFiveTC;
        } else if (pFiveTC.center.x == ikThreeTC) {
            wThreeTC = cFiveTC;
        }
    }
    
    if (pSixTC.center.y == iktOneTC) {
        if (pSixTC.center.x == ikOneTC) {
            wOneTC = cSixTC;
        } else if (pSixTC.center.x == ikTwoTC) {
            wTwoTC = cSixTC;
        } else if (pSixTC.center.x == ikThreeTC) {
            wThreeTC = cSixTC;
        }
    }
    
    if (pSevenTC.center.y == iktOneTC) {
        if (pSevenTC.center.x == ikOneTC) {
            wOneTC = cSevenTC;
        } else if (pSevenTC.center.x == ikTwoTC) {
            wTwoTC = cSevenTC;
        } else if (pSevenTC.center.x == ikThreeTC) {
            wThreeTC = cSevenTC;
        }
    }
    
    if (pEightTC.center.y == iktOneTC) {
        if (pEightTC.center.x == ikOneTC) {
            wOneTC = cEightTC;
        } else if (pEightTC.center.x == ikTwoTC) {
            wTwoTC = cEightTC;
        } else if (pEightTC.center.x == ikThreeTC) {
            wThreeTC = cEightTC;
        }
    }
    
    if (pNineTC.center.y == iktOneTC) {
        if (pNineTC.center.x == ikOneTC) {
            wOneTC = cNineTC;
        } else if (pNineTC.center.x == ikTwoTC) {
            wTwoTC = cNineTC;
        } else if (pNineTC.center.x == ikThreeTC) {
            wThreeTC = cNineTC;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOneTC];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwoTC];
    NSString *Threes = [NSString stringWithFormat:@"%c", wThreeTC];
    
    WordTC = [NSString stringWithFormat:@"%@%@%@", Ones, Twos, Threes];
    TheCurrentWordTC.text = [WordTC uppercaseString];
    
    pOneTC.center = CGPointMake(xOneTC, yOneTC);
    pTwoTC.center = CGPointMake(xTwoTC, yTwoTC);
    pThreeTC.center = CGPointMake(xThreeTC, yThreeTC);
    pFourTC.center = CGPointMake(xFourTC, yFourTC);
    pFiveTC.center = CGPointMake(xFiveTC, yFiveTC);
    pSixTC.center = CGPointMake(xSixTC, ySixTC);
    pSevenTC.center = CGPointMake(xSevenTC, ySevenTC);
    pEightTC.center = CGPointMake(xEightTC, yEightTC);
    pNineTC.center = CGPointMake(xNineTC, yNineTC);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    [PauseTC setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwoTC play];
    
    PauseTC.userInteractionEnabled = NO;
    CheckTC.userInteractionEnabled = NO;
    PauseDisplayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    PlayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWordsTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    HomeTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTC.alpha = 1.0;
        
        CurrentWordsTC.alpha = 1;
        PlayTC.alpha = 1;
        HomeTC.alpha = 1;
        
        PauseDisplayTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        HomeTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        PlayTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWordsTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        CheckTC.alpha = 0;
        TheCurrentWordTC.alpha = 0;
        BarUnderWordTC.alpha = 0;
        SenderDisplayTC.alpha = 0;
        TotalAmountTC.alpha = 0;
        PauseTC.alpha = 0;
        
        CheckTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWordTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWordTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmountTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PauseTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        pOneTC.alpha = 0;
        pTwoTC.alpha = 0;
        pThreeTC.alpha = 0;
        pFourTC.alpha = 0;
        pFiveTC.alpha = 0;
        pSixTC.alpha = 0;
        pSevenTC.alpha = 0;
        pEightTC.alpha = 0;
        pNineTC.alpha = 0;
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScrollerTC = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScrollerTC = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScrollerTC = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScrollerTC = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScrollerTC = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }
    
    WordScrollerTC.scrollEnabled = YES;
    WordScrollerTC.userInteractionEnabled = YES;
    WordScrollerTC.backgroundColor = [UIColor blackColor];
    WordScrollerTC.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScrollerTC.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScrollerTC aboveSubview:PauseDisplayTC];
    if (ScoreTC > 0) {
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
                    if (WordIsAlreadyDoneTC[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScrollerTC.subviews) {
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
                            WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScrollerTC addSubview:lbl];
                        }
                    }
                    
                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDoneTC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTC.subviews) {
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
                                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTC addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDoneTC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTC.subviews) {
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
                                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTC addSubview:lbl];
                            }
                        }
                        
                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDoneTC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTC.subviews) {
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
                                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScrollerTC addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDoneTC[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScrollerTC.subviews) {
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
                                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScrollerTC addSubview:lbl];
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
            [WordScrollerTC addSubview:lbll];
            WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTC addSubview:lbll];
                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTC addSubview:lbll];
                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTC addSubview:lbll];
                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScrollerTC addSubview:lbll];
                WordScrollerTC.contentSize = CGSizeMake(WordScrollerTC.bounds.size.width, lbll.center.y + 50);
            }
        }
    }
}

-(IBAction)Play:(id)sender
{
    [SoundOneTC play];
    [SoundTwoTC play];
    
    for (UIView *v in WordScrollerTC.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerTC removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTC.alpha = 0;
        HomeTC.alpha = 0;
        PlayTC.alpha = 0;
        CurrentWordsTC.alpha = 0;
        
        pOneTC.alpha = 1;
        pTwoTC.alpha = 1;
        pThreeTC.alpha = 1;
        pFourTC.alpha = 1;
        pFiveTC.alpha = 1;
        pSixTC.alpha = 1;
        pSevenTC.alpha = 1;
        pEightTC.alpha = 1;
        pNineTC.alpha = 1;
        
        CheckTC.userInteractionEnabled = YES;
        PauseTC.userInteractionEnabled = YES;
        
        PauseDisplayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        CheckTC.alpha = 1;
        TheCurrentWordTC.alpha = 1;
        BarUnderWordTC.alpha = 1;
        SenderDisplayTC.alpha = 1;
        TotalAmountTC.alpha = 1;
        PauseTC.alpha = 1;
        
        CheckTC.transform =CGAffineTransformMakeScale(1,1);
        TheCurrentWordTC.transform =CGAffineTransformMakeScale(1,1);
        BarUnderWordTC.transform =CGAffineTransformMakeScale(1,1);
        SenderDisplayTC.transform =CGAffineTransformMakeScale(1,1);
        TotalAmountTC.transform =CGAffineTransformMakeScale(1,1);
        PauseTC.transform =CGAffineTransformMakeScale(1,1);
        
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOneTC play];
    [SoundTwoTC play];
    
    for (UIView *v in WordScrollerTC.subviews) {
        @autoreleasepool {
            [v removeFromSuperview];
        }
    }
    [WordScrollerTC removeFromSuperview];
    CheckTC.transform =CGAffineTransformMakeScale(1,1);
    TheCurrentWordTC.transform =CGAffineTransformMakeScale(1,1);
    BarUnderWordTC.transform =CGAffineTransformMakeScale(1,1);
    SenderDisplayTC.transform =CGAffineTransformMakeScale(1,1);
    TotalAmountTC.transform =CGAffineTransformMakeScale(1,1);
    PauseTC.transform =CGAffineTransformMakeScale(1,1);
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplayTC.alpha = 0;
        HomeTC.alpha = 0;
        PlayTC.alpha = 0;
        CurrentWordsTC.alpha = 0;
        
        CheckTC.userInteractionEnabled = YES;
        PauseTC.userInteractionEnabled = YES;
        
        PauseDisplayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        PlayTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWordsTC.transform =CGAffineTransformMakeScale(1.3,1.3);
        HomeTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    }];
    
    [pOneTC setAlpha:0];
    [pTwoTC setAlpha:0];
    [pThreeTC setAlpha:0];
    [pFourTC setAlpha:0];
    [pFiveTC setAlpha:0];
    [pSixTC setAlpha:0];
    [pSevenTC setAlpha:0];
    [pEightTC setAlpha:0];
    [pNineTC setAlpha:0];
    [BarUnderWordTC setAlpha:0];
    [TheCurrentWordTC setAlpha:0];
    [CheckTC setAlpha:0];
    [PauseTC setAlpha:0];
    [SenderDisplayTC setAlpha:0];
    [TotalAmountTC setAlpha:0];
    [self BackToHome];
}

-(void)BackToHome
{
    for (int i = 0; i <= 956; i++) {
        @autoreleasepool {
            WordIsAlreadyDoneTC[i] = NO;
        }
    }
    
    ScoreTC = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    [tHomeTC setAlpha:1];
    [UIView commitAnimations];
    
    [TileOneTC removeFromSuperview];
    [TileTwoTC removeFromSuperview];
    [TileThreeTC removeFromSuperview];
    [TileFourTC removeFromSuperview];
    [TileFiveTC removeFromSuperview];
    [TileSixTC removeFromSuperview];
    [TileSevenTC removeFromSuperview];
    [TileEightTC removeFromSuperview];
    [TileNineTC removeFromSuperview];
    
    pOneTC.center = CGPointMake(ikOneTC, iktOneTC);
    pTwoTC.center = CGPointMake(ikTwoTC, iktTwoTC);
    pThreeTC.center = CGPointMake(ikThreeTC, iktThreeTC);
    pFourTC.center = CGPointMake(ikFourTC, iktFourTC);
    pFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC);
    pSixTC.center = CGPointMake(ikSixTC, iktSixTC);
    pSevenTC.center = CGPointMake(ikSevenTC, iktSevenTC);
    pEightTC.center = CGPointMake(ikEightTC, iktEightTC);
    pNineTC.center = CGPointMake(ikNineTC, iktNineTC);
    
    BBSelectionTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gTwoTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gOneTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    gThreeTC.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        gOneTC.alpha = 1.0;
        gThreeTC.alpha = 1;
        gTwoTC.alpha = 1;
        BBSelectionTC.alpha = 1;
        
        gOneTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        gTwoTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        BBSelectionTC.transform =CGAffineTransformMakeScale(1.0,1.0);
        gThreeTC.transform =CGAffineTransformMakeScale(1.0,1.0);
    }];
    
    siOneTC = 0;
    siTwoTC = 0;
    siThreeTC = 0;
    siFourTC = 0;
    siFiveTC = 0;
    siSixTC = 0;
    siSevenTC = 0;
    siEightTC = 0;
    siNineTC = 0;
    
    NSString *imageName = @"Blank.png";
    spOneTC.image = [UIImage imageNamed:imageName];
    spTwoTC.image = [UIImage imageNamed:imageName];
    spThreeTC.image = [UIImage imageNamed:imageName];
    spFourTC.image = [UIImage imageNamed:imageName];
    spFiveTC.image = [UIImage imageNamed:imageName];
    spSixTC.image = [UIImage imageNamed:imageName];
    spSevenTC.image = [UIImage imageNamed:imageName];
    spEightTC.image = [UIImage imageNamed:imageName];
    spNineTC.image = [UIImage imageNamed:imageName];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    spOneTC.alpha = 1;
    spTwoTC.alpha = 1;
    spThreeTC.alpha = 1;
    spFourTC.alpha = 1;
    spFiveTC.alpha = 1;
    spSixTC.alpha = 1;
    spSevenTC.alpha = 1;
    spEightTC.alpha = 1;
    spNineTC.alpha = 1;
    StartTC.alpha = 1;
    
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        spOneTC.center = CGPointMake(ikOneTC, iktOneTC-50);
        spTwoTC.center = CGPointMake(ikTwoTC, iktTwoTC-50);
        spThreeTC.center = CGPointMake(ikThreeTC, iktThreeTC-50);
        spFourTC.center = CGPointMake(ikFourTC, iktFourTC-50);
        spFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC-50);
        spSixTC.center = CGPointMake(ikSixTC, iktSixTC-50);
        spSevenTC.center = CGPointMake(ikSevenTC, iktSevenTC-50);
        spEightTC.center = CGPointMake(ikEightTC, iktEightTC-50);
        spNineTC.center = CGPointMake(ikNineTC, iktNineTC-50);
    } else {
        spOneTC.center = CGPointMake(ikOneTC, iktOneTC);
        spTwoTC.center = CGPointMake(ikTwoTC, iktTwoTC);
        spThreeTC.center = CGPointMake(ikThreeTC, iktThreeTC);
        spFourTC.center = CGPointMake(ikFourTC, iktFourTC);
        spFiveTC.center = CGPointMake(ikFiveTC, iktFiveTC);
        spSixTC.center = CGPointMake(ikSixTC, iktSixTC);
        spSevenTC.center = CGPointMake(ikSevenTC, iktSevenTC);
        spEightTC.center = CGPointMake(ikEightTC, iktEightTC);
        spNineTC.center = CGPointMake(ikNineTC, iktNineTC);
    }
    [UIView commitAnimations];
}

-(IBAction)gTwo:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [BBSelectionTC setAlpha:0];
    [ErrorMessageTC setAlpha:0];
    [StartTC setAlpha:0];
    [spOneTC setAlpha:0];
    [spTwoTC setAlpha:0];
    [spThreeTC setAlpha:0];
    [spFourTC setAlpha:0];
    [spFiveTC setAlpha:0];
    [spSixTC setAlpha:0];
    [spSevenTC setAlpha:0];
    [spEightTC setAlpha:0];
    [spNineTC setAlpha:0];
    [UIView commitAnimations];
    BackGroundTwoTC.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneTC.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"GTQuestionsThree" sender:self];
}

-(IBAction)gOne:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [BBSelectionTC setAlpha:0];
    [ErrorMessageTC setAlpha:0];
    [StartTC setAlpha:0];
    [spOneTC setAlpha:0];
    [spTwoTC setAlpha:0];
    [spThreeTC setAlpha:0];
    [spFourTC setAlpha:0];
    [spFiveTC setAlpha:0];
    [spSixTC setAlpha:0];
    [spSevenTC setAlpha:0];
    [spEightTC setAlpha:0];
    [spNineTC setAlpha:0];
    [UIView commitAnimations];
    BackGroundThreeTC.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOneTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOneTC.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameOne) withObject:nil afterDelay:1];
}

-(void)GoToGameOne
{
    [self performSegueWithIdentifier:@"GTGridsThree" sender:self];
}

-(IBAction)tHome:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFourTC.alpha = 0;
        BackGroundFourTC.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFourTC.alpha = 1;
                             BackGroundFourTC.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
    [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
    [self performSegueWithIdentifier:@"GoToHomeFromThreeGrids" sender:self];
}

@end