//
//  ViewController.m
//  CoreLocation定位服务
//
//  Created by 思久科技 on 16/6/2.
//  Copyright © 2016年 Seejoys. All rights reserved.
//

#import "ViewController.h"

//1.包含头文件
#import <CoreLocation/CoreLocation.h>

//2.引入CoreLocation
@interface ViewController ()<CLLocationManagerDelegate>

//3.声明定位管理器
@property (nonatomic ,strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //4.初始化对象
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 1.0;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [self.locationManager requestAlwaysAuthorization]; // 永久授权
        [self.locationManager requestWhenInUseAuthorization]; //使用中授权
    }
    
    
    [self.locationManager startUpdatingLocation];//开启位置更新
//    [self.locationManager stopUpdatingLocation];//停止位置更新
    
}

#pragma mark - 定位代理失败回调
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

#pragma mark - 定位代理更新位置成功回调
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"经度：%f", newLocation.coordinate.latitude);
    NSLog(@"纬度：%f", newLocation.coordinate.longitude);
    
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        NSDictionary *locationInfo = [[NSDictionary alloc]init];
        for (CLPlacemark * placemark in placemarks) {
            locationInfo = [placemark addressDictionary];
        }
        NSLog(@"%@",locationInfo);
    }];
}

/*
 经度：23.136150
 纬度：113.328911
 
 {
     City = "广州市";
     Country = "中国";
     CountryCode = CN;
     FormattedAddressLines =     (
     "中国广东省广州市天河区林和街道天河东路"
     );
     Name = "中国广东省广州市天河区林和街道天河东路";
     State = "广东省";
     Street = "天河东路";
     SubLocality = "天河区";
     Thoroughfare = "天河东路";
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
