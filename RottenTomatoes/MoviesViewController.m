//
//  ViewController.m
//  RottenTomatoes
//
//  Created by Ankush Raina on 10/20/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "MoviesViewController.h"
#import "MoviesTableViewCell.h"

@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *movies;

@end

@implementation MoviesViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // BE performant in this cell.
    MoviesTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"movieCell"];//[[MoviesTableViewCell alloc]init];
    
    // dequeueReusableCellWithIdentifier
    // Some dirty cell. etc. Dirty, clean. Perf optimization.
    cell.labelOne.text = self.movies[indexPath.row][@"title"];
    cell.labelTwo.text = self.movies[indexPath.row][@"synopsis"];
    // NSURL *url = [NSURL URLWithString:self.movies[indexPath.row][@"posters"][@"thumbnails"]];
    
    // UITableViewCell *cell = [[UITableViewCell alloc]init];
    
//    NSString *cellText = [NSString stringWithFormat:@"Section: %ld, Row: %ld", indexPath.section, indexPath.row];
//    
//    NSLog(@"%@", cellText);
        
//    cell.textLabel.text = cellText;
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchMovies];
}

- (void) fetchMovies {
    NSString *clientId = @"";
    NSString *urlString =
    [@"https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json" stringByAppendingString:clientId];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                  delegate:nil
                             delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
                                                if (!error) {
                                                    NSError *jsonError = nil;
                                                    NSDictionary *responseDictionary =
                                                    [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:kNilOptions
                                                                                      error:&jsonError];
                                                    // NSLog(@"Response: %@", responseDictionary);
                                                    NSLog(@"got network call response");
                                                    self.movies = responseDictionary[@"movies"];
                                                    [self.tableView reloadData];
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
