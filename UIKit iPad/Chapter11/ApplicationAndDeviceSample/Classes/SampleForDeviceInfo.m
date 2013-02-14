//
//  SampleForDeviceInfo.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForDeviceInfo.h"

@implementation SampleForDeviceInfo

- (void)dealloc {
  [titles_ release];  
  [datas_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  titles_ = [[NSArray alloc] initWithObjects:
                              @"localizedModel",
                              @"model",
                              @"name",
                              @"systemName",
                              @"systemVersion",
                              nil];
  UIDevice* device = [UIDevice currentDevice];
  datas_ = [[NSArray alloc] initWithObjects:
                              device.localizedModel,
                              device.model,
                              device.name,
                              device.systemName,
                              device.systemVersion,
                              nil];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [titles_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  cell.textLabel.text = [titles_ objectAtIndex:indexPath.row];
  cell.detailTextLabel.text = [datas_ objectAtIndex:indexPath.row];
  return cell;
}

@end
