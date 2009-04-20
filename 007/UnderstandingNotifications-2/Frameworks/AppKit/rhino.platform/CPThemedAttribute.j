I;21;Foundation/CPObject.jc;7686;


CPControlStateNormal = 0,
CPControlStateHighlighted = 1 << 0,
CPControlStateDisabled = 1 << 1,
CPControlStateSelected = 1 << 2,
CPControlStateDefault = 1 << 3,
CPControlStateBordered = 1 << 4,
CPControlStateBezeled = 1 << 5,
CPControlStateVertical = 1 << 6,
CPControlStateEditable = 1 << 7,
CPControlStateEditing = 1 << 8;

var BIT_COUNT = [ 0 , 1 , 1 , 2 , 1 , 2 , 2 , 3 ,
                    1 , 2 , 2 , 3 , 2 , 3 , 3 , 4 ,
                    1 , 2 , 2 , 3 , 2 , 3 , 3 , 4 ,
                    2 , 3 , 3 , 4 , 3 , 4 , 4 , 5 ],
    bit_count = function(bits)
    {
        var count = 0;

        while (bits)
        {
            ++count;
            bits &= (bits - 1);
        }

        return count ;
    }

{var the_class = objj_allocateClassPair(CPObject, "CPThemedAttribute"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cache"), new objj_ivar("_name"), new objj_ivar("_defaultValue"), new objj_ivar("_theme"), new objj_ivar("_themedClass"), new objj_ivar("_values"), new objj_ivar("_attributeFromTheme")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:defaultValue:theme:class:"), function(self, _cmd, aName, aDefaultValue, aTheme, aClass)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _cache = {};

        _name = aName;

        _defaultValue = aDefaultValue;

        _theme = aTheme;
        _themedClass = aClass;

        _values = objj_msgSend(CPDictionary, "dictionary");
        _attributeFromTheme = objj_msgSend(_theme, "valueForAttributeName:inClass:", _name, _themedClass);
    }

    return self;
}
}), new objj_method(sel_getUid("setName:"), function(self, _cmd, aName)
{ with(self)
{
    _name = aName;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("setDefaultValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _cache = {};
    _defaultValue = aValue;
}
}), new objj_method(sel_getUid("setTheme:"), function(self, _cmd, aTheme)
{ with(self)
{
    if (_theme === aTheme)
        return;

    _cache = {};
    _theme = aTheme;
    _attributeFromTheme = objj_msgSend(_theme, "valueForAttributeName:inClass:", _name, _themedClass);
}
}), new objj_method(sel_getUid("setThemedClass:"), function(self, _cmd, aClass)
{ with(self)
{
    if (_themedClass === aClass)
        return;

    _cache = {};
    _themedClass = aClass;
    _attributeFromTheme = objj_msgSend(_theme, "valueForAttributeName:inClass:", _name, _themedClass);
}
}), new objj_method(sel_getUid("setValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _cache = {};

    if (aValue === undefined || aValue === nil)
        _values = objj_msgSend(CPDictionary, "dictionary");
    else
        _values = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aValue, String(CPControlStateNormal));
}
}), new objj_method(sel_getUid("value"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForControlState:", CPControlStateNormal);
}
}), new objj_method(sel_getUid("setValue:forControlState:"), function(self, _cmd, aValue, aState)
{ with(self)
{

    _cache = {};

    if ((aValue === undefined) || (aValue === nil))
        objj_msgSend(_values, "removeObjectForKey:", String(aState));
    else
        objj_msgSend(_values, "setObject:forKey:", aValue, String(aState));
}
}), new objj_method(sel_getUid("valueForControlState:"), function(self, _cmd, aState)
{ with(self)
{
    var value = _cache[aState];


    if (value !== undefined)
        return value;

    value = objj_msgSend(_values, "objectForKey:", String(aState));


    if ((value === undefined || value === nil) && aState > 0)
    {

        if (aState & (aState - 1))
        {
            var highestBitCount = 0,
                states = objj_msgSend(_values, "allKeys"),
                count = states.length;

            while (count--)
            {

                state = Number(states[count]);


                if ((state & aState) === state)
                {
                    var bitCount = (state < BIT_COUNT.length) ? BIT_COUNT[state] : bit_count(state);

                    if (bitCount > highestBitCount)
                    {
                        highestBitCount = bitCount;
                        value = objj_msgSend(_values, "objectForKey:", String(state));
                    }
                }
            }
        }


        if (value === undefined || value === nil)
            value = objj_msgSend(_values, "objectForKey:", String(CPControlStateNormal));
    }

    if (value === undefined || value === nil)
        value = objj_msgSend(_attributeFromTheme, "valueForControlState:", aState);

    if (value === undefined || value === nil)
        value = _defaultValue;

    _cache[aState] = value;

    return value;
}
}), new objj_method(sel_getUid("themedAttributeMergedWithThemedAttribute:"), function(self, _cmd, aThemedAttribute)
{ with(self)
{
    var mergedAttribute = CPThemedAttributeMake(_name, _defaultValue, _theme, _themedClass);

    mergedAttribute._values = objj_msgSend(_values, "copy");
    objj_msgSend(mergedAttribute._values, "addEntriesFromDictionary:", aThemedAttribute._values);

    return mergedAttribute;
}
}), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _cache = {};
        _values = objj_msgSend(aCoder, "decodeObjectForKey:", "values");
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _values, "values");
}
})]);
}

CPThemedAttributeMake= function(aName, aDefaultValue, aTheme, aClass)
{
    return objj_msgSend(objj_msgSend(CPThemedAttribute, "alloc"), "initWithName:defaultValue:theme:class:", aName, aDefaultValue, aTheme, aClass);
}

CPThemedAttributeEncode= function(aCoder, aThemedAttribute)
{
    var values = aThemedAttribute._values,
        count = objj_msgSend(values, "count");

    if (count === 1)
    {
        var key = objj_msgSend(values, "allKeys")[0];

        if (Number(key) === 0)
            return objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(values, "objectForKey:", key), "$a" + objj_msgSend(aThemedAttribute, "name"));
    }

    if (count >= 1)
        objj_msgSend(aCoder, "encodeObject:forKey:", aThemedAttribute, "$a" + objj_msgSend(aThemedAttribute, "name"));
}

CPThemedAttributeDecode= function(aCoder, anAttributeName, aDefaultValue, aTheme, aClass)
{
    var key = "$a" + anAttributeName;

    if (!objj_msgSend(aCoder, "containsValueForKey:", key))
        return CPThemedAttributeMake(anAttributeName, aDefaultValue, aTheme, aClass);

    var attribute = objj_msgSend(aCoder, "decodeObjectForKey:", key);

    if (!attribute.isa || !objj_msgSend(attribute, "isKindOfClass:", objj_msgSend(CPThemedAttribute, "class")))
    {
        var themedAttribute = CPThemedAttributeMake(anAttributeName, aDefaultValue, aTheme, aClass);

        objj_msgSend(themedAttribute, "setValue:", attribute);

        attribute = themedAttribute;
    }

    else
    {
        objj_msgSend(attribute, "setName:", anAttributeName);
        objj_msgSend(attribute, "setDefaultValue:", aDefaultValue);
        objj_msgSend(attribute, "setTheme:", aTheme);
        objj_msgSend(attribute, "setThemedClass:", aClass);
    }

    return attribute;
}

