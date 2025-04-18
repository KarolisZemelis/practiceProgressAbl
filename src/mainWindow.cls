 
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
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* btnCustomers */
        /*  */
        THIS-OBJECT:btnCustomers:Location = NEW System.Drawing.Point(12, 12).
        THIS-OBJECT:btnCustomers:Name = "btnCustomers".
        THIS-OBJECT:btnCustomers:Size = NEW System.Drawing.Size(150, 40).
        THIS-OBJECT:btnCustomers:TabIndex = 0.
        THIS-OBJECT:btnCustomers:Text = "View Customers".
        THIS-OBJECT:btnCustomers:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:btnCustomers:Click:Subscribe(THIS-OBJECT:btnCustomers_Click).

        /*  */
        /* mainWindow */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(800, 600).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:btnCustomers).
        THIS-OBJECT:Name = "mainWindow".
        THIS-OBJECT:Text = "mainWindow".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:mainWindow_Load).
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mainWindow_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		RETURN.

	END METHOD.
    METHOD PRIVATE VOID btnCustomers_Click(sender AS System.Object, e AS System.EventArgs):
        DEFINE VARIABLE custCtrl AS clientList NO-UNDO.
        custCtrl = NEW clientList().
        custCtrl:Location = NEW System.Drawing.Point(0, 10).
        custCtrl:TopLevel = FALSE.
        custCtrl:FormBorderStyle = System.Windows.Forms.FormBorderStyle:None.
/*        custCtrl:Dock = System.Windows.Forms.DockStyle:Fill.*/
        custCtrl:Show().
        THIS-OBJECT:Controls:Add(custCtrl).
    END METHOD.



    DESTRUCTOR PUBLIC mainWindow ( ):

    END DESTRUCTOR.

END CLASS.