//
//  SampleForSizeWithFont.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForSizeWithFont.h"

@implementation SizeWithFontTest

- (id)init {
  if ( (self = [super init]) ) {
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
    @"sizeWithFont:메소드로, 문자열을 출력하기 위해 필요한 크기 계산을 할 수 있다.";
  UIFont* systemFont = [UIFont systemFontOfSize:18];
  CGFloat actualFontSize;
  [message drawAtPoint:rect.origin
              forWidth:rect.size.width
              withFont:systemFont
           minFontSize:6
        actualFontSize:&actualFontSize
         lineBreakMode:UILineBreakModeWordWrap
    baselineAdjustment:UIBaselineAdjustmentAlignCenters];

  CGSize size;
  // 꽉차게 썼을 때 필요한 가로폭을 요구하고 싶은 경우
  size = [message sizeWithFont:systemFont];
  NSLog( @"●sizeWithFont:의 실행결과" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 가로폭에 제한을 두는 경우 (여러행을 지원하지 않는 경우)
  size = [message sizeWithFont:systemFont
                      forWidth:rect.size.width
                 lineBreakMode:UILineBreakModeTailTruncation];
  NSLog( @"●sizeWithFont:forWidth:lineBreakMode:의 실행결과" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 가로폭과 세로폭에 제한을 두는 경우(여러 행을 지원)
  size = [message sizeWithFont:systemFont constrainedToSize:rect.size];
  NSLog( @"●sizeWithFont:constrainedToSize:의 실행결과" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 가로폭과 세로폭에 제한을 두는 한편 개행/생략 방법도 지정하는 경우
  size = [message sizeWithFont:systemFont
             constrainedToSize:rect.size
                 lineBreakMode:UILineBreakModeCharacterWrap];
  NSLog( @"●sizeWithFont:constrainedToSize:lineBreakMode:의 실행결과" );
  NSLog( @"size = %f, %f", size.width, size.height );
  // 폰트의 자동 축소를 사용하는 경우
  size = [message sizeWithFont:systemFont
             minFontSize:6
          actualFontSize:&actualFontSize
                forWidth:rect.size.width
                 lineBreakMode:UILineBreakModeWordWrap];
  NSLog( @"●sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:의 실행결과" );
  NSLog( @"size = %f, %f", size.width, size.height );
  NSLog( @"actualFontSize = %f", actualFontSize );
}

@end

@implementation SampleForSizeWithFont

- (void)viewDidLoad {
  [super viewDidLoad];

  SizeWithFontTest* test1 =
    [[[SizeWithFontTest alloc] init] autorelease];
  test1.frame = CGRectMake( 0, 10, 320, 66 );
  [self.view addSubview:test1];

//  SizeWithFontTest* test2 =
//    [[[SizeWithFontTest alloc] init] autorelease];
//  test2.frame = CGRectMake( 0, 70, 320, 40 );
//  [self.view addSubview:test2];

//  SizeWithFontTest* test3 =
//    [[[SizeWithFontTest alloc] init] autorelease];
//  test3.frame = CGRectMake( 0, 130, 320, 40 );
//  [self.view addSubview:test3];
}

@end
