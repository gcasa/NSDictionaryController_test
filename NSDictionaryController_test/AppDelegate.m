//
//  AppDelegate.m
//  NSDictionaryController_test
//
//  Created by Gregory Casamento on 10/5/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property NSMutableDictionary *dictionary;
@property IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSArray *objs = [NSArray arrayWithObjects: @"a", @"b", @"c", nil];
    NSArray *keys = [NSArray arrayWithObjects: @"1", @"2", @"3", nil];

    self.dictionary = [[NSMutableDictionary alloc] initWithObjects:objs forKeys:keys];
    NSLog(@"%@", self.dictionary);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
