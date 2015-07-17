//
//  tourViewController.m
//  OnBoardingIntroTour
//
//  Created by Arsalan Vakili on 2015-07-17.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "TourViewController.h"
#import "IFTTTJazzHands.h"

@interface TourViewController ()
@property(nonatomic,strong) UILabel *appNameLabel;
@property(nonatomic,strong) UILabel *appInfo;
@property(nonatomic,strong) UIImageView *appImage;
@property(nonatomic,strong) UILabel *appDetailInfoOne;
@property(nonatomic,strong) UIImageView *moviePoster;
@property(nonatomic,strong) UIImageView *collectionViewImage;
@property(nonatomic,strong) UILabel *detailReview;
@property(nonatomic,strong) UIImageView *detailImage;

@end

@implementation TourViewController

-(instancetype)init{
    if ((self = [super init])) {
        self.numberOfPages = 5;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    self.contentView.backgroundColor = [UIColor blueColor];
    [self setUpAnimations];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpViews{
    self.appNameLabel = [[UILabel alloc]init];
    self.appNameLabel.text = @"Rotten Mangoes";
    self.appNameLabel.numberOfLines = 1;
    self.appNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.appNameLabel];
    
    self.appInfo = [[UILabel alloc]init];
    self.appInfo.text = @"Find great movies near you!";
    self.appInfo.numberOfLines = 1;
    self.appInfo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.appInfo];
    
    self.appImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.appImage.image = [UIImage imageNamed:@"mango_logo"];
    self.appImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.appImage];
    
    self.appDetailInfoOne = [[UILabel alloc]init];
    self.appDetailInfoOne.text = @"See all the movies playing nearby";
    self.appDetailInfoOne.numberOfLines = 1;
    self.appDetailInfoOne.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.appDetailInfoOne];
    
    self.collectionViewImage = [[UIImageView alloc]init];
    self.collectionViewImage.image = [UIImage imageNamed:@"tour1"];
    self.collectionViewImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.collectionViewImage];
    
    
    
    
    // height and width constraints for collectionview
    
    NSLayoutConstraint *collectionConstraintWidth = [NSLayoutConstraint constraintWithItem:self.collectionViewImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:300];
    [self.contentView addConstraint:collectionConstraintWidth];
    
    NSLayoutConstraint *collectionConstraintHeight = [NSLayoutConstraint constraintWithItem:self.collectionViewImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:300];
    [self.contentView addConstraint:collectionConstraintHeight];
    
    
    
    // add width and height constraint for poster to fit it in the collectionview
    self.moviePoster = [[UIImageView alloc]init];
    self.moviePoster.image = [UIImage imageNamed:@"magic_mike"];
    self.moviePoster.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.moviePoster];
    
     NSLayoutConstraint *moviePosterWidth = [NSLayoutConstraint constraintWithItem:self.moviePoster attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    [self.contentView addConstraint:moviePosterWidth];
    
     NSLayoutConstraint *moviePosterHeight = [NSLayoutConstraint constraintWithItem:self.moviePoster attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150];
    [self.contentView addConstraint:moviePosterHeight];
    
    self.detailReview = [[UILabel alloc]init];
    self.detailReview.text = @"Read reviews by top critics";
    self.detailReview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.detailReview];
    
    
    
    
}

-(void)setUpAnimations{
    [self keepView:self.appNameLabel onPage:0];
    [self keepView:self.appImage onPages:@[@(0),@(1)]];
    [self keepView:self.appDetailInfoOne onPage:1];
    [self keepView:self.collectionViewImage onPage:1];
    [self keepView:self.moviePoster onPages:@[@(1), @(2)]];
    [self keepView:self.detailReview onPage:2];
    
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.appNameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:50];
    [self.contentView addConstraint:constraint1];
    
      NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.appInfo attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:-30];
      [self.contentView addConstraint:constraint2];
    
     NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.appImage attribute:NSLayoutAttributeCenterY  relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY  multiplier:1.0 constant:0];
    [self.contentView addConstraint:constraint3];
    
     NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.appDetailInfoOne attribute:NSLayoutAttributeBottom  relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom  multiplier:1.0 constant:0];
    [self.contentView addConstraint:constraint4];
    
     NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:self.collectionViewImage attribute:NSLayoutAttributeCenterY  relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY  multiplier:1.0 constant:0];
    [self.contentView addConstraint:constraint5];
    
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:self.moviePoster attribute:NSLayoutAttributeCenterY  relatedBy:NSLayoutRelationEqual toItem:self.collectionViewImage attribute:NSLayoutAttributeCenterY  multiplier:1.0 constant:0];
    [self.contentView addConstraint:constraint6];
    
    NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:self.detailReview attribute:NSLayoutAttributeBottom  relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom  multiplier:1.0 constant:0];
    
    
    
    
    
    
    IFTTTScaleAnimation *scaleAnimation = [IFTTTScaleAnimation animationWithView:self.appImage];
    
    [scaleAnimation addKeyframeForTime:0 scale:1.0];
    [scaleAnimation addKeyframeForTime:1 scale:0.50];
   
    [self.animator addAnimation:scaleAnimation];
    
    IFTTTConstraintConstantAnimation *constraintAnimation = [IFTTTConstraintConstantAnimation animationWithSuperview:self.contentView constraint:constraint3];
    
    
    [constraintAnimation addKeyframeForTime:0 constant:0];
    [constraintAnimation addKeyframeForTime:1 constant:-200];
    
     [self.animator addAnimation:constraintAnimation];
    
    
    
}

@end
