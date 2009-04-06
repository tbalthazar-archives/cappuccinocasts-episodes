c;4385;


{var the_class = objj_allocateClassPair(CPObject, "AKThemeTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_description")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _name = objj_msgSend(aCoder, "decodeObjectForKey:", "AKThemeTemplateName");
        _description = objj_msgSend(aCoder, "decodeObjectForKey:", "AKThemeTemplateDescription");
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, "AKThemeTemplateName");
    objj_msgSend(aCoder, "encodeObject:forKey:", _description, "AKThemeTemplateDescription");
}
})]);
}

{var the_class = objj_allocateClassPair(CPView, "AKThemeObjectTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_label"), new objj_ivar("_themedObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "init");

    if (self)
    {
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", "AKThemeObjectTemplateLabel");
        _themedObject = objj_msgSend(aCoder, "decodeObjectForKey:", "AKThemeObjectTemplateThemedObject");
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, "AKThemeObjectTemplateLabel");
    objj_msgSend(aCoder, "encodeObject:forKey:", _themedObject, "AKThemeObjectTemplateThemedObject");
}
})]);
}

BKThemeDescriptorClasses= function()
{

    var themeDescriptorClasses = [];

    for (candidate in window)
    {
        var theClass = objj_getClass(candidate),
            theClassName = class_getName(theClass),
            index = theClassName.indexOf("ThemeDescriptor");

        if ((index >= 0) && (index === theClassName.length - "ThemeDescriptor".length))
            themeDescriptorClasses.push(theClass);
    }

    return themeDescriptorClasses;
}

BKThemeObjectTemplatesForClass= function(aClass)
{
    var templates = [],
        methods = class_copyMethodList(aClass.isa),
        count = objj_msgSend(methods, "count");

    while (count--)
    {
        var method = methods[count],
            selector = method_getName(method);

        if (selector.indexOf("themed") === 0)
        {
            var impl = method_getImplementation(method),
                object = impl(aClass, selector);

            if (object)
            {
                var template = objj_msgSend(objj_msgSend(AKThemeObjectTemplate, "alloc"), "init");

                objj_msgSend(template, "setValue:forKey:", object, "themedObject");
                objj_msgSend(template, "setValue:forKey:", BKLabelFromIdentifier(selector), "label");

                objj_msgSend(templates, "addObject:", template);
            }
        }
    }

    return templates;
}

BKLabelFromIdentifier= function(anIdentifier)
{
    var string = anIdentifier.substr("themed".length);
        index = 0,
        count = string.length,
        label = "",
        lastCapital = null,
        isLeadingCapital = YES;

    for (; index < count; ++index)
    {
        var character = string.charAt(index),
            isCapital = /^[A-Z]/.test(character);

        if (isCapital)
        {
            if (!isLeadingCapital)
            {
                if (lastCapital === null)
                    label += ' ' + character.toLowerCase();
                else
                    label += character;
            }

            lastCapital = character;
        }
        else
        {
            if (isLeadingCapital && lastCapital !== null)
                label += lastCapital;

            label += character;

            lastCapital = null;
            isLeadingCapital = NO;
        }
    }

    return label;
}

