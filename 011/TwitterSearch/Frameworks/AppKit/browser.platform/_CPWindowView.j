i;8;CPView.ji;13;CPImageView.jc;9243;
var _1=nil;
var _2=objj_allocateClassPair(CPView,"_CPWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_styleMask"),new objj_ivar("_resizeIndicator"),new objj_ivar("_resizeIndicatorOffset"),new objj_ivar("_toolbarView"),new objj_ivar("_resizeFrame"),new objj_ivar("_mouseDraggedPoint"),new objj_ivar("_cachedScreenFrame")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(objj_msgSend(_4,"class"),"contentRectForFrameRect:",_6);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(objj_msgSend(_7,"class"),"frameRectForContentRect:",_9);
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPView")},"initWithFrame:",_c);
if(_a){
_styleMask=_d;
_resizeIndicatorOffset=CGSizeMake(0,0);
_toolbarOffset=CGSizeMake(0,0);
objj_msgSend(_a,"setShowsResizeIndicator:",!(_styleMask&CPBorderlessBridgeWindowMask)&&(_styleMask&CPResizableWindowMask));
}
return _a;
}
}),new objj_method(sel_getUid("setTitle:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_11,_12,_13){
with(_11){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(_14,"window");
if((_styleMask&CPResizableWindowMask)&&_resizeIndicator){
var _18=objj_msgSend(_resizeIndicator,"frame");
if(CGRectContainsPoint(_18,objj_msgSend(_14,"convertPoint:fromView:",objj_msgSend(_16,"locationInWindow"),nil))){
return objj_msgSend(_14,"trackResizeWithEvent:",_16);
}
}
if(objj_msgSend(_17,"isMovableByWindowBackground")){
objj_msgSend(_14,"trackMoveWithEvent:",_16);
}else{
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPView")},"mouseDown:",_16);
}
}
}),new objj_method(sel_getUid("trackResizeWithEvent:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_1b,"locationInWindow"),_1d=objj_msgSend(_1b,"type");
if(_1d===CPLeftMouseUp){
return;
}
var _1e=objj_msgSend(_19,"window");
if(_1d===CPLeftMouseDown){
var _1f=objj_msgSend(_1e,"frame");
_resizeFrame=CGRectMake(_1c.x,_1c.y,CGRectGetWidth(_1f),CGRectGetHeight(_1f));
}else{
if(_1d===CPLeftMouseDragged){
var _20=CGSizeMake(CGRectGetWidth(_resizeFrame)+_1c.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+_1c.y-CGRectGetMinY(_resizeFrame));
if(_1e._isSheet&&_1e._parentView&&(_1e._frame.size.width!==_20.width)){
objj_msgSend(_1e._parentView,"_setAttachedSheetFrameOrigin");
}
objj_msgSend(_1e,"setFrameSize:",_20);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_19,sel_getUid("trackResizeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_pointWithinScreenFrame:"),function(_21,_22,_23){
with(_21){
if(!objj_msgSend(CPPlatform,"isBrowser")){
return _23;
}
var _24=_cachedScreenFrame;
if(!_24){
_24=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}
var _25=CGPointMake(0,0);
_25.x=MIN(MAX(_23.x,-_frame.size.width+4),CGRectGetMaxX(_24)-4);
_25.y=MIN(MAX(_23.y,0),CGRectGetMaxY(_24)-8);
return _25;
}
}),new objj_method(sel_getUid("trackMoveWithEvent:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_28,"type");
if(_29===CPLeftMouseUp){
_cachedScreenFrame=nil;
return;
}else{
if(_29===CPLeftMouseDown){
_mouseDraggedPoint=objj_msgSend(objj_msgSend(_26,"window"),"convertBaseToGlobal:",objj_msgSend(_28,"locationInWindow"));
_cachedScreenFrame=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}else{
if(_29===CPLeftMouseDragged){
var _2a=objj_msgSend(_26,"window"),_2b=objj_msgSend(_2a,"frame"),_2c=objj_msgSend(_2a,"convertBaseToGlobal:",objj_msgSend(_28,"locationInWindow")),_2d=objj_msgSend(_26,"_pointWithinScreenFrame:",CGPointMake((_2b.origin.x)+(_2c.x-_mouseDraggedPoint.x),(_2b.origin.y)+(_2c.y-_mouseDraggedPoint.y)));
objj_msgSend(_2a,"setFrameOrigin:",_2d);
_mouseDraggedPoint=objj_msgSend(_26,"_pointWithinScreenFrame:",_2c);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_26,sel_getUid("trackMoveWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_2e,_2f,_30){
with(_2e){
if(_30){
var _31=objj_msgSend(_1,"size"),_32=objj_msgSend(_2e,"frame").size;
_resizeIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_32.width-_31.width-_resizeIndicatorOffset.width,_32.height-_31.height-_resizeIndicatorOffset.height,_31.width,_31.height));
objj_msgSend(_resizeIndicator,"setImage:",_1);
objj_msgSend(_resizeIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_2e,"addSubview:",_resizeIndicator);
}else{
objj_msgSend(_resizeIndicator,"removeFromSuperview");
_resizeIndicator=nil;
}
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_33,_34){
with(_33){
return _resizeIndicator!==nil;
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_35,_36,_37){
with(_35){
if(CGSizeEqualToSize(_resizeIndicatorOffset,_37)){
return;
}
_resizeIndicatorOffset=_37;
if(!_resizeIndicator){
return;
}
var _38=objj_msgSend(_resizeIndicator,"frame").size,_39=objj_msgSend(_35,"frame").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_39.width-_38.width-_37.width,_39.height-_38.height-_37.height));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_3a,_3b){
with(_3a){
return _resizeIndicatorOffset;
}
}),new objj_method(sel_getUid("windowDidChangeDocumentEdited"),function(_3c,_3d){
with(_3c){
}
}),new objj_method(sel_getUid("windowDidChangeDocumentSaving"),function(_3e,_3f){
with(_3e){
}
}),new objj_method(sel_getUid("showsToolbar"),function(_40,_41){
with(_40){
return YES;
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_42,_43){
with(_42){
return CGSizeMakeZero();
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_44,_45){
with(_44){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarMaxY"),function(_46,_47){
with(_46){
if(!_toolbarView||objj_msgSend(_toolbarView,"isHidden")){
return objj_msgSend(_46,"toolbarOffset").height;
}
return CGRectGetMaxY(objj_msgSend(_toolbarView,"frame"));
}
}),new objj_method(sel_getUid("toolbarView"),function(_48,_49){
with(_48){
return _toolbarView;
}
}),new objj_method(sel_getUid("tile"),function(_4a,_4b){
with(_4a){
var _4c=objj_msgSend(_4a,"window"),_4d=objj_msgSend(_4a,"bounds"),_4e=CGRectGetWidth(_4d);
if(objj_msgSend(objj_msgSend(_4c,"toolbar"),"isVisible")){
var _4f=objj_msgSend(_4a,"toolbarView"),_50=objj_msgSend(_4a,"toolbarOffset");
objj_msgSend(_4f,"setFrame:",CGRectMake(_50.width,_50.height,_4e,CGRectGetHeight(objj_msgSend(_4f,"frame"))));
}
if(objj_msgSend(_4a,"showsResizeIndicator")){
var _51=objj_msgSend(_resizeIndicator,"frame").size,_52=objj_msgSend(_4a,"bounds").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_52.width-_51.width-_resizeIndicatorOffset.width,_52.height-_51.height-_resizeIndicatorOffset.height));
}
}
}),new objj_method(sel_getUid("noteToolbarChanged"),function(_53,_54){
with(_53){
var _55=objj_msgSend(_53,"window"),_56=objj_msgSend(_55,"toolbar"),_57=objj_msgSend(_56,"_toolbarView");
if(_toolbarView!==_57){
objj_msgSend(_toolbarView,"removeFromSuperview");
if(_57){
objj_msgSend(_57,"removeFromSuperview");
objj_msgSend(_57,"setLabelColor:",objj_msgSend(_53,"toolbarLabelColor"));
if(objj_msgSend(_53,"respondsToSelector:",sel_getUid("toolbarLabelShadowColor"))){
objj_msgSend(_57,"setLabelShadowColor:",objj_msgSend(_53,"toolbarLabelShadowColor"));
}
objj_msgSend(_53,"addSubview:",_57);
}
_toolbarView=_57;
}
objj_msgSend(_57,"setHidden:",!objj_msgSend(_53,"showsToolbar")||!objj_msgSend(_56,"isVisible"));
if(_55){
var _58=objj_msgSend(_53,"convertRect:toView:",objj_msgSend(objj_msgSend(_55,"contentView"),"frame"),nil);
_58.origin=objj_msgSend(_55,"convertBaseToGlobal:",_58.origin);
objj_msgSend(_53,"setAutoresizesSubviews:",NO);
objj_msgSend(_55,"setFrame:",objj_msgSend(_55,"frameRectForContentRect:",_58));
objj_msgSend(_53,"setAutoresizesSubviews:",YES);
}
objj_msgSend(_53,"tile");
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_59,_5a,_5b){
with(_59){
if(!_resizeIndicator||_5b===_resizeIndicator){
return;
}
objj_msgSend(_59,"addSubview:",_resizeIndicator);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_5c,_5d){
with(_5c){
if(_5c!=objj_msgSend(_CPWindowView,"class")){
return;
}
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class")),"pathForResource:","_CPWindowView/_CPWindowViewResizeIndicator.png"),CGSizeMake(12,12));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_5e,_5f,_60){
with(_5e){
return CGRectMakeCopy(_60);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_61,_62,_63){
with(_61){
return CGRectMakeCopy(_63);
}
})]);
