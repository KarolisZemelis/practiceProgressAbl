 
 /*------------------------------------------------------------------------
    File        : mainWindow
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Karolis
    Created     : Thu Apr 17 13:34:15 EEST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.
BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS mainWindow INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE btnCustomers AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE btnCreateCustomer AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE deleteCustomerBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE updateCustomerBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE custCtrl AS customerList NO-UNDO. 
       
    CONSTRUCTOR PUBLIC mainWindow (  ):
        
        
        SUPER().
        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:btnCustomers = NEW System.Windows.Forms.Button().
        THIS-OBJECT:btnCreateCustomer = NEW System.Windows.Forms.Button().
        THIS-OBJECT:updateCustomerBtn = NEW System.Windows.Forms.Button().
        THIS-OBJECT:deleteCustomerBtn = NEW System.Windows.Forms.Button().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* btnCustomers */
        /*  */
        THIS-OBJECT:btnCustomers:Location = NEW System.Drawing.Point(12, 0).
        THIS-OBJECT:btnCustomers:Name = "btnCustomers".
        THIS-OBJECT:btnCustomers:Size = NEW System.Drawing.Size(150, 40).
        THIS-OBJECT:btnCustomers:TabIndex = 0.
        THIS-OBJECT:btnCustomers:Text = "Refresh Customers".
        THIS-OBJECT:btnCustomers:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnCustomers:Click:Subscribe(THIS-OBJECT:btnCustomers_Click).
        /*  */
        /* btnCreateCustomer */
        /*  */
        THIS-OBJECT:btnCreateCustomer:Location = NEW System.Drawing.Point(180, 0).
        THIS-OBJECT:btnCreateCustomer:Name = "btnCreateCustomer".
        THIS-OBJECT:btnCreateCustomer:Size = NEW System.Drawing.Size(150, 40).
        THIS-OBJECT:btnCreateCustomer:TabIndex = 0.
        THIS-OBJECT:btnCreateCustomer:Text = "Create Customer".
        THIS-OBJECT:btnCreateCustomer:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnCreateCustomer:Click:Subscribe(THIS-OBJECT:btnCreateCustomer_Click).
        /*  */
        /* updateCustomerBtn */
        /*  */
        THIS-OBJECT:updateCustomerBtn:Location = NEW System.Drawing.Point(348, 0).
        THIS-OBJECT:updateCustomerBtn:Name = "updateCustomerBtn".
        THIS-OBJECT:updateCustomerBtn:Size = NEW System.Drawing.Size(150, 40).
        THIS-OBJECT:updateCustomerBtn:TabIndex = 1.
        THIS-OBJECT:updateCustomerBtn:Text = "Update Customer".
        THIS-OBJECT:updateCustomerBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:updateCustomerBtn:Click:Subscribe(THIS-OBJECT:updateCustomerBtn_Click).
        /*  */
        /* deleteCustomerBtn */
        /*  */
        THIS-OBJECT:deleteCustomerBtn:Location = NEW System.Drawing.Point(519, 0).
        THIS-OBJECT:deleteCustomerBtn:Name = "deleteCustomerBtn".
        THIS-OBJECT:deleteCustomerBtn:Size = NEW System.Drawing.Size(150, 40).
        THIS-OBJECT:deleteCustomerBtn:TabIndex = 2.
        THIS-OBJECT:deleteCustomerBtn:Text = "Delete Customer".
        THIS-OBJECT:deleteCustomerBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:deleteCustomerBtn:Click:Subscribe(THIS-OBJECT:deleteCustomerBtn_Click).
        /*  */
        /* mainWindow */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(800, 600).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:deleteCustomerBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:updateCustomerBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:btnCustomers).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:btnCreateCustomer).
        THIS-OBJECT:Name = "mainWindow".
        THIS-OBJECT:Text = "mainWindow".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:mainWindow_Load).
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

	METHOD PRIVATE VOID mainWindow_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		THIS-OBJECT:ShowCustomerList().
		RETURN.

	END METHOD.
    
    METHOD PRIVATE VOID ShowCustomerList():
        IF VALID-OBJECT(custCtrl) THEN DO:
            custCtrl:Close().
            THIS-OBJECT:Controls:Remove(custCtrl).
        END.
    
        custCtrl = NEW customerList().
        custCtrl:Location = NEW System.Drawing.Point(0, 50).
        custCtrl:TopLevel = FALSE.
        custCtrl:FormBorderStyle = System.Windows.Forms.FormBorderStyle:None.
        custCtrl:Show().
        THIS-OBJECT:Controls:Add(custCtrl).
    END METHOD.

    METHOD PRIVATE VOID btnCustomers_Click(sender AS System.Object, e AS System.EventArgs):
        THIS-OBJECT:ShowCustomerList().
    END METHOD.
    
    METHOD PRIVATE VOID btnCreateCustomer_Click(sender AS System.Object, e AS System.EventArgs):
        DEFINE VARIABLE createCustomerForm AS createCustomer NO-UNDO.
        createCustomerForm = NEW createCustomer().
        WAIT-FOR createCustomerForm:ShowDialog().
    END METHOD.

	METHOD PRIVATE VOID updateCustomerBtn_Click(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE selectedCustomer AS INTEGER NO-UNDO.
    
        IF VALID-OBJECT(custCtrl) THEN DO:
            selectedCustomer = INTEGER(custCtrl:GetSelectedCustNum()) NO-ERROR.

            IF selectedCustomer > 0 THEN DO:

                DEFINE VARIABLE customerToUpdate AS updateCustomer NO-UNDO.
                customerToUpdate = NEW updateCustomer().
                customerToUpdate:loadCustomerToUpdate(selectedCustomer).
                WAIT-FOR customerToUpdate:ShowDialog().
            END.
            ELSE DO:
                MESSAGE "Please select a customer from the list." VIEW-AS ALERT-BOX INFO.
            END.
        END.
        ELSE DO:
            MESSAGE "Customer list is not loaded." VIEW-AS ALERT-BOX INFO.
        END.
    END METHOD.

    METHOD PRIVATE VOID deleteCustomerBtn_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        DEFINE VARIABLE selectedCustomer AS INTEGER NO-UNDO.
          
        IF VALID-OBJECT(custCtrl) THEN DO:
            selectedCustomer = INTEGER(custCtrl:GetSelectedCustNum()) NO-ERROR.

            IF selectedCustomer > 0 THEN DO:
                DEFINE VARIABLE customerToDelete AS deleteCustomer NO-UNDO.
                customerToDelete = NEW deleteCustomer().
                customerToDelete:loadCustomerToDelete(selectedCustomer).
                WAIT-FOR customerToDelete:ShowDialog().
            END.
            ELSE DO:
                MESSAGE "Please select a customer from the list." VIEW-AS ALERT-BOX INFO.
            END.
        END.
        RETURN.

    END METHOD.

    DESTRUCTOR PUBLIC mainWindow ( ):

    END DESTRUCTOR.

END CLASS.