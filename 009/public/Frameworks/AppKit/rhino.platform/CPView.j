I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;40582;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3=objj_allocateClassPair(CPResponder,"CPView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_displayHash"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPResponder")},"init");
if(_7){
var _a=(_9.size.width),_b=(_9.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_9.origin.x,y:_9.origin.y},size:{width:_9.size.width,height:_9.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_a,height:_b}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_displayHash=objj_msgSend(_7,"hash");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_7,"_loadThemeAttributes");
}
return _7;
}
}),new objj_method(sel_getUid("superview"),function(_c,_d){
with(_c){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_e,_f){
with(_e){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_10,_11){
with(_10){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"_insertSubview:atIndex:",_14,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_15,_16,_17,_18,_19){
with(_15){
var _1a=_19?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_19):CPNotFound;
if(_1a===CPNotFound){
_1a=(_18===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_18===CPWindowAbove){
++_1a;
}
}
objj_msgSend(_15,"_insertSubview:atIndex:",_17,_1a);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=_subviews.length;
objj_msgSend(objj_msgSend(_1b,"window"),"_dirtyKeyViewLoop");
if(_1d._superview==_1b){
var _20=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_1d);
if(_20===_1e||_20===_1f-1&&_1e===_1f){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_20);
if(_1e>_20){
--_1e;
}
--_1f;
}else{
objj_msgSend(_1d,"removeFromSuperview");
objj_msgSend(_1d,"_setWindow:",_window);
objj_msgSend(_1d,"viewWillMoveToSuperview:",_1b);
_1d._superview=_1b;
}
if(_1e===CPNotFound||_1e>=_1f){
_subviews.push(_1d);
}else{
_subviews.splice(_1e,0,_1d);
}
objj_msgSend(_1d,"setNextResponder:",_1b);
objj_msgSend(_1d,"viewDidMoveToSuperview");
objj_msgSend(_1b,"didAddSubview:",_1d);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_21,_22,_23){
with(_21){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_24,_25){
with(_24){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_24,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_24);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_24);
_superview=nil;
objj_msgSend(_24,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_26,_27,_28,_29){
with(_26){
if(_28._superview!=_26){
return;
}
var _2a=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_28);
objj_msgSend(_28,"removeFromSuperview");
objj_msgSend(_26,"_insertSubview:atIndex:",_29,_2a);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_2b,_2c,_2d){
with(_2b){
if(_window===_2d){
return;
}
objj_msgSend(objj_msgSend(_2b,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_2b){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_2b,"viewWillMoveToWindow:",_2d);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_2d,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_2d;
var _2e=objj_msgSend(_subviews,"count");
while(_2e--){
objj_msgSend(_subviews[_2e],"_setWindow:",_2d);
}
objj_msgSend(_2b,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_2b,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_2f,_30,_31){
with(_2f){
var _32=_2f;
do{
if(_32==_31){
return YES;
}
}while(_32=objj_msgSend(_32,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_33,_34){
with(_33){
objj_msgSend(_33,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_35,_36){
with(_35){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_37,_38,_39){
with(_37){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_3a,_3b,_3c){
with(_3a){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_3d,_3e,_3f){
with(_3d){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_40,_41){
with(_40){
var _42=_40;
while(_42&&!objj_msgSend(_42,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_42=objj_msgSend(_42,"superview");
}
if(_42){
return _42._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_43,_44,_45){
with(_43){
_tag=_45;
}
}),new objj_method(sel_getUid("tag"),function(_46,_47){
with(_46){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_48,_49,_4a){
with(_48){
if(objj_msgSend(_48,"tag")===_4a){
return _48;
}
var _4b=0,_4c=_subviews.length;
for(;_4b<_4c;++_4b){
var _4d=objj_msgSend(_subviews[_4b],"viewWithTag:",_4a);
if(_4d){
return _4d;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_4e,_4f){
with(_4e){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_50,_51,_52){
with(_50){
if(((_frame.origin.x==_52.origin.x&&_frame.origin.y==_52.origin.y)&&(_frame.size.width==_52.size.width&&_frame.size.height==_52.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_50,"setFrameOrigin:",_52.origin);
objj_msgSend(_50,"setFrameSize:",_52.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_50);
}
}
}),new objj_method(sel_getUid("frame"),function(_53,_54){
with(_53){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setCenter:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"setFrameOrigin:",CGPointMake(_57.x-_frame.size.width/2,_57.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_58,_59){
with(_58){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=_frame.origin;
if(!_5c||(_5d.x==_5c.x&&_5d.y==_5c.y)){
return;
}
_5d.x=_5c.x;
_5d.y=_5c.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5a);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_5e,_5f,_60){
with(_5e){
var _61=_frame.size;
if(!_60||(_61.width==_60.width&&_61.height==_60.height)){
return;
}
var _62={width:_61.width,height:_61.height};
_61.width=_60.width;
_61.height=_60.height;
if(YES){
_bounds.size.width=_60.width;
_bounds.size.height=_60.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_5e,"resizeSubviewsWithOldSize:",_62);
}
objj_msgSend(_5e,"setNeedsLayout");
objj_msgSend(_5e,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5e);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_63,_64,_65){
with(_63){
if(((_bounds.origin.x==_65.origin.x&&_bounds.origin.y==_65.origin.y)&&(_bounds.size.width==_65.size.width&&_bounds.size.height==_65.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_63,"setBoundsOrigin:",_65.origin);
objj_msgSend(_63,"setBoundsSize:",_65.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_63);
}
}
}),new objj_method(sel_getUid("bounds"),function(_66,_67){
with(_66){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_68,_69,_6a){
with(_68){
var _6b=_bounds.origin;
if((_6b.x==_6a.x&&_6b.y==_6a.y)){
return;
}
_6b.x=_6a.x;
_6b.y=_6a.y;
if(_6b.x!=0||_6b.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_6b.x,ty:-_6b.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_68);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=_bounds.size;
if((_6f.width==_6e.width&&_6f.height==_6e.height)){
return;
}
var _70=_frame.size;
if(!(_6f.width==_70.width&&_6f.height==_70.height)){
var _71=_bounds.origin;
_71.x/=_6f.width/_70.width;
_71.y/=_6f.height/_70.height;
}
_6f.width=_6e.width;
_6f.height=_6e.height;
if(!(_6f.width==_70.width&&_6f.height==_70.height)){
var _71=_bounds.origin;
_71.x*=_6f.width/_70.width;
_71.y*=_6f.height/_70.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6c);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_72,"autoresizingMask");
if(_75==CPViewNotSizable){
return;
}
var _76=_superview._frame,_77={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_76.size.width)-_74.width)/(((_75&CPViewMinXMargin)?1:0)+(_75&CPViewWidthSizable?1:0)+(_75&CPViewMaxXMargin?1:0)),dY=((_76.size.height)-_74.height)/((_75&CPViewMinYMargin?1:0)+(_75&CPViewHeightSizable?1:0)+(_75&CPViewMaxYMargin?1:0));
if(_75&CPViewMinXMargin){
_77.origin.x+=dX;
}
if(_75&CPViewWidthSizable){
_77.size.width+=dX;
}
if(_75&CPViewMinYMargin){
_77.origin.y+=dY;
}
if(_75&CPViewHeightSizable){
_77.size.height+=dY;
}
objj_msgSend(_72,"setFrame:",_77);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_7a,_7b,_7c){
with(_7a){
var _7d=_subviews.length;
while(_7d--){
objj_msgSend(_subviews[_7d],"resizeWithOldSuperviewSize:",_7c);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_7e,_7f,_80){
with(_7e){
_autoresizesSubviews=!!_80;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_81,_82){
with(_81){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_83,_84,_85){
with(_83){
_autoresizingMask=_85;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_86,_87){
with(_86){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_88,_89){
with(_88){
return objj_msgSend(_88,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_8a,_8b,_8c,_8d){
with(_8a){
_fullScreenModeState=_8e(_8a);
var _8f=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_8f,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_8f,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _90=objj_msgSend(_8f,"contentView");
objj_msgSend(_90,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_90,"addSubview:",_8a);
objj_msgSend(_8a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_8a,"setFrame:",CGRectMakeCopy(objj_msgSend(_90,"bounds")));
objj_msgSend(_8f,"makeKeyAndOrderFront:",_8a);
objj_msgSend(_8f,"makeFirstResponder:",_8a);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_91,_92){
with(_91){
objj_msgSend(_91,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_93,_94,_95){
with(_93){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_93,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_93,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_93,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_93,"window"),"orderOut:",_93);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_96,_97){
with(_96){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_98,_99,_9a){
with(_98){
_9a=!!_9a;
if(_isHidden===_9a){
return;
}
_isHidden=_9a;
if(_9a){
var _9b=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_9b,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_98==_9b){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_98,"nextValidKeyView"));
break;
}
}while(_9b=objj_msgSend(_9b,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_9c,_9d){
with(_9c){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_9e,_9f,_a0){
with(_9e){
if(_opacity==_a0){
return;
}
_opacity=_a0;
}
}),new objj_method(sel_getUid("alphaValue"),function(_a1,_a2){
with(_a1){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_a3,_a4){
with(_a3){
var _a5=_a3;
while(_a5&&!objj_msgSend(_a5,"isHidden")){
_a5=objj_msgSend(_a5,"superview");
}
return _a5!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_a6,_a7,_a8){
with(_a6){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_a9,_aa){
with(_a9){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_ab,_ac,_ad){
with(_ab){
_hitTests=!!_ad;
}
}),new objj_method(sel_getUid("hitTest:"),function(_ae,_af,_b0){
with(_ae){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_b0)){
return nil;
}
var _b1=nil,i=_subviews.length,_b3={x:_b0.x-(_frame.origin.x),y:_b0.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_b3={x:_b3.x*_inverseBoundsTransform.a+_b3.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_b3.x*_inverseBoundsTransform.b+_b3.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_b1=objj_msgSend(_subviews[i],"hitTest:",_b3)){
return _b1;
}
}
return _ae;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_b4,_b5){
with(_b4){
return !objj_msgSend(_b4,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_b6,_b7,_b8){
with(_b6){
if(objj_msgSend(_b6,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_b6,super_class:objj_getClass("CPResponder")},"mouseDown:",_b8);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_b9,_ba,_bb){
with(_b9){
if(_backgroundColor==_bb){
return;
}
_backgroundColor=_bb;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_bc,_bd){
with(_bc){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_be,_bf,_c0,_c1){
with(_be){
return CGPointApplyAffineTransform(_c0,_c2(_c1,_be));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_c3,_c4,_c5,_c6){
with(_c3){
return CGPointApplyAffineTransform(_c5,_c2(_c3,_c6));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_c7,_c8,_c9,_ca){
with(_c7){
return CGSizeApplyAffineTransform(_c9,_c2(_ca,_c7));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_cb,_cc,_cd,_ce){
with(_cb){
return CGSizeApplyAffineTransform(_cd,_c2(_cb,_ce));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_cf,_d0,_d1,_d2){
with(_cf){
return CGRectApplyAffineTransform(_d1,_c2(_d2,_cf));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_d3,_d4,_d5,_d6){
with(_d3){
return CGRectApplyAffineTransform(_d5,_c2(_d3,_d6));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_d7,_d8,_d9){
with(_d7){
_d9=!!_d9;
if(_postsFrameChangedNotifications===_d9){
return;
}
_postsFrameChangedNotifications=_d9;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_d7);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_da,_db){
with(_da){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_dc,_dd,_de){
with(_dc){
_de=!!_de;
if(_postsBoundsChangedNotifications===_de){
return;
}
_postsBoundsChangedNotifications=_de;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_dc);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_df,_e0){
with(_df){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_e1,_e2,_e3,_e4,_e5,_e6,_e7,_e8,_e9){
with(_e1){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_e3,objj_msgSend(_e1,"convertPoint:toView:",_e4,nil),_e5,_e6,_e7,_e8,_e9);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_ea,_eb,_ec,_ed,_ee,_ef,_f0,_f1,_f2){
with(_ea){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_ec,objj_msgSend(_ea,"convertPoint:toView:",_ed,nil),_ee,_ef,_f0,_f1,_f2);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_f3,_f4,_f5){
with(_f3){
if(!_f5){
return;
}
var _f6=objj_msgSend(_f3,"window");
objj_msgSend(_f6,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_f5);
objj_msgSend(_f6,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_f7,_f8){
with(_f7){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_f9,_fa){
with(_f9){
objj_msgSend(objj_msgSend(_f9,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(_fb,_fc,_fd){
with(_fb){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(_fe,_ff,_100){
with(_fe){
if(_100){
objj_msgSend(_fe,"setNeedsDisplayInRect:",objj_msgSend(_fe,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_103){
with(self){
if((_103.size.width<=0||_103.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_103,_dirtyRect);
}else{
_dirtyRect={origin:{x:_103.origin.x,y:_103.origin.y},size:{width:_103.size.width,height:_103.size.height}};
}
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_cmd){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_10c){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_10c);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_10f){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_10f,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_112,_113){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_112);
objj_msgSend(self,"drawRect:",_112);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _118=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_118.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
if(_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMContentsElement;
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_118,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_cmd){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_cmd){
with(self){
_needsLayout=YES;
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_cmd){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_cmd){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_cmd){
with(self){
var _127=_superview,_128=objj_msgSend(CPClipView,"class");
while(_127&&!objj_msgSend(_127,"isKindOfClass:",_128)){
_127=_127._superview;
}
return _127;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_12b){
with(self){
var _12c=objj_msgSend(self,"_enclosingClipView");
if(!_12c){
return;
}
objj_msgSend(_12c,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_12b,_12c));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_12f){
with(self){
var _130=objj_msgSend(self,"visibleRect");
_12f=CGRectIntersection(_12f,_bounds);
if((_12f.size.width<=0||_12f.size.height<=0)||CGRectContainsRect(_130,_12f)){
return NO;
}
var _131=objj_msgSend(self,"_enclosingClipView");
if(!_131){
return NO;
}
var _132={x:_130.origin.x,y:_130.origin.y};
if((_12f.origin.x)<=(_130.origin.x)){
_132.x=(_12f.origin.x);
}else{
if((_12f.origin.x+_12f.size.width)>(_130.origin.x+_130.size.width)){
_132.x+=(_12f.origin.x+_12f.size.width)-(_130.origin.x+_130.size.width);
}
}
if((_12f.origin.y)<=(_130.origin.y)){
_132.y=CGRectGetMinY(_12f);
}else{
if((_12f.origin.y+_12f.size.height)>(_130.origin.y+_130.size.height)){
_132.y+=(_12f.origin.y+_12f.size.height)-(_130.origin.y+_130.size.height);
}
}
objj_msgSend(_131,"scrollToPoint:",CGPointMake(_132.x,_132.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_135){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_135);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_138){
with(self){
return _138;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_13b,_13c){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _13f=_superview,_140=objj_msgSend(CPScrollView,"class");
while(_13f&&!objj_msgSend(_13f,"isKindOfClass:",_140)){
_13f=_13f._superview;
}
return _13f;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_143,_144){
with(self){
objj_msgSend(_143,"scrollToPoint:",_144);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_147){
with(self){
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _150=objj_msgSend(self,"nextKeyView");
while(_150&&!objj_msgSend(_150,"canBecomeKeyView")){
_150=objj_msgSend(_150,"nextKeyView");
}
return _150;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _155=objj_msgSend(self,"previousKeyView");
while(_155&&!objj_msgSend(_155,"canBecomeKeyView")){
_155=objj_msgSend(_155,"previousKeyView");
}
return _155;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_158){
with(self){
_previousKeyView=_158;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_15e){
with(self){
if(_layer==_15e){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_15e;
if(_layer){
var _15f=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_164){
with(self){
_wantsLayer=!!_164;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_16b){
with(self){
return !!(_themeState&((typeof _16b==="string")?CPThemeState(_16b):_16b));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_16e){
with(self){
var _16f=(typeof _16e==="string")?CPThemeState(_16e):_16e;
if(_themeState&_16f){
return NO;
}
_themeState|=_16f;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_172){
with(self){
var _173=((typeof _172==="string")?CPThemeState(_172):_172);
if(!(_themeState&_173)){
return NO;
}
_themeState&=~_173;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _176=objj_msgSend(self,"class"),_177=objj_msgSend(_176,"_themeAttributes"),_178=_177.length;
if(!_178){
return;
}
var _179=objj_msgSend(self,"theme"),_17a=objj_msgSend(_176,"themeClass");
_themeAttributes={};
while(_178--){
var _17b=_177[_178--],_17c=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_17b,_177[_178]);
objj_msgSend(_17c,"setParentAttribute:",objj_msgSend(_179,"_attributeWithName:forClass:",_17b,_17a));
_themeAttributes[_17b]=_17c;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_17f){
with(self){
if(_theme===_17f){
return;
}
_theme=_17f;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
if(!_themeAttributes){
return;
}
var _184=objj_msgSend(self,"theme"),_185=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _186 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_186)){
objj_msgSend(_themeAttributes[_186],"setParentAttribute:",objj_msgSend(_184,"_attributeWithName:forClass:",_186,_185));
}
}
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _189=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _18a=objj_msgSend(self,"theme");
for(var _18b in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_18b)){
objj_msgSend(_189,"setObject:forKey:",_themeAttributes[_18b],_18b);
}
}
}
return _189;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_18e,_18f,_190){
with(self){
if(!_themeAttributes||!_themeAttributes[_18f]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_18f+"'");
}
var _191=objj_msgSend(self,"currentValueForThemeAttribute:",_18f);
objj_msgSend(_themeAttributes[_18f],"setValue:forState:",_18e,_190);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_18f)===_191){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_194,_195){
with(self){
if(!_themeAttributes||!_themeAttributes[_195]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_195+"'");
}
var _196=objj_msgSend(self,"currentValueForThemeAttribute:",_195);
objj_msgSend(_themeAttributes[_195],"setValue:",_194);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_195)===_196){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_199,_19a){
with(self){
if(!_themeAttributes||!_themeAttributes[_199]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_199+"'");
}
return objj_msgSend(_themeAttributes[_199],"valueForState:",_19a);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_19d){
with(self){
if(!_themeAttributes||!_themeAttributes[_19d]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_19d+"'");
}
return objj_msgSend(_themeAttributes[_19d],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1a0){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a0]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a0+"'");
}
return objj_msgSend(_themeAttributes[_1a0],"valueForState:",_themeState);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_cmd){
with(self){
if(!_2){
_2={};
}
var _1a7=objj_msgSend(self,"class"),_1a8=objj_msgSend(CPView,"class"),_1a9=[];
for(;_1a7&&_1a7!==_1a8;_1a7=objj_msgSend(_1a7,"superclass")){
var _1aa=_2[class_getName(_1a7)];
if(_1aa){
_1a9=_1a9.length?_1a9.concat(_1aa):_1a9;
_2[objj_msgSend(self,"className")]=_1a9;
break;
}
var _1ab=objj_msgSend(_1a7,"themeAttributes");
if(!_1ab){
continue;
}
var _1ac=objj_msgSend(_1ab,"allKeys"),_1ad=_1ac.length;
while(_1ad--){
var _1ae=_1ac[_1ad];
_1a9.push(objj_msgSend(_1ab,"objectForKey:",_1ae));
_1a9.push(_1ae);
}
}
return _1a9;
}
})]);
var _1af="CPViewAutoresizingMask",_1b0="CPViewAutoresizesSubviews",_1b1="CPViewBackgroundColor",_1b2="CPViewBoundsKey",_1b3="CPViewFrameKey",_1b4="CPViewHitTestsKey",_1b5="CPViewIsHiddenKey",_1b6="CPViewOpacityKey",_1b7="CPViewSubviewsKey",_1b8="CPViewSuperviewKey",_1b9="CPViewTagKey",_1ba="CPViewThemeStateKey",_1bb="CPViewWindowKey",_1bc="CPViewNextKeyViewKey",_1bd="CPViewPreviousKeyViewKey";
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1c0){
with(self){
_frame=objj_msgSend(_1c0,"decodeRectForKey:",_1b3);
_bounds=objj_msgSend(_1c0,"decodeRectForKey:",_1b2);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1c0);
if(self){
_tag=objj_msgSend(_1c0,"containsValueForKey:",_1b9)?objj_msgSend(_1c0,"decodeIntForKey:",_1b9):-1;
_window=objj_msgSend(_1c0,"decodeObjectForKey:",_1bb);
_subviews=objj_msgSend(_1c0,"decodeObjectForKey:",_1b7)||[];
_superview=objj_msgSend(_1c0,"decodeObjectForKey:",_1b8);
_autoresizingMask=objj_msgSend(_1c0,"decodeIntForKey:",_1af)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1c0,"containsValueForKey:",_1b0)||objj_msgSend(_1c0,"decodeBoolForKey:",_1b0);
_hitTests=!objj_msgSend(_1c0,"containsValueForKey:",_1b4)||objj_msgSend(_1c0,"decodeObjectForKey:",_1b4);
_displayHash=objj_msgSend(self,"hash");
if(objj_msgSend(_1c0,"containsValueForKey:",_1b5)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1c0,"decodeBoolForKey:",_1b5));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1c0,"containsValueForKey:",_1b6)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1c0,"decodeIntForKey:",_1b6));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1c0,"decodeObjectForKey:",_1b1));
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1c0,"decodeIntForKey:",_1ba));
_themeAttributes={};
var _1c1=objj_msgSend(self,"class"),_1c2=objj_msgSend(_1c1,"themeClass"),_1c3=objj_msgSend(_1c1,"_themeAttributes"),_1c4=_1c3.length;
while(_1c4--){
var _1c5=_1c3[_1c4--];
_themeAttributes[_1c5]=CPThemeAttributeDecode(_1c0,_1c5,_1c3[_1c4],_theme,_1c2);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1c8){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1c8);
if(_tag!==-1){
objj_msgSend(_1c8,"encodeInt:forKey:",_tag,_1b9);
}
objj_msgSend(_1c8,"encodeRect:forKey:",_frame,_1b3);
objj_msgSend(_1c8,"encodeRect:forKey:",_bounds,_1b2);
if(_window!==nil){
objj_msgSend(_1c8,"encodeConditionalObject:forKey:",_window,_1bb);
}
if(_subviews.length>0){
objj_msgSend(_1c8,"encodeObject:forKey:",_subviews,_1b7);
}
if(_superview!==nil){
objj_msgSend(_1c8,"encodeConditionalObject:forKey:",_superview,_1b8);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1c8,"encodeInt:forKey:",_autoresizingMask,_1af);
}
if(!_autoresizesSubviews){
objj_msgSend(_1c8,"encodeBool:forKey:",_autoresizesSubviews,_1b0);
}
if(_backgroundColor!==nil){
objj_msgSend(_1c8,"encodeObject:forKey:",_backgroundColor,_1b1);
}
if(_hitTests!==YES){
objj_msgSend(_1c8,"encodeBool:forKey:",_hitTests,_1b4);
}
if(_opacity!==1){
objj_msgSend(_1c8,"encodeFloat:forKey:",_opacity,_1b6);
}
if(_isHidden){
objj_msgSend(_1c8,"encodeBool:forKey:",_isHidden,_1b5);
}
var _1c9=objj_msgSend(self,"nextKeyView");
if(_1c9!==nil){
objj_msgSend(_1c8,"encodeConditionalObject:forKey:",_1c9,_1bc);
}
var _1ca=objj_msgSend(self,"previousKeyView");
if(_1ca!==nil){
objj_msgSend(_1c8,"encodeConditionalObject:forKey:",_1ca,_1bd);
}
objj_msgSend(_1c8,"encodeInt:forKey:",CPThemeStateName(_themeState),_1ba);
for(var _1cb in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1cb)){
CPThemeAttributeEncode(_1c8,_themeAttributes[_1cb]);
}
}
}
})]);
var _8e=function(_1cc){
var _1cd=_1cc._superview;
return {autoresizingMask:_1cc._autoresizingMask,frame:CGRectMakeCopy(_1cc._frame),index:(_1cd?objj_msgSend(_1cd._subviews,"indexOfObjectIdenticalTo:",_1cc):0),superview:_1cd};
};
var _c2=function(_1ce,_1cf){
var _1d0=CGAffineTransformMakeIdentity(),_1d1=YES,_1d2=nil,_1d3=nil;
if(_1ce){
var view=_1ce;
while(view&&view!=_1cf){
var _1d5=view._frame;
_1d0.tx+=(_1d5.origin.x);
_1d0.ty+=(_1d5.origin.y);
if(view._boundsTransform){
var tx=_1d0.tx*view._boundsTransform.a+_1d0.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1d0.ty=_1d0.tx*view._boundsTransform.b+_1d0.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1d0.tx=tx;
var a=_1d0.a*view._boundsTransform.a+_1d0.b*view._boundsTransform.c,b=_1d0.a*view._boundsTransform.b+_1d0.b*view._boundsTransform.d,c=_1d0.c*view._boundsTransform.a+_1d0.d*view._boundsTransform.c;
_1d0.d=_1d0.c*view._boundsTransform.b+_1d0.d*view._boundsTransform.d;
_1d0.a=a;
_1d0.b=b;
_1d0.c=c;
}
view=view._superview;
}
if(view===_1cf){
return _1d0;
}else{
if(_1ce&&_1cf){
_1d2=objj_msgSend(_1ce,"window");
_1d3=objj_msgSend(_1cf,"window");
if(_1d2&&_1d3&&_1d2!==_1d3){
_1d1=NO;
var _1d5=objj_msgSend(_1d2,"frame");
_1d0.tx+=(_1d5.origin.x);
_1d0.ty+=(_1d5.origin.y);
}
}
}
}
var view=_1cf;
while(view){
var _1d5=view._frame;
_1d0.tx-=(_1d5.origin.x);
_1d0.ty-=(_1d5.origin.y);
if(view._boundsTransform){
var tx=_1d0.tx*view._inverseBoundsTransform.a+_1d0.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1d0.ty=_1d0.tx*view._inverseBoundsTransform.b+_1d0.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1d0.tx=tx;
var a=_1d0.a*view._inverseBoundsTransform.a+_1d0.b*view._inverseBoundsTransform.c,b=_1d0.a*view._inverseBoundsTransform.b+_1d0.b*view._inverseBoundsTransform.d,c=_1d0.c*view._inverseBoundsTransform.a+_1d0.d*view._inverseBoundsTransform.c;
_1d0.d=_1d0.c*view._inverseBoundsTransform.b+_1d0.d*view._inverseBoundsTransform.d;
_1d0.a=a;
_1d0.b=b;
_1d0.c=c;
}
view=view._superview;
}
if(!_1d1){
var _1d5=objj_msgSend(_1d3,"frame");
_1d0.tx-=(_1d5.origin.x);
_1d0.ty-=(_1d5.origin.y);
}
return _1d0;
};
