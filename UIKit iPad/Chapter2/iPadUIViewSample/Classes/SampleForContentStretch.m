//
//  SampleForContentStretch.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForContentStretch.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForContentStretch ()
- (void)originDidPush;
- (void)sizeDidPush;
- (void)changeLabelCaption;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForContentStretch

// finalize
- (void)dealloc {
  [imageView_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  rect_ = CGRectMake( 0.0, 0.0, 1.0, 1.0 );

  // 배경을 검정색으로
  self.view.backgroundColor = [UIColor blackColor];

  // 이미지 View를 추가
  NSString* path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"dog.jpg"];
  UIImage* image = [[[UIImage alloc] initWithContentsOfFile:path] autorelease];

  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.frame = CGRectMake( 0, 0, 320, 320 );
  imageView_.contentMode = UIViewContentModeScaleAspectFit;
  imageView_.contentStretch = rect_;
  [self.view addSubview:imageView_];

  // 라벨을 추가
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 60 )];
  CGPoint newPoint = imageView_.center;
  newPoint.y += 190;
  label_.center = newPoint;
  label_.textAlignment = UITextAlignmentCenter;

  [self.view addSubview:label_];
  [self changeLabelCaption];

  // origin 변경 버튼을 추가
  UIButton* originChange = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  originChange.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 40;
  originChange.center = newPoint;
  [originChange setTitle:@"origin" forState:UIControlStateNormal];
  [originChange addTarget:self
                action:@selector(originDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // size 변경 버튼을 추가
  UIButton* sizeChange = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  sizeChange.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint = originChange.center;
  newPoint.x += 100;
  sizeChange.center = newPoint;
  [sizeChange setTitle:@"size" forState:UIControlStateNormal];
  [sizeChange addTarget:self
                action:@selector(sizeDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:originChange];
  [self.view addSubview:sizeChange];
}

#pragma mark ----- Private Methods -----

- (void)originDidPush {
  if ( 0.99 < rect_.origin.x ) {
    rect_.origin.x = 0.0;
    rect_.origin.y = 0.0;
  } else {
    rect_.origin.x += 0.1;
    rect_.origin.y += 0.1;
  }
  imageView_.contentStretch = rect_;
  [self changeLabelCaption];
}

- (void)sizeDidPush {
  if ( 0.09 > rect_.size.width ) {
    rect_.size.width = 1.0;
    rect_.size.height = 1.0;
  } else {
    rect_.size.width -= 0.1;
    rect_.size.height -= 0.1;
  }
  imageView_.contentStretch = rect_;
  [self changeLabelCaption];
}

- (void)changeLabelCaption {
  label_.numberOfLines = 2;
  label_.text = [NSString stringWithFormat:@"x = %f, y = %f, \r\nw = %f, h = %f",
                            rect_.origin.x, rect_.origin.y, rect_.size.width, rect_.size.height];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
