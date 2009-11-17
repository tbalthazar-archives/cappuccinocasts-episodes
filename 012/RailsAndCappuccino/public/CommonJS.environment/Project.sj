@STATIC;1.0;p;15;AppController.jI;21;Foundation/CPObject.ji;17;PostsController.ji;6;Post.ji;14;PostItemView.jc;2203;
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("theWindow"),new objj_ivar("postListCollectionView"),new objj_ivar("detailsView"),new objj_ivar("postsController")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("theWindow"),function(_3,_4){
with(_3){
return theWindow;
}
}),new objj_method(sel_getUid("setTheWindow:"),function(_5,_6,_7){
with(_5){
theWindow=_7;
}
}),new objj_method(sel_getUid("postListCollectionView"),function(_8,_9){
with(_8){
return postListCollectionView;
}
}),new objj_method(sel_getUid("setPostListCollectionView:"),function(_a,_b,_c){
with(_a){
postListCollectionView=_c;
}
}),new objj_method(sel_getUid("detailsView"),function(_d,_e){
with(_d){
return detailsView;
}
}),new objj_method(sel_getUid("setDetailsView:"),function(_f,_10,_11){
with(_f){
detailsView=_11;
}
}),new objj_method(sel_getUid("postsController"),function(_12,_13){
with(_12){
return postsController;
}
}),new objj_method(sel_getUid("setPostsController:"),function(_14,_15,_16){
with(_14){
postsController=_16;
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_17,_18,_19){
with(_17){
objj_msgSend(postsController,"loadPosts");
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_1a,_1b){
with(_1a){
objj_msgSend(postListCollectionView,"setSelectable:",YES);
objj_msgSend(postListCollectionView,"setMinItemSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(postListCollectionView,"bounds")),20));
objj_msgSend(postListCollectionView,"setMaxItemSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(postListCollectionView,"bounds")),20));
itemPrototype=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(itemPrototype,"setView:",objj_msgSend(objj_msgSend(PostItemView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(postListCollectionView,"bounds")),20)));
objj_msgSend(postListCollectionView,"setItemPrototype:",itemPrototype);
objj_msgSend(postsController,"setPostListCollectionView:",postListCollectionView);
objj_msgSend(postsController,"setDetailsView:",detailsView);
}
})]);
p;6;main.jI;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jc;52;
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;6;Post.jI;21;Foundation/CPObject.jc;2922;
var _1=objj_allocateClassPair(CPObject,"Post"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("title"),new objj_ivar("body"),new objj_ivar("id")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
title=_7;
}
}),new objj_method(sel_getUid("body"),function(_8,_9){
with(_8){
return body;
}
}),new objj_method(sel_getUid("setBody:"),function(_a,_b,_c){
with(_a){
body=_c;
}
}),new objj_method(sel_getUid("id"),function(_d,_e){
with(_d){
return id;
}
}),new objj_method(sel_getUid("setId:"),function(_f,_10,_11){
with(_f){
id=_11;
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPObject")},"init");
if(_12){
id=0;
title="";
body="";
}
return _12;
}
}),new objj_method(sel_getUid("initFromJSONObject:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSend(_14,"init");
if(_14){
id=_16.id;
title=_16.title;
body=_16.body;
}
return _14;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initFromJSONObjects:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
for(var i=0;i<_19.length;i++){
var _1b=objj_msgSend(objj_msgSend(Post,"alloc"),"initFromJSONObject:",_19[i].post);
objj_msgSend(_1a,"addObject:",_1b);
}
return _1a;
}
}),new objj_method(sel_getUid("getExamplePosts"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
var _1f=objj_msgSend(objj_msgSend(Post,"alloc"),"init");
objj_msgSend(_1f,"setTitle:","This is the first post");
objj_msgSend(_1f,"setBody:","This is the body of the first post");
objj_msgSend(_1e,"addObject:",_1f);
_1f=objj_msgSend(objj_msgSend(Post,"alloc"),"init");
objj_msgSend(_1f,"setTitle:","This is the second post");
objj_msgSend(_1f,"setBody:","This is the body of the second post");
objj_msgSend(_1e,"addObject:",_1f);
_1f=objj_msgSend(objj_msgSend(Post,"alloc"),"init");
objj_msgSend(_1f,"setTitle:","This is the third post");
objj_msgSend(_1f,"setBody:","This is the body of the third post");
objj_msgSend(_1e,"addObject:",_1f);
_1f=objj_msgSend(objj_msgSend(Post,"alloc"),"init");
objj_msgSend(_1f,"setTitle:","This is the fourth post");
objj_msgSend(_1f,"setBody:","This is the body of the fourth post");
objj_msgSend(_1e,"addObject:",_1f);
_1f=objj_msgSend(objj_msgSend(Post,"alloc"),"init");
objj_msgSend(_1f,"setTitle:","This is the fifth post");
objj_msgSend(_1f,"setBody:","This is the body of the fifth post");
objj_msgSend(_1e,"addObject:",_1f);
_1f=objj_msgSend(objj_msgSend(Post,"alloc"),"init");
objj_msgSend(_1f,"setTitle:","This is the sixth post");
objj_msgSend(_1f,"setBody:","This is the body of the sixth post");
objj_msgSend(_1e,"addObject:",_1f);
return _1e;
}
})]);
p;14;PostItemView.jI;15;AppKit/CPView.jc;905;
var _1=objj_allocateClassPair(CPView,"PostItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("title")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_3,_4,_5){
with(_3){
if(!title){
title=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,150,20));
objj_msgSend(title,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_3,"addSubview:",title);
}
objj_msgSend(title,"setStringValue:",objj_msgSend(_5,"title"));
}
}),new objj_method(sel_getUid("setSelected:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_6,"setBackgroundColor:",_8?objj_msgSend(CPColor,"colorWithHexString:","3d80df"):nil);
objj_msgSend(title,"setTextColor:",_8?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(CPColor,"blackColor"));
}
})]);
p;17;PostsController.jI;21;Foundation/CPObject.jc;4843;
var _1=objj_allocateClassPair(CPObject,"PostsController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("postListCollectionView"),new objj_ivar("detailsView"),new objj_ivar("baseURL"),new objj_ivar("currentObject"),new objj_ivar("listConnection"),new objj_ivar("addConnection"),new objj_ivar("updateConnection"),new objj_ivar("deleteConnection")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("postListCollectionView"),function(_3,_4){
with(_3){
return postListCollectionView;
}
}),new objj_method(sel_getUid("setPostListCollectionView:"),function(_5,_6,_7){
with(_5){
postListCollectionView=_7;
}
}),new objj_method(sel_getUid("detailsView"),function(_8,_9){
with(_8){
return detailsView;
}
}),new objj_method(sel_getUid("setDetailsView:"),function(_a,_b,_c){
with(_a){
detailsView=_c;
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPObject")},"init");
if(_d){
baseURL="http://0.0.0.0:3000";
}
return _d;
}
}),new objj_method(sel_getUid("collectionViewDidChangeSelection:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(objj_msgSend(_11,"selectionIndexes"),"firstIndex");
currentObject=objj_msgSend(objj_msgSend(_11,"content"),"objectAtIndex:",_12);
objj_msgSend(detailsView,"setStringValue:",objj_msgSend(currentObject,"body"));
}
}),new objj_method(sel_getUid("loadExamplePosts"),function(_13,_14){
with(_13){
var _15=objj_msgSend(Post,"getExamplePosts");
objj_msgSend(postListCollectionView,"setContent:",_15);
}
}),new objj_method(sel_getUid("addItem:"),function(_16,_17,_18){
with(_16){
var _19=prompt("Enter the title");
var _1a=prompt("Enter the body");
if(_19!==""&&_1a!==""){
var _1b="{\"post\":{\"title\":\""+_19+"\",\"body\":\""+_1a+"\"}}";
var _1c=objj_msgSend(CPURLRequest,"requestWithURL:",baseURL+"/posts.json");
objj_msgSend(_1c,"setHTTPMethod:","POST");
objj_msgSend(_1c,"setHTTPBody:",_1b);
objj_msgSend(_1c,"setValue:forHTTPHeaderField:","application/json","Accept");
objj_msgSend(_1c,"setValue:forHTTPHeaderField:","application/json","Content-Type");
addConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_1c,_16);
}else{
alert("Please provide a value for both title and body");
}
}
}),new objj_method(sel_getUid("editSelectedItem:"),function(_1d,_1e,_1f){
with(_1d){
var _20=prompt("Modify the title",objj_msgSend(currentObject,"title"));
var _21=prompt("Modify the body",objj_msgSend(currentObject,"body"));
if(_20!==""&&_21!==""){
var _22="{\"post\":{\"title\":\""+_20+"\",\"body\":\""+_21+"\"}}";
var _23=objj_msgSend(CPURLRequest,"requestWithURL:",baseURL+"/posts/"+objj_msgSend(currentObject,"id")+".json");
objj_msgSend(_23,"setHTTPMethod:","PUT");
objj_msgSend(_23,"setHTTPBody:",_22);
objj_msgSend(_23,"setValue:forHTTPHeaderField:","application/json","Accept");
objj_msgSend(_23,"setValue:forHTTPHeaderField:","application/json","Content-Type");
updateConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_23,_1d);
}else{
alert("Please provide a value for both title and body");
}
}
}),new objj_method(sel_getUid("removeSelectedItem:"),function(_24,_25,_26){
with(_24){
if(confirm("Are you sure?")){
var _27=objj_msgSend(CPURLRequest,"requestWithURL:",baseURL+"/posts/"+currentObject.id+".json");
objj_msgSend(_27,"setHTTPMethod:","DELETE");
objj_msgSend(_27,"setValue:forHTTPHeaderField:","application/json","Accept");
objj_msgSend(_27,"setValue:forHTTPHeaderField:","application/json","Content-Type");
deleteConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_27,_24);
}
}
}),new objj_method(sel_getUid("loadPosts"),function(_28,_29){
with(_28){
var _2a=objj_msgSend(CPURLRequest,"requestWithURL:",baseURL+"/posts.json");
objj_msgSend(_2a,"setHTTPMethod:","GET");
listConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_2a,_28);
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_2b,_2c,_2d,_2e){
with(_2b){
if(_2d===listConnection){
var _2f=JSON.parse(_2e);
var _30=objj_msgSend(Post,"initFromJSONObjects:",_2f);
objj_msgSend(postListCollectionView,"setContent:",_30);
objj_msgSend(postListCollectionView,"setSelectionIndexes:",objj_msgSend(objj_msgSend(CPIndexSet,"alloc"),"initWithIndex:",0));
}else{
if(_2d===addConnection){
objj_msgSend(_2b,"loadPosts");
}else{
if(_2d===updateConnection){
objj_msgSend(_2b,"loadPosts");
}else{
if(_2d===deleteConnection){
objj_msgSend(_2b,"loadPosts");
}
}
}
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_31,_32,_33,_34){
with(_31){
alert("Connection did fail with error : "+_34);
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_35,_36,_37){
with(_35){
console.log("Connection did finish loading.");
}
})]);
e;