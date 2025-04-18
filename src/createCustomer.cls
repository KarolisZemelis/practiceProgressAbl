 
 /*------------------------------------------------------------------------
    File        : createCustomer
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Karolis
    Created     : Fri Apr 18 16:30:30 EEST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS createCustomer INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE customerAddressTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerAddressLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE customerCityTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerCityLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE customerNameTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerNameLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE saveBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE bindingSource1 AS Progress.Data.BindingSource NO-UNDO.
    DEFINE VAR qh AS HANDLE NO-UNDO.
        
    CONSTRUCTOR PUBLIC createCustomer (  ):
        
        
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
        THIS-OBJECT:customerNameLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerAddressLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerCityLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerNameTB = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:customerAddressTB = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:customerCityTB = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:saveBtn = NEW System.Windows.Forms.Button().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* customerNameLabel */
        /*  */
        THIS-OBJECT:customerNameLabel:Location = NEW System.Drawing.Point(13, 13).
        THIS-OBJECT:customerNameLabel:Name = "customerNameLabel".
        THIS-OBJECT:customerNameLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:customerNameLabel:TabIndex = 0.
        THIS-OBJECT:customerNameLabel:Text = "Name".
        THIS-OBJECT:customerNameLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* customerAddressLabel */
        /*  */
        THIS-OBJECT:customerAddressLabel:Location = NEW System.Drawing.Point(13, 36).
        THIS-OBJECT:customerAddressLabel:Name = "customerAddressLabel".
        THIS-OBJECT:customerAddressLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:customerAddressLabel:TabIndex = 1.
        THIS-OBJECT:customerAddressLabel:Text = "Address".
        THIS-OBJECT:customerAddressLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* customerCityLabel */
        /*  */
        THIS-OBJECT:customerCityLabel:Location = NEW System.Drawing.Point(13, 59).
        THIS-OBJECT:customerCityLabel:Name = "customerCityLabel".
        THIS-OBJECT:customerCityLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:customerCityLabel:TabIndex = 2.
        THIS-OBJECT:customerCityLabel:Text = "City".
        THIS-OBJECT:customerCityLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* customerNameTB */
        /*  */
        THIS-OBJECT:customerNameTB:Location = NEW System.Drawing.Point(65, 10).
        THIS-OBJECT:customerNameTB:Name = "customerNameTB".
        THIS-OBJECT:customerNameTB:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerNameTB:TabIndex = 3.
        /*  */
        /* customerAddressTB */
        /*  */
        THIS-OBJECT:customerAddressTB:Location = NEW System.Drawing.Point(65, 33).
        THIS-OBJECT:customerAddressTB:Name = "customerAddressTB".
        THIS-OBJECT:customerAddressTB:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerAddressTB:TabIndex = 4.
        /*  */
        /* customerCityTB */
        /*  */
        THIS-OBJECT:customerCityTB:Location = NEW System.Drawing.Point(65, 56).
        THIS-OBJECT:customerCityTB:Name = "customerCityTB".
        THIS-OBJECT:customerCityTB:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerCityTB:TabIndex = 5.
        /*  */
        /* saveBtn */
        /*  */
        THIS-OBJECT:saveBtn:Location = NEW System.Drawing.Point(311, 8).
        THIS-OBJECT:saveBtn:Name = "saveBtn".
        THIS-OBJECT:saveBtn:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:saveBtn:TabIndex = 6.
        THIS-OBJECT:saveBtn:Text = "Save".
        THIS-OBJECT:saveBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:saveBtn:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:saveBtn:Click:Subscribe(THIS-OBJECT:saveBtn_Click).
        /*  */
        /* createCustomer */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(398, 394).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:saveBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerCityTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerAddressTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerNameTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerCityLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerAddressLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerNameLabel).
        THIS-OBJECT:Name = "createCustomer".
        THIS-OBJECT:Text = "createCustomer".
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID saveBtn_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):

    DEFINE VARIABLE customerName AS CHARACTER NO-UNDO.
    DEFINE VARIABLE customerAddress AS CHARACTER NO-UNDO.
    DEFINE VARIABLE customerCity AS CHARACTER NO-UNDO.

/*    selectedColumn = STRING(THIS-OBJECT:filterComboBox:SelectedItem).*/
    customerName = THIS-OBJECT:customerNameTB:Text.
    customerAddress = THIS-OBJECT:customerAddressTB:Text.
    customerCity = THIS-OBJECT:customerCityTB:Text.
                                                         
    CREATE Customer.
        ASSIGN
            Customer.Name = customerName.
            Customer.Address = customerAddress.
            Customer.City = customerCity.
        

    IF ERROR-STATUS:ERROR THEN
        MESSAGE "Error creating customer: " ERROR-STATUS:GET-MESSAGE(1)
        VIEW-AS ALERT-BOX ERROR.
    ELSE DO:
        MESSAGE "Customer" Customer.Name "created successfully with number" Customer.CustNum
        VIEW-AS ALERT-BOX.
  /* Explicit commit is optional as Progress auto-commits when procedure ends */
  /* COMMIT. */
    END.
    RETURN.

    END METHOD.
    DESTRUCTOR PUBLIC createCustomer ( ):

    END DESTRUCTOR.

END CLASS.