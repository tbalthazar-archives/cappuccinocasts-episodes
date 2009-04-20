I;21;Foundation/CPObject.jc;1646;
{var the_class = objj_allocateClassPair(CPObject, "CPShadow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_offset"), new objj_ivar("_blurRadius"), new objj_ivar("_color"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"), function(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _offset = anOffset;
        _blurRadius = aBlurRadius;
        _color = aColor;
        _cssString = objj_msgSend(_color, "cssString") + " " + Math.round(anOffset.width) + "px " + Math.round(anOffset.height) + "px " + Math.round(_blurRadius) + "px";
    }
    return self;
}
}), new objj_method(sel_getUid("shadowOffset"), function(self, _cmd)
{ with(self)
{
    return _offset;
}
}), new objj_method(sel_getUid("shadowBlurRadius"), function(self, _cmd)
{ with(self)
{
    return _blurRadius;
}
}), new objj_method(sel_getUid("shadowColor"), function(self, _cmd)
{ with(self)
{
    return _color;
}
}), new objj_method(sel_getUid("cssString"), function(self, _cmd)
{ with(self)
{
    return _cssString;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"), function(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPShadow, "alloc"), "_initWithOffset:blurRadius:color:", anOffset, aBlurRadius, aColor);
}
})]);
}

