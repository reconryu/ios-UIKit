//
//  SampleForCameraOverlay.h
//
//  Created by ToKoRo on 2009-10-11.
//

#import <UIKit/UIKit.h>

@interface CameraOverlayView : UIImageView
{
 @private
  UIImagePickerController* pickerController_;
}

@property (nonatomic, assign) UIImagePickerController* pickerController;

@end

@interface SampleForCameraOverlay : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
 @private
  UIImageView* imageView_;
}

@end
