I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;7518;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
var _1=nil;
var _2=3,_3=3,_4=3,_5=5,_6=_4+_5,_7=_2+_3;
var _8=objj_allocateClassPair(CPControl,"CPImageView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_DOMImageElement"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowView"),new objj_ivar("_imageRect")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.top="0px";
if(_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMImageElement;
_DOMImageElement.style.visibility="hidden";
}
return _a;
}
}),new objj_method(sel_getUid("image"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"objectValue");
}
}),new objj_method(sel_getUid("setImage:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setObjectValue:",_11);
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"objectValue");
if(_15===_14){
return;
}
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",_14);
var _16=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_15){
objj_msgSend(_16,"removeObserver:name:object:",_12,CPImageDidLoadNotification,_15);
}
var _17=objj_msgSend(_12,"objectValue");
_DOMImageElement.src=_17?objj_msgSend(_17,"filename"):"";
var _18=objj_msgSend(_17,"size");
if(_18&&_18.width===-1&&_18.height===-1){
objj_msgSend(_16,"addObserver:selector:name:object:",_12,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_17);
_DOMImageElement.width=0;
_DOMImageElement.height=0;
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_12,"hideOrDisplayContents");
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"hideOrDisplayContents");
objj_msgSend(_19,"setNeedsLayout");
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hasShadow"),function(_1c,_1d){
with(_1c){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_1e,_1f,_20){
with(_1e){
if(_hasShadow==_20){
return;
}
_hasShadow=_20;
if(_hasShadow){
_shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",objj_msgSend(_1e,"bounds"));
objj_msgSend(_1e,"addSubview:",_shadowView);
objj_msgSend(_1e,"setNeedsLayout");
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}else{
objj_msgSend(_shadowView,"removeFromSuperview");
_shadowView=nil;
}
objj_msgSend(_1e,"hideOrDisplayContents");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_21,_22,_23){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPControl")},"setImageScaling:",_23);
if(objj_msgSend(_21,"currentValueForThemeAttribute:","image-scaling")===CPScaleToFit){
if(!_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext=[];
}
var _24=_DOMImageElement.CPDOMDisplayContext[0];
if(!(_24>=0)){
_24=_DOMImageElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_24]=0;
CPDOMDisplayServerInstructions[_24+1]=_DOMImageElement;
CPDOMDisplayServerInstructions[_24+2]=NULL;
CPDOMDisplayServerInstructions[_24+3]=0;
CPDOMDisplayServerInstructions[_24+4]=0;
}
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(_21,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_25,_26){
with(_25){
if(!objj_msgSend(_25,"image")){
_DOMImageElement.style.visibility="hidden";
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
_DOMImageElement.style.visibility="visible";
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_27,_28){
with(_27){
return _imageRect;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_29,_2a){
with(_29){
if(!objj_msgSend(_29,"image")){
return;
}
var _2b=objj_msgSend(_29,"bounds"),_2c=objj_msgSend(_29,"image"),_2d=objj_msgSend(_29,"currentValueForThemeAttribute:","image-scaling"),x=0,y=0,_30=(_hasShadow?_7:0),_31=(_hasShadow?_6:0),_32=(_2b.size.width),_33=(_2b.size.height),_34=_32-_30,_35=_33-_31;
if(_2d===CPScaleToFit){
_DOMImageElement.width=ROUND(_34);
_DOMImageElement.height=ROUND(_35);
}else{
var _36=objj_msgSend(_2c,"size");
if(_36.width==-1&&_36.height==-1){
return;
}
if(_2d===CPScaleProportionally){
if(_34>=_36.width&&_35>=_36.height){
_34=_36.width;
_35=_36.height;
}else{
var _37=_36.width/_36.height,_38=_34/_35;
if(_38>_37){
_34=_35*_37;
}else{
_35=_34/_37;
}
}
_DOMImageElement.width=ROUND(_34);
_DOMImageElement.height=ROUND(_35);
}else{
_34=_36.width;
_35=_36.height;
}
if(_2d==CPScaleNone){
_DOMImageElement.width=ROUND(_36.width);
_DOMImageElement.height=ROUND(_36.height);
}
var x=(_32-_34)/2,y=(_33-_35)/2;
if(!_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext=[];
}
var _39=_DOMImageElement.CPDOMDisplayContext[0];
if(!(_39>=0)){
_39=_DOMImageElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_39]=0;
CPDOMDisplayServerInstructions[_39+1]=_DOMImageElement;
CPDOMDisplayServerInstructions[_39+2]=NULL;
CPDOMDisplayServerInstructions[_39+3]=x;
CPDOMDisplayServerInstructions[_39+4]=y;
}
_imageRect={origin:{x:x,y:y},size:{width:_34,height:_35}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-_2,y:y-_4},size:{width:_34+_30,height:_35+_31}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(objj_msgSend(_3a,"nextResponder"),"mouseDown:",_3c);
}
})]);
var _3d="CPImageViewImageKey",_3e="CPImageViewImageScalingKey",_3f="CPImageViewHasShadowKey";
var _8=objj_getClass("CPImageView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImageView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_40,_41,_42){
with(_40){
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.top="0px";
_DOMImageElement.style.visibility="hidden";
_40=objj_msgSendSuper({receiver:_40,super_class:objj_getClass("CPControl")},"initWithCoder:",_42);
if(_40){
_DOMElement.appendChild(_DOMImageElement);
objj_msgSend(_40,"setHasShadow:",objj_msgSend(_42,"decodeBoolForKey:",_3f));
objj_msgSend(_40,"setNeedsLayout");
objj_msgSend(_40,"setNeedsDisplay:",YES);
}
return _40;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_43,_44,_45){
with(_43){
if(_shadowView){
var _46=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_45);
if(_shadowView){
_subviews=_46;
}
objj_msgSend(_45,"encodeBool:forKey:",_hasShadow,_3f);
}
})]);
