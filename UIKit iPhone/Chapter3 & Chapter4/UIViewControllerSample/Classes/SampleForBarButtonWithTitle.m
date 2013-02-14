//
//  SampleForBarButtonWithTitle.m
//
//  Created by ToKoRo on 2009-08-28.
//

#import "SampleForBarButtonWithTitle.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForBarButtonWithTitle ()
- (UIBarButtonItem*)barButtonItemWithStyle:(UIBarButtonItemStyle)style;
- (void)buttonDidPush:(id)sender;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForBarButtonWithTitle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"UIBarButtonItem";

  self.navigationItem.rightBarButtonItem =
    [self barButtonItemWithStyle:UIBarButtonItemStyleBordered];

  UIImage* image = [UIImage imageNamed:@"smile.png"];
  UIBarButtonItem* icon = [[[UIBarButtonItem alloc] initWithImage:image
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(buttonDidPush:)] autorelease];

  [self setToolbarItems:[NSArray arrayWithObjects:
          [self barButtonItemWithStyle:UIBarButtonItemStylePlain],
          [self barButtonItemWithStyle:UIBarButtonItemStyleBordered],
          [self barButtonItemWithStyle:UIBarButtonItemStyleDone],
          icon,
          nil]];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

#pragma mark ----- Private Methods -----

- (UIBarButtonItem*)barButtonItemWithStyle:(UIBarButtonItemStyle)style {
  NSString* title;
  switch ( style ) {
    case UIBarButtonItemStylePlain:
      title = @"Plain";
      break;
    case UIBarButtonItemStyleBordered:
      title = @"Bordered";
      break;
    default: //< UIBarButtonItemStyleDone
      title = @"Done";
      break;
  }
  UIBarButtonItem* button = [[[UIBarButtonItem alloc] initWithTitle:title
                                                              style:style
                                                             target:nil
                                                             action:nil] autorelease];
  return button;
}

- (void)buttonDidPush:(id)sender {
  if ( [sender isKindOfClass:[UIBarButtonItem class]] ) {
    UIBarButtonItem* item = sender;
    switch ( item.style ) {
      case UIBarButtonItemStylePlain:
        item.style = UIBarButtonItemStyleBordered;
        break;
      case UIBarButtonItemStyleBordered:
        item.style = UIBarButtonItemStyleDone;
        break;
      default: //< UIBarButtonItemStyleDone
        item.style = UIBarButtonItemStylePlain;
        break;
    }
  } 
}

@end
