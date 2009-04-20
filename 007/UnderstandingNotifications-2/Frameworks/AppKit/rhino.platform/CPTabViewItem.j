I;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;3357;
CPSelectedTab = 0;
CPBackgroundTab = 1;
CPPressedTab = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTabViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_label"), new objj_ivar("_view"), new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _identifier = anIdentifier;
    return self;
}
}), new objj_method(sel_getUid("setLabel:"), function(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
}), new objj_method(sel_getUid("label"), function(self, _cmd)
{ with(self)
{
    return _label;
}
}), new objj_method(sel_getUid("tabState"), function(self, _cmd)
{ with(self)
{
    return _tabState;
}
}), new objj_method(sel_getUid("setIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
}), new objj_method(sel_getUid("identifier"), function(self, _cmd)
{ with(self)
{
    return _identifier;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("setAuxiliaryView:"), function(self, _cmd, anAuxiliaryView)
{ with(self)
{
    _auxiliaryView = anAuxiliaryView;
}
}), new objj_method(sel_getUid("auxiliaryView"), function(self, _cmd)
{ with(self)
{
    return _auxiliaryView;
}
}), new objj_method(sel_getUid("tabView"), function(self, _cmd)
{ with(self)
{
    return _tabView;
}
})]);
}
var CPTabViewItemIdentifierKey = "CPTabViewItemIdentifierKey",
    CPTabViewItemLabelKey = "CPTabViewItemLabelKey",
    CPTabViewItemViewKey = "CPTabViewItemViewKey",
    CPTabViewItemAuxViewKey = "CPTabViewItemAuxViewKey";
{
var the_class = objj_getClass("CPTabViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTabViewItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemIdentifierKey);
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemLabelKey);
        _view = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemViewKey);
        _auxiliaryView = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemAuxViewKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTabViewItemIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, CPTabViewItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _view, CPTabViewItemViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _auxiliaryView, CPTabViewItemAuxViewKey);
}
})]);
}

