i;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jc;5960;
var XMLHTTPRequestUninitialized = 0,
    XMLHTTPRequestLoading = 1,
    XMLHTTPRequestLoaded = 2,
    XMLHTTPRequestInteractive = 3,
    XMLHTTPRequestComplete = 4;
var CPURLConnectionDelegate = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPURLConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_isCanceled"), new objj_ivar("_isLocalFileConnection"), new objj_ivar("_XMLHTTPRequest")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"), function(self, _cmd, aRequest, aDelegate, shouldStartImmediately)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _request = aRequest;
        _delegate = aDelegate;
        _isCanceled = NO;
        var path = objj_msgSend(_request, "URL");
        _isLocalFileConnection = path.indexOf("file:") === 0 ||
                                    ((path.indexOf("http:") !== 0 || path.indexOf("https:") !== 0) &&
                                    window.location && window.location.protocol === "file:");
        _XMLHTTPRequest = objj_request_xmlhttp();
        if (shouldStartImmediately)
            objj_msgSend(self, "start");
    }
    return self;
}
}), new objj_method(sel_getUid("initWithRequest:delegate:"), function(self, _cmd, aRequest, aDelegate)
{ with(self)
{
    return objj_msgSend(self, "initWithRequest:delegate:startImmediately:", aRequest, aDelegate, YES);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    _isCanceled = NO;
    try
    {
        _XMLHTTPRequest.open(objj_msgSend(_request, "HTTPMethod"), objj_msgSend(_request, "URL"), YES);
        _XMLHTTPRequest.onreadystatechange = function() { objj_msgSend(self, "_readyStateDidChange"); }
        var fields = objj_msgSend(_request, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while (key = objj_msgSend(keys, "nextObject"))
            _XMLHTTPRequest.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        _XMLHTTPRequest.send(objj_msgSend(_request, "HTTPBody"));
    }
    catch (anException)
    {
        objj_msgSend(_delegate, "connection:didFailWithError:", self, anException);
    }
}
}), new objj_method(sel_getUid("cancel"), function(self, _cmd)
{ with(self)
{
    _isCanceled = YES;
    try
    {
        _XMLHTTPRequest.abort();
    }
    catch (anException)
    {
    }
}
}), new objj_method(sel_getUid("isLocalFileConnection"), function(self, _cmd)
{ with(self)
{
    return _isLocalFileConnection;
}
}), new objj_method(sel_getUid("_readyStateDidChange"), function(self, _cmd)
{ with(self)
{
    if (_XMLHTTPRequest.readyState == XMLHTTPRequestComplete)
    {
        var statusCode = _XMLHTTPRequest.status,
            URL = objj_msgSend(_request, "URL");
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connection:didReceiveResponse:")))
            if (_isLocalFileConnection)
                objj_msgSend(_delegate, "connection:didReceiveResponse:", self, objj_msgSend(objj_msgSend(CPURLResponse, "alloc"), "initWithURL:", URL));
            else
            {
                var response = objj_msgSend(objj_msgSend(CPHTTPURLResponse, "alloc"), "initWithURL:", URL);
                objj_msgSend(response, "_setStatusCode:", statusCode);
                objj_msgSend(_delegate, "connection:didReceiveResponse:", self, response);
            }
        if (!_isCanceled)
        {
            if (statusCode == 200 || (statusCode === 0 && _isLocalFileConnection))
            {
                objj_msgSend(_delegate, "connection:didReceiveData:", self, _XMLHTTPRequest.responseText);
                objj_msgSend(_delegate, "connectionDidFinishLoading:", self);
            }
            else if (statusCode == 401 && objj_msgSend(CPURLConnectionDelegate, "respondsToSelector:", sel_getUid("connectionDidReceiveAuthenticationChallenge:")))
                objj_msgSend(CPURLConnectionDelegate, "connectionDidReceiveAuthenticationChallenge:", self);
            else
                objj_msgSend(_delegate, "connection:didFailWithError:", self, _XMLHTTPRequest.status)
        }
    }
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
}), new objj_method(sel_getUid("_XMLHTTPRequest"), function(self, _cmd)
{ with(self)
{
    return _XMLHTTPRequest;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setClassDelegate:"), function(self, _cmd, delegate)
{ with(self)
{
    CPURLConnectionDelegate = delegate;
}
}), new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"), function(self, _cmd, aRequest, aURLResponse, anError)
{ with(self)
{
    try
    {
        var request = objj_request_xmlhttp();
        request.open(objj_msgSend(aRequest, "HTTPMethod"), objj_msgSend(aRequest, "URL"), NO);
        var fields = objj_msgSend(aRequest, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while (key = objj_msgSend(keys, "nextObject"))
            request.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        request.send(objj_msgSend(aRequest, "HTTPBody"));
        return objj_msgSend(CPData, "dataWithString:", request.responseText);
    }
    catch (anException)
    {
    }
    return nil;
}
}), new objj_method(sel_getUid("connectionWithRequest:delegate:"), function(self, _cmd, aRequest, aDelegate)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithRequest:delegate:", aRequest, aDelegate);
}
})]);
}

