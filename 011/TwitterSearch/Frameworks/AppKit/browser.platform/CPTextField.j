i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;21193;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil,_6=NO,_7=NO,_8=NO,_9=nil,_a=nil,_b=nil,_c=nil,_d=nil,_e=nil;
var _f="‚Ä¢";
var _10=objj_getClass("CPString");
if(!_10){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _11=_10.isa;
class_addMethods(_10,[new objj_method(sel_getUid("string"),function(_12,_13){
with(_12){
return _12;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _10=objj_allocateClassPair(CPControl,"CPTextField"),_11=_10.isa;
class_addIvars(_10,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_10);
objj_addClassForBundle(_10,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_10,[new objj_method(sel_getUid("_inputElement"),function(_14,_15){
with(_14){
if(!_1){
_1=document.createElement("input");
_1.style.position="absolute";
_1.style.border="0px";
_1.style.padding="0px";
_1.style.margin="0px";
_1.style.whiteSpace="pre";
_1.style.background="transparent";
_1.style.outline="none";
_b=function(_16){
if(_4&&_4._DOMElement!=_1.parentNode){
return;
}
if(!_6){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
return;
}
CPTextFieldHandleBlur(_16,_1);
_7=YES;
return true;
};
_e=function(_17){
_5=objj_msgSend(_4,"stringValue");
_17=_17||window.event;
if(_17.keyCode==CPReturnKeyCode||_17.keyCode==CPTabKeyCode){
_d(_17);
}
return true;
};
_d=function(_18){
_18=_18||window.event;
_c();
if(_18.keyCode==CPReturnKeyCode||_18.keyCode==CPTabKeyCode){
if(_18.preventDefault){
_18.preventDefault();
}
if(_18.stopPropagation){
_18.stopPropagation();
}
_18.cancelBubble=true;
var _19=_4;
if(_18&&_18.keyCode==CPReturnKeyCode){
objj_msgSend(_19,"sendAction:to:",objj_msgSend(_19,"action"),objj_msgSend(_19,"target"));
objj_msgSend(objj_msgSend(_19,"window"),"makeFirstResponder:",nil);
}else{
if(_18&&_18.keyCode==CPTabKeyCode){
if(!_18.shiftKey){
objj_msgSend(objj_msgSend(_19,"window"),"selectNextKeyView:",_19);
}else{
objj_msgSend(objj_msgSend(_19,"window"),"selectPreviousKeyView:",_19);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_c=function(){
objj_msgSend(_4,"_setStringValue:",_1.value);
if(objj_msgSend(_4,"stringValue")!==_5){
objj_msgSend(_4,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_4,nil));
_5=objj_msgSend(_4,"stringValue");
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
CPTextFieldHandleBlur=function(_1a){
var _1b=_4;
_4=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(document.attachEvent){
_1.attachEvent("on"+CPDOMEventKeyUp,_c);
_1.attachEvent("on"+CPDOMEventKeyDown,_e);
_1.attachEvent("on"+CPDOMEventKeyPress,_d);
}else{
_1.addEventListener(CPDOMEventKeyUp,_c,NO);
_1.addEventListener(CPDOMEventKeyDown,_e,NO);
_1.addEventListener(CPDOMEventKeyPress,_d,NO);
}
_1.onblur=_b;
_3=_1;
}
if(CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature)){
if(objj_msgSend(_14,"isSecure")){
_1.type="password";
}else{
_1.type="text";
}
return _1;
}
if(objj_msgSend(_14,"isSecure")){
if(!_2){
_2=document.createElement("input");
_2.style.position="absolute";
_2.style.border="0px";
_2.style.padding="0px";
_2.style.margin="0px";
_2.style.whiteSpace="pre";
_2.style.background="transparent";
_2.style.outline="none";
_2.type="password";
_2.attachEvent("on"+CPDOMEventKeyUp,_c);
_2.attachEvent("on"+CPDOMEventKeyDown,_e);
_2.attachEvent("on"+CPDOMEventKeyPress,_d);
_2.onblur=_b;
}
_1=_2;
}else{
_1=_3;
}
return _1;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1c,_1d,_1e){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPControl")},"initWithFrame:",_1e);
if(_1c){
objj_msgSend(_1c,"setStringValue:","");
objj_msgSend(_1c,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_1c,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _1c;
}
}),new objj_method(sel_getUid("setEditable:"),function(_1f,_20,_21){
with(_1f){
_isEditable=_21;
}
}),new objj_method(sel_getUid("isEditable"),function(_22,_23){
with(_22){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_24,_25,_26){
with(_24){
_isSelectable=_26;
}
}),new objj_method(sel_getUid("isSelectable"),function(_27,_28){
with(_27){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_29,_2a,_2b){
with(_29){
_isSecure=_2b;
}
}),new objj_method(sel_getUid("isSecure"),function(_2c,_2d){
with(_2c){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_2e,_2f,_30){
with(_2e){
if(_30){
objj_msgSend(_2e,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_2e,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_31,_32){
with(_31){
return objj_msgSend(_31,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_33,_34,_35){
with(_33){
var _36=_35===CPTextFieldRoundedBezel;
if(_36){
objj_msgSend(_33,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_33,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_37,_38){
with(_37){
if(objj_msgSend(_37,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_39,_3a,_3b){
with(_39){
if(_3b){
objj_msgSend(_39,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_39,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_3c,_3d){
with(_3c){
return objj_msgSend(_3c,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_3e,_3f,_40){
with(_3e){
if(_drawsBackground==_40){
return;
}
_drawsBackground=_40;
objj_msgSend(_3e,"setNeedsLayout");
objj_msgSend(_3e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_41,_42){
with(_41){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_43,_44,_45){
with(_43){
if(_textFieldBackgroundColor==_45){
return;
}
_textFieldBackgroundColor=_45;
objj_msgSend(_43,"setNeedsLayout");
objj_msgSend(_43,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_46,_47){
with(_46){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_48,_49){
with(_48){
return objj_msgSend(_48,"isEditable")&&objj_msgSend(_48,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_4a,_4b){
with(_4a){
if(_4&&objj_msgSend(_4,"window")!==objj_msgSend(_4a,"window")){
objj_msgSend(objj_msgSend(_4,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(_4a,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_4a,"_updatePlaceholderState");
objj_msgSend(_4a,"setNeedsLayout");
var _4c=objj_msgSend(_4a,"stringValue"),_4d=objj_msgSend(_4a,"_inputElement");
_4d.value=_4c;
_4d.style.color=objj_msgSend(objj_msgSend(_4a,"currentValueForThemeAttribute:","text-color"),"cssString");
_4d.style.font=objj_msgSend(objj_msgSend(_4a,"currentValueForThemeAttribute:","font"),"cssString");
_4d.style.zIndex=1000;
switch(objj_msgSend(_4a,"alignment")){
case CPCenterTextAlignment:
_4d.style.textAlign="center";
break;
case CPRightTextAlignment:
_4d.style.textAlign="right";
break;
default:
_4d.style.textAlign="left";
}
var _4e=objj_msgSend(_4a,"contentRectForBounds:",objj_msgSend(_4a,"bounds"));
_4d.style.top=(_4e.origin.y)+"px";
_4d.style.left=((_4e.origin.x)-1)+"px";
_4d.style.width=(_4e.size.width)+"px";
_4d.style.height=(_4e.size.height)+"px";
_DOMElement.appendChild(_4d);
window.setTimeout(function(){
_4d.value=objj_msgSend(_4a,"stringValue");
_4d.focus();
_4=_4a;
},0);
objj_msgSend(_4a,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_4a,nil));
objj_msgSend(objj_msgSend(objj_msgSend(_4a,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
_8=YES;
if(document.attachEvent){
_9=document.body.onselectstart;
_a=document.body.ondrag;
document.body.ondrag=function(){
};
document.body.onselectstart=function(){
};
}
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_4f,_50){
with(_4f){
objj_msgSend(_4f,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_4f,"_updatePlaceholderState");
objj_msgSend(_4f,"setNeedsLayout");
var _51=objj_msgSend(_4f,"_inputElement");
objj_msgSend(_4f,"setObjectValue:",_51.value);
_6=YES;
_51.blur();
if(!_7){
_b();
}
_7=NO;
_6=NO;
if(_51.parentNode==_DOMElement){
_51.parentNode.removeChild(_51);
}
_8=NO;
if(document.attachEvent){
_9=nil;
_a=nil;
document.body.ondrag=_a;
document.body.onselectstart=_9;
}
objj_msgSend(_4f,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_4f,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_52,_53,_54){
with(_52){
if(objj_msgSend(_52,"isEditable")&&objj_msgSend(_52,"isEnabled")){
return objj_msgSend(objj_msgSend(_52,"window"),"makeFirstResponder:",_52);
}else{
return objj_msgSend(objj_msgSend(_52,"nextResponder"),"mouseDown:",_54);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_55,_56){
with(_55){
return objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_57,_58,_59){
with(_57){
objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPControl")},"setObjectValue:",String(_59));
objj_msgSend(_57,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSendSuper({receiver:_5a,super_class:objj_getClass("CPControl")},"setObjectValue:",_5c);
if(_4===_5a){
objj_msgSend(_5a,"_inputElement").value=_5c;
}
objj_msgSend(_5a,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_5d,_5e){
with(_5d){
var _5f=objj_msgSend(_5d,"stringValue");
if((!_5f||_5f.length===0)&&!objj_msgSend(_5d,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_5d,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_5d,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_60,_61,_62){
with(_60){
if(_placeholderString===_62){
return;
}
_placeholderString=_62;
if(objj_msgSend(_60,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_60,"setNeedsLayout");
objj_msgSend(_60,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_63,_64){
with(_63){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_65,_66){
with(_65){
var _67=objj_msgSend((objj_msgSend(_65,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_65,"currentValueForThemeAttribute:","font")),_68=objj_msgSend(_65,"currentValueForThemeAttribute:","content-inset"),_69=objj_msgSend(_65,"currentValueForThemeAttribute:","min-size"),_6a=objj_msgSend(_65,"currentValueForThemeAttribute:","max-size");
_67.width=MAX(_67.width+_68.left+_68.right,_69.width);
_67.height=MAX(_67.height+_68.top+_68.bottom,_69.height);
if(_6a.width>=0){
_67.width=MIN(_67.width,_6a.width);
}
if(_6a.height>=0){
_67.height=MIN(_67.height,_6a.height);
}
if(objj_msgSend(_65,"isEditable")){
_67.width=CGRectGetWidth(objj_msgSend(_65,"frame"));
}
objj_msgSend(_65,"setFrameSize:",_67);
}
}),new objj_method(sel_getUid("selectText:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=objj_msgSend(_6b,"_inputElement");
if(_6e.parentNode===_DOMElement&&(objj_msgSend(_6b,"isEditable")||objj_msgSend(_6b,"isSelectable"))){
window.setTimeout(function(){
_6e.select();
},0);
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_72,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_6f);
objj_msgSend(_72,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_6f);
objj_msgSend(_72,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_6f);
}
_delegate=_71;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_72,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_6f);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_72,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_6f);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_72,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_6f);
}
}
}),new objj_method(sel_getUid("delegate"),function(_73,_74){
with(_73){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_75,_76,_77){
with(_75){
var _78=objj_msgSend(_75,"currentValueForThemeAttribute:","content-inset");
if(!_78){
return _77;
}
_77.origin.x+=_78.left;
_77.origin.y+=_78.top;
_77.size.width-=_78.left+_78.right;
_77.size.height-=_78.top+_78.bottom;
return _77;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(_79,"currentValueForThemeAttribute:","bezel-inset");
if(((_7c).top===0&&(_7c).right===0&&(_7c).bottom===0&&(_7c).left===0)){
return _7b;
}
_7b.origin.x+=_7c.left;
_7b.origin.y+=_7c.top;
_7b.size.width-=_7c.left+_7c.right;
_7b.size.height-=_7c.top+_7c.bottom;
return _7b;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_7d,_7e,_7f){
with(_7d){
if(_7f==="bezel-view"){
return objj_msgSend(_7d,"bezelRectForBounds:",objj_msgSend(_7d,"bounds"));
}else{
if(_7f==="content-view"){
return objj_msgSend(_7d,"contentRectForBounds:",objj_msgSend(_7d,"bounds"));
}
}
return objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_7f);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_80,_81,_82){
with(_80){
if(_82==="bezel-view"){
var _83=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_83,"setHitTests:",NO);
return _83;
}else{
var _83=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _83;
}
return objj_msgSendSuper({receiver:_80,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_82);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_84,_85){
with(_84){
var _86=objj_msgSend(_84,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_86){
objj_msgSend(_86,"setBackgroundColor:",objj_msgSend(_84,"currentValueForThemeAttribute:","bezel-color"));
}
var _87=objj_msgSend(_84,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_87){
objj_msgSend(_87,"setHidden:",objj_msgSend(_84,"hasThemeState:",CPThemeStateEditing));
var _88="";
if(objj_msgSend(_84,"hasThemeState:",CPTextFieldStatePlaceholder)){
_88=objj_msgSend(_84,"placeholderString");
}else{
_88=objj_msgSend(_84,"stringValue");
if(objj_msgSend(_84,"isSecure")){
_88=_89(_88);
}
}
objj_msgSend(_87,"setText:",_88);
objj_msgSend(_87,"setTextColor:",objj_msgSend(_84,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_87,"setFont:",objj_msgSend(_84,"currentValueForThemeAttribute:","font"));
objj_msgSend(_87,"setAlignment:",objj_msgSend(_84,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_87,"setVerticalAlignment:",objj_msgSend(_84,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_87,"setLineBreakMode:",objj_msgSend(_84,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_87,"setTextShadowColor:",objj_msgSend(_84,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_87,"setTextShadowOffset:",objj_msgSend(_84,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_11,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_8a,_8b,_8c,_8d,_8e){
with(_8a){
return objj_msgSend(_8a,"textFieldWithStringValue:placeholder:width:theme:",_8c,_8d,_8e,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_8f,_90,_91,_92,_93,_94){
with(_8f){
var _95=objj_msgSend(objj_msgSend(_8f,"alloc"),"initWithFrame:",CGRectMake(0,0,_93,29));
objj_msgSend(_95,"setTheme:",_94);
objj_msgSend(_95,"setStringValue:",_91);
objj_msgSend(_95,"setPlaceholderString:",_92);
objj_msgSend(_95,"setBordered:",YES);
objj_msgSend(_95,"setBezeled:",YES);
objj_msgSend(_95,"setEditable:",YES);
objj_msgSend(_95,"sizeToFit");
return _95;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_96,_97,_98,_99,_9a){
with(_96){
return objj_msgSend(_96,"roundedTextFieldWithStringValue:placeholder:width:theme:",_98,_99,_9a,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_9b,_9c,_9d,_9e,_9f,_a0){
with(_9b){
var _a1=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_9f,29));
objj_msgSend(_a1,"setTheme:",_a0);
objj_msgSend(_a1,"setStringValue:",_9d);
objj_msgSend(_a1,"setPlaceholderString:",_9e);
objj_msgSend(_a1,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_a1,"setBordered:",YES);
objj_msgSend(_a1,"setBezeled:",YES);
objj_msgSend(_a1,"setEditable:",YES);
objj_msgSend(_a1,"sizeToFit");
return _a1;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_a2,_a3,_a4){
with(_a2){
return objj_msgSend(_a2,"labelWithTitle:theme:",_a4,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_a5,_a6,_a7,_a8){
with(_a5){
var _a9=objj_msgSend(objj_msgSend(_a5,"alloc"),"init");
objj_msgSend(_a9,"setStringValue:",_a7);
objj_msgSend(_a9,"sizeToFit");
return _a9;
}
}),new objj_method(sel_getUid("themeClass"),function(_aa,_ab){
with(_aa){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_ac,_ad){
with(_ac){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _89=function(_ae){
if(!_ae){
return "";
}
var _af="",_b0=_ae.length;
while(_b0--){
_af+=_f;
}
return _af;
};
var _b1="CPTextFieldIsEditableKey",_b2="CPTextFieldIsSelectableKey",_b3="CPTextFieldIsBorderedKey",_b4="CPTextFieldIsBezeledKey",_b5="CPTextFieldBezelStyleKey",_b6="CPTextFieldDrawsBackgroundKey",_b7="CPTextFieldLineBreakModeKey",_b8="CPTextFieldBackgroundColorKey",_b9="CPTextFieldPlaceholderStringKey";
var _10=objj_getClass("CPTextField");
if(!_10){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _11=_10.isa;
class_addMethods(_10,[new objj_method(sel_getUid("initWithCoder:"),function(_ba,_bb,_bc){
with(_ba){
_ba=objj_msgSendSuper({receiver:_ba,super_class:objj_getClass("CPControl")},"initWithCoder:",_bc);
if(_ba){
objj_msgSend(_ba,"setEditable:",objj_msgSend(_bc,"decodeBoolForKey:",_b1));
objj_msgSend(_ba,"setSelectable:",objj_msgSend(_bc,"decodeBoolForKey:",_b2));
objj_msgSend(_ba,"setDrawsBackground:",objj_msgSend(_bc,"decodeBoolForKey:",_b6));
objj_msgSend(_ba,"setTextFieldBackgroundColor:",objj_msgSend(_bc,"decodeObjectForKey:",_b8));
objj_msgSend(_ba,"setPlaceholderString:",objj_msgSend(_bc,"decodeObjectForKey:",_b9));
}
return _ba;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_bd,_be,_bf){
with(_bd){
objj_msgSendSuper({receiver:_bd,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_bf);
objj_msgSend(_bf,"encodeBool:forKey:",_isEditable,_b1);
objj_msgSend(_bf,"encodeBool:forKey:",_isSelectable,_b2);
objj_msgSend(_bf,"encodeBool:forKey:",_drawsBackground,_b6);
objj_msgSend(_bf,"encodeObject:forKey:",_textFieldBackgroundColor,_b8);
objj_msgSend(_bf,"encodeObject:forKey:",_placeholderString,_b9);
}
})]);
