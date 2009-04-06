i;13;CPTextField.jc;3559;




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

        _DOMElement.removeChild(_DOMTextElement);

        _DOMTextElement = document.createElement("input");
        _DOMTextElement.type = "password";
        _DOMTextElement.style.position = "absolute";
        _DOMTextElement.style.top = TOP_PADDING + "px";
        _DOMTextElement.style.left = HORIZONTAL_PADDING + "px";
        _DOMTextElement.style.width = MAX(0.0, CGRectGetWidth(aFrame) - 2.0 * HORIZONTAL_PADDING) + "px";
        _DOMTextElement.style.height = MAX(0.0, CGRectGetHeight(aFrame) - TOP_PADDING - BOTTOM_PADDING) + "px";
        _DOMTextElement.style.whiteSpace = "pre";
        _DOMTextElement.style.cursor = "default";
        _DOMTextElement.style.zIndex = 100;
        _DOMTextElement.style.border = "0";
        _DOMTextElement.style.font = _DOMElement.style.font;
        _DOMTextElement.style.padding = "0px";
        _DOMTextElement.style.margin = "0px";

        _DOMElement.appendChild(_DOMTextElement);

    }

    return self;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "setFont:", aFont);


    if (_DOMTextElement)
        _DOMTextElement.style.font = _DOMElement.style.font;

}
}), new objj_method(sel_getUid("stringValue"), function(self, _cmd)
{ with(self)
{


    if (objj_msgSend(objj_msgSend(self, "window"), "firstResponder") == self)
        return objj_msgSend(objj_msgSend(self, "class"), "_inputElement").value;


    return _DOMTextElement.value;
}
}), new objj_method(sel_getUid("setStringValue:"), function(self, _cmd, aStringValue)
{ with(self)
{
    _value = aStringValue;


    _DOMTextElement.value = _value;

}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_inputElement"), function(self, _cmd)
{ with(self)
{
    if (!CPSecureTextFieldDOMInputElement)
    {
        CPSecureTextFieldDOMInputElement = document.createElement("input");
        CPSecureTextFieldDOMInputElement.type = "password";
        CPSecureTextFieldDOMInputElement.style.position = "absolute";
        CPSecureTextFieldDOMInputElement.style.top = "0px";
        CPSecureTextFieldDOMInputElement.style.left = "0px";
        CPSecureTextFieldDOMInputElement.style.width = "100%"
        CPSecureTextFieldDOMInputElement.style.height = "100%";
        CPSecureTextFieldDOMInputElement.style.border = "0px";
        CPSecureTextFieldDOMInputElement.style.padding = "0px";
        CPSecureTextFieldDOMInputElement.style.whiteSpace = "pre";
        CPSecureTextFieldDOMInputElement.style.background = "transparent";
        CPSecureTextFieldDOMInputElement.style.outline = "none";
        CPSecureTextFieldDOMInputElement.style.paddingLeft = HORIZONTAL_PADDING + "px";
        CPSecureTextFieldDOMInputElement.style.paddingTop = TOP_PADDING - 2.0 + "px";
        CPSecureTextFieldDOMInputElement.style.margin = "0px";
    }

    return CPSecureTextFieldDOMInputElement;
}
})]);
}

