
/*------------------------------------------------------------------------
    File        : main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Apr 17 13:32:52 EEST 2025
    Notes       :
  ----------------------------------------------------------------------*/



/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

DEFINE VARIABLE win AS mainWindow NO-UNDO.
win = NEW mainWindow().
WAIT-FOR win:ShowDialog().