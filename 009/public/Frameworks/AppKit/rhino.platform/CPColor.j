I;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;12886;
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2;
var _8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12;
var _13=objj_allocateClassPair(CPObject,"CPColor"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_components"),new objj_ivar("_patternImage"),new objj_ivar("_cssString")]);
objj_registerClassPair(_13);
objj_addClassForBundle(_13,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_13,[new objj_method(sel_getUid("_initWithCSSString:"),function(_15,_16,_17){
with(_15){
if(_17.indexOf("rgb")==CPNotFound){
return nil;
}
_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("CPObject")},"init");
var _18=_17.indexOf("(");
var _19=_17.substring(_18+1).split(",");
_components=[parseInt(_19[0],10)/255,parseInt(_19[1],10)/255,parseInt(_19[2],10)/255,_19[3]?parseInt(_19[3],10)/255:1];
_cssString=_17;
return _15;
}
}),new objj_method(sel_getUid("_initWithRGBA:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_components=_1c;
if(!CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1&&window.Base64&&window.CRC32){
var _1d=[137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,1,0,0,0,1,8,3,0,0,0,40,203,52,187,0,0,3,0,80,76,84,69,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,137,153,85,0,0,0,1,116,82,78,83,0,64,230,216,102,0,0,0,16,73,68,65,84,120,218,98,96,0,0,0,0,255,255,3,0,0,2,0,1,36,127,36,241,0,0,0,0,73,69,78,68,174,66,96,130,255];
var _1e=41;
var _1f=42;
var _20=43;
var _21=821;
var _22=809;
var _23=822;
var _24=37;
var _25=817;
_1d[_1e]=Math.round(_components[0]*255);
_1d[_1f]=Math.round(_components[1]*255);
_1d[_20]=Math.round(_components[2]*255);
_1d[_21]=Math.round(_components[3]*255);
var _26=integerToBytes(CRC32.getCRC(_1d,_24,4+768),4);
var _27=integerToBytes(CRC32.getCRC(_1d,_25,4+1),4);
for(var i=0;i<4;i++){
_1d[_22+i]=_26[i];
_1d[_23+i]=_27[i];
}
var _29=Base64.encode(_1d);
_cssString="url(\"data:image/png;base64,"+_29+"\")";
}else{
var _2a=CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1;
_cssString=(_2a?"rgba(":"rgb(")+parseInt(_components[0]*255)+", "+parseInt(_components[1]*255)+", "+parseInt(_components[2]*255)+(_2a?(", "+_components[3]):"")+")";
}
}
return _1a;
}
}),new objj_method(sel_getUid("_initWithPatternImage:"),function(_2b,_2c,_2d){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPObject")},"init");
if(_2b){
_patternImage=_2d;
_cssString="url(\""+objj_msgSend(_patternImage,"filename")+"\")";
}
return _2b;
}
}),new objj_method(sel_getUid("patternImage"),function(_2e,_2f){
with(_2e){
return _patternImage;
}
}),new objj_method(sel_getUid("alphaComponent"),function(_30,_31){
with(_30){
return _components[3];
}
}),new objj_method(sel_getUid("blueComponent"),function(_32,_33){
with(_32){
return _components[2];
}
}),new objj_method(sel_getUid("greenComponent"),function(_34,_35){
with(_34){
return _components[1];
}
}),new objj_method(sel_getUid("redComponent"),function(_36,_37){
with(_36){
return _components[0];
}
}),new objj_method(sel_getUid("components"),function(_38,_39){
with(_38){
return _components;
}
}),new objj_method(sel_getUid("colorWithAlphaComponent:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=_components.slice();
_3d[_3d.length-1]=_3c;
return objj_msgSend(objj_msgSend(objj_msgSend(_3a,"class"),"alloc"),"_initWithRGBA:",_3d);
}
}),new objj_method(sel_getUid("hsbComponents"),function(_3e,_3f){
with(_3e){
var red=ROUND(_components[_1]*255),_41=ROUND(_components[_2]*255),_42=ROUND(_components[_3]*255);
var max=MAX(red,_41,_42),min=MIN(red,_41,_42),_45=max-min;
var _46=max/255,_47=(max!=0)?_45/max:0;
var hue;
if(_47==0){
hue=0;
}else{
var rr=(max-red)/_45;
var gr=(max-_41)/_45;
var br=(max-_42)/_45;
if(red==max){
hue=br-gr;
}else{
if(_41==max){
hue=2+rr-br;
}else{
hue=4+gr-rr;
}
}
hue/=6;
if(hue<0){
hue++;
}
}
return [ROUND(hue*360),ROUND(_47*100),ROUND(_46*100)];
}
}),new objj_method(sel_getUid("cssString"),function(_4c,_4d){
with(_4c){
return _cssString;
}
}),new objj_method(sel_getUid("hexString"),function(_4e,_4f){
with(_4e){
return rgbToHex(objj_msgSend(_4e,"redComponent"),objj_msgSend(_4e,"greenComponent"),objj_msgSend(_4e,"blueComponent"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_50,_51,_52){
with(_50){
if(!_52){
return NO;
}
if(_52===_50){
return YES;
}
return objj_msgSend(_52,"isKindOfClass:",CPColor)&&objj_msgSend(_52,"cssString")===objj_msgSend(_50,"cssString");
}
}),new objj_method(sel_getUid("description"),function(_53,_54){
with(_53){
return objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPObject")},"description")+" "+objj_msgSend(_53,"cssString");
}
})]);
class_addMethods(_14,[new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"),function(_55,_56,red,_58,_59,_5a){
with(_55){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[red,_58,_59,_5a]);
}
}),new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"),function(_5b,_5c,red,_5e,_5f,_60){
with(_5b){
return objj_msgSend(_5b,"colorWithRed:green:blue:alpha:",red,_5e,_5f,_60);
}
}),new objj_method(sel_getUid("colorWithWhite:alpha:"),function(_61,_62,_63,_64){
with(_61){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[_63,_63,_63,_64]);
}
}),new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"),function(_65,_66,_67,_68){
with(_65){
return objj_msgSend(_65,"colorWithWhite:alpha:",_67,_68);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:"),function(_69,_6a,hue,_6c,_6d){
with(_69){
return objj_msgSend(_69,"colorWithHue:saturation:brightness:alpha:",hue,_6c,_6d,1);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"),function(_6e,_6f,hue,_71,_72,_73){
with(_6e){
if(_71===0){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_72/100,_73);
}
var f=hue%60,p=(_72*(100-_71))/10000,q=(_72*(6000-_71*f))/600000,t=(_72*(6000-_71*(60-f)))/600000,b=_72/100;
switch(FLOOR(hue/60)){
case 0:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,t,p,_73);
case 1:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",q,b,p,_73);
case 2:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,b,t,_73);
case 3:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,q,b,_73);
case 4:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",t,p,b,_73);
case 5:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,p,q,_73);
}
}
}),new objj_method(sel_getUid("colorWithHexString:"),function(_79,_7a,hex){
with(_79){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",hexToRGB(hex));
}
}),new objj_method(sel_getUid("blackColor"),function(_7c,_7d){
with(_7c){
if(!_8){
_8=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1]);
}
return _8;
}
}),new objj_method(sel_getUid("blueColor"),function(_7e,_7f){
with(_7e){
if(!_b){
_b=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,1,1]);
}
return _b;
}
}),new objj_method(sel_getUid("darkGrayColor"),function(_80,_81){
with(_80){
if(!_f){
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1/3,1);
}
return _f;
}
}),new objj_method(sel_getUid("grayColor"),function(_82,_83){
with(_82){
if(!_d){
_d=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1);
}
return _d;
}
}),new objj_method(sel_getUid("greenColor"),function(_84,_85){
with(_84){
if(!_a){
_a=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,0,1]);
}
return _a;
}
}),new objj_method(sel_getUid("lightGrayColor"),function(_86,_87){
with(_86){
if(!_e){
_e=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",2/3,1);
}
return _e;
}
}),new objj_method(sel_getUid("redColor"),function(_88,_89){
with(_88){
if(!_9){
_9=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,0,1]);
}
return _9;
}
}),new objj_method(sel_getUid("whiteColor"),function(_8a,_8b){
with(_8a){
if(!_10){
_10=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,1,1]);
}
return _10;
}
}),new objj_method(sel_getUid("yellowColor"),function(_8c,_8d){
with(_8c){
if(!_c){
_c=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,0,1]);
}
return _c;
}
}),new objj_method(sel_getUid("shadowColor"),function(_8e,_8f){
with(_8e){
if(!_11){
_11=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1/3]);
}
return _11;
}
}),new objj_method(sel_getUid("clearColor"),function(_90,_91){
with(_90){
if(!_12){
_12=objj_msgSend(_90,"colorWithCalibratedWhite:alpha:",0,0);
}
return _12;
}
}),new objj_method(sel_getUid("colorWithPatternImage:"),function(_92,_93,_94){
with(_92){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",_94);
}
}),new objj_method(sel_getUid("colorWithCSSString:"),function(_95,_96,_97){
with(_95){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_97);
}
})]);
var _13=objj_getClass("CPColor");
if(!_13){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _14=_13.isa;
class_addMethods(_13,[new objj_method(sel_getUid("set"),function(_98,_99){
with(_98){
objj_msgSend(_98,"setFill");
objj_msgSend(_98,"setStroke");
}
}),new objj_method(sel_getUid("setFill"),function(_9a,_9b){
with(_9a){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(ctx,_9a);
}
}),new objj_method(sel_getUid("setStroke"),function(_9d,_9e){
with(_9d){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(ctx,_9d);
}
})]);
var _a0="CPColorComponentsKey",_a1="CPColorPatternImageKey";
var _13=objj_getClass("CPColor");
if(!_13){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _14=_13.isa;
class_addMethods(_13,[new objj_method(sel_getUid("initWithCoder:"),function(_a2,_a3,_a4){
with(_a2){
if(objj_msgSend(_a4,"containsValueForKey:",_a1)){
return objj_msgSend(_a2,"_initWithPatternImage:",objj_msgSend(_a4,"decodeObjectForKey:",_a1));
}
return objj_msgSend(_a2,"_initWithRGBA:",objj_msgSend(_a4,"decodeObjectForKey:",_a0));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a5,_a6,_a7){
with(_a5){
if(_patternImage){
objj_msgSend(_a7,"encodeObject:forKey:",_patternImage,_a1);
}else{
objj_msgSend(_a7,"encodeObject:forKey:",_components,_a0);
}
}
})]);
var _a8="0123456789ABCDEF";
hexToRGB=function(hex){
if(hex.length==3){
hex=hex.charAt(0)+hex.charAt(0)+hex.charAt(1)+hex.charAt(1)+hex.charAt(2)+hex.charAt(2);
}
if(hex.length!=6){
return null;
}
hex=hex.toUpperCase();
for(var i=0;i<hex.length;i++){
if(_a8.indexOf(hex.charAt(i))==-1){
return null;
}
}
var red=(_a8.indexOf(hex.charAt(0))*16+_a8.indexOf(hex.charAt(1)))/255;
var _ac=(_a8.indexOf(hex.charAt(2))*16+_a8.indexOf(hex.charAt(3)))/255;
var _ad=(_a8.indexOf(hex.charAt(4))*16+_a8.indexOf(hex.charAt(5)))/255;
return [red,_ac,_ad,1];
};
integerToBytes=function(_ae,_af){
if(!_af){
_af=(_ae==0)?1:Math.round((Math.log(_ae)/Math.log(2))/8+0.5);
}
var _b0=new Array(_af);
for(var i=_af-1;i>=0;i--){
_b0[i]=_ae&255;
_ae=_ae>>8;
}
return _b0;
};
rgbToHex=function(r,g,b){
return byteToHex(r)+byteToHex(g)+byteToHex(b);
};
byteToHex=function(n){
if(!n||isNaN(n)){
return "00";
}
n=ROUND(MIN(255,MAX(0,256*n)));
return _a8.charAt((n-n%16)/16)+_a8.charAt(n%16);
};
