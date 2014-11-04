#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>


static BOOL mainSwitchisEnabled = YES; // Default value
static BOOL iconSwitchisEnabled = YES;
static BOOL folderSwitchisEnabled = YES;

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosinghof.DarkFolders7.plist"];
    if(prefs)
    {
		mainSwitchisEnabled = ( [prefs objectForKey:@"mainSwitchisEnabled"] ? [[prefs objectForKey:@"mainSwitchisEnabled"] boolValue] : mainSwitchisEnabled );
		iconSwitchisEnabled = ( [prefs objectForKey:@"iconSwitchisEnabled"] ? [[prefs objectForKey:@"iconSwitchisEnabled"] boolValue] : iconSwitchisEnabled );
		folderSwitchisEnabled = ( [prefs objectForKey:@"folderSwitchisEnabled"] ? [[prefs objectForKey:@"folderSwitchisEnabled"] boolValue] : folderSwitchisEnabled );
    }
	[prefs release];
}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.marcosinghof.DarkFolders7/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}


CGColorRef color = [UIColor colorWithWhite: 0.20 alpha:0.85].CGColor;

%hook SBFolderBackgroundView

-(BOOL)_shouldUseDarkBackground
{
	
	if(mainSwitchisEnabled == YES && folderSwitchisEnabled == YES)
	{
		
		return true;
		
		
	}
	else 
	{
		return %orig;
	}
}

%end

%hook SBIconBlurryBackgroundView

- (void)setWallpaperColor:(struct CGColor *)arg1 phase:(struct CGSize)arg2
{
	if(mainSwitchisEnabled == YES && iconSwitchisEnabled == YES)
	{
		
		%orig(color, arg2);

	}
	else 
		{
		%orig(arg1, arg2);
		}
	
}
%end


