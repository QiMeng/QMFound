//
//  ViewController.m
//  QMFound
//
//  Created by QiMENG on 1/23/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

#import "ViewController.h"

#import "WaterfallCell.h"

#import <SVPullToRefresh.h>

#import <RACAFNetworking.h>

#define RAFN_MAINTAIN_COMPLETION_BLOCKS

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *cellSizes;

//@property (nonatomic, strong) UITextView *statusTextView;
//@property (nonatomic, strong) UIImageView *afLogoImageView;
//@property (nonatomic, strong) UIButton *startTestingButton;
//@property (nonatomic, strong) AFHTTPRequestOperationManager *httpClient;
//@property (nonatomic, assign) BOOL isTesting;
//@property (nonatomic, strong) RACDisposable *currentDisposable;
//@property (nonatomic, strong) RACSubject *statusSignal;

@end

@implementation ViewController

- (id)init {
    self = [super init];
    
    //Signal for the textview's text
//    _statusSignal = [RACSubject subject];
    
    return self;
}

//- (void)viewDidLoad {
//    // Do any additional setup after loading the view.
//    CGRect slice, remainder;
//    CGRectDivide(self.view.bounds, &slice, &remainder, 44, CGRectMaxYEdge);
//    
////    self.statusTextView = [[UITextView alloc]initWithFrame:remainder];
////    self.statusTextView.editable = NO;
////    self.statusTextView.font = [UIFont fontWithName:@"Helvetica" size:20.0f];
////    [self.statusTextView setTextAlignment:NSTextAlignmentCenter];
////    [self.statusTextView rac_liftSelector:@selector(setText:) withSignals:self.statusSignal, nil];
//    
//    self.afLogoImageView = [[UIImageView alloc]initWithFrame:CGRectOffset(remainder, 0, CGRectGetHeight(UIScreen.mainScreen.bounds))];
//    self.startTestingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.startTestingButton setTitle:@"Start Testing" forState:UIControlStateNormal];
//    self.startTestingButton.frame = self.view.bounds;
//    
//    [[self.startTestingButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *testingButton) {
//        self.isTesting = !self.isTesting;
//        [testingButton setTitle:(self.isTesting ? @"Cancel Testing..." : @"Start Testing") forState:UIControlStateNormal];
//        [UIView animateWithDuration:0.5 animations:^{
//            [testingButton setFrame:(self.isTesting ? slice : self.view.bounds)];
//        }];
//        if (self.isTesting) {
//            [self testImageFetch];
//        } else {
//            [self cancelTheShow];
//            
//        }
//    }];
//    
////    [self.view addSubview:self.statusTextView];
//    [self.view addSubview:self.afLogoImageView];
//    [self.view addSubview:self.startTestingButton];
//    
//    //Get network status
//    self.httpClient = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@"https://www.google.com"]];
//    self.httpClient.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    [self.httpClient.networkReachabilityStatusSignal subscribeNext:^(NSNumber *status) {
//        AFNetworkReachabilityStatus networkStatus = [status intValue];
//        switch (networkStatus) {
//            case AFNetworkReachabilityStatusUnknown:
//            case AFNetworkReachabilityStatusNotReachable:
//                [self.statusSignal sendNext:@"Cannot Reach Host"];
//                [self cancelTheShow];
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                break;
//        }
//        
//    }];
//    
//    [super viewDidLoad];
//}
//
//- (void)testImageFetch {
//    //Fetch the image.  WHen fetched, animate the logo image up, then down and start the next test.
//    [self.statusSignal sendNext:@"Fetching AFNetworking Logo..."];
//    
//    RACSubject *imageSubject = [RACSubject subject];
//    [self.afLogoImageView rac_liftSelector:@selector(setImage:) withSignals:imageSubject, nil];
//    
//    NSString *urlStr = @"http://qimeng.github.io/phone/imgs/113.jpg";
//    self.httpClient.responseSerializer = [AFImageResponseSerializer serializer];
//    
//    _currentDisposable = [[[self.httpClient rac_GET:urlStr parameters:nil] map:^id(RACTuple *value) {
//        return [value first];
//    }] subscribeNext:^(UIImage *image) {
//        [imageSubject sendNext:image];
//        CGRect slice, remainder;
//        CGRectDivide(self.view.bounds, &slice, &remainder, 44, CGRectMaxYEdge);
//        [UIView animateWithDuration:0.5 animations:^{
//            [self.afLogoImageView setFrame:remainder];
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.5 delay:1 options:0 animations:^{
//                [self.afLogoImageView setFrame:CGRectOffset(remainder, 0, CGRectGetHeight(UIScreen.mainScreen.bounds))];
//            } completion:^(BOOL finished) {
////                [self testXMLFetch];
//            }];
//        }];
//    }];
//}
//
//- (void)testXMLFetch {
//    //Fetch the Flickr feed for groups.
//    [self.statusSignal sendNext:@"Fetching Flickr XML..."];
//    
//    
//    NSString *urlStr = @"http://api.flickr.com/services/rest/?method=flickr.groups.browse&api_key=b6300e17ad3c506e706cb0072175d047&cat_id=34427469792%40N01&format=rest";
//    self.httpClient.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    
//    _currentDisposable = [[[self.httpClient rac_GET:urlStr parameters:nil]map:^id(RACTuple *value) {
//        return [value second];
//    }] subscribeNext:^(NSHTTPURLResponse *response) {
//        [self.statusSignal sendNext:response.allHeaderFields.description];
//        
//        [self performSelector:@selector(testError) withObject:nil afterDelay:0.5];
//    }];
//}
//
//- (void)testError {
//    [self.statusSignal sendNext:@"Sending Error-Prone Request..."];
//    
//    //Send an un-authorized request to show how error blocks work.
//    NSString *urlStr = @"http://api.flickr.com/";
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSDictionary *params = [[NSDictionary alloc]initWithObjectsAndKeys:@"json", @"format", @"66854529@N00", @"user_id", @"1", @"nojsoncallback", nil];
//    NSString *path = [[NSString alloc]initWithFormat:@"services/rest/?method=flickr.people.getPhotos"];
//    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    _currentDisposable = [[manager rac_GET:path parameters:params] subscribeError:^(NSError *error) {
//        [self.statusSignal sendNext:[error localizedDescription]];
//        
//        [self performSelector:@selector(finish) withObject:nil afterDelay:0.5];
//    }];
//}
//
//- (void)finish {
//    [self.statusSignal sendNext:@"Finished!"];
//    [self.startTestingButton setTitle:@"Restart Tests" forState:UIControlStateNormal];
//    self.isTesting = !self.isTesting;
//}
//
//- (void)cancelTheShow {
//    //Kills the current disposable and removes the image view.
//    CGRect slice, remainder;
//    CGRectDivide(self.view.bounds, &slice, &remainder, 44, CGRectMaxYEdge);
//    
//    [self.statusSignal sendNext:@""];
//    [_currentDisposable dispose];
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        [self.afLogoImageView setFrame:CGRectOffset(remainder, 0, CGRectGetHeight(UIScreen.mainScreen.bounds))];
//    }];
//}







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.myCollectionView];
    
    self.navigationController.hidesBarsOnSwipe = YES;
    
