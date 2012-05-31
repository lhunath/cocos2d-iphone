/*
* AUTOGENERATED FILE. DO NOT EDIT IT
* Generated by ../../tools/js/generate_spidermonkey_bindings.py on 2012-05-31
*/

// needed for callbacks from objective-c to JS
#import <objc/runtime.h>
#import "JRSwizzle.h"

#import "jstypedarray.h"
#import "ScriptingCore.h"   

#import "js_bindings_CCScene.h"
#import "js_bindings_cocos2d.h"


JSClass* JSPROXY_CCScene_class = NULL;
JSObject* JSPROXY_CCScene_object = NULL;
 // Constructor
JSBool JSPROXY_CCScene_constructor(JSContext *cx, uint32_t argc, jsval *vp)
{
    JSObject *jsobj = JS_NewObject(cx, JSPROXY_CCScene_class, JSPROXY_CCScene_object, NULL);

    JSPROXY_CCScene *proxy = [[JSPROXY_CCScene alloc] initWithJSObject:jsobj];

    JS_SetPrivate(jsobj, proxy);
    JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));

    /* no callbacks */
    
    return JS_TRUE;
}

// Destructor
void JSPROXY_CCScene_finalize(JSContext *cx, JSObject *obj)
{
	JSPROXY_CCScene *pt = (JSPROXY_CCScene*)JS_GetPrivate(obj);
	if (pt) {
		// id real = [pt realObj];
	
		/* no callbacks */

		[pt release];

		JS_free(cx, pt);
	}
}

// Arguments: 
// Ret value: CCScene
JSBool JSPROXY_CCScene_node(JSContext *cx, uint32_t argc, jsval *vp) {
	NSCAssert( argc == 0, @"Invalid number of arguments" );

	CCScene *real = [CCScene node ];

	JSObject *jsobj = JS_NewObject(cx, JSPROXY_CCScene_class, JSPROXY_CCScene_object, NULL);
	JSPROXY_CCScene *ret_proxy = [[JSPROXY_CCScene alloc] initWithJSObject:jsobj];
	[ret_proxy setRealObj: real];
	JS_SetPrivate(jsobj, ret_proxy);
	JS_SET_RVAL(cx, vp, OBJECT_TO_JSVAL(jsobj));

	return JS_TRUE;
}

@implementation JSPROXY_CCScene

+(void) createClassWithContext:(JSContext*)cx object:(JSObject*)globalObj name:(NSString*)name
{
	JSPROXY_CCScene_class = (JSClass *)calloc(1, sizeof(JSClass));
	JSPROXY_CCScene_class->name = [name UTF8String];
	JSPROXY_CCScene_class->addProperty = JS_PropertyStub;
	JSPROXY_CCScene_class->delProperty = JS_PropertyStub;
	JSPROXY_CCScene_class->getProperty = JS_PropertyStub;
	JSPROXY_CCScene_class->setProperty = JS_StrictPropertyStub;
	JSPROXY_CCScene_class->enumerate = JS_EnumerateStub;
	JSPROXY_CCScene_class->resolve = JS_ResolveStub;
	JSPROXY_CCScene_class->convert = JS_ConvertStub;
	JSPROXY_CCScene_class->finalize = JSPROXY_CCScene_finalize;
	JSPROXY_CCScene_class->flags = JSCLASS_HAS_PRIVATE;

	static JSPropertySpec properties[] = {
		{0, 0, 0, 0, 0}
	};
	static JSFunctionSpec funcs[] = {
		JS_FS_END
	};
	static JSFunctionSpec st_funcs[] = {
		JS_FN("node", JSPROXY_CCScene_node, 1, JSPROP_PERMANENT | JSPROP_SHARED | JSFUN_CONSTRUCTOR),
		JS_FS_END
	};

	JSPROXY_CCScene_object = JS_InitClass(cx, globalObj, JSPROXY_CCNode_object, JSPROXY_CCScene_class, JSPROXY_CCScene_constructor,0,properties,funcs,NULL,st_funcs);
}

@end
