I;21;Foundation/CPObject.jc;3397;
CPJSONPConnectionCallbacks = {};
{var the_class = objj_allocateClassPair(CPObject, "CPJSONPConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_callbackParameter"), new objj_ivar("_scriptTag")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:callback:delegate:"), function(self, _cmd, aRequest, aString, aDelegate)
{ with(self)
{
    return objj_msgSend(self, "initWithRequest:callback:delegate:startImmediately:", aRequest, aString, aDelegate,  NO);
}
}), new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:"), function(self, _cmd, aRequest, aString, aDelegate, shouldStartImmediately)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _request = aRequest;
    _delegate = aDelegate;
    _callbackParameter = aString;
    CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "hash")] = function(data)
    {
        objj_msgSend(_delegate, "connection:didReceiveData:", self, data);
        objj_msgSend(self, "removeScriptTag");
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    };
    if(shouldStartImmediately)
        objj_msgSend(self, "start");
    return self;
}
}), new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    try
    {
        var head = document.getElementsByTagName("head").item(0);
        var source = objj_msgSend(_request, "URL");
        source += (source.indexOf('?') < 0) ? "?" : "&";
        source += _callbackParameter+"=CPJSONPConnectionCallbacks.callback"+objj_msgSend(self, "hash");
        _scriptTag = document.createElement("script");
        _scriptTag.setAttribute("type", "text/javascript");
        _scriptTag.setAttribute("charset", "utf-8");
        _scriptTag.setAttribute("src", source);
        head.appendChild(_scriptTag);
    }
    catch (exception)
    {
        objj_msgSend(_delegate, "connection:didFailWithError:",  self,  exception);
        objj_msgSend(self, "removeScriptTag");
    }
}
}), new objj_method(sel_getUid("removeScriptTag"), function(self, _cmd)
{ with(self)
{
    var head = document.getElementsByTagName("head").item(0);
    if(_scriptTag.parentNode == head)
        head.removeChild(_scriptTag);
    CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "hash")] = nil;
    delete CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "hash")];
}
}), new objj_method(sel_getUid("cancel"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "removeScriptTag");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendRequest:callback:delegate:"), function(self, _cmd, aRequest, callbackParameter, aDelegate)
{ with(self)
{
    return objj_msgSend(self, "connectionWithRequest:callback:delegate:", aRequest, callbackParameter, aDelegate);
}
}), new objj_method(sel_getUid("connectionWithRequest:callback:delegate:"), function(self, _cmd, aRequest, callbackParameter, aDelegate)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithRequest:callback:delegate:startImmediately:", aRequest, callbackParameter, aDelegate, YES);;
}
})]);
}

