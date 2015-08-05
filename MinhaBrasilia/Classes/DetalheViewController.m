//
//  DetalheViewController.m
//  MinhaBrasilia
//
//  Created by Filipe Manuel on 7/30/15.
//  Copyright (c) 2015 Filipe Manuel. All rights reserved.
//

@import GoogleMaps;

#import <MapKit/MapKit.h>
#import "DetalheViewController.h"


#import "Loja.h"

@interface DetalheViewController () <MKMapViewDelegate>

@property (nonatomic, strong) GMSMapView *mapView_;
@property (weak, nonatomic) IBOutlet UIView *mapaView;


@end

@implementation DetalheViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-15.776151
                                                            longitude:-47.882587
                                                                 zoom:12];

    [self.mapView_ setMinZoom:10 maxZoom:15];

    self.mapView_ = [GMSMapView mapWithFrame:self.mapaView.bounds camera:camera];
    self.mapView_.myLocationEnabled = YES;
    [self.mapaView addSubview:self.mapView_];

    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = [self.loja valueForKey:@"titulo"];
    marker.snippet = [self.loja valueForKey:@"subtitulo"];
    marker.map = self.mapView_;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end