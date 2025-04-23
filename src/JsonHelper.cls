 
 /*------------------------------------------------------------------------
    File        : JsonHelper
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Karolis
    Created     : Wed Apr 23 17:13:27 EEST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS JsonHelper: 
        METHOD PUBLIC STATIC CHARACTER getJsonValue(INPUT json AS CHARACTER, INPUT key AS CHARACTER):
        DEFINE VARIABLE startPos AS INTEGER     NO-UNDO.
        DEFINE VARIABLE endPos   AS INTEGER     NO-UNDO.
        DEFINE VARIABLE valueStr AS CHARACTER   NO-UNDO.

        startPos = INDEX(json, '"' + key + '"').
        IF startPos = 0 THEN RETURN "".

        startPos = INDEX(json, ':', startPos).
        IF startPos = 0 THEN RETURN "".

        DO WHILE startPos < LENGTH(json)
            AND (SUBSTRING(json, startPos + 1, 1) = ' ' OR SUBSTRING(json, startPos + 1, 1) = '"'):
            startPos = startPos + 1.
        END.

        IF SUBSTRING(json, startPos + 1, 1) = '"' THEN DO:
            startPos = startPos + 1.
            endPos = INDEX(json, '"', startPos + 1).
            IF endPos > startPos THEN
                valueStr = SUBSTRING(json, startPos + 1, endPos - startPos - 1).
        END.
        ELSE DO:
            endPos = INDEX(json + ',', ',', startPos + 1).
            IF endPos = 0 THEN
                endPos = INDEX(json + '}', '}', startPos + 1).
            valueStr = TRIM(SUBSTRING(json, startPos + 1, endPos - startPos - 1)).
        END.

        RETURN valueStr.
    END METHOD.
END CLASS.