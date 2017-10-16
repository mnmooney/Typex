//
//  FourGrids.m
//  Typex V2
//
//  Created by Michael Mooney on 31/05/2015.
//  Copyright (c) 2015 Michael Mooney. All rights reserved.
//
#import "FourGrids.h"
#import <AVFoundation/AVFoundation.h>

NSInteger WordFour;
NSString *Word, *SavedWords;

int replay, Score, Previous, PanningInt, PPanningMethod, TheAmount;
NSInteger PanningSensitivity;

char cOne, cTwo, cThree, cFour, cFive, cSix, cSeven, cEight, cNine, cTen, cEleven, cTwelve, cThirteen, cFourteen, cFithteen, cSixteen;
char wOne, wTwo, wThree, wFour;

float ikOne, ikTwo, ikThree, ikFour, ikFive, ikSix, ikSeven, ikEight, ikNine, ikTen, ikEleven, ikTwelve, ikThirteen, ikFourteen, ikFithteen, ikSixteen;
float iktOne, iktTwo, iktThree, iktFour, iktFive, iktSix, iktSeven, iktEight, iktNine, iktTen, iktEleven, iktTwelve, iktThirteen, iktFourteen, iktFithteen, iktSixteen;
float iLeft, iRight, iUp, iDown;
float pointOfIntrest;
float xOne, yOne, xTwo, yTwo, xThree, yThree, xFour, yFour, xFive, yFive, xSix, ySix, xSeven, ySeven, xEight, yEight, xNine, yNine, xTen, yTen, xEleven, yEleven, xTwelve, yTwelve, xThirteen, yThirteen, xFourteen, yFourteen, xFithteen, yFithteen, ySixteen, xSixteen;
float kSelection;
CGPoint One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Eleven, Twelve, Thirteen, Fourteen, Fithteen, Sixteen, distance;

BOOL WordIsAlreadyDone[3822];

@interface FourGrids () <AVAudioPlayerDelegate>
{
    AVAudioPlayer *SoundOne, *SoundTwo, *SwipeSound;
    
    #pragma Mark Global - Used throughout
    IBOutlet UIButton *tHome, *Check;
    IBOutlet UIImageView *BackGroundOne, *BackGroundTwo, *BackGroundThree, *BackGroundFour;
    IBOutlet UIImageView *TileOne, *TileTwo, *TileThree, *TileFour, *TileFive, *TileSix, *TileSeven, *TileEight, *TileNine, *TileTen, *TileEleven, *TileTwelve, *TileThirteen, *TileFourteen, *TileFithteen, *TileSixteen;
    
    #pragma Mark Game - Grids
    IBOutlet UIImageView *pOne, *pTwo, *pThree, *pFour, *pFive, *pSix, *pSeven, *pEight, *pNine, *pTen, *pEleven, *pTwelve, *pThirteen, *pFourteen, *pFithteen, *pSixteen;
    IBOutlet UILabel *TotalAmount;
    IBOutlet UIButton *Pause;
    IBOutlet UILabel *TheCurrentWord;
    IBOutlet UIImageView *PauseDisplay, *SenderDisplay;
    IBOutlet UIButton *Home, *Play;
    IBOutlet UIImageView *BarUnderWord;
    
    #pragma Mark Selection - Fist Page
    IBOutlet UIButton *sOne, *sTwo, *sThree, *sFour, *sFive, *sSix, *sSeven, *sEight, *sNine, *sTen, *sEleven, *sTwelve, *sThirteen, *sFourteen, *sFithteen;
    IBOutlet UIScrollView *WordScroller;
    IBOutlet UILabel *CurrentWords;
    NSTimer *mover;
}
@end

@implementation FourGrids


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

    BackGroundFour.alpha = 0;
    
#pragma Mark The Game Items
    
    Score = 0;
    
    Pause.alpha = 0;
    Check.alpha = 0;
    TotalAmount.alpha = 0;
    
    pOne.alpha = 0;
    pTwo.alpha = 0;
    pThree.alpha = 0;
    CurrentWords.alpha = 0;
    Play.alpha = 0;
    Home.alpha = 0;
    pFour.alpha = 0;
    pFive.alpha = 0;
    pSix.alpha = 0;
    pSeven.alpha = 0;
    pEight.alpha = 0;
    pNine.alpha = 0;
    pTen.alpha = 0;
    pEleven.alpha = 0;
    pTwelve.alpha = 0;
    BarUnderWord.alpha = 0;
    pThirteen.alpha = 0;
    pFourteen.alpha = 0;
    pFithteen.alpha = 0;
    pSixteen.alpha = 0;
    SenderDisplay.alpha = 0;
    TheCurrentWord.alpha = 0;
    PauseDisplay.alpha = 0;
        
#pragma Mark The Selection Page
    
    sOne.alpha = 0;
    sTwo.alpha = 0;
    sThree.alpha = 0;
    sFour.alpha = 0;
    sFive.alpha = 0;
    sSix.alpha = 0;
    sSeven.alpha = 0;
    sEight.alpha = 0;
    sNine.alpha = 0;
    sTen.alpha = 0;
    sEleven.alpha = 0;
    sTwelve.alpha = 0;
    sThirteen.alpha = 0;
    sFourteen.alpha = 0;
    sFithteen.alpha = 0;
    PauseDisplay.backgroundColor = [UIColor blackColor];
    self.view.userInteractionEnabled = NO;
    
    NSString *audioFilePathto = [[NSBundle mainBundle] pathForResource:@"Swipe" ofType:@"wav"];
    NSURL *pathAsURLto = [[NSURL alloc] initFileURLWithPath:audioFilePathto];
    NSError *errorto;
    SwipeSound = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLto error:&errorto];
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"TapOne" ofType:@"wav"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    NSError *error;
    SoundOne = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    NSString *audioFilePatht = [[NSBundle mainBundle] pathForResource:@"TapTwo" ofType:@"wav"];
    NSURL *pathAsURLt = [[NSURL alloc] initFileURLWithPath:audioFilePatht];
    NSError *errort;
    SoundTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURLt error:&errort];
    
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
    [tHome.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        sOne.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwo.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThree.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFour.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFive.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSix.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sSeven.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sEight.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sNine.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sEleven.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sTwelve.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sThirteen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFourteen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        sFithteen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            sOne.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwo.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThree.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFour.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFive.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSix.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sSeven.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sEight.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sNine.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sEleven.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sTwelve.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sThirteen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFourteen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            sFithteen.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                sOne.transform = CGAffineTransformIdentity;
                sTwo.transform = CGAffineTransformIdentity;
                sThree.transform = CGAffineTransformIdentity;
                sFour.transform = CGAffineTransformIdentity;
                sFive.transform = CGAffineTransformIdentity;
                sSix.transform = CGAffineTransformIdentity;
                sSeven.transform = CGAffineTransformIdentity;
                sEight.transform = CGAffineTransformIdentity;
                sNine.transform = CGAffineTransformIdentity;
                sTen.transform = CGAffineTransformIdentity;
                sEleven.transform = CGAffineTransformIdentity;
                sTwelve.transform = CGAffineTransformIdentity;
                sThirteen.transform = CGAffineTransformIdentity;
                sFourteen.transform = CGAffineTransformIdentity;
                sFithteen.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    tHome.alpha = 1;
    sOne.alpha = 1;
    sTwo.alpha = 1;
    sThree.alpha = 1;
    sFour.alpha = 1;
    sFive.alpha = 1;
    sSix.alpha = 1;
    sSeven.alpha = 1;
    sEight.alpha = 1;
    sNine.alpha = 1;
    sTen.alpha = 1;
    sEleven.alpha = 1;
    sTwelve.alpha = 1;
    sThirteen.alpha = 1;
    sFourteen.alpha = 1;
    sFithteen.alpha = 1;
    [UIView commitAnimations];
}

