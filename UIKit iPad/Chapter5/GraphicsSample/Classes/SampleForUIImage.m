//
//  SampleForUIImage.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForUIImage.h"

@implementation DrawImageTest

- (void)dealloc {
  [image_ release];
  [super dealloc];
}

- (id)initWithImage:(UIImage*)image {
  if ( (self = [super init]) ) {
    image_ = image;    
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  [image_ drawAtPoint:rect.origin];
  //[image_ drawInRect:rect];
}

@end

@implementation SampleForUIImage

- (void)viewDidLoad {
  [super viewDidLoad];

  // 이미지 파일의 읽기
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  // 원본 View의 작성
  DrawImageTest* test = [[[DrawImageTest alloc] initWithImage:image] autorelease];
  test.frame = self.view.bounds;
  test.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:test];
}

@end
