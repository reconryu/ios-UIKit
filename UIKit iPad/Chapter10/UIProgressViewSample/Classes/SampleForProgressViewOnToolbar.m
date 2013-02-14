//
//  SampleForProgressViewOnToolbar.m
//
//  Created by ToKoRo on 2009-10-04.
//

#import "SampleForProgressViewOnToolbar.h"

#pragma mark ----- ProgressViewWithLabel -----

@implementation ProgressViewWithLabel

@synthesize progressView = progressView_;
@synthesize textLabel = textLabel_;

- (void)dealloc {
  [progressView_ release];
  [textLabel_ release];
  [super dealloc];
}

// 초기화처리
// UIProgressView와 UILabel을 작성해서 디폴트 값을 넣는다
- (id)init {
  if ( (self = [super init]) ) {
    self.opaque = NO;
    progressView_ =
      [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    textLabel_ = [[UILabel alloc] init];
    textLabel_.textAlignment = UITextAlignmentCenter;
    textLabel_.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    textLabel_.textColor = [UIColor whiteColor];
    textLabel_.font = [UIFont boldSystemFontOfSize:14];
    textLabel_.shadowColor = [UIColor blackColor];
    [self addSubview:progressView_];
    [self addSubview:textLabel_];
    self.frame = CGRectMake( 0, 0, progressView_.bounds.size.width, progressView_.bounds.size.height * 3 );
  }
  return self;
}

// 레이아웃 설정
// UIProgressView와 UILabel을 현재 상태에 따라서 다시 레이아웃 한다
- (void)layoutSubviews {
  CGRect newFrame = self.bounds;
  newFrame.size.height -= progressView_.frame.size.height;
  textLabel_.frame = newFrame;
  newFrame = progressView_.frame;
  newFrame.origin.y = self.bounds.size.height - newFrame.size.height;
  progressView_.frame = newFrame;
}

@end 

#pragma mark ----- Private Methods Definition -----

@interface SampleForProgressViewOnToolbar ()
- (void)updateProgress:(ProgressViewWithLabel*)component;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForProgressViewOnToolbar

- (void)dealloc {
  [component_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // component_을 위에서 작성한 ProgressViewWithLabel클래스를 보관유지할 인스턴스 메소드로 한다
  // 이것은 화면 클래스의 dealloc으로 release 할 것	
  component_ = [[ProgressViewWithLabel alloc] init];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithCustomView:component_] autorelease];;
  UIBarButtonItem* flexibleSpace =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil] autorelease];
  NSArray* items = [NSArray arrayWithObjects:flexibleSpace, barButton, flexibleSpace, nil];
  [self setToolbarItems:items animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self updateProgress:component_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  component_.hidden = YES;
}

- (void)updateProgress:(ProgressViewWithLabel*)component {
  if ( [component isHidden] || 1.0 <= component.progressView.progress ) {
    return;
  } 
 	
  component.progressView.progress += 0.1;
  component.textLabel.text =
    [NSString stringWithFormat:@"Downloading %.0f of 10", component.progressView.progress * 10];
  [self performSelector:@selector(updateProgress:)
             withObject:component
             afterDelay:1.0];
}

@end
