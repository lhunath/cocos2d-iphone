//
// ES1Renderer.h
//
// File autogenerated with Xcode
// Adapted to cocos2d
//


#import "ESRenderer.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface ES1Renderer : NSObject <ESRenderer>
{
    // The pixel dimensions of the CAEAGLLayer
    GLint backingWidth_;
    GLint backingHeight_;

    // The OpenGL ES names for the framebuffer and renderbuffer used to render to this view
    GLuint defaultFramebuffer_;
	GLuint colorRenderbuffer_;
	GLuint depthBuffer_;
	
	unsigned int	depthFormat_;


	@public
	EAGLContext *context_;
}

/** EAGLContext */
@property (nonatomic,readonly) EAGLContext* context;

- (BOOL)resizeFromLayer:(CAEAGLLayer *)layer;

@end
