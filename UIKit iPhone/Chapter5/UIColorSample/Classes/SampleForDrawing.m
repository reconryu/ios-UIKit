//
//  SampleForDrawing.m
//
//  Created by ToKoRo on 2009-10-15.
//

#import "SampleForDrawing.h"

@implementation MyView

- (void)drawRect:(CGRect)rect {

  UIImage* image = [UIImage imageNamed:@"dog.png"];
  UIColor* patternColor = [UIColor colorWithPatternImage:image];

  // 사각형 그리기
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextBeginPath( context );
  CGContextAddRect( context, rect );
  CGContextClosePath( context );
  [[UIColor grayColor] setStroke]; //< 화선의 색으로 회색을 설정
  [patternColor setFill]; //< 배경으로 패턴 이미지를 설정
  CGContextDrawPath( context, kCGPathEOFillStroke );

  // 문자열 출력
  [[UIColor blueColor] set]; //< 문자색을 파랑으로 설정
  [@"PRETTY DOGS" drawInRect:rect
                    withFont:[UIFont boldSystemFontOfSize:24]
               lineBreakMode:UILineBreakModeClip
                   alignment:UITextAlignmentCenter];
}

@end

@implementation SampleForDrawing

- (void)viewDidLoad {
  [super viewDidLoad];
  MyView* myView = [[[MyView alloc] init] autorelease];
  myView.frame = CGRectMake( 40, 40, 240, 240 );
  [self.view addSubview:myView];
}

@end


