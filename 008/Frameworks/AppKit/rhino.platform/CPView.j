I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;37098;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=1<<0,_2=1<<1;
var _3=nil,_4=nil;
var _5=objj_allocateClassPair(CPResponder,"CPView"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_displayHash"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themedAttributes"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPResponder")},"init");
if(_9){
var _c=(_b.size.width),_d=(_b.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_b.origin.x,y:_b.origin.y},size:{width:_b.size.width,height:_b.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_c,height:_d}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_displayHash=objj_msgSend(_9,"hash");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themedAttributes={};
objj_msgSend(_9,"_loadThemedAttributes");
}
return _9;
}
}),new objj_method(sel_getUid("superview"),function(_e,_f){
with(_e){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_10,_11){
with(_10){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_12,_13){
with(_12){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"_insertSubview:atIndex:",_16,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_17,_18,_19,_1a,_1b){
with(_17){
var _1c=_1b?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_1b):CPNotFound;
if(_1c===CPNotFound){
_1c=(_1a===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_1a===CPWindowAbove){
++_1c;
}
}
objj_msgSend(_17,"_insertSubview:atIndex:",_19,_1c);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_1d,_1e,_1f,_20){
with(_1d){
var _21=_subviews.length;
objj_msgSend(objj_msgSend(_1d,"window"),"_dirtyKeyViewLoop");
if(_1f._superview==_1d){
var _22=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_1f);
if(_22===_20||_22===_21-1&&_20===_21){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_22);
if(_20>_22){
--_20;
}
--_21;
}else{
objj_msgSend(_1f,"removeFromSuperview");
objj_msgSend(_1f,"_setWindow:",_window);
objj_msgSend(_1f,"viewWillMoveToSuperview:",_1d);
_1f._superview=_1d;
}
if(_20===CPNotFound||_20>=_21){
_subviews.push(_1f);
}else{
_subviews.splice(_20,0,_1f);
}
objj_msgSend(_1f,"setNextResponder:",_1d);
objj_msgSend(_1f,"viewDidMoveToSuperview");
objj_msgSend(_1d,"didAddSubview:",_1f);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_23,_24,_25){
with(_23){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_26,_27){
with(_26){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_26,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_26);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_26);
_superview=nil;
objj_msgSend(_26,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_28,_29,_2a,_2b){
with(_28){
if(_2a._superview!=_28){
return;
}
var _2c=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_2a);
objj_msgSend(_2a,"removeFromSuperview");
objj_msgSend(_28,"_insertSubview:atIndex:",_2b,_2c);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_2d,_2e,_2f){
with(_2d){
if(_window===_2f){
return;
}
objj_msgSend(objj_msgSend(_2d,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_2d){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_2d,"viewWillMoveToWindow:",_2f);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_2f,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_2f;
var _30=objj_msgSend(_subviews,"count");
while(_30--){
objj_msgSend(_subviews[_30],"_setWindow:",_2f);
}
objj_msgSend(_2d,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_2d,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_31,_32,_33){
with(_31){
var _34=_31;
do{
if(_34==_33){
return YES;
}
}while(_34=objj_msgSend(_34,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_35,_36){
with(_35){
objj_msgSend(_35,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_37,_38){
with(_37){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_39,_3a,_3b){
with(_39){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_3c,_3d,_3e){
with(_3c){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_42,_43){
with(_42){
var _44=_42;
while(_44&&!objj_msgSend(_44,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_44=objj_msgSend(_44,"superview");
}
if(_44){
return _44._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("tag"),function(_45,_46){
with(_45){
return _tag;
}
}),new objj_method(sel_getUid("isFlipped"),function(_47,_48){
with(_47){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_49,_4a,_4b){
with(_49){
if(((_frame.origin.x==_4b.origin.x&&_frame.origin.y==_4b.origin.y)&&(_frame.size.width==_4b.size.width&&_frame.size.height==_4b.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_49,"setFrameOrigin:",_4b.origin);
objj_msgSend(_49,"setFrameSize:",_4b.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_49);
}
}
}),new objj_method(sel_getUid("frame"),function(_4c,_4d){
with(_4c){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setCenter:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_4e,"setFrameOrigin:",CGPointMake(_50.x-_frame.size.width/2,_50.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_51,_52){
with(_51){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_53,_54,_55){
with(_53){
var _56=_frame.origin;
if(!_55||(_56.x==_55.x&&_56.y==_55.y)){
return;
}
_56.x=_55.x;
_56.y=_55.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_53);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_57,_58,_59){
with(_57){
var _5a=_frame.size;
if(!_59||(_5a.width==_59.width&&_5a.height==_59.height)){
return;
}
var _5b={width:_5a.width,height:_5a.height};
_5a.width=_59.width;
_5a.height=_59.height;
if(YES){
_bounds.size.width=_59.width;
_bounds.size.height=_59.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_57,"resizeSubviewsWithOldSize:",_5b);
}
objj_msgSend(_57,"setNeedsLayout");
objj_msgSend(_57,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_57);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_5c,_5d,_5e){
with(_5c){
if(((_bounds.origin.x==_5e.origin.x&&_bounds.origin.y==_5e.origin.y)&&(_bounds.size.width==_5e.size.width&&_bounds.size.height==_5e.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_5c,"setBoundsOrigin:",_5e.origin);
objj_msgSend(_5c,"setBoundsSize:",_5e.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_5c);
}
}
}),new objj_method(sel_getUid("bounds"),function(_5f,_60){
with(_5f){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_61,_62,_63){
with(_61){
var _64=_bounds.origin;
if((_64.x==_63.x&&_64.y==_63.y)){
return;
}
_64.x=_63.x;
_64.y=_63.y;
if(_64.x!=0||_64.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_64.x,ty:-_64.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_61);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_65,_66,_67){
with(_65){
var _68=_bounds.size;
if((_68.width==_67.width&&_68.height==_67.height)){
return;
}
var _69=_frame.size;
if(!(_68.width==_69.width&&_68.height==_69.height)){
var _6a=_bounds.origin;
_6a.x/=_68.width/_69.width;
_6a.y/=_68.height/_69.height;
}
_68.width=_67.width;
_68.height=_67.height;
if(!(_68.width==_69.width&&_68.height==_69.height)){
var _6a=_bounds.origin;
_6a.x*=_68.width/_69.width;
_6a.y*=_68.height/_69.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_65);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=objj_msgSend(_6b,"autoresizingMask");
if(_6e==CPViewNotSizable){
return;
}
var _6f=_superview._frame,_70={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_6f.size.width)-_6d.width)/(((_6e&CPViewMinXMargin)?1:0)+(_6e&CPViewWidthSizable?1:0)+(_6e&CPViewMaxXMargin?1:0)),dY=((_6f.size.height)-_6d.height)/((_6e&CPViewMinYMargin?1:0)+(_6e&CPViewHeightSizable?1:0)+(_6e&CPViewMaxYMargin?1:0));
if(_6e&CPViewMinXMargin){
_70.origin.x+=dX;
}
if(_6e&CPViewWidthSizable){
_70.size.width+=dX;
}
if(_6e&CPViewMinYMargin){
_70.origin.y+=dY;
}
if(_6e&CPViewHeightSizable){
_70.size.height+=dY;
}
objj_msgSend(_6b,"setFrame:",_70);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_73,_74,_75){
with(_73){
var _76=_subviews.length;
while(_76--){
objj_msgSend(_subviews[_76],"resizeWithOldSuperviewSize:",_75);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_77,_78,_79){
with(_77){
_autoresizesSubviews=_79;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_7a,_7b){
with(_7a){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_7c,_7d,_7e){
with(_7c){
_autoresizingMask=_7e;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_7f,_80){
with(_7f){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_81,_82){
with(_81){
return objj_msgSend(_81,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_83,_84,_85,_86){
with(_83){
_fullScreenModeState=_87(_83);
var _88=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_88,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_88,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _89=objj_msgSend(_88,"contentView");
objj_msgSend(_89,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_89,"addSubview:",_83);
objj_msgSend(_83,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_83,"setFrame:",CGRectMakeCopy(objj_msgSend(_89,"bounds")));
objj_msgSend(_88,"makeKeyAndOrderFront:",_83);
objj_msgSend(_88,"makeFirstResponder:",_83);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_8a,_8b){
with(_8a){
objj_msgSend(_8a,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_8c,_8d,_8e){
with(_8c){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_8c,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_8c,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_8c,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_8c,"window"),"orderOut:",_8c);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_8f,_90){
with(_8f){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_91,_92,_93){
with(_91){
if(_isHidden==_93){
return;
}
_isHidden=_93;
if(_93){
var _94=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_94,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_91==_94){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_91,"nextValidKeyView"));
break;
}
}while(_94=objj_msgSend(_94,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_95,_96){
with(_95){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_97,_98,_99){
with(_97){
if(_opacity==_99){
return;
}
_opacity=_99;
}
}),new objj_method(sel_getUid("alphaValue"),function(_9a,_9b){
with(_9a){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_9c,_9d){
with(_9c){
var _9e=_9c;
while(_9e&&!objj_msgSend(_9e,"isHidden")){
_9e=objj_msgSend(_9e,"superview");
}
return _9e!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_9f,_a0,_a1){
with(_9f){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_a2,_a3){
with(_a2){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_a4,_a5,_a6){
with(_a4){
_hitTests=_a6;
}
}),new objj_method(sel_getUid("hitTest:"),function(_a7,_a8,_a9){
with(_a7){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_a9)){
return nil;
}
var _aa=nil,i=_subviews.length,_ac={x:_a9.x-(_frame.origin.x),y:_a9.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_ac={x:_ac.x*_inverseBoundsTransform.a+_ac.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_ac.x*_inverseBoundsTransform.b+_ac.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_aa=objj_msgSend(_subviews[i],"hitTest:",_ac)){
return _aa;
}
}
return _a7;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_ad,_ae){
with(_ad){
return !objj_msgSend(_ad,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_af,_b0,_b1){
with(_af){
if(objj_msgSend(_af,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_af,super_class:objj_getClass("CPResponder")},"mouseDown:",_b1);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_b2,_b3,_b4){
with(_b2){
if(_backgroundColor==_b4){
return;
}
_backgroundColor=_b4;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_b5,_b6){
with(_b5){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_b7,_b8,_b9,_ba){
with(_b7){
return CGPointApplyAffineTransform(_b9,_bb(_ba,_b7));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_bc,_bd,_be,_bf){
with(_bc){
return CGPointApplyAffineTransform(_be,_bb(_bc,_bf));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_c0,_c1,_c2,_c3){
with(_c0){
return CGSizeApplyAffineTransform(_c2,_bb(_c3,_c0));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_c4,_c5,_c6,_c7){
with(_c4){
return CGSizeApplyAffineTransform(_c6,_bb(_c4,_c7));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_c8,_c9,_ca,_cb){
with(_c8){
return CGRectApplyAffineTransform(_ca,_bb(_cb,_c8));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_cc,_cd,_ce,_cf){
with(_cc){
return CGRectApplyAffineTransform(_ce,_bb(_cc,_cf));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_d0,_d1,_d2){
with(_d0){
if(_postsFrameChangedNotifications==_d2){
return;
}
_postsFrameChangedNotifications=_d2;
if(_postsFrameChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_d0);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_d3,_d4){
with(_d3){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_d5,_d6,_d7){
with(_d5){
if(_postsBoundsChangedNotifications==_d7){
return;
}
_postsBoundsChangedNotifications=_d7;
if(_postsBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_d5);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_d8,_d9){
with(_d8){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_da,_db,_dc,_dd,_de,_df,_e0,_e1,_e2){
with(_da){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_dc,objj_msgSend(_da,"convertPoint:toView:",_dd,nil),_de,_df,_e0,_e1,_e2);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_e3,_e4,_e5,_e6,_e7,_e8,_e9,_ea,_eb){
with(_e3){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_e5,objj_msgSend(_e3,"convertPoint:toView:",_e6,nil),_e7,_e8,_e9,_ea,_eb);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_ec,_ed,_ee){
with(_ec){
if(!_ee){
return;
}
var _ef=objj_msgSend(_ec,"window");
objj_msgSend(_ef,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_ee);
objj_msgSend(_ef,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_f0,_f1){
with(_f0){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_f2,_f3){
with(_f2){
objj_msgSend(objj_msgSend(_f2,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(_f4,_f5,_f6){
with(_f4){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(_f7,_f8,_f9){
with(_f7){
if(_f9){
objj_msgSend(_f7,"setNeedsDisplayInRect:",objj_msgSend(_f7,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(_fa,_fb,_fc){
with(_fa){
if((_fc.size.width<=0||_fc.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_fc,_dirtyRect);
}else{
_dirtyRect={origin:{x:_fc.origin.x,y:_fc.origin.y},size:{width:_fc.size.width,height:_fc.size.height}};
}
}
}),new objj_method(sel_getUid("needsDisplay"),function(_fd,_fe){
with(_fd){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(_ff,_cmd){
with(_ff){
if(objj_msgSend(_ff,"needsDisplay")){
objj_msgSend(_ff,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_105){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_105);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_108){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_108,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_10b,_10c){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_10b);
objj_msgSend(self,"drawRect:",_10b);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _111=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_111.DOMElement;
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
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_111,YES);
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
var _120=_superview,_121=objj_msgSend(CPClipView,"class");
while(_120&&!objj_msgSend(_120,"isKindOfClass:",_121)){
_120=_120._superview;
}
return _120;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_124){
with(self){
var _125=objj_msgSend(self,"_enclosingClipView");
if(!_125){
return;
}
objj_msgSend(_125,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_124,_125));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_128){
with(self){
var _129=objj_msgSend(self,"visibleRect");
_128=CGRectIntersection(_128,_bounds);
if((_128.size.width<=0||_128.size.height<=0)||CGRectContainsRect(_129,_128)){
return NO;
}
var _12a=objj_msgSend(self,"_enclosingClipView");
if(!_12a){
return NO;
}
var _12b={x:_129.origin.x,y:_129.origin.y};
if((_128.origin.x)<=(_129.origin.x)){
_12b.x=(_128.origin.x);
}else{
if((_128.origin.x+_128.size.width)>(_129.origin.x+_129.size.width)){
_12b.x+=(_128.origin.x+_128.size.width)-(_129.origin.x+_129.size.width);
}
}
if((_128.origin.y)<=(_129.origin.y)){
_12b.y=CGRectGetMinY(_128);
}else{
if((_128.origin.y+_128.size.height)>(_129.origin.y+_129.size.height)){
_12b.y+=(_128.origin.y+_128.size.height)-(_129.origin.y+_129.size.height);
}
}
objj_msgSend(_12a,"scrollToPoint:",CGPointMake(_12b.x,_12b.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_12e){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_12e);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_131){
with(self){
return _131;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_134,_135){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _138=_superview,_139=objj_msgSend(CPScrollView,"class");
while(_138&&!objj_msgSend(_138,"isKindOfClass:",_139)){
_138=_138._superview;
}
return _138;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_13c,_13d){
with(self){
objj_msgSend(_13c,"scrollToPoint:",_13d);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_140){
with(self){
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(CPView,"class")){
return;
}
_3=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
var _5=objj_getClass("CPView");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _149=objj_msgSend(self,"nextKeyView");
while(_149&&!objj_msgSend(_149,"canBecomeKeyView")){
_149=objj_msgSend(_149,"nextKeyView");
}
return _149;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _14e=objj_msgSend(self,"previousKeyView");
while(_14e&&!objj_msgSend(_14e,"canBecomeKeyView")){
_14e=objj_msgSend(_14e,"previousKeyView");
}
return _14e;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_151){
with(self){
_previousKeyView=_151;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _5=objj_getClass("CPView");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_157){
with(self){
if(_layer==_157){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_157;
if(_layer){
var _158=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_15d){
with(self){
_wantsLayer=_15d;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _5=objj_getClass("CPView");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("_loadThemedAttributes"),function(self,_cmd){
with(self){
var _162=objj_msgSend(self,"theme"),_163=objj_msgSend(self,"class"),_164=objj_msgSend(_163,"_themedAttributes");
count=_164.length;
while(count--){
var _165=_164[count--];
_themedAttributes[_165]=CPThemedAttributeMake(_165,_164[count],_162,_163);
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_168){
with(self){
if(_theme===_168){
return;
}
_theme=_168;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
var _16d=objj_msgSend(self,"theme");
for(var _16e in _themedAttributes){
if(_themedAttributes.hasOwnProperty(_16e)){
objj_msgSend(_themedAttributes[_16e],"setTheme:",_16d);
}
}
}
}),new objj_method(sel_getUid("_themedAttributes"),function(self,_cmd){
with(self){
var _171=objj_msgSend(CPDictionary,"dictionary");
for(var _172 in _themedAttributes){
if(_themedAttributes.hasOwnProperty(_172)){
objj_msgSend(_171,"setObject:forKey:",_themedAttributes[_172],_172);
}
}
return _171;
}
}),new objj_method(sel_getUid("setValue:forThemedAttributeName:inControlState:"),function(self,_cmd,_175,_176,_177){
with(self){
var _178=_themedAttributes[_176];
if(!_178){
return;
}
var _179=objj_msgSend(self,"currentValueForThemedAttributeName:",_176);
objj_msgSend(_178,"setValue:forControlState:",_175,_177);
if(objj_msgSend(self,"currentValueForThemedAttributeName:",_176)===_179){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemedAttributeName:"),function(self,_cmd,_17c,_17d){
with(self){
var _17e=_themedAttributes[_17d];
if(!_17e){
return;
}
var _17f=objj_msgSend(self,"currentValueForThemedAttributeName:",_17d);
objj_msgSend(_17e,"setValue:",_17c);
if(objj_msgSend(self,"currentValueForThemedAttributeName:",_17d)===_17f){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemedAttributeName:inControlState:"),function(self,_cmd,_182,_183){
with(self){
return objj_msgSend(_themedAttributes[_182],"valueForControlState:",_183);
}
}),new objj_method(sel_getUid("valueForThemedAttributeName:"),function(self,_cmd,_186){
with(self){
return objj_msgSend(_themedAttributes[_186],"value");
}
}),new objj_method(sel_getUid("currentValueForThemedAttributeName:"),function(self,_cmd,_189){
with(self){
return objj_msgSend(_themedAttributes[_189],"valueForControlState:",_controlState);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("themedAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themedAttributes"),function(self,_cmd){
with(self){
if(!_4){
_4={};
}
var _18e=objj_msgSend(self,"class"),_18f=objj_msgSend(CPView,"class"),_190=[];
while(_18e&&_18e!==_18f){
var _191=_4[class_getName(_18e)];
if(_191){
_190=_190.length?_190.concat(_191):_190;
_4[objj_msgSend(self,"className")]=_190;
break;
}
var _192=objj_msgSend(_18e,"themedAttributes");
if(_192){
var _193=objj_msgSend(_192,"allKeys"),_194=_193.length;
while(_194--){
var _195=_193[_194];
_190.push(objj_msgSend(_192,"objectForKey:",_195));
_190.push(_195);
}
}
_18e=objj_msgSend(_18e,"superclass");
}
return _190;
}
})]);
var _196="CPViewAutoresizingMask",_197="CPViewAutoresizesSubviews",_198="CPViewBackgroundColor",_199="CPViewBoundsKey",_19a="CPViewFrameKey",_19b="CPViewHitTestsKey",_19c="CPViewIsHiddenKey",_19d="CPViewOpacityKey",_19e="CPViewSubviewsKey",_19f="CPViewSuperviewKey",_1a0="CPViewTagKey",_1a1="CPViewWindowKey",_1a2="CPViewNextKeyViewKey",_1a3="CPViewPreviousKeyViewKey";
var _5=objj_getClass("CPView");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1a6){
with(self){
_frame=objj_msgSend(_1a6,"decodeRectForKey:",_19a);
_bounds=objj_msgSend(_1a6,"decodeRectForKey:",_199);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1a6);
if(self){
_tag=-1;
if(objj_msgSend(_1a6,"containsValueForKey:",_1a0)){
_tag=objj_msgSend(_1a6,"decodeIntForKey:",_1a0);
}
_window=objj_msgSend(_1a6,"decodeObjectForKey:",_1a1);
_subviews=objj_msgSend(_1a6,"decodeObjectForKey:",_19e);
_superview=objj_msgSend(_1a6,"decodeObjectForKey:",_19f);
_autoresizingMask=objj_msgSend(_1a6,"decodeIntForKey:",_196)||0;
_autoresizesSubviews=objj_msgSend(_1a6,"decodeBoolForKey:",_197);
_hitTests=objj_msgSend(_1a6,"decodeObjectForKey:",_19b);
_isHidden=objj_msgSend(_1a6,"decodeObjectForKey:",_19c);
_opacity=objj_msgSend(_1a6,"decodeIntForKey:",_19d);
_displayHash=objj_msgSend(self,"hash");
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1a6,"decodeObjectForKey:",_198));
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themedAttributes={};
var _1a7=objj_msgSend(self,"class"),_1a8=objj_msgSend(_1a7,"_themedAttributes"),_1a9=_1a8.length;
while(_1a9--){
var _1aa=_1a8[_1a9--];
_themedAttributes[_1aa]=CPThemedAttributeDecode(_1a6,_1aa,_1a8[_1a9],_theme,_1a7);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1ad){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1ad);
if(_tag!=-1){
objj_msgSend(_1ad,"encodeInt:forKey:",_tag,_1a0);
}
objj_msgSend(_1ad,"encodeRect:forKey:",_frame,_19a);
objj_msgSend(_1ad,"encodeRect:forKey:",_bounds,_199);
objj_msgSend(_1ad,"encodeConditionalObject:forKey:",_window,_1a1);
objj_msgSend(_1ad,"encodeObject:forKey:",_subviews,_19e);
objj_msgSend(_1ad,"encodeConditionalObject:forKey:",_superview,_19f);
objj_msgSend(_1ad,"encodeInt:forKey:",_autoresizingMask,_196);
objj_msgSend(_1ad,"encodeBool:forKey:",_autoresizesSubviews,_197);
objj_msgSend(_1ad,"encodeObject:forKey:",_backgroundColor,_198);
objj_msgSend(_1ad,"encodeBool:forKey:",_hitTests,_19b);
objj_msgSend(_1ad,"encodeBool:forKey:",_isHidden,_19c);
objj_msgSend(_1ad,"encodeFloat:forKey:",_opacity,_19d);
objj_msgSend(_1ad,"encodeConditionalObject:forKey:",objj_msgSend(self,"nextKeyView"),_1a2);
objj_msgSend(_1ad,"encodeConditionalObject:forKey:",objj_msgSend(self,"previousKeyView"),_1a3);
for(var _1ae in _themedAttributes){
if(_themedAttributes.hasOwnProperty(_1ae)){
CPThemedAttributeEncode(_1ad,_themedAttributes[_1ae]);
}
}
}
})]);
var _87=function(_1af){
var _1b0=_1af._superview;
return {autoresizingMask:_1af._autoresizingMask,frame:CGRectMakeCopy(_1af._frame),index:(_1b0?objj_msgSend(_1b0._subviews,"indexOfObjectIdenticalTo:",_1af):0),superview:_1b0};
};
var _bb=function(_1b1,_1b2){
var _1b3=CGAffineTransformMakeIdentity(),_1b4=YES,_1b5=nil,_1b6=nil;
if(_1b1){
var view=_1b1;
while(view&&view!=_1b2){
var _1b8=view._frame;
_1b3.tx+=(_1b8.origin.x);
_1b3.ty+=(_1b8.origin.y);
if(view._boundsTransform){
var tx=_1b3.tx*view._boundsTransform.a+_1b3.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1b3.ty=_1b3.tx*view._boundsTransform.b+_1b3.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1b3.tx=tx;
var a=_1b3.a*view._boundsTransform.a+_1b3.b*view._boundsTransform.c,b=_1b3.a*view._boundsTransform.b+_1b3.b*view._boundsTransform.d,c=_1b3.c*view._boundsTransform.a+_1b3.d*view._boundsTransform.c;
_1b3.d=_1b3.c*view._boundsTransform.b+_1b3.d*view._boundsTransform.d;
_1b3.a=a;
_1b3.b=b;
_1b3.c=c;
}
view=view._superview;
}
if(view===_1b2){
return _1b3;
}else{
if(_1b1&&_1b2){
_1b5=objj_msgSend(_1b1,"window");
_1b6=objj_msgSend(_1b2,"window");
if(_1b5&&_1b6&&_1b5!==_1b6){
_1b4=NO;
var _1b8=objj_msgSend(_1b5,"frame");
_1b3.tx+=(_1b8.origin.x);
_1b3.ty+=(_1b8.origin.y);
}
}
}
}
var view=_1b2;
while(view){
var _1b8=view._frame;
_1b3.tx-=(_1b8.origin.x);
_1b3.ty-=(_1b8.origin.y);
if(view._boundsTransform){
var tx=_1b3.tx*view._inverseBoundsTransform.a+_1b3.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1b3.ty=_1b3.tx*view._inverseBoundsTransform.b+_1b3.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1b3.tx=tx;
var a=_1b3.a*view._inverseBoundsTransform.a+_1b3.b*view._inverseBoundsTransform.c,b=_1b3.a*view._inverseBoundsTransform.b+_1b3.b*view._inverseBoundsTransform.d,c=_1b3.c*view._inverseBoundsTransform.a+_1b3.d*view._inverseBoundsTransform.c;
_1b3.d=_1b3.c*view._inverseBoundsTransform.b+_1b3.d*view._inverseBoundsTransform.d;
_1b3.a=a;
_1b3.b=b;
_1b3.c=c;
}
view=view._superview;
}
if(!_1b4){
var _1b8=objj_msgSend(_1b6,"frame");
_1b3.tx-=(_1b8.origin.x);
_1b3.ty-=(_1b8.origin.y);
}
return _1b3;
};
