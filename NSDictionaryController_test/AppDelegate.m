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
@property NSArray *excludedKeys;
@property NSUInteger index;

@end

@implementation AppDelegate
- (void) showDictionary
{
    // Iterate over arrangedObjects...
    NSDictionaryControllerKeyValuePair *obj = nil;
    NSEnumerator *en = [[self.dictionaryController arrangedObjects] objectEnumerator];
    
    NSLog(@"\n// Start");
    while ((obj = [en nextObject]) != nil)
    {
        NSLog(@"%@ => %@", [obj key], [obj value]);
    }
    NSLog(@"// End\n");
    
    NSLog(@"local copy = %@", self.dictionary);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSArray *objs = [NSArray arrayWithObjects: @"a", @"b", @"c", nil];
    NSArray *keys = [NSArray arrayWithObjects: @"1", @"2", @"3", nil];

    self.index = 0;
    self.excludedKeys = @[];
    self.dictionary = [[NSMutableDictionary alloc] initWithObjects:objs forKeys:keys];
    NSLog(@"%@", self.dictionary);
    
    [self showDictionary];

    NSLog(@"includedKeys = %@", self.dictionaryController.includedKeys);
    NSLog(@"excludedKeys = %@", self.dictionaryController.excludedKeys);

    Class cls = [self.dictionaryController valueClassForBinding:NSContentBinding];
    NSLog(@"valueClass = %@ forBinding = %@", NSStringFromClass(cls), NSContentBinding);
    cls = [self.dictionaryController valueClassForBinding:NSContentDictionaryBinding];
    NSLog(@"valueClass = %@ forBinding = %@", NSStringFromClass(cls), NSContentDictionaryBinding);
    
    NSLog(@"initialKey =%@, initialValue = %@", self.dictionaryController.initialKey, self.dictionaryController.initialValue);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

- (IBAction) excludeButton: (id)sender
{
    self.excludedKeys = [NSArray arrayWithObject: [self.dictionary.allKeys objectAtIndex: self.index]];
    NSLog(@"excludedKeys (local) = %@", self.excludedKeys);
    NSLog(@"excludedKeys (controller) = %@", self.dictionaryController.excludedKeys);
    [self showDictionary];
    self.index++;
    
    if (self.index > [[self.dictionary allKeys] count] - 1)
    {
        self.index = 0;
    }
}

- (IBAction) addButton: (id)sender
{
    NSDictionaryControllerKeyValuePair *kvp = [self.dictionaryController newObject];
    [self.dictionaryController addObject: kvp];
    [self showDictionary];
}

- (IBAction)clearButton:(id)sender
{
    self.excludedKeys = @[];
    NSLog(@"cleared -> %@", self.excludedKeys);
    NSLog(@"excludedKeys (controller) = %@", self.dictionaryController.excludedKeys);
    [self showDictionary];
}

@end
