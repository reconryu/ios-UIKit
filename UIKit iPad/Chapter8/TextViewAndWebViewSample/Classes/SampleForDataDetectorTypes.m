//
//  SampleForDataDetectorTypes.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForDataDetectorTypes.h"

@implementation SampleForDataDetectorTypes

- (void)viewDidLoad {
  [super viewDidLoad];

  // UITextView 붙이기
  UITextView* textView = [[[UITextView alloc] init] autorelease];
  textView.frame = self.view.bounds;
  textView.editable = NO; //< 이것도 필요
  textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.font = [UIFont systemFontOfSize:24];
  textView.text = @"상세한 내용은 이곳을↓\n"
                   "http://www.apple.com/\n"
                   "연락처: 090-0000-0000\n";
  textView.dataDetectorTypes = UIDataDetectorTypeAll;
  [self.view addSubview:textView];
	
}

@end
