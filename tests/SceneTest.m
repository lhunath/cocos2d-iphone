//
// Scene demo
// a cocos2d example
// http://www.cocos2d-iphone.org
//

#import "SceneTest.h"

#pragma mark -
#pragma mark Layer1

@implementation Layer1
-(id) init
{
	if( (self=[super initWithColor: ccc4(0,255,0,255)]) ) {
	
		
		CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: @"Test pushScene" target:self selector:@selector(onPushScene:)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: @"Test pushScene w/transition" target:self selector:@selector(onPushSceneTran:)];
		CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: @"Quit" target:self selector:@selector(onQuit:)];
		
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
		[menu alignItemsVertically];
		
		[self addChild: menu];

		CGSize s = [CCDirector sharedDirector].winSize;
		CCSprite *sprite = [CCSprite spriteWithFile:@"grossini.png"];
		[self addChild:sprite];
		sprite.position = ccp(s.width-40, s.height/2);
		id rotate = [CCRotateBy actionWithDuration:2 angle:360];
		id repeat = [CCRepeatForever actionWithAction:rotate];
		[sprite runAction:repeat];
		
		
		[self schedule:@selector(testDealloc:)];
	}

	return self;
}

-(void) cleanup
{
	NSLog(@"Layer1#cleanup");
	[super cleanup];
}

-(void) testDealloc:(ccTime) dt
{
	NSLog(@"Layer1:testDealloc");
}

-(void) dealloc
{
	NSLog(@"Layer1 - dealloc");
	[super dealloc];
}

-(void) onPushScene: (id) sender
{
	CCScene * scene = [[CCScene node] addChild: [Layer2 node] z:0];
	[[CCDirector sharedDirector] pushScene: scene];
//	[[Director sharedDirector] replaceScene:scene];
}

-(void) onPushSceneTran: (id) sender
{
	CCScene * scene = [[CCScene node] addChild: [Layer2 node] z:0];
	[[CCDirector sharedDirector] pushScene: [CCSlideInTTransition transitionWithDuration:1 scene:scene]];
}


-(void) onQuit: (id) sender
{
	[[CCDirector sharedDirector] popScene];

	// HA HA... no more terminate on sdk v3.0
	// http://developer.apple.com/iphone/library/qa/qa2008/qa1561.html
	if( [[UIApplication sharedApplication] respondsToSelector:@selector(terminate)] )
		[[UIApplication sharedApplication] performSelector:@selector(terminate)];
}

-(void) onVoid: (id) sender
{
}
@end

#pragma mark -
#pragma mark Layer2

@implementation Layer2
-(id) init
{
	if( (self=[super initWithColor: ccc4(255,0,0,255)]) ) {
	
		timeCounter = 0;

		CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: @"replaceScene" target:self selector:@selector(onReplaceScene:)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: @"replaceScene w/transition" target:self selector:@selector(onReplaceSceneTran:)];
		CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: @"Go Back" target:self selector:@selector(onGoBack:)];
		
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
		[menu alignItemsVertically];
		
		[self addChild: menu];
		
		[self schedule:@selector(testDealloc:)];
		
		CGSize s = [CCDirector sharedDirector].winSize;
		CCSprite *sprite = [CCSprite spriteWithFile:@"grossini.png"];
		[self addChild:sprite];
		sprite.position = ccp(40, s.height/2);
		id rotate = [CCRotateBy actionWithDuration:2 angle:360];
		id repeat = [CCRepeatForever actionWithAction:rotate];
		[sprite runAction:repeat];		
	}

	return self;
}

-(void) dealloc
{
	NSLog(@"Layer2 - dealloc");
	[super dealloc];
}

-(void) testDealloc:(ccTime) dt
{
	NSLog(@"Layer2:testDealloc");

	timeCounter += dt;
	if( timeCounter > 10 )
		[self onReplaceScene:self];
}

-(void) onGoBack:(id) sender
{
	[[CCDirector sharedDirector] popScene];
}

-(void) onReplaceScene:(id) sender
{
	[[CCDirector sharedDirector] replaceScene: [ [CCScene node] addChild: [Layer3 node] z:0] ];
}
-(void) onReplaceSceneTran:(id) sender
{
	CCScene *s = [[CCScene node] addChild: [Layer3 node] z:0];
	[[CCDirector sharedDirector] replaceScene: [CCFlipXTransition transitionWithDuration:2 scene:s]];
}
@end

#pragma mark -
#pragma mark Layer3

@implementation Layer3
-(id) init
{
	if( (self=[super initWithColor: ccc4(0,0,255,255)]) ) {
		self.isTouchEnabled = YES;
		id label = [CCLabel labelWithString:@"Touch to popScene" fontName:@"Marker Felt" fontSize:32];
		[self addChild:label];
		CGSize s = [[CCDirector sharedDirector] winSize];
		[label setPosition:ccp(s.width/2, s.height/2)];
		
		[self schedule:@selector(testDealloc:)];
		
		CCSprite *sprite = [CCSprite spriteWithFile:@"grossini.png"];
		[self addChild:sprite];
		sprite.position = ccp(s.width/2, 40);
		id rotate = [CCRotateBy actionWithDuration:2 angle:360];
		id repeat = [CCRepeatForever actionWithAction:rotate];
		[sprite runAction:repeat];		
		
	}
	return self;
}

- (void) dealloc
{
	NSLog(@"Layer3 - dealloc");
	[super dealloc];
}

-(void) testDealloc:(ccTime)dt
{
	NSLog(@"Layer3:testDealloc");
}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[[CCDirector sharedDirector] popScene];
}
@end


#pragma mark -
#pragma mark AppController

// CLASS IMPLEMENTATIONS
@implementation AppController

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	// Init the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// must be called before any othe call to the director
	if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeMainLoop];
	
	// get instance of the shared director
	CCDirector *director = [CCDirector sharedDirector];
	
	// before creating any layer, set the landscape mode
	[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
	
	// display FPS (useful when debugging)
	[director setDisplayFPS:YES];
	
	// frames per second
	[director setAnimationInterval:1.0/60];
	
	// create an OpenGL view
	EAGLView *glView = [EAGLView viewWithFrame:[window bounds]];
	[glView setMultipleTouchEnabled:YES];
	
	// connect it to the director
	[director setOpenGLView:glView];
	
	// glview is a child of the main window
	[window addSubview:glView];
	
	// Make the window visible
	[window makeKeyAndVisible];
	
	
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	
	CCScene *scene = [CCScene node];

	[scene addChild: [Layer1 node] z:0];
	
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

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void) dealloc
{
	[window release];
	[super dealloc];
}

@end
