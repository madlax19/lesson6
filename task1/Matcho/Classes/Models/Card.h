//
//  Card.h
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

@import Foundation;

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, readonly) NSString *color;

- (int)match:(NSArray *)otherCards;

- (BOOL)suitColorMatch: (Card *) card;

@end