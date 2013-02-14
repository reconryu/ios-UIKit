//
//  SampleForImagePicker.m
//
//  Created by ToKoRo on 2009-10-11.
//

#import "SampleForImagePicker.h"

@implementation SampleForImagePicker

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];

  imageView_ = [[UIImageView alloc] init];
  imageView_.frame = self.view.bounds;
  imageView_.contentMode = UIViewContentModeScaleAspectFit;
  imageView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:imageView_];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"PhotoLibrary"];
  [sheet addButtonWithTitle:@"Camera"];
  [sheet addButtonWithTitle:@"SavedPhotosAlbum"];
  [sheet addButtonWithTitle:@"취소"];
  sheet.cancelButtonIndex = 3;
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
			picker.allowsEditing = YES;
			[self presentModalViewController:picker animated:YES];
		} else {
			NSLog( @"%d is not available.", sourceType );
		}
	}
}

//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaType;      // an NSString (UTI, i.e. kUTTypeImage)
//UIKIT_EXTERN NSString *const UIImagePickerControllerOriginalImage;  // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerEditedImage;    // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerCropRect;       // an NSValue (CGRect)
//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaURL;       // an NSURL

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 편집한 사진을 취득
  UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
  if ( !image ) {
	// 편집한 사진이 없으면 오리지널 사진을 취득한다  
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
  } 
  imageView_.image = image;
  // 포토 라이브러리에 보존하는 경우는 아래대로
  UIImageWriteToSavedPhotosAlbum( image,
                                  self, 
                                  @selector(image:didFinishSavingWithError:contextInfo:),
                                  NULL );

  [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker {
    // 취소되었을 때에 실시해야 할 처리를 하고 그 후 사진앨범을 닫는다 
	[self dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage*)image
  didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
  if ( error ) {
    // error가 nil이 아닌 경우는 보존 실패
    NSLog( [error localizedDescription] );
  } else {
    // nil이라면 보존 성공
  }
}

@end
