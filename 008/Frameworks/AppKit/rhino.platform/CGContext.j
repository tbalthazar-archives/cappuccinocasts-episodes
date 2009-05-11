i;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;21422;
kCGLineCapButt=0;
kCGLineCapRound=1;
kCGLineCapSquare=2;
kCGLineJoinMiter=0;
kCGLineJoinRound=1;
kCGLineJoinBevel=2;
kCGPathFill=0;
kCGPathEOFill=1;
kCGPathStroke=2;
kCGPathFillStroke=3;
kCGPathEOFillStroke=4;
kCGBlendModeNormal=0;
kCGBlendModeMultiply=1;
kCGBlendModeScreen=2;
kCGBlendModeOverlay=3;
kCGBlendModeDarken=4;
kCGBlendModeLighten=5;
kCGBlendModeColorDodge=6;
kCGBlendModeColorBurn=7;
kCGBlendModeSoftLight=8;
kCGBlendModeHardLight=9;
kCGBlendModeDifference=10;
kCGBlendModeExclusion=11;
kCGBlendModeHue=12;
kCGBlendModeSaturation=13;
kCGBlendModeColor=14;
kCGBlendModeLuminosity=15;
kCGBlendModeClear=16;
kCGBlendModeCopy=17;
kCGBlendModeSourceIn=18;
kCGBlendModeSourceOut=19;
kCGBlendModeSourceAtop=20;
kCGBlendModeDestinationOver=21;
kCGBlendModeDestinationIn=22;
kCGBlendModeDestinationOut=23;
kCGBlendModeDestinationAtop=24;
kCGBlendModeXOR=25;
kCGBlendModePlusDarker=26;
kCGBlendModePlusLighter=27;
CGContextRelease=function(){
};
CGContextRetain=function(_1){
return _1;
};
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CGGStateCreate=function(){
return {alpha:1,strokeStyle:"#000",fillStyle:"#ccc",lineWidth:1,lineJoin:kCGLineJoinMiter,lineCap:kCGLineCapButt,miterLimit:10,globalAlpha:1,blendMode:kCGBlendModeNormal,shadowOffset:{width:0,height:0},shadowBlur:0,shadowColor:NULL,CTM:{a:1,b:0,c:0,d:1,tx:0,ty:0}};
};
CGGStateCreateCopy=function(_2){
return {alpha:_2.alpha,strokeStyle:_2.strokeStyle,fillStyle:_2.fillStyle,lineWidth:_2.lineWidth,lineJoin:_2.lineJoin,lineCap:_2.lineCap,miterLimit:_2.miterLimit,globalAlpha:_2.globalAlpha,blendMode:_2.blendMode,shadowOffset:_2.shadowOffset,shadowBlur:_2.shadowBlur,shadowColor:_2.shadowColor,CTM:{a:_2.CTM.a,b:_2.CTM.b,c:_2.CTM.c,d:_2.CTM.d,tx:_2.CTM.tx,ty:_2.CTM.ty}};
};
CGBitmapGraphicsContextCreate=function(){
return {DOMElement:document.createElement("div"),path:NULL,gState:CGGStateCreate(),gStateStack:[]};
};
CGContextSaveGState=function(_3){
_3.gStateStack.push(CGGStateCreateCopy(_3.gState));
};
CGContextRestoreGState=function(_4){
_4.gState=_4.gStateStack.pop();
};
CGContextSetLineCap=function(_5,_6){
_5.gState.lineCap=_6;
};
CGContextSetLineJoin=function(_7,_8){
_7.gState.lineJoin=_8;
};
CGContextSetLineWidth=function(_9,_a){
_9.gState.lineWidth=_a;
};
CGContextSetMiterLimit=function(_b,_c){
_b.gState.miterLimit=_c;
};
CGContextSetBlendMode=function(_d,_e){
_d.gState.blendMode=_e;
};
CGContextAddArc=function(_f,x,y,_12,_13,_14,_15){
CGPathAddArc(_f.path,_f.gState.CTM,x,y,_12,_13,_14,_15);
};
CGContextAddArcToPoint=function(_16,x1,y1,x2,y2,_1b){
CGPathAddArcToPoint(_16.path,_16.gState.CTM,x1,y1,x2,y2,_1b);
};
CGContextAddCurveToPoint=function(_1c,_1d,_1e,_1f,_20,x,y){
CGPathAddCurveToPoint(_1c.path,_1c.gState.CTM,_1d,_1e,_1f,_20,x,y);
};
CGContextAddLines=function(_23,_24,_25){
CGPathAddLines(_23.path,_23.gState.CTM,_24,_25);
};
CGContextAddLineToPoint=function(_26,x,y){
CGPathAddLineToPoint(_26.path,_26.gState.CTM,x,y);
};
CGContextAddPath=function(_29,_2a){
if(!_29||CGPathIsEmpty(_2a)){
return;
}
if(!_29.path){
_29.path=CGPathCreateMutable();
}
CGPathAddPath(_29.path,_29.gState.CTM,_2a);
};
CGContextAddQuadCurveToPoint=function(_2b,cpx,cpy,x,y){
CGPathAddQuadCurveToPoint(_2b.path,_2b.gState.CTM,cpx,cpy,x,y);
};
CGContextAddRect=function(_30,_31){
CGPathAddRect(_30.path,_30.gState.CTM,_31);
};
CGContextAddRects=function(_32,_33,_34){
CGPathAddRects(_32.path,_32.gState.CTM,_33,_34);
};
CGContextBeginPath=function(_35){
_35.path=CGPathCreateMutable();
};
CGContextClosePath=function(_36){
CGPathCloseSubpath(_36.path);
};
CGContextMoveToPoint=function(_37,x,y){
if(!_37.path){
_37.path=CGPathCreateMutable();
}
CGPathMoveToPoint(_37.path,_37.gState.CTM,x,y);
};
CGContextFillRect=function(_3a,_3b){
CGContextFillRects(_3a,[_3b],1);
};
CGContextFillRects=function(_3c,_3d,_3e){
if(arguments[2]===undefined){
var _3e=_3d.length;
}
CGContextBeginPath(_3c);
CGContextAddRects(_3c,_3d,_3e);
CGContextClosePath(_3c);
CGContextDrawPath(_3c,kCGPathFill);
};
CGContextStrokeRect=function(_3f,_40){
CGContextBeginPath(_3f);
CGContextAddRect(_3f,_40);
CGContextClosePath(_3f);
CGContextDrawPath(_3f,kCGPathStroke);
};
CGContextStrokeRectWithWidth=function(_41,_42,_43){
CGContextSaveGState(_41);
CGContextSetLineWidth(_41,_43);
CGContextStrokeRect(_41,_42);
CGContextRestoreGState(_41);
};
CGContextConcatCTM=function(_44,_45){
var CTM=_44.gState.CTM;
var tx=CTM.tx*_45.a+CTM.ty*_45.c+_45.tx;
CTM.ty=CTM.tx*_45.b+CTM.ty*_45.d+_45.ty;
CTM.tx=tx;
var a=CTM.a*_45.a+CTM.b*_45.c,b=CTM.a*_45.b+CTM.b*_45.d,c=CTM.c*_45.a+CTM.d*_45.c;
CTM.d=CTM.c*_45.b+CTM.d*_45.d;
CTM.a=a;
CTM.b=b;
CTM.c=c;
};
CGContextGetCTM=function(_4b){
return _4b.gState.CTM;
};
CGContextRotateCTM=function(_4c,_4d){
var _4e=_4c.gState;
_4e.CTM=CGAffineTransformRotate(_4e.CTM,_4d);
};
CGContextScaleCTM=function(_4f,sx,sy){
var _52=_4f.gState;
_52.CTM={a:_52.CTM.a*sx,b:_52.CTM.b*sx,c:_52.CTM.c*sy,d:_52.CTM.d*sy,tx:_52.CTM.tx,ty:_52.CTM.ty};
};
CGContextTranslateCTM=function(_53,tx,ty){
var _56=_53.gState;
_56.CTM={a:_56.CTM.a,b:_56.CTM.b,c:_56.CTM.c,d:_56.CTM.d,tx:_56.CTM.tx+_56.CTM.a*tx+_56.CTM.c*ty,ty:_56.CTM.ty+_56.CTM.b*tx+_56.CTM.d*ty};
};
CGContextSetShadow=function(_57,_58,_59){
var _5a=_57.gState;
_5a.shadowOffset={width:_58.width,height:_58.height};
_5a.shadowBlur=_59;
_5a.shadowColor=objj_msgSend(CPColor,"shadowColor");
};
CGContextSetShadowWithColor=function(_5b,_5c,_5d,_5e){
var _5f=_5b.gState;
_5f.shadowOffset={width:_5c.width,height:_5c.height};
_5f.shadowBlur=_5d;
_5f.shadowColor=_5e;
};
CGContextSetAlpha=function(_60,_61){
_60.gState.alpha=MAX(MIN(_61,1),0);
};
}
CGContextEOFillPath=function(_62){
CGContextDrawPath(_62,kCGPathEOFill);
};
CGContextFillPath=function(_63){
CGContextDrawPath(_63,kCGPathFill);
};
var _64=4*((SQRT2-1)/3);
CGContextAddEllipseInRect=function(_65,_66){
CGContextBeginPath(_65);
if((_66.size.width)==(_66.size.height)){
CGContextAddArc(_65,(_66.origin.x+(_66.size.width)/2),(_66.origin.y+(_66.size.height)/2),(_66.size.width)/2,0,2*PI,YES);
}else{
var _67={width:(_66.size.width)/2,height:(_66.size.height)/2},_68={x:(_66.origin.x)+_67.width,y:(_66.origin.y)+_67.height};
CGContextMoveToPoint(_65,_68.x,_68.y-_67.height);
CGContextAddCurveToPoint(_65,_68.x+(_64*_67.width),_68.y-_67.height,_68.x+_67.width,_68.y-(_64*_67.height),_68.x+_67.width,_68.y);
CGContextAddCurveToPoint(_65,_68.x+_67.width,_68.y+(_64*_67.height),_68.x+(_64*_67.width),_68.y+_67.height,_68.x,_68.y+_67.height);
CGContextAddCurveToPoint(_65,_68.x-(_64*_67.width),_68.y+_67.height,_68.x-_67.width,_68.y+(_64*_67.height),_68.x-_67.width,_68.y);
CGContextAddCurveToPoint(_65,_68.x-_67.width,_68.y-(_64*_67.height),_68.x-(_64*_67.width),_68.y-_67.height,_68.x,_68.y-_67.height);
}
CGContextClosePath(_65);
};
CGContextFillEllipseInRect=function(_69,_6a){
CGContextAddEllipseInRect(_69,_6a);
CGContextFillPath(_69);
};
CGContextStrokeEllipseInRect=function(_6b,_6c){
CGContextAddEllipseInRect(_6b,_6c);
CGContextStrokePath(_6b);
};
CGContextStrokePath=function(_6d){
CGContextDrawPath(_6d,kCGPathStroke);
};
CGContextStrokeLineSegments=function(_6e,_6f,_70){
var i=0;
if(arguments["count"]==NULL){
var _70=_6f.length;
}
CGContextBeginPath(_6e);
for(;i<_70;i+=2){
CGContextMoveToPoint(_6e,_6f[i].x,_6f[i].y);
CGContextAddLineToPoint(_6e,_6f[i+1].x,_6f[i+1].y);
}
CGContextStrokePath(_6e);
};
CGContextSetFillColor=function(_72,_73){
if(_73){
_72.gState.fillStyle=objj_msgSend(_73,"cssString");
}
};
CGContextSetStrokeColor=function(_74,_75){
if(_75){
_74.gState.strokeStyle=objj_msgSend(_75,"cssString");
}
};
CGContextFillRoundedRectangleInRect=function(_76,_77,_78,ne,se,sw,nw){
var _7d=(_77.origin.x),_7e=(_77.origin.x+_77.size.width),_7f=(_77.origin.y),_80=(_77.origin.y+_77.size.height);
CGContextBeginPath(_76);
CGContextMoveToPoint(_76,_7d+_78,_7f);
if(ne){
CGContextAddLineToPoint(_76,_7e-_78,_7f);
CGContextAddCurveToPoint(_76,_7e-_78,_7f,_7e,_7f,_7e,_7f+_78);
}else{
CGContextAddLineToPoint(_76,_7e,_7f);
}
if(se){
CGContextAddLineToPoint(_76,_7e,_80-_78);
CGContextAddCurveToPoint(_76,_7e,_80-_78,_7e,_80,_7e-_78,_80);
}else{
CGContextAddLineToPoint(_76,_7e,_80);
}
if(sw){
CGContextAddLineToPoint(_76,_7d+_78,_80);
CGContextAddCurveToPoint(_76,_7d+_78,_80,_7d,_80,_7d,_80-_78);
}else{
CGContextAddLineToPoint(_76,_7d,_80);
}
if(nw){
CGContextAddLineToPoint(_76,_7d,_7f+_78);
CGContextAddCurveToPoint(_76,_7d,_7f+_78,_7d,_7f,_7d+_78,_7f);
}else{
CGContextAddLineToPoint(_76,_7d,_7f);
}
CGContextClosePath(_76);
CGContextFillPath(_76);
};
CGContextStrokeRoundedRectangleInRect=function(_81,_82,_83,ne,se,sw,nw){
var _88=(_82.origin.x),_89=(_82.origin.x+_82.size.width),_8a=(_82.origin.y),_8b=(_82.origin.y+_82.size.height);
CGContextBeginPath(_81);
CGContextMoveToPoint(_81,_88+_83,_8a);
if(ne){
CGContextAddLineToPoint(_81,_89-_83,_8a);
CGContextAddCurveToPoint(_81,_89-_83,_8a,_89,_8a,_89,_8a+_83);
}else{
CGContextAddLineToPoint(_81,_89,_8a);
}
if(se){
CGContextAddLineToPoint(_81,_89,_8b-_83);
CGContextAddCurveToPoint(_81,_89,_8b-_83,_89,_8b,_89-_83,_8b);
}else{
CGContextAddLineToPoint(_81,_89,_8b);
}
if(sw){
CGContextAddLineToPoint(_81,_88+_83,_8b);
CGContextAddCurveToPoint(_81,_88+_83,_8b,_88,_8b,_88,_8b-_83);
}else{
CGContextAddLineToPoint(_81,_88,_8b);
}
if(nw){
CGContextAddLineToPoint(_81,_88,_8a+_83);
CGContextAddCurveToPoint(_81,_88,_8a+_83,_88,_8a,_88+_83,_8a);
}else{
CGContextAddLineToPoint(_81,_88,_8a);
}
CGContextClosePath(_81);
CGContextStrokePath(_81);
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
var _8c=["butt","round","square"],_8d=["miter","round","bevel"],_8e=["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState=function(_8f){
_8f.save();
};
CGContextRestoreGState=function(_90){
_90.restore();
};
CGContextSetLineCap=function(_91,_92){
_91.lineCap=_8c[_92];
};
CGContextSetLineJoin=function(_93,_94){
_93.lineJoin=_8d[_94];
};
CGContextSetLineWidth=function(_95,_96){
_95.lineWidth=_96;
};
CGContextSetMiterLimit=function(_97,_98){
_97.miterLimit=_98;
};
CGContextSetBlendMode=function(_99,_9a){
_99.globalCompositeOperation=_8e[_9a];
};
CGContextAddArc=function(_9b,x,y,_9e,_9f,_a0,_a1){
_9b.arc(x,y,_9e,_9f,_a0,!_a1);
};
CGContextAddArcToPoint=function(_a2,x1,y1,x2,y2,_a7){
_a2.arcTo(x1,y1,x2,y2,_a7);
};
CGContextAddCurveToPoint=function(_a8,_a9,_aa,_ab,_ac,x,y){
_a8.bezierCurveTo(_a9,_aa,_ab,_ac,x,y);
};
CGContextAddLineToPoint=function(_af,x,y){
_af.lineTo(x,y);
};
CGContextAddPath=function(_b2,_b3){
if(!_b2||CGPathIsEmpty(_b3)){
return;
}
var _b4=_b3.elements,i=0,_b6=_b3.count;
for(;i<_b6;++i){
var _b7=_b4[i],_b8=_b7.type;
switch(_b8){
case kCGPathElementMoveToPoint:
_b2.moveTo(_b7.x,_b7.y);
break;
case kCGPathElementAddLineToPoint:
_b2.lineTo(_b7.x,_b7.y);
break;
case kCGPathElementAddQuadCurveToPoint:
_b2.quadraticCurveTo(_b7.cpx,_b7.cpy,_b7.x,_b7.y);
break;
case kCGPathElementAddCurveToPoint:
_b2.bezierCurveTo(_b7.cp1x,_b7.cp1y,_b7.cp2x,_b7.cp2y,_b7.x,_b7.y);
break;
case kCGPathElementCloseSubpath:
_b2.closePath();
break;
case kCGPathElementAddArc:
_b2.arc(_b7.x,_b7.y,_b7.radius,_b7.startAngle,_b7.endAngle,_b7.clockwise);
break;
case kCGPathElementAddArcTo:
break;
}
}
};
CGContextAddRect=function(_b9,_ba){
_b9.rect((_ba.origin.x),(_ba.origin.y),(_ba.size.width),(_ba.size.height));
};
CGContextAddRects=function(_bb,_bc,_bd){
var i=0;
if(arguments["count"]==NULL){
var _bd=_bc.length;
}
for(;i<_bd;++i){
var _bf=_bc[i];
_bb.rect((_bf.origin.x),(_bf.origin.y),(_bf.size.width),(_bf.size.height));
}
};
CGContextBeginPath=function(_c0){
_c0.beginPath();
};
CGContextClosePath=function(_c1){
_c1.closePath();
};
CGContextMoveToPoint=function(_c2,x,y){
_c2.moveTo(x,y);
};
CGContextClearRect=function(_c5,_c6){
_c5.clearRect((_c6.origin.x),(_c6.origin.y),(_c6.size.width),(_c6.size.height));
};
CGContextDrawPath=function(_c7,_c8){
if(_c8==kCGPathFill||_c8==kCGPathFillStroke){
_c7.fill();
}else{
if(_c8==kCGPathEOFill||_c8==kCGPathEOFillStroke){
alert("not implemented!!!");
}
}
if(_c8==kCGPathStroke||_c8==kCGPathFillStroke||_c8==kCGPathEOFillStroke){
_c7.stroke();
}
};
CGContextFillRect=function(_c9,_ca){
_c9.fillRect((_ca.origin.x),(_ca.origin.y),(_ca.size.width),(_ca.size.height));
};
CGContextFillRects=function(_cb,_cc,_cd){
var i=0;
if(arguments["count"]==NULL){
var _cd=_cc.length;
}
for(;i<_cd;++i){
var _cf=_cc[i];
_cb.fillRect((_cf.origin.x),(_cf.origin.y),(_cf.size.width),(_cf.size.height));
}
};
CGContextStrokeRect=function(_d0,_d1){
_d0.strokeRect((_d1.origin.x),(_d1.origin.y),(_d1.size.width),(_d1.size.height));
};
CGContextClip=function(_d2){
_d2.clip();
};
CGContextClipToRect=function(_d3,_d4){
_d3.beginPath();
_d3.rect((_d4.origin.x),(_d4.origin.y),(_d4.size.width),(_d4.size.height));
_d3.closePath();
_d3.clip();
};
CGContextClipToRects=function(_d5,_d6,_d7){
if(arguments["count"]==NULL){
var _d7=_d6.length;
}
_d5.beginPath();
CGContextAddRects(_d5,_d6,_d7);
_d5.clip();
};
CGContextSetAlpha=function(_d8,_d9){
_d8.globalAlpha=_d9;
};
CGContextSetFillColor=function(_da,_db){
_da.fillStyle=objj_msgSend(_db,"cssString");
};
CGContextSetStrokeColor=function(_dc,_dd){
_dc.strokeStyle=objj_msgSend(_dd,"cssString");
};
CGContextSetShadow=function(_de,_df,_e0){
_de.shadowOffsetX=_df.width;
_de.shadowOffsetY=_df.height;
_de.shadowBlur=_e0;
};
CGContextSetShadowWithColor=function(_e1,_e2,_e3,_e4){
_e1.shadowOffsetX=_e2.width;
_e1.shadowOffsetY=_e2.height;
_e1.shadowBlur=_e3;
_e1.shadowColor=objj_msgSend(_e4,"cssString");
};
CGContextRotateCTM=function(_e5,_e6){
_e5.rotate(_e6);
};
CGContextScaleCTM=function(_e7,sx,sy){
_e7.scale(sx,sy);
};
CGContextTranslateCTM=function(_ea,tx,ty){
_ea.translate(tx,ty);
};
eigen=function(_ed){
alert("IMPLEMENT ME!");
};
if(CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature)){
CGContextConcatCTM=function(_ee,_ef){
_ee.transform(_ef.a,_ef.b,_ef.c,_ef.d,_ef.tx,_ef.ty);
};
}else{
CGContextConcatCTM=function(_f0,_f1){
var a=_f1.a,b=_f1.b,c=_f1.c,d=_f1.d,tx=_f1.tx,ty=_f1.ty,sx=1,sy=1,a1=0,a2=0;
if(b==0&&c==0){
sx=a;
sy=d;
}else{
if(a*b==-c*d){
var _fc=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_fc*c,_fc*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
}else{
if(a*c==-b*d){
var _fc=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_fc*b,_fc*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
}else{
var _ff=CGAffineTransformMake(a,c,b,d,0,0),u=eigen(CGAffineTransformConcat(_f1,_ff)),v=eigen(CGAffineTransformConcat(_ff,_f1)),U=CGAffineTransformMake(u.vector_1.x,u.vector_2.x,u.vector_1.y,u.vector_2.y,0,0),VT=CGAffineTransformMake(v.vector_1.x,v.vector_1.y,v.vector_2.x,v.vector_2.y,0,0),S=CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U),_f1),CGAffineTransformInvert(VT));
a=VT.a;
b=VT.b;
c=VT.c;
d=VT.d;
var _fc=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_fc*c,_fc*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
S.a*=sx;
S.d*=sy;
a=U.a;
b=U.b;
c=U.c;
d=U.d;
var _fc=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_fc*b,_fc*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
sx=S.a*sx;
sy=S.d*sy;
}
}
}
if(tx!=0||ty!=0){
CGContextTranslateCTM(_f0,tx,ty);
}
if(a1!=0){
CGContextRotateCTM(_f0,a1);
}
if(sx!=1||sy!=1){
CGContextScaleCTM(_f0,sx,sy);
}
if(a2!=0){
CGContextRotateCTM(_f0,a2);
}
};
}
CGContextDrawImage=function(_105,_106,_107){
_105.drawImage(_107._image,(_106.origin.x),(_106.origin.y),(_106.size.width),(_106.size.height));
};
to_string=function(_108){
return "rgba("+ROUND(_108.components[0]*255)+", "+ROUND(_108.components[1]*255)+", "+ROUND(255*_108.components[2])+", "+_108.components[3]+")";
};
CGContextDrawLinearGradient=function(_109,_10a,_10b,_10c,_10d){
var _10e=_10a.colors,_10f=_10e.length,_110=_109.createLinearGradient(_10b.x,_10b.y,_10c.x,_10c.y);
while(_10f--){
_110.addColorStop(_10a.locations[_10f],to_string(_10e[_10f]));
}
_109.fillStyle=_110;
_109.fill();
};
CGBitmapGraphicsContextCreate=function(){
var _111=document.createElement("canvas"),_112=_111.getContext("2d");
_112.DOMElement=_111;
return _112;
};
}else{
if(CPFeatureIsCompatible(CPVMLFeature)){
var _113=["f","t"],_114=["flat","round","square"],_115=["miter","round","bevel"],_116=[" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _117=CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate=function(){
document.namespaces.add("cg_vml_","urn:schemas-microsoft-com:vml");
document.createStyleSheet().cssText="cg_vml_\\:*{behavior:url(#default#VML)}";
CGBitmapGraphicsContextCreate=_117;
return _117();
};
CGContextClearRect=function(_118,_119){
if(_118.buffer!=nil){
_118.buffer="";
}else{
_118.DOMElement.innerHTML="";
}
_118.path=NULL;
};
var W=10,H=10,Z=10,Z_2=Z/2;
CGContextDrawImage=function(_11e,_11f,_120){
var _121="";
if(_120.buffer!=nil){
_121=_120.buffer;
}else{
var ctm=_11e.gState.CTM,_123=CGPointApplyAffineTransform(_11f.origin,ctm),_124=ctm.a==ctm.d&&ctm.b==-ctm.c,vml=["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
var _126=CGRectApplyAffineTransform(_11f,ctm);
vml.push(";padding:0 ",ROUND((_126.origin.x+_126.size.width)),"px ",ROUND((_126.origin.y+_126.size.height)),"px 0;filter:progid:DXImageTransform.Microsoft.Matrix(","M11='",ctm.a,"',M12='",ctm.c,"',M21='",ctm.b,"',M22='",ctm.d,"',","Dx='",ROUND(_123.x),"', Dy='",ROUND(_123.y),"', sizingmethod='clip');");
vml.push("\"><cg_vml_:image src=\"",_120._image.src,"\" style=\"width:",(_11f.size.width),"px;height:",(_11f.size.height),"px;\"/></g_vml_:group>");
_121=vml.join("");
}
if(_11e.buffer!=nil){
_11e.buffer+=_121;
}else{
_11e.DOMElement.insertAdjacentHTML("BeforeEnd",_121);
}
};
CGContextDrawPath=function(_127,_128){
if(!_127||CGPathIsEmpty(_127.path)){
return;
}
var _129=_127.path.elements,i=0,_12b=_127.path.count,_12c=_127.gState,fill=(_128==kCGPathFill||_128==kCGPathFillStroke)?1:0,_12e=(_128==kCGPathStroke||_128==kCGPathFillStroke)?1:0,_12f=_12c.alpha,vml=["<cg_vml_:shape"," fillcolor=\"",_12c.fillStyle,"\" filled=\"",_113[fill],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",_113[_12e],"\" strokeweight=\"",_12c.lineWidth,"\" strokecolor=\"",_12c.strokeStyle,"\" path=\""];
for(;i<_12b;++i){
var _131=_129[i],type=_131.type;
switch(type){
case kCGPathElementMoveToPoint:
case kCGPathElementAddLineToPoint:
vml.push(_116[type],(ROUND(Z*(_131.x)-Z_2)),",",(ROUND(Z*(_131.y)-Z_2)));
break;
case kCGPathElementAddQuadCurveToPoint:
vml.push(_116[type],(ROUND(Z*(_131.cpx)-Z_2)),",",(ROUND(Z*(_131.cpy)-Z_2)),",",(ROUND(Z*(_131.x)-Z_2)),",",(ROUND(Z*(_131.y)-Z_2)));
break;
case kCGPathElementAddCurveToPoint:
vml.push(_116[type],(ROUND(Z*(_131.cp1x)-Z_2)),",",(ROUND(Z*(_131.cp1y)-Z_2)),",",(ROUND(Z*(_131.cp2x)-Z_2)),",",(ROUND(Z*(_131.cp2y)-Z_2)),",",(ROUND(Z*(_131.x)-Z_2)),",",(ROUND(Z*(_131.y)-Z_2)));
break;
case kCGPathElementCloseSubpath:
vml.push(_116[type]);
break;
case kCGPathElementAddArc:
var x=_131.x,y=_131.y,_135=_131.radius,_136=_131.clockwise?1:0,_137=_131.endAngle,_138=_131.startAngle,_139={x:x+_135*COS(_138),y:y+_135*SIN(_138)};
if(_138==_137&&!_136){
vml.push(_116[kCGPathElementMoveToPoint],(ROUND(Z*(_139.x)-Z_2)),",",(ROUND(Z*(_139.y)-Z_2)));
continue;
}
var end={x:x+_135*COS(_137),y:y+_135*SIN(_137)};
if(_136&&_138!=_137&&(_139.x==end.x&&_139.y==end.y)){
if(_139.x>=x){
if(_139.y<y){
_139.x+=0.125;
}else{
_139.y+=0.125;
}
}else{
if(end.y<=y){
end.x+=0.125;
}else{
end.y+=0.125;
}
}
}
vml.push(_116[type][_136],(ROUND(Z*(x-_135)-Z_2)),",",(ROUND(Z*(y-_135)-Z_2))," ",(ROUND(Z*(x+_135)-Z_2)),",",(ROUND(Z*(y+_135)-Z_2))," ",(ROUND(Z*(_139.x)-Z_2)),",",(ROUND(Z*(_139.y)-Z_2))," ",(ROUND(Z*(end.x)-Z_2)),",",(ROUND(Z*(end.y)-Z_2)));
break;
case kCGPathElementAddArcTo:
break;
}
}
vml.push("\">");
if(fill){
vml.push("<cg_vml_:fill color=\"",_12c.fillStyle,"\" opacity=\"",_12f,"\" />");
}
if(_12e){
vml.push("<cg_vml_:stroke opacity=\"",_12f,"\" joinstyle=\"",_115[_12c.lineJoin],"\" miterlimit=\"",_12c.miterLimit,"\" endcap=\"",_114[_12c.lineCap],"\" weight=\"",_12c.lineWidth,"","px\" color=\"",_12c.strokeStyle,"\" />");
}
var _13b=_12c.shadowColor;
if(_13b){
var _13c=_12c.shadowOffset;
vml.push("<cg_vml_:shadow on=\"t\" offset=\"",_13c.width,"pt ",_13c.height,"pt\" opacity=\"",objj_msgSend(_13b,"alphaComponent"),"\" color=black />");
}
vml.push("</cg_vml_:shape>");
_127.path=NULL;
if(_127.buffer!=nil){
_127.buffer+=vml.join("");
}else{
_127.DOMElement.insertAdjacentHTML("BeforeEnd",vml.join(""));
}
};
}
}
