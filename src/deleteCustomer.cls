 
 /*------------------------------------------------------------------------
    File        : deleteCustomer
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Karolis
    Created     : Wed Apr 23 16:33:57 EEST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS deleteCustomer INHERITS Form: 

    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE deleteCustomerLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE deleteCustomerBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE cancelDeleteCustomerBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE selectedCustNum AS INTEGER NO-UNDO.
    
    CONSTRUCTOR PUBLIC deleteCustomer():
        SUPER().
        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components) NO-ERROR.
    END CONSTRUCTOR.

    METHOD PRIVATE VOID InitializeComponent ( ):
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:deleteCustomerLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:deleteCustomerBtn = NEW System.Windows.Forms.Button().
        THIS-OBJECT:cancelDeleteCustomerBtn = NEW System.Windows.Forms.Button().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* deleteCustomerLabel */
        /*  */
        THIS-OBJECT:deleteCustomerLabel:Location = NEW System.Drawing.Point(12, 43).
        THIS-OBJECT:deleteCustomerLabel:Name = "deleteCustomerLabel".
        THIS-OBJECT:deleteCustomerLabel:Size = NEW System.Drawing.Size(211, 23).
        THIS-OBJECT:deleteCustomerLabel:TabIndex = 0.
        THIS-OBJECT:deleteCustomerLabel:Text = "label1".
        THIS-OBJECT:deleteCustomerLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* deleteCustomerBtn */
        /*  */
        THIS-OBJECT:deleteCustomerBtn:Location = NEW System.Drawing.Point(12, 90).
        THIS-OBJECT:deleteCustomerBtn:Name = "deleteCustomerBtn".
        THIS-OBJECT:deleteCustomerBtn:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:deleteCustomerBtn:TabIndex = 1.
        THIS-OBJECT:deleteCustomerBtn:Text = "Delete".
        THIS-OBJECT:deleteCustomerBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:deleteCustomerBtn:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:deleteCustomerBtn:Click:Subscribe(THIS-OBJECT:deleteCustomerBtn_Click).
        /*  */
        /* cancelDeleteCustomerBtn */
        /*  */
        THIS-OBJECT:cancelDeleteCustomerBtn:Location = NEW System.Drawing.Point(148, 90).
        THIS-OBJECT:cancelDeleteCustomerBtn:Name = "cancelDeleteCustomerBtn".
        THIS-OBJECT:cancelDeleteCustomerBtn:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:cancelDeleteCustomerBtn:TabIndex = 2.
        THIS-OBJECT:cancelDeleteCustomerBtn:Text = "Cancel".
        THIS-OBJECT:cancelDeleteCustomerBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:cancelDeleteCustomerBtn:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:cancelDeleteCustomerBtn:Click:Subscribe(THIS-OBJECT:cancelDeleteCustomerBtn_Click).
        /*  */
        /* deleteCustomer */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(247, 131).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:cancelDeleteCustomerBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:deleteCustomerBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:deleteCustomerLabel).
        THIS-OBJECT:Name = "deleteCustomer".
        THIS-OBJECT:Text = "deleteCustomer".
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    METHOD PUBLIC VOID loadCustomerToDelete(INPUT custNumFromTable AS INTEGER):
       DEFINE VARIABLE customerJson    AS CHARACTER NO-UNDO.
       DEFINE VARIABLE customerList    AS customerList NO-UNDO.
       DEFINE VARIABLE customerName    AS CHARACTER NO-UNDO.
        
       customerList = NEW customerList().
       customerList:loadData("CustNum", STRING(custNumFromTable)).
       customerJson = customerList:getCustomerAsJson().
    
       customerName    = JsonHelper:getJsonValue(customerJson, "Name").
       customerName    = TRIM(REPLACE(customerName, '"', '')).
     
       deleteCustomerLabel:Text = 'Do you really want to delete: ' + customerName + '?'.
       THIS-OBJECT:selectedCustNum = custNumFromTable.
       RETURN.
    END METHOD.
                                                                                 
    METHOD PRIVATE VOID deleteCustomerBtn_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        FIND FIRST Customer WHERE Customer.CustNum = THIS-OBJECT:selectedCustNum NO-ERROR.

        IF AVAILABLE Customer THEN DO:
            DELETE Customer.
            MESSAGE "Customer deleted." VIEW-AS ALERT-BOX INFORMATION.
            THIS-OBJECT:Close(). /* Close the dialog */
        END.
        ELSE DO:
            MESSAGE "Customer not found or could not delete." VIEW-AS ALERT-BOX ERROR.
        END.

        RETURN.
    END METHOD.

    METHOD PRIVATE VOID cancelDeleteCustomerBtn_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):

    THIS-OBJECT:Close().

    RETURN.

END METHOD.

END CLASS.