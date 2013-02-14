//
//  SampleForCellWithImage.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForCellWithImage.h"

@implementation SampleForCellWithImage

- (void)dealloc {
  [images_ release];  
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
  images_ = [[NSMutableArray alloc] initWithCapacity:8];
  // 각 데이터와 같은 이름의 png파일을 읽어들여서 보관유지해 둔다
  for ( NSString* name in dataSource_ ) {
    NSString* imageName = [NSString stringWithFormat:@"%@.png", name];
    UIImage* image = [UIImage imageNamed:imageName];
    [images_ addObject:image];
  }
}

- (NSInteger)tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section {
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  // 셀의 imageView 프로퍼티에 이미지를 설정	
  cell.imageView.image = [images_ objectAtIndex:indexPath.row];
  return cell;
}

@end
