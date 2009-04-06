i;8;CPView.jc;3582;
{var the_class = objj_allocateClassPair(CPView, "_CPCibCustomView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function(self, _cmd)
{ with(self)
{
    return _className;
}
})]);
}
var _CPCibCustomViewClassNameKey = "_CPCibCustomViewClassNameKey";
{
var the_class = objj_getClass("_CPCibCustomView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomViewClassNameKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomViewClassNameKey);
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, aRect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 169.0 / 255.0, 173.0 / 255.0, 178.0 / 255.0, 1.0));
    CGContextStrokeRect(context, CGRectInset(CGRectIntegral(bounds), 0.5, 0.5));
    CGContextSetFillColor(context, objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 224.0 / 255.0, 236.0 / 255.0, 250.0 / 255.0, 1.0));
    CGContextFillRect(context, CGRectInset(bounds, 2.0, 2.0));
}
}), new objj_method(sel_getUid("_cibInstantiate"), function(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);
    if (!theClass)
    {
        CPLog("Unknown class \"" + _className + "\" in cib file, using CPView instead.");
        theClass = objj_msgSend(CPView, "class");
    }
    if (theClass === objj_msgSend(self, "class"))
    {
        _className = "CPView";
        return self;
    }
    var view = objj_msgSend(objj_msgSend(theClass, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
    if (view)
    {
        objj_msgSend(view, "setBounds:", objj_msgSend(self, "bounds"));
        var subviews = objj_msgSend(objj_msgSend(self, "subviews"), "copy"),
            index = 0,
            count = subviews.length;
        for (; index < count; ++index)
            objj_msgSend(view, "addSubview:", subviews[index]);
        objj_msgSend(view, "setAutoresizingMask:", objj_msgSend(self, "autoresizingMask"));
        objj_msgSend(view, "setAutoresizesSubviews:", objj_msgSend(self, "autoresizesSubviews"));
        objj_msgSend(view, "setHitTests:", objj_msgSend(self, "hitTests"));
        objj_msgSend(view, "setHidden:", objj_msgSend(self, "isHidden"));
        objj_msgSend(view, "setAlphaValue:", objj_msgSend(self, "alphaValue"));
        objj_msgSend(_superview, "replaceSubview:with:", self, view);
        objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    }
    return view;
}
})]);
}