-(void)GetDevice
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    if (screenHeight == 480) {
        // do iPhone 4s stuff
        
        tHome = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 45)];
        
        Play = [[UIButton alloc] initWithFrame:CGRectMake(25, 106, 45, 45)];
        Home = [[UIButton alloc] initWithFrame:CGRectMake(250, 106, 50, 50)];
        CurrentWords = [[UILabel alloc] initWithFrame:CGRectMake(69, 146, 182, 23)];
        PauseDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 280)];
        CurrentWords.font  = [[CurrentWords font] fontWithSize:20];
        
        sOne = [[UIButton alloc] initWithFrame:CGRectMake(72, 45, 100, 40)];
        sTwo = [[UIButton alloc] initWithFrame:CGRectMake(180, 45, 100, 40)];
        sThree = [[UIButton alloc] initWithFrame:CGRectMake(72, 93, 100, 40)];
        sFour = [[UIButton alloc] initWithFrame:CGRectMake(180, 93, 100, 40)];
        sFive = [[UIButton alloc] initWithFrame:CGRectMake(72, 141, 100, 40)];
        sSix = [[UIButton alloc] initWithFrame:CGRectMake(180, 141, 100, 40)];
        sSeven = [[UIButton alloc] initWithFrame:CGRectMake(72, 189, 100, 40)];
        sEight = [[UIButton alloc] initWithFrame:CGRectMake(180, 189, 100, 40)];
        sNine = [[UIButton alloc] initWithFrame:CGRectMake(72, 237, 100, 40)];
        sTen = [[UIButton alloc] initWithFrame:CGRectMake(180, 237, 100, 40)];
        sEleven = [[UIButton alloc] initWithFrame:CGRectMake(72, 285, 100, 40)];
        sTwelve = [[UIButton alloc] initWithFrame:CGRectMake(180, 285, 100, 40)];
        sThirteen = [[UIButton alloc] initWithFrame:CGRectMake(72, 333, 100, 40)];
        sFourteen = [[UIButton alloc] initWithFrame:CGRectMake(180, 333, 100, 40)];
        sFithteen = [[UIButton alloc] initWithFrame:CGRectMake(72, 381, 100, 40)];
        
        pOne = [[UIImageView alloc] initWithFrame:CGRectMake(33, 220, 60, 60)];
        pTwo = [[UIImageView alloc] initWithFrame:CGRectMake(98, 220, 60, 60)];
        pThree = [[UIImageView alloc] initWithFrame:CGRectMake(163, 220, 60, 60)];
        pFour = [[UIImageView alloc] initWithFrame:CGRectMake(228, 220, 60, 60)];
        pFive = [[UIImageView alloc] initWithFrame:CGRectMake(33, 285, 60, 60)];
        pSix = [[UIImageView alloc] initWithFrame:CGRectMake(98, 285, 60, 60)];
        pSeven = [[UIImageView alloc] initWithFrame:CGRectMake(163, 285, 60, 60)];
        pEight = [[UIImageView alloc] initWithFrame:CGRectMake(228, 285, 60, 60)];
        pNine = [[UIImageView alloc] initWithFrame:CGRectMake(33, 350, 60, 60)];
        pTen = [[UIImageView alloc] initWithFrame:CGRectMake(98, 350, 60, 60)];
        pEleven = [[UIImageView alloc] initWithFrame:CGRectMake(163, 350, 60, 60)];
        pTwelve = [[UIImageView alloc] initWithFrame:CGRectMake(228, 350, 60, 60)];
        pThirteen = [[UIImageView alloc] initWithFrame:CGRectMake(33, 415, 60, 60)];
        pFourteen = [[UIImageView alloc] initWithFrame:CGRectMake(98, 415, 60, 60)];
        pFithteen = [[UIImageView alloc] initWithFrame:CGRectMake(163, 415, 60, 60)];
        pSixteen = [[UIImageView alloc] initWithFrame:CGRectMake(228, 415, 60, 60)];
        
        SenderDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(62, 20, 136, 45)];
        TotalAmount = [[UILabel alloc] initWithFrame:CGRectMake(62, 20, 131, 38)];
        TotalAmount.font = [[TotalAmount font] fontWithSize:15];
        Pause = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 38, 45)];
        Check = [[UIButton alloc] initWithFrame:CGRectMake(84, 133, 153, 36)];
        BarUnderWord = [[UIImageView alloc] initWithFrame:CGRectMake(40, 210, 240, 2)];
        TheCurrentWord = [[UILabel alloc] initWithFrame:CGRectMake(123, 187, 75, 25)];
        TheCurrentWord.font  = [[TheCurrentWord font] fontWithSize:15];
        
        BackGroundOne = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThree = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFour = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        
    } else if (screenHeight == 568) {
        // do iPhone 5, 5s, 5c stuff
        
        SenderDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(64, 20, 155, 50)];
        TotalAmount = [[UILabel alloc] initWithFrame:CGRectMake(64, 20, 150, 36)];
        TotalAmount.font = [[TotalAmount font] fontWithSize:20];
        Pause = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        Check = [[UIButton alloc] initWithFrame:CGRectMake(60, 130, 200, 40)];
        BarUnderWord = [[UIImageView alloc] initWithFrame:CGRectMake(40, 228, 240, 2)];
        TheCurrentWord = [[UILabel alloc] initWithFrame:CGRectMake(108, 197, 104, 28)];
        TheCurrentWord.font  = [[TheCurrentWord font] fontWithSize:25];
        
        tHome = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        
        sOne = [[UIButton alloc] initWithFrame:CGRectMake(48, 106, 110, 45)];
        sTwo = [[UIButton alloc] initWithFrame:CGRectMake(182, 106, 110, 45)];
        sThree = [[UIButton alloc] initWithFrame:CGRectMake(48, 156, 110, 45)];
        sFour = [[UIButton alloc] initWithFrame:CGRectMake(182, 156, 110, 45)];
        sFive = [[UIButton alloc] initWithFrame:CGRectMake(48, 206, 110, 45)];
        sSix = [[UIButton alloc] initWithFrame:CGRectMake(182, 206, 110, 45)];
        sSeven = [[UIButton alloc] initWithFrame:CGRectMake(48, 256, 110, 45)];
        sEight = [[UIButton alloc] initWithFrame:CGRectMake(182, 256, 110, 45)];
        sNine = [[UIButton alloc] initWithFrame:CGRectMake(48, 306, 110, 45)];
        sTen = [[UIButton alloc] initWithFrame:CGRectMake(182, 306, 110, 45)];
        sEleven = [[UIButton alloc] initWithFrame:CGRectMake(48, 356, 110, 45)];
        sTwelve = [[UIButton alloc] initWithFrame:CGRectMake(182, 356, 110, 45)];
        sThirteen = [[UIButton alloc] initWithFrame:CGRectMake(48, 406, 110, 45)];
        sFourteen = [[UIButton alloc] initWithFrame:CGRectMake(182, 406, 110, 45)];
        sFithteen = [[UIButton alloc] initWithFrame:CGRectMake(48, 456, 110, 45)];
        
        pOne = [[UIImageView alloc] initWithFrame:CGRectMake(5, 238, 70, 70)];
        pTwo = [[UIImageView alloc] initWithFrame:CGRectMake(85, 238, 70, 70)];
        pThree = [[UIImageView alloc] initWithFrame:CGRectMake(165, 238, 70, 70)];
        pFour = [[UIImageView alloc] initWithFrame:CGRectMake(245, 238, 70, 70)];
        pFive = [[UIImageView alloc] initWithFrame:CGRectMake(5, 318, 70, 70)];
        pSix = [[UIImageView alloc] initWithFrame:CGRectMake(85, 318, 70, 70)];
        pSeven = [[UIImageView alloc] initWithFrame:CGRectMake(165, 318, 70, 70)];
        pEight = [[UIImageView alloc] initWithFrame:CGRectMake(245, 318, 70, 70)];
        pNine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 398, 70, 70)];
        pTen = [[UIImageView alloc] initWithFrame:CGRectMake(85, 398, 70, 70)];
        pEleven = [[UIImageView alloc] initWithFrame:CGRectMake(165, 398, 70, 70)];
        pTwelve = [[UIImageView alloc] initWithFrame:CGRectMake(245, 398, 70, 70)];
        pThirteen = [[UIImageView alloc] initWithFrame:CGRectMake(5, 478, 70, 70)];
        pFourteen = [[UIImageView alloc] initWithFrame:CGRectMake(85, 478, 70, 70)];
        pFithteen = [[UIImageView alloc] initWithFrame:CGRectMake(165, 478, 70, 70)];
        pSixteen = [[UIImageView alloc] initWithFrame:CGRectMake(245, 478, 70, 70)];
        
        BackGroundOne = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundThree = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        BackGroundFour = [[UIImageView alloc] initWithFrame:CGRectMake(-190, -66, 700, 700)];
        
        Play = [[UIButton alloc] initWithFrame:CGRectMake(26, 150, 50, 50)];
        Home = [[UIButton alloc] initWithFrame:CGRectMake(244, 150, 50, 50)];
        CurrentWords = [[UILabel alloc] initWithFrame:CGRectMake(75, 202, 173, 21)];
        PauseDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(16, 139, 290, 290)];
        CurrentWords.font  = [[CurrentWords font] fontWithSize:20];
        
    } else if (screenHeight == 667) {
        // do iPhone 6 stuff
        
        tHome = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 50, 50)];
        
        sOne = [[UIButton alloc] initWithFrame:CGRectMake(12, 193, 110, 50)];
        sTwo = [[UIButton alloc] initWithFrame:CGRectMake(130, 193, 110, 50)];
        sThree = [[UIButton alloc] initWithFrame:CGRectMake(252, 193, 110, 50)];
        sFour = [[UIButton alloc] initWithFrame:CGRectMake(12, 251, 110, 50)];
        sFive = [[UIButton alloc] initWithFrame:CGRectMake(130, 251, 110, 50)];
        sSix = [[UIButton alloc] initWithFrame:CGRectMake(252, 251, 110, 50)];
        sSeven = [[UIButton alloc] initWithFrame:CGRectMake(12, 309, 110, 50)];
        sEight = [[UIButton alloc] initWithFrame:CGRectMake(130, 309, 110, 50)];
        sNine = [[UIButton alloc] initWithFrame:CGRectMake(252, 309, 110, 50)];
        sTen = [[UIButton alloc] initWithFrame:CGRectMake(12, 367, 110, 50)];
        sEleven = [[UIButton alloc] initWithFrame:CGRectMake(130, 367, 110, 50)];
        sTwelve = [[UIButton alloc] initWithFrame:CGRectMake(252, 367, 110, 50)];
        sThirteen = [[UIButton alloc] initWithFrame:CGRectMake(12, 425, 110, 50)];
        sFourteen = [[UIButton alloc] initWithFrame:CGRectMake(130, 425, 110, 50)];
        sFithteen = [[UIButton alloc] initWithFrame:CGRectMake(252, 425, 110, 50)];
        
        BackGroundOne = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundThree = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        BackGroundFour = [[UIImageView alloc] initWithFrame:CGRectMake(-213, -66, 800, 800)];
        
        Play = [[UIButton alloc] initWithFrame:CGRectMake(27, 174, 50, 50)];
        Home = [[UIButton alloc] initWithFrame:CGRectMake(297, 174, 50, 50)];
        PauseDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(17, 164, 340, 340)];
        CurrentWords = [[UILabel alloc] initWithFrame:CGRectMake(73, 214, 229, 33)];
        CurrentWords.font = [[CurrentWords font] fontWithSize:25];
        
        pOne = [[UIImageView alloc] initWithFrame:CGRectMake(12, 297, 80, 80)];
        pTwo = [[UIImageView alloc] initWithFrame:CGRectMake(102, 297, 80, 80)];
        pThree = [[UIImageView alloc] initWithFrame:CGRectMake(192, 297, 80, 80)];
        pFour = [[UIImageView alloc] initWithFrame:CGRectMake(282, 297, 80, 80)];
        pFive = [[UIImageView alloc] initWithFrame:CGRectMake(12, 387, 80, 80)];
        pSix = [[UIImageView alloc] initWithFrame:CGRectMake(102, 387, 80, 80)];
        pSeven = [[UIImageView alloc] initWithFrame:CGRectMake(192, 387, 80, 80)];
        pEight = [[UIImageView alloc] initWithFrame:CGRectMake(282, 387, 80, 80)];
        pNine = [[UIImageView alloc] initWithFrame:CGRectMake(12, 477, 80, 80)];
        pTen = [[UIImageView alloc] initWithFrame:CGRectMake(102, 477, 80, 80)];
        pEleven = [[UIImageView alloc] initWithFrame:CGRectMake(192, 477, 80, 80)];
        pTwelve = [[UIImageView alloc] initWithFrame:CGRectMake(282, 477, 80, 80)];
        pThirteen = [[UIImageView alloc] initWithFrame:CGRectMake(12, 567, 80, 80)];
        pFourteen = [[UIImageView alloc] initWithFrame:CGRectMake(102, 567, 80, 80)];
        pFithteen = [[UIImageView alloc] initWithFrame:CGRectMake(192, 567, 80, 80)];
        pSixteen = [[UIImageView alloc] initWithFrame:CGRectMake(282, 567, 80, 80)];
        
        BarUnderWord = [[UIImageView alloc] initWithFrame:CGRectMake(67, 287, 240, 2)];
        TheCurrentWord = [[UILabel alloc] initWithFrame:CGRectMake(123, 254, 128, 35)];
        Check = [[UIButton alloc] initWithFrame:CGRectMake(82, 174, 210, 45)];
        SenderDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(66, 20, 182, 50)];
        TotalAmount = [[UILabel alloc] initWithFrame:CGRectMake(67, 20, 124, 42)];
        Pause = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 40, 50)];
        
        TheCurrentWord.font  = [[TheCurrentWord font] fontWithSize:25];
        TotalAmount.font = [[TotalAmount font] fontWithSize:22];
        
    } else if (screenHeight == 736) {
        //do iPhone 6 plus stuff
        
        BackGroundOne = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundTwo = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundThree = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        BackGroundFour = [[UIImageView alloc] initWithFrame:CGRectMake(-218, -57, 850, 850)];
        
        tHome = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 55, 55)];
        
        Play = [[UIButton alloc] initWithFrame:CGRectMake(27, 188, 55, 55)];
        Home = [[UIButton alloc] initWithFrame:CGRectMake(332, 188, 55, 55)];
        PauseDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(17, 178, 380, 380)];
        CurrentWords = [[UILabel alloc] initWithFrame:CGRectMake(86, 245, 243, 42)];
        CurrentWords.font = [[CurrentWords font] fontWithSize:25];
        
        sOne = [[UIButton alloc] initWithFrame:CGRectMake(19, 227, 120, 50)];
        sTwo = [[UIButton alloc] initWithFrame:CGRectMake(147, 227, 120, 50)];
        sThree = [[UIButton alloc] initWithFrame:CGRectMake(275, 227, 120, 50)];
        sFour = [[UIButton alloc] initWithFrame:CGRectMake(19, 285, 120, 50)];
        sFive = [[UIButton alloc] initWithFrame:CGRectMake(147, 285, 120, 50)];
        sSix = [[UIButton alloc] initWithFrame:CGRectMake(275, 285, 120, 50)];
        sSeven = [[UIButton alloc] initWithFrame:CGRectMake(19, 343, 120, 50)];
        sEight = [[UIButton alloc] initWithFrame:CGRectMake(147, 343, 120, 50)];
        sNine = [[UIButton alloc] initWithFrame:CGRectMake(275, 343, 120, 50)];
        sTen = [[UIButton alloc] initWithFrame:CGRectMake(19, 401, 120, 50)];
        sEleven = [[UIButton alloc] initWithFrame:CGRectMake(147, 401, 120, 50)];
        sTwelve = [[UIButton alloc] initWithFrame:CGRectMake(275, 401, 120, 50)];
        sThirteen = [[UIButton alloc] initWithFrame:CGRectMake(19, 459, 120, 50)];
        sFourteen = [[UIButton alloc] initWithFrame:CGRectMake(147, 459, 120, 50)];
        sFithteen = [[UIButton alloc] initWithFrame:CGRectMake(275, 459, 120, 50)];
        
        BarUnderWord = [[UIImageView alloc] initWithFrame:CGRectMake(67, 365, 280, 2)];
        TheCurrentWord = [[UILabel alloc] initWithFrame:CGRectMake(153, 339, 109, 28)];
        Check = [[UIButton alloc] initWithFrame:CGRectMake(88, 257, 238, 48)];
        SenderDisplay = [[UIImageView alloc] initWithFrame:CGRectMake(69, 20, 193, 55)];
        TotalAmount = [[UILabel alloc] initWithFrame:CGRectMake(69, 20, 190, 45)];
        Pause = [[UIButton alloc] initWithFrame:CGRectMake(16, 20, 45, 55)];
        
        TheCurrentWord.font  = [[TheCurrentWord font] fontWithSize:25];
        TotalAmount.font = [[TotalAmount font] fontWithSize:25];
        
        pOne = [[UIImageView alloc] initWithFrame:CGRectMake(30, 376, 85, 85)];
        pTwo = [[UIImageView alloc] initWithFrame:CGRectMake(120, 376, 85, 85)];
        pThree = [[UIImageView alloc] initWithFrame:CGRectMake(210, 376, 85, 85)];
        pFour = [[UIImageView alloc] initWithFrame:CGRectMake(300, 376, 85, 85)];
        pFive = [[UIImageView alloc] initWithFrame:CGRectMake(30, 466, 85, 85)];
        pSix = [[UIImageView alloc] initWithFrame:CGRectMake(120, 466, 85, 85)];
        pSeven = [[UIImageView alloc] initWithFrame:CGRectMake(210, 466, 85, 85)];
        pEight = [[UIImageView alloc] initWithFrame:CGRectMake(300, 466, 85, 85)];
        pNine = [[UIImageView alloc] initWithFrame:CGRectMake(30, 556, 85, 85)];
        pTen = [[UIImageView alloc] initWithFrame:CGRectMake(120, 556, 85, 85)];
        pEleven = [[UIImageView alloc] initWithFrame:CGRectMake(210, 556, 85, 85)];
        pTwelve = [[UIImageView alloc] initWithFrame:CGRectMake(300, 556, 85, 85)];
        pThirteen = [[UIImageView alloc] initWithFrame:CGRectMake(30, 646, 85, 85)];
        pFourteen = [[UIImageView alloc] initWithFrame:CGRectMake(120, 646, 85, 85)];
        pFithteen = [[UIImageView alloc] initWithFrame:CGRectMake(210, 646, 85, 85)];
        pSixteen = [[UIImageView alloc] initWithFrame:CGRectMake(300, 646, 85, 85)];
    }
    
    [self.view addSubview:BackGroundOne];
    
    [Play setImage:[UIImage imageNamed:@"Continue.png"] forState:UIControlStateNormal];
    [Home setImage:[UIImage imageNamed:@"GiveUp.png"] forState:UIControlStateNormal];
    [Play addTarget:self action:@selector(Play:) forControlEvents:UIControlEventTouchUpInside];
    [Home addTarget:self action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
    Play.showsTouchWhenHighlighted = YES;
    Home.showsTouchWhenHighlighted = YES;
    Play.adjustsImageWhenHighlighted = NO;
    Home.adjustsImageWhenHighlighted = NO;
    CurrentWords.text = @"CURRENT WORDS";
    CurrentWords.textColor = [UIColor whiteColor];
    CurrentWords.textAlignment = NSTextAlignmentCenter;
    
    [self.view insertSubview:PauseDisplay aboveSubview:BackGroundOne];
    [self.view insertSubview:Home aboveSubview:PauseDisplay];
    [self.view insertSubview:Play aboveSubview:PauseDisplay];
    [self.view insertSubview:CurrentWords aboveSubview:PauseDisplay];
    
    BarUnderWord.backgroundColor = [UIColor blackColor];
    TheCurrentWord.textAlignment = NSTextAlignmentCenter;
    TheCurrentWord.textColor = [UIColor whiteColor];
    Check.adjustsImageWhenHighlighted = NO;
    tHome.adjustsImageWhenHighlighted = NO;
    tHome.showsTouchWhenHighlighted = YES;
    [tHome setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [Check setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [Check addTarget:self action:@selector(IsItAWaord) forControlEvents:UIControlEventTouchUpInside];
    [Pause setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [tHome addTarget:self action:@selector(tHome:) forControlEvents:UIControlEventTouchUpInside];
    [Pause addTarget:self action:@selector(Pause:) forControlEvents:UIControlEventTouchUpInside];
    Pause.adjustsImageWhenHighlighted = NO;
    SenderDisplay.image = [UIImage imageNamed:@"Sender.png"];
    TotalAmount.textColor = [UIColor whiteColor];
    TotalAmount.textAlignment = NSTextAlignmentCenter;
    BackGroundOne.image = [UIImage imageNamed:@"BackGroundOne.png"];
    BackGroundTwo.image = [UIImage imageNamed:@"BackGroundTwo.png"];
    BackGroundThree.image = [UIImage imageNamed:@"BackGroundThree.png"];
    BackGroundFour.image = [UIImage imageNamed:@"BackGroundFour.png"];
    
    [self.view insertSubview:BackGroundTwo belowSubview:BackGroundOne];
    [self.view insertSubview:BackGroundThree belowSubview:BackGroundOne];
    [self.view insertSubview:SenderDisplay aboveSubview:BackGroundOne];
    [self.view insertSubview:TotalAmount aboveSubview:SenderDisplay];
    [self.view insertSubview:Pause aboveSubview:BackGroundOne];
    [self.view insertSubview:Check aboveSubview:BackGroundOne];
    [self.view insertSubview:BarUnderWord aboveSubview:BackGroundOne];
    [self.view insertSubview:TheCurrentWord aboveSubview:BackGroundOne];
    [self.view insertSubview:pOne aboveSubview:BackGroundOne];
    [self.view insertSubview:pTwo aboveSubview:BackGroundOne];
    [self.view insertSubview:pThree aboveSubview:BackGroundOne];
    [self.view insertSubview:pFour aboveSubview:BackGroundOne];
    [self.view insertSubview:pFive aboveSubview:BackGroundOne];
    [self.view insertSubview:pSix aboveSubview:BackGroundOne];
    [self.view insertSubview:pSeven aboveSubview:BackGroundOne];
    [self.view insertSubview:pEight aboveSubview:BackGroundOne];
    [self.view insertSubview:pNine aboveSubview:BackGroundOne];
    [self.view insertSubview:tHome aboveSubview:BackGroundOne];
    
    [self.view insertSubview:pOne aboveSubview:BackGroundOne];
    [self.view insertSubview:pTwo aboveSubview:BackGroundOne];
    [self.view insertSubview:pThree aboveSubview:BackGroundOne];
    [self.view insertSubview:pFour aboveSubview:BackGroundOne];
    [self.view insertSubview:pFive aboveSubview:BackGroundOne];
    [self.view insertSubview:pSix aboveSubview:BackGroundOne];
    [self.view insertSubview:pSeven aboveSubview:BackGroundOne];
    [self.view insertSubview:pEight aboveSubview:BackGroundOne];
    [self.view insertSubview:pNine aboveSubview:BackGroundOne];
    [self.view insertSubview:pTen aboveSubview:BackGroundOne];
    [self.view insertSubview:pEleven aboveSubview:BackGroundOne];
    [self.view insertSubview:pTwelve aboveSubview:BackGroundOne];
    [self.view insertSubview:pThirteen aboveSubview:BackGroundOne];
    [self.view insertSubview:pFourteen aboveSubview:BackGroundOne];
    [self.view insertSubview:pFithteen aboveSubview:BackGroundOne];
    [self.view insertSubview:pSixteen aboveSubview:BackGroundOne];
    
    [sOne setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [sTwo setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [sThree setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [sFour setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [sFive setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [sSix setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [sSeven setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [sEight setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [sNine setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [sTen setImage:[UIImage imageNamed:@"Ten.png"] forState:UIControlStateNormal];
    [sEleven setImage:[UIImage imageNamed:@"Eleven.png"] forState:UIControlStateNormal];
    [sTwelve setImage:[UIImage imageNamed:@"Twelve.png"] forState:UIControlStateNormal];
    [sThirteen setImage:[UIImage imageNamed:@"Thirteen.png"] forState:UIControlStateNormal];
    [sFourteen setImage:[UIImage imageNamed:@"Fourteen.png"] forState:UIControlStateNormal];
    [sFithteen setImage:[UIImage imageNamed:@"Fithteen.png"] forState:UIControlStateNormal];
    
    [sOne addTarget:self action:@selector(One:) forControlEvents:UIControlEventTouchUpInside];
    [sTwo addTarget:self action:@selector(Two:) forControlEvents:UIControlEventTouchUpInside];
    [sThree addTarget:self action:@selector(Three:) forControlEvents:UIControlEventTouchUpInside];
    [sFour addTarget:self action:@selector(Four:) forControlEvents:UIControlEventTouchUpInside];
    [sFive addTarget:self action:@selector(Five:) forControlEvents:UIControlEventTouchUpInside];
    [sSix addTarget:self action:@selector(Six:) forControlEvents:UIControlEventTouchUpInside];
    [sSeven addTarget:self action:@selector(Seven:) forControlEvents:UIControlEventTouchUpInside];
    [sEight addTarget:self action:@selector(Eight:) forControlEvents:UIControlEventTouchUpInside];
    [sNine addTarget:self action:@selector(Nine:) forControlEvents:UIControlEventTouchUpInside];
    [sTen addTarget:self action:@selector(Ten:) forControlEvents:UIControlEventTouchUpInside];
    [sEleven addTarget:self action:@selector(Eleven:) forControlEvents:UIControlEventTouchUpInside];
    [sTwelve addTarget:self action:@selector(Twelve:) forControlEvents:UIControlEventTouchUpInside];
    [sThirteen addTarget:self action:@selector(Thirteen:) forControlEvents:UIControlEventTouchUpInside];
    [sFourteen addTarget:self action:@selector(Fourteen:) forControlEvents:UIControlEventTouchUpInside];
    [sFithteen addTarget:self action:@selector(Fithteen:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view insertSubview:sOne aboveSubview:BackGroundOne];
    [self.view insertSubview:sTwo aboveSubview:BackGroundOne];
    [self.view insertSubview:sThree aboveSubview:BackGroundOne];
    [self.view insertSubview:sFour aboveSubview:BackGroundOne];
    [self.view insertSubview:sFive aboveSubview:BackGroundOne];
    [self.view insertSubview:sSix aboveSubview:BackGroundOne];
    [self.view insertSubview:sSeven aboveSubview:BackGroundOne];
    [self.view insertSubview:sEight aboveSubview:BackGroundOne];
    [self.view insertSubview:sNine aboveSubview:BackGroundOne];
    [self.view insertSubview:sTen aboveSubview:BackGroundOne];
    [self.view insertSubview:sEleven aboveSubview:BackGroundOne];
    [self.view insertSubview:sTwelve aboveSubview:BackGroundOne];
    [self.view insertSubview:sThirteen aboveSubview:BackGroundOne];
    [self.view insertSubview:sFourteen aboveSubview:BackGroundOne];
    [self.view insertSubview:sFithteen aboveSubview:BackGroundOne];
    [self.view addSubview:BackGroundFour];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)SettingUpFuncionForButtons
{
    [Check addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpOutside];
    [Check addTarget:self action:@selector(sCheckClicked) forControlEvents:UIControlEventTouchDown];
    [Check addTarget:self action:@selector(CheckClciked)  forControlEvents:UIControlEventTouchUpInside];
    
    [Pause addTarget:self action:@selector(PauseClicked)  forControlEvents:UIControlEventTouchUpOutside];
    [Pause addTarget:self action:@selector(sPauseClicked) forControlEvents:UIControlEventTouchDown];
    
    [sOne addTarget:self action:@selector(sOneClicked) forControlEvents:UIControlEventTouchDown];
    [sOne addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpInside];
    [sOne addTarget:self action:@selector(sOneClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwo addTarget:self action:@selector(sTwoClicked) forControlEvents:UIControlEventTouchDown];
    [sTwo addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwo addTarget:self action:@selector(sTwoClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThree addTarget:self action:@selector(sThreeClicked) forControlEvents:UIControlEventTouchDown];
    [sThree addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThree addTarget:self action:@selector(sThreeClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFour addTarget:self action:@selector(sFourClicked) forControlEvents:UIControlEventTouchDown];
    [sFour addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFour addTarget:self action:@selector(sFourClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFive addTarget:self action:@selector(sFiveClicked) forControlEvents:UIControlEventTouchDown];
    [sFive addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFive addTarget:self action:@selector(sFiveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSix addTarget:self action:@selector(sSixClicked) forControlEvents:UIControlEventTouchDown];
    [sSix addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSix addTarget:self action:@selector(sSixClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sSeven addTarget:self action:@selector(sSevenClicked) forControlEvents:UIControlEventTouchDown];
    [sSeven addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sSeven addTarget:self action:@selector(sSevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sEight addTarget:self action:@selector(sEightClicked) forControlEvents:UIControlEventTouchDown];
    [sEight addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpInside];
    [sEight addTarget:self action:@selector(sEightClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sNine addTarget:self action:@selector(sNineClicked) forControlEvents:UIControlEventTouchDown];
    [sNine addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpInside];
    [sNine addTarget:self action:@selector(sNineClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTen addTarget:self action:@selector(sTenClicked) forControlEvents:UIControlEventTouchDown];
    [sTen addTarget:self action:@selector(sTenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTen addTarget:self action:@selector(sTenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sEleven addTarget:self action:@selector(sElevenClicked) forControlEvents:UIControlEventTouchDown];
    [sEleven addTarget:self action:@selector(sElevenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sEleven addTarget:self action:@selector(sElevenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sTwelve addTarget:self action:@selector(sTwelveClicked) forControlEvents:UIControlEventTouchDown];
    [sTwelve addTarget:self action:@selector(sTwelveClick)   forControlEvents:UIControlEventTouchUpInside];
    [sTwelve addTarget:self action:@selector(sTwelveClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sThirteen addTarget:self action:@selector(sThirteenClicked) forControlEvents:UIControlEventTouchDown];
    [sThirteen addTarget:self action:@selector(sThirteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sThirteen addTarget:self action:@selector(sThirteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFourteen addTarget:self action:@selector(sFourteenClicked) forControlEvents:UIControlEventTouchDown];
    [sFourteen addTarget:self action:@selector(sFourteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFourteen addTarget:self action:@selector(sFourteenClick)   forControlEvents:UIControlEventTouchUpOutside];
    
    [sFithteen addTarget:self action:@selector(sFithteenClicked) forControlEvents:UIControlEventTouchDown];
    [sFithteen addTarget:self action:@selector(sFithteenClick)   forControlEvents:UIControlEventTouchUpInside];
    [sFithteen addTarget:self action:@selector(sFithteenClick)   forControlEvents:UIControlEventTouchUpOutside];
}

-(void)sOneClicked
{
    [sOne setImage:[UIImage imageNamed:@"OnePlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sOneClick
{
    [sOne setImage:[UIImage imageNamed:@"One.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sTwoClicked
{
    [sTwo setImage:[UIImage imageNamed:@"TwoPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sTwoClick
{
    [sTwo setImage:[UIImage imageNamed:@"Two.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sThreeClicked
{
    [sThree setImage:[UIImage imageNamed:@"ThreePlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sThreeClick
{
    [sThree setImage:[UIImage imageNamed:@"Three.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sFourClicked
{
    [sFour setImage:[UIImage imageNamed:@"FourPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sFourClick
{
    [sFour setImage:[UIImage imageNamed:@"Four.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sFiveClicked
{
    [sFive setImage:[UIImage imageNamed:@"FivePlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sFiveClick
{
    [sFive setImage:[UIImage imageNamed:@"Five.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sSixClicked
{
    [sSix setImage:[UIImage imageNamed:@"SixPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sSixClick
{
    [sSix setImage:[UIImage imageNamed:@"Six.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sSevenClicked
{
    [sSeven setImage:[UIImage imageNamed:@"SevenPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sSevenClick
{
    [sSeven setImage:[UIImage imageNamed:@"Seven.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sEightClicked
{
    [sEight setImage:[UIImage imageNamed:@"EightPlain.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sEightClick
{
    [sEight setImage:[UIImage imageNamed:@"Eight.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sNineClicked
{
    [sNine setImage:[UIImage imageNamed:@"NinePlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sNineClick
{
    [sNine setImage:[UIImage imageNamed:@"Nine.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sTenClicked
{
    [sTen setImage:[UIImage imageNamed:@"TenPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sTenClick
{
    [sTen setImage:[UIImage imageNamed:@"Ten.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sElevenClicked
{
    [sEleven setImage:[UIImage imageNamed:@"ElevenPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sElevenClick
{
    [sEleven setImage:[UIImage imageNamed:@"Eleven.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sTwelveClicked
{
    [sTwelve setImage:[UIImage imageNamed:@"TwelvePlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sTwelveClick
{
    [sTwelve setImage:[UIImage imageNamed:@"Twelve.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sThirteenClicked
{
    [sThirteen setImage:[UIImage imageNamed:@"ThirteenPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sThirteenClick
{
    [sThirteen setImage:[UIImage imageNamed:@"Thirteen.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sFourteenClicked
{
    [sFourteen setImage:[UIImage imageNamed:@"FourteenPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sFourteenClick
{
    [sFourteen setImage:[UIImage imageNamed:@"Fourteen.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sFithteenClicked
{
    [sFithteen setImage:[UIImage imageNamed:@"FithteenPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)sFithteenClick
{
    [sFithteen setImage:[UIImage imageNamed:@"Fithteen.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)PauseClicked
{
    [Pause setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sPauseClicked
{
    [Pause setImage:[UIImage imageNamed:@"PausePlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(void)CheckClciked
{
    [Check setImage:[UIImage imageNamed:@"CheckWordPop.png"] forState:UIControlStateNormal];
    [SoundTwo play];
}

-(void)sCheckClicked
{
    [Check setImage:[UIImage imageNamed:@"CheckWordPlain.png"] forState:UIControlStateNormal];
    [SoundOne play];
}

-(IBAction)One:(id)sender
{
    WordFour = 1;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour1"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Two:(id)sender
{
    WordFour = 2;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour2"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Three:(id)sender
{
    WordFour = 3;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour3"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Four:(id)sender
{
    WordFour = 4;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour4"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Five:(id)sender
{
    WordFour = 5;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour5"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Six:(id)sender
{
    WordFour = 6;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour6"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Seven:(id)sender
{
    WordFour = 7;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour7"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eight:(id)sender
{
    WordFour = 8;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour8"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Nine:(id)sender
{
    WordFour = 9;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour9"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Ten:(id)sender
{
    WordFour = 10;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour10"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Eleven:(id)sender
{
    WordFour = 11;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour11"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Twelve:(id)sender
{
    WordFour = 12;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour12"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Thirteen:(id)sender
{
    WordFour = 13;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour13"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Fourteen:(id)sender
{
    WordFour = 14;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour14"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(IBAction)Fithteen:(id)sender
{
    WordFour = 15;
    SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour15"];
    if (SavedWords.length > 0) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"4Choice" ofType:@"plist"];
        int i = 0;
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
        for (NSString *str in array2) {
            @autoreleasepool {
                i++;
                if ([SavedWords rangeOfString:str].length == 4) {
                    Score++;
                    WordIsAlreadyDone[i] = YES;
                }
            }
        }
    }
    [self preViewDidLoad];
}

-(void)preViewDidLoad
{
    [self GameSettingUpForGrid];
    mover = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjects) userInfo:nil repeats:YES];
    
    CGPoint midPoint;
    midPoint.x = ((pSeven.center.x + pSix.center.x) / 2);
    midPoint.y = ((pSix.center.y + pTen.center.y) / 2);
    
    pSix.center = CGPointMake(midPoint.x, midPoint.y);
    pSeven.center = CGPointMake(midPoint.x, midPoint.y);
    pTen.center = CGPointMake(midPoint.x, midPoint.y);
    pEleven.center = CGPointMake(midPoint.x, midPoint.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1];
    [pSix setAlpha:1];
    [pSeven setAlpha:1];
    [pTen setAlpha:1];
    [pEleven setAlpha:1];
    [Check setAlpha:1];
    [TheCurrentWord setAlpha:1];
    [Pause setAlpha:1];
    [BarUnderWord setAlpha:1];
    [TotalAmount setAlpha:1];
    [SenderDisplay setAlpha:1];
    [tHome setAlpha:0];
    
    [sOne setAlpha:0];
    [sTwo setAlpha:0];
    [sThree setAlpha:0];
    [sFour setAlpha:0];
    [sFive setAlpha:0];
    [sSix setAlpha:0];
    [sSeven setAlpha:0];
    [sEight setAlpha:0];
    [sNine setAlpha:0];
    [sTen setAlpha:0];
    [sEleven setAlpha:0];
    [sTwelve setAlpha:0];
    [sThirteen setAlpha:0];
    [sFourteen setAlpha:0];
    [sFithteen setAlpha:0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    pSix.center = CGPointMake(ikSix, iktSix);
    pSeven.center = CGPointMake(ikSeven, iktSeven);
    pTen.center = CGPointMake(ikTen, iktTen);
    pEleven.center = CGPointMake(ikEleven, iktEleven);
    [UIView commitAnimations];
    
    pOne.center = CGPointMake(pSix.center.x, pSix.center.y);
    pTwo.center = CGPointMake(pSix.center.x, pSix.center.y);
    pFive.center = CGPointMake(pSix.center.x, pSix.center.y);
    
    pThree.center = CGPointMake(pSeven.center.x, pSeven.center.y);
    pFour.center = CGPointMake(pSeven.center.x, pSeven.center.y);
    pEight.center = CGPointMake(pSeven.center.x, pSeven.center.y);
    
    pNine.center = CGPointMake(pTen.center.x, pTen.center.y);
    pThirteen.center = CGPointMake(pTen.center.x, pTen.center.y);
    pFourteen.center = CGPointMake(pTen.center.x, pTen.center.y);
    
    pTwelve.center = CGPointMake(pEleven.center.x, pEleven.center.y);
    pFithteen.center = CGPointMake(pEleven.center.x, pEleven.center.y);
    pSixteen.center = CGPointMake(pEleven.center.x, pEleven.center.y);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationDuration:1.25];
    
    pOne.alpha = 1;
    pTwo.alpha = 1;
    pThree.alpha = 1;
    pFour.alpha = 1;
    
    pFive.alpha = 1;
    pEight.alpha = 1;
    
    pNine.alpha = 1;
    pTwelve.alpha = 1;
    
    pThirteen.alpha = 1;
    pFourteen.alpha = 1;
    pFithteen.alpha  = 1;
    pSixteen.alpha = 1;
    
    pOne.center = CGPointMake(ikOne, iktOne);
    pTwo.center = CGPointMake(ikTwo, iktTwo);
    pFive.center = CGPointMake(ikFive, iktFive);
    
    pThree.center = CGPointMake(ikThree, iktThree);
    pFour.center = CGPointMake(ikFour, iktFour);
    pEight.center = CGPointMake(ikEight, iktEight);
    
    pNine.center = CGPointMake(ikNine, iktNine);
    pThirteen.center = CGPointMake(ikThirteen, iktThirteen);
    pFourteen.center = CGPointMake(ikFourteen, iktFourteen);
    
    pTwelve.center = CGPointMake(ikTwelve, iktTwelve);
    pFithteen.center = CGPointMake(ikFithteen, iktFithteen);
    pSixteen.center = CGPointMake(ikSixteen, iktSixteen);
    
    [self Swipes];
    [UIView commitAnimations];
}

-(void)MovingTheObjects
{
    int a;
    a = 1;
    sOne.center = CGPointMake(sOne.center.x, sOne.center.y - a);
    sTwo.center = CGPointMake(sTwo.center.x , sTwo.center.y - a);
    sThree.center = CGPointMake(sThree.center.x , sThree.center.y - a);
    sFour.center = CGPointMake(sFour. center.x , sFour.center.y - a);
    sFive.center = CGPointMake(sFive.center.x , sFive.center.y - a);
    sSix.center = CGPointMake(sSix.center.x , sSix.center.y - a);
    sSeven.center = CGPointMake(sSeven.center.x , sSeven.center.y - a);
    sEight.center = CGPointMake(sEight.center.x , sEight.center.y - a);
    sNine.center = CGPointMake(sNine.center.x , sNine.center.y - a);
    sTen.center = CGPointMake(sTen.center.x , sTen.center.y - a);
    sEleven.center = CGPointMake(sEleven.center.x , sEleven.center.y - a);
    sTwelve.center = CGPointMake(sTwelve.center.x , sTwelve.center.y - a);
    sThirteen.center = CGPointMake(sThirteen.center.x , sThirteen.center.y - a);
    sFourteen.center = CGPointMake(sFourteen.center.x , sFourteen.center.y - a);
    sFithteen.center = CGPointMake(sFithteen.center.x , sFithteen.center.y - a);
    if (-155 >= sFithteen.center.y) {
        [mover invalidate];
        mover = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
    }

}

-(void)GameSettingUpForGrid
{
    ikOne = pOne.center.x;
    iktOne = pOne.center.y;
    ikTwo = pTwo.center.x;
    iktTwo = pTwo.center.y;
    ikThree = pThree.center.x;
    iktThree = pThree.center.y;
    ikFour = pFour.center.x;
    iktFour = pFour.center.y;
    ikFive = pFive.center.x;
    iktFive = pFive.center.y;
    ikSix = pSix.center.x;
    iktSix = pSix.center.y;
    ikSeven = pSeven.center.x;
    iktSeven = pSeven.center.y;
    ikEight = pEight.center.x;
    iktEight = pEight.center.y;
    ikNine = pNine.center.x;
    iktNine = pNine.center.y;
    ikTen = pTen.center.x;
    iktTen = pTen.center.y;
    ikEleven = pEleven.center.x;
    iktEleven = pEleven.center.y;
    ikTwelve = pTwelve.center.x;
    iktTwelve = pTwelve.center.y;
    ikThirteen = pThirteen.center.x;
    iktThirteen = pThirteen.center.y;
    ikFourteen = pFourteen.center.x;
    iktFourteen = pFourteen.center.y;
    ikFithteen = pFithteen.center.x;
    iktFithteen = pFithteen.center.y;
    ikSixteen = pSixteen.center.x;
    iktSixteen = pSixteen.center.y;
    kSelection = sNine.center.y;
    
    [self GettingTheRightGrid];    
}

-(void)GettingTheRightGrid
{
    switch (WordFour) {
        case 1:
            cOne = 'o';
            cTwo = 'c';
            cThree = 'e';
            cFour = 'h';
            cFive = 'l';
            cSix = 'd';
            cSeven = 'l';
            cEight = 'i';
            cNine = 'b';
            cTen = 'a';
            cEleven = 'k';
            cTwelve = 't';
            cThirteen = 'w';
            cFourteen = 'r';
            cFithteen = 'f';
            cSixteen = 'u';
            
            pOne.image = [UIImage imageNamed:@"O.png"];
            pTwo.image = [UIImage imageNamed:@"C.png"];
            pThree.image = [UIImage imageNamed:@"E.png"];
            pFour.image = [UIImage imageNamed:@"H.png"];
            pFive.image = [UIImage imageNamed:@"L.png"];
            pSix.image = [UIImage imageNamed:@"D.png"];
            pSeven.image = [UIImage imageNamed:@"L.png"];
            pEight.image = [UIImage imageNamed:@"I.png"];
            pNine.image = [UIImage imageNamed:@"B.png"];
            pTen.image = [UIImage imageNamed:@"A.png"];
            pEleven.image = [UIImage imageNamed:@"K.png"];
            pTwelve.image = [UIImage imageNamed:@"T.png"];
            pThirteen.image = [UIImage imageNamed:@"W.png"];
            pFourteen.image = [UIImage imageNamed:@"R.png"];
            pFithteen.image = [UIImage imageNamed:@"F.png"];
            pSixteen.image = [UIImage imageNamed:@"U.png"];
            
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 720", Score];
            TheAmount = 720;
            break;
        case 2:
            cOne = 'p';
            cTwo = 'a';
            cThree = 'n';
            cFour = 's';
            cFive = 't';
            cSix = 'i';
            cSeven = 'd';
            cEight = 'e';
            cNine = 'r';
            cTen = 'm';
            cEleven = 'c';
            cTwelve = 'h';
            cThirteen = 'b';
            cFourteen = 'o';
            cFithteen = 'o';
            cSixteen = 'z';
            
            pOne.image = [UIImage imageNamed:@"P.png"];
            pTwo.image = [UIImage imageNamed:@"A.png"];
            pThree.image = [UIImage imageNamed:@"N.png"];
            pFour.image = [UIImage imageNamed:@"S.png"];
            pFive.image = [UIImage imageNamed:@"T.png"];
            pSix.image = [UIImage imageNamed:@"I.png"];
            pSeven.image = [UIImage imageNamed:@"D.png"];
            pEight.image = [UIImage imageNamed:@"E.png"];
            pNine.image = [UIImage imageNamed:@"R.png"];
            pTen.image = [UIImage imageNamed:@"M.png"];
            pEleven.image = [UIImage imageNamed:@"C.png"];
            pTwelve.image = [UIImage imageNamed:@"H.png"];
            pThirteen.image = [UIImage imageNamed:@"B.png"];
            pFourteen.image = [UIImage imageNamed:@"O.png"];
            pFithteen.image = [UIImage imageNamed:@"O.png"];
            pSixteen.image = [UIImage imageNamed:@"Z.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 840", Score];
            TheAmount = 840;
            break;
        case 3:
            cOne = 'g';
            cTwo = 'a';
            cThree = 'l';
            cFour = 'f';
            cFive = 'b';
            cSix = 'r';
            cSeven = 't';
            cEight = 'e';
            cNine = 'e';
            cTen = 's';
            cEleven = 'h';
            cTwelve = 'y';
            cThirteen = 'o';
            cFourteen = 'k';
            cFithteen = 'i';
            cSixteen = 'u';
            
            pOne.image = [UIImage imageNamed:@"G.png"];
            pTwo.image = [UIImage imageNamed:@"A.png"];
            pThree.image = [UIImage imageNamed:@"L.png"];
            pFour.image = [UIImage imageNamed:@"F.png"];
            pFive.image = [UIImage imageNamed:@"B.png"];
            pSix.image = [UIImage imageNamed:@"R.png"];
            pSeven.image = [UIImage imageNamed:@"T.png"];
            pEight.image = [UIImage imageNamed:@"E.png"];
            pNine.image = [UIImage imageNamed:@"E.png"];
            pTen.image = [UIImage imageNamed:@"S.png"];
            pEleven.image = [UIImage imageNamed:@"H.png"];
            pTwelve.image = [UIImage imageNamed:@"Y.png"];
            pThirteen.image = [UIImage imageNamed:@"O.png"];
            pFourteen.image = [UIImage imageNamed:@"K.png"];
            pFithteen.image = [UIImage imageNamed:@"I.png"];
            pSixteen.image = [UIImage imageNamed:@"U.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 861", Score];
            TheAmount = 861;
            break;
        case 4:
            cOne = 'k';
            cTwo = 'c';
            cThree = 'a';
            cFour = 's';
            cFive = 'p';
            cSix = 'r';
            cSeven = 'b';
            cEight = 'l';
            cNine = 'o';
            cTen = 'e';
            cEleven = 'i';
            cTwelve = 'h';
            cThirteen = 'o';
            cFourteen = 't';
            cFithteen = 'f';
            cSixteen = 'g';
            
            pOne.image = [UIImage imageNamed:@"K.png"];
            pTwo.image = [UIImage imageNamed:@"C.png"];
            pThree.image = [UIImage imageNamed:@"A.png"];
            pFour.image = [UIImage imageNamed:@"S.png"];
            pFive.image = [UIImage imageNamed:@"P.png"];
            pSix.image = [UIImage imageNamed:@"R.png"];
            pSeven.image = [UIImage imageNamed:@"B.png"];
            pEight.image = [UIImage imageNamed:@"L.png"];
            pNine.image = [UIImage imageNamed:@"O.png"];
            pTen.image = [UIImage imageNamed:@"E.png"];
            pEleven.image = [UIImage imageNamed:@"I.png"];
            pTwelve.image = [UIImage imageNamed:@"H.png"];
            pThirteen.image = [UIImage imageNamed:@"O.png"];
            pFourteen.image = [UIImage imageNamed:@"T.png"];
            pFithteen.image = [UIImage imageNamed:@"F.png"];
            pSixteen.image = [UIImage imageNamed:@"G.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 924", Score];
            TheAmount = 924;
            break;
        case 5:
            cOne = 'e';
            cTwo = 'b';
            cThree = 'u';
            cFour = 'c';
            cFive = 't';
            cSix = 's';
            cSeven = 'd';
            cEight = 'g';
            cNine = 's';
            cTen = 'o';
            cEleven = 'l';
            cTwelve = 'y';
            cThirteen = 'n';
            cFourteen = 'a';
            cFithteen = 'r';
            cSixteen = 'h';
            
            pOne.image = [UIImage imageNamed:@"E.png"];
            pTwo.image = [UIImage imageNamed:@"B.png"];
            pThree.image = [UIImage imageNamed:@"U.png"];
            pFour.image = [UIImage imageNamed:@"C.png"];
            pFive.image = [UIImage imageNamed:@"T.png"];
            pSix.image = [UIImage imageNamed:@"S.png"];
            pSeven.image = [UIImage imageNamed:@"D.png"];
            pEight.image = [UIImage imageNamed:@"G.png"];
            pNine.image = [UIImage imageNamed:@"S.png"];
            pTen.image = [UIImage imageNamed:@"O.png"];
            pEleven.image = [UIImage imageNamed:@"L.png"];
            pTwelve.image = [UIImage imageNamed:@"Y.png"];
            pThirteen.image = [UIImage imageNamed:@"N.png"];
            pFourteen.image = [UIImage imageNamed:@"A.png"];
            pFithteen.image = [UIImage imageNamed:@"R.png"];
            pSixteen.image = [UIImage imageNamed:@"H.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 1012", Score];
            TheAmount = 1012;
            break;
        case 6:
            cOne = 'y';
            cTwo = 'r';
            cThree = 'e';
            cFour = 'v';
            cFive = 'l';
            cSix = 'o';
            cSeven = 't';
            cEight = 'j';
            cNine = 'i';
            cTen = 'a';
            cEleven = 'n';
            cTwelve = 's';
            cThirteen = 'h';
            cFourteen = 'z';
            cFithteen = 'w';
            cSixteen = 'b';
            
            pOne.image = [UIImage imageNamed:@"Y.png"];
            pTwo.image = [UIImage imageNamed:@"R.png"];
            pThree.image = [UIImage imageNamed:@"E.png"];
            pFour.image = [UIImage imageNamed:@"V.png"];
            pFive.image = [UIImage imageNamed:@"L.png"];
            pSix.image = [UIImage imageNamed:@"O.png"];
            pSeven.image = [UIImage imageNamed:@"T.png"];
            pEight.image = [UIImage imageNamed:@"J.png"];
            pNine.image = [UIImage imageNamed:@"I.png"];
            pTen.image = [UIImage imageNamed:@"A.png"];
            pEleven.image = [UIImage imageNamed:@"N.png"];
            pTwelve.image = [UIImage imageNamed:@"S.png"];
            pThirteen.image = [UIImage imageNamed:@"H.png"];
            pFourteen.image = [UIImage imageNamed:@"Z.png"];
            pFithteen.image = [UIImage imageNamed:@"W.png"];
            pSixteen.image = [UIImage imageNamed:@"B.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 777", Score];
            TheAmount = 777;
            break;
        case 7:
            cOne = 'u';
            cTwo = 'l';
            cThree = 'b';
            cFour = 'b';
            cFive = 'a';
            cSix = 'y';
            cSeven = 'd';
            cEight = 'r';
            cNine = 'e';
            cTen = 'w';
            cEleven = 's';
            cTwelve = 'm';
            cThirteen = 'e';
            cFourteen = 'i';
            cFithteen = 'o';
            cSixteen = 'x';
            
            pOne.image = [UIImage imageNamed:@"U.png"];
            pTwo.image = [UIImage imageNamed:@"L.png"];
            pThree.image = [UIImage imageNamed:@"B.png"];
            pFour.image = [UIImage imageNamed:@"B.png"];
            pFive.image = [UIImage imageNamed:@"A.png"];
            pSix.image = [UIImage imageNamed:@"Y.png"];
            pSeven.image = [UIImage imageNamed:@"D.png"];
            pEight.image = [UIImage imageNamed:@"R.png"];
            pNine.image = [UIImage imageNamed:@"E.png"];
            pTen.image = [UIImage imageNamed:@"W.png"];
            pEleven.image = [UIImage imageNamed:@"S.png"];
            pTwelve.image = [UIImage imageNamed:@"M.png"];
            pThirteen.image = [UIImage imageNamed:@"E.png"];
            pFourteen.image = [UIImage imageNamed:@"I.png"];
            pFithteen.image = [UIImage imageNamed:@"O.png"];
            pSixteen.image = [UIImage imageNamed:@"X.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 630", Score];
            TheAmount = 630;
            break;
        case 8:
            cOne = 'u';
            cTwo = 'r';
            cThree = 'p';
            cFour = 'r';
            cFive = 'm';
            cSix = 'c';
            cSeven = 'a';
            cEight = 'b';
            cNine = 'e';
            cTen = 'y';
            cEleven = 's';
            cTwelve = 'o';
            cThirteen = 'd';
            cFourteen = 'l';
            cFithteen = 'o';
            cSixteen = 't';
            
            pOne.image = [UIImage imageNamed:@"U.png"];
            pTwo.image = [UIImage imageNamed:@"R.png"];
            pThree.image = [UIImage imageNamed:@"P.png"];
            pFour.image = [UIImage imageNamed:@"R.png"];
            pFive.image = [UIImage imageNamed:@"M.png"];
            pSix.image = [UIImage imageNamed:@"C.png"];
            pSeven.image = [UIImage imageNamed:@"A.png"];
            pEight.image = [UIImage imageNamed:@"B.png"];
            pNine.image = [UIImage imageNamed:@"E.png"];
            pTen.image = [UIImage imageNamed:@"Y.png"];
            pEleven.image = [UIImage imageNamed:@"S.png"];
            pTwelve.image = [UIImage imageNamed:@"O.png"];
            pThirteen.image = [UIImage imageNamed:@"D.png"];
            pFourteen.image = [UIImage imageNamed:@"L.png"];
            pFithteen.image = [UIImage imageNamed:@"O.png"];
            pSixteen.image = [UIImage imageNamed:@"T.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 861", Score];
            TheAmount = 861;
            break;
        case 9:
            cOne = 'e';
            cTwo = 'z';
            cThree = 'r';
            cFour = 'o';
            cFive = 'h';
            cSix = 'i';
            cSeven = 'n';
            cEight = 'c';
            cNine = 'k';
            cTen = 's';
            cEleven = 'm';
            cTwelve = 'a';
            cThirteen = 'o';
            cFourteen = 'd';
            cFithteen = 'g';
            cSixteen = 'l';
            
            pOne.image = [UIImage imageNamed:@"E.png"];
            pTwo.image = [UIImage imageNamed:@"Z.png"];
            pThree.image = [UIImage imageNamed:@"R.png"];
            pFour.image = [UIImage imageNamed:@"O.png"];
            pFive.image = [UIImage imageNamed:@"H.png"];
            pSix.image = [UIImage imageNamed:@"I.png"];
            pSeven.image = [UIImage imageNamed:@"N.png"];
            pEight.image = [UIImage imageNamed:@"C.png"];
            pNine.image = [UIImage imageNamed:@"K.png"];
            pTen.image = [UIImage imageNamed:@"S.png"];
            pEleven.image = [UIImage imageNamed:@"M.png"];
            pTwelve.image = [UIImage imageNamed:@"A.png"];
            pThirteen.image = [UIImage imageNamed:@"O.png"];
            pFourteen.image = [UIImage imageNamed:@"D.png"];
            pFithteen.image = [UIImage imageNamed:@"G.png"];
            pSixteen.image = [UIImage imageNamed:@"L.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 819", Score];
            TheAmount = 819;
            break;
        case 10:
            cOne = 'z';
            cTwo = 'j';
            cThree = 'z';
            cFour = 'a';
            cFive = 'f';
            cSix = 'u';
            cSeven = 'b';
            cEight = 'r';
            cNine = 'q';
            cTen = 'i';
            cEleven = 'p';
            cTwelve = 'd';
            cThirteen = 's';
            cFourteen = 'g';
            cFithteen = 't';
            cSixteen = 'n';
            
            pOne.image = [UIImage imageNamed:@"Z.png"];
            pTwo.image = [UIImage imageNamed:@"J.png"];
            pThree.image = [UIImage imageNamed:@"Z.png"];
            pFour.image = [UIImage imageNamed:@"A.png"];
            pFive.image = [UIImage imageNamed:@"F.png"];
            pSix.image = [UIImage imageNamed:@"U.png"];
            pSeven.image = [UIImage imageNamed:@"B.png"];
            pEight.image = [UIImage imageNamed:@"R.png"];
            pNine.image = [UIImage imageNamed:@"Q.png"];
            pTen.image = [UIImage imageNamed:@"I.png"];
            pEleven.image = [UIImage imageNamed:@"P.png"];
            pTwelve.image = [UIImage imageNamed:@"D.png"];
            pThirteen.image = [UIImage imageNamed:@"S.png"];
            pFourteen.image = [UIImage imageNamed:@"G.png"];
            pFithteen.image = [UIImage imageNamed:@"T.png"];
            pSixteen.image = [UIImage imageNamed:@"N.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 321", Score];
            TheAmount = 321;
            break;
        case 11:
            cOne = 'm';
            cTwo = 'l';
            cThree = 'a';
            cFour = 'p';
            cFive = 'g';
            cSix = 'e';
            cSeven = 'w';
            cEight = 'n';
            cNine = 'o';
            cTen = 't';
            cEleven = 's';
            cTwelve = 'h';
            cThirteen = 'c';
            cFourteen = 'f';
            cFithteen = 'r';
            cSixteen = 'i';
            
            pOne.image = [UIImage imageNamed:@"M.png"];
            pTwo.image = [UIImage imageNamed:@"L.png"];
            pThree.image = [UIImage imageNamed:@"A.png"];
            pFour.image = [UIImage imageNamed:@"P.png"];
            pFive.image = [UIImage imageNamed:@"G.png"];
            pSix.image = [UIImage imageNamed:@"E.png"];
            pSeven.image = [UIImage imageNamed:@"W.png"];
            pEight.image = [UIImage imageNamed:@"N.png"];
            pNine.image = [UIImage imageNamed:@"O.png"];
            pTen.image = [UIImage imageNamed:@"T.png"];
            pEleven.image = [UIImage imageNamed:@"S.png"];
            pTwelve.image = [UIImage imageNamed:@"H.png"];
            pThirteen.image = [UIImage imageNamed:@"C.png"];
            pFourteen.image = [UIImage imageNamed:@"F.png"];
            pFithteen.image = [UIImage imageNamed:@"R.png"];
            pSixteen.image = [UIImage imageNamed:@"I.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 1115", Score];
            TheAmount = 1115;
            break;
        case 12:
            cOne = 'b';
            cTwo = 'b';
            cThree = 'u';
            cFour = 'l';
            cFive = 'a';
            cSix = 'y';
            cSeven = 'e';
            cEight = 'r';
            cNine = 's';
            cTen = 'n';
            cEleven = 'd';
            cTwelve = 'k';
            cThirteen = 'i';
            cFourteen = 'g';
            cFithteen = 't';
            cSixteen = 'e';
            
            pOne.image = [UIImage imageNamed:@"B.png"];
            pTwo.image = [UIImage imageNamed:@"B.png"];
            pThree.image = [UIImage imageNamed:@"U.png"];
            pFour.image = [UIImage imageNamed:@"L.png"];
            pFive.image = [UIImage imageNamed:@"A.png"];
            pSix.image = [UIImage imageNamed:@"Y.png"];
            pSeven.image = [UIImage imageNamed:@"E.png"];
            pEight.image = [UIImage imageNamed:@"R.png"];
            pNine.image = [UIImage imageNamed:@"S.png"];
            pTen.image = [UIImage imageNamed:@"N.png"];
            pEleven.image = [UIImage imageNamed:@"D.png"];
            pTwelve.image = [UIImage imageNamed:@"K.png"];
            pThirteen.image = [UIImage imageNamed:@"I.png"];
            pFourteen.image = [UIImage imageNamed:@"G.png"];
            pFithteen.image = [UIImage imageNamed:@"T.png"];
            pSixteen.image = [UIImage imageNamed:@"E.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 819", Score];
            TheAmount = 819;
            break;
        case 13:
            cOne = 'a';
            cTwo = 'u';
            cThree = 'a';
            cFour = 'q';
            cFive = 'i';
            cSix = 'd';
            cSeven = 't';
            cEight = 'p';
            cNine = 'y';
            cTen = 's';
            cEleven = 'g';
            cTwelve = 'l';
            cThirteen = 'r';
            cFourteen = 'n';
            cFithteen = 'w';
            cSixteen = 'j';
            
            pOne.image = [UIImage imageNamed:@"A.png"];
            pTwo.image = [UIImage imageNamed:@"U.png"];
            pThree.image = [UIImage imageNamed:@"A.png"];
            pFour.image = [UIImage imageNamed:@"Q.png"];
            pFive.image = [UIImage imageNamed:@"I.png"];
            pSix.image = [UIImage imageNamed:@"D.png"];
            pSeven.image = [UIImage imageNamed:@"T.png"];
            pEight.image = [UIImage imageNamed:@"P.png"];
            pNine.image = [UIImage imageNamed:@"Y.png"];
            pTen.image = [UIImage imageNamed:@"S.png"];
            pEleven.image = [UIImage imageNamed:@"G.png"];
            pTwelve.image = [UIImage imageNamed:@"L.png"];
            pThirteen.image = [UIImage imageNamed:@"R.png"];
            pFourteen.image = [UIImage imageNamed:@"N.png"];
            pFithteen.image = [UIImage imageNamed:@"W.png"];
            pSixteen.image = [UIImage imageNamed:@"J.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 609", Score];
            TheAmount = 609;
            break;
        case 14:
            cOne = 'o';
            cTwo = 'u';
            cThree = 'n';
            cFour = 'n';
            cFive = 'i';
            cSix = 'e';
            cSeven = 'o';
            cEight = 's';
            cNine = 'a';
            cTen = 'm';
            cEleven = 'm';
            cTwelve = 'r';
            cThirteen = 't';
            cFourteen = 'g';
            cFithteen = 't';
            cSixteen = 'a';
            
            pOne.image = [UIImage imageNamed:@"O.png"];
            pTwo.image = [UIImage imageNamed:@"U.png"];
            pThree.image = [UIImage imageNamed:@"N.png"];
            pFour.image = [UIImage imageNamed:@"N.png"];
            pFive.image = [UIImage imageNamed:@"I.png"];
            pSix.image = [UIImage imageNamed:@"E.png"];
            pSeven.image = [UIImage imageNamed:@"O.png"];
            pEight.image = [UIImage imageNamed:@"S.png"];
            pNine.image = [UIImage imageNamed:@"A.png"];
            pTen.image = [UIImage imageNamed:@"M.png"];
            pEleven.image = [UIImage imageNamed:@"M.png"];
            pTwelve.image = [UIImage imageNamed:@"R.png"];
            pThirteen.image = [UIImage imageNamed:@"T.png"];
            pFourteen.image = [UIImage imageNamed:@"G.png"];
            pFithteen.image = [UIImage imageNamed:@"T.png"];
            pSixteen.image = [UIImage imageNamed:@"A.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 462", Score];
            TheAmount = 462;
            break;
        case 15:
            cOne = 'w';
            cTwo = 'o';
            cThree = 'u';
            cFour = 'l';
            cFive = 'a';
            cSix = 'b';
            cSeven = 'l';
            cEight = 't';
            cNine = 'e';
            cTen = 's';
            cEleven = 'c';
            cTwelve = 'm';
            cThirteen = 'r';
            cFourteen = 'd';
            cFithteen = 'h';
            cSixteen = 'i';
            
            pOne.image = [UIImage imageNamed:@"W.png"];
            pTwo.image = [UIImage imageNamed:@"O.png"];
            pThree.image = [UIImage imageNamed:@"U.png"];
            pFour.image = [UIImage imageNamed:@"L.png"];
            pFive.image = [UIImage imageNamed:@"A.png"];
            pSix.image = [UIImage imageNamed:@"B.png"];
            pSeven.image = [UIImage imageNamed:@"L.png"];
            pEight.image = [UIImage imageNamed:@"T.png"];
            pNine.image = [UIImage imageNamed:@"E.png"];
            pTen.image = [UIImage imageNamed:@"S.png"];
            pEleven.image = [UIImage imageNamed:@"C.png"];
            pTwelve.image = [UIImage imageNamed:@"M.png"];
            pThirteen.image = [UIImage imageNamed:@"R.png"];
            pFourteen.image = [UIImage imageNamed:@"D.png"];
            pFithteen.image = [UIImage imageNamed:@"H.png"];
            pSixteen.image = [UIImage imageNamed:@"I.png"];
            TotalAmount.text = [NSString stringWithFormat:@"%i OF 1100", Score];
            TheAmount = 1100;
            break;
        default:
            break;
    }
    
    [self GetTheWord];
    
    iLeft = ikTwo - ikOne;
    iUp = iktOne - iktFive;
}

-(void)Swipes
{
    PanningSensitivity = [[NSUserDefaults standardUserDefaults] integerForKey:@"PSValue"];
    
    UIPanGestureRecognizer *panOne = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(OnePan:)];
    pOne.userInteractionEnabled = YES;
    [pOne addGestureRecognizer:panOne];
    
    UIPanGestureRecognizer *panTwo = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwoPan:)];
    pTwo.userInteractionEnabled = YES;
    [pTwo addGestureRecognizer:panTwo];
    
    UIPanGestureRecognizer *panThree = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThreePan:)];
    pThree.userInteractionEnabled = YES;
    [pThree addGestureRecognizer:panThree];
    
    UIPanGestureRecognizer *panFour = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourPan:)];
    pFour.userInteractionEnabled = YES;
    [pFour addGestureRecognizer:panFour];
    
    UIPanGestureRecognizer *panFive = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FivePan:)];
    pFive.userInteractionEnabled = YES;
    [pFive addGestureRecognizer:panFive];
    
    UIPanGestureRecognizer *panSix = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixPan:)];
    pSix.userInteractionEnabled = YES;
    [pSix addGestureRecognizer:panSix];
    
    UIPanGestureRecognizer *panSeven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SevenPan:)];
    pSeven.userInteractionEnabled = YES;
    [pSeven addGestureRecognizer:panSeven];
    
    UIPanGestureRecognizer *panEight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(EightPan:)];
    pEight.userInteractionEnabled = YES;
    [pEight addGestureRecognizer:panEight];
    
    UIPanGestureRecognizer *panNine = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(NinePan:)];
    pNine.userInteractionEnabled = YES;
    [pNine addGestureRecognizer:panNine];
    
    UIPanGestureRecognizer *panTen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TenPan:)];
    pTen.userInteractionEnabled = YES;
    [pTen addGestureRecognizer:panTen];
    
    UIPanGestureRecognizer *panEleven = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ElevenPan:)];
    pEleven.userInteractionEnabled = YES;
    [pEleven addGestureRecognizer:panEleven];
    
    UIPanGestureRecognizer *panTwelve = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(TwelvePan:)];
    pTwelve.userInteractionEnabled = YES;
    [pTwelve addGestureRecognizer:panTwelve];
    
    UIPanGestureRecognizer *panThirteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ThirteenPan:)];
    pThirteen.userInteractionEnabled = YES;
    [pThirteen addGestureRecognizer:panThirteen];
    
    UIPanGestureRecognizer *panFourteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FourteenPan:)];
    pFourteen.userInteractionEnabled = YES;
    [pFourteen addGestureRecognizer:panFourteen];
    
    UIPanGestureRecognizer *panFithteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FithteenPan:)];
    pFithteen.userInteractionEnabled = YES;
    [pFithteen addGestureRecognizer:panFithteen];
    
    UIPanGestureRecognizer *panSixteen = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(SixteenPan:)];
    pSixteen.userInteractionEnabled = YES;
    [pSixteen addGestureRecognizer:panSixteen];
    
}

-(void)OnePan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 1;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
        } else if (distance.y > 0 || distance.y < 0) {
            Previous = 2;
            [self Horizontal];
        }
        [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
    
}

-(void)TwoPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 2;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThreePan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 3;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 4;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)FivePan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 5;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 6;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)SevenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 7;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)EightPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 8;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)NinePan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 9;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)TenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 10;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)ElevenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 11;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)TwelvePan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 12;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)ThirteenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 13;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)FourteenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 14;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)FithteenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 15;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

-(void)SixteenPan: (UIPanGestureRecognizer *)sender
{
    distance = [sender translationInView:self.view];
    PanningInt++;
    PPanningMethod = 16;
    
    if (sender.state != UIGestureRecognizerStateEnded && Previous == 1) {
        if (PanningInt == PanningSensitivity) {
            [self Verticle];
            PanningInt = 0;
        }
    } else if (sender.state != UIGestureRecognizerStateEnded && Previous == 2) {
        if (PanningInt == PanningSensitivity) {
            [self Horizontal];
            PanningInt = 0;
        }
    } else if (distance.x > 0 || distance.x < 0) {
        if ((distance.y > 0 || distance.y < 0) && ((distance.x > 0 && distance.x < 10) || (distance.x < 0 && distance.x > -10))) {
            Previous = 2;
            [self Horizontal];
        } else {
            [self Verticle];
            Previous = 1;
        }
    } else if (distance.y > 0 || distance.y < 0) {
        Previous = 2;
        [self Horizontal];
    }
    [sender setTranslation:CGPointZero inView:self.view];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        PanningInt = 0;
        Previous = 0;
        [self EndSwipingSettings];
    }
}

//\/\/\\/\/\/\/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\//\/\\/\/\/\/\/\\/\/\/\/\\/\/\/\/\/\/\/\\/\//\/\/\///\\/\/\/\/\/\

-(void)Horizontal
{
    xOne = pOne.center.x;
    yOne = pOne.center.y;
    xTwo = pTwo.center.x;
    yTwo = pTwo.center.y;
    xThree = pThree.center.x;
    yThree = pThree.center.y;
    xFour = pFour.center.x;
    yFour = pFour.center.y;
    xFive = pFive.center.x;
    yFive = pFive.center.y;
    xSix = pSix.center.x;
    ySix = pSix.center.y;
    ySeven = pSeven.center.y;
    xSeven = pSeven.center.x;
    xEight = pEight.center.x;
    yEight = pEight.center.y;
    yNine = pNine.center.y;
    xNine = pNine.center.x;
    xTen = pTen.center.x;
    yTen = pTen.center.y;
    xEleven = pEleven.center.x;
    yEleven = pEleven.center.y;
    xTwelve = pTwelve.center.x;
    yTwelve = pTwelve.center.y;
    xThirteen = pThirteen.center.x;
    yThirteen = pThirteen.center.y;
    xFourteen = pFourteen.center.x;
    yFourteen = pFourteen.center.y;
    xFithteen = pFithteen.center.x;
    yFithteen = pFithteen.center.y;
    xSixteen = pSixteen.center.x;
    ySixteen = pSixteen.center.y;
    
    switch (PPanningMethod) {
        case 1:
            pointOfIntrest = pOne.center.x;
            break;
        case 2:
            pointOfIntrest = pTwo.center.x;
            break;
        case 3:
            pointOfIntrest = pThree.center.x;
            break;
        case 4:
            pointOfIntrest = pFour.center.x;
            break;
        case 5:
            pointOfIntrest = pFive.center.x;
            break;
        case 6:
            pointOfIntrest = pSix.center.x;
            break;
        case 7:
            pointOfIntrest = pSeven.center.x;
            break;
        case 8:
            pointOfIntrest = pEight.center.x;
            break;
        case 9:
            pointOfIntrest = pNine.center.x;
            break;
        case 10:
            pointOfIntrest = pTen.center.x;
            break;
        case 11:
            pointOfIntrest = pEleven.center.x;
            break;
        case 12:
            pointOfIntrest = pTwelve.center.x;
            break;
        case 13:
            pointOfIntrest = pThirteen.center.x;
            break;
        case 14:
            pointOfIntrest = pFourteen.center.x;
            break;
        case 15:
            pointOfIntrest = pFithteen.center.x;
            break;
        case 16:
            pointOfIntrest = pSixteen.center.x;
            break;
        default:
            break;
    }
    
    if (distance.y < 0) {
        
        if (pointOfIntrest == pOne.center.x) {
            pOne.center = CGPointMake(pOne.center.x, pOne.center.y - iLeft);
        }
        if (pointOfIntrest == pTwo.center.x) {
            pTwo.center = CGPointMake(pTwo.center.x, pTwo.center.y - iLeft);
        }
        if (pointOfIntrest == pThree.center.x) {
            pThree.center = CGPointMake(pThree.center.x , pThree.center.y - iLeft);
        }
        if (pointOfIntrest == pFour.center.x) {
            pFour.center = CGPointMake(pFour.center.x, pFour.center.y - iLeft);
        }
        if (pFive.center.x == pointOfIntrest) {
            pFive.center = CGPointMake(pFive.center.x, pFive.center.y - iLeft);
        }
        if (pointOfIntrest == pSix.center.x) {
            pSix.center = CGPointMake(pSix.center.x , pSix.center.y - iLeft);
        }
        if (pointOfIntrest == pSeven.center.x) {
            pSeven.center = CGPointMake(pSeven.center.x , pSeven.center.y - iLeft);
        }
        if (pointOfIntrest == pEight.center.x) {
            pEight.center = CGPointMake(pEight.center.x , pEight.center.y - iLeft);
        }
        if (pointOfIntrest == pNine.center.x) {
            pNine.center = CGPointMake(pNine.center.x, pNine.center.y - iLeft);
        }
        if (pointOfIntrest == pTen.center.x) {
            pTen.center = CGPointMake(pTen.center.x, pTen.center.y - iLeft);
        }
        if (pointOfIntrest == pEleven.center.x) {
            pEleven.center = CGPointMake(pEleven.center.x, pEleven.center.y - iLeft);
        }
        if (pointOfIntrest == pTwelve.center.x) {
            pTwelve.center = CGPointMake(pTwelve.center.x, pTwelve.center.y - iLeft);
        }
        if (pointOfIntrest == pThirteen.center.x) {
            pThirteen.center = CGPointMake(pThirteen.center.x , pThirteen.center.y - iLeft);
        }
        if (pointOfIntrest == pFourteen.center.x) {
            pFourteen.center = CGPointMake(pFourteen.center.x, pFourteen.center.y - iLeft);
        }
        if (pointOfIntrest == pFithteen.center.x) {
            pFithteen.center = CGPointMake(pFithteen.center.x, pFithteen.center.y - iLeft);
        }
        if (pointOfIntrest == pSixteen.center.x) {
            pSixteen.center = CGPointMake(pSixteen.center.x, pSixteen.center.y - iLeft);
        }
    } else if (distance.y > 0) {
        
        if (pointOfIntrest == pOne.center.x) {
            pOne.center = CGPointMake(pOne.center.x, pOne.center.y+ iLeft);
        }
        if (pointOfIntrest == pTwo.center.x) {
            pTwo.center = CGPointMake(pTwo.center.x, pTwo.center.y+ iLeft);
        }
        if (pointOfIntrest == pThree.center.x) {
            pThree.center = CGPointMake(pThree.center.x , pThree.center.y+ iLeft);
        }
        if (pointOfIntrest == pFour.center.x) {
            pFour.center = CGPointMake(pFour.center.x, pFour.center.y+ iLeft);
        }
        if (pointOfIntrest == pFive.center.x) {
            pFive.center = CGPointMake(pFive.center.x, pFive.center.y+ iLeft);
        }
        if (pointOfIntrest == pSix.center.x) {
            pSix.center = CGPointMake(pSix.center.x , pSix.center.y+ iLeft);
        }
        if (pointOfIntrest == pSeven.center.x) {
            pSeven.center = CGPointMake(pSeven.center.x , pSeven.center.y+ iLeft);
        }
        if (pointOfIntrest == pEight.center.x) {
            pEight.center = CGPointMake(pEight.center.x , pEight.center.y+ iLeft);
        }
        if (pointOfIntrest == pNine.center.x) {
            pNine.center = CGPointMake(pNine.center.x, pNine.center.y+ iLeft);
        }
        if (pointOfIntrest == pTen.center.x) {
            pTen.center = CGPointMake(pTen.center.x, pTen.center.y+ iLeft);
        }
        if (pointOfIntrest == pEleven.center.x) {
            pEleven.center = CGPointMake(pEleven.center.x, pEleven.center.y+ iLeft);
        }
        if (pointOfIntrest == pTwelve.center.x) {
            pTwelve.center = CGPointMake(pTwelve.center.x, pTwelve.center.y+ iLeft);
        }
        if (pointOfIntrest == pThirteen.center.x) {
            pThirteen.center = CGPointMake(pThirteen.center.x , pThirteen.center.y+ iLeft);
        }
        if (pointOfIntrest == pFourteen.center.x) {
            pFourteen.center = CGPointMake(pFourteen.center.x, pFourteen.center.y+ iLeft);
        }
        if (pointOfIntrest == pFithteen.center.x) {
            pFithteen.center = CGPointMake(pFithteen.center.x, pFithteen.center.y+ iLeft);
        }
        if (pointOfIntrest == pSixteen.center.x) {
            pSixteen.center = CGPointMake(pSixteen.center.x, pSixteen.center.y+ iLeft);
        }
    }
    
    if (pOne.center.x != pointOfIntrest) {
        pOne.alpha = 1;
        pOne.hidden = NO;
        pOne.center = CGPointMake(xOne, yOne);
    }
    if (pTwo.center.x != pointOfIntrest) {
        pTwo.alpha = 1;
        pTwo.hidden = NO;
        pTwo.center = CGPointMake(xTwo, yTwo);
    }
    if (pThree.center.x != pointOfIntrest) {
        pThree.alpha = 1;
        pThree.hidden = NO;
        pThree.center = CGPointMake(xThree, yThree);
    }
    if (pFour.center.x != pointOfIntrest) {
        pFour.alpha = 1;
        pFour.hidden = NO;
        pFour.center = CGPointMake(xFour, yFour);
    }
    if (pFive.center.x != pointOfIntrest) {
        pFive.alpha = 1;
        pFive.hidden = NO;
        pFive.center = CGPointMake(xFive, yFive);
    }
    if (pSix.center.x != pointOfIntrest) {
        pSix.alpha = 1;
        pSix.hidden = NO;
        pSix.center = CGPointMake(xSix, ySix);
    }
    if (pSeven.center.x != pointOfIntrest) {
        pSeven.alpha = 1;
        pSeven.hidden = NO;
        pSeven.center = CGPointMake(xSeven, ySeven);
    }
    if (pEight.center.x != pointOfIntrest) {
        pEight.alpha = 1;
        pEight.hidden = NO;
        pEight.center = CGPointMake(xEight, yEight);
    }
    if (pNine.center.x != pointOfIntrest) {
        pNine.alpha = 1;
        pNine.hidden = NO;
        pNine.center = CGPointMake(xNine, yNine);
    }
    if (pTen.center.x != pointOfIntrest) {
        pTen.alpha = 1;
        pTen.hidden = NO;
        pTen.center = CGPointMake(xTen, yTen);
    }
    if (pEleven.center.x != pointOfIntrest) {
        pEleven.alpha = 1;
        pEleven.hidden = NO;
        pEleven.center = CGPointMake(xEleven, yEleven);
    }
    if (pTwelve.center.x != pointOfIntrest) {
        pTwelve.alpha = 1;
        pTwelve.hidden = NO;
        pTwelve.center = CGPointMake(xTwelve, yTwelve);
    }
    if (pThirteen.center.x != pointOfIntrest) {
        pThirteen.alpha = 1;
        pThirteen.hidden = NO;
        pThirteen.center = CGPointMake(xThirteen, yThirteen);
    }
    if (pFourteen.center.x != pointOfIntrest) {
        pFourteen.alpha = 1;
        pFourteen.hidden = NO;
        pFourteen.center = CGPointMake(xFourteen, yFourteen);
    }
    if (pFithteen.center.x != pointOfIntrest) {
        pFithteen.alpha = 1;
        pFithteen.hidden = NO;
        pFithteen.center = CGPointMake(xFithteen, yFithteen);
    }
    if (pSixteen.center.x != pointOfIntrest) {
        pSixteen.alpha = 1;
        pSixteen.hidden = NO;
        pSixteen.center = CGPointMake(xSixteen, ySixteen);
    }
    
    if (pOne.center.y > iktSixteen) {
        pOne.center = CGPointMake(pOne.center.x, iktOne);
    }
    if (pTwo.center.y > iktSixteen) {
        pTwo.center = CGPointMake(pTwo.center.x, iktOne);
    }
    if (pThree.center.y > iktSixteen) {
        pThree.center = CGPointMake(pThree.center.x, iktOne);
    }
    if (pFour.center.y > iktSixteen) {
        pFour.center = CGPointMake(pFour.center.x,iktOne );
    }
    if (pFive.center.y > iktSixteen) {
        pFive.center = CGPointMake(pFive.center.x, iktOne);
    }
    if (pSix.center.y > iktSixteen) {
        pSix.center = CGPointMake(pSix.center.x, iktOne);
    }
    if (pSeven.center.y > iktSixteen) {
        pSeven.center = CGPointMake(pSeven.center.x, iktOne);
    }
    if (pEight.center.y > iktSixteen) {
        pEight.center = CGPointMake(pEight.center.x, iktOne);
    }
    if (pNine.center.y > iktSixteen) {
        pNine.center = CGPointMake(pNine.center.x, iktOne);
    }
    if (pTen.center.y > iktSixteen) {
        pTen.center = CGPointMake(pTen.center.x, iktOne);
    }
    if (pEleven.center.y > iktSixteen) {
        pEleven.center = CGPointMake(pEleven.center.x, iktOne);
    }
    if (pTwelve.center.y > iktSixteen) {
        pTwelve.center = CGPointMake(pTwelve.center.x, iktOne);
    }
    if (pThirteen.center.y > iktSixteen) {
        pThirteen.center = CGPointMake(pThirteen.center.x, iktOne);
    }
    if (pFourteen.center.y > iktSixteen) {
        pFourteen.center = CGPointMake(pFourteen.center.x, iktOne);
    }
    if (pFithteen.center.y > iktSixteen) {
        pFithteen.center = CGPointMake(pFithteen.center.x, iktOne);
    }
    if (pSixteen.center.y > iktSixteen) {
        pSixteen.center = CGPointMake(pSixteen.center.x, iktOne);
    }
    
    if (pOne.center.y < iktOne) {
        pOne.center = CGPointMake(pOne.center.x, iktSixteen);
    }
    if (pTwo.center.y < iktOne) {
        pTwo.center = CGPointMake(pTwo.center.x, iktSixteen);
    }
    if (pThree.center.y < iktOne) {
        pThree.center = CGPointMake(pThree.center.x, iktSixteen);
    }
    if (pFour.center.y < iktOne) {
        pFour.center = CGPointMake(pFour.center.x, iktSixteen);
    }
    if (pFive.center.y < iktOne) {
        pFive.center = CGPointMake(pFive.center.x, iktSixteen);
    }
    if (pSix.center.y < iktOne) {
        pSix.center = CGPointMake(pSix.center.x, iktSixteen);
    }
    if (pSeven.center.y < iktOne) {
        pSeven.center = CGPointMake(pSeven.center.x, iktSixteen);
    }
    if (pEight.center.y < iktOne) {
        pEight.center = CGPointMake(pEight.center.x, iktSixteen);
    }
    if (pNine.center.y < iktOne) {
        pNine.center = CGPointMake(pNine.center.x, iktSixteen);
    }
    if (pTen.center.y < iktOne) {
        pTen.center = CGPointMake(pTen.center.x, iktSixteen);
    }
    if (pEleven.center.y < iktOne) {
        pEleven.center = CGPointMake(pEleven.center.x, iktSixteen);
    }
    if (pTwelve.center.y < iktOne) {
        pTwelve.center = CGPointMake(pTwelve.center.x, iktSixteen);
    }
    if (pThirteen.center.y < iktOne) {
        pThirteen.center = CGPointMake(pThirteen.center.x, iktSixteen);
    }
    if (pFourteen.center.y < iktOne) {
        pFourteen.center = CGPointMake(pFourteen.center.x, iktSixteen);
    }
    if (pFithteen.center.y < iktOne) {
        pFithteen.center = CGPointMake(pFithteen.center.x, iktSixteen);
    }
    if (pSixteen.center.y < iktOne) {
        pSixteen.center = CGPointMake(pSixteen.center.x, iktSixteen);
    }
}

-(void)Verticle
{
    xOne = pOne.center.x;
    yOne = pOne.center.y;
    xTwo = pTwo.center.x;
    yTwo = pTwo.center.y;
    xThree = pThree.center.x;
    yThree = pThree.center.y;
    xFour = pFour.center.x;
    yFour = pFour.center.y;
    xFive = pFive.center.x;
    yFive = pFive.center.y;
    xSix = pSix.center.x;
    ySix = pSix.center.y;
    ySeven = pSeven.center.y;
    xSeven = pSeven.center.x;
    xEight = pEight.center.x;
    yEight = pEight.center.y;
    yNine = pNine.center.y;
    xNine = pNine.center.x;
    xTen = pTen.center.x;
    yTen = pTen.center.y;
    xEleven = pEleven.center.x;
    yEleven = pEleven.center.y;
    xTwelve = pTwelve.center.x;
    yTwelve = pTwelve.center.y;
    xThirteen = pThirteen.center.x;
    yThirteen = pThirteen.center.y;
    xFourteen = pFourteen.center.x;
    yFourteen = pFourteen.center.y;
    xFithteen = pFithteen.center.x;
    yFithteen = pFithteen.center.y;
    xSixteen = pSixteen.center.x;
    ySixteen = pSixteen.center.y;
    
    switch (PPanningMethod) {
        case 1:
            pointOfIntrest = pOne.center.y;
            break;
        case 2:
            pointOfIntrest = pTwo.center.y;
            break;
        case 3:
            pointOfIntrest = pThree.center.y;
            break;
        case 4:
            pointOfIntrest = pFour.center.y;
            break;
        case 5:
            pointOfIntrest = pFive.center.y;
            break;
        case 6:
            pointOfIntrest = pSix.center.y;
            break;
        case 7:
            pointOfIntrest = pSeven.center.y;
            break;
        case 8:
            pointOfIntrest = pEight.center.y;
            break;
        case 9:
            pointOfIntrest = pNine.center.y;
            break;
        case 10:
            pointOfIntrest = pTen.center.y;
            break;
        case 11:
            pointOfIntrest = pEleven.center.y;
            break;
        case 12:
            pointOfIntrest = pTwelve.center.y;
            break;
        case 13:
            pointOfIntrest = pThirteen.center.y;
            break;
        case 14:
            pointOfIntrest = pFourteen.center.y;
            break;
        case 15:
            pointOfIntrest = pFithteen.center.y;
            break;
        case 16:
            pointOfIntrest = pSixteen.center.y;
            break;
        default:
            break;
    }
    
    if (distance.x > 0) {
        
        if (pointOfIntrest == pOne.center.y) {
            pOne.center = CGPointMake(pOne.center.x + iLeft, pOne.center.y);
        }
        if (pointOfIntrest == pTwo.center.y) {
            pTwo.center = CGPointMake(pTwo.center.x + iLeft, pTwo.center.y);
        }
        if (pointOfIntrest == pThree.center.y) {
            pThree.center = CGPointMake(pThree.center.x + iLeft, pThree.center.y);
        }
        if (pointOfIntrest == pFour.center.y) {
            pFour.center = CGPointMake(pFour.center.x + iLeft, pFour.center.y);
        }
        if (pointOfIntrest == pFive.center.y) {
            pFive.center = CGPointMake(pFive.center.x + iLeft, pFive.center.y);
        }
        if (pointOfIntrest == pSix.center.y) {
            pSix.center = CGPointMake(pSix.center.x + iLeft, pSix.center.y);
        }
        if (pointOfIntrest == pSeven.center.y) {
            pSeven.center = CGPointMake(pSeven.center.x + iLeft, pSeven.center.y);
        }
        if (pointOfIntrest == pEight.center.y) {
            pEight.center = CGPointMake(pEight.center.x + iLeft, pEight.center.y);
        }
        if (pointOfIntrest == pNine.center.y) {
            pNine.center = CGPointMake(pNine.center.x + iLeft, pNine.center.y);
        }
        if (pointOfIntrest == pTen.center.y) {
            pTen.center = CGPointMake(pTen.center.x + iLeft, pTen.center.y);
        }
        if (pointOfIntrest == pEleven.center.y) {
            pEleven.center = CGPointMake(pEleven.center.x + iLeft, pEleven.center.y);
        }
        if (pointOfIntrest == pTwelve.center.y) {
            pTwelve.center = CGPointMake(pTwelve.center.x + iLeft, pTwelve.center.y);
        }
        if (pointOfIntrest == pThirteen.center.y) {
            pThirteen.center = CGPointMake(pThirteen.center.x + iLeft, pThirteen.center.y);
        }
        if (pointOfIntrest == pFourteen.center.y) {
            pFourteen.center = CGPointMake(pFourteen.center.x + iLeft, pFourteen.center.y);
        }
        if (pointOfIntrest == pFithteen.center.y) {
            pFithteen.center = CGPointMake(pFithteen.center.x + iLeft, pFithteen.center.y);
        }
        if (pointOfIntrest == pSixteen.center.y) {
            pSixteen.center = CGPointMake(pSixteen.center.x + iLeft, pSixteen.center.y);
        }
        
    } else if (distance.x < 0) {
        
        if (pointOfIntrest == pOne.center.y) {
            pOne.center = CGPointMake(pOne.center.x - iLeft, pOne.center.y);
        }
        if (pointOfIntrest == pTwo.center.y) {
            pTwo.center = CGPointMake(pTwo.center.x - iLeft, pTwo.center.y);
        }
        if (pointOfIntrest == pThree.center.y) {
            pThree.center = CGPointMake(pThree.center.x - iLeft, pThree.center.y);
        }
        if (pointOfIntrest == pFour.center.y) {
            pFour.center = CGPointMake(pFour.center.x - iLeft, pFour.center.y);
        }
        if (pointOfIntrest == pFive.center.y) {
            pFive.center = CGPointMake(pFive.center.x - iLeft, pFive.center.y);
        }
        if (pointOfIntrest == pSix.center.y) {
            pSix.center = CGPointMake(pSix.center.x - iLeft, pSix.center.y);
        }
        if (pointOfIntrest == pSeven.center.y) {
            pSeven.center = CGPointMake(pSeven.center.x - iLeft, pSeven.center.y);
        }
        if (pointOfIntrest == pEight.center.y) {
            pEight.center = CGPointMake(pEight.center.x - iLeft, pEight.center.y);
        }
        if (pointOfIntrest == pNine.center.y) {
            pNine.center = CGPointMake(pNine.center.x - iLeft, pNine.center.y);
        }
        if (pointOfIntrest == pTen.center.y) {
            pTen.center = CGPointMake(pTen.center.x - iLeft, pTen.center.y);
        }
        if (pointOfIntrest == pEleven.center.y) {
            pEleven.center = CGPointMake(pEleven.center.x - iLeft, pEleven.center.y);
        }
        if (pointOfIntrest == pTwelve.center.y) {
            pTwelve.center = CGPointMake(pTwelve.center.x - iLeft, pTwelve.center.y);
        }
        if (pointOfIntrest == pThirteen.center.y) {
            pThirteen.center = CGPointMake(pThirteen.center.x - iLeft, pThirteen.center.y);
        }
        if (pointOfIntrest == pFourteen.center.y) {
            pFourteen.center = CGPointMake(pFourteen.center.x - iLeft, pFourteen.center.y);
        }
        if (pointOfIntrest == pFithteen.center.y) {
            pFithteen.center = CGPointMake(pFithteen.center.x - iLeft, pFithteen.center.y);
        }
        if (pointOfIntrest == pSixteen.center.y) {
            pSixteen.center = CGPointMake(pSixteen.center.x - iLeft, pSixteen.center.y);
        }
    }
    
    if (pOne.center.y != pointOfIntrest) {
        pOne.alpha = 1;
        pOne.hidden = NO;
        pOne.center = CGPointMake(xOne, yOne);
    }
    if (pTwo.center.y != pointOfIntrest) {
        pTwo.alpha = 1;
        pTwo.hidden = NO;
        pTwo.center = CGPointMake(xTwo, yTwo);
    }
    if (pThree.center.y != pointOfIntrest) {
        pThree.alpha = 1;
        pThree.hidden = NO;
        pThree.center = CGPointMake(xThree, yThree);
    }
    if (pFour.center.y != pointOfIntrest) {
        pFour.alpha = 1;
        pFour.hidden = NO;
        pFour.center = CGPointMake(xFour, yFour);
    }
    if (pFive.center.y != pointOfIntrest) {
        pFive.alpha = 1;
        pFive.hidden = NO;
        pFive.center = CGPointMake(xFive, yFive);
    }
    if (pSix.center.y != pointOfIntrest) {
        pSix.alpha = 1;
        pSix.hidden = NO;
        pSix.center = CGPointMake(xSix, ySix);
    }
    if (pSeven.center.y != pointOfIntrest) {
        pSeven.alpha = 1;
        pSeven.hidden = NO;
        pSeven.center = CGPointMake(xSeven, ySeven);
    }
    if (pEight.center.y != pointOfIntrest) {
        pEight.alpha = 1;
        pEight.hidden = NO;
        pEight.center = CGPointMake(xEight, yEight);
    }
    if (pNine.center.y != pointOfIntrest) {
        pNine.alpha = 1;
        pNine.hidden = NO;
        pNine.center = CGPointMake(xNine, yNine);
    }
    if (pTen.center.y != pointOfIntrest) {
        pTen.alpha = 1;
        pTen.hidden = NO;
        pTen.center = CGPointMake(xTen, yTen);
    }
    if (pEleven.center.y != pointOfIntrest) {
        pEleven.alpha = 1;
        pEleven.hidden = NO;
        pEleven.center = CGPointMake(xEleven, yEleven);
    }
    if (pTwelve.center.y != pointOfIntrest) {
        pTwelve.alpha = 1;
        pTwelve.hidden = NO;
        pTwelve.center = CGPointMake(xTwelve, yTwelve);
    }
    if (pThirteen.center.y != pointOfIntrest) {
        pThirteen.alpha = 1;
        pThirteen.hidden = NO;
        pThirteen.center = CGPointMake(xThirteen, yThirteen);
    }
    if (pFourteen.center.y != pointOfIntrest) {
        pFourteen.alpha = 1;
        pFourteen.hidden = NO;
        pFourteen.center = CGPointMake(xFourteen, yFourteen);
    }
    if (pFithteen.center.y != pointOfIntrest) {
        pFithteen.alpha = 1;
        pFithteen.hidden = NO;
        pFithteen.center = CGPointMake(xFithteen, yFithteen);
    }
    if (pSixteen.center.y != pointOfIntrest) {
        pSixteen.alpha = 1;
        pSixteen.hidden = NO;
        pSixteen.center = CGPointMake(xSixteen, ySixteen);
    }
    
    if (pOne.center.x < ikOne) {
        pOne.center = CGPointMake(ikFour, pOne.center.y);
    }
    if (pTwo.center.x < ikOne) {
        pTwo.center = CGPointMake(ikFour, pTwo.center.y);
    }
    if (pThree.center.x < ikOne) {
        pThree.center = CGPointMake(ikFour, pThree.center.y);
    }
    if (pFour.center.x < ikOne) {
        pFour.center = CGPointMake(ikFour, pFour.center.y);
    }
    if (pFive.center.x < ikOne) {
        pFive.center = CGPointMake(ikFour, pFive.center.y);
    }
    if (pSix.center.x < ikOne) {
        pSix.center = CGPointMake(ikFour, pSix.center.y);
    }
    if (pSeven.center.x < ikOne) {
        pSeven.center = CGPointMake(ikFour, pSeven.center.y);
    }
    if (pEight.center.x < ikOne) {
        pEight.center = CGPointMake(ikFour, pEight.center.y);
    }
    if (pNine.center.x < ikOne) {
        pNine.center = CGPointMake(ikFour, pNine.center.y);
    }
    if (pTen.center.x < ikOne) {
        pTen.center = CGPointMake(ikFour, pTen.center.y);
    }
    if (pEleven.center.x < ikOne) {
        pEleven.center = CGPointMake(ikFour, pEleven.center.y);
    }
    if (pTwelve.center.x < ikOne) {
        pTwelve.center = CGPointMake(ikFour, pTwelve.center.y);
    }
    if (pThirteen.center.x < ikOne) {
        pThirteen.center = CGPointMake(ikFour, pThirteen.center.y);
    }
    if (pFourteen.center.x < ikOne) {
        pFourteen.center = CGPointMake(ikFour, pFourteen.center.y);
    }
    if (pFithteen.center.x < ikOne) {
        pFithteen.center = CGPointMake(ikFour, pFithteen.center.y);
    }
    if (pSixteen.center.x < ikOne) {
        pSixteen.center = CGPointMake(ikFour, pSixteen.center.y);
    }
    
    if (pOne.center.x > ikFour) {
        pOne.center = CGPointMake(ikOne, pOne.center.y);
    }
    if (pTwo.center.x > ikFour) {
        pTwo.center = CGPointMake(ikOne, pTwo.center.y);
    }
    if (pThree.center.x > ikFour) {
        pThree.center = CGPointMake(ikOne, pThree.center.y);
    }
    if (pFour.center.x > ikFour) {
        pFour.center = CGPointMake(ikOne, pFour.center.y);
    }
    if (pFive.center.x > ikFour) {
        pFive.center = CGPointMake(ikOne, pFive.center.y);
    }
    if (pSix.center.x > ikFour) {
        pSix.center = CGPointMake(ikOne, pSix.center.y);
    }
    if (pSeven.center.x > ikFour) {
        pSeven.center = CGPointMake(ikOne, pSeven.center.y);
    }
    if (pEight.center.x > ikFour) {
        pEight.center = CGPointMake(ikOne, pEight.center.y);
    }
    if (pNine.center.x > ikFour) {
        pNine.center = CGPointMake(ikOne, pNine.center.y);
    }
    if (pTen.center.x > ikFour) {
        pTen.center = CGPointMake(ikOne, pTen.center.y);
    }
    if (pEleven.center.x > ikFour) {
        pEleven.center = CGPointMake(ikOne, pEleven.center.y);
    }
    if (pTwelve.center.x > ikFour) {
        pTwelve.center = CGPointMake(ikOne, pTwelve.center.y);
    }
    if (pThirteen.center.x > ikFour) {
        pThirteen.center = CGPointMake(ikOne, pThirteen.center.y);
    }
    if (pFourteen.center.x > ikFour) {
        pFourteen.center = CGPointMake(ikOne, pFourteen.center.y);
    }
    if (pFithteen.center.x > ikFour) {
        pFithteen.center = CGPointMake(ikOne, pFithteen.center.y);
    }
    if (pSixteen.center.x > ikFour) {
        pSixteen.center = CGPointMake(ikOne, pSixteen.center.y);
    }
}


//\/\/\/\/\/\////\/\/\/\/\/\\\\////\/\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/


-(void)EndSwipingSettings
{
    [SwipeSound play];
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
        if ([str isEqual:Word] && WordIsAlreadyDone[i] == NO) {
            WordIsAlreadyDone[i] = YES;
            Score = Score + 1;
            TotalAmount.text = [NSString stringWithFormat:@"%i OF  %i", Score, TheAmount];
            SavedWords = [NSString stringWithFormat:@"%@ %@", SavedWords, str];
            }
        }
    }

    if (WordFour == 1) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour1"];
    } else if (WordFour == 2) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour2"];
    } else if (WordFour == 3) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour3"];
    } else if (WordFour == 4) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour4"];
    } else if (WordFour == 5) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour5"];
    } else if (WordFour == 6) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour6"];
    } else if (WordFour == 7) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour7"];
    } else if (WordFour == 8) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour8"];
    } else if (WordFour == 9) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour9"];
    } else if (WordFour == 10) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour10"];
    } else if (WordFour == 11) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour11"];
    } else if (WordFour == 12) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour12"];
    } else if (WordFour == 13) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour13"];
    } else if (WordFour == 14) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour14"];
    } else if (WordFour == 15) {
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour15"];
    }
    
    if (Score == TheAmount) {
        [self PlayAnimation];
    }
}

-(void)PlayAnimation
{
    NSInteger TotalGames = [[NSUserDefaults standardUserDefaults] integerForKey:@"TotalGamesWon"];
    TotalGames++;
    [[NSUserDefaults standardUserDefaults] setInteger:TotalGames forKey:@"TotalGamesWon"];
    
    if (WordFour == 1) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour1"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour1"];
    } else if (WordFour == 2) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour2"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour2"];
    } else if (WordFour == 3) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour3"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour3"];
    } else if (WordFour == 4) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour4"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour4"];
    } else if (WordFour == 5) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour5"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour5"];
    } else if (WordFour == 6) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour6"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour6"];
    } else if (WordFour == 7) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour7"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour7"];
    } else if (WordFour == 8) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour8"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour8"];
    } else if (WordFour == 9) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour9"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour9"];
    } else if (WordFour == 10) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour10"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour10"];
    } else if (WordFour == 11) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour11"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour11"];
    } else if (WordFour == 12) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour12"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour12"];
    } else if (WordFour == 13) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour13"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour13"];
    } else if (WordFour == 14) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour14"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour14"];
    } else if (WordFour == 15) {
        SavedWords = [[NSUserDefaults standardUserDefaults] stringForKey:@"SavedTheWordForGridFour15"];
        SavedWords = @"";
        [[NSUserDefaults standardUserDefaults] setObject:SavedWords forKey:@"SavedTheWordForGridFour15"];
    }
    
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

    TileOne = [[UIImageView alloc] initWithFrame:CGRectMake(pOne.center.x - a, pOne.center.y - a, pOne.bounds.size.width, pOne.bounds.size.height)];
    TileTwo = [[UIImageView alloc] initWithFrame:CGRectMake(pTwo.center.x-a, pTwo.center.y-a, pTwo.bounds.size.width, pTwo.bounds.size.height)];
    TileThree = [[UIImageView alloc] initWithFrame:CGRectMake(pThree.center.x-a, pThree.center.y-a, pThree.bounds.size.width, pThree.bounds.size.height)];
    TileFour = [[UIImageView alloc] initWithFrame:CGRectMake(pFour.center.x-a, pFour.center.y-a, pFour.bounds.size.width, pFour.bounds.size.height)];
    TileFive = [[UIImageView alloc] initWithFrame:CGRectMake(pFive.center.x-a, pFive.center.y-a, pFive.bounds.size.width, pFive.bounds.size.height)];
    TileSix = [[UIImageView alloc] initWithFrame:CGRectMake(pSix.center.x-a, pSix.center.y-a, pSix.bounds.size.width, pSix.bounds.size.height)];
    TileSeven = [[UIImageView alloc] initWithFrame:CGRectMake(pSeven.center.x-a, pSeven.center.y-a, pSeven.bounds.size.width, pSeven.bounds.size.height)];
    TileEight = [[UIImageView alloc] initWithFrame:CGRectMake(pEight.center.x-a, pEight.center.y-a, pEight.bounds.size.width, pEight.bounds.size.height)];
    TileNine = [[UIImageView alloc] initWithFrame:CGRectMake(pNine.center.x-a, pNine.center.y-a, pNine.bounds.size.width, pNine.bounds.size.height)];
    TileTen = [[UIImageView alloc] initWithFrame:CGRectMake(pTen.center.x-a, pTen.center.y-a, pTen.bounds.size.width, pTen.bounds.size.height)];
    TileEleven = [[UIImageView alloc] initWithFrame:CGRectMake(pEleven.center.x-a, pEleven.center.y-a, pEleven.bounds.size.width, pEleven.bounds.size.height)];
    TileTwelve = [[UIImageView alloc] initWithFrame:CGRectMake(pTwelve.center.x-a, pTwelve.center.y-a, pTwelve.bounds.size.width, pTwelve.bounds.size.height)];
    TileThirteen = [[UIImageView alloc] initWithFrame:CGRectMake(pThirteen.center.x-a, pThirteen.center.y-a, pThirteen.bounds.size.width, pThirteen.bounds.size.height)];
    TileFourteen = [[UIImageView alloc] initWithFrame:CGRectMake(pFourteen.center.x-a, pFourteen.center.y-a, pFourteen.bounds.size.width, pFourteen.bounds.size.height)];
    TileFithteen = [[UIImageView alloc] initWithFrame:CGRectMake(pFithteen.center.x-a, pFithteen.center.y-a, pFithteen.bounds.size.width, pFithteen.bounds.size.height)];
    TileSixteen = [[UIImageView alloc] initWithFrame:CGRectMake(pSixteen.center.x-a, pSixteen.center.y-a, pSixteen.bounds.size.width, pSixteen.bounds.size.height)];
    
    TileOne.backgroundColor = [UIColor whiteColor];
    TileTwo.backgroundColor = [UIColor whiteColor];
    TileThree.backgroundColor = [UIColor whiteColor];
    TileFour.backgroundColor = [UIColor whiteColor];
    TileFive.backgroundColor = [UIColor whiteColor];
    TileSix.backgroundColor = [UIColor whiteColor];
    TileSeven.backgroundColor = [UIColor whiteColor];
    TileEight.backgroundColor = [UIColor whiteColor];
    TileNine.backgroundColor = [UIColor whiteColor];
    TileTen.backgroundColor = [UIColor whiteColor];
    TileEleven.backgroundColor = [UIColor whiteColor];
    TileTwelve.backgroundColor = [UIColor whiteColor];
    TileThirteen.backgroundColor = [UIColor whiteColor];
    TileFourteen.backgroundColor = [UIColor whiteColor];
    TileFithteen.backgroundColor = [UIColor whiteColor];
    TileSixteen.backgroundColor = [UIColor whiteColor];
    
    TileOne.alpha = 0;
    TileTwo.alpha = 0;
    TileThree.alpha = 0;
    TileFour.alpha = 0;
    TileFive.alpha = 0;
    TileSix.alpha = 0;
    TileSeven.alpha = 0;
    TileEight.alpha = 0;
    TileNine.alpha = 0;
    TileTen.alpha = 0;
    TileEleven.alpha = 0;
    TileTwelve.alpha = 0;
    TileThirteen.alpha = 0;
    TileFourteen.alpha = 0;
    TileFithteen.alpha = 0;
    TileSixteen.alpha = 0;
    
    [self.view addSubview:TileOne];
    [self.view addSubview:TileTwo];
    [self.view addSubview:TileThree];
    [self.view addSubview:TileFour];
    [self.view addSubview:TileFive];
    [self.view addSubview:TileSix];
    [self.view addSubview:TileSeven];
    [self.view addSubview:TileEight];
    [self.view addSubview:TileNine];
    [self.view addSubview:TileTen];
    [self.view addSubview:TileEleven];
    [self.view addSubview:TileTwelve];
    [self.view addSubview:TileThirteen];
    [self.view addSubview:TileFourteen];
    [self.view addSubview:TileFithteen];
    [self.view addSubview:TileSixteen];
    
    TileOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwo.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThree.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFour.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFive.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSix.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSeven.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEight.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNine.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEleven.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwelve.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThirteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFithteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileOne.alpha = 1;
    TileOne.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwo.alpha = 1;
    TileTwo.transform = CGAffineTransformMakeScale(1, 1);
    TileFive.alpha = 1;
    TileFive.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileThree.alpha = 1;
    TileThree.transform = CGAffineTransformMakeScale(1, 1);
    TileSix.alpha = 1;
    TileSix.transform = CGAffineTransformMakeScale(1, 1);
    TileNine.alpha = 1;
    TileNine.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileFour.alpha = 1;
    TileFour.transform = CGAffineTransformMakeScale(1, 1);
    TileSeven.alpha = 1;
    TileSeven.transform = CGAffineTransformMakeScale(1, 1);
    TileTen.alpha = 1;
    TileTen.transform = CGAffineTransformMakeScale(1, 1);
    TileThirteen.alpha = 1;
    TileThirteen.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.9];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileEight.alpha = 1;
    TileEight.transform = CGAffineTransformMakeScale(1, 1);
    TileEleven.alpha = 1;
    TileEleven.transform = CGAffineTransformMakeScale(1, 1);
    TileFourteen.alpha = 1;
    TileFourteen.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileTwelve.alpha = 1;
    TileTwelve.transform = CGAffineTransformMakeScale(1, 1);
    TileFithteen.alpha = 1;
    TileFithteen.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    TileSixteen.alpha = 1;
    TileSixteen.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    BarUnderWord.alpha = 0;
    TheCurrentWord.alpha = 0;
    SenderDisplay.alpha = 0;
    Pause.alpha = 0;
    Check.alpha = 0;
    pOne.alpha = 0;
    pTwo.alpha = 0;
    pThree.alpha = 0;
    pFour.alpha = 0;
    pFive.alpha = 0;
    pSix.alpha = 0;
    pSeven.alpha = 0;
    pEight.alpha = 0;
    pNine.alpha = 0;
    pTen.alpha = 0;
    pEleven.alpha = 0;
    pTwelve.alpha = 0;
    pThirteen.alpha = 0;
    pFourteen.alpha = 0;
    pFithteen.alpha = 0;
    pSixteen.alpha = 0;
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    TotalAmount.transform = CGAffineTransformMakeScale(3, 3);
    TotalAmount.alpha = 0;
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
    [TileOne.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwo.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThree.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFour.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFive.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSix.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSeven.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEight.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileNine.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTen.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileEleven.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileTwelve.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileThirteen.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFourteen.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileFithteen.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    [TileSixteen.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.1; // Speed
    rotation.repeatCount = HUGE_VALF;
    [TileOne.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwo.layer addAnimation:rotation forKey:@"Spin"];
    [TileThree.layer addAnimation:rotation forKey:@"Spin"];
    [TileFour.layer addAnimation:rotation forKey:@"Spin"];
    [TileFive.layer addAnimation:rotation forKey:@"Spin"];
    [TileSix.layer addAnimation:rotation forKey:@"Spin"];
    [TileSeven.layer addAnimation:rotation forKey:@"Spin"];
    [TileEight.layer addAnimation:rotation forKey:@"Spin"];
    [TileNine.layer addAnimation:rotation forKey:@"Spin"];
    [TileTen.layer addAnimation:rotation forKey:@"Spin"];
    [TileEleven.layer addAnimation:rotation forKey:@"Spin"];
    [TileTwelve.layer addAnimation:rotation forKey:@"Spin"];
    [TileThirteen.layer addAnimation:rotation forKey:@"Spin"];
    [TileFourteen.layer addAnimation:rotation forKey:@"Spin"];
    [TileFithteen.layer addAnimation:rotation forKey:@"Spin"];
    [TileSixteen.layer addAnimation:rotation forKey:@"Spin"];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:1.9];
    [UIView setAnimationDelegate:self];
    TileOne.transform = CGAffineTransformMakeScale(10, 10);
    TileTwo.transform = CGAffineTransformMakeScale(10, 10);
    TileThree.transform = CGAffineTransformMakeScale(10, 10);
    TileFour.transform = CGAffineTransformMakeScale(10, 10);
    TileFive.transform = CGAffineTransformMakeScale(10, 10);
    TileSix.transform = CGAffineTransformMakeScale(10, 10);
    TileSeven.transform = CGAffineTransformMakeScale(10, 10);
    TileEight.transform = CGAffineTransformMakeScale(10, 10);
    TileNine.transform = CGAffineTransformMakeScale(10, 10);
    TileTen.transform = CGAffineTransformMakeScale(10, 10);
    TileEleven.transform = CGAffineTransformMakeScale(10, 10);
    TileTwelve.transform = CGAffineTransformMakeScale(10, 10);
    TileThirteen.transform = CGAffineTransformMakeScale(10, 10);
    TileFourteen.transform = CGAffineTransformMakeScale(10, 10);
    TileFithteen.transform = CGAffineTransformMakeScale(10, 10);
    TileSixteen.transform = CGAffineTransformMakeScale(10, 10);
    [UIView commitAnimations];
    
    [self performSelector:@selector(BackToHome) withObject:nil afterDelay:3.5];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:3];
    [UIView setAnimationDuration:0.5];
    TileOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwo.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThree.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFour.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFive.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSix.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSeven.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEight.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileNine.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileEleven.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileTwelve.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileThirteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFourteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileFithteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TileSixteen.transform = CGAffineTransformMakeScale(0.001, 0.001);
    TotalAmount.transform = CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)GetTheWord
{
    xOne = pOne.center.x;
    yOne = pOne.center.y;
    xTwo = pTwo.center.x;
    yTwo = pTwo.center.y;
    xThree = pThree.center.x;
    yThree = pThree.center.y;
    xFour = pFour.center.x;
    yFour = pFour.center.y;
    xFive = pFive.center.x;
    yFive = pFive.center.y;
    xSix = pSix.center.x;
    ySix = pSix.center.y;
    ySeven = pSeven.center.y;
    xSeven = pSeven.center.x;
    xEight = pEight.center.x;
    yEight = pEight.center.y;
    yNine = pNine.center.y;
    xNine = pNine.center.x;
    xTen = pTen.center.x;
    yTen = pTen.center.y;
    xEleven = pEleven.center.x;
    yEleven = pEleven.center.y;
    xTwelve = pTwelve.center.x;
    yTwelve = pTwelve.center.y;
    xThirteen = pThirteen.center.x;
    yThirteen = pThirteen.center.y;
    xFourteen = pFourteen.center.x;
    yFourteen = pFourteen.center.y;
    xFithteen = pFithteen.center.x;
    yFithteen = pFithteen.center.y;
    xSixteen = pSixteen.center.x;
    ySixteen = pSixteen.center.y;

    if (pOne.center.y == iktOne) {
        if (pOne.center.x == ikOne) {
            wOne = cOne;
        } else if (pOne.center.x == ikTwo) {
            wTwo = cOne;
        } else if (pOne.center.x == ikThree) {
            wThree = cOne;
        } else if (pOne.center.x == ikFour) {
            wFour = cOne;
        }
    }
    
    if (pTwo.center.y == iktOne) {
        if (pTwo.center.x == ikOne) {
            wOne = cTwo;
        } else if (pTwo.center.x == ikTwo) {
            wTwo = cTwo;
        } else if (pTwo.center.x == ikThree) {
            wThree = cTwo;
        } else if (pTwo.center.x == ikFour) {
            wFour = cTwo;
        }
    }
    
    if (pThree.center.y == iktOne) {
        if (pThree.center.x == ikOne) {
            wOne = cThree;
        } else if (pThree.center.x == ikTwo) {
            wTwo = cThree;
        } else if (pThree.center.x == ikThree) {
            wThree = cThree;
        } else if (pThree.center.x == ikFour) {
            wFour = cThree;
        }
    }
    
    if (pFour.center.y == iktOne) {
        if (pFour.center.x == ikOne) {
            wOne = cFour;
        } else if (pFour.center.x == ikTwo) {
            wTwo = cFour;
        } else if (pFour.center.x == ikThree) {
            wThree = cFour;
        } else if (pFour.center.x == ikFour) {
            wFour = cFour;
        }
    }
    
    if (pFive.center.y == iktOne) {
        if (pFive.center.x == ikOne) {
            wOne = cFive;
        } else if (pFive.center.x == ikTwo) {
            wTwo = cFive;
        } else if (pFive.center.x == ikThree) {
            wThree = cFive;
        } else if (pFive.center.x == ikFour) {
            wFour = cFive;
        }
    }
    
    if (pSix.center.y == iktOne) {
        if (pSix.center.x == ikOne) {
            wOne = cSix;
        } else if (pSix.center.x == ikTwo) {
            wTwo = cSix;
        } else if (pSix.center.x == ikThree) {
            wThree = cSix;
        } else if (pSix.center.x == ikFour) {
            wFour = cSix;
        }
    }
    
    if (pSeven.center.y == iktOne) {
        if (pSeven.center.x == ikOne) {
            wOne = cSeven;
        } else if (pSeven.center.x == ikTwo) {
            wTwo = cSeven;
        } else if (pSeven.center.x == ikThree) {
            wThree = cSeven;
        } else if (pSeven.center.x == ikFour) {
            wFour = cSeven;
        }
    }
    
    if (pEight.center.y == iktOne) {
        if (pEight.center.x == ikOne) {
            wOne = cEight;
        } else if (pEight.center.x == ikTwo) {
            wTwo = cEight;
        } else if (pEight.center.x == ikThree) {
            wThree = cEight;
        } else if (pEight.center.x == ikFour) {
            wFour = cEight;
        }
    }
    
    if (pNine.center.y == iktOne) {
        if (pNine.center.x == ikOne) {
            wOne = cNine;
        } else if (pNine.center.x == ikTwo) {
            wTwo = cNine;
        } else if (pNine.center.x == ikThree) {
            wThree = cNine;
        } else if (pNine.center.x == ikFour) {
            wFour = cNine;
        }
    }
    
    if (pTen.center.y == iktOne) {
        if (pTen.center.x == ikOne) {
            wOne = cTen;
        } else if (pTen.center.x == ikTwo) {
            wTwo = cTen;
        } else if (pTen.center.x == ikThree) {
            wThree = cTen;
        } else if (pTen.center.x == ikFour) {
            wFour = cTen;
        }
    }
    
    if (pEleven.center.y == iktOne) {
        if (pEleven.center.x == ikOne) {
            wOne = cEleven;
        } else if (pEleven.center.x == ikTwo) {
            wTwo = cEleven;
        } else if (pEleven.center.x == ikThree) {
            wThree = cEleven;
        } else if (pEleven.center.x == ikFour) {
            wFour = cEleven;
        }
    }
    
    if (pTwelve.center.y == iktOne) {
        if (pTwelve.center.x == ikOne) {
            wOne = cTwelve;
        } else if (pTwelve.center.x == ikTwo) {
            wTwo = cTwelve;
        } else if (pTwelve.center.x == ikThree) {
            wThree = cTwelve;
        } else if (pTwelve.center.x == ikFour) {
            wFour = cTwelve;
        }
    }
    
    if (pThirteen.center.y == iktOne) {
        if (pThirteen.center.x == ikOne) {
            wOne = cThirteen;
        } else if (pThirteen.center.x == ikTwo) {
            wTwo = cThirteen;
        } else if (pThirteen.center.x == ikThree) {
            wThree = cThirteen;
        } else if (pThirteen.center.x == ikFour) {
            wFour = cThirteen;
        }
    }
    
    if (pFourteen.center.y == iktOne) {
        if (pFourteen.center.x == ikOne) {
            wOne = cFourteen;
        } else if (pFourteen.center.x == ikTwo) {
            wTwo = cFourteen;
        } else if (pFourteen.center.x == ikThree) {
            wThree = cFourteen;
        } else if (pFourteen.center.x == ikFour) {
            wFour = cFourteen;
        }
    }
    
    if (pFithteen.center.y == iktOne) {
        if (pFithteen.center.x == ikOne) {
            wOne = cFithteen;
        } else if (pFithteen.center.x == ikTwo) {
            wTwo = cFithteen;
        } else if (pFithteen.center.x == ikThree) {
            wThree = cFithteen;
        } else if (pFithteen.center.x == ikFour) {
            wFour = cFithteen;
        }
    }
    
    if (pSixteen.center.y == iktOne) {
        if (pSixteen.center.x == ikOne) {
            wOne = cSixteen;
        } else if (pSixteen.center.x == ikTwo) {
            wTwo = cSixteen;
        } else if (pSixteen.center.x == ikThree) {
            wThree = cSixteen;
        } else if (pSixteen.center.x == ikFour) {
            wFour = cSixteen;
        }
    }
    
    NSString *Ones = [NSString stringWithFormat:@"%c", wOne];
    NSString *Twos = [NSString stringWithFormat:@"%c", wTwo];
    NSString *Threes = [NSString stringWithFormat:@"%c", wThree];
    NSString *Fours = [NSString stringWithFormat:@"%c", wFour];
    
    Word = [NSString stringWithFormat:@"%@%@%@%@", Ones, Twos, Threes, Fours];
    TheCurrentWord.text = [Word uppercaseString];
    
    pOne.center = CGPointMake(xOne, yOne);
    pTwo.center = CGPointMake(xTwo, yTwo);
    pThree.center = CGPointMake(xThree, yThree);
    pFour.center = CGPointMake(xFour, yFour);
    pFive.center = CGPointMake(xFive, yFive);
    pSix.center = CGPointMake(xSix, ySix);
    pSeven.center = CGPointMake(xSeven, ySeven);
    pEight.center = CGPointMake(xEight, yEight);
    pNine.center = CGPointMake(xNine, yNine);
    pTen.center = CGPointMake(xTen, yTen);
    pEleven.center = CGPointMake(xEleven, yEleven);
    pTwelve.center = CGPointMake(xTwelve, yTwelve);
    pThirteen.center = CGPointMake(xThirteen, yThirteen);
    pFourteen.center = CGPointMake(xFourteen, yFourteen);
    pFithteen.center = CGPointMake(xFithteen, yFithteen);
    pSixteen.center = CGPointMake(xSixteen, ySixteen);
}

//\/\/\/\/\///\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

#pragma Mark Pause & Game Switch

-(IBAction)Pause:(id)sender
{
    
    [Pause setImage:[UIImage imageNamed:@"PausePop.png"] forState:UIControlStateNormal];
    [SoundTwo play];
    
    Pause.userInteractionEnabled = NO;
    Check.userInteractionEnabled = NO;
    PauseDisplay.transform =CGAffineTransformMakeScale(1.3,1.3);
    Play.transform =CGAffineTransformMakeScale(1.3,1.3);
    CurrentWords.transform =CGAffineTransformMakeScale(1.3,1.3);
    Home.transform =CGAffineTransformMakeScale(1.3,1.3);
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplay.alpha = 1.0;
        
        CurrentWords.alpha = 1;
        Play.alpha = 1;
        Home.alpha = 1;
        
        Pause.alpha = 0;
        TotalAmount.alpha = 0;
        SenderDisplay.alpha = 0;
        BarUnderWord.alpha = 0;
        TheCurrentWord.alpha = 0;
        Check.alpha = 0;
        
        PauseDisplay.transform =CGAffineTransformMakeScale(1.0,1.0);
        Home.transform =CGAffineTransformMakeScale(1.0,1.0);
        Play.transform =CGAffineTransformMakeScale(1.0,1.0);
        CurrentWords.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        Pause.transform =CGAffineTransformMakeScale(1.3,1.3);
        TotalAmount.transform =CGAffineTransformMakeScale(1.3,1.3);
        SenderDisplay.transform =CGAffineTransformMakeScale(1.3,1.3);
        BarUnderWord.transform =CGAffineTransformMakeScale(1.3,1.3);
        TheCurrentWord.transform =CGAffineTransformMakeScale(1.3,1.3);
        Check.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        [pOne setAlpha:0];
        [pTwo setAlpha:0];
        [pThree setAlpha:0];
        [pFour setAlpha:0];
        [pFive setAlpha:0];
        [pSix setAlpha:0];
        [pSeven setAlpha:0];
        [pEight setAlpha:0];
        [pNine setAlpha:0];
        [pTen setAlpha:0];
        [pEleven setAlpha:0];
        [pTwelve setAlpha:0];
        [BarUnderWord setAlpha:0];
        [pThirteen setAlpha:0];
        [pFourteen setAlpha:0];
        [pFithteen setAlpha:0];
        [pSixteen setAlpha:0];
    }];
    
    BOOL SomethingOneView = NO;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        WordScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(210, 440, 360, 320)];
        
    } else {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        
        if (screenHeight == 480) {
            // do iPhone 4s stuff
            WordScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 160, 220, 180)];
            
        } else if (screenHeight == 568) {
            // do iPhone 5, 5s, 5c stuff
            WordScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 230, 220, 180)];
            
        } else if (screenHeight == 667) {
            // do iPhone 6 stuff
            WordScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(86, 265, 220, 220)];
            
        } else if (screenHeight == 736) {
            //do iPhone 6 plus stuff
            WordScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 260, 250, 250)];
            
        }
    }

    WordScroller.scrollEnabled = YES;
    WordScroller.userInteractionEnabled = YES;
    WordScroller.backgroundColor = [UIColor blackColor];
    WordScroller.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    WordScroller.showsHorizontalScrollIndicator = YES;
    [self.view insertSubview:WordScroller aboveSubview:PauseDisplay];
    if (Score > 0) {
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
                    if (WordIsAlreadyDone[i] == YES) {
                        SomethingOneView = YES;
                        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                        for (UIView *v in WordScroller.subviews) {
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
                            WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, (z * 60) + 50);
                            lbl.text = [str capitalizedString];
                            lbl.textColor = [UIColor whiteColor];
                            lbl.font = [lbl.font fontWithSize:25];
                            [WordScroller addSubview:lbl];
                        }
                    }

                    
                } else {
                    CGRect screenRect = [[UIScreen mainScreen] bounds];
                    CGFloat screenHeight = screenRect.size.height;
                    
                    if (screenHeight == 480) {
                        // do iPhone 4s stuff
                        if (WordIsAlreadyDone[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScroller.subviews) {
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
                                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScroller addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 568) {
                        // do iPhone 5, 5s, 5c stuff
                        if (WordIsAlreadyDone[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScroller.subviews) {
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
                                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScroller addSubview:lbl];
                            }
                        }

                        
                    } else if (screenHeight == 667) {
                        // do iPhone 6 stuff
                        if (WordIsAlreadyDone[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScroller.subviews) {
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
                                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:20];
                                [WordScroller addSubview:lbl];
                            }
                        }
                        
                    } else if (screenHeight == 736) {
                        //do iPhone 6 plus stuff
                        if (WordIsAlreadyDone[i] == YES) {
                            SomethingOneView = YES;
                            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, (z*60), 100, 25)];
                            for (UIView *v in WordScroller.subviews) {
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
                                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, (z * 60) + 50);
                                lbl.text = [str capitalizedString];
                                lbl.textColor = [UIColor whiteColor];
                                lbl.font = [lbl.font fontWithSize:22];
                                [WordScroller addSubview:lbl];
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
            [WordScroller addSubview:lbll];
            WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, lbll.center.y + 50);
            
        } else {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            
            if (screenHeight == 480) {
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScroller addSubview:lbll];
                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 568) {
                // do iPhone 5, 5s, 5c stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScroller addSubview:lbll];
                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 667) {
                // do iPhone 6 stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScroller addSubview:lbll];
                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, lbll.center.y + 50);
                
            } else if (screenHeight == 736) {
                //do iPhone 6 plus stuff
                UILabel *lbll = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 30)];
                lbll.text = @"YOU HAVE NO WORDS";
                lbll.textColor = [UIColor whiteColor];
                lbll.font = [lbll.font fontWithSize:20];
                [WordScroller addSubview:lbll];
                WordScroller.contentSize = CGSizeMake(WordScroller.bounds.size.width, lbll.center.y + 50);
            }
        }
    }
}

-(IBAction)Play:(id)sender
{
    [SoundOne play];
    [SoundTwo play];
    
    for (UIView *v in WordScroller.subviews) {
        [v removeFromSuperview];
    }
    [WordScroller removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplay.alpha = 0;
        Home.alpha = 0;
        Play.alpha = 0;
        CurrentWords.alpha = 0;
        
        Check.userInteractionEnabled = YES;
        Pause.userInteractionEnabled = YES;
        
        Pause.alpha = 1;
        TotalAmount.alpha = 1;
        SenderDisplay.alpha =1;
        BarUnderWord.alpha = 1;
        TheCurrentWord.alpha =1;
        Check.alpha = 1;
        
        PauseDisplay.transform =CGAffineTransformMakeScale(1.3,1.3);
        Play.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWords.transform =CGAffineTransformMakeScale(1.3,1.3);
        Home.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        Pause.transform =CGAffineTransformMakeScale(1.0,1.0);
        TotalAmount.transform =CGAffineTransformMakeScale(1.0,1.0);
        SenderDisplay.transform =CGAffineTransformMakeScale(1.0,1.0);
        BarUnderWord.transform =CGAffineTransformMakeScale(1.0,1.0);
        Check.transform =CGAffineTransformMakeScale(1.0,1.0);
        TheCurrentWord.transform =CGAffineTransformMakeScale(1.0,1.0);
        
        [pOne setAlpha:1];
        [pTwo setAlpha:1];
        [pThree setAlpha:1];
        [pFour setAlpha:1];
        [pFive setAlpha:1];
        [pSix setAlpha:1];
        [pSeven setAlpha:1];
        [pEight setAlpha:1];
        [pNine setAlpha:1];
        [pTen setAlpha:1];
        [pEleven setAlpha:1];
        [pTwelve setAlpha:1];
        [BarUnderWord setAlpha:1];
        [pThirteen setAlpha:1];
        [pFourteen setAlpha:1];
        [pFithteen setAlpha:1];
        [pSixteen setAlpha:1];
        
    }];
}

-(IBAction)Home:(id)sender
{
    [SoundOne play];
    [SoundTwo play];
    
    for (UIView *v in WordScroller.subviews) {
        [v removeFromSuperview];
    }
    [WordScroller removeFromSuperview];
    for (int i = 0; i <= 3822; i++) {
        @autoreleasepool {
            WordIsAlreadyDone[i] = NO;
        }
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        PauseDisplay.alpha = 0;
        Home.alpha = 0;
        Play.alpha = 0;
        CurrentWords.alpha = 0;
        
        Check.userInteractionEnabled = YES;
        Pause.userInteractionEnabled = YES;
        
        PauseDisplay.transform =CGAffineTransformMakeScale(1.3,1.3);
        Play.transform =CGAffineTransformMakeScale(1.3,1.3);
        CurrentWords.transform =CGAffineTransformMakeScale(1.3,1.3);
        Home.transform =CGAffineTransformMakeScale(1.3,1.3);
        
        Pause.transform =CGAffineTransformMakeScale(1.0,1.0);
        TotalAmount.transform =CGAffineTransformMakeScale(1.0,1.0);
        SenderDisplay.transform =CGAffineTransformMakeScale(1.0,1.0);
        BarUnderWord.transform =CGAffineTransformMakeScale(1.0,1.0);
        Check.transform =CGAffineTransformMakeScale(1.0,1.0);
        TheCurrentWord.transform =CGAffineTransformMakeScale(1.0,1.0);
        }];
    
    [pOne setAlpha:0];
    [pTwo setAlpha:0];
    [pThree setAlpha:0];
    [pFour setAlpha:0];
    [pFive setAlpha:0];
    [pSix setAlpha:0];
    [pSeven setAlpha:0];
    [pEight setAlpha:0];
    [pNine setAlpha:0];
    [pTen setAlpha:0];
    [pEleven setAlpha:0];
    [pTwelve setAlpha:0];
    [BarUnderWord setAlpha:0];
    [pThirteen setAlpha:0];
    [pFourteen setAlpha:0];
    [pFithteen setAlpha:0];
    [pSixteen setAlpha:0];
    [TheCurrentWord setAlpha:0];
    [Check setAlpha:0];
    [Pause setAlpha:0];
    [SenderDisplay setAlpha:0];
    [TotalAmount setAlpha:0];
    [self BackToHome];
}

-(void)BackToHome
{
    [TileOne removeFromSuperview];
    [TileTwo removeFromSuperview];
    [TileThree removeFromSuperview];
    [TileFour removeFromSuperview];
    [TileFive removeFromSuperview];
    [TileSix removeFromSuperview];
    [TileSeven removeFromSuperview];
    [TileEight removeFromSuperview];
    [TileNine removeFromSuperview];
    [TileTen removeFromSuperview];
    [TileEleven removeFromSuperview];
    [TileTwelve removeFromSuperview];
    [TileThirteen removeFromSuperview];
    [TileFourteen removeFromSuperview];
    [TileFithteen removeFromSuperview];
    [TileSixteen removeFromSuperview];
    
    mover = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(MovingTheObjectsBack) userInfo:nil repeats:YES];
    
    Score = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:0.0f];
    [UIView setAnimationDuration:1.5f];
    
    [tHome setAlpha:1];
    
    [sOne setAlpha:1];
    [sTwo setAlpha:1];
    [sThree setAlpha:1];
    [sFour setAlpha:1];
    [sFive setAlpha:1];
    [sSix setAlpha:1];
    [sSeven setAlpha:1];
    [sEight setAlpha:1];
    [sNine setAlpha:1];
    [sTen setAlpha:1];
    [sEleven setAlpha:1];
    [sTwelve setAlpha:1];
    [sThirteen setAlpha:1];
    [sFourteen setAlpha:1];
    [sFithteen setAlpha:1];
    
    [UIView commitAnimations];
    
    pOne.center = CGPointMake(ikOne, iktOne);
    pTwo.center = CGPointMake(ikTwo, iktTwo);
    pThree.center = CGPointMake(ikThree, iktThree);
    pFour.center = CGPointMake(ikFour, iktFour);
    pFive.center = CGPointMake(ikFive, iktFive);
    pSix.center = CGPointMake(ikSix, iktSix);
    pSeven.center = CGPointMake(ikSeven, iktSeven);
    pEight.center = CGPointMake(ikEight, iktEight);
    pNine.center = CGPointMake(ikNine, iktNine);
    pTen.center = CGPointMake(ikTen, iktTen);
    pEleven.center = CGPointMake(ikEleven, iktEleven);
    pTwelve.center = CGPointMake(ikTwelve, iktTwelve);
    pThirteen.center = CGPointMake(ikThirteen, iktThirteen);
    pFourteen.center = CGPointMake(ikFourteen, iktFourteen);
    pFithteen.center = CGPointMake(ikFithteen, iktFithteen);
    pSixteen.center = CGPointMake(ikSixteen, iktSixteen);
}

-(void)MovingTheObjectsBack
{
    int a;
    a = 1;
    
    sOne.center = CGPointMake(sOne.center.x, sOne.center.y + a);
    sTwo.center = CGPointMake(sTwo.center.x , sTwo.center.y + a);
    sThree.center = CGPointMake(sThree.center.x , sThree.center.y + a);
    sFour.center = CGPointMake(sFour.center.x , sFour.center.y + a);
    sFive.center = CGPointMake(sFive.center.x , sFive.center.y + a);
    sSix.center = CGPointMake(sSix.center.x , sSix.center.y + a);
    sSeven.center = CGPointMake(sSeven.center.x , sSeven.center.y + a);
    sEight.center = CGPointMake(sEight.center.x , sEight.center.y + a);
    sNine.center = CGPointMake(sNine.center.x , sNine.center.y + a);
    sTen.center = CGPointMake(sTen.center.x , sTen.center.y + a);
    sEleven.center = CGPointMake(sEleven.center.x , sEleven.center.y + a);
    sTwelve.center = CGPointMake(sTwelve.center.x , sTwelve.center.y + a);
    sThirteen.center = CGPointMake(sThirteen.center.x , sThirteen.center.y + a);
    sFourteen.center = CGPointMake(sFourteen.center.x , sFourteen.center.y + a);
    sFithteen.center = CGPointMake(sFithteen.center.x , sFithteen.center.y + a);
    
    if (sNine.center.y >= kSelection) {
        [mover invalidate];
        mover = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        }
}

-(IBAction)gTwo:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOne setAlpha:0];
    [sTwo setAlpha:0];
    [sThree setAlpha:0];
    [sFour setAlpha:0];
    [sFive setAlpha:0];
    [sSix setAlpha:0];
    [sSeven setAlpha:0];
    [sEight setAlpha:0];
    [sNine setAlpha:0];
    [sTen setAlpha:0];
    [sEleven setAlpha:0];
    [sTwelve setAlpha:0];
    [sThirteen setAlpha:0];
    [sFourteen setAlpha:0];
    [sFithteen setAlpha:0];
    [UIView commitAnimations];
    BackGroundThree.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOne.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameTwo) withObject:nil afterDelay:1];
}

-(void)GoToGameTwo
{
    [self performSegueWithIdentifier:@"QuestionGridsFour" sender:self];
}

-(IBAction)gThree:(id)sender
{
    self.view.userInteractionEnabled = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [sOne setAlpha:0];
    [sTwo setAlpha:0];
    [sThree setAlpha:0];
    [sFour setAlpha:0];
    [sFive setAlpha:0];
    [sSix setAlpha:0];
    [sSeven setAlpha:0];
    [sEight setAlpha:0];
    [sNine setAlpha:0];
    [sTen setAlpha:0];
    [sEleven setAlpha:0];
    [sTwelve setAlpha:0];
    [sThirteen setAlpha:0];
    [sFourteen setAlpha:0];
    [sFithteen setAlpha:0];
    [UIView commitAnimations];
    BackGroundTwo.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        BackGroundOne.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0 animations:^{
                             BackGroundOne.alpha = 0;
                         }];
                     }];
    [self performSelector:@selector(GoToGameThree) withObject:nil afterDelay:1];
}

-(void)GoToGameThree
{
    [self performSegueWithIdentifier:@"GTChoiceFour" sender:self];
}

-(IBAction)tHome:(id)sender
{
    [SoundOne play];
    [SoundTwo play];
    
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.1 animations:^{
        BackGroundFour.alpha = 0;
        BackGroundFour.transform = CGAffineTransformMakeScale(0.001, 0.001);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1 animations:^{
                             BackGroundFour.alpha = 1;
                             BackGroundFour.transform = CGAffineTransformMakeScale(1, 1);
                         }];
                     }];
     [self performSelector:@selector(GoToHome) withObject:nil afterDelay:1];
}

-(void)GoToHome
{
     [self performSegueWithIdentifier:@"GoingToHomeFromFourGrids" sender:self];
}

@end
