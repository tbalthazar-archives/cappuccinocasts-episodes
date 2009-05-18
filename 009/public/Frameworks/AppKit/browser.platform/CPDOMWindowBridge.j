I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.jc;19391;
CPSharedDOMWindowBridge=nil;
var _1=[];
var _2,_3,_4;
var _5=objj_allocateClassPair(CPObject,"CPDOMWindowBridge"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_orderedWindows"),new objj_ivar("_mouseDownWindow"),new objj_ivar("_DOMWindow"),new objj_ivar("_DOMBodyElement"),new objj_ivar("_DOMFocusElement"),new objj_ivar("_windowLevels"),new objj_ivar("_windowLayers"),new objj_ivar("_frame"),new objj_ivar("_contentBounds"),new objj_ivar("_mouseIsDown"),new objj_ivar("_lastMouseUp"),new objj_ivar("_lastMouseDown"),new objj_ivar("_charCodes"),new objj_ivar("_keyCode"),new objj_ivar("_DOMEventMode"),new objj_ivar("_DOMPasteboardElement"),new objj_ivar("_pasteboardKeyDownEvent"),new objj_ivar("_overriddenEventType")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
alert("unimplemented");
}
}),new objj_method(sel_getUid("_initWithDOMWindow:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPObject")},"init");
if(_a){
_DOMWindow=_c;
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
_DOMBodyElement=document.getElementsByTagName("body")[0];
_DOMBodyElement.innerHTML="";
_DOMBodyElement.style.overflow="hidden";
_DOMBodyElement.style.webkitTouchCallout="none";
objj_msgSend(CPString,"_resetSize");
if(document.documentElement){
document.documentElement.style.overflow="hidden";
}
_frame=_2(_DOMWindow);
_contentBounds=CGRectMake(0,0,CPRectGetWidth(_frame),CPRectGetHeight(_frame));
_DOMFocusElement=document.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=document.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
_charCodes={};
var _d=objj_msgSend(_a,"class"),_e=sel_getUid("_bridgeKeyEvent:"),_f=class_getMethodImplementation(_d,_e),_10=function(_11){
_f(_a,nil,_11);
},_12=sel_getUid("_bridgeMouseEvent:"),_13=class_getMethodImplementation(_d,_12),_14=function(_15){
_13(_a,nil,_15);
},_16=sel_getUid("_bridgeScrollEvent:"),_17=class_getMethodImplementation(_d,_16),_18=function(_19){
_17(_a,nil,_19);
},_1a=sel_getUid("_bridgeResizeEvent:"),_1b=class_getMethodImplementation(_d,_1a),_1c=function(_1d){
_1b(_a,nil,_1d);
},_1e=sel_getUid("_bridgeTouchEvent:"),_1f=class_getMethodImplementation(_d,_1e),_20=function(_21){
_1f(_a,nil,_21);
},_22=_DOMWindow.document;
if(document.addEventListener){
_DOMWindow.addEventListener("resize",_1c,NO);
_22.addEventListener(CPDOMEventMouseUp,_14,NO);
_22.addEventListener(CPDOMEventMouseDown,_14,NO);
_22.addEventListener(CPDOMEventMouseMoved,_14,NO);
_22.addEventListener(CPDOMEventKeyUp,_10,NO);
_22.addEventListener(CPDOMEventKeyDown,_10,NO);
_22.addEventListener(CPDOMEventKeyPress,_10,NO);
_22.addEventListener(CPDOMEventTouchStart,_20,NO);
_22.addEventListener(CPDOMEventTouchEnd,_20,NO);
_22.addEventListener(CPDOMEventTouchMove,_20,NO);
_22.addEventListener(CPDOMEventTouchCancel,_20,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_18,NO);
_DOMWindow.addEventListener(CPDOMEventScrollWheel,_18,NO);
}else{
if(document.attachEvent){
_DOMWindow.attachEvent("onresize",_1c);
_22.attachEvent("on"+CPDOMEventMouseUp,_14);
_22.attachEvent("on"+CPDOMEventMouseDown,_14);
_22.attachEvent("on"+CPDOMEventMouseMoved,_14);
_22.attachEvent("on"+CPDOMEventDoubleClick,_14);
_22.attachEvent("on"+CPDOMEventKeyUp,_10);
_22.attachEvent("on"+CPDOMEventKeyDown,_10);
_22.attachEvent("on"+CPDOMEventKeyPress,_10);
_DOMWindow.onmousewheel=_18;
_22.onmousewheel=_18;
_22.body.ondrag=function(){
return NO;
};
_22.body.onselectstart=function(){
return window.event.srcElement==_DOMPasteboardElement;
};
}
}
_1["INPUT"]=YES;
_1["SELECT"]=YES;
_1["TEXTAREA"]=YES;
_1["OPTION"]=YES;
}
return _a;
}
}),new objj_method(sel_getUid("frame"),function(_23,_24){
with(_23){
return CGRectMakeCopy(_frame);
}
}),new objj_method(sel_getUid("visibleFrame"),function(_25,_26){
with(_25){
var _27=objj_msgSend(_25,"frame");
_27.origin=CGPointMakeZero();
if(objj_msgSend(CPMenu,"menuBarVisible")){
var _28=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"menuBarHeight");
_27.origin.y+=_28;
_27.size.height-=_28;
}
return _27;
}
}),new objj_method(sel_getUid("contentBounds"),function(_29,_2a){
with(_29){
return CPRectCreateCopy(_contentBounds);
}
}),new objj_method(sel_getUid("orderedWindowsAtLevel:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"layerAtLevel:create:",_2d,NO);
if(!_2e){
return [];
}
return objj_msgSend(_2e,"orderedWindows");
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_2f,_30,_31,_32){
with(_2f){
var _33=objj_msgSend(_windowLayers,"objectForKey:",_31);
if(!_33&&_32){
_33=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_31);
objj_msgSend(_windowLayers,"setObject:forKey:",_33,_31);
var low=0,_35=_windowLevels.length-1,_36;
while(low<=_35){
_36=FLOOR((low+_35)/2);
if(_windowLevels[_36]>_31){
_35=_36-1;
}else{
low=_36+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_31,_windowLevels[_36]>_31?_36:_36+1);
_33._DOMElement.style.zIndex=_31;
_DOMBodyElement.appendChild(_33._DOMElement);
}
return _33;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_37,_38,_39,_3a,_3b){
with(_37){
var _3c=objj_msgSend(_37,"layerAtLevel:create:",objj_msgSend(_3a,"level"),_39!=CPWindowOut);
if(_39==CPWindowOut){
return objj_msgSend(_3c,"removeWindow:",_3a);
}
objj_msgSend(_3c,"insertWindow:atIndex:",_3a,(_3b?(_39==CPWindowAbove?_3b._index+1:_3b._index):CPNotFound));
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=_windowLevels,_42=_windowLayers,_43=_41.length;
while(_43--){
if(_41[_43]>=CPDraggingWindowLevel){
continue;
}
var _44=objj_msgSend(_42,"objectForKey:",_41[_43])._windows,_45=_44.length;
while(_45--){
var _46=_44[_45];
if(objj_msgSend(_46,"containsPoint:",_3f)){
return objj_msgSend(_46,"_dragHitTest:pasteboard:",_3f,_40);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_47,_48,_49){
with(_47){
StopDOMEventPropagation=!_49;
}
}),new objj_method(sel_getUid("hitTest:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=_windowLevels,_4e=_windowLayers,_4f=_4d.length,_50=nil;
while(_4f--&&!_50){
var _51=objj_msgSend(_4e,"objectForKey:",_4d[_4f])._windows,_52=_51.length;
while(_52--&&!_50){
var _53=_51[_52];
if(!_53._ignoresMouseEvents&&objj_msgSend(_53,"containsPoint:",_4c)){
_50=_53;
}
}
}
return _50;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("sharedDOMWindowBridge"),function(_54,_55){
with(_54){
if(!CPSharedDOMWindowBridge){
CPSharedDOMWindowBridge=objj_msgSend(objj_msgSend(CPDOMWindowBridge,"alloc"),"_initWithDOMWindow:",window);
}
return CPSharedDOMWindowBridge;
}
})]);
var _2=function(_56){
var _57=nil;
if(_56.outerWidth){
_57=CGRectMake(0,0,_56.outerWidth,_56.outerHeight);
}else{
_57=CGRectMake(0,0,-1,-1);
}
if(window.screenTop){
_57.origin=CGPointMake(_56.screenLeft,_56.screenTop,0);
}else{
if(window.screenX){
_57.origin=CGPointMake(_56.screenX,_56.screenY,0);
}
}
if(_56.innerWidth){
_57.size=CGSizeMake(_56.innerWidth,_56.innerHeight);
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_57.size=CGSizeMake(_56.document.documentElement.clientWidth,_56.document.documentElement.clientHeight);
}else{
_57.size=CGSizeMake(_56.document.body.clientWidth,_56.document.body.clientHeight);
}
}
return _57;
};
var _58={},_59={},_5a={"8":1,"9":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _5b=17;
var _5=objj_getClass("CPDOMWindowBridge");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDOMWindowBridge\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_5c,_5d,_5e){
with(_5c){
for(var i=_5e.length;i>0;i--){
_59[""+_5e[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_60,_61,_62){
with(_60){
_59[_62.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_63,_64){
with(_63){
_59={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_65,_66,_67){
with(_65){
for(var i=_67.length;i>0;i--){
_58[_67[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_69,_6a,_6b){
with(_69){
_58[_6b]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_6c,_6d){
with(_6c){
_58={};
}
}),new objj_method(sel_getUid("_bridgeMouseEvent:"),function(_6e,_6f,_70){
with(_6e){
var _71=_overriddenEventType||_70.type;
if(_71==CPDOMEventDoubleClick){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_6e,"_bridgeMouseEvent:",_70);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_6e,"_bridgeMouseEvent:",_70);
_overriddenEventType=nil;
return;
}
try{
var _72,_73={x:_70.clientX,y:_70.clientY},_74=_70.timeStamp?_70.timeStamp:new Date(),_75=(_70.target||_70.srcElement),_76=0,_77=(_70.shiftKey?CPShiftKeyMask:0)|(_70.ctrlKey?CPControlKeyMask:0)|(_70.altKey?CPAlternateKeyMask:0)|(_70.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
if(_mouseDownWindow){
_76=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _78=objj_msgSend(_6e,"hitTest:",_73);
if(_70.type==CPDOMEventMouseDown&&_78){
_mouseDownWindow=_78;
}
_76=objj_msgSend(_78,"windowNumber");
}
if(_76){
var _79=CPApp._windows[_76]._frame;
_73.x-=(_79.origin.x);
_73.y-=(_79.origin.y);
}
switch(_71){
case CPDOMEventMouseUp:
if(_mouseIsDown){
_72=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_73,_77,_74,_76,nil,-1,_3(_lastMouseUp,_74,_73),0);
_mouseIsDown=NO;
_lastMouseUp=_72;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
break;
case CPDOMEventMouseDown:
if(_1[_75.tagName]&&_75!=_DOMFocusElement){
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_73,_77,_74,_76,nil,-1,_3(_lastMouseDown,_74,_73),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_73,_77,_74,_76,nil,-1,_3(_lastMouseDown,_74,_73),0));
return;
}
_72=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_73,_77,_74,_76,nil,-1,_3(_lastMouseDown,_74,_73),0);
_mouseIsDown=YES;
_lastMouseDown=_72;
break;
case CPDOMEventMouseMoved:
if(_DOMEventMode){
return;
}
_72=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_73,_77,_74,_76,nil,-1,1,0);
break;
}
if(_72){
_72._DOMEvent=_70;
objj_msgSend(CPApp,"sendEvent:",_72);
}
if(StopDOMEventPropagation){
_4(_70);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeKeyEvent:"),function(_7a,_7b,_7c){
with(_7a){
try{
var _7d,_7e=_7c.timeStamp?_7c.timeStamp:new Date(),_7f=(_7c.target||_7c.srcElement),_80=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_81=(_7c.shiftKey?CPShiftKeyMask:0)|(_7c.ctrlKey?CPControlKeyMask:0)|(_7c.altKey?CPAlternateKeyMask:0)|(_7c.metaKey?CPCommandKeyMask:0);
if(_1[_7f.tagName]&&_7f!=_DOMFocusElement&&_7f!=_DOMPasteboardElement){
return;
}
StopDOMEventPropagation=!(_81&(CPControlKeyMask|CPCommandKeyMask))||_59[String.fromCharCode(_7c.keyCode||_7c.charCode).toLowerCase()]||_58[_7c.keyCode];
var _82=NO,_83=NO;
switch(_7c.type){
case CPDOMEventKeyDown:
_keyCode=_7c.keyCode;
var _84=String.fromCharCode(_keyCode).toLowerCase();
if(_84=="v"&&(_81&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_82=YES;
}else{
if((_84=="c"||_84=="x")&&(_81&CPPlatformActionKeyMask)){
_83=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_5a[_keyCode]&&(_keyCode==_5b||!(_81&CPControlKeyMask))){
return;
}
}
}
}
case CPDOMEventKeyPress:
if((_7c.target||_7c.srcElement)==_DOMPasteboardElement){
return;
}
var _85=_keyCode,_86=_7c.keyCode||_7c.charCode,_87=(_charCodes[_85]!=nil);
_charCodes[_85]=_86;
var _84=String.fromCharCode(_86),_88=_84.toLowerCase();
_7d=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_81,_7e,_80,nil,_84,_88,_87,_85);
if(_82){
_pasteboardKeyDownEvent=_7d;
window.setNativeTimeout(function(){
objj_msgSend(_7a,"_checkPasteboardElement");
},0);
return;
}
break;
case CPDOMEventKeyUp:
var _85=_7c.keyCode,_86=_charCodes[_85];
_charCodes[_85]=nil;
var _84=String.fromCharCode(_86),_88=_84.toLowerCase();
if(!(_81&CPShiftKeyMask)){
_84=_88;
}
_7d=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_81,_7e,_80,nil,_84,_88,NO,_85);
break;
}
if(_7d){
_7d._DOMEvent=_7c;
objj_msgSend(CPApp,"sendEvent:",_7d);
if(_83){
var _89=objj_msgSend(CPPasteboard,"generalPasteboard"),_8a=objj_msgSend(_89,"types");
if(_8a.length){
if(objj_msgSend(_8a,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_89,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_89,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_7a,"_clearPasteboardElement");
},0);
}
return;
}
}
if(StopDOMEventPropagation){
_4(_7c);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeScrollEvent:"),function(_8b,_8c,_8d){
with(_8b){
if(!_8d){
_8d=window.event;
}
try{
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=0,y=0,_90=_8d.target;
while(_90.nodeType!==1){
_90=_90.parentNode;
}
if(_90.offsetParent){
do{
x+=_90.offsetLeft;
y+=_90.offsetTop;
}while(_90=_90.offsetParent);
}
var _91={x:(x+((_8d.clientX-8)/15)),y:(y+((_8d.clientY-8)/15))};
}else{
var _91={x:_8d.clientX,y:_8d.clientY};
}
var _92=0,_93=0,_94=0,_95=_8d.timeStamp?_8d.timeStamp:new Date(),_96=(_8d.shiftKey?CPShiftKeyMask:0)|(_8d.ctrlKey?CPControlKeyMask:0)|(_8d.altKey?CPAlternateKeyMask:0)|(_8d.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
_94=objj_msgSend(objj_msgSend(_8b,"hitTest:",_91),"windowNumber");
if(!_94){
return;
}
var _97=CPApp._windows[_94]._frame;
_91.x-=CGRectGetMinX(_97);
_91.y-=CGRectGetMinY(_97);
if(typeof _8d.wheelDeltaX!="undefined"){
_92=_8d.wheelDeltaX/120;
_93=_8d.wheelDeltaY/120;
}else{
if(_8d.wheelDelta){
_93=_8d.wheelDelta/120;
}else{
if(_8d.detail){
_93=-_8d.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_92=-_92;
_93=-_93;
}
var _98=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_91,_96,_95,_94,nil,-1,1,0);
_98._DOMEvent=_8d;
_98._deltaX=ROUND(_92*1.5);
_98._deltaY=ROUND(_93*1.5);
objj_msgSend(CPApp,"sendEvent:",_98);
if(StopDOMEventPropagation){
_4(_8d);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeResizeEvent:"),function(_99,_9a,_9b){
with(_99){
try{
var _9c=_frame.size;
_frame=_2(_DOMWindow);
_contentBounds.size=CGSizeCreateCopy(_frame.size);
var _9d=_windowLevels,_9e=_windowLayers,_9f=_9d.length;
while(_9f--){
var _a0=objj_msgSend(_9e,"objectForKey:",_9d[_9f])._windows,_a1=_a0.length;
while(_a1--){
objj_msgSend(_a0[_a1],"resizeWithOldBridgeSize:",_9c);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeTouchEvent:"),function(_a2,_a3,_a4){
with(_a2){
try{
if(_a4.touches&&(_a4.touches.length==1||(_a4.touches.length==0&&_a4.changedTouches.length==1))){
var _a5={};
switch(_a4.type){
case CPDOMEventTouchStart:
_a5.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_a5.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_a5.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_a5.type=CPDOMEventMouseUp;
break;
}
var _a6=_a4.touches.length?_a4.touches[0]:_a4.changedTouches[0];
_a5.clientX=_a6.clientX;
_a5.clientY=_a6.clientY;
_a5.timestamp=_a4.timestamp;
_a5.target=_a4.target;
_a5.shiftKey=_a5.ctrlKey=_a5.altKey=_a5.metaKey=false;
_a5.preventDefault=function(){
if(_a4.preventDefault){
_a4.preventDefault();
}
};
_a5.stopPropagation=function(){
if(_a4.stopPropagation){
_a4.stopPropagation();
}
};
objj_msgSend(_a2,"_bridgeMouseEvent:",_a5);
return;
}else{
if(_a4.preventDefault){
_a4.preventDefault();
}
if(_a4.stopPropagation){
_a4.stopPropagation();
}
}
}
catch(e){
objj_exception_report(e,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_a7,_a8){
with(_a7){
try{
var _a9=_DOMPasteboardElement.value;
if(objj_msgSend(_a9,"length")){
var _aa=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_aa,"_stateUID")!=_a9){
objj_msgSend(_aa,"declareTypes:owner:",[CPStringPboardType],_a7);
objj_msgSend(_aa,"setString:forType:",_a9,CPStringPboardType);
}
}
objj_msgSend(_a7,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_ab,_ac){
with(_ab){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
var _ad=5,_ae=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _3=function(_af,_b0,_b1){
if(!_af){
return 1;
}
var _b2=objj_msgSend(_af,"locationInWindow");
return (_b0-objj_msgSend(_af,"timestamp")<_ae&&ABS(_b2.x-_b1.x)<_ad&&ABS(_b2.y-_b1.y)<_ad)?objj_msgSend(_af,"clickCount")+1:1;
};
var _4=function(_b3){
_b3.cancelBubble=true;
_b3.returnValue=false;
if(_b3.preventDefault){
_b3.preventDefault();
}
if(_b3.stopPropagation){
_b3.stopPropagation();
}
if(_b3.type==CPDOMEventMouseDown){
CPSharedDOMWindowBridge._DOMFocusElement.focus();
CPSharedDOMWindowBridge._DOMFocusElement.blur();
}
};
