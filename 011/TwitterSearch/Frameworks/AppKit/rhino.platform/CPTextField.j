i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;16093;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1="‚Ä¢";
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("string"),function(_4,_5){
with(_4){
return _4;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _2=objj_allocateClassPair(CPControl,"CPTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setStringValue:","");
objj_msgSend(_6,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_6,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
_isEditable=_b;
}
}),new objj_method(sel_getUid("isEditable"),function(_c,_d){
with(_c){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_e,_f,_10){
with(_e){
_isSelectable=_10;
}
}),new objj_method(sel_getUid("isSelectable"),function(_11,_12){
with(_11){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_13,_14,_15){
with(_13){
_isSecure=_15;
}
}),new objj_method(sel_getUid("isSecure"),function(_16,_17){
with(_16){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_18,_19,_1a){
with(_18){
if(_1a){
objj_msgSend(_18,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_18,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_1d,_1e,_1f){
with(_1d){
var _20=_1f===CPTextFieldRoundedBezel;
if(_20){
objj_msgSend(_1d,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_1d,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_23,_24,_25){
with(_23){
if(_25){
objj_msgSend(_23,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_23,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_28,_29,_2a){
with(_28){
if(_drawsBackground==_2a){
return;
}
_drawsBackground=_2a;
objj_msgSend(_28,"setNeedsLayout");
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_2b,_2c){
with(_2b){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_2d,_2e,_2f){
with(_2d){
if(_textFieldBackgroundColor==_2f){
return;
}
_textFieldBackgroundColor=_2f;
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_30,_31){
with(_30){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"isEditable")&&objj_msgSend(_32,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_34,_35){
with(_34){
objj_msgSend(_34,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_34,"_updatePlaceholderState");
objj_msgSend(_34,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_36,_37){
with(_36){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_36,"_updatePlaceholderState");
objj_msgSend(_36,"setNeedsLayout");
objj_msgSend(_36,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_36,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_38,"isEditable")&&objj_msgSend(_38,"isEnabled")){
return objj_msgSend(objj_msgSend(_38,"window"),"makeFirstResponder:",_38);
}else{
return objj_msgSend(objj_msgSend(_38,"nextResponder"),"mouseDown:",_3a);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_3b,_3c){
with(_3b){
return objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPControl")},"setObjectValue:",String(_3f));
objj_msgSend(_3d,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
objj_msgSendSuper({receiver:_40,super_class:objj_getClass("CPControl")},"setObjectValue:",_42);
objj_msgSend(_40,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_43,_44){
with(_43){
var _45=objj_msgSend(_43,"stringValue");
if((!_45||_45.length===0)&&!objj_msgSend(_43,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_43,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_43,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_46,_47,_48){
with(_46){
if(_placeholderString===_48){
return;
}
_placeholderString=_48;
if(objj_msgSend(_46,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_46,"setNeedsLayout");
objj_msgSend(_46,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_49,_4a){
with(_49){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4b,_4c){
with(_4b){
var _4d=objj_msgSend((objj_msgSend(_4b,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_4b,"currentValueForThemeAttribute:","font")),_4e=objj_msgSend(_4b,"currentValueForThemeAttribute:","content-inset"),_4f=objj_msgSend(_4b,"currentValueForThemeAttribute:","min-size"),_50=objj_msgSend(_4b,"currentValueForThemeAttribute:","max-size");
_4d.width=MAX(_4d.width+_4e.left+_4e.right,_4f.width);
_4d.height=MAX(_4d.height+_4e.top+_4e.bottom,_4f.height);
if(_50.width>=0){
_4d.width=MIN(_4d.width,_50.width);
}
if(_50.height>=0){
_4d.height=MIN(_4d.height,_50.height);
}
if(objj_msgSend(_4b,"isEditable")){
_4d.width=CGRectGetWidth(objj_msgSend(_4b,"frame"));
}
objj_msgSend(_4b,"setFrameSize:",_4d);
}
}),new objj_method(sel_getUid("selectText:"),function(_51,_52,_53){
with(_51){
}
}),new objj_method(sel_getUid("setDelegate:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_57,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_54);
objj_msgSend(_57,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_54);
objj_msgSend(_57,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_54);
}
_delegate=_56;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_57,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_54);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_57,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_54);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_57,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_54);
}
}
}),new objj_method(sel_getUid("delegate"),function(_58,_59){
with(_58){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemeAttribute:","content-inset");
if(!_5d){
return _5c;
}
_5c.origin.x+=_5d.left;
_5c.origin.y+=_5d.top;
_5c.size.width-=_5d.left+_5d.right;
_5c.size.height-=_5d.top+_5d.bottom;
return _5c;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_5e,_5f,_60){
with(_5e){
var _61=objj_msgSend(_5e,"currentValueForThemeAttribute:","bezel-inset");
if(((_61).top===0&&(_61).right===0&&(_61).bottom===0&&(_61).left===0)){
return _60;
}
_60.origin.x+=_61.left;
_60.origin.y+=_61.top;
_60.size.width-=_61.left+_61.right;
_60.size.height-=_61.top+_61.bottom;
return _60;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_62,_63,_64){
with(_62){
if(_64==="bezel-view"){
return objj_msgSend(_62,"bezelRectForBounds:",objj_msgSend(_62,"bounds"));
}else{
if(_64==="content-view"){
return objj_msgSend(_62,"contentRectForBounds:",objj_msgSend(_62,"bounds"));
}
}
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_64);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_65,_66,_67){
with(_65){
if(_67==="bezel-view"){
var _68=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_68,"setHitTests:",NO);
return _68;
}else{
var _68=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _68;
}
return objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_67);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_69,_6a){
with(_69){
var _6b=objj_msgSend(_69,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_6b){
objj_msgSend(_6b,"setBackgroundColor:",objj_msgSend(_69,"currentValueForThemeAttribute:","bezel-color"));
}
var _6c=objj_msgSend(_69,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_6c){
objj_msgSend(_6c,"setHidden:",objj_msgSend(_69,"hasThemeState:",CPThemeStateEditing));
var _6d="";
if(objj_msgSend(_69,"hasThemeState:",CPTextFieldStatePlaceholder)){
_6d=objj_msgSend(_69,"placeholderString");
}else{
_6d=objj_msgSend(_69,"stringValue");
if(objj_msgSend(_69,"isSecure")){
_6d=_6e(_6d);
}
}
objj_msgSend(_6c,"setText:",_6d);
objj_msgSend(_6c,"setTextColor:",objj_msgSend(_69,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_6c,"setFont:",objj_msgSend(_69,"currentValueForThemeAttribute:","font"));
objj_msgSend(_6c,"setAlignment:",objj_msgSend(_69,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_6c,"setVerticalAlignment:",objj_msgSend(_69,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_6c,"setLineBreakMode:",objj_msgSend(_69,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_6c,"setTextShadowColor:",objj_msgSend(_69,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_6c,"setTextShadowOffset:",objj_msgSend(_69,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_6f,_70,_71,_72,_73){
with(_6f){
return objj_msgSend(_6f,"textFieldWithStringValue:placeholder:width:theme:",_71,_72,_73,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_74,_75,_76,_77,_78,_79){
with(_74){
var _7a=objj_msgSend(objj_msgSend(_74,"alloc"),"initWithFrame:",CGRectMake(0,0,_78,29));
objj_msgSend(_7a,"setTheme:",_79);
objj_msgSend(_7a,"setStringValue:",_76);
objj_msgSend(_7a,"setPlaceholderString:",_77);
objj_msgSend(_7a,"setBordered:",YES);
objj_msgSend(_7a,"setBezeled:",YES);
objj_msgSend(_7a,"setEditable:",YES);
objj_msgSend(_7a,"sizeToFit");
return _7a;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_7b,_7c,_7d,_7e,_7f){
with(_7b){
return objj_msgSend(_7b,"roundedTextFieldWithStringValue:placeholder:width:theme:",_7d,_7e,_7f,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_80,_81,_82,_83,_84,_85){
with(_80){
var _86=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_84,29));
objj_msgSend(_86,"setTheme:",_85);
objj_msgSend(_86,"setStringValue:",_82);
objj_msgSend(_86,"setPlaceholderString:",_83);
objj_msgSend(_86,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_86,"setBordered:",YES);
objj_msgSend(_86,"setBezeled:",YES);
objj_msgSend(_86,"setEditable:",YES);
objj_msgSend(_86,"sizeToFit");
return _86;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_87,_88,_89){
with(_87){
return objj_msgSend(_87,"labelWithTitle:theme:",_89,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_8a,_8b,_8c,_8d){
with(_8a){
var _8e=objj_msgSend(objj_msgSend(_8a,"alloc"),"init");
objj_msgSend(_8e,"setStringValue:",_8c);
objj_msgSend(_8e,"sizeToFit");
return _8e;
}
}),new objj_method(sel_getUid("themeClass"),function(_8f,_90){
with(_8f){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_91,_92){
with(_91){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _6e=function(_93){
if(!_93){
return "";
}
var _94="",_95=_93.length;
while(_95--){
_94+=_1;
}
return _94;
};
var _96="CPTextFieldIsEditableKey",_97="CPTextFieldIsSelectableKey",_98="CPTextFieldIsBorderedKey",_99="CPTextFieldIsBezeledKey",_9a="CPTextFieldBezelStyleKey",_9b="CPTextFieldDrawsBackgroundKey",_9c="CPTextFieldLineBreakModeKey",_9d="CPTextFieldBackgroundColorKey",_9e="CPTextFieldPlaceholderStringKey";
var _2=objj_getClass("CPTextField");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_9f,_a0,_a1){
with(_9f){
_9f=objj_msgSendSuper({receiver:_9f,super_class:objj_getClass("CPControl")},"initWithCoder:",_a1);
if(_9f){
objj_msgSend(_9f,"setEditable:",objj_msgSend(_a1,"decodeBoolForKey:",_96));
objj_msgSend(_9f,"setSelectable:",objj_msgSend(_a1,"decodeBoolForKey:",_97));
objj_msgSend(_9f,"setDrawsBackground:",objj_msgSend(_a1,"decodeBoolForKey:",_9b));
objj_msgSend(_9f,"setTextFieldBackgroundColor:",objj_msgSend(_a1,"decodeObjectForKey:",_9d));
objj_msgSend(_9f,"setPlaceholderString:",objj_msgSend(_a1,"decodeObjectForKey:",_9e));
}
return _9f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a2,_a3,_a4){
with(_a2){
objj_msgSendSuper({receiver:_a2,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_a4);
objj_msgSend(_a4,"encodeBool:forKey:",_isEditable,_96);
objj_msgSend(_a4,"encodeBool:forKey:",_isSelectable,_97);
objj_msgSend(_a4,"encodeBool:forKey:",_drawsBackground,_9b);
objj_msgSend(_a4,"encodeObject:forKey:",_textFieldBackgroundColor,_9d);
objj_msgSend(_a4,"encodeObject:forKey:",_placeholderString,_9e);
}
})]);
