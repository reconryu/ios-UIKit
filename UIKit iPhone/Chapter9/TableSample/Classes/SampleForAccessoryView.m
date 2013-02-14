//
//  SampleForAccessoryView.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForAccessoryView.h"

@implementation SampleForAccessoryView

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = nil;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  UIButton* button = [UIButton buttonWithType:UIButtonTypeInfoDark];
  [button addTarget:self
             action:@selector(infoDidPush)
   forControlEvents:UIControlEventTouchUpInside];

  cell.accessoryView = button;
  return cell;
}

- (void)infoDidPush {
  //UIViewController* viewController = [[ModalViewController alloc] init];
  //[self presentModalViewController:viewController animated:YES];
  //[viewController release];
}

@end
