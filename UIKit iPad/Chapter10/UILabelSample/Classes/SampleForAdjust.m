//
//  SampleForAdjust.m
//
//  Created by ToKoRo on 2009-08-25.
//

#import "SampleForAdjust.h"

@implementation SampleForAdjust

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Adjust";
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label0 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 10, 320, 40 )] autorelease];
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 60, 320, 40 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 110, 320, 40 )] autorelease];
  UILabel* label3 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 160, 320, 40 )] autorelease];
  UILabel* label4 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 210, 320, 40 )] autorelease];
  UILabel* label5 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 260, 320, 40 )] autorelease];

  label0.text = @"문장이 걸어져서 죄송합니다. 다음부터는 조심하겠습니다.";
  label1.text = @"문장이 걸어져서 죄송합니다. 다음부터는 조심하겠습니다.";
  label2.text = @"문장이 걸어져서 죄송합니다. 다음부터는 조심하겠습니다.";
  label3.text = @"UIBaselineAdjustmentAlignBaselines 문장이 걸어져서 죄송합니다.";
  label4.text = @"UIBaselineAdjustmentAlignCenters 문장이 걸어져서 죄송합니다.";
  label5.text = @"UIBaselineAdjustmentNone 문장이 걸어져서 죄송합니다.";

  label1.adjustsFontSizeToFitWidth = YES;

  label2.adjustsFontSizeToFitWidth = YES;
  label2.minimumFontSize = 14;

  label3.adjustsFontSizeToFitWidth = YES;
  label3.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;

  label4.adjustsFontSizeToFitWidth = YES;
  label4.baselineAdjustment = UIBaselineAdjustmentAlignCenters;

  label5.adjustsFontSizeToFitWidth = YES;
  label5.baselineAdjustment = UIBaselineAdjustmentNone;

  [self.view addSubview:label0];
  [self.view addSubview:label1];
  [self.view addSubview:label2];
  [self.view addSubview:label3];
  [self.view addSubview:label4];
  [self.view addSubview:label5];
}

@end
