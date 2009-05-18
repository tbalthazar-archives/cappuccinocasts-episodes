I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;65329;
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
var _3=nil,_4=0,_5=1,_6=2,_7=3,_8={},_9={};
var _a=objj_allocateClassPair(CPResponder,"CPView"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_displayHash"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
return objj_msgSend(_c,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPResponder")},"init");
if(_e){
var _11=(_10.size.width),_12=(_10.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_10.origin.x,y:_10.origin.y},size:{width:_10.size.width,height:_10.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_11,height:_12}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_displayHash=objj_msgSend(_e,"hash");
_DOMElement=_3.cloneNode(false);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _13=_DOMElement.CPDOMDisplayContext[0];
if(!(_13>=0)){
_13=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_13]=0;
CPDOMDisplayServerInstructions[_13+1]=_DOMElement;
CPDOMDisplayServerInstructions[_13+2]=NULL;
CPDOMDisplayServerInstructions[_13+3]=(_10.origin.x);
CPDOMDisplayServerInstructions[_13+4]=(_10.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _13=_DOMElement.CPDOMDisplayContext[4];
if(!(_13>=0)){
_13=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_13]=4;
CPDOMDisplayServerInstructions[_13+1]=_DOMElement;
CPDOMDisplayServerInstructions[_13+2]=_11;
CPDOMDisplayServerInstructions[_13+3]=_12;
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_e,"_loadThemeAttributes");
}
return _e;
}
}),new objj_method(sel_getUid("superview"),function(_14,_15){
with(_14){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_16,_17){
with(_16){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_18,_19){
with(_18){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"_insertSubview:atIndex:",_1c,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
var _22=_21?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_21):CPNotFound;
if(_22===CPNotFound){
_22=(_20===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_20===CPWindowAbove){
++_22;
}
}
objj_msgSend(_1d,"_insertSubview:atIndex:",_1f,_22);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_23,_24,_25,_26){
with(_23){
var _27=_subviews.length;
objj_msgSend(objj_msgSend(_23,"window"),"_dirtyKeyViewLoop");
if(_25._superview==_23){
var _28=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_25);
if(_28===_26||_28===_27-1&&_26===_27){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_28);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
if(_26>_28){
--_26;
}
--_27;
}else{
objj_msgSend(_25,"removeFromSuperview");
objj_msgSend(_25,"_setWindow:",_window);
objj_msgSend(_25,"viewWillMoveToSuperview:",_23);
_25._superview=_23;
}
if(_26===CPNotFound||_26>=_27){
_subviews.push(_25);
if(_25._DOMElement.CPDOMDisplayContext){
_25._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
}else{
_subviews.splice(_26,0,_25);
if(_25._DOMElement.CPDOMDisplayContext){
_25._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_26+1]._DOMElement;
}
objj_msgSend(_25,"setNextResponder:",_23);
objj_msgSend(_25,"viewDidMoveToSuperview");
objj_msgSend(_23,"didAddSubview:",_25);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_2c,_2d){
with(_2c){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_2c,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_2c);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_2c);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_superview._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
_superview=nil;
objj_msgSend(_2c,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30._superview!=_2e){
return;
}
var _32=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_30);
objj_msgSend(_30,"removeFromSuperview");
objj_msgSend(_2e,"_insertSubview:atIndex:",_31,_32);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_33,_34,_35){
with(_33){
if(_window===_35){
return;
}
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_33){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_33,"viewWillMoveToWindow:",_35);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_35,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_35;
var _36=objj_msgSend(_subviews,"count");
while(_36--){
objj_msgSend(_subviews[_36],"_setWindow:",_35);
}
objj_msgSend(_33,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_37,_38,_39){
with(_37){
var _3a=_37;
do{
if(_3a==_39){
return YES;
}
}while(_3a=objj_msgSend(_3a,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_3b,_3c){
with(_3b){
objj_msgSend(_3b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_3d,_3e){
with(_3d){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_48,_49){
with(_48){
var _4a=_48;
while(_4a&&!objj_msgSend(_4a,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_4a=objj_msgSend(_4a,"superview");
}
if(_4a){
return _4a._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_4b,_4c,_4d){
with(_4b){
_tag=_4d;
}
}),new objj_method(sel_getUid("tag"),function(_4e,_4f){
with(_4e){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_50,"tag")===_52){
return _50;
}
var _53=0,_54=_subviews.length;
for(;_53<_54;++_53){
var _55=objj_msgSend(_subviews[_53],"viewWithTag:",_52);
if(_55){
return _55;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_56,_57){
with(_56){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_58,_59,_5a){
with(_58){
if(((_frame.origin.x==_5a.origin.x&&_frame.origin.y==_5a.origin.y)&&(_frame.size.width==_5a.size.width&&_frame.size.height==_5a.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_58,"setFrameOrigin:",_5a.origin);
objj_msgSend(_58,"setFrameSize:",_5a.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_58);
}
}
}),new objj_method(sel_getUid("frame"),function(_5b,_5c){
with(_5b){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setCenter:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"setFrameOrigin:",CGPointMake(_5f.x-_frame.size.width/2,_5f.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_60,_61){
with(_60){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_62,_63,_64){
with(_62){
var _65=_frame.origin;
if(!_64||(_65.x==_64.x&&_65.y==_64.y)){
return;
}
_65.x=_64.x;
_65.y=_64.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_62);
}
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _66=_DOMElement.CPDOMDisplayContext[0];
if(!(_66>=0)){
_66=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_66]=0;
CPDOMDisplayServerInstructions[_66+1]=_DOMElement;
CPDOMDisplayServerInstructions[_66+2]=_superview?_superview._boundsTransform:NULL;
CPDOMDisplayServerInstructions[_66+3]=_65.x;
CPDOMDisplayServerInstructions[_66+4]=_65.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_67,_68,_69){
with(_67){
var _6a=_frame.size;
if(!_69||(_6a.width==_69.width&&_6a.height==_69.height)){
return;
}
var _6b={width:_6a.width,height:_6a.height};
_6a.width=_69.width;
_6a.height=_69.height;
if(YES){
_bounds.size.width=_69.width;
_bounds.size.height=_69.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_67,"resizeSubviewsWithOldSize:",_6b);
}
objj_msgSend(_67,"setNeedsLayout");
objj_msgSend(_67,"setNeedsDisplay:",YES);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _6c=_DOMElement.CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMElement;
CPDOMDisplayServerInstructions[_6c+2]=_6a.width;
CPDOMDisplayServerInstructions[_6c+3]=_6a.height;
if(_DOMContentsElement){
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _6c=_DOMContentsElement.CPDOMDisplayContext[5];
if(!(_6c>=0)){
_6c=_DOMContentsElement.CPDOMDisplayContext[5]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=5;
CPDOMDisplayServerInstructions[_6c+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_6c+2]=_6a.width;
CPDOMDisplayServerInstructions[_6c+3]=_6a.height;
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _6c=_DOMContentsElement.CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMContentsElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_6c+2]=_6a.width;
CPDOMDisplayServerInstructions[_6c+3]=_6a.height;
}
if(_backgroundType!==_4){
var _6d=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_6c+2]=_6a.width;
CPDOMDisplayServerInstructions[_6c+3]=_6a.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
}else{
if(_backgroundType===_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_6c+2]=_6a.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_6c+3]=_6a.height;
}else{
if(_backgroundType===_7){
var _6e=_6a.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_6f=_6a.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_6c+2]=_6e;
CPDOMDisplayServerInstructions[_6c+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_6c+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_6c+3]=_6f;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_6c+2]=_6e;
CPDOMDisplayServerInstructions[_6c+3]=_6f;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_6c+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_6c+3]=_6f;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _6c=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_6c>=0)){
_6c=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_6c]=4;
CPDOMDisplayServerInstructions[_6c+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_6c+2]=_6e;
CPDOMDisplayServerInstructions[_6c+3]=_DOMImageSizes[7].height;
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_67);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_70,_71,_72){
with(_70){
if(((_bounds.origin.x==_72.origin.x&&_bounds.origin.y==_72.origin.y)&&(_bounds.size.width==_72.size.width&&_bounds.size.height==_72.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_70,"setBoundsOrigin:",_72.origin);
objj_msgSend(_70,"setBoundsSize:",_72.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_70);
}
}
}),new objj_method(sel_getUid("bounds"),function(_73,_74){
with(_73){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_75,_76,_77){
with(_75){
var _78=_bounds.origin;
if((_78.x==_77.x&&_78.y==_77.y)){
return;
}
_78.x=_77.x;
_78.y=_77.y;
if(_78.x!=0||_78.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_78.x,ty:-_78.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _79=_subviews.length;
while(_79--){
var _7a=_subviews[_79],_78=_7a._frame.origin;
if(!_7a._DOMElement.CPDOMDisplayContext){
_7a._DOMElement.CPDOMDisplayContext=[];
}
var _7b=_7a._DOMElement.CPDOMDisplayContext[0];
if(!(_7b>=0)){
_7b=_7a._DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_7b]=0;
CPDOMDisplayServerInstructions[_7b+1]=_7a._DOMElement;
CPDOMDisplayServerInstructions[_7b+2]=_boundsTransform;
CPDOMDisplayServerInstructions[_7b+3]=_78.x;
CPDOMDisplayServerInstructions[_7b+4]=_78.y;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_75);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_7c,_7d,_7e){
with(_7c){
var _7f=_bounds.size;
if((_7f.width==_7e.width&&_7f.height==_7e.height)){
return;
}
var _80=_frame.size;
if(!(_7f.width==_80.width&&_7f.height==_80.height)){
var _81=_bounds.origin;
_81.x/=_7f.width/_80.width;
_81.y/=_7f.height/_80.height;
}
_7f.width=_7e.width;
_7f.height=_7e.height;
if(!(_7f.width==_80.width&&_7f.height==_80.height)){
var _81=_bounds.origin;
_81.x*=_7f.width/_80.width;
_81.y*=_7f.height/_80.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7c);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_82,_83,_84){
with(_82){
var _85=objj_msgSend(_82,"autoresizingMask");
if(_85==CPViewNotSizable){
return;
}
var _86=_superview._frame,_87={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_86.size.width)-_84.width)/(((_85&CPViewMinXMargin)?1:0)+(_85&CPViewWidthSizable?1:0)+(_85&CPViewMaxXMargin?1:0)),dY=((_86.size.height)-_84.height)/((_85&CPViewMinYMargin?1:0)+(_85&CPViewHeightSizable?1:0)+(_85&CPViewMaxYMargin?1:0));
if(_85&CPViewMinXMargin){
_87.origin.x+=dX;
}
if(_85&CPViewWidthSizable){
_87.size.width+=dX;
}
if(_85&CPViewMinYMargin){
_87.origin.y+=dY;
}
if(_85&CPViewHeightSizable){
_87.size.height+=dY;
}
objj_msgSend(_82,"setFrame:",_87);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=_subviews.length;
while(_8d--){
objj_msgSend(_subviews[_8d],"resizeWithOldSuperviewSize:",_8c);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_8e,_8f,_90){
with(_8e){
_autoresizesSubviews=!!_90;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_91,_92){
with(_91){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_93,_94,_95){
with(_93){
_autoresizingMask=_95;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_96,_97){
with(_96){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_98,_99){
with(_98){
return objj_msgSend(_98,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_9a,_9b,_9c,_9d){
with(_9a){
_fullScreenModeState=_9e(_9a);
var _9f=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_9f,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_9f,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _a0=objj_msgSend(_9f,"contentView");
objj_msgSend(_a0,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_a0,"addSubview:",_9a);
objj_msgSend(_9a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_9a,"setFrame:",CGRectMakeCopy(objj_msgSend(_a0,"bounds")));
objj_msgSend(_9f,"makeKeyAndOrderFront:",_9a);
objj_msgSend(_9f,"makeFirstResponder:",_9a);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_a1,_a2){
with(_a1){
objj_msgSend(_a1,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_a3,_a4,_a5){
with(_a3){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_a3,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_a3,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_a3,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_a3,"window"),"orderOut:",_a3);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_a6,_a7){
with(_a6){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_a8,_a9,_aa){
with(_a8){
_aa=!!_aa;
if(_isHidden===_aa){
return;
}
_isHidden=_aa;
_DOMElement.style.display=_isHidden?"none":"block";
if(_aa){
var _ab=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_ab,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_a8==_ab){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_a8,"nextValidKeyView"));
break;
}
}while(_ab=objj_msgSend(_ab,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_ac,_ad){
with(_ac){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_ae,_af,_b0){
with(_ae){
if(_opacity==_b0){
return;
}
_opacity=_b0;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_b0==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_b0*100+")";
}
}else{
_DOMElement.style.opacity=_b0;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_b1,_b2){
with(_b1){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_b3,_b4){
with(_b3){
var _b5=_b3;
while(_b5&&!objj_msgSend(_b5,"isHidden")){
_b5=objj_msgSend(_b5,"superview");
}
return _b5!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_b6,_b7,_b8){
with(_b6){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_b9,_ba){
with(_b9){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_bb,_bc,_bd){
with(_bb){
_hitTests=!!_bd;
}
}),new objj_method(sel_getUid("hitTest:"),function(_be,_bf,_c0){
with(_be){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_c0)){
return nil;
}
var _c1=nil,i=_subviews.length,_c3={x:_c0.x-(_frame.origin.x),y:_c0.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_c3={x:_c3.x*_inverseBoundsTransform.a+_c3.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_c3.x*_inverseBoundsTransform.b+_c3.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_c1=objj_msgSend(_subviews[i],"hitTest:",_c3)){
return _c1;
}
}
return _be;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_c4,_c5){
with(_c4){
return !objj_msgSend(_c4,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_c6,_c7,_c8){
with(_c6){
if(objj_msgSend(_c6,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPResponder")},"mouseDown:",_c8);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_c9,_ca,_cb){
with(_c9){
if(_backgroundColor==_cb){
return;
}
_backgroundColor=_cb;
var _cc=objj_msgSend(_backgroundColor,"patternImage"),_cd=0;
if(objj_msgSend(_cc,"isThreePartImage")){
_backgroundType=objj_msgSend(_cc,"isVertical")?_5:_6;
_cd=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_cc,"isNinePartImage")){
_backgroundType=_7;
_cd=9-_DOMImageParts.length;
}else{
_backgroundType=_4;
_cd=0-_DOMImageParts.length;
}
}
if(_cd>0){
while(_cd--){
var _ce=_3.cloneNode(false);
_ce.style.zIndex=-1000;
_DOMImageParts.push(_ce);
_DOMElement.appendChild(_ce);
}
}else{
_cd=-_cd;
while(_cd--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_4){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _cf=objj_msgSend(_cc,"imageSlices"),_d0=_cf.length,_d1=_frame.size;
while(_d0--){
var _d2=_cf[_d0],_d3=_DOMImageSizes[_d0]=_d2?objj_msgSend(_d2,"size"):{width:0,height:0};
if(!_DOMImageParts[_d0].CPDOMDisplayContext){
_DOMImageParts[_d0].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[_d0].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[_d0].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[_d0];
CPDOMDisplayServerInstructions[_d4+2]=_d3.width;
CPDOMDisplayServerInstructions[_d4+3]=_d3.height;
_DOMImageParts[_d0].style.background=_d2?"url(\""+objj_msgSend(_d2,"filename")+"\")":"";
}
if(_backgroundType==_7){
var _d5=_d1.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_d6=_d1.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d4+2]=_d5;
CPDOMDisplayServerInstructions[_d4+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_d4+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_d4+3]=_d6;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_d4+2]=_d5;
CPDOMDisplayServerInstructions[_d4+3]=_d6;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_d4+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_d4+3]=_d6;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_d4+2]=_d5;
CPDOMDisplayServerInstructions[_d4+3]=_DOMImageSizes[7].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=1;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[3].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[3].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[4].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[4].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_d4+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[5].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[5].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=1;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[6].CPDOMDisplayContext){
_DOMImageParts[6].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[6].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[6].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=2;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[6];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[7].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[7].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=2;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=_DOMImageSizes[6].width;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[8].CPDOMDisplayContext){
_DOMImageParts[8].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[8].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[8].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=3;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[8];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
}else{
if(_backgroundType==_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d4+2]=_d1.width;
CPDOMDisplayServerInstructions[_d4+3]=_d1.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=2;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
}else{
if(_backgroundType==_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_d4>=0)){
_d4=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d4]=4;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d4+2]=_d1.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_d4+3]=_d1.height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=0;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_d4+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _d4=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_d4>=0)){
_d4=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d4]=1;
CPDOMDisplayServerInstructions[_d4+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_d4+2]=NULL;
CPDOMDisplayServerInstructions[_d4+3]=0;
CPDOMDisplayServerInstructions[_d4+4]=0;
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_d7,_d8){
with(_d7){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_d9,_da,_db,_dc){
with(_d9){
return CGPointApplyAffineTransform(_db,_dd(_dc,_d9));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_de,_df,_e0,_e1){
with(_de){
return CGPointApplyAffineTransform(_e0,_dd(_de,_e1));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_e2,_e3,_e4,_e5){
with(_e2){
return CGSizeApplyAffineTransform(_e4,_dd(_e5,_e2));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_e6,_e7,_e8,_e9){
with(_e6){
return CGSizeApplyAffineTransform(_e8,_dd(_e6,_e9));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_ea,_eb,_ec,_ed){
with(_ea){
return CGRectApplyAffineTransform(_ec,_dd(_ed,_ea));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_ee,_ef,_f0,_f1){
with(_ee){
return CGRectApplyAffineTransform(_f0,_dd(_ee,_f1));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_f2,_f3,_f4){
with(_f2){
_f4=!!_f4;
if(_postsFrameChangedNotifications===_f4){
return;
}
_postsFrameChangedNotifications=_f4;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_f2);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_f5,_f6){
with(_f5){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_f7,_f8,_f9){
with(_f7){
_f9=!!_f9;
if(_postsBoundsChangedNotifications===_f9){
return;
}
_postsBoundsChangedNotifications=_f9;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_f7);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_fa,_fb){
with(_fa){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_fc,_fd,_fe,_ff,_100,_101,_102,_103,_104){
with(_fc){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_fe,objj_msgSend(_fc,"convertPoint:toView:",_ff,nil),_100,_101,_102,_103,_104);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_107,_108,_109,_10a,_10b,_10c,_10d){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_107,objj_msgSend(self,"convertPoint:toView:",_108,nil),_109,_10a,_10b,_10c,_10d);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_110){
with(self){
if(!_110){
return;
}
var _111=objj_msgSend(self,"window");
objj_msgSend(_111,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_110);
objj_msgSend(_111,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
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
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_118){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_11b){
with(self){
if(_11b){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}else{
var _11c=CPDOMDisplayServerViewsContext[objj_msgSend(self,"hash")];
if(typeof _11c!="undefined"){
CPDOMDisplayServerViewsContext[objj_msgSend(self,"hash")];
CPDOMDisplayServerViews[_11c]=NULL;
}
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_11f){
with(self){
var hash=objj_msgSend(objj_msgSend(self,"class"),"hash"),_121=_8[hash];
if(!_121&&typeof _121==="undefined"){
_121=objj_msgSend(self,"methodForSelector:",sel_getUid("drawRect:"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"));
_8[hash]=_121;
}
if(!_121){
return;
}
if((_11f.size.width<=0||_11f.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_11f,_dirtyRect);
}else{
_dirtyRect={origin:{x:_11f.origin.x,y:_11f.origin.y},size:{width:_11f.size.width,height:_11f.size.height}};
}
var _122=objj_msgSend(self,"hash");
if(typeof (CPDOMDisplayServerViewsContext[_122])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_122]=self;
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
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_12b){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_12b);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_12e){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_12e,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_131,_132){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_131);
objj_msgSend(self,"drawRect:",_131);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _137=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_137.DOMElement;
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
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_137,YES);
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
var hash=objj_msgSend(objj_msgSend(self,"class"),"hash"),_13d=_9[hash];
if(_13d===undefined){
_13d=objj_msgSend(self,"methodForSelector:",sel_getUid("layoutSubviews"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"));
_9[hash]=_13d;
}
if(!_13d){
return;
}
if(_needsLayout){
var _13e=objj_msgSend(self,"hash");
if(typeof (CPDOMDisplayServerViewsContext[_13e])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_13e]=self;
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
var _149=_superview,_14a=objj_msgSend(CPClipView,"class");
while(_149&&!objj_msgSend(_149,"isKindOfClass:",_14a)){
_149=_149._superview;
}
return _149;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_14d){
with(self){
var _14e=objj_msgSend(self,"_enclosingClipView");
if(!_14e){
return;
}
objj_msgSend(_14e,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_14d,_14e));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_151){
with(self){
var _152=objj_msgSend(self,"visibleRect");
_151=CGRectIntersection(_151,_bounds);
if((_151.size.width<=0||_151.size.height<=0)||CGRectContainsRect(_152,_151)){
return NO;
}
var _153=objj_msgSend(self,"_enclosingClipView");
if(!_153){
return NO;
}
var _154={x:_152.origin.x,y:_152.origin.y};
if((_151.origin.x)<=(_152.origin.x)){
_154.x=(_151.origin.x);
}else{
if((_151.origin.x+_151.size.width)>(_152.origin.x+_152.size.width)){
_154.x+=(_151.origin.x+_151.size.width)-(_152.origin.x+_152.size.width);
}
}
if((_151.origin.y)<=(_152.origin.y)){
_154.y=CGRectGetMinY(_151);
}else{
if((_151.origin.y+_151.size.height)>(_152.origin.y+_152.size.height)){
_154.y+=(_151.origin.y+_151.size.height)-(_152.origin.y+_152.size.height);
}
}
objj_msgSend(_153,"scrollToPoint:",CGPointMake(_154.x,_154.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_157){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_157);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_15a){
with(self){
return _15a;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_15d,_15e){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _161=_superview,_162=objj_msgSend(CPScrollView,"class");
while(_161&&!objj_msgSend(_161,"isKindOfClass:",_162)){
_161=_161._superview;
}
return _161;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_165,_166){
with(self){
objj_msgSend(_165,"scrollToPoint:",_166);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_169){
with(self){
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _16c=_3.style;
_16c.overflow="hidden";
_16c.position="absolute";
_16c.visibility="visible";
_16c.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _173=objj_msgSend(self,"nextKeyView");
while(_173&&!objj_msgSend(_173,"canBecomeKeyView")){
_173=objj_msgSend(_173,"nextKeyView");
}
return _173;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _178=objj_msgSend(self,"previousKeyView");
while(_178&&!objj_msgSend(_178,"canBecomeKeyView")){
_178=objj_msgSend(_178,"previousKeyView");
}
return _178;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_17b){
with(self){
_previousKeyView=_17b;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_181){
with(self){
if(_layer==_181){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_181;
if(_layer){
var _182=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_187){
with(self){
_wantsLayer=!!_187;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_18e){
with(self){
return !!(_themeState&((typeof _18e==="string")?CPThemeState(_18e):_18e));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_191){
with(self){
var _192=(typeof _191==="string")?CPThemeState(_191):_191;
if(_themeState&_192){
return NO;
}
_themeState|=_192;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_195){
with(self){
var _196=((typeof _195==="string")?CPThemeState(_195):_195);
if(!(_themeState&_196)){
return NO;
}
_themeState&=~_196;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _199=objj_msgSend(self,"class"),_19a=objj_msgSend(_199,"_themeAttributes"),_19b=_19a.length;
if(!_19b){
return;
}
var _19c=objj_msgSend(self,"theme"),_19d=objj_msgSend(_199,"themeClass");
_themeAttributes={};
while(_19b--){
var _19e=_19a[_19b--],_19f=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_19e,_19a[_19b]);
objj_msgSend(_19f,"setParentAttribute:",objj_msgSend(_19c,"_attributeWithName:forClass:",_19e,_19d));
_themeAttributes[_19e]=_19f;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_1a2){
with(self){
if(_theme===_1a2){
return;
}
_theme=_1a2;
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
var _1a7=objj_msgSend(self,"theme"),_1a8=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _1a9 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1a9)){
objj_msgSend(_themeAttributes[_1a9],"setParentAttribute:",objj_msgSend(_1a7,"_attributeWithName:forClass:",_1a9,_1a8));
}
}
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _1ac=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1ad=objj_msgSend(self,"theme");
for(var _1ae in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1ae)){
objj_msgSend(_1ac,"setObject:forKey:",_themeAttributes[_1ae],_1ae);
}
}
}
return _1ac;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_1b1,_1b2,_1b3){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b2]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b2+"'");
}
var _1b4=objj_msgSend(self,"currentValueForThemeAttribute:",_1b2);
objj_msgSend(_themeAttributes[_1b2],"setValue:forState:",_1b1,_1b3);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b2)===_1b4){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1b7,_1b8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b8]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b8+"'");
}
var _1b9=objj_msgSend(self,"currentValueForThemeAttribute:",_1b8);
objj_msgSend(_themeAttributes[_1b8],"setValue:",_1b7);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b8)===_1b9){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1bc,_1bd){
with(self){
if(!_themeAttributes||!_themeAttributes[_1bc]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1bc+"'");
}
return objj_msgSend(_themeAttributes[_1bc],"valueForState:",_1bd);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1c0){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c0]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c0+"'");
}
return objj_msgSend(_themeAttributes[_1c0],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1c3){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c3]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c3+"'");
}
return objj_msgSend(_themeAttributes[_1c3],"valueForState:",_themeState);
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
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
var _1ca=objj_msgSend(self,"class"),_1cb=objj_msgSend(CPView,"class"),_1cc=[];
for(;_1ca&&_1ca!==_1cb;_1ca=objj_msgSend(_1ca,"superclass")){
var _1cd=_2[class_getName(_1ca)];
if(_1cd){
_1cc=_1cc.length?_1cc.concat(_1cd):_1cc;
_2[objj_msgSend(self,"className")]=_1cc;
break;
}
var _1ce=objj_msgSend(_1ca,"themeAttributes");
if(!_1ce){
continue;
}
var _1cf=objj_msgSend(_1ce,"allKeys"),_1d0=_1cf.length;
while(_1d0--){
var _1d1=_1cf[_1d0];
_1cc.push(objj_msgSend(_1ce,"objectForKey:",_1d1));
_1cc.push(_1d1);
}
}
return _1cc;
}
})]);
var _1d2="CPViewAutoresizingMask",_1d3="CPViewAutoresizesSubviews",_1d4="CPViewBackgroundColor",_1d5="CPViewBoundsKey",_1d6="CPViewFrameKey",_1d7="CPViewHitTestsKey",_1d8="CPViewIsHiddenKey",_1d9="CPViewOpacityKey",_1da="CPViewSubviewsKey",_1db="CPViewSuperviewKey",_1dc="CPViewTagKey",_1dd="CPViewThemeStateKey",_1de="CPViewWindowKey",_1df="CPViewNextKeyViewKey",_1e0="CPViewPreviousKeyViewKey";
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1e3){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_1e3,"decodeRectForKey:",_1d6);
_bounds=objj_msgSend(_1e3,"decodeRectForKey:",_1d5);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1e3);
if(self){
_tag=objj_msgSend(_1e3,"containsValueForKey:",_1dc)?objj_msgSend(_1e3,"decodeIntForKey:",_1dc):-1;
_window=objj_msgSend(_1e3,"decodeObjectForKey:",_1de);
_subviews=objj_msgSend(_1e3,"decodeObjectForKey:",_1da)||[];
_superview=objj_msgSend(_1e3,"decodeObjectForKey:",_1db);
_autoresizingMask=objj_msgSend(_1e3,"decodeIntForKey:",_1d2)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1e3,"containsValueForKey:",_1d3)||objj_msgSend(_1e3,"decodeBoolForKey:",_1d3);
_hitTests=!objj_msgSend(_1e3,"containsValueForKey:",_1d7)||objj_msgSend(_1e3,"decodeObjectForKey:",_1d7);
_DOMImageParts=[];
_DOMImageSizes=[];
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1e4=_DOMElement.CPDOMDisplayContext[0];
if(!(_1e4>=0)){
_1e4=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_1e4]=0;
CPDOMDisplayServerInstructions[_1e4+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1e4+2]=NULL;
CPDOMDisplayServerInstructions[_1e4+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_1e4+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1e4=_DOMElement.CPDOMDisplayContext[4];
if(!(_1e4>=0)){
_1e4=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_1e4]=4;
CPDOMDisplayServerInstructions[_1e4+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1e4+2]=(_frame.size.width);
CPDOMDisplayServerInstructions[_1e4+3]=(_frame.size.height);
var _1e5=0,_1e6=_subviews.length;
for(;_1e5<_1e6;++_1e5){
if(_subviews[_1e5]._DOMElement.CPDOMDisplayContext){
_subviews[_1e5]._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_1e5]._DOMElement;
}
_displayHash=objj_msgSend(self,"hash");
if(objj_msgSend(_1e3,"containsValueForKey:",_1d8)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1e3,"decodeBoolForKey:",_1d8));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1e3,"containsValueForKey:",_1d9)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1e3,"decodeIntForKey:",_1d9));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1e3,"decodeObjectForKey:",_1d4));
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1e3,"decodeIntForKey:",_1dd));
_themeAttributes={};
var _1e7=objj_msgSend(self,"class"),_1e8=objj_msgSend(_1e7,"themeClass"),_1e9=objj_msgSend(_1e7,"_themeAttributes"),_1e6=_1e9.length;
while(_1e6--){
var _1ea=_1e9[_1e6--];
_themeAttributes[_1ea]=CPThemeAttributeDecode(_1e3,_1ea,_1e9[_1e6],_theme,_1e8);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1ed){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1ed);
if(_tag!==-1){
objj_msgSend(_1ed,"encodeInt:forKey:",_tag,_1dc);
}
objj_msgSend(_1ed,"encodeRect:forKey:",_frame,_1d6);
objj_msgSend(_1ed,"encodeRect:forKey:",_bounds,_1d5);
if(_window!==nil){
objj_msgSend(_1ed,"encodeConditionalObject:forKey:",_window,_1de);
}
if(_subviews.length>0){
objj_msgSend(_1ed,"encodeObject:forKey:",_subviews,_1da);
}
if(_superview!==nil){
objj_msgSend(_1ed,"encodeConditionalObject:forKey:",_superview,_1db);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1ed,"encodeInt:forKey:",_autoresizingMask,_1d2);
}
if(!_autoresizesSubviews){
objj_msgSend(_1ed,"encodeBool:forKey:",_autoresizesSubviews,_1d3);
}
if(_backgroundColor!==nil){
objj_msgSend(_1ed,"encodeObject:forKey:",_backgroundColor,_1d4);
}
if(_hitTests!==YES){
objj_msgSend(_1ed,"encodeBool:forKey:",_hitTests,_1d7);
}
if(_opacity!==1){
objj_msgSend(_1ed,"encodeFloat:forKey:",_opacity,_1d9);
}
if(_isHidden){
objj_msgSend(_1ed,"encodeBool:forKey:",_isHidden,_1d8);
}
var _1ee=objj_msgSend(self,"nextKeyView");
if(_1ee!==nil){
objj_msgSend(_1ed,"encodeConditionalObject:forKey:",_1ee,_1df);
}
var _1ef=objj_msgSend(self,"previousKeyView");
if(_1ef!==nil){
objj_msgSend(_1ed,"encodeConditionalObject:forKey:",_1ef,_1e0);
}
objj_msgSend(_1ed,"encodeInt:forKey:",CPThemeStateName(_themeState),_1dd);
for(var _1f0 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1f0)){
CPThemeAttributeEncode(_1ed,_themeAttributes[_1f0]);
}
}
}
})]);
var _9e=function(_1f1){
var _1f2=_1f1._superview;
return {autoresizingMask:_1f1._autoresizingMask,frame:CGRectMakeCopy(_1f1._frame),index:(_1f2?objj_msgSend(_1f2._subviews,"indexOfObjectIdenticalTo:",_1f1):0),superview:_1f2};
};
var _dd=function(_1f3,_1f4){
var _1f5=CGAffineTransformMakeIdentity(),_1f6=YES,_1f7=nil,_1f8=nil;
if(_1f3){
var view=_1f3;
while(view&&view!=_1f4){
var _1fa=view._frame;
_1f5.tx+=(_1fa.origin.x);
_1f5.ty+=(_1fa.origin.y);
if(view._boundsTransform){
var tx=_1f5.tx*view._boundsTransform.a+_1f5.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1f5.ty=_1f5.tx*view._boundsTransform.b+_1f5.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1f5.tx=tx;
var a=_1f5.a*view._boundsTransform.a+_1f5.b*view._boundsTransform.c,b=_1f5.a*view._boundsTransform.b+_1f5.b*view._boundsTransform.d,c=_1f5.c*view._boundsTransform.a+_1f5.d*view._boundsTransform.c;
_1f5.d=_1f5.c*view._boundsTransform.b+_1f5.d*view._boundsTransform.d;
_1f5.a=a;
_1f5.b=b;
_1f5.c=c;
}
view=view._superview;
}
if(view===_1f4){
return _1f5;
}else{
if(_1f3&&_1f4){
_1f7=objj_msgSend(_1f3,"window");
_1f8=objj_msgSend(_1f4,"window");
if(_1f7&&_1f8&&_1f7!==_1f8){
_1f6=NO;
var _1fa=objj_msgSend(_1f7,"frame");
_1f5.tx+=(_1fa.origin.x);
_1f5.ty+=(_1fa.origin.y);
}
}
}
}
var view=_1f4;
while(view){
var _1fa=view._frame;
_1f5.tx-=(_1fa.origin.x);
_1f5.ty-=(_1fa.origin.y);
if(view._boundsTransform){
var tx=_1f5.tx*view._inverseBoundsTransform.a+_1f5.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1f5.ty=_1f5.tx*view._inverseBoundsTransform.b+_1f5.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1f5.tx=tx;
var a=_1f5.a*view._inverseBoundsTransform.a+_1f5.b*view._inverseBoundsTransform.c,b=_1f5.a*view._inverseBoundsTransform.b+_1f5.b*view._inverseBoundsTransform.d,c=_1f5.c*view._inverseBoundsTransform.a+_1f5.d*view._inverseBoundsTransform.c;
_1f5.d=_1f5.c*view._inverseBoundsTransform.b+_1f5.d*view._inverseBoundsTransform.d;
_1f5.a=a;
_1f5.b=b;
_1f5.c=c;
}
view=view._superview;
}
if(!_1f6){
var _1fa=objj_msgSend(_1f8,"frame");
_1f5.tx-=(_1fa.origin.x);
_1f5.ty-=(_1fa.origin.y);
}
return _1f5;
};
