//
//  SampleForViewForRow.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForViewForRow.h"

@implementation SampleForViewForRow

- (void)dealloc {
  [dataSource_ release];
  [picker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // UIPicker 작성/초기화
  picker_ = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0,320,216)];
  picker_.delegate = self;
  picker_.showsSelectionIndicator = YES;
  [self.view addSubview:picker_];
  // 피커에 표시할 UIImage 준비
  UIImage* imageDog = [UIImage imageNamed:@"Dog.png"];
  UIImage* imageMonkey = [UIImage imageNamed:@"Monkey.png"];
  UIImage* imageElephant = [UIImage imageNamed:@"Elephant.png"];
  UIImage* imageLion = [UIImage imageNamed:@"Lion.png"];
  NSArray* components1 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  NSArray* components2 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  NSArray* components3 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  dataSource_ = [[NSArray alloc] initWithObjects:components1, components2, components3, nil];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"정보표시" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3; //< 줄수를 반환한다
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 4; //< 행수를 반환한다
}

// 문자열이 아닌 UIView 서브클래스를 표시하고 싶은 경우에 이것을 사용한다
- (UIView*)pickerView:(UIPickerView*)pickerView
  viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView*)view
{
  UIImageView* imageView = (UIImageView*)view;
  // 인수 view가 재이용할 수 있는 경우는 그것을 그대로 사용한다	
  if ( !imageView ) {
	// 재이용할 수 없는 경우는 새롭게 만든다  
    UIImage* image = [[dataSource_ objectAtIndex:component] objectAtIndex:row];
    imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  }
  return imageView;
}

- (void)buttonDidPush {
  static const int kNumbersOfComponent = 3;
  NSMutableArray* items = [[NSMutableArray alloc] initWithCapacity:3];
  for ( int i = 0; i < kNumbersOfComponent; ++i ){
    UIImageView* imageView =
      (UIImageView*)[picker_ viewForRow:[picker_ selectedRowInComponent:i] forComponent:i];
    UIImageView* newImageView =
      [[[UIImageView alloc] initWithImage:imageView.image] autorelease];
    UIBarButtonItem* barButton =
      [[[UIBarButtonItem alloc] initWithCustomView:newImageView] autorelease];
    [items addObject:barButton];
  }
  [self setToolbarItems:items];
  [items release];
}

@end
