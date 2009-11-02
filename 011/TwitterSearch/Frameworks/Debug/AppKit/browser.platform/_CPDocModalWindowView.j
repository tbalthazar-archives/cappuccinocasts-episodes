i;15;_CPWindowView.jc;2129;

var _CPStandardWindowViewBodyBackgroundColor = nil;

{var the_class = objj_allocateClassPair(_CPWindowView, "_CPDocModalWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bodyView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:styleMask:"), function $_CPDocModalWindowView__initWithFrame_styleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "initWithFrame:styleMask:", aFrame, aStyleMask);

    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
              bounds = objj_msgSend(self, "bounds");

       _bodyView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));

        objj_msgSend(_bodyView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(_bodyView, "setBackgroundColor:", objj_msgSend(theClass, "bodyBackgroundColor"));
        objj_msgSend(_bodyView, "setHitTests:", NO);

        objj_msgSend(self, "addSubview:", _bodyView);
     }

    return self;
}
},["id","CPRect","unsigned"]), new objj_method(sel_getUid("contentRectForFrameRect:"), function $_CPDocModalWindowView__contentRectForFrameRect_(self, _cmd, aFrameRect)
{ with(self)
{
    return aFrameRect;
}
},["CGRect","CGRect"]), new objj_method(sel_getUid("frameRectForContentRect:"), function $_CPDocModalWindowView__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    return aContentRect;
}
},["CGRect","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bodyBackgroundColor"), function $_CPDocModalWindowView__bodyBackgroundColor(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewBodyBackgroundColor)
        _CPStandardWindowViewBodyBackgroundColor = objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.96, 1.0);

    return _CPStandardWindowViewBodyBackgroundColor;
}
},["CPColor"])]);
}

