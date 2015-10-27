//
//  MoviesTableViewCell.h
//  RottenTomatoes
//
//  Created by Ankush Raina on 10/20/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end
