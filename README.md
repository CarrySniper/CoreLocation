# CoreLocation
CoreLocation定位服务，获取经纬度和定位细信息。

百度经验：http://jingyan.baidu.com/article/f54ae2fc0acdca1e92b849ab.html
##效果图
![](https://github.com/cjq002/CoreLocation/raw/master/IMAGE/demo.png) 

##属性说明
distanceFilter：横向移动多少距离后更新位置信息 <br>

desiredAccuracy:位置的精度属性<br>
取值有如下几种：<br>
kCLLocationAccuracyBest —— 精确度最佳<br>
kCLLocationAccuracynearestTenMeters —— 精确度10m以内<br>
kCLLocationAccuracyHundredMeters —— 精确度100m以内<br>
kCLLocationAccuracyKilometer —— 精确度1000m以内<br>
kCLLocationAccuracyThreeKilometers —— 精确度3000m以内<br>

为适配iOS8需要配置info.plist文件

      添加2行：

      NSLocationAlwaysUsageDescription 设为Boolean类型 = YES

      NSLocationWhenInUseUsageDescription 设为Boolean类型 = YES
