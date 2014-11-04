#import <Preferences/Preferences.h>

@interface darkfolders7settingsListController: PSListController {
}
@end

@implementation darkfolders7settingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"DarkFolders7" target:self] retain];
	}
	return _specifiers;
}

-(void) donate: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WPFPPMW6X9LH8"]];
}

-(void)twitter:(id)arg1 {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://twitter.com/marcobeans97"]];
    
}

-(void) sendEmailTo: (id)arg1 {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:singhofmarco@gmail.com"]];
}

@end

// vim:ft=objc
