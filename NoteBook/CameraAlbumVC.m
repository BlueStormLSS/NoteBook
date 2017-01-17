//
//  CameraAlbumVC.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/17.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "CameraAlbumVC.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <Photos/Photos.h>
@interface CameraAlbumVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UIImagePickerController *imagePickerController;

@end

@implementation CameraAlbumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}
#pragma mark - 吊起相机 -
- (void)cameraBrClicked{
    ///判断是否有摄像头，并且是否支持拍照功能
    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.delegate = self;
        self.imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        self.imagePickerController.allowsEditing = YES;
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        ///录制视频时长，默认10s
        self.imagePickerController.videoMaximumDuration = 15;
        
        ///相机类型（拍照、录像） 字符串需要作相应的类型转换
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage];
        //视频上传质量
        //UIImagePickerControllerQualityTypeHigh高清
        //UIImagePickerControllerQualityTypeMedium中等质量
        //UIImagePickerControllerQualityTypeLow低质量
        //UIImagePickerControllerQualityType640x480
        self.imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
        ///设置摄像头模式
        self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraCaptureModeVideo;
        [self presentViewController:self.imagePickerController animated:YES completion:^{
        }];
    }else{
        NSLog(@"不支持摄像头");
    }
}
#pragma mark - 吊起自带相册选择工具 -
- (void)albumBeClicked{
    if ([self isPhotoLibraryAvailable]) {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        if ([self canUserPickPhotosFromPhotoLibrary]){
            [mediaTypes addObject:( NSString *)kUTTypeImage];
        }
        if ([self canUserPickVideosFromPhotoLibrary]){
            [mediaTypes addObject:( NSString *)kUTTypeMovie];
        }
        [self.imagePickerController setMediaTypes:mediaTypes];
        [self.imagePickerController setDelegate:self];// 设置代理
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
}


- (void)allPicture:(UIButton *)sender {
    
    [self getThumbnailImages];
    
    
    
}
////获取原图
- (void)getOriginalImages
{
    // 获得所有的自定义相簿
    PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // 遍历所有的自定义相簿
    for (PHAssetCollection *assetCollection in assetCollections) {
        [self enumerateAssetsInAssetCollection:assetCollection original:YES];
    }
    
    // 获得相机胶卷
    PHAssetCollection *cameraRoll = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].lastObject;
    // 遍历相机胶卷,获取大图
    [self enumerateAssetsInAssetCollection:cameraRoll original:YES];
}
////获取缩略图
- (void)getThumbnailImages
{
    // 获得所有的自定义相簿
    PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // 遍历所有的自定义相簿
    for (PHAssetCollection *assetCollection in assetCollections) {
        [self enumerateAssetsInAssetCollection:assetCollection original:NO];
    }
    // 获得相机胶卷
    PHAssetCollection *cameraRoll = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].lastObject;
    [self enumerateAssetsInAssetCollection:cameraRoll original:NO];
}
/**
 *  遍历相簿中的所有图片
 *  @param assetCollection 相簿
 *  @param original        是否要原图
 */
- (void)enumerateAssetsInAssetCollection:(PHAssetCollection *)assetCollection original:(BOOL)original
{
    NSLog(@"相簿名:%@", assetCollection.localizedTitle);
    
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    // 同步获得图片, 只会返回1张图片
    options.synchronous = YES;
    
    // 获得某个相簿中的所有PHAsset对象
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
    for (PHAsset *asset in assets) {
        // 是否要原图
        CGSize size = original ? CGSizeMake(asset.pixelWidth, asset.pixelHeight) : CGSizeZero;
        
        // 从asset中获得图片
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            NSLog(@"%@--%@", result,info);
        }];
    }
}
#pragma mark - 代理方法 -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    
}
///当得到照片或者视频后，调用该方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"%@",info);
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    ///判断获取的类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *getImage = nil;
        if ([picker allowsEditing]) {
            ////获取编辑后的图片
            getImage = [info objectForKey:UIImagePickerControllerEditedImage];
        }else{
            getImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
        
        if (self.imagePickerController.sourceType == UIImagePickerControllerSourceTypeCamera) {
            NSMutableArray *imageIds = [NSMutableArray array];
            ///保存图片到相册中
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                ///写入图片进相册
                PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:getImage];
                ///记录本地标识，等待完成后取到相册中的图片对象
                [imageIds addObject:req.placeholderForCreatedAsset.localIdentifier];
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                NSLog(@"success=%d,error=%@",success,error);
                if (success) {
                    ///成功后取出相册中的图片对象
                    __block PHAsset *imageAsset = nil;
                    PHFetchResult *result = [PHAsset fetchAssetsWithLocalIdentifiers:imageIds options:nil];
                    [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        imageAsset = obj;
                        *stop = nil;
                    }];
                    if (imageAsset) {
                        ///加载图片数据
                        [[PHImageManager defaultManager] requestImageDataForAsset:imageAsset options:nil resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                            NSLog(@"imageData = %@",imageData);
                        }];
                    }
                    
                    
                }
            }];
            
            
        }
        
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        
    }
    [self.imagePickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
///当用户取消时，调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.imagePickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - 判断摄像头是否可用的方法 -
///判断设备是否有摄像头
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
///判断前置摄像头是否可用
- (BOOL) isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}
///判断后置摄像头是否可用
- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
///检查摄像头是否支持录像
- (BOOL)doesCameraSupportShootingVideos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中，
     然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。不然后出现错误使用未声明的标识符 'kUTTypeMovie'
     */
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
}
///检查摄像头是否支持拍照
- (BOOL) doesCameraSupportTakingPhotos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中，
     然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。不然后出现错误使用未声明的标识符 'kUTTypeImage'
     */
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}
///相册是否可用
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}
///是否可以在相册里选择视频
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
///是否可以在相册中选择照片
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
// 判断是否支持某种多媒体类型：拍照，视频,
- (BOOL)cameraSupportsMedia:(NSString*)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result=NO;
    if ([paramMediaType length]==0) {
        NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray*availableMediaTypes=[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
