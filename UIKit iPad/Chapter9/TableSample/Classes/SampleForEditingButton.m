//
//  SampleForEditingButton.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForEditingButton.h"

@implementation SampleForEditingButton

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              nil ];
  self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.tableView.editing = NO;
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
  if ( editing ) {
    // 편집모드로 들어가므로「신규추가」를 추가
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count inSection:0];
    [dataSource_ addObject:@"신규추가"];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
  } else {
    // 편집모드가 끝나므로「신규추가」를 삭제
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count-1 inSection:0];
    [dataSource_ removeLastObject];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
  }
  [super setEditing:editing animated:YES];
}

@end
