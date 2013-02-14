//
//  RootViewController.m
//
//  Created by ToKoRo on 2009-08-24.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

#pragma mark UIViewController methods

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"MENU";
  if ( !items_ ) {
    items_ = [[NSArray alloc] initWithObjects:
                                @"SampleForSimple",
                                @"SampleForAlignment",
                                @"SampleForColor",
                                @"SampleForFont",
                                @"SampleForShadow",
                                @"SampleForAdjust",
                                @"SampleForMultiline",
                                @"SampleForLineBreak",
                                @"SampleForHighlighted",
                                @"SampleForTouch",
                                @"SampleForDrawTextOverride",
                                nil ];
  } 
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  return [items_ count];
}


- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  NSString* title = [items_ objectAtIndex:indexPath.row];
  cell.textLabel.text = [title stringByReplacingOccurrencesOfString:@"SampleFor" withString:@""];

  return cell;
}

- (void)tableView:(UITableView*)tableView
  didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
  NSString* className = [items_ objectAtIndex:indexPath.row];
  Class class = NSClassFromString( className );
  UIViewController* viewController = [[[class alloc] init] autorelease];
  if ( !viewController ) {
    NSLog( @"%@ was not found.", className );
    return;
  } 
  [self.navigationController pushViewController:viewController animated:YES];
}

@end
