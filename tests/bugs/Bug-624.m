//
// Bug-624
// http://code.google.com/p/cocos2d-iphone/issues/detail?id=624
//

#import "Bug-624.h"

#import "RootViewController.h"

#pragma mark -
#pragma mark MemBug

@implementation Layer1
-(id) init
{
	if((self=[super init])) {
		CGSize size = [[CCDirector sharedDirector] winSize];
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Layer1" fontName:@"Marker Felt" fontSize:36];
		
		label.position = ccp(size.width/2, size.height/2);
		[self addChild:label];
		
		self.isAccelerometerEnabled = YES;
		
		[self schedule:@selector(switchLayer:) interval:5];
		
	}
    
	return self;
}

-(void) switchLayer:(ccTime)dt
{
	[self unschedule:_cmd];
	
	CCScene *scene = [CCScene node];	
	[scene addChild:[Layer2 node] z:0];
	
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:2 scene:scene withColor:ccWHITE]];
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
	NSLog(@"Layer1 accel");
}


@end

@implementation Layer2
-(id) init
{
	if((self=[super init])) {
		CGSize size = [[CCDirector sharedDirector] winSize];
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Layer2" fontName:@"Marker Felt" fontSize:36];
		
		label.position = ccp(size.width/2, size.height/2);
		[self addChild:label];
		
		self.isAccelerometerEnabled = YES;
		
		[self schedule:@selector(switchLayer:) interval:5];
		
	}
    
	return self;
}

-(void) switchLayer:(ccTime)dt
{
	[self unschedule:_cmd];
	
	CCScene *scene = [CCScene node];	
	[scene addChild:[Layer1 node] z:0];
	
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:2 scene:scene withColor:ccRED]];
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
	NSLog(@"Layer2 accel");
}
@end


// CLASS IMPLEMENTATIONS
@implementation AppController

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	// CC_DIRECTOR_INIT()
	//
	// 1. Initializes an EAGLView with 0-bit depth format, and RGB565 render buffer
	// 2. EAGLView multiple touches: disabled
	// 3. creates a UIWindow, and assign it to the "window" var (it must already be declared)
	// 4. Parents EAGLView to the newly created window
	// 5. Creates Display Link Director
	// 5a. If it fails, it will use an NSTimer director
	// 6. It will try to run at 60 FPS
	// 7. Display FPS: NO
	// 8. Device orientation: Portrait
	// 9. Connects the director to the EAGLView
	//
	CC_DIRECTOR_INIT();
	
	// Obtain the shared director in order to...
	CCDirector *director = [CCDirector sharedDirector];

	// Turn on display FPS
	[director setDisplayFPS:YES];
	
	CCScene *scene = [CCScene node];	
	[scene addChild:[Layer1 node] z:0];
			
	[director runWithScene: scene];
}

// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	[[CCDirector sharedDirector] pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	[[CCDirector sharedDirector] resume];
}

// purge memroy
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCTextureCache sharedTextureCache] removeAllTextures];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void) dealloc
{
	[viewController_ release];
	[window_ dealloc];
	[super dealloc];
}

@end
