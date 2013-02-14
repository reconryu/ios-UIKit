//
//  SampleForResponderChain.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForResponderChain.h"

#pragma mark ----- TouchableLabelForResponder -----

@interface TouchableLabelForResponder : UILabel
@end 

@implementation TouchableLabelForResponder

// 이번은、init메소드를 오버라이드해 둔다.
- (id)init {
  if ( (self = [super init]) ) {
    // userInteractionEnabled을 YES로 설정
    self.userInteractionEnabled = YES; 
    // 자동 크기 조절을 반복하지 않아도 되도록 여기서 해 둔다.
    self.autoresizingMask =  UIViewAutoresizingFlexibleWidth |
                             UIViewAutoresizingFlexibleHeight |
                             UIViewAutoresizingFlexibleLeftMargin |
                             UIViewAutoresizingFlexibleRightMargin |
                             UIViewAutoresizingFlexibleTopMargin |
                             UIViewAutoresizingFlexibleBottomMargin;
  }
  return self;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 터치를 검지하면 우선 라벨의 문자열을 로그 출력한다.
  NSLog( @"%@", self.text );
  // 단지, 이벤트는 그대로 다음 리스폰더에 넘긴다
  [self.nextResponder touchesBegan:touches withEvent:event];
}

@end 

#pragma mark ----- SampleForResponderChain -----

@implementation SampleForResponderChain

- (void)viewDidLoad {
  [super viewDidLoad];

  // ３개의 라벨 중 부모가 되는 것을 작성해, 화면에 추가한다.
  TouchableLabelForResponder* grandFather = [[[TouchableLabelForResponder alloc] init] autorelease];
  grandFather.frame = CGRectInset( self.view.bounds, 40, 20 );
  grandFather.text = @"A";
  grandFather.backgroundColor = [UIColor darkGrayColor];
  [self.view addSubview:grandFather];

  // ２번째의 라벨은, 위에 작성한 라벨에 추가한다.
  TouchableLabelForResponder* father = [[[TouchableLabelForResponder alloc] init] autorelease];
  father.frame = CGRectInset( grandFather.bounds, 40, 20 );
  father.text = @"B";
  father.backgroundColor = [UIColor grayColor];
  [grandFather addSubview:father];

  // ３번째 라벨은, 2번째 라벨에 추가한다.
  // 이것으로 라벨이 3단계로 된다.
  TouchableLabelForResponder* me = [[[TouchableLabelForResponder alloc] init] autorelease];
  me.frame = CGRectInset( father.bounds, 40, 20 );
  me.text = @"C";
  me.backgroundColor = [UIColor whiteColor];
  [father addSubview:me];
}

// 어떤 라벨도 이벤트를 처리하지 않는다면, 이곳에서 수신
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end
