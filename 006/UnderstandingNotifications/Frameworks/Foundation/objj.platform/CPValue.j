i;10;CPObject.ji;9;CPCoder.jc;4883;
{var the_class = objj_allocateClassPair(CPObject, "CPValue"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_JSObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithJSObject:"), function(self, _cmd, aJSObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _JSObject = aJSObject;
    return self;
}
}), new objj_method(sel_getUid("JSObject"), function(self, _cmd)
{ with(self)
{
    return _JSObject;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("valueWithJSObject:"), function(self, _cmd, aJSObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithJSObject:", aJSObject);
}
})]);
}
var CPValueValueKey = "CPValueValueKey";
{
var the_class = objj_getClass("CPValue")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPValue\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _JSObject = CPJSObjectCreateWithJSON(objj_msgSend(aCoder, "decodeObjectForKey:", CPValueValueKey));
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", CPJSObjectCreateJSON(_JSObject), CPValueValueKey);
}
})]);
}
var _JSONCharacterEncodings = {};
_JSONCharacterEncodings['\b'] = "\\b";
_JSONCharacterEncodings['\t'] = "\\t";
_JSONCharacterEncodings['\n'] = "\\n";
_JSONCharacterEncodings['\f'] = "\\f";
_JSONCharacterEncodings['\r'] = "\\r";
_JSONCharacterEncodings['"'] = "\\\"";
_JSONCharacterEncodings['\\'] = "\\\\";
var _JSONEncodedCharacters = new RegExp("[\\\"\\\\\\x00-\\x1f\\x7f-\\x9f]", 'g');
CPJSObjectCreateJSON= function(aJSObject)
{
    var type = typeof aJSObject,
        valueOf = aJSObject.valueOf(),
        typeValueOf = typeof valueOf;
    if (type != typeValueOf)
    {
        type = typeValueOf;
        aJSObject = valueOf;
    }
    switch (type)
    {
        case "string":
                        if (!_JSONEncodedCharacters.test(aJSObject))
                            return '"' + aJSObject + '"';
                        return '"' + aJSObject.replace(_JSONEncodedCharacters, _CPJSObjectEncodeCharacter) + '"';
        case "number":
                        return isFinite(aJSObject) ? String(aJSObject) : "null";
        case "boolean":
        case "null": return String(aJSObject);
        case "object":
                        if (!aJSObject)
                            return "null";
                        if (typeof aJSObject.toJSON === "function")
                            return CPJSObjectCreateJSON(aJSObject.toJSON());
                        var array = [];
                        if (aJSObject.slice)
                        {
                            var index = 0,
                                count = aJSObject.length;
                            for (; index < count; ++index)
                                array.push(CPJSObjectCreateJSON(aJSObject[index]) || "null");
                            return '[' + array.join(',') + ']';
                        }
                        var key = NULL;
                        for (key in aJSObject)
                        {
                            if (!(typeof key === "string"))
                                continue;
                            var value = CPJSObjectCreateJSON(aJSObject[key]);
                            if (value)
                                array.push(CPJSObjectCreateJSON(key) + ':' + value);
                        }
                        return '{' + array.join(',') + '}';
    }
}
var _CPJSObjectEncodeCharacter = function(aCharacter)
{
    var encoding = _JSONCharacterEncodings[aCharacter];
    if (encoding)
        return encoding;
    encoding = aCharacter.charCodeAt(0);
    return '\\u00' + FLOOR(encoding / 16).toString(16) + (encoding % 16).toString(16);
}
var _JSONBackslashCharacters = new RegExp("\\\\.", 'g'),
    _JSONSimpleValueTokens = new RegExp("\"[^\"\\\\\\n\\r]*\"|true|false|null|-?\\d+(?:\\.\\d*)?(?:[eE][+\\-]?\\d+)?", 'g'),
    _JSONValidOpenBrackets = new RegExp("(?:^|:|,)(?:\\s*\\[)+", 'g'),
    _JSONValidExpression = new RegExp("^[\\],:{}\\s]*$");
CPJSObjectCreateWithJSON= function(aString)
{
    if (_JSONValidExpression.test(aString.replace(_JSONBackslashCharacters, '@').replace(_JSONSimpleValueTokens, ']').replace(_JSONValidOpenBrackets, '')))
        return eval('(' + aString + ')');
    return nil;
}

