//
//  ViewController.m
//  QWNScrollIamge
//
//  Created by allenqu on 16/11/27.
//  Copyright © 2016年 allenqu. All rights reserved.
//

#import "ViewController.h"
#import "QWNViewController.h"
#import "UIButton+WebCache.h"
#define SCREEN_WIDETH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *imageNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageNames = [NSMutableArray arrayWithObjects:@"http://img2.3lian.com/2014/c7/12/d/77.jpg",@"http://pic3.bbzhi.com/fengjingbizhi/gaoqingkuanpingfengguangsheyingps/show_fengjingta_281299_11.jpg",@"http://img3.iqilu.com/data/attachment/forum/201308/21/192654ai88zf6zaa60zddo.jpg",@"http://www.bz55.com/uploads1/allimg/120312/1_120312100435_8.jpg", nil];
    
    //创建ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDETH, 300)];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDETH*self.imageNames.count, 300);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = FALSE;
    [self.view addSubview:scrollView];
    for (int i = 0; i < self.imageNames.count; i++) {
        UIButton *imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDETH*i, 0, SCREEN_WIDETH, 300)];
        [imageBtn sd_setImageWithURL:self.imageNames[i] forState:UIControlStateNormal];
        imageBtn.tag = i;
        [imageBtn addTarget:self action:@selector(chooseImage:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:imageBtn];
    }
}

- (void)chooseImage: (UIButton *)btn
{
    QWNViewController *QWNVC = [[QWNViewController alloc]init];
    QWNVC.imagesArr = self.imageNames;
    QWNVC.index = [NSString stringWithFormat:@"%ld",(long)btn.tag];
    [self presentViewController:QWNVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
