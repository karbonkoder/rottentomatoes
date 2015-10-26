//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by Ankush Raina on 10/25/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import <UIImageView+AFNetworking.h>

@interface MovieDetailsViewController()
@property (weak, nonatomic) IBOutlet UIImageView *imageDetailView;
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
@property (weak, nonatomic) IBOutlet UILabel *detailTextView;

@end

@implementation MovieDetailsViewController

@synthesize movie;

- (void) viewDidLoad {
    self.titleTextView.text = movie[@"title"];
    self.detailTextView.text = movie[@"synopsis"];
    NSString *urlString = movie[@"posters"][@"thumbnail"];
    NSURL *thumbnailUrl = [NSURL URLWithString:urlString];
    [self.imageDetailView setImageWithURL:thumbnailUrl];
}

@end