//    __weak ViewController *weakSelf = self;
//    
//    [self.myCollectionView addPullToRefreshWithActionHandler:^{
//        [weakSelf insertRowAtTop];
//    }];
    
}
//- (void)insertRowAtTop {
//    __weak ViewController *weakSelf = self;
//    
//    int64_t delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
////        [weakSelf.tableView beginUpdates];
////        [weakSelf.dataSource insertObject:[NSDate date] atIndex:0];
////        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
////        [weakSelf.tableView endUpdates];
////        
//        [weakSelf.myCollectionView.pullToRefreshView stopAnimating];
//    });
//}


- (UICollectionView *)myCollectionView {
    
    if (!_myCollectionView) {
        
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.headerHeight = 0;
        layout.footerHeight = 0;
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        _myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _myCollectionView.dataSource = self;
        _myCollectionView.delegate = self;
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        
        [_myCollectionView registerClass:[WaterfallCell class]
            forCellWithReuseIdentifier:@"WaterfallCell"];
    }
    
    return _myCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WaterfallCell *cell = (WaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WaterfallCell"
                                                                                     forIndexPath:indexPath];
//    cell.displayString = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
//    [cell setWater:<#(WaterModel *)#>]
    
    return cell;
}

- (NSMutableArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = [NSMutableArray array];
        for (NSInteger i = 0; i < 30; i++) {
            CGSize size = CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50);
            _cellSizes[i] = [NSValue valueWithCGSize:size];
        }
    }
    return _cellSizes;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellSizes[indexPath.item] CGSizeValue];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    _myCollectionView.delegate = nil;
    _myCollectionView.dataSource = nil;
}

@end
