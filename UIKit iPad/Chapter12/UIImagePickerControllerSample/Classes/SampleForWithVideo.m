//
//  SampleForWithVideo.m
//
//  Created by ToKoRo on 2009-10-11.
//

#import "SampleForWithVideo.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation SampleForWithVideo

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"PhotoLibrary"];
  [sheet addButtonWithTitle:@"Video"];
  [sheet addButtonWithTitle:@"취소"];
  sheet.cancelButtonIndex = 2;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    UIImagePickerControllerSourceType sourceType = buttonIndex;
    if ( [UIImagePickerController isSourceTypeAvailable:sourceType] ) {

      UIImagePickerController* picker = [[[UIImagePickerController alloc] init] autorelease];
      picker.delegate = self;
      picker.sourceType = sourceType;
      picker.videoQuality = UIImagePickerControllerQualityTypeLow;
      picker.videoMaximumDuration = 10;

      NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
      if ( [mediaTypes containsObject:(NSString*)kUTTypeMovie] ) {
        picker.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeMovie];
      } else {
        NSLog( @"%@ is not available.", kUTTypeMovie );
      }
      [self presentModalViewController:picker animated:YES];
    } else {
      NSLog( @"%d is not available.", sourceType );
    }
  }
}

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 선택한 것이 비디오인지를 판단
  NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
  if ( [mediaType isEqualToString:(NSString*)kUTTypeMovie] ) {
    NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSString* mediaPath = [mediaURL path];
    if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum( mediaPath ) ) {
      UISaveVideoAtPathToSavedPhotosAlbum( mediaPath,
                                           self,
                                           @selector(video:didFinishSavingWithError:contextInfo:),
                                           NULL );
    } else {
      NSLog( @"사진 앨범에 보존할 수 없는 경우의 처리" );
    }
  } else {
    NSLog( @"비디오가 아닌 경우의 처리" );
  }
  [self dismissModalViewControllerAnimated:YES];
}

- (void)video:(NSString*)videoPath
  didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
  if ( error ) {
    // error가 nil이 아닌 경우 보존 실패
    NSLog( [error localizedDescription] );
  } else {
    // nil이라면 보존 성공
  }
}

@end
