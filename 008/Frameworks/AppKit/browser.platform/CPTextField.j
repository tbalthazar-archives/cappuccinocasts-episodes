i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;24018;
CGPointMake=function(x,y){
return {x:x,y:y};
};
CGPointMakeZero=function(){
return {x:0,y:0};
};
CGPointMakeCopy=function(_3){
return {x:_3.x,y:_3.y};
};
CGPointCreateCopy=function(_4){
return {x:_4.x,y:_4.y};
};
CGPointEqualToPoint=function(_5,_6){
return (_5.x==_6.x&&_5.y==_6.y);
};
CGStringFromPoint=function(_7){
return ("{"+_7.x+", "+_7.y+"}");
};
CGSizeMake=function(_8,_9){
return {width:_8,height:_9};
};
CGSizeMakeZero=function(){
return {width:0,height:0};
};
CGSizeMakeCopy=function(_a){
return {width:_a.width,height:_a.height};
};
CGSizeCreateCopy=function(_b){
return {width:_b.width,height:_b.height};
};
CGSizeEqualToSize=function(_c,_d){
return (_c.width==_d.width&&_c.height==_d.height);
};
CGStringFromSize=function(_e){
return ("{"+_e.width+", "+_e.height+"}");
};
CGRectMake=function(x,y,_11,_12){
return {origin:{x:x,y:y},size:{width:_11,height:_12}};
};
CGRectMakeZero=function(){
return {origin:{x:0,y:0},size:{width:0,height:0}};
};
CGRectMakeCopy=function(_13){
return {origin:{x:_13.origin.x,y:_13.origin.y},size:{width:_13.size.width,height:_13.size.height}};
};
CGRectCreateCopy=function(_14){
return {origin:{x:_14.origin.x,y:_14.origin.y},size:{width:_14.size.width,height:_14.size.height}};
};
CGRectEqualToRect=function(_15,_16){
return ((_15.origin.x==_16.origin.x&&_15.origin.y==_16.origin.y)&&(_15.size.width==_16.size.width&&_15.size.height==_16.size.height));
};
CGStringFromRect=function(_17){
return ("{"+("{"+_17.origin.x+", "+_17.origin.y+"}")+", "+("{"+_17.size.width+", "+_17.size.height+"}")+"}");
};
CGRectOffset=function(_18,dX,dY){
return {origin:{x:_18.origin.x+dX,y:_18.origin.y+dY},size:{width:_18.size.width,height:_18.size.height}};
};
CGRectInset=function(_1b,dX,dY){
return {origin:{x:_1b.origin.x+dX,y:_1b.origin.y+dY},size:{width:_1b.size.width-2*dX,height:_1b.size.height-2*dY}};
};
CGRectGetHeight=function(_1e){
return (_1e.size.height);
};
CGRectGetMaxX=function(_1f){
return (_1f.origin.x+_1f.size.width);
};
CGRectGetMaxY=function(_20){
return (_20.origin.y+_20.size.height);
};
CGRectGetMidX=function(_21){
return (_21.origin.x+(_21.size.width)/2);
};
CGRectGetMidY=function(_22){
return (_22.origin.y+(_22.size.height)/2);
};
CGRectGetMinX=function(_23){
return (_23.origin.x);
};
CGRectGetMinY=function(_24){
return (_24.origin.y);
};
CGRectGetWidth=function(_25){
return (_25.size.width);
};
CGRectIsEmpty=function(_26){
return (_26.size.width<=0||_26.size.height<=0);
};
CGRectIsNull=function(_27){
return (_27.size.width<=0||_27.size.height<=0);
};
CGRectContainsPoint=function(_28,_29){
return (_29.x>=(_28.origin.x)&&_29.y>=(_28.origin.y)&&_29.x<(_28.origin.x+_28.size.width)&&_29.y<(_28.origin.y+_28.size.height));
};
CGInsetMake=function(top,_2b,_2c,_2d){
return {top:(top),left:(_2b),bottom:(_2c),right:(_2d)};
};
CGInsetMakeZero=function(){
return {top:(0),left:(0),bottom:(0),right:(0)};
};
CGInsetMakeCopy=function(_2e){
return {top:(_2e.top),left:(_2e.left),bottom:(_2e.bottom),right:(_2e.right)};
};
CGInsetIsEmpty=function(_2f){
return ((_2f).left===0&&(_2f).top===0&&(_2f).right===0&&(_2f).bottom===0);
};
CGRectContainsRect=function(_30,_31){
var _32=CGRectUnion(_30,_31);
return ((_32.origin.x==_30.origin.x&&_32.origin.y==_30.origin.y)&&(_32.size.width==_30.size.width&&_32.size.height==_30.size.height));
};
CGRectIntersectsRect=function(_33,_34){
var _35=CGRectIntersection(_33,_34);
return !(_35.size.width<=0||_35.size.height<=0);
};
CGRectIntegral=function(_36){
_36=CGRectStandardize(_36);
var x=FLOOR((_36.origin.x)),y=FLOOR((_36.origin.y));
_36.size.width=CEIL((_36.origin.x+_36.size.width))-x;
_36.size.height=CEIL((_36.origin.y+_36.size.height))-y;
_36.origin.x=x;
_36.origin.y=y;
return _36;
};
CGRectIntersection=function(_39,_3a){
var _3b={origin:{x:MAX((_39.origin.x),(_3a.origin.x)),y:MAX((_39.origin.y),(_3a.origin.y))},size:{width:0,height:0}};
_3b.size.width=MIN((_39.origin.x+_39.size.width),(_3a.origin.x+_3a.size.width))-(_3b.origin.x);
_3b.size.height=MIN((_39.origin.y+_39.size.height),(_3a.origin.y+_3a.size.height))-(_3b.origin.y);
return (_3b.size.width<=0||_3b.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_3b;
};
CGRectStandardize=function(_3c){
var _3d=(_3c.size.width),_3e=(_3c.size.height),_3f=_3c;
if(_3d<0){
if(_3f==_3c){
_3f={origin:{x:_3c.origin.x,y:_3c.origin.y},size:{width:_3c.size.width,height:_3c.size.height}};
}
_3f.origin.x+=_3d;
_3f.size.width=-_3d;
}
if(_3e<0){
if(_3f==_3c){
_3f={origin:{x:_3c.origin.x,y:_3c.origin.y},size:{width:_3c.size.width,height:_3c.size.height}};
}
_3f.origin.y+=_3e;
_3f.size.height=-_3e;
}
return _3f;
};
CGRectUnion=function(_40,_41){
var _42=MIN((_40.origin.x),(_41.origin.x)),_43=MIN((_40.origin.y),(_41.origin.y)),_44=MAX((_40.origin.x+_40.size.width),(_41.origin.x+_41.size.width)),_45=MAX((_40.origin.y+_40.size.height),(_41.origin.y+_41.size.height));
return {origin:{x:_42,y:_43},size:{width:_44-_42,height:_45-_43}};
};
CGPointFromString=function(_46){
var _47=_46.indexOf(",");
return {x:parseInt(_46.substr(1,_47-1)),y:parseInt(_46.substring(_47+1,_46.length))};
};
CGSizeFromString=function(_48){
var _49=_48.indexOf(",");
return {width:parseInt(_48.substr(1,_49-1)),height:parseInt(_48.substring(_49+1,_48.length))};
};
CGRectFromString=function(_4a){
var _4b=_4a.indexOf(",",_4a.indexOf(",")+1);
return {origin:CGPointFromString(_4a.substr(1,_4b-1)),size:CGSizeFromString(_4a.substring(_4b+2,_4a.length))};
};
CGPointFromEvent=function(_4c){
return {x:_4c.clientX,y:_4c.clientY};
};
CPStringFromInset=function(_4d){
return _4d.top+" "+_4d.left+" "+_4d.bottom+" "+_4d.right;
};
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _4e=nil,_4f=nil,_50=nil,_51=nil,_52=nil,_53=NO,_54=NO,_55=NO,_56=nil,_57=nil,_58=nil,_59=nil,_5a=nil,_5b=nil;
var _5c="¥";
var _5d=objj_getClass("CPString");
if(!_5d){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _5e=_5d.isa;
class_addMethods(_5d,[new objj_method(sel_getUid("string"),function(_5f,_60){
with(_5f){
return _5f;
}
})]);
CPTextFieldStateRounded=1<<12;
CPTextFieldStatePlaceholder=1<<13;
var _5d=objj_allocateClassPair(CPControl,"CPTextField"),_5e=_5d.isa;
class_addIvars(_5d,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_5d);
objj_addClassForBundle(_5d,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5d,[new objj_method(sel_getUid("_inputElement"),function(_61,_62){
with(_61){
if(!_4e){
_4e=document.createElement("input");
_4e.style.position="absolute";
_4e.style.border="0px";
_4e.style.padding="0px";
_4e.style.margin="0px";
_4e.style.whiteSpace="pre";
_4e.style.background="transparent";
_4e.style.outline="none";
_58=function(_63){
if(_51&&_51._DOMElement!=_4e.parentNode){
return;
}
if(!_53){
objj_msgSend(objj_msgSend(_51,"window"),"makeFirstResponder:",nil);
return;
}
CPTextFieldHandleBlur(_63,_4e);
_54=YES;
return true;
};
_5b=function(_64){
_52=objj_msgSend(_51,"stringValue");
_5a(_64);
return true;
};
_5a=function(_65){
_65=_65||window.event;
if(_65.keyCode==CPReturnKeyCode||_65.keyCode==CPTabKeyCode){
if(_65.preventDefault){
_65.preventDefault();
}
if(_65.stopPropagation){
_65.stopPropagation();
}
_65.cancelBubble=true;
var _66=_51;
if(_65&&_65.keyCode==CPReturnKeyCode){
objj_msgSend(_66,"sendAction:to:",objj_msgSend(_66,"action"),objj_msgSend(_66,"target"));
objj_msgSend(objj_msgSend(_66,"window"),"makeFirstResponder:",nil);
}else{
if(_65&&_65.keyCode==CPTabKeyCode){
if(!_65.shiftKey){
objj_msgSend(objj_msgSend(_66,"window"),"selectNextKeyView:",_66);
}else{
objj_msgSend(objj_msgSend(_66,"window"),"selectPreviousKeyView:",_66);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_59=function(){
objj_msgSend(_51,"setStringValue:",_4e.value);
if(objj_msgSend(_51,"stringValue")!==_52){
_52=objj_msgSend(_51,"stringValue");
objj_msgSend(_51,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_51,nil));
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
CPTextFieldHandleBlur=function(_67){
var _68=_51;
_51=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(document.attachEvent){
_4e.attachEvent("on"+CPDOMEventKeyUp,_59);
_4e.attachEvent("on"+CPDOMEventKeyDown,_5b);
_4e.attachEvent("on"+CPDOMEventKeyPress,_5a);
}else{
_4e.addEventListener(CPDOMEventKeyUp,_59,NO);
_4e.addEventListener(CPDOMEventKeyDown,_5b,NO);
_4e.addEventListener(CPDOMEventKeyPress,_5a,NO);
}
_4e.onblur=_58;
_50=_4e;
}
if(CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature)){
if(objj_msgSend(_61,"isSecure")){
_4e.type="password";
}else{
_4e.type="text";
}
return _4e;
}
if(objj_msgSend(_61,"isSecure")){
if(!_4f){
_4f=document.createElement("input");
_4f.style.position="absolute";
_4f.style.border="0px";
_4f.style.padding="0px";
_4f.style.margin="0px";
_4f.style.whiteSpace="pre";
_4f.style.background="transparent";
_4f.style.outline="none";
_4f.type="password";
_4f.attachEvent("on"+CPDOMEventKeyUp,_59);
_4f.attachEvent("on"+CPDOMEventKeyDown,_5b);
_4f.attachEvent("on"+CPDOMEventKeyPress,_5a);
_4f.onblur=_58;
}
_4e=_4f;
}else{
_4e=_50;
}
return _4e;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_69,_6a,_6b){
with(_69){
_69=objj_msgSendSuper({receiver:_69,super_class:objj_getClass("CPControl")},"initWithFrame:",_6b);
if(_69){
objj_msgSend(_69,"setStringValue:","");
objj_msgSend(_69,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_69,"setValue:forThemedAttributeName:",CPLeftTextAlignment,"alignment");
}
return _69;
}
}),new objj_method(sel_getUid("setEditable:"),function(_6c,_6d,_6e){
with(_6c){
_isEditable=_6e;
}
}),new objj_method(sel_getUid("isEditable"),function(_6f,_70){
with(_6f){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_71,_72,_73){
with(_71){
_isSelectable=_73;
}
}),new objj_method(sel_getUid("isSelectable"),function(_74,_75){
with(_74){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_76,_77,_78){
with(_76){
_isSecure=_78;
}
}),new objj_method(sel_getUid("isSecure"),function(_79,_7a){
with(_79){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_7b,_7c,_7d){
with(_7b){
if((!!(_controlState&CPControlStateBezeled))===_7d){
return;
}
if(_7d){
_controlState|=CPControlStateBezeled;
}else{
_controlState&=~CPControlStateBezeled;
}
objj_msgSend(_7b,"setNeedsLayout");
objj_msgSend(_7b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isBezeled"),function(_7e,_7f){
with(_7e){
return !!(_controlState&CPControlStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_80,_81,_82){
with(_80){
var _83=_82===CPTextFieldRoundedBezel;
if((!!(_controlState&CPTextFieldStateRounded))===_83){
return;
}
if(_83){
_controlState|=CPTextFieldStateRounded;
}else{
_controlState&=~CPTextFieldStateRounded;
}
objj_msgSend(_80,"setNeedsLayout");
objj_msgSend(_80,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("bezelStyle"),function(_84,_85){
with(_84){
if(_controlState&CPTextFieldStateRounded){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_86,_87,_88){
with(_86){
if((!!(_controlState&CPControlStateBordered))===_88){
return;
}
if(_88){
_controlState|=CPControlStateBordered;
}else{
_controlState&=~CPControlStateBordered;
}
objj_msgSend(_86,"setNeedsLayout");
objj_msgSend(_86,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isBordered"),function(_89,_8a){
with(_89){
return !!(_controlState&CPControlStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_8b,_8c,_8d){
with(_8b){
if(_drawsBackground==_8d){
return;
}
_drawsBackground=_8d;
objj_msgSend(_8b,"setNeedsLayout");
objj_msgSend(_8b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_8e,_8f){
with(_8e){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_90,_91,_92){
with(_90){
if(_textFieldBackgroundColor==_92){
return;
}
_textFieldBackgroundColor=_92;
objj_msgSend(_90,"setNeedsLayout");
objj_msgSend(_90,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_93,_94){
with(_93){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_95,_96){
with(_95){
return objj_msgSend(_95,"isEditable")&&objj_msgSend(_95,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_97,_98){
with(_97){
if(_51&&objj_msgSend(_51,"window")!==objj_msgSend(_97,"window")){
objj_msgSend(objj_msgSend(_51,"window"),"makeFirstResponder:",nil);
}
_controlState|=CPControlStateEditing;
objj_msgSend(_97,"_updatePlaceholderState");
objj_msgSend(_97,"setNeedsLayout");
var _99=objj_msgSend(_97,"stringValue"),_9a=objj_msgSend(_97,"_inputElement");
_9a.value=_99;
_9a.style.color=objj_msgSend(objj_msgSend(_97,"currentValueForThemedAttributeName:","text-color"),"cssString");
_9a.style.font=objj_msgSend(objj_msgSend(_97,"currentValueForThemedAttributeName:","font"),"cssString");
_9a.style.zIndex=1000;
var _9b=objj_msgSend(_97,"contentRectForBounds:",objj_msgSend(_97,"bounds"));
_9a.style.top=(_9b.origin.y)+"px";
_9a.style.left=((_9b.origin.x)-1)+"px";
_9a.style.width=(_9b.size.width)+"px";
_9a.style.height=(_9b.size.height)+"px";
_DOMElement.appendChild(_9a);
window.setTimeout(function(){
_9a.focus();
_51=_97;
},0);
objj_msgSend(_97,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_97,nil));
objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_propagateCurrentDOMEvent:",YES);
_55=YES;
if(document.attachEvent){
_56=document.body.onselectstart;
_57=document.body.ondrag;
document.body.ondrag=function(){
};
document.body.onselectstart=function(){
};
}
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_9c,_9d){
with(_9c){
_controlState&=~CPControlStateEditing;
objj_msgSend(_9c,"_updatePlaceholderState");
objj_msgSend(_9c,"setNeedsLayout");
var _9e=objj_msgSend(_9c,"_inputElement");
objj_msgSend(_9c,"setObjectValue:",_9e.value);
_53=YES;
_9e.blur();
if(!_54){
_58();
}
_54=NO;
_53=NO;
if(_9e.parentNode==_DOMElement){
_9e.parentNode.removeChild(_9e);
}
_55=NO;
if(document.attachEvent){
_56=nil;
_57=nil;
document.body.ondrag=_57;
document.body.onselectstart=_56;
}
objj_msgSend(_9c,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_9c,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_9f,_a0,_a1){
with(_9f){
if(objj_msgSend(_9f,"isEditable")&&objj_msgSend(_9f,"isEnabled")){
return objj_msgSend(objj_msgSend(_9f,"window"),"makeFirstResponder:",_9f);
}else{
return objj_msgSend(objj_msgSend(_9f,"nextResponder"),"mouseDown:",_a1);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_a2,_a3){
with(_a2){
return objj_msgSendSuper({receiver:_a2,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSendSuper({receiver:_a4,super_class:objj_getClass("CPControl")},"setObjectValue:",_a6);
objj_msgSend(_a4,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_a7,_a8){
with(_a7){
var _a9=objj_msgSend(_a7,"stringValue"),_aa=_controlState;
if((!_a9||objj_msgSend(_a9,"length")===0)&&!(_controlState&CPControlStateEditing)){
_controlState|=CPTextFieldStatePlaceholder;
}else{
_controlState&=~CPTextFieldStatePlaceholder;
}
if(_controlState!==_aa){
objj_msgSend(_a7,"setNeedsLayout");
objj_msgSend(_a7,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_ab,_ac,_ad){
with(_ab){
if(_placeholderString===_ad){
return;
}
_placeholderString=_ad;
if(_controlState&CPTextFieldStatePlaceholder){
objj_msgSend(_ab,"setNeedsLayout");
objj_msgSend(_ab,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_ae,_af){
with(_ae){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_b0,_b1){
with(_b0){
var _b2=objj_msgSend((objj_msgSend(_b0,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_b0,"font")),_b3=objj_msgSend(_b0,"currentValueForThemedAttributeName:","content-inset");
objj_msgSend(_b0,"setFrameSize:",CGSizeMake(_b2.width+_b3.left+_b3.right,_b2.height+_b3.top+_b3.bottom));
}
}),new objj_method(sel_getUid("selectText:"),function(_b4,_b5,_b6){
with(_b4){
var _b7=objj_msgSend(_b4,"_inputElement");
if(_b7.parentNode==_DOMElement&&(objj_msgSend(_b4,"isEditable")||objj_msgSend(_b4,"isSelectable"))){
_b7.select();
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_b8,_b9,_ba){
with(_b8){
var _bb=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_bb,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_b8);
objj_msgSend(_bb,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_b8);
objj_msgSend(_bb,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_b8);
}
_delegate=_ba;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_bb,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_b8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_bb,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_b8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_bb,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_b8);
}
}
}),new objj_method(sel_getUid("delegate"),function(_bc,_bd){
with(_bc){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_be,_bf,_c0){
with(_be){
var _c1=objj_msgSend(_be,"currentValueForThemedAttributeName:","content-inset");
if(!_c1){
return _c0;
}
_c0.origin.x+=_c1.left;
_c0.origin.y+=_c1.top;
_c0.size.width-=_c1.left+_c1.right;
_c0.size.height-=_c1.top+_c1.bottom;
return _c0;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_c2,_c3,_c4){
with(_c2){
var _c5=objj_msgSend(_c2,"currentValueForThemedAttributeName:","bezel-inset");
if(((_c5).left===0&&(_c5).top===0&&(_c5).right===0&&(_c5).bottom===0)){
return _c4;
}
_c4.origin.x+=_c5.left;
_c4.origin.y+=_c5.top;
_c4.size.width-=_c5.left+_c5.right;
_c4.size.height-=_c5.top+_c5.bottom;
return _c4;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_c6,_c7,_c8){
with(_c6){
if(_c8==="bezel-view"){
return objj_msgSend(_c6,"bezelRectForBounds:",objj_msgSend(_c6,"bounds"));
}else{
if(_c8==="content-view"){
return objj_msgSend(_c6,"contentRectForBounds:",objj_msgSend(_c6,"bounds"));
}
}
return objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_c8);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_c9,_ca,_cb){
with(_c9){
if(_cb==="bezel-view"){
var _cc=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_cc,"setHitTests:",NO);
return _cc;
}else{
var _cc=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _cc;
}
return objj_msgSendSuper({receiver:_c9,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_cb);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_cd,_ce){
with(_cd){
var _cf=objj_msgSend(_cd,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_cf){
objj_msgSend(_cf,"setBackgroundColor:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","bezel-color"));
}
var _d0=objj_msgSend(_cd,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_d0){
objj_msgSend(_d0,"setHidden:",_controlState&CPControlStateEditing);
var _d1="";
if(_controlState&CPTextFieldStatePlaceholder){
_d1=objj_msgSend(_cd,"placeholderString");
}else{
_d1=objj_msgSend(_cd,"stringValue");
if(objj_msgSend(_cd,"isSecure")){
_d1=_d2(_d1);
}
}
objj_msgSend(_d0,"setText:",_d1);
objj_msgSend(_d0,"setTextColor:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","text-color"));
objj_msgSend(_d0,"setFont:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","font"));
objj_msgSend(_d0,"setAlignment:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","alignment"));
objj_msgSend(_d0,"setVerticalAlignment:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","vertical-alignment"));
objj_msgSend(_d0,"setLineBreakMode:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","line-break-mode"));
objj_msgSend(_d0,"setTextShadowColor:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","text-shadow-color"));
objj_msgSend(_d0,"setTextShadowOffset:",objj_msgSend(_cd,"currentValueForThemedAttributeName:","text-shadow-offset"));
}
}
})]);
class_addMethods(_5e,[new objj_method(sel_getUid("themedAttributes"),function(_d3,_d4){
with(_d3){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),left:(0),bottom:(0),right:(0)},{top:(2),left:(2),bottom:(2),right:(2)},{top:(2),left:(2),bottom:(2),right:(2)},nil],["bezel-inset","content-inset","bezeled-content-inset","bezel-color"]);
}
})]);
var _d2=function(_d5){
if(!_d5){
return "";
}
var _d6="",_d7=_d5.length;
while(_d7--){
_d6+=_5c;
}
return _d6;
};
var _d8="CPTextFieldIsEditableKey",_d9="CPTextFieldIsSelectableKey",_da="CPTextFieldIsBorderedKey",_db="CPTextFieldIsBezeledKey",_dc="CPTextFieldBezelStyleKey",_dd="CPTextFieldDrawsBackgroundKey",_de="CPTextFieldLineBreakModeKey",_df="CPTextFieldBackgroundColorKey",_e0="CPTextFieldPlaceholderStringKey";
var _5d=objj_getClass("CPTextField");
if(!_5d){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _5e=_5d.isa;
class_addMethods(_5d,[new objj_method(sel_getUid("initWithCoder:"),function(_e1,_e2,_e3){
with(_e1){
_e1=objj_msgSendSuper({receiver:_e1,super_class:objj_getClass("CPControl")},"initWithCoder:",_e3);
if(_e1){
objj_msgSend(_e1,"setEditable:",objj_msgSend(_e3,"decodeBoolForKey:",_d8));
objj_msgSend(_e1,"setSelectable:",objj_msgSend(_e3,"decodeBoolForKey:",_d9));
objj_msgSend(_e1,"setDrawsBackground:",objj_msgSend(_e3,"decodeBoolForKey:",_dd));
objj_msgSend(_e1,"setTextFieldBackgroundColor:",objj_msgSend(_e3,"decodeObjectForKey:",_df));
objj_msgSend(_e1,"setPlaceholderString:",objj_msgSend(_e3,"decodeObjectForKey:",_e0));
}
return _e1;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e4,_e5,_e6){
with(_e4){
objj_msgSendSuper({receiver:_e4,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_e6);
objj_msgSend(_e6,"encodeBool:forKey:",_isEditable,_d8);
objj_msgSend(_e6,"encodeBool:forKey:",_isSelectable,_d9);
objj_msgSend(_e6,"encodeBool:forKey:",_drawsBackground,_dd);
objj_msgSend(_e6,"encodeObject:forKey:",_textFieldBackgroundColor,_df);
objj_msgSend(_e6,"encodeObject:forKey:",_placeholderString,_e0);
}
})]);
