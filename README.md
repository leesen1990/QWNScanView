基于SDWebImage的简单的图片轮播功能，点击可以放大缩小，下载图片，只要传入图片的数组以及tag值。

QWNViewController *QWNVC = [[QWNViewController alloc]init];
QWNVC.imagesArr = self.imageNames;
QWNVC.index = [NSString stringWithFormat:@"%ld",(long)btn.tag];
[self presentViewController:QWNVC animated:YES completion:nil];

# QWNScanView
