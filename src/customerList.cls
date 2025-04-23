 
 /*------------------------------------------------------------------------
    File        : test1
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Karolis
    Created     : Thu Apr 17 09:34:04 EEST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

/*HANDLE  Reference to an object (like a class instance, useRef, or variable)                  */
/*BUFFER  Virtual row object (like a table model or object schema)                             */
/*QUERY   Database query object (similar to SQL query or API call setup)                       */
/*QUERY-PREPARE   Writing the query (like SQL or ORM query string)                             */
/*QUERY-OPEN  Running the query (fetching data)                                                */
/*bindingSource1:handle = qh  Binding query data to UI (like setting React state for rendering)*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS customerList INHERITS Form: 
    DEFINE BUFFER Customer FOR Customer.
    DEFINE PRIVATE VARIABLE clearBtn AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE Filter AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE filterByLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE filterComboBox AS System.Windows.Forms.ComboBox NO-UNDO.
    DEFINE PRIVATE VARIABLE filterTextBox AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PUBLIC VARIABLE  qh AS HANDLE NO-UNDO. 
    
    DEFINE PRIVATE VARIABLE cityDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE bindingSource1 AS Progress.Data.BindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE stateDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE nameDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE dataGridView1 AS System.Windows.Forms.DataGridView NO-UNDO.
    DEFINE PRIVATE VARIABLE custNumDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE countryDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.

    DEFINE PRIVATE VARIABLE dgCustomers AS HANDLE NO-UNDO.
    DEFINE PRIVATE VARIABLE queryHandle AS HANDLE NO-UNDO.    
        
    CONSTRUCTOR PUBLIC customerList (  ):
        
        SUPER().
        InitializeComponent().
        loadData("","").
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
        THIS-OBJECT:components = NEW System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("All Customers").
        THIS-OBJECT:dataGridView1 = NEW System.Windows.Forms.DataGridView().
        THIS-OBJECT:custNumDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:nameDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:cityDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:stateDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:countryDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:bindingSource1 = NEW Progress.Data.BindingSource(THIS-OBJECT:components).
        THIS-OBJECT:filterByLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:filterTextBox = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:Filter = NEW System.Windows.Forms.Button().
        THIS-OBJECT:filterComboBox = NEW System.Windows.Forms.ComboBox().
        THIS-OBJECT:clearBtn = NEW System.Windows.Forms.Button().
        CAST(THIS-OBJECT:dataGridView1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* dataGridView1 */
        /*  */
        THIS-OBJECT:dataGridView1:AutoGenerateColumns = FALSE.
        THIS-OBJECT:dataGridView1:ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode:AutoSize.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS System.Windows.Forms.DataGridViewColumn EXTENT 5 NO-UNDO.
        arrayvar0[1] = THIS-OBJECT:custNumDataGridViewTextBoxColumn.
        arrayvar0[2] = THIS-OBJECT:nameDataGridViewTextBoxColumn.
        arrayvar0[3] = THIS-OBJECT:cityDataGridViewTextBoxColumn.
        arrayvar0[4] = THIS-OBJECT:stateDataGridViewTextBoxColumn.
        arrayvar0[5] = THIS-OBJECT:countryDataGridViewTextBoxColumn.
        THIS-OBJECT:dataGridView1:Columns:AddRange(arrayvar0).
        THIS-OBJECT:dataGridView1:DataSource = THIS-OBJECT:bindingSource1.
        THIS-OBJECT:dataGridView1:Location = NEW System.Drawing.Point(13, 33).
        THIS-OBJECT:dataGridView1:Name = "dataGridView1".
        THIS-OBJECT:dataGridView1:Size = NEW System.Drawing.Size(600, 600).
        THIS-OBJECT:dataGridView1:TabIndex = 0.
        /*  */
        /* custNumDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:custNumDataGridViewTextBoxColumn:DataPropertyName = "CustNum".
        THIS-OBJECT:custNumDataGridViewTextBoxColumn:HeaderText = "Cust Num".
        THIS-OBJECT:custNumDataGridViewTextBoxColumn:Name = "custNumDataGridViewTextBoxColumn".
        /*  */
        /* nameDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:nameDataGridViewTextBoxColumn:DataPropertyName = "Name".
        THIS-OBJECT:nameDataGridViewTextBoxColumn:HeaderText = "Name".
        THIS-OBJECT:nameDataGridViewTextBoxColumn:Name = "nameDataGridViewTextBoxColumn".
        /*  */
        /* cityDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:cityDataGridViewTextBoxColumn:DataPropertyName = "City".
        THIS-OBJECT:cityDataGridViewTextBoxColumn:HeaderText = "City".
        THIS-OBJECT:cityDataGridViewTextBoxColumn:Name = "cityDataGridViewTextBoxColumn".
        /*  */
        /* stateDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:stateDataGridViewTextBoxColumn:DataPropertyName = "State".
        THIS-OBJECT:stateDataGridViewTextBoxColumn:HeaderText = "State".
        THIS-OBJECT:stateDataGridViewTextBoxColumn:Name = "stateDataGridViewTextBoxColumn".
        /*  */
        /* countryDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:countryDataGridViewTextBoxColumn:DataPropertyName = "Country".
        THIS-OBJECT:countryDataGridViewTextBoxColumn:HeaderText = "Country".
        THIS-OBJECT:countryDataGridViewTextBoxColumn:Name = "countryDataGridViewTextBoxColumn".
        /*  */
        /* bindingSource1 */
        /*  */
        THIS-OBJECT:bindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:bindingSource1:NoLOBs = FALSE.
        THIS-OBJECT:bindingSource1:Position = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar1 AS "Progress.Data.TableDesc[]" NO-UNDO.
        arrayvar1 = NEW "Progress.Data.TableDesc[]"(0).
        tableDesc1:ChildTables = arrayvar1.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar2 AS Progress.Data.ColumnPropDesc EXTENT 5 NO-UNDO.
        arrayvar2[1] = NEW Progress.Data.ColumnPropDesc("CustNum", "Cust Num", Progress.Data.DataType:INTEGER).
        arrayvar2[2] = NEW Progress.Data.ColumnPropDesc("Name", "Name", Progress.Data.DataType:CHARACTER).
        arrayvar2[3] = NEW Progress.Data.ColumnPropDesc("City", "City", Progress.Data.DataType:CHARACTER).
        arrayvar2[4] = NEW Progress.Data.ColumnPropDesc("State", "State", Progress.Data.DataType:CHARACTER).
        arrayvar2[5] = NEW Progress.Data.ColumnPropDesc("Country", "Country", Progress.Data.DataType:CHARACTER).
        tableDesc1:Columns = arrayvar2.
        THIS-OBJECT:bindingSource1:TableSchema = tableDesc1.
        /*  */
        /* filterByLabel */
        /*  */
        THIS-OBJECT:filterByLabel:Location = NEW System.Drawing.Point(619, 16).
        THIS-OBJECT:filterByLabel:Name = "filterByLabel".
        THIS-OBJECT:filterByLabel:Size = NEW System.Drawing.Size(100, 14).
        THIS-OBJECT:filterByLabel:TabIndex = 1.
        THIS-OBJECT:filterByLabel:Text = "Filter by:".
        THIS-OBJECT:filterByLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* filterTextBox */
        /*  */
        THIS-OBJECT:filterTextBox:Location = NEW System.Drawing.Point(619, 60).
        THIS-OBJECT:filterTextBox:Name = "filterTextBox".
        THIS-OBJECT:filterTextBox:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:filterTextBox:TabIndex = 2.
        /*  */
        /* Filter */
        /*  */
        THIS-OBJECT:Filter:Location = NEW System.Drawing.Point(619, 86).
        THIS-OBJECT:Filter:Name = "Filter".
        THIS-OBJECT:Filter:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:Filter:TabIndex = 3.
        THIS-OBJECT:Filter:Text = "Filter".
        THIS-OBJECT:Filter:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:Filter:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:Filter:Click:Subscribe(THIS-OBJECT:Filter_Click).
        /*  */
        /* filterComboBox */
        /*  */
        THIS-OBJECT:filterComboBox:FormattingEnabled = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar3 AS System.Object EXTENT 5 NO-UNDO.
        arrayvar3[1] = "CustNum".
        arrayvar3[2] = "Name".
        arrayvar3[3] = "City".
        arrayvar3[4] = "State".
        arrayvar3[5] = "Country".
        THIS-OBJECT:filterComboBox:Items:AddRange(arrayvar3).
        THIS-OBJECT:filterComboBox:Location = NEW System.Drawing.Point(619, 33).
        THIS-OBJECT:filterComboBox:Name = "filterComboBox".
        THIS-OBJECT:filterComboBox:Size = NEW System.Drawing.Size(121, 21).
        THIS-OBJECT:filterComboBox:TabIndex = 4.
        /*  */
        /* clearBtn */
        /*  */
        THIS-OBJECT:clearBtn:Location = NEW System.Drawing.Point(619, 116).
        THIS-OBJECT:clearBtn:Name = "clearBtn".
        THIS-OBJECT:clearBtn:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:clearBtn:TabIndex = 5.
        THIS-OBJECT:clearBtn:Text = "Clear".
        THIS-OBJECT:clearBtn:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:clearBtn:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:clearBtn:Click:Subscribe(THIS-OBJECT:clearBtn_Click).
        /*  */
        /* clientList */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(800, 600).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:clearBtn).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:filterComboBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:Filter).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:filterTextBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:filterByLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:dataGridView1).
        THIS-OBJECT:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:Name = "clientList".
        THIS-OBJECT:Text = "clientList".
        THIS-OBJECT:Load:Subscribe(THIS-OBJECT:clientList_Load).
        CAST(THIS-OBJECT:dataGridView1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    METHOD PRIVATE VOID clientList_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        
        RETURN.

    END METHOD.

    METHOD PRIVATE VOID clearBtn_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        
        THIS-OBJECT:filterTextBox:Text=''.
        THIS-OBJECT:filterComboBox:SelectedIndex = 1.
        loadData("","").
        RETURN.

    END METHOD.

    METHOD PRIVATE VOID Filter_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        DEFINE VARIABLE selectedColumn AS CHARACTER NO-UNDO.
        DEFINE VARIABLE inputValue     AS CHARACTER NO-UNDO.

        selectedColumn = STRING(THIS-OBJECT:filterComboBox:SelectedItem).
        inputValue     = THIS-OBJECT:filterTextBox:Text.
        
        loadData(selectedColumn, inputValue).
        RETURN.

    END METHOD.

    METHOD PUBLIC INTEGER GetSelectedCustNum():
        DEFINE VARIABLE custNum AS INTEGER NO-UNDO.
        DEFINE VARIABLE selectedRow AS System.Windows.Forms.DataGridViewRow NO-UNDO.

        IF VALID-OBJECT(THIS-OBJECT:dataGridView1) AND
           THIS-OBJECT:dataGridView1:SelectedRows:Count > 0 THEN DO:

            selectedRow = CAST(THIS-OBJECT:dataGridView1:SelectedRows[0], System.Windows.Forms.DataGridViewRow).

            IF VALID-OBJECT(selectedRow) THEN DO:
                custNum = INTEGER(STRING(selectedRow:Cells[0]:Value)).

            END.
        END.

        RETURN custNum.
    END METHOD.

    METHOD PUBLIC VOID loadData(INPUT columnName AS CHARACTER, INPUT filterValue AS CHARACTER):
        IF VALID-HANDLE(qh) THEN DO:
            qh:QUERY-CLOSE().
            DELETE OBJECT qh.
        END.
    
        CREATE QUERY qh.
        qh:SET-BUFFERS(BUFFER Customer:HANDLE).
    
        DEFINE VARIABLE queryStr AS CHARACTER NO-UNDO.
    
        IF TRIM(filterValue) = "" OR filterValue = ? THEN DO:
            queryStr = "FOR EACH Customer BY Customer.CustNum DESCENDING".
        END.
        ELSE DO:
            IF LOOKUP(columnName, "CustNum") > 0 THEN DO:
                queryStr = SUBSTITUTE("FOR EACH Customer WHERE Customer.&1 = &2 BY Customer.CustNum DESCENDING", columnName, filterValue).
            END.
            ELSE DO:
                queryStr = SUBSTITUTE("FOR EACH Customer WHERE Customer.&1 = '&2' BY Customer.CustNum DESCENDING", columnName, filterValue).
            END.
        END.
    
        qh:QUERY-PREPARE(queryStr).
        qh:QUERY-OPEN().
    
        bindingSource1:Handle = qh.
    END METHOD.

    METHOD PUBLIC LONGCHAR getCustomerAsJson():
        DEFINE VARIABLE customerJson AS LONGCHAR NO-UNDO.
    
        IF AVAILABLE Customer THEN DO:
           
        customerJson = SUBSTITUTE(
            "~{ ""CustNum"": &1, ""Name"": ""&2"", ""Address"": ""&3"", ""Phone"": ""&4"", ""City"": ""&5"", ""State"": ""&6"", ""Country"": ""&7"" ~}",
            Customer.CustNum,
            IF Customer.Name = "" THEN "" ELSE REPLACE(Customer.Name, '"', '\"'),
            IF Customer.Address = "" THEN "" ELSE REPLACE(Customer.Address, '"', '\"'),
            IF Customer.Phone = "" THEN "" ELSE REPLACE(Customer.Phone, '"', '\"'),
            IF Customer.City = "" THEN "" ELSE REPLACE(Customer.City, '"', '\"'),
            IF Customer.State = "" THEN "" ELSE REPLACE(Customer.State, '"', '\"'),
            IF Customer.Country = "" THEN "" ELSE REPLACE(Customer.Country, '"', '\"')
        ).
    
        END.
        ELSE DO:
            customerJson = '~{ "error": "Customer not found" ~}'.
        END.
    
        RETURN customerJson.
    END METHOD.

    DESTRUCTOR PUBLIC customerList ( ):
        IF VALID-HANDLE(qh) THEN DO: 
            qh:QUERY-CLOSE().
            DELETE OBJECT qh.
        END.    
    END DESTRUCTOR.

END CLASS.