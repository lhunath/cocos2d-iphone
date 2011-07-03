/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

//
// Common layer for OpenGL stuff
//

#import <Availability.h>

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <OpenGLES/EAGL.h>
#import "iOS/glu.h"
#import "iOS/EAGLView.h"

#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
#import <OpenGL/gl.h>
#import <OpenGL/glu.h>
#import <Cocoa/Cocoa.h>	// needed for NSOpenGLView
#import "Mac/MacGLView.h"
#endif


// iOS
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
#define CC_GLVIEW					EAGLView
#define ccGLOrtho					glOrthof
#define	ccGLClearDepth				glClearDepthf
#define ccGLGenerateMipmap			glGenerateMipmapOES
#define ccGLGenFramebuffers			glGenFramebuffersOES
#define ccGLBindFramebuffer			glBindFramebufferOES
#define ccGLFramebufferTexture2D	glFramebufferTexture2DOES
#define ccGLDeleteFramebuffers		glDeleteFramebuffersOES
#define ccGLCheckFramebufferStatus	glCheckFramebufferStatusOES
#define ccGLTranslate				glTranslatef
#define ccGLDeleteVertexArrays		glDeleteVertexArraysOES
#define ccGLGenVertexArrays			glGenVertexArraysOES
#define ccGLBindVertexArray			glBindVertexArrayOES

#define CC_GL_FRAMEBUFFER			GL_FRAMEBUFFER_OES
#define CC_GL_FRAMEBUFFER_BINDING	GL_FRAMEBUFFER_BINDING_OES
#define CC_GL_COLOR_ATTACHMENT0		GL_COLOR_ATTACHMENT0_OES
#define CC_GL_FRAMEBUFFER_COMPLETE	GL_FRAMEBUFFER_COMPLETE_OES

// Mac
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
#define CC_GLVIEW					MacGLView
#define ccGLOrtho					glOrtho
#define	ccGLClearDepth				glClearDepth
#define ccGLGenerateMipmap			glGenerateMipmap
#define ccGLGenFramebuffers			glGenFramebuffers
#define ccGLBindFramebuffer			glBindFramebuffer
#define ccGLFramebufferTexture2D	glFramebufferTexture2D
#define ccGLDeleteFramebuffers		glDeleteFramebuffers
#define ccGLCheckFramebufferStatus	glCheckFramebufferStatus
#define ccGLTranslate				glTranslated
#define ccGLDeleteVertexArrays		glDeleteVertexArraysAPPLE
#define ccGLGenVertexArrays			glGenVertexArraysAPPLE
#define ccGLBindVertexArray			glBindVertexArrayAPPLE

#define CC_GL_FRAMEBUFFER			GL_FRAMEBUFFER
#define CC_GL_FRAMEBUFFER_BINDING	GL_FRAMEBUFFER_BINDING
#define CC_GL_COLOR_ATTACHMENT0		GL_COLOR_ATTACHMENT0
#define CC_GL_FRAMEBUFFER_COMPLETE	GL_FRAMEBUFFER_COMPLETE

#endif
