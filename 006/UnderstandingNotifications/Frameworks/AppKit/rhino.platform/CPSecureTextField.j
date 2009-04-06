i;13;CPTextField.jc;1083;




var TOP_PADDING = 4.0,
    BOTTOM_PADDING = 3.0;
    HORIZONTAL_PADDING = 3.0;

var CPSecureTextFieldDOMInputElement = nil;

{var the_class = objj_allocateClassPair(CPTextField, "CPSecureTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "setFont:", aFont);
}
}), new objj_method(sel_getUid("stringValue"), function(self, _cmd)
{ with(self)
{
    return _DOMTextElement.value;
}
}), new objj_method(sel_getUid("setStringValue:"), function(self, _cmd, aStringValue)
{ with(self)
{
    _value = aStringValue;
}
})]);
}

