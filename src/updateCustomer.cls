 
 /*------------------------------------------------------------------------
    File        : updateCustomer
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

CLASS updateCustomer INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE filterComboBox AS System.Windows.Forms.ComboBox NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE stateLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE customerAddressTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerAddressLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE customerCityTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerCityLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE customerCountryTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerCountryLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE customerNameTB AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE customerNameLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE saveBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE selectedCustNum AS INTEGER NO-UNDO.


    CONSTRUCTOR PUBLIC updateCustomer (  ):
        
        SUPER().
        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

    METHOD PRIVATE VOID InitializeComponent():
        /* NOTE: The following method is automatically generated.
           We strongly suggest that the contents of this method only be modified using the
           Visual Designer to avoid any incompatible modifications. */
        
        THIS-OBJECT:customerNameLabel     = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerAddressLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerCityLabel    = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerCountryLabel    = NEW System.Windows.Forms.Label().
        THIS-OBJECT:customerNameTB       = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:customerAddressTB    = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:customerCityTB       = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:customerCountryTB       = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:saveBtn              = NEW System.Windows.Forms.Button().
        THIS-OBJECT:stateLabel         = NEW System.Windows.Forms.Label().
        THIS-OBJECT:filterComboBox       = NEW System.Windows.Forms.ComboBox().
    
        THIS-OBJECT:SuspendLayout().
    
        /* Configure Labels */
        THIS-OBJECT:customerNameLabel:Location = NEW System.Drawing.Point(13, 13).
        THIS-OBJECT:customerNameLabel:Name     = "customerNameLabel".
        THIS-OBJECT:customerNameLabel:Size     = NEW System.Drawing.Size(50, 23).
        THIS-OBJECT:customerNameLabel:TabIndex = 0.
        THIS-OBJECT:customerNameLabel:Text     = "Name".
        THIS-OBJECT:customerNameLabel:UseCompatibleTextRendering = TRUE.
    
        THIS-OBJECT:customerAddressLabel:Location = NEW System.Drawing.Point(13, 36).
        THIS-OBJECT:customerAddressLabel:Name     = "customerAddressLabel".
        THIS-OBJECT:customerAddressLabel:Size     = NEW System.Drawing.Size(50, 23).
        THIS-OBJECT:customerAddressLabel:TabIndex = 1.
        THIS-OBJECT:customerAddressLabel:Text     = "Address".
        THIS-OBJECT:customerAddressLabel:UseCompatibleTextRendering = TRUE.
    
        THIS-OBJECT:customerCityLabel:Location = NEW System.Drawing.Point(13, 59).
        THIS-OBJECT:customerCityLabel:Name     = "customerCityLabel".
        THIS-OBJECT:customerCityLabel:Size     = NEW System.Drawing.Size(50, 23).
        THIS-OBJECT:customerCityLabel:TabIndex = 2.
        THIS-OBJECT:customerCityLabel:Text     = "City".
        THIS-OBJECT:customerCityLabel:UseCompatibleTextRendering = TRUE.
        
        THIS-OBJECT:customerCountryLabel:Location = NEW System.Drawing.Point(13, 105).
        THIS-OBJECT:customerCountryLabel:Name     = "customerCountryLabel".
        THIS-OBJECT:customerCountryLabel:Size     = NEW System.Drawing.Size(50, 23).
        THIS-OBJECT:customerCountryLabel:TabIndex = 4.
        THIS-OBJECT:customerCountryLabel:Text     = "Country".
        THIS-OBJECT:customerCountryLabel:UseCompatibleTextRendering = TRUE.
    
        /* Configure TextBoxes */
        THIS-OBJECT:customerNameTB:Location = NEW System.Drawing.Point(65, 10).
        THIS-OBJECT:customerNameTB:Name     = "customerNameTB".
        THIS-OBJECT:customerNameTB:Size     = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerNameTB:TabIndex = 3.
    
        THIS-OBJECT:customerAddressTB:Location = NEW System.Drawing.Point(65, 33).
        THIS-OBJECT:customerAddressTB:Name     = "customerAddressTB".
        THIS-OBJECT:customerAddressTB:Size     = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerAddressTB:TabIndex = 4.
    
        THIS-OBJECT:customerCityTB:Location = NEW System.Drawing.Point(65, 56).
        THIS-OBJECT:customerCityTB:Name     = "customerCityTB".
        THIS-OBJECT:customerCityTB:Size     = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerCityTB:TabIndex = 5.
        
        THIS-OBJECT:customerCountryTB:Location = NEW System.Drawing.Point(65, 105).
        THIS-OBJECT:customerCountryTB:Name     = "customerCountryTB".
        THIS-OBJECT:customerCountryTB:Size     = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:customerCountryTB:TabIndex = 6.
    
        /* Configure Save Button */
        THIS-OBJECT:saveBtn:Location  = NEW System.Drawing.Point(311, 8).
        THIS-OBJECT:saveBtn:Name      = "saveBtn".
        THIS-OBJECT:saveBtn:Size      = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:saveBtn:TabIndex  = 7.
        THIS-OBJECT:saveBtn:Text      = "Save".
        THIS-OBJECT:saveBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:saveBtn:UseVisualStyleBackColor   = TRUE.
        THIS-OBJECT:saveBtn:Click:Subscribe(THIS-OBJECT:saveBtn_Click).
    
        /* Configure State Label */
        THIS-OBJECT:stateLabel:Location = NEW System.Drawing.Point(12, 83).
        THIS-OBJECT:stateLabel:Name     = "stateLabel".
        THIS-OBJECT:stateLabel:Size     = NEW System.Drawing.Size(50, 23).
        THIS-OBJECT:stateLabel:TabIndex = 8.
        THIS-OBJECT:stateLabel:Text     = "State".
        THIS-OBJECT:stateLabel:UseCompatibleTextRendering = TRUE.
    
        /* Configure ComboBox */
        THIS-OBJECT:filterComboBox:FormattingEnabled = TRUE.
        THIS-OBJECT:filterComboBox:Location = NEW System.Drawing.Point(65, 80).
        THIS-OBJECT:filterComboBox:Size     = NEW System.Drawing.Size(121, 21).
        THIS-OBJECT:filterComboBox:TabIndex = 9.
    
        DEFINE VARIABLE stateName AS CHARACTER NO-UNDO.
    
        FOR EACH State NO-LOCK:
            stateName = State.StateName.
            THIS-OBJECT:filterComboBox:Items:Add(stateName).
        END.
    
        /* Add Controls */
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerNameLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerAddressLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerCityLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerCountryLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerNameTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerAddressTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerCityTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:customerCountryTB).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:saveBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:stateLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:filterComboBox).
    
        /* Final Form Settings */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(450, 450).
        THIS-OBJECT:Name       = "updateCustomer".
        THIS-OBJECT:Text       = "updateCustomer".
    
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
    
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.
    
    METHOD PUBLIC VOID loadCustomerToUpdate(INPUT custNumFromTable AS INTEGER):
        DEFINE VARIABLE customerJson    AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerList    AS customerList NO-UNDO.
        DEFINE VARIABLE customerName    AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerAddress AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerCity    AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerState AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerCountry AS CHARACTER NO-UNDO.
        DEFINE VARIABLE i AS INTEGER NO-UNDO.
    
        customerList = NEW customerList().
        customerList:loadData("CustNum", STRING(custNumFromTable)).
        customerJson = customerList:getCustomerAsJson().
    
        customerName    = JsonHelper:getJsonValue(customerJson, "Name").
        customerName    = TRIM(REPLACE(customerName, '"', '')).
        customerAddress = JsonHelper:getJsonValue(customerJson, "Address").
        customerAddress = TRIM(REPLACE(customerAddress, '"', '')).
        customerCity    = JsonHelper:getJsonValue(customerJson, "City").
        customerCity    = TRIM(REPLACE(customerCity, '"', '')).
        customerState   = JsonHelper:getJsonValue(customerJson, "State").
        customerState = TRIM(REPLACE(customerState, '" }', '')).
        customerCountry = JsonHelper:getJsonValue(customerJson, "Country").
        customerCountry = TRIM(REPLACE(customerCountry, '" }', '')).
        
        THIS-OBJECT:customerNameTB:Text    = customerName.
        THIS-OBJECT:customerAddressTB:Text = customerAddress.
        THIS-OBJECT:customerCityTB:Text    = customerCity.
        THIS-OBJECT:customerCountryTB:Text = customerCountry.
        DO i = 0 TO THIS-OBJECT:filterComboBox:Items:Count - 1:
            IF TRIM(CAPS(STRING(THIS-OBJECT:filterComboBox:Items:Item[i]))) = TRIM(CAPS(customerState)) THEN DO:
                THIS-OBJECT:filterComboBox:SelectedIndex = i.
                LEAVE.
            END.
        END.
        THIS-OBJECT:selectedCustNum = custNumFromTable.
        RETURN.
    END METHOD.
        
    METHOD PRIVATE VOID saveBtn_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
    
        DEFINE VARIABLE customerName AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerAddress AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerCity AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerState AS CHARACTER NO-UNDO.
        DEFINE VARIABLE customerCountry AS CHARACTER NO-UNDO.
        
        customerName = THIS-OBJECT:customerNameTB:Text.
        customerAddress = THIS-OBJECT:customerAddressTB:Text.
        customerCity = THIS-OBJECT:customerCityTB:Text.
        customerState = STRING(THIS-OBJECT:filterComboBox:SelectedItem).
        customerCountry = THIS-OBJECT:customerCountryTB:Text.
        
        FIND FIRST Customer WHERE Customer.CustNum EQ THIS-OBJECT:selectedCustNum NO-ERROR.
        IF AVAILABLE Customer THEN DO:
        
            ASSIGN Customer.Name = customerName.
            ASSIGN Customer.Address = customerAddress.
            ASSIGN Customer.City = customerCity.
            ASSIGN Customer.State = customerState.
            ASSIGN Customer.Country = customerCountry.
            
        
        END.                                                     
  
    RETURN.
    END METHOD.
    
    DESTRUCTOR PUBLIC updateCustomer ( ):

    END DESTRUCTOR.

END CLASS.