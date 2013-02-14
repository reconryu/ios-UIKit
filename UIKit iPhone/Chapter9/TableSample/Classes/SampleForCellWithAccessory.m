//
//  SampleForCellWithAccessory.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForCellWithAccessory.h"

@implementation SampleForCellWithAccessory

- (void)viewDidLoad {
  [super viewDidLoad];
  // 네비게이션 바에 버튼을 추가
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"AccesoryType"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(buttonDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  // 주의 : 부모클래스에서 UITableViewCell 작성을 구현하고 있지 않은 경우는 여기에서 작성할 것 !
  // 여기에서는 부모 클래스에서 구현하고 있다고 가정하고 생략한다	
  UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = accessoryType_;
  return cell;
}

- (void)buttonDidPush {
  if ( UITableViewCellAccessoryCheckmark < ++accessoryType_ ) {
    accessoryType_ = UITableViewCellAccessoryNone;
  } 
  [self.tableView reloadData];
}

- (void)tableView:(UITableView*)tableView
  accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath
{
  // SampleForCellWithDetail은 별도 작성하는 상제 정보 화면
  UIViewController* viewController = [[SampleForCellWithDetail alloc] init];
  [self.navigationController pushViewController:viewController animated:YES];
  [viewController release];
}

@end
