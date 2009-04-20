I;21;Foundation/CPObject.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.ji;19;CPThemedAttribute.jc;10788;
{var the_class = objj_allocateClassPair(CPObject, "CPBlend"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_themes"), new objj_ivar("_loadDelegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_themes"), function(self, _cmd)
{ with(self)
{
return _themes;
}
}), new objj_method(sel_getUid("initWithContentsOfURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _bundle = objj_msgSend(objj_msgSend(CPBundle, "alloc"), "initWithPath:", aURL + "/Info.plist");
    }
    return self;
}
}), new objj_method(sel_getUid("loadWithDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _loadDelegate = aDelegate;
    objj_msgSend(_bundle, "loadWithDelegate:", self);
}
}), new objj_method(sel_getUid("bundleDidFinishLoading:"), function(self, _cmd, aBundle)
{ with(self)
{
    var paths = objj_msgSend(_bundle, "objectForInfoDictionaryKey:", "CPBundleReplacedFiles"),
        index = 0,
        count = paths.length,
        bundlePath = objj_msgSend(_bundle, "bundlePath");
    while (count--)
    {
        var path = paths[count];
        if (objj_msgSend(path, "pathExtension") === "keyedtheme")
        {
            var unarchiver = objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:", objj_msgSend(CPData, "dataWithString:", objj_files[bundlePath + '/' + path].contents), _bundle);
            objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
            objj_msgSend(unarchiver, "finishDecoding");
        }
    }
    objj_msgSend(_loadDelegate, "blendDidFinishLoading:", self);
}
})]);
}
var CPThemesByName = nil,
    CPThemeDefaultTheme = nil,
    CPThemeViewClass = Nil,
    CPThemeWindowClass = Nil;
{var the_class = objj_allocateClassPair(CPObject, "CPTheme"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_activeClass"), new objj_ivar("_classTable")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _classTable = {};
        _classTable[objj_msgSend(objj_msgSend(self, "class"), "className")] = {};
        CPThemesByName[_name] = aName;
    }
    return self;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("setActiveClass:"), function(self, _cmd, aClass)
{ with(self)
{
    _activeClass = aClass;
}
}), new objj_method(sel_getUid("activeClass"), function(self, _cmd)
{ with(self)
{
    return _activeClass;
}
}), new objj_method(sel_getUid("valueForAttributeName:inClass:"), function(self, _cmd, anAttributeName, aClass)
{ with(self)
{
    if (!aClass)
        return nil;
    var className = objj_msgSend(aClass, "className"),
        table = _classTable[className];
    if (!table)
        return nil;
    var value = table[anAttributeName];
    if (!value)
        return nil;
    return value;
}
}), new objj_method(sel_getUid("takeThemeFromObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var attributes = objj_msgSend(anObject, "_themedAttributes"),
        attributeName = nil,
        attributeNames = objj_msgSend(attributes, "keyEnumerator"),
        objectClass = objj_msgSend(anObject, "class");
    while (attributeName = objj_msgSend(attributeNames, "nextObject"))
        objj_msgSend(self, "addValue:forAttributeName:inClass:", objj_msgSend(attributes, "objectForKey:", attributeName), attributeName, objectClass);
}
}), new objj_method(sel_getUid("setDefaultValue:forAttributeName:"), function(self, _cmd, aValue, anAttributeName)
{ with(self)
{
    objj_msgSend(self, "addValue:forAttributeName:inClass:", aValue, anAttributeName, objj_msgSend(self, "class"));
}
}), new objj_method(sel_getUid("addValue:forAttributeName:inClass:"), function(self, _cmd, aValue, anAttributeName, aClass)
{ with(self)
{
    if (!aValue)
        return;
    var className = objj_msgSend(aClass, "className"),
        table = _classTable[className];
    if (!table)
    {
        var classNames = [];
        while (!table && (aClass !== CPThemeViewClass) && (aClass !== CPThemeWindowClass))
        {
            classNames.push(className);
            aClass = objj_msgSend(aClass, "superclass");
            className = objj_msgSend(aClass, "className");
            table = _classTable[className];
        }
        if (!table)
            table = _classTable[objj_msgSend(objj_msgSend(self, "class"), "className")];
        var count = objj_msgSend(classNames, "count");
        while (count--)
        {
            className = classNames[count];
            _classTable[className] = {};
            _classTable[className].prototype = table;
            table = _classTable[className];
        }
    }
    var existingAttribute = table[anAttributeName];
    if (existingAttribute)
        table[anAttributeName] = objj_msgSend(existingAttribute, "themedAttributeMergedWithThemedAttribute:", aValue);
    else
        table[anAttributeName] = aValue;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPTheme, "class"))
        return;
    CPThemesByName = {};
    CPThemeViewClass = objj_msgSend(CPView, "class");
    CPThemeWindowClass = objj_msgSend(CPWindow, "class");
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
        defaultThemePath = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "Default Themes Path"),
        defaultThemeName = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "Default Theme Name");
    if (!defaultThemePath)
        return;
    defaultThemePath = objj_msgSend(bundle, "pathForResource:", defaultThemePath);
    var file = objj_files[defaultThemePath + "/Info.plist"];
    if (!file)
        return;
    var infoDictionary = CPPropertyListCreateFromData(objj_msgSend(CPData, "dataWithString:", objj_files[defaultThemePath + "/Info.plist"].contents));
        themes = objj_msgSend(infoDictionary, "objectForKey:", "CPBundleReplacedFiles"),
        themeIndex = 0,
        themeCount = objj_msgSend(themes, "count");
    for (; themeIndex < themeCount; ++themeIndex)
    {
        var unarchiver = objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:", objj_msgSend(CPData, "dataWithString:", objj_files[defaultThemePath + '/' + themes[themeIndex]].contents), file.bundle);
        objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
        objj_msgSend(unarchiver, "finishDecoding");
    }
    objj_msgSend(self, "setDefaultTheme:", objj_msgSend(CPTheme, "themeNamed:", defaultThemeName));
}
}), new objj_method(sel_getUid("setDefaultTheme:"), function(self, _cmd, aTheme)
{ with(self)
{
    CPThemeDefaultTheme = aTheme;
}
}), new objj_method(sel_getUid("defaultTheme"), function(self, _cmd)
{ with(self)
{
    return CPThemeDefaultTheme;
}
}), new objj_method(sel_getUid("themeNamed:"), function(self, _cmd, aName)
{ with(self)
{
    return CPThemesByName[aName];
}
}), new objj_method(sel_getUid("loadThemesAtURL:delegate:"), function(self, _cmd, aURL, aLoadDelegate)
{ with(self)
{
}
})]);
}
var CPThemeNameKey = "CPThemeNameKey",
    CPThemeClassNamesArrayKey = "CPThemeClassNamesArrayKey";
{
var the_class = objj_getClass("CPTheme")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTheme\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _name = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeNameKey);
    _classTable = {};
    CPThemesByName[_name] = self;
    if (self)
    {
        var classNamesArray = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeClassNamesArrayKey),
            count = classNamesArray.length;
        while (count--)
        {
            var className = classNamesArray[count],
                theClass = objj_getClass(className),
                values = objj_msgSend(aCoder, "decodeObjectForKey:", className),
                keys = objj_msgSend(values, "allKeys"),
                keyCount = keys.length;
            while (keyCount--)
            {
                var key = keys[keyCount];
                objj_msgSend(self, "addValue:forAttributeName:inClass:", objj_msgSend(values, "objectForKey:", key), key, theClass);
            }
        }
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var classNamesArray = [];
    for (var className in _classTable)
    {
        if (_classTable.hasOwnProperty(className))
        {
            var values = _classTable[className],
                valuesDictionary = objj_msgSend(CPDictionary, "dictionary");
            for (var key in values)
                if (key !== "prototype" && values.hasOwnProperty(key))
                    objj_msgSend(valuesDictionary, "setObject:forKey:", values[key], key);
            objj_msgSend(aCoder, "encodeObject:forKey:", valuesDictionary, className);
            classNamesArray.push(className);
        }
    }
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPThemeNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", classNamesArray, CPThemeClassNamesArrayKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPThemeKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:"), function(self, _cmd, data, aBundle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);
    if (self)
        _bundle = aBundle;
    return self;
}
}), new objj_method(sel_getUid("bundle"), function(self, _cmd)
{ with(self)
{
    return _bundle;
}
}), new objj_method(sel_getUid("awakenCustomResources"), function(self, _cmd)
{ with(self)
{
    return YES;
}
})]);
}

