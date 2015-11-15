//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "Game.h"
#import "PlayingCardDeck.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventsLabel;

@end

@implementation ViewController

- (Game *)game {
	if (!_game) {
        PlayingCardDeck* deck = [[PlayingCardDeck alloc] init];
        Card *joker = [[Card alloc] init];
        joker.contents = @"Joker";
        [deck addCard:joker];
		_game = [[Game alloc] initWithCardCount:[self.cardButtons count]
									  usingDeck:deck];
	}
	return _game;
}


- (IBAction)cardButtonTapped:(UIButton *)sender {
	NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
	[self.game chooseCardAtIndex:cardIndex];
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %li", (long)self.game.score];
    self.eventsLabel.text = self.game.currentEvent;
    if(self.game.allMatchesIsFound){
        self.eventsLabel.text = @"игра окончена";
        if (self.tabBarController) {
            if (self.tabBarController.selectedIndex == 0){
                [self performSegueWithIdentifier:@"Push" sender:nil];
            }else if (self.tabBarController.selectedIndex == 1){
                [self performSegueWithIdentifier:@"Modal" sender:nil];
            }
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
	[self updateUI];
}


-(void) updateUI {
	for (UIButton *cardButton in self.cardButtons) {
		NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
		Card *card = [self.game cardAtIndex:cardIndex];
		
		[cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
		[cardButton setBackgroundImage:[self backgroundImageForCard:card]
							  forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched && !self.game.allMatchesIsFound;
	}
}


-(NSString *) titleForCard:(Card *)card {
	return (card.isChosen) ? card.contents : @"";
}


-(UIImage *) backgroundImageForCard:(Card *)card {
	return [UIImage imageNamed:(card.isChosen) ? @"cardfront" : @"cardback"];
}


@end
