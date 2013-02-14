//
//  SampleForModal.m
//
//  Created by ToKoRo on 2009-08-16.
//

#import "SampleForModal.h"

@implementation SampleForModal

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 모달 화면을 호출하기 위한 버튼을 추가
  UIButton* modalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [modalButton setTitle:@"모달 대화상자를 호출" forState:UIControlStateNormal];
  [modalButton sizeToFit];
  modalButton.center = self.view.center;
  [modalButton addTarget:self
                  action:@selector(modalDidPush)
        forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:modalButton];
}

- (void)modalDidPush {
  // 모달 대화상자 표시
  ModalDialog* dialog = [[[ModalDialog alloc] init] autorelease];
  dialog.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
  [self presentModalViewController:dialog animated:YES];
}

@end

@implementation ModalDialog

- (void)viewDidLoad {
  [super viewDidLoad];

  // 라벨을 하나 추가
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"안녕, 나는 모달이야!";
  [self.view addSubview:label];

  // 닫기 버튼을 추가
  UIButton* goodbyeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [goodbyeButton setTitle:@"Good-bye" forState:UIControlStateNormal];
  [goodbyeButton sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 80;
  goodbyeButton.center = newPoint;
  [goodbyeButton addTarget:self
                    action:@selector(goodbyeDidPush)
          forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:goodbyeButton];
}

- (void)goodbyeDidPush {
  // 모달 대화상자 닫기
  [self dismissModalViewControllerAnimated:YES];
}

@end
