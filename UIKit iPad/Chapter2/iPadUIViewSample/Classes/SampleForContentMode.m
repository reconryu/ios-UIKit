//
//  SampleForContentMode.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForContentMode.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForContentMode ()
- (void)modeDidPush;
- (void)changeLabelCaption;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForContentMode

// finalize
- (void)dealloc {
  [imageView_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 배경을 검정색으로
  self.view.backgroundColor = [UIColor blackColor];

  // 이미지 View를 추가
  NSString* path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"narrow_dog.jpg"];
  UIImage* image = [[[UIImage alloc] initWithContentsOfFile:path] autorelease];

  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.frame = CGRectMake( 0, 0, 320, 320 );

  [self.view addSubview:imageView_];

  // 라벨을 추가
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 30 )];
  CGPoint newPoint = imageView_.center;
  newPoint.y += 200;
  label_.center = newPoint;
  label_.textAlignment = UITextAlignmentCenter;

  [self.view addSubview:label_];
  [self changeLabelCaption];

  // 모드변경 버튼을 추가
  UIButton* modeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  modeButton.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 40;
  modeButton.center = newPoint;
  [modeButton setTitle:@"모드변경" forState:UIControlStateNormal];
  [modeButton addTarget:self
                action:@selector(modeDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:modeButton];
}

#pragma mark ----- Private Methods -----

- (void)modeDidPush {
  imageView_.contentMode++;
  [self changeLabelCaption];
}

- (void)changeLabelCaption {
  if ( UIViewContentModeScaleToFill == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeScaleToFill";
  } else  if ( UIViewContentModeScaleAspectFit == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeScaleAspectFit";
  } else  if ( UIViewContentModeScaleAspectFill == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeScaleAspectFill";
  } else  if ( UIViewContentModeRedraw == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeRedraw";
  } else  if ( UIViewContentModeCenter == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeCenter";
  } else  if ( UIViewContentModeTop == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeTop";
  } else  if ( UIViewContentModeBottom == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeBottom";
  } else  if ( UIViewContentModeLeft == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeLeft";
  } else  if ( UIViewContentModeRight == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeRight";
  } else  if ( UIViewContentModeTopLeft == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeTopLeft";
  } else  if ( UIViewContentModeTopRight == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeTopRight";
  } else  if ( UIViewContentModeBottomLeft == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeBottomLeft";
  } else  if ( UIViewContentModeBottomRight == imageView_.contentMode ) {
    label_.text = @"UIViewContentModeBottomRight";
  } else {
    label_.text = @"else";
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
