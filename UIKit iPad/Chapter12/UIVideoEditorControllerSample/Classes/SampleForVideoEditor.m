//
//  SampleForVideoEditor.m
//
//  Created by ToKoRo on 2009-10-12.
//

#import "SampleForVideoEditor.h"

@implementation SampleForVideoEditor

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"VideoEditor"];
  [sheet addButtonWithTitle:@"취소"];
  sheet.cancelButtonIndex = 1;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    UIVideoEditorController* videoEditor = [[[UIVideoEditorController alloc] init] autorelease];
    videoEditor.delegate = self;
    NSString* videoPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"MOV"];
    if ( [UIVideoEditorController canEditVideoAtPath:videoPath] ) {
      videoEditor.videoPath = videoPath;
      [self presentModalViewController:videoEditor animated:YES];
    } else {
      NSLog( @"can't edit video at %@", videoPath );
    }
  }
}

- (void)videoEditorControllerDidCancel:(UIVideoEditorController*)editor {
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController*)editor
  didSaveEditedVideoToPath:(NSString*)editedVideoPath
{
  // 사진 앨범 저장
  if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum( editedVideoPath ) ) {
    UISaveVideoAtPathToSavedPhotosAlbum( editedVideoPath,
                                         self,
                                         @selector(video:didFinishSavingWithError:contextInfo:),
                                         NULL );
  } else {
    NSLog( @"사진 앨범에 보존할 수 없는 경우의 처리" );
  }
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController*)editor didFailWithError:(NSError*)error {
  NSLog( @"%X", error );
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)video:(NSString*)videoPath
  didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
  if ( error ) {
    // error가 nil이 아닌 경우 저장 실패
    NSLog( [error localizedDescription] );
  } else {
    // nil이라면 저장 성공
  }
}

@end
