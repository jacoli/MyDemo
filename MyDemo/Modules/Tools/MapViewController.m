//
//  MapViewController.m
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "MapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface MapViewController () <MAMapViewDelegate, AMapLocationManagerDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapLocationManager *locationManager;

@end

@implementation MapViewController

- (MAMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        _mapView.delegate = self;
    }
    
    return _mapView;
}

- (AMapLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[AMapLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MAMapServices sharedServices].apiKey = @"8e3ccafc64ca97ff20d269753e58eddd";
    [AMapLocationServices sharedServices].apiKey = @"8e3ccafc64ca97ff20d269753e58eddd";
    [AMapSearchServices sharedServices].apiKey = @"8e3ccafc64ca97ff20d269753e58eddd";
    
    [self.view addSubview:self.mapView];
    
    self.mapView.showsUserLocation = YES;
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
}

@end
