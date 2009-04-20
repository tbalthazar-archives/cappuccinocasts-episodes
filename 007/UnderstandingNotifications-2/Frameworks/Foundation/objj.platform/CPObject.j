c;7558;{var the_class = objj_allocateClassPair(Nil, "CPObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("isa")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("mutableCopy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "copy");
}
}), new objj_method(sel_getUid("dealloc"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return isa;
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(isa, "isSubclassOfClass:", aClass);
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return self.isa === aClass;
}
}), new objj_method(sel_getUid("isProxy"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("respondsToSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return !!class_getInstanceMethod(isa, aSelector);
}
}), new objj_method(sel_getUid("methodForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return class_getInstanceMethod(isa, aSelector);
}
}), new objj_method(sel_getUid("methodSignatureForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return "<" + isa.name + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "hash")) + ">";
}
}), new objj_method(sel_getUid("performSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return objj_msgSend(self, aSelector);
}
}), new objj_method(sel_getUid("performSelector:withObject:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject);
}
}), new objj_method(sel_getUid("performSelector:withObject:withObject:"), function(self, _cmd, aSelector, anObject, anotherObject)
{ with(self)
{
    return objj_msgSend(self, aSelector, anObject, anotherObject);
}
}), new objj_method(sel_getUid("forwardInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    objj_msgSend(self, "doesNotRecognizeSelector:", objj_msgSend(anInvocation, "selector"));
}
}), new objj_method(sel_getUid("forward::"), function(self, _cmd, aSelector, args)
{ with(self)
{
    var signature = objj_msgSend(self, "methodSignatureForSelector:", aSelector);
    if (signature)
    {
        invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", signature);
        objj_msgSend(invocation, "setTarget:", self);
        objj_msgSend(invocation, "setSelector:", aSelector);
        var index = 2,
            count = args.length;
        for (; index < count; ++index)
            objj_msgSend(invocation, "setArgument:atIndex:", args[index], index);
        objj_msgSend(self, "forwardInvocation:", invocation);
        return objj_msgSend(invocation, "returnValue");
    }
    objj_msgSend(self, "doesNotRecognizeSelector:", aSelector);
}
}), new objj_method(sel_getUid("doesNotRecognizeSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, 
        (class_isMetaClass(isa) ? "+" : "-") + " [" + objj_msgSend(self, "className") + " " + aSelector + "] unrecognized selector sent to " +
        (class_isMetaClass(isa) ? "class" : "instance") + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "hash")));
}
}), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("classForKeyedArchiver"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "classForCoder");
}
}), new objj_method(sel_getUid("classForCoder"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "class");
}
}), new objj_method(sel_getUid("replacementObjectForArchiver:"), function(self, _cmd, anArchiver)
{ with(self)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
}), new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"), function(self, _cmd, anArchiver)
{ with(self)
{
    return objj_msgSend(self, "replacementObjectForCoder:", anArchiver);
}
}), new objj_method(sel_getUid("replacementObjectForCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("className"), function(self, _cmd)
{ with(self)
{
    return isa.name;
}
}), new objj_method(sel_getUid("autorelease"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("hash"), function(self, _cmd)
{ with(self)
{
    return __address;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{
    return self === anObject || objj_msgSend(self, "hash") === objj_msgSend(anObject, "hash");
}
}), new objj_method(sel_getUid("retain"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("release"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("self"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return isa.super_class;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("load"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("new"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return class_createInstance(self);
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return super_class;
}
}), new objj_method(sel_getUid("isSubclassOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    var theClass = self;
    for(; theClass; theClass = theClass.super_class)
        if(theClass === aClass)
            return YES;
    return NO;
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(self, "isSubclassOfClass:", aClass);
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return self === aClass;
}
}), new objj_method(sel_getUid("instancesRespondToSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return !!class_getInstanceMethod(self, aSelector);
}
}), new objj_method(sel_getUid("instanceMethodForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    return class_getInstanceMethod(self, aSelector);
}
}), new objj_method(sel_getUid("setVersion:"), function(self, _cmd, aVersion)
{ with(self)
{
    version = aVersion;
    return self;
}
}), new objj_method(sel_getUid("version"), function(self, _cmd)
{ with(self)
{
    return version;
}
})]);
}
objj_object.prototype.toString = function()
{
    if (this.isa && class_getInstanceMethod(this.isa, "description") != NULL)
        return objj_msgSend(this, "description")
    else
        return String(this) + " (-description not implemented)";
}

