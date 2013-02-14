//
//  SampleForLineBreak.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForLineBreak.h"

@implementation LineBreakTest

- (id)initWithLineBreakMode:(UILineBreakMode)mode {
  if ( (self = [super init]) ) {
    lineBreakMode_ = mode;
    self.backgroundColor = [UIColor whiteColor];    
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"UIKit용으로 추가된 NSString의 InstanceMethod를 사용해 문자열을 출력해 보자. 아주 아주 긴 문자열을 사용해 보자.";
  UIFont* systemFont = [UIFont systemFontOfSize:18];
  [message drawInRect:rect
              withFont:systemFont
         lineBreakMode:lineBreakMode_];
}

@end

@implementation SampleForLineBreak

- (void)viewDidLoad {
  [super viewDidLoad];

  LineBreakTest* test1 =
    [[[LineBreakTest alloc] initWithLineBreakMode:UILineBreakModeWordWrap] autorelease];
  test1.frame = CGRectMake( 0, 10, 320, 45 );
  [self.view addSubview:test1];

  LineBreakTest* test2 =
    [[[LineBreakTest alloc] initWithLineBreakMode:UILineBreakModeCharacterWrap] autorelease];
  test2.frame = CGRectMake( 0, 80, 320, 45 );
  [self.view addSubview:test2];

  LineBreakTest* test3 =
    [[[LineBreakTest alloc] initWithLineBreakMode:UILineBreakModeClip] autorelease];
  test3.frame = CGRectMake( 0, 150, 320, 45 );
  [self.view addSubview:test3];

  LineBreakTest* test4 =
    [[[LineBreakTest alloc] initWithLineBreakMode:UILineBreakModeHeadTruncation] autorelease];
  test4.frame = CGRectMake( 0, 220, 320, 45 );
  [self.view addSubview:test4];

  LineBreakTest* test5 =
    [[[LineBreakTest alloc] initWithLineBreakMode:UILineBreakModeTailTruncation] autorelease];
  test5.frame = CGRectMake( 0, 290, 320, 45 );
  [self.view addSubview:test5];

  LineBreakTest* test6 =
    [[[LineBreakTest alloc] initWithLineBreakMode:UILineBreakModeMiddleTruncation] autorelease];
  test6.frame = CGRectMake( 0, 360, 320, 45 );
  [self.view addSubview:test6];
}

@end
