//
//  SampleForFontWithName.m
//
//  Created by ToKoRo on 2009-09-12.
//

#import "SampleForFontWithName.h"

@implementation SampleForFontWithName

- (void)dealloc {
  [familyNames_ release];
  [fontNames_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
    if ( !fontNames_ ) {
      fontNames_ = [[NSMutableDictionary alloc] initWithCapacity:32];
      familyNames_ = [[[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)] retain];
      for ( id familyName in familyNames_ ) {
        NSArray* fonts = [[UIFont fontNamesForFamilyName:familyName]
                                sortedArrayUsingSelector:@selector(compare:)];
        [fontNames_ setObject:fonts forKey:familyName];
      }
    } 
  }
  return self;
}

#pragma mark UITableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {

  return [fontNames_ count];
}

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  NSString* familyName = [familyNames_ objectAtIndex:section];
  return [[fontNames_ objectForKey:familyName] count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  NSString* familyName = [familyNames_ objectAtIndex:indexPath.section];
  NSArray* values =  [fontNames_ objectForKey:familyName];
  NSString* fontName = [values objectAtIndex:indexPath.row];
  cell.textLabel.text = fontName;

  UIFont* font = [UIFont fontWithName:fontName size:[UIFont labelFontSize]];
  cell.textLabel.font = font;

  return cell;
}

- (NSString*)tableView:(UITableView*)tableView
 titleForHeaderInSection:(NSInteger)section
{
  return [familyNames_ objectAtIndex:section];
}

@end
