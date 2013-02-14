//
//  SampleForCellWithDetail.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForCellWithDetail.h"

@implementation SampleForCellWithDetail

static NSString* kCellStyleDefault = @"style-default";
static NSString* kCellStyleValue1 = @"style-value1";
static NSString* kCellStyleValue2 = @"style-value2";
static NSString* kCellStyleSubtitle = @"style-subtitle";

- (void)dealloc {
  [details_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 상세정보용 텍스트 설정
  details_ = [[NSArray alloc] initWithObjects:@"원숭이",
                                              @"강아지",
                                              @"사자",
                                              @"코끼리",
                                              nil];
  // 셀 스타일 디폴트 설정
  cellStyle_ = UITableViewCellStyleSubtitle;
  // 네비게이션 바에 버튼을 추가 
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"CellStyle"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(buttonDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  NSString* identifier;
  switch ( cellStyle_ ) {
    case UITableViewCellStyleValue1: identifier = kCellStyleValue1; break;
    case UITableViewCellStyleValue2: identifier = kCellStyleValue2; break;
    case UITableViewCellStyleSubtitle: identifier = kCellStyleSubtitle; break;
    default: identifier = kCellStyleDefault; break;
  }
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:cellStyle_
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  // dataSource_에 각 셀에 표시하기 위한 문자열이 저장되어 있다고 한다	
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  // images_에 각 셀에 표시하기 위한 이미지가 저장되어 있다고 한다	
  cell.imageView.image = [images_ objectAtIndex:indexPath.row];
  // details_에 각 셀에 표시하기 위한 상세 정보용 문자열이 저장되어 있다고 한다	
  cell.detailTextLabel.text = [details_ objectAtIndex:indexPath.row];
  return cell;
}

- (void)buttonDidPush {
  if ( UITableViewCellStyleSubtitle < ++cellStyle_ ) {
    cellStyle_ = UITableViewCellStyleDefault;
  } 
  [self.tableView reloadData];
}

@end
