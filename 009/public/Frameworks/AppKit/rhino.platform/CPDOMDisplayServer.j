I;22;Foundation/CPRunLoop.jc;3207;
var _1=nil;
CPDOMDisplayServerInstructions=[];
CPDOMDisplayServerInstructionCount=0;
CPDOMDisplayServerViews=[];
CPDOMDisplayServerViewsCount=0;
CPDOMDisplayServerViewsContext={};
var _2=objj_allocateClassPair(CPObject,"CPDOMDisplayServer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("start"),function(_4,_5){
with(_4){
_1=objj_msgSend(CPRunLoop,"currentRunLoop");
objj_msgSend(_1,"performSelector:target:argument:order:modes:",sel_getUid("run"),CPDOMDisplayServer,nil,0,[CPDefaultRunLoopMode]);
}
}),new objj_method(sel_getUid("run"),function(_6,_7){
with(_6){
while(CPDOMDisplayServerInstructionCount||CPDOMDisplayServerViewsCount){
var _8=0;
while(_8<CPDOMDisplayServerInstructionCount){
var _9=CPDOMDisplayServerInstructions[_8++];
try{
switch(_9){
case 0:
case 1:
case 2:
case 3:
var _a=CPDOMDisplayServerInstructions[_8],_b=_a.style,x=(_9==0||_9==2)?"left":"right",y=(_9==0||_9==1)?"top":"bottom";
CPDOMDisplayServerInstructions[_8++]=nil;
var _e=CPDOMDisplayServerInstructions[_8++];
if(_e){
var _f={x:CPDOMDisplayServerInstructions[_8++],y:CPDOMDisplayServerInstructions[_8++]},_10={x:_f.x*_e.a+_f.y*_e.c+_e.tx,y:_f.x*_e.b+_f.y*_e.d+_e.ty};
_b[x]=ROUND(_10.x)+"px";
_b[y]=ROUND(_10.y)+"px";
}else{
_b[x]=ROUND(CPDOMDisplayServerInstructions[_8++])+"px";
_b[y]=ROUND(CPDOMDisplayServerInstructions[_8++])+"px";
}
_a.CPDOMDisplayContext[0]=-1;
break;
case 4:
var _a=CPDOMDisplayServerInstructions[_8],_b=_a.style;
CPDOMDisplayServerInstructions[_8++]=nil;
_a.CPDOMDisplayContext[4]=-1;
_b.width=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]))+"px";
_b.height=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]))+"px";
break;
case 5:
var _a=CPDOMDisplayServerInstructions[_8];
CPDOMDisplayServerInstructions[_8++]=nil;
_a.CPDOMDisplayContext[5]=-1;
_a.width=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]));
_a.height=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]));
break;
case 6:
CPDOMDisplayServerInstructions[_8].appendChild(CPDOMDisplayServerInstructions[_8+1]);
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
break;
case 7:
CPDOMDisplayServerInstructions[_8].insertBefore(CPDOMDisplayServerInstructions[_8+1],CPDOMDisplayServerInstructions[_8+2]);
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
break;
case 8:
CPDOMDisplayServerInstructions[_8].removeChild(CPDOMDisplayServerInstructions[_8+1]);
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
break;
}
}
catch(e){
CPLog("here?"+_9);
}
}
CPDOMDisplayServerInstructionCount=0;
var _11=CPDOMDisplayServerViews,_8=0,_12=CPDOMDisplayServerViewsCount;
CPDOMDisplayServerViews=[];
CPDOMDisplayServerViewsCount=0;
for(;_8<_12;++_8){
var _13=_11[_8];
delete CPDOMDisplayServerViewsContext[objj_msgSend(_13,"hash")];
objj_msgSend(_13,"layoutIfNeeded");
objj_msgSend(_13,"displayIfNeeded");
}
}
objj_msgSend(_1,"performSelector:target:argument:order:modes:",sel_getUid("run"),CPDOMDisplayServer,nil,0,[CPDefaultRunLoopMode]);
}
})]);
objj_msgSend(CPDOMDisplayServer,"start");
