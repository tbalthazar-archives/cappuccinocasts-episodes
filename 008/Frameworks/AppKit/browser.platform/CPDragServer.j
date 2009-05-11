I;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;7236;
var _1=nil;
var _2=nil,_3=nil,_4=nil,_5=nil,_6=nil,_7=nil,_8=nil,_9=nil,_a=nil,_b=nil;
var _c=NO,_d=NO,_e=NO,_f=NO,_10=NO;
var _11=function(){
objj_msgSend(_3,"autoscroll:",_a);
};
var _12=function(_13){
_14(_13);
};
var _14=function(_15){
if(objj_msgSend(_15,"type")==CPLeftMouseUp){
if(_b!==nil){
clearInterval(_b);
}
_b=nil;
_6=objj_msgSend((objj_msgSend(_8,"isKindOfClass:",objj_msgSend(CPWindow,"class"))?_8:objj_msgSend(_8,"window")),"convertBridgeToBase:",objj_msgSend(objj_msgSend(_15,"window"),"convertBaseToBridge:",objj_msgSend(_15,"locationInWindow")));
objj_msgSend(_2,"removeFromSuperview");
objj_msgSend(_1._dragWindow,"orderOut:",nil);
if(_8&&(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("prepareForDragOperation:"))||objj_msgSend(_8,"prepareForDragOperation:",_9))&&(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("performDragOperation:"))||objj_msgSend(_8,"performDragOperation:",_9))&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("concludeDragOperation:"))){
objj_msgSend(_8,"concludeDragOperation:",_9);
}
if(_10){
objj_msgSend(_3,"draggedImage:endedAt:operation:",objj_msgSend(_2,"image"),_6,NO);
}else{
if(_f){
objj_msgSend(_3,"draggedView:endedAt:operation:",_2,_6,NO);
}
}
_c=NO;
_8=nil;
return;
}
if(_b===nil){
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("autoscroll:"))){
_b=setInterval(_11,100);
}
}
_a=_15;
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_14,CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,0,NO);
var _16=objj_msgSend(_15,"locationInWindow"),_17=bridgeLocation=objj_msgSend(objj_msgSend(_15,"window"),"convertBaseToBridge:",_16);
var _18=objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_dragHitTest:pasteboard:",bridgeLocation,_7);
_6=objj_msgSend((objj_msgSend(_18,"isKindOfClass:",objj_msgSend(CPWindow,"class"))?_18:objj_msgSend(_18,"window")),"convertBridgeToBase:",bridgeLocation);
if(_18!=_8){
if(_8&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("draggingExited:"))){
objj_msgSend(_8,"draggingExited:",_9);
}
_8=_18;
if(_8&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("draggingEntered:"))){
objj_msgSend(_8,"draggingEntered:",_9);
}
}else{
if(_8&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("draggingUpdated:"))){
objj_msgSend(_8,"draggingUpdated:",_9);
}
}
_16.x-=_5.x;
_16.y-=_5.y;
objj_msgSend(_2,"setFrameOrigin:",_16);
if(_e){
objj_msgSend(_3,"draggedImage:movedTo:",objj_msgSend(_2,"image"),_16);
}else{
if(_d){
objj_msgSend(_3,"draggedView:movedTo:",_2,_16);
}
}
};
var _19=objj_allocateClassPair(CPObject,"CPDraggingInfo"),_1a=_19.isa;
objj_registerClassPair(_19);
objj_addClassForBundle(_19,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_19,[new objj_method(sel_getUid("draggingSource"),function(_1b,_1c){
with(_1b){
return _3;
}
}),new objj_method(sel_getUid("draggingLocation"),function(_1d,_1e){
with(_1d){
return _6;
}
}),new objj_method(sel_getUid("draggingPasteboard"),function(_1f,_20){
with(_1f){
return _7;
}
}),new objj_method(sel_getUid("draggedImage"),function(_21,_22){
with(_21){
return objj_msgSend(_2,"image");
}
}),new objj_method(sel_getUid("draggedImageLocation"),function(_23,_24){
with(_23){
return objj_msgSend(_23,"draggedViewLocation");
}
}),new objj_method(sel_getUid("draggedViewLocation"),function(_25,_26){
with(_25){
return objj_msgSend((objj_msgSend(_8,"isKindOfClass:",objj_msgSend(CPWindow,"class"))?_8:objj_msgSend(_8,"window")),"convertBridgeToBase:",objj_msgSend(_2,"frame").origin);
}
}),new objj_method(sel_getUid("draggedView"),function(_27,_28){
with(_27){
return _2;
}
})]);
var _19=objj_allocateClassPair(CPObject,"CPDragServer"),_1a=_19.isa;
class_addIvars(_19,[new objj_ivar("_dragWindow"),new objj_ivar("_imageView")]);
objj_registerClassPair(_19);
objj_addClassForBundle(_19,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_19,[new objj_method(sel_getUid("init"),function(_29,_2a){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPObject")},"init");
if(_29){
_dragWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CPRectMakeZero(),CPBorderlessWindowMask);
objj_msgSend(_dragWindow,"setLevel:",CPDraggingWindowLevel);
}
return _29;
}
}),new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_2b,_2c,_2d,_2e,_2f,_30,_31,_32,_33,_34){
with(_2b){
var _35=objj_msgSend(_31,"locationInWindow");
_2=_2d;
_3=_33;
_4=_2e;
_5=CPPointMake(_35.x-_2f.x,_35.y-_2f.y);
_7=objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
objj_msgSend(_dragWindow,"setFrameSize:",CGSizeMakeCopy(objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"frame").size));
objj_msgSend(_dragWindow,"orderFront:",_2b);
objj_msgSend(_2d,"setFrameOrigin:",_2f);
objj_msgSend(objj_msgSend(_dragWindow,"contentView"),"addSubview:",_2d);
if(_c){
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedImage:beganAt:"))){
objj_msgSend(_3,"draggedImage:beganAt:",objj_msgSend(_2d,"image"),_2f);
}
_e=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedImage:movedTo:"));
_10=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedImage:endAt:operation:"));
_d=NO;
_f=NO;
}else{
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedView:beganAt:"))){
objj_msgSend(_3,"draggedView:beganAt:",_2d,_2f);
}
_d=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedView:movedTo:"));
_f=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedView:endedAt:operation:"));
_e=NO;
_10=NO;
}
_12(_31);
}
}),new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_36,_37,_38,_39,_3a,_3b,_3c,_3d,_3e,_3f){
with(_36){
_c=YES;
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPRectMakeZero());
}
objj_msgSend(_imageView,"setImage:",_38);
objj_msgSend(_imageView,"setFrameSize:",CGSizeMakeCopy(objj_msgSend(_38,"size")));
objj_msgSend(_36,"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_imageView,_39,_3a,_3b,_3c,_3d,_3e,_3f);
}
})]);
class_addMethods(_1a,[new objj_method(sel_getUid("initialize"),function(_40,_41){
with(_40){
if(_40!=objj_msgSend(CPDragServer,"class")){
return;
}
_9=objj_msgSend(objj_msgSend(CPDraggingInfo,"alloc"),"init");
}
}),new objj_method(sel_getUid("sharedDragServer"),function(_42,_43){
with(_42){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPDragServer,"alloc"),"init");
}
return _1;
}
})]);
var _19=objj_getClass("CPWindow");
if(!_19){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _1a=_19.isa;
class_addMethods(_19,[new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_44,_45,_46,_47){
with(_44){
if(!_inclusiveRegisteredDraggedTypes){
return nil;
}
var _48={x:_46.x-(_frame.origin.x),y:_46.y-(_frame.origin.y)},_49=objj_msgSend(_windowView,"hitTest:",_48);
while(_49&&!objj_msgSend(_47,"availableTypeFromArray:",objj_msgSend(_49,"registeredDraggedTypes"))){
_49=objj_msgSend(_49,"superview");
}
if(_49){
return _49;
}
if(objj_msgSend(_47,"availableTypeFromArray:",objj_msgSend(_44,"registeredDraggedTypes"))){
return _44;
}
return nil;
}
})]);
