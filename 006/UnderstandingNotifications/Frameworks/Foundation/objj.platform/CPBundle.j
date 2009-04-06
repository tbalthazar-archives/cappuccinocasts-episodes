i;10;CPObject.ji;14;CPDictionary.ji;14;CPURLRequest.jc;4714;
{var the_class = objj_allocateClassPair(CPObject, "CPBundle"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPath:"), function(self, _cmd, aPath)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        path = aPath;
        objj_setBundleForPath(path, self);
    }
    return self;
}
}), new objj_method(sel_getUid("classNamed:"), function(self, _cmd, aString)
{ with(self)
{
}
}), new objj_method(sel_getUid("bundlePath"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(path, "stringByDeletingLastPathComponent");
}
}), new objj_method(sel_getUid("resourcePath"), function(self, _cmd)
{ with(self)
{
    var resourcePath = objj_msgSend(self, "bundlePath");
    if (resourcePath.length)
        resourcePath += '/';
    return resourcePath + "Resources";
}
}), new objj_method(sel_getUid("principalClass"), function(self, _cmd)
{ with(self)
{
    var className = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPPrincipalClass");
    return className ? CPClassFromString(className) : Nil;
}
}), new objj_method(sel_getUid("pathForResource:"), function(self, _cmd, aFilename)
{ with(self)
{
    return objj_msgSend(self, "resourcePath") + '/' + aFilename;
}
}), new objj_method(sel_getUid("infoDictionary"), function(self, _cmd)
{ with(self)
{
    return info;
}
}), new objj_method(sel_getUid("objectForInfoDictionaryKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return objj_msgSend(info, "objectForKey:", aKey);
}
}), new objj_method(sel_getUid("loadWithDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    self._delegate = aDelegate;
    self._infoConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(self, "bundlePath") + "/Info.plist"), self);
}
}), new objj_method(sel_getUid("connection:didReceiveData:"), function(self, _cmd, aConnection, data)
{ with(self)
{
    if (aConnection === self._infoConnection)
    {
        info = CPPropertyListCreateFromData(objj_msgSend(CPData, "dataWithString:", data));
        var platform = '/',
            platforms = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPBundlePlatforms");
        if (platforms)
        {
            platform = objj_msgSend(platforms, "firstObjectCommonWithArray:", OBJJ_PLATFORMS);
            platform = platform ? '/' + platform + ".platform/" : '/';
        }
        objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(self, "bundlePath") + platform + objj_msgSend(self, "objectForInfoDictionaryKey:", "CPBundleExecutable")), self);
    }
    else
    {
        objj_decompile(objj_msgSend(data, "string"), self);
        var context = new objj_context();
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("bundleDidFinishLoading:")))
            context.didCompleteCallback = function() { objj_msgSend(_delegate, "bundleDidFinishLoading:", self); };
        var files = objj_msgSend(self, "objectForInfoDictionaryKey:", "CPBundleReplacedFiles"),
            count = files.length,
            bundlePath = objj_msgSend(self, "bundlePath");
        while (count--)
        {
            var fileName = files[count];
            if (fileName.indexOf(".j") === fileName.length - 2)
                context.pushFragment(fragment_create_file(bundlePath + '/' + fileName, new objj_bundle(""), YES, NULL));
        }
        if (context.fragments.length)
            context.evaluate();
        else
            objj_msgSend(_delegate, "bundleDidFinishLoading:", self);
    }
}
}), new objj_method(sel_getUid("connection:didFailWithError:"), function(self, _cmd, aConnection, anError)
{ with(self)
{
    alert("Couldnot find bundle:" + anError)
}
}), new objj_method(sel_getUid("connectionDidFinishLoading:"), function(self, _cmd, aConnection)
{ with(self)
{
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new objj_bundle;
}
}), new objj_method(sel_getUid("bundleWithPath:"), function(self, _cmd, aPath)
{ with(self)
{
    return objj_getBundleWithPath(aPath);
}
}), new objj_method(sel_getUid("bundleForClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_bundleForClass(aClass);
}
}), new objj_method(sel_getUid("mainBundle"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPBundle, "bundleWithPath:", "Info.plist");
}
})]);
}
objj_bundle.prototype.isa = CPBundle;

