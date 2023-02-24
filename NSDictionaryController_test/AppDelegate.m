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
@property IBOutlet NSDictionaryController *dictionaryController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSArray *objs = [NSArray arrayWithObjects: @"a", @"b", @"c", nil];
    NSArray *keys = [NSArray arrayWithObjects: @"1", @"2", @"3", nil];

    self.dictionary = [[NSMutableDictionary alloc] initWithObjects:objs forKeys:keys];
    NSLog(@"%@", self.dictionary);
    
    // Iterate over arrangedObjects...
    NSDictionaryControllerKeyValuePair *obj = nil;
    NSEnumerator *en = [[self.dictionaryController arrangedObjects] objectEnumerator];
    while ((obj = [en nextObject]) != nil)
    {
        NSLog(@"%@ => %@", [obj key], [obj value]);
    }
    
    NSLog(@"includedKeys = %@", self.dictionaryController.includedKeys);
    
    Class cls = [self.dictionaryController valueClassForBinding:NSContentBinding];
    NSLog(@"valueClass = %@ forBinding = %@", NSStringFromClass(cls), NSContentBinding);
    cls = [self.dictionaryController valueClassForBinding:NSContentDictionaryBinding];
    NSLog(@"valueClass = %@ forBinding = %@", NSStringFromClass(cls), NSContentDictionaryBinding);
    
    NSLog(@"initialKey =%@, initialValue = %@", self.dictionaryController.initialKey, self.dictionaryController.initialValue);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
