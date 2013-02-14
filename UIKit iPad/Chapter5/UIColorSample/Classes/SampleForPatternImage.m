//
//  SampleForPatternImage.m
//
//  Created by ToKoRo on 2009-10-15.
//

#import "SampleForPatternImage.h"

@implementation SampleForPatternImage

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  UIImage* image = [UIImage imageNamed:@"dog.png"];
  label.backgroundColor = [UIColor colorWithPatternImage:image];
  [self.view addSubview:label];
}

@end
