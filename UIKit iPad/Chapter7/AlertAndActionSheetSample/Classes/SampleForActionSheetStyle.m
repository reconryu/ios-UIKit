//
//  SampleForActionSheetStyle.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForActionSheetStyle.h"

@implementation SampleForActionSheetStyle

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  actionSheetStyle_ = UIActionSheetStyleAutomatic;
  self.title = @"액션 시트";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  self.navigationItem.rightBarButtonItem = button;
  [button release];

  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = self.view.bounds;
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  imageView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:imageView];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  sheet.actionSheetStyle = actionSheetStyle_;
  sheet.title = @"UIActionSheetStyle을 선택해 주십시오";
  [sheet addButtonWithTitle:@"StyleDefault"];
  [sheet addButtonWithTitle:@"StyleBlackTranslucent"];
  [sheet addButtonWithTitle:@"StyleBlackOpaque"];
  [sheet addButtonWithTitle:@"Cancel"];
  sheet.cancelButtonIndex = 3;
  [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  switch ( buttonIndex ) {
    case 0:
      actionSheetStyle_ = UIActionSheetStyleDefault;
      break;
    case 1:
      actionSheetStyle_ = UIActionSheetStyleBlackTranslucent;
      break;
    case 2:
      actionSheetStyle_ = UIActionSheetStyleBlackOpaque;
      break;
    default:
      actionSheetStyle_ = UIActionSheetStyleAutomatic;
      break;
  }
}

@end
