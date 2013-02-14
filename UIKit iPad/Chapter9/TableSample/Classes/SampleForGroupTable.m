//
//  SampleForGroupTable.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForGroupTable.h"

@implementation SampleForGroupTable

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
    self.title = @"GroupTable";  //< 하는 김에 타이틀도 바꾸어 둔다
  }
  return self;
}

@end
