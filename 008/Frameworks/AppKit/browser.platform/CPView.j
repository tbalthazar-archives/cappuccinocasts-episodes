I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;61857;
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
var _5=nil,_6=0,_7=1,_8=2,_9=3,_a={},_b={};
var _c=objj_allocateClassPair(CPResponder,"CPView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_displayHash"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themedAttributes"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("init"),function(_e,_f){
with(_e){
return objj_msgSend(_e,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_10,_11,_12){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPResponder")},"init");
if(_10){
var _13=(_12.size.width),_14=(_12.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_12.origin.x,y:_12.origin.y},size:{width:_12.size.width,height:_12.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_13,height:_14}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_displayHash=objj_msgSend(_10,"hash");
_DOMElement=_5.cloneNode(false);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _15=_DOMElement.CPDOMDisplayContext[0];
if(!(_15>=0)){
_15=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_15]=0;
CPDOMDisplayServerInstructions[_15+1]=_DOMElement;
CPDOMDisplayServerInstructions[_15+2]=NULL;
CPDOMDisplayServerInstructions[_15+3]=(_12.origin.x);
CPDOMDisplayServerInstructions[_15+4]=(_12.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _15=_DOMElement.CPDOMDisplayContext[4];
if(!(_15>=0)){
_15=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_15]=4;
CPDOMDisplayServerInstructions[_15+1]=_DOMElement;
CPDOMDisplayServerInstructions[_15+2]=_13;
CPDOMDisplayServerInstructions[_15+3]=_14;
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themedAttributes={};
objj_msgSend(_10,"_loadThemedAttributes");
}
return _10;
}
}),new objj_method(sel_getUid("superview"),function(_16,_17){
with(_16){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_18,_19){
with(_18){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_1a,_1b){
with(_1a){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"_insertSubview:atIndex:",_1e,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_1f,_20,_21,_22,_23){
with(_1f){
var _24=_23?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_23):CPNotFound;
if(_24===CPNotFound){
_24=(_22===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_22===CPWindowAbove){
++_24;
}
}
objj_msgSend(_1f,"_insertSubview:atIndex:",_21,_24);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_25,_26,_27,_28){
with(_25){
var _29=_subviews.length;
objj_msgSend(objj_msgSend(_25,"window"),"_dirtyKeyViewLoop");
if(_27._superview==_25){
var _2a=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_27);
if(_2a===_28||_2a===_29-1&&_28===_29){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_2a);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_27._DOMElement;
if(_28>_2a){
--_28;
}
--_29;
}else{
objj_msgSend(_27,"removeFromSuperview");
objj_msgSend(_27,"_setWindow:",_window);
objj_msgSend(_27,"viewWillMoveToSuperview:",_25);
_27._superview=_25;
}
if(_28===CPNotFound||_28>=_29){
_subviews.push(_27);
if(_27._DOMElement.CPDOMDisplayContext){
_27._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_27._DOMElement;
}else{
_subviews.splice(_28,0,_27);
if(_27._DOMElement.CPDOMDisplayContext){
_27._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_27._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_28+1]._DOMElement;
}
objj_msgSend(_27,"setNextResponder:",_25);
objj_msgSend(_27,"viewDidMoveToSuperview");
objj_msgSend(_25,"didAddSubview:",_27);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_2b,_2c,_2d){
with(_2b){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_2e,_2f){
with(_2e){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_2e,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_2e);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_2e);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_superview._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
_superview=nil;
objj_msgSend(_2e,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_30,_31,_32,_33){
with(_30){
if(_32._superview!=_30){
return;
}
var _34=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_32);
objj_msgSend(_32,"removeFromSuperview");
objj_msgSend(_30,"_insertSubview:atIndex:",_33,_34);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_35,_36,_37){
with(_35){
if(_window===_37){
return;
}
objj_msgSend(objj_msgSend(_35,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_35){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_35,"viewWillMoveToWindow:",_37);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_37,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_37;
var _38=objj_msgSend(_subviews,"count");
while(_38--){
objj_msgSend(_subviews[_38],"_setWindow:",_37);
}
objj_msgSend(_35,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_35,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_39,_3a,_3b){
with(_39){
var _3c=_39;
do{
if(_3c==_3b){
return YES;
}
}while(_3c=objj_msgSend(_3c,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_3d,_3e){
with(_3d){
objj_msgSend(_3d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_3f,_40){
with(_3f){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_41,_42,_43){
with(_41){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_44,_45,_46){
with(_44){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_47,_48,_49){
with(_47){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_4a,_4b){
with(_4a){
var _4c=_4a;
while(_4c&&!objj_msgSend(_4c,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_4c=objj_msgSend(_4c,"superview");
}
if(_4c){
return _4c._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("tag"),function(_4d,_4e){
with(_4d){
return _tag;
}
}),new objj_method(sel_getUid("isFlipped"),function(_4f,_50){
with(_4f){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_51,_52,_53){
with(_51){
if(((_frame.origin.x==_53.origin.x&&_frame.origin.y==_53.origin.y)&&(_frame.size.width==_53.size.width&&_frame.size.height==_53.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_51,"setFrameOrigin:",_53.origin);
objj_msgSend(_51,"setFrameSize:",_53.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_51);
}
}
}),new objj_method(sel_getUid("frame"),function(_54,_55){
with(_54){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setCenter:"),function(_56,_57,_58){
with(_56){
objj_msgSend(_56,"setFrameOrigin:",CGPointMake(_58.x-_frame.size.width/2,_58.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_59,_5a){
with(_59){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=_frame.origin;
if(!_5d||(_5e.x==_5d.x&&_5e.y==_5d.y)){
return;
}
_5e.x=_5d.x;
_5e.y=_5d.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5b);
}
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _5f=_DOMElement.CPDOMDisplayContext[0];
if(!(_5f>=0)){
_5f=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_5f]=0;
CPDOMDisplayServerInstructions[_5f+1]=_DOMElement;
CPDOMDisplayServerInstructions[_5f+2]=_superview?_superview._boundsTransform:NULL;
CPDOMDisplayServerInstructions[_5f+3]=_5e.x;
CPDOMDisplayServerInstructions[_5f+4]=_5e.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_60,_61,_62){
with(_60){
var _63=_frame.size;
if(!_62||(_63.width==_62.width&&_63.height==_62.height)){
return;
}
var _64={width:_63.width,height:_63.height};
_63.width=_62.width;
_63.height=_62.height;
if(YES){
_bounds.size.width=_62.width;
_bounds.size.height=_62.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_60,"resizeSubviewsWithOldSize:",_64);
}
objj_msgSend(_60,"setNeedsLayout");
objj_msgSend(_60,"setNeedsDisplay:",YES);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _65=_DOMElement.CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMElement;
CPDOMDisplayServerInstructions[_65+2]=_63.width;
CPDOMDisplayServerInstructions[_65+3]=_63.height;
if(_DOMContentsElement){
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _65=_DOMContentsElement.CPDOMDisplayContext[5];
if(!(_65>=0)){
_65=_DOMContentsElement.CPDOMDisplayContext[5]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=5;
CPDOMDisplayServerInstructions[_65+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_65+2]=_63.width;
CPDOMDisplayServerInstructions[_65+3]=_63.height;
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _65=_DOMContentsElement.CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMContentsElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_65+2]=_63.width;
CPDOMDisplayServerInstructions[_65+3]=_63.height;
}
if(_backgroundType!==_6){
var _66=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_7){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_65+2]=_63.width;
CPDOMDisplayServerInstructions[_65+3]=_63.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
}else{
if(_backgroundType===_8){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_65+2]=_63.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_65+3]=_63.height;
}else{
if(_backgroundType===_9){
var _67=_63.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_68=_63.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_65+2]=_67;
CPDOMDisplayServerInstructions[_65+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_65+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_65+3]=_68;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_65+2]=_67;
CPDOMDisplayServerInstructions[_65+3]=_68;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_65+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_65+3]=_68;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _65=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_65>=0)){
_65=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_65]=4;
CPDOMDisplayServerInstructions[_65+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_65+2]=_67;
CPDOMDisplayServerInstructions[_65+3]=_DOMImageSizes[7].height;
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_60);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_69,_6a,_6b){
with(_69){
if(((_bounds.origin.x==_6b.origin.x&&_bounds.origin.y==_6b.origin.y)&&(_bounds.size.width==_6b.size.width&&_bounds.size.height==_6b.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_69,"setBoundsOrigin:",_6b.origin);
objj_msgSend(_69,"setBoundsSize:",_6b.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_69);
}
}
}),new objj_method(sel_getUid("bounds"),function(_6c,_6d){
with(_6c){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_6e,_6f,_70){
with(_6e){
var _71=_bounds.origin;
if((_71.x==_70.x&&_71.y==_70.y)){
return;
}
_71.x=_70.x;
_71.y=_70.y;
if(_71.x!=0||_71.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_71.x,ty:-_71.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _72=_subviews.length;
while(_72--){
var _73=_subviews[_72],_71=_73._frame.origin;
if(!_73._DOMElement.CPDOMDisplayContext){
_73._DOMElement.CPDOMDisplayContext=[];
}
var _74=_73._DOMElement.CPDOMDisplayContext[0];
if(!(_74>=0)){
_74=_73._DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_74]=0;
CPDOMDisplayServerInstructions[_74+1]=_73._DOMElement;
CPDOMDisplayServerInstructions[_74+2]=_boundsTransform;
CPDOMDisplayServerInstructions[_74+3]=_71.x;
CPDOMDisplayServerInstructions[_74+4]=_71.y;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6e);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_75,_76,_77){
with(_75){
var _78=_bounds.size;
if((_78.width==_77.width&&_78.height==_77.height)){
return;
}
var _79=_frame.size;
if(!(_78.width==_79.width&&_78.height==_79.height)){
var _7a=_bounds.origin;
_7a.x/=_78.width/_79.width;
_7a.y/=_78.height/_79.height;
}
_78.width=_77.width;
_78.height=_77.height;
if(!(_78.width==_79.width&&_78.height==_79.height)){
var _7a=_bounds.origin;
_7a.x*=_78.width/_79.width;
_7a.y*=_78.height/_79.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_75);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(_7b,"autoresizingMask");
if(_7e==CPViewNotSizable){
return;
}
var _7f=_superview._frame,_80={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_7f.size.width)-_7d.width)/(((_7e&CPViewMinXMargin)?1:0)+(_7e&CPViewWidthSizable?1:0)+(_7e&CPViewMaxXMargin?1:0)),dY=((_7f.size.height)-_7d.height)/((_7e&CPViewMinYMargin?1:0)+(_7e&CPViewHeightSizable?1:0)+(_7e&CPViewMaxYMargin?1:0));
if(_7e&CPViewMinXMargin){
_80.origin.x+=dX;
}
if(_7e&CPViewWidthSizable){
_80.size.width+=dX;
}
if(_7e&CPViewMinYMargin){
_80.origin.y+=dY;
}
if(_7e&CPViewHeightSizable){
_80.size.height+=dY;
}
objj_msgSend(_7b,"setFrame:",_80);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_83,_84,_85){
with(_83){
var _86=_subviews.length;
while(_86--){
objj_msgSend(_subviews[_86],"resizeWithOldSuperviewSize:",_85);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_87,_88,_89){
with(_87){
_autoresizesSubviews=_89;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_8a,_8b){
with(_8a){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_8c,_8d,_8e){
with(_8c){
_autoresizingMask=_8e;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_8f,_90){
with(_8f){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_91,_92){
with(_91){
return objj_msgSend(_91,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_93,_94,_95,_96){
with(_93){
_fullScreenModeState=_97(_93);
var _98=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_98,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_98,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _99=objj_msgSend(_98,"contentView");
objj_msgSend(_99,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_99,"addSubview:",_93);
objj_msgSend(_93,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_93,"setFrame:",CGRectMakeCopy(objj_msgSend(_99,"bounds")));
objj_msgSend(_98,"makeKeyAndOrderFront:",_93);
objj_msgSend(_98,"makeFirstResponder:",_93);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_9a,_9b){
with(_9a){
objj_msgSend(_9a,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_9c,_9d,_9e){
with(_9c){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_9c,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_9c,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_9c,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_9c,"window"),"orderOut:",_9c);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_9f,_a0){
with(_9f){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_a1,_a2,_a3){
with(_a1){
if(_isHidden==_a3){
return;
}
_isHidden=_a3;
_DOMElement.style.display=_isHidden?"none":"block";
if(_a3){
var _a4=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_a4,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_a1==_a4){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_a1,"nextValidKeyView"));
break;
}
}while(_a4=objj_msgSend(_a4,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_a5,_a6){
with(_a5){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_a7,_a8,_a9){
with(_a7){
if(_opacity==_a9){
return;
}
_opacity=_a9;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_a9==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_a9*100+")";
}
}else{
_DOMElement.style.opacity=_a9;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_aa,_ab){
with(_aa){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_ac,_ad){
with(_ac){
var _ae=_ac;
while(_ae&&!objj_msgSend(_ae,"isHidden")){
_ae=objj_msgSend(_ae,"superview");
}
return _ae!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_af,_b0,_b1){
with(_af){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_b2,_b3){
with(_b2){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_b4,_b5,_b6){
with(_b4){
_hitTests=_b6;
}
}),new objj_method(sel_getUid("hitTest:"),function(_b7,_b8,_b9){
with(_b7){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_b9)){
return nil;
}
var _ba=nil,i=_subviews.length,_bc={x:_b9.x-(_frame.origin.x),y:_b9.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_bc={x:_bc.x*_inverseBoundsTransform.a+_bc.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_bc.x*_inverseBoundsTransform.b+_bc.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_ba=objj_msgSend(_subviews[i],"hitTest:",_bc)){
return _ba;
}
}
return _b7;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_bd,_be){
with(_bd){
return !objj_msgSend(_bd,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_bf,_c0,_c1){
with(_bf){
if(objj_msgSend(_bf,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_bf,super_class:objj_getClass("CPResponder")},"mouseDown:",_c1);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_c2,_c3,_c4){
with(_c2){
if(_backgroundColor==_c4){
return;
}
_backgroundColor=_c4;
var _c5=objj_msgSend(_backgroundColor,"patternImage"),_c6=0;
if(objj_msgSend(_c5,"isThreePartImage")){
_backgroundType=objj_msgSend(_c5,"isVertical")?_7:_8;
_c6=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_c5,"isNinePartImage")){
_backgroundType=_9;
_c6=9-_DOMImageParts.length;
}else{
_backgroundType=_6;
_c6=0-_DOMImageParts.length;
}
}
if(_c6>0){
while(_c6--){
var _c7=_5.cloneNode(false);
_c7.style.zIndex=-1000;
_DOMImageParts.push(_c7);
_DOMElement.appendChild(_c7);
}
}else{
_c6=-_c6;
while(_c6--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_6){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _c8=objj_msgSend(_c5,"imageSlices"),_c9=_c8.length,_ca=_frame.size;
while(_c9--){
var _cb=_c8[_c9],_cc=_DOMImageSizes[_c9]=_cb?objj_msgSend(_cb,"size"):{width:0,height:0};
if(!_DOMImageParts[_c9].CPDOMDisplayContext){
_DOMImageParts[_c9].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[_c9].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[_c9].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[_c9];
CPDOMDisplayServerInstructions[_cd+2]=_cc.width;
CPDOMDisplayServerInstructions[_cd+3]=_cc.height;
_DOMImageParts[_c9].style.background=_cb?"url(\""+objj_msgSend(_cb,"filename")+"\")":"";
}
if(_backgroundType==_9){
var _ce=_ca.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_cf=_ca.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_cd+2]=_ce;
CPDOMDisplayServerInstructions[_cd+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_cd+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_cd+3]=_cf;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_cd+2]=_ce;
CPDOMDisplayServerInstructions[_cd+3]=_cf;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_cd+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_cd+3]=_cf;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_cd+2]=_ce;
CPDOMDisplayServerInstructions[_cd+3]=_DOMImageSizes[7].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=1;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[3].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[3].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[4].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[4].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_cd+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[5].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[5].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=1;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[6].CPDOMDisplayContext){
_DOMImageParts[6].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[6].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[6].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=2;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[6];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[7].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[7].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=2;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=_DOMImageSizes[6].width;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[8].CPDOMDisplayContext){
_DOMImageParts[8].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[8].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[8].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=3;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[8];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
}else{
if(_backgroundType==_7){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_cd+2]=_ca.width;
CPDOMDisplayServerInstructions[_cd+3]=_ca.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=2;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
}else{
if(_backgroundType==_8){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_cd>=0)){
_cd=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_cd]=4;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_cd+2]=_ca.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_cd+3]=_ca.height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=0;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_cd+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _cd=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_cd>=0)){
_cd=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_cd]=1;
CPDOMDisplayServerInstructions[_cd+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_cd+2]=NULL;
CPDOMDisplayServerInstructions[_cd+3]=0;
CPDOMDisplayServerInstructions[_cd+4]=0;
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_d0,_d1){
with(_d0){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_d2,_d3,_d4,_d5){
with(_d2){
return CGPointApplyAffineTransform(_d4,_d6(_d5,_d2));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_d7,_d8,_d9,_da){
with(_d7){
return CGPointApplyAffineTransform(_d9,_d6(_d7,_da));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_db,_dc,_dd,_de){
with(_db){
return CGSizeApplyAffineTransform(_dd,_d6(_de,_db));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_df,_e0,_e1,_e2){
with(_df){
return CGSizeApplyAffineTransform(_e1,_d6(_df,_e2));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_e3,_e4,_e5,_e6){
with(_e3){
return CGRectApplyAffineTransform(_e5,_d6(_e6,_e3));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_e7,_e8,_e9,_ea){
with(_e7){
return CGRectApplyAffineTransform(_e9,_d6(_e7,_ea));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_eb,_ec,_ed){
with(_eb){
if(_postsFrameChangedNotifications==_ed){
return;
}
_postsFrameChangedNotifications=_ed;
if(_postsFrameChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_eb);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_ee,_ef){
with(_ee){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_f0,_f1,_f2){
with(_f0){
if(_postsBoundsChangedNotifications==_f2){
return;
}
_postsBoundsChangedNotifications=_f2;
if(_postsBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_f0);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_f3,_f4){
with(_f3){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_f5,_f6,_f7,_f8,_f9,_fa,_fb,_fc,_fd){
with(_f5){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_f7,objj_msgSend(_f5,"convertPoint:toView:",_f8,nil),_f9,_fa,_fb,_fc,_fd);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_fe,_ff,_100,_101,_102,_103,_104,_105,_106){
with(_fe){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_100,objj_msgSend(_fe,"convertPoint:toView:",_101,nil),_102,_103,_104,_105,_106);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_109){
with(self){
if(!_109){
return;
}
var _10a=objj_msgSend(self,"window");
objj_msgSend(_10a,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_109);
objj_msgSend(_10a,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_cmd){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_111){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_114){
with(self){
if(_114){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}else{
var _115=CPDOMDisplayServerViewsContext[objj_msgSend(self,"hash")];
if(typeof _115!="undefined"){
CPDOMDisplayServerViewsContext[objj_msgSend(self,"hash")];
CPDOMDisplayServerViews[_115]=NULL;
}
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_118){
with(self){
var hash=objj_msgSend(objj_msgSend(self,"class"),"hash"),_11a=_a[hash];
if(!_11a&&typeof _11a==="undefined"){
_11a=objj_msgSend(self,"methodForSelector:",sel_getUid("drawRect:"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"));
_a[hash]=_11a;
}
if(!_11a){
return;
}
if((_118.size.width<=0||_118.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_118,_dirtyRect);
}else{
_dirtyRect={origin:{x:_118.origin.x,y:_118.origin.y},size:{width:_118.size.width,height:_118.size.height}};
}
var _11b=objj_msgSend(self,"hash");
if(typeof (CPDOMDisplayServerViewsContext[_11b])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_11b]=self;
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
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_124){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_124);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_127){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_127,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_12a,_12b){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_12a);
objj_msgSend(self,"drawRect:",_12a);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _130=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_130.DOMElement;
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
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_130,YES);
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
var hash=objj_msgSend(objj_msgSend(self,"class"),"hash"),_136=_b[hash];
if(_136===undefined){
_136=objj_msgSend(self,"methodForSelector:",sel_getUid("layoutSubviews"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"));
_b[hash]=_136;
}
if(!_136){
return;
}
if(_needsLayout){
var _137=objj_msgSend(self,"hash");
if(typeof (CPDOMDisplayServerViewsContext[_137])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_137]=self;
}
}
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
var _142=_superview,_143=objj_msgSend(CPClipView,"class");
while(_142&&!objj_msgSend(_142,"isKindOfClass:",_143)){
_142=_142._superview;
}
return _142;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_146){
with(self){
var _147=objj_msgSend(self,"_enclosingClipView");
if(!_147){
return;
}
objj_msgSend(_147,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_146,_147));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_14a){
with(self){
var _14b=objj_msgSend(self,"visibleRect");
_14a=CGRectIntersection(_14a,_bounds);
if((_14a.size.width<=0||_14a.size.height<=0)||CGRectContainsRect(_14b,_14a)){
return NO;
}
var _14c=objj_msgSend(self,"_enclosingClipView");
if(!_14c){
return NO;
}
var _14d={x:_14b.origin.x,y:_14b.origin.y};
if((_14a.origin.x)<=(_14b.origin.x)){
_14d.x=(_14a.origin.x);
}else{
if((_14a.origin.x+_14a.size.width)>(_14b.origin.x+_14b.size.width)){
_14d.x+=(_14a.origin.x+_14a.size.width)-(_14b.origin.x+_14b.size.width);
}
}
if((_14a.origin.y)<=(_14b.origin.y)){
_14d.y=CGRectGetMinY(_14a);
}else{
if((_14a.origin.y+_14a.size.height)>(_14b.origin.y+_14b.size.height)){
_14d.y+=(_14a.origin.y+_14a.size.height)-(_14b.origin.y+_14b.size.height);
}
}
objj_msgSend(_14c,"scrollToPoint:",CGPointMake(_14d.x,_14d.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_150){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_150);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_153){
with(self){
return _153;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_156,_157){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _15a=_superview,_15b=objj_msgSend(CPScrollView,"class");
while(_15a&&!objj_msgSend(_15a,"isKindOfClass:",_15b)){
_15a=_15a._superview;
}
return _15a;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_15e,_15f){
with(self){
objj_msgSend(_15e,"scrollToPoint:",_15f);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_162){
with(self){
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(CPView,"class")){
return;
}
_5=document.createElement("div");
var _165=_5.style;
_165.overflow="hidden";
_165.position="absolute";
_165.visibility="visible";
_165.zIndex=0;
_3=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
var _c=objj_getClass("CPView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _16c=objj_msgSend(self,"nextKeyView");
while(_16c&&!objj_msgSend(_16c,"canBecomeKeyView")){
_16c=objj_msgSend(_16c,"nextKeyView");
}
return _16c;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _171=objj_msgSend(self,"previousKeyView");
while(_171&&!objj_msgSend(_171,"canBecomeKeyView")){
_171=objj_msgSend(_171,"previousKeyView");
}
return _171;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_174){
with(self){
_previousKeyView=_174;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _c=objj_getClass("CPView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_17a){
with(self){
if(_layer==_17a){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_17a;
if(_layer){
var _17b=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_180){
with(self){
_wantsLayer=_180;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _c=objj_getClass("CPView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("_loadThemedAttributes"),function(self,_cmd){
with(self){
var _185=objj_msgSend(self,"theme"),_186=objj_msgSend(self,"class"),_187=objj_msgSend(_186,"_themedAttributes");
count=_187.length;
while(count--){
var _188=_187[count--];
_themedAttributes[_188]=CPThemedAttributeMake(_188,_187[count],_185,_186);
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_18b){
with(self){
if(_theme===_18b){
return;
}
_theme=_18b;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
var _190=objj_msgSend(self,"theme");
for(var _191 in _themedAttributes){
if(_themedAttributes.hasOwnProperty(_191)){
objj_msgSend(_themedAttributes[_191],"setTheme:",_190);
}
}
}
}),new objj_method(sel_getUid("_themedAttributes"),function(self,_cmd){
with(self){
var _194=objj_msgSend(CPDictionary,"dictionary");
for(var _195 in _themedAttributes){
if(_themedAttributes.hasOwnProperty(_195)){
objj_msgSend(_194,"setObject:forKey:",_themedAttributes[_195],_195);
}
}
return _194;
}
}),new objj_method(sel_getUid("setValue:forThemedAttributeName:inControlState:"),function(self,_cmd,_198,_199,_19a){
with(self){
var _19b=_themedAttributes[_199];
if(!_19b){
return;
}
var _19c=objj_msgSend(self,"currentValueForThemedAttributeName:",_199);
objj_msgSend(_19b,"setValue:forControlState:",_198,_19a);
if(objj_msgSend(self,"currentValueForThemedAttributeName:",_199)===_19c){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemedAttributeName:"),function(self,_cmd,_19f,_1a0){
with(self){
var _1a1=_themedAttributes[_1a0];
if(!_1a1){
return;
}
var _1a2=objj_msgSend(self,"currentValueForThemedAttributeName:",_1a0);
objj_msgSend(_1a1,"setValue:",_19f);
if(objj_msgSend(self,"currentValueForThemedAttributeName:",_1a0)===_1a2){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemedAttributeName:inControlState:"),function(self,_cmd,_1a5,_1a6){
with(self){
return objj_msgSend(_themedAttributes[_1a5],"valueForControlState:",_1a6);
}
}),new objj_method(sel_getUid("valueForThemedAttributeName:"),function(self,_cmd,_1a9){
with(self){
return objj_msgSend(_themedAttributes[_1a9],"value");
}
}),new objj_method(sel_getUid("currentValueForThemedAttributeName:"),function(self,_cmd,_1ac){
with(self){
return objj_msgSend(_themedAttributes[_1ac],"valueForControlState:",_controlState);
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("themedAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themedAttributes"),function(self,_cmd){
with(self){
if(!_4){
_4={};
}
var _1b1=objj_msgSend(self,"class"),_1b2=objj_msgSend(CPView,"class"),_1b3=[];
while(_1b1&&_1b1!==_1b2){
var _1b4=_4[class_getName(_1b1)];
if(_1b4){
_1b3=_1b3.length?_1b3.concat(_1b4):_1b3;
_4[objj_msgSend(self,"className")]=_1b3;
break;
}
var _1b5=objj_msgSend(_1b1,"themedAttributes");
if(_1b5){
var _1b6=objj_msgSend(_1b5,"allKeys"),_1b7=_1b6.length;
while(_1b7--){
var _1b8=_1b6[_1b7];
_1b3.push(objj_msgSend(_1b5,"objectForKey:",_1b8));
_1b3.push(_1b8);
}
}
_1b1=objj_msgSend(_1b1,"superclass");
}
return _1b3;
}
})]);
var _1b9="CPViewAutoresizingMask",_1ba="CPViewAutoresizesSubviews",_1bb="CPViewBackgroundColor",_1bc="CPViewBoundsKey",_1bd="CPViewFrameKey",_1be="CPViewHitTestsKey",_1bf="CPViewIsHiddenKey",_1c0="CPViewOpacityKey",_1c1="CPViewSubviewsKey",_1c2="CPViewSuperviewKey",_1c3="CPViewTagKey",_1c4="CPViewWindowKey",_1c5="CPViewNextKeyViewKey",_1c6="CPViewPreviousKeyViewKey";
var _c=objj_getClass("CPView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1c9){
with(self){
_DOMElement=_5.cloneNode(false);
_frame=objj_msgSend(_1c9,"decodeRectForKey:",_1bd);
_bounds=objj_msgSend(_1c9,"decodeRectForKey:",_1bc);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1c9);
if(self){
_tag=-1;
if(objj_msgSend(_1c9,"containsValueForKey:",_1c3)){
_tag=objj_msgSend(_1c9,"decodeIntForKey:",_1c3);
}
_window=objj_msgSend(_1c9,"decodeObjectForKey:",_1c4);
_subviews=objj_msgSend(_1c9,"decodeObjectForKey:",_1c1);
_superview=objj_msgSend(_1c9,"decodeObjectForKey:",_1c2);
_autoresizingMask=objj_msgSend(_1c9,"decodeIntForKey:",_1b9)||0;
_autoresizesSubviews=objj_msgSend(_1c9,"decodeBoolForKey:",_1ba);
_hitTests=objj_msgSend(_1c9,"decodeObjectForKey:",_1be);
_isHidden=objj_msgSend(_1c9,"decodeObjectForKey:",_1bf);
_opacity=objj_msgSend(_1c9,"decodeIntForKey:",_1c0);
_DOMImageParts=[];
_DOMImageSizes=[];
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1ca=_DOMElement.CPDOMDisplayContext[0];
if(!(_1ca>=0)){
_1ca=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_1ca]=0;
CPDOMDisplayServerInstructions[_1ca+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1ca+2]=NULL;
CPDOMDisplayServerInstructions[_1ca+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_1ca+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1ca=_DOMElement.CPDOMDisplayContext[4];
if(!(_1ca>=0)){
_1ca=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_1ca]=4;
CPDOMDisplayServerInstructions[_1ca+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1ca+2]=(_frame.size.width);
CPDOMDisplayServerInstructions[_1ca+3]=(_frame.size.height);
var _1cb=0,_1cc=_subviews.length;
for(;_1cb<_1cc;++_1cb){
if(_subviews[_1cb]._DOMElement.CPDOMDisplayContext){
_subviews[_1cb]._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_1cb]._DOMElement;
}
_displayHash=objj_msgSend(self,"hash");
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1c9,"decodeObjectForKey:",_1bb));
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themedAttributes={};
var _1cd=objj_msgSend(self,"class"),_1ce=objj_msgSend(_1cd,"_themedAttributes"),_1cc=_1ce.length;
while(_1cc--){
var _1cf=_1ce[_1cc--];
_themedAttributes[_1cf]=CPThemedAttributeDecode(_1c9,_1cf,_1ce[_1cc],_theme,_1cd);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1d2){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1d2);
if(_tag!=-1){
objj_msgSend(_1d2,"encodeInt:forKey:",_tag,_1c3);
}
objj_msgSend(_1d2,"encodeRect:forKey:",_frame,_1bd);
objj_msgSend(_1d2,"encodeRect:forKey:",_bounds,_1bc);
objj_msgSend(_1d2,"encodeConditionalObject:forKey:",_window,_1c4);
objj_msgSend(_1d2,"encodeObject:forKey:",_subviews,_1c1);
objj_msgSend(_1d2,"encodeConditionalObject:forKey:",_superview,_1c2);
objj_msgSend(_1d2,"encodeInt:forKey:",_autoresizingMask,_1b9);
objj_msgSend(_1d2,"encodeBool:forKey:",_autoresizesSubviews,_1ba);
objj_msgSend(_1d2,"encodeObject:forKey:",_backgroundColor,_1bb);
objj_msgSend(_1d2,"encodeBool:forKey:",_hitTests,_1be);
objj_msgSend(_1d2,"encodeBool:forKey:",_isHidden,_1bf);
objj_msgSend(_1d2,"encodeFloat:forKey:",_opacity,_1c0);
objj_msgSend(_1d2,"encodeConditionalObject:forKey:",objj_msgSend(self,"nextKeyView"),_1c5);
objj_msgSend(_1d2,"encodeConditionalObject:forKey:",objj_msgSend(self,"previousKeyView"),_1c6);
for(var _1d3 in _themedAttributes){
if(_themedAttributes.hasOwnProperty(_1d3)){
CPThemedAttributeEncode(_1d2,_themedAttributes[_1d3]);
}
}
}
})]);
var _97=function(_1d4){
var _1d5=_1d4._superview;
return {autoresizingMask:_1d4._autoresizingMask,frame:CGRectMakeCopy(_1d4._frame),index:(_1d5?objj_msgSend(_1d5._subviews,"indexOfObjectIdenticalTo:",_1d4):0),superview:_1d5};
};
var _d6=function(_1d6,_1d7){
var _1d8=CGAffineTransformMakeIdentity(),_1d9=YES,_1da=nil,_1db=nil;
if(_1d6){
var view=_1d6;
while(view&&view!=_1d7){
var _1dd=view._frame;
_1d8.tx+=(_1dd.origin.x);
_1d8.ty+=(_1dd.origin.y);
if(view._boundsTransform){
var tx=_1d8.tx*view._boundsTransform.a+_1d8.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1d8.ty=_1d8.tx*view._boundsTransform.b+_1d8.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1d8.tx=tx;
var a=_1d8.a*view._boundsTransform.a+_1d8.b*view._boundsTransform.c,b=_1d8.a*view._boundsTransform.b+_1d8.b*view._boundsTransform.d,c=_1d8.c*view._boundsTransform.a+_1d8.d*view._boundsTransform.c;
_1d8.d=_1d8.c*view._boundsTransform.b+_1d8.d*view._boundsTransform.d;
_1d8.a=a;
_1d8.b=b;
_1d8.c=c;
}
view=view._superview;
}
if(view===_1d7){
return _1d8;
}else{
if(_1d6&&_1d7){
_1da=objj_msgSend(_1d6,"window");
_1db=objj_msgSend(_1d7,"window");
if(_1da&&_1db&&_1da!==_1db){
_1d9=NO;
var _1dd=objj_msgSend(_1da,"frame");
_1d8.tx+=(_1dd.origin.x);
_1d8.ty+=(_1dd.origin.y);
}
}
}
}
var view=_1d7;
while(view){
var _1dd=view._frame;
_1d8.tx-=(_1dd.origin.x);
_1d8.ty-=(_1dd.origin.y);
if(view._boundsTransform){
var tx=_1d8.tx*view._inverseBoundsTransform.a+_1d8.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1d8.ty=_1d8.tx*view._inverseBoundsTransform.b+_1d8.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1d8.tx=tx;
var a=_1d8.a*view._inverseBoundsTransform.a+_1d8.b*view._inverseBoundsTransform.c,b=_1d8.a*view._inverseBoundsTransform.b+_1d8.b*view._inverseBoundsTransform.d,c=_1d8.c*view._inverseBoundsTransform.a+_1d8.d*view._inverseBoundsTransform.c;
_1d8.d=_1d8.c*view._inverseBoundsTransform.b+_1d8.d*view._inverseBoundsTransform.d;
_1d8.a=a;
_1d8.b=b;
_1d8.c=c;
}
view=view._superview;
}
if(!_1d9){
var _1dd=objj_msgSend(_1db,"frame");
_1d8.tx-=(_1dd.origin.x);
_1d8.ty-=(_1dd.origin.y);
}
return _1d8;
};
