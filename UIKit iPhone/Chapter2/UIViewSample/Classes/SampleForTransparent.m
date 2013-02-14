//
//  SampleForTransparent.m
//
//  Created by ToKoRo on 2009-08-11.
//

#import "SampleForTransparent.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForTransparent ()
- (void)alphaDidPush;
- (void)bgAlphaDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForTransparent

// finalize
- (void)dealloc {
  [labelParent_ release]; 
  [labelChild1_ release]; 
  [labelChild2_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 투과했을 때에 보이는 이미지를 추가
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = CGRectMake( 10, 10, 300, 300 );
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  imageView.clipsToBounds = YES;
  [self.view addSubview:imageView];

  // 부모가 되는 라벨을 추가
  labelParent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 300, 300 )];
  labelParent_.backgroundColor = [UIColor blackColor];
  labelParent_.textAlignment = UITextAlignmentCenter;
  labelParent_.text = @"Parent";
  [imageView addSubview:labelParent_];

  // 자식이 되는 라벨을 1개 추가
  labelChild1_ = [[UILabel alloc] initWithFrame:CGRectMake( 10, 190, 100, 100 )];
  labelChild1_.backgroundColor = [UIColor redColor];
  labelChild1_.textAlignment = UITextAlignmentCenter;
  labelChild1_.text = @"Child1";
  [labelParent_ addSubview:labelChild1_];

  // 자식이 되는 라벨을 2개 추가
  labelChild2_ = [[UILabel alloc] initWithFrame:CGRectMake( 190, 190, 100, 100 )];
  labelChild2_.backgroundColor = [UIColor blueColor];
  labelChild2_.textAlignment = UITextAlignmentCenter;
  labelChild2_.text = @"Child2";
  [labelParent_ addSubview:labelChild2_];

  // alpha 버튼을 추가
  UIButton* alphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  alphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 100;
  alphaButton.center = newPoint;
  [alphaButton setTitle:@"alpha" forState:UIControlStateNormal];
  [alphaButton addTarget:self
                  action:@selector(alphaDidPush)
        forControlEvents:UIControlEventTouchUpInside];


  // bgAlpha 버튼을 추가
  UIButton* bgAlphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  bgAlphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint.x += 100;
  bgAlphaButton.center = newPoint;
  [bgAlphaButton setTitle:@"bgAlpha" forState:UIControlStateNormal];
  [bgAlphaButton addTarget:self
                    action:@selector(bgAlphaDidPush)
          forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:alphaButton];
  [self.view addSubview:bgAlphaButton];
}

#pragma mark ----- Private Methods -----

- (void)alphaDidPush {
  labelParent_.backgroundColor = [UIColor blackColor];
  labelParent_.alpha = 0.25;
}

- (void)bgAlphaDidPush {
  labelParent_.alpha = 1.0;
  labelParent_.backgroundColor = [labelParent_.backgroundColor colorWithAlphaComponent:0.25];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
