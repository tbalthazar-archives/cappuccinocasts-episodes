I;21;Foundation/CPObject.jc;6097;
CPDeleteKeyCode = 8;
CPUpArrowKeyCode = 63232;
CPDownArrowKeyCode = 63233;
CPLeftArrowKeyCode = 63234;
CPRightArrowKeyCode = 63235;
{var the_class = objj_allocateClassPair(CPObject, "CPResponder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_nextResponder")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("becomeFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("resignFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setNextResponder:"), function(self, _cmd, aResponder)
{ with(self)
{
    _nextResponder = aResponder;
}
}), new objj_method(sel_getUid("nextResponder"), function(self, _cmd)
{ with(self)
{
    return _nextResponder;
}
}), new objj_method(sel_getUid("interpretKeyEvents:"), function(self, _cmd, events)
{ with(self)
{
    var event,
        index = 0;
    while(event = events[index++])
    {
        switch(objj_msgSend(event, "keyCode"))
        {
            case CPLeftArrowKeyCode: objj_msgSend(self, "moveBackward:", self);
                                        break;
            case CPRightArrowKeyCode: objj_msgSend(self, "moveForward:", self);
                                        break;
            case CPUpArrowKeyCode: objj_msgSend(self, "moveUp:", self);
                                        break;
            case CPDownArrowKeyCode: objj_msgSend(self, "moveDown:", self);
                                        break;
            case CPDeleteKeyCode: objj_msgSend(self, "deleteBackward:", self);
                                        break;
            case 3:
            case 13: objj_msgSend(self, "insertLineBreak:", self);
                                        break;
            default: objj_msgSend(self, "insertText:", objj_msgSend(event, "characters"));
        }
    }
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseMoved:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseEntered:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseExited:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("scrollWheel:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("keyDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("keyUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("performKeyEquivalent:"), function(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("deleteBackward:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertLineBreak:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertText:"), function(self, _cmd, aString)
{ with(self)
{
}
}), new objj_method(sel_getUid("doCommandBySelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
        objj_msgSend(self, "performSelector:", aSelector);
    else
        objj_msgSend(_nextResponder, "doCommandBySelector:", aSelector);
}
}), new objj_method(sel_getUid("tryToPerform:with:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
    {
        objj_msgSend(self, "performSelector:withObject:", aSelector, anObject);
        return YES;
    }
    return objj_msgSend(_nextResponder, "tryToPerform:with:", aSelector, anObject);
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
}), new objj_method(sel_getUid("menu"), function(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("undoManager"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_nextResponder, "performSelector:", _cmd);
}
}), new objj_method(sel_getUid("noResponderFor:"), function(self, _cmd, anEventSelector)
{ with(self)
{
}
})]);
}
var CPResponderNextResponderKey = "CPResponderNextResponderKey";
{
var the_class = objj_getClass("CPResponder")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPResponder\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _nextResponder = objj_msgSend(aCoder, "decodeObjectForKey:", CPResponderNextResponderKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _nextResponder, CPResponderNextResponderKey);
}
})]);
}

