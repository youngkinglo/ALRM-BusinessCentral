/// <summary>
/// Page C4BC Extension API (ID 80006).
/// </summary>
page 80006 "C4BC Extension API"
{
    PageType = API;
    Caption = 'Extension API';
    APIPublisher = 'teamARTAAAE';
    APIGroup = 'extension';
    APIVersion = 'v1.0';
    EntityName = 'extension';
    EntitySetName = 'extensions';
    SourceTable = "C4BC Extension Header";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(rangeCode; Rec."Assignable Range Code")
                {
                    ApplicationArea = All;
                }
                field("code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(id; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                }
                part("Extension Objects"; "C4BC Extension Object API")
                {
                    ApplicationArea = All;
                    EntityName = 'extensionObject';
                    EntitySetName = 'extensionObjects';
                    SubPageLink = "Extension Code" = field(Code);
                }
            }
        }
    }

    [ServiceEnabled]
    /// <summary> 
    /// Create new object with specified name and type.
    /// </summary>
    /// <param name="ObjectType">Enum "C4BC Object Type", Specifies type of the object that should be registered.</param>
    /// <param name="ObjectName">Text[100], Specifies object name.</param>
    /// <param name="CreatedBy">Text[50], Specifies identification of user who required object registration.</param>
    /// <returns>Return variable "Integer", ID of the object.</returns>
    procedure CreateObject(ObjectType: Enum "C4BC Object Type"; ObjectName: Text[100]; CreatedBy: Text[50]): Integer
    var
        C4BCExtensionObject: Record "C4BC Extension Object";
    begin
        C4BCExtensionObject.SetRange("Extension Code", Rec.Code);
        C4BCExtensionObject.SetRange("Object Type", ObjectType);
        C4BCExtensionObject.SetRange("Object Name", ObjectName);
        if C4BCExtensionObject.FindFirst() then
            exit(C4BCExtensionObject."Object ID");

        C4BCExtensionObject.Init();
        C4BCExtensionObject."Extension Code" := Rec.Code;
        C4BCExtensionObject.Validate("Object Type", ObjectType);
        C4BCExtensionObject.Validate("Object Name", ObjectName);
        C4BCExtensionObject.Validate("Created By", CreatedBy);
        C4BCExtensionObject.Insert(true);
        exit(C4BCExtensionObject."Object ID");
    end;

    [ServiceEnabled]
    /// <summary> 
    /// Create new object with specified name and type.
    /// </summary>
    /// <param name="ObjectType">Enum "C4BC Object Type", Specifies type of the object that should be registered.</param>
    /// <param name="ObjectID">Integer, Specify object name.</param>
    /// <param name="ObjectName">Text[100], Specifies object name.</param>
    /// <param name="CreatedBy">Text[50], Specifies identification of user who required object registration.</param>
    /// <returns>Return variable "Integer", ID of the object.</returns>
    procedure CreateObjectWithOwnID(ObjectType: Enum "C4BC Object Type"; ObjectID: Integer; ObjectName: Text[100]; CreatedBy: Text[50])
    var
        C4BCExtensionObject: Record "C4BC Extension Object";
    begin
        C4BCExtensionObject.SetRange("Extension Code", Rec.Code);
        C4BCExtensionObject.SetRange("Object Type", ObjectType);
        C4BCExtensionObject.SetRange("Object ID", ObjectID);
        C4BCExtensionObject.SetRange("Object Name", ObjectName);
        if not C4BCExtensionObject.IsEmpty() then
            exit;

        C4BCExtensionObject.Init();
        C4BCExtensionObject."Extension Code" := Rec.Code;
        C4BCExtensionObject.Validate("Object Type", ObjectType);
        C4BCExtensionObject.Validate("Object ID", ObjectID);
        C4BCExtensionObject.Validate("Object Name", ObjectName);
        C4BCExtensionObject.Validate("Created By", CreatedBy);
        C4BCExtensionObject.Insert(true);
    end;

    [ServiceEnabled]
    /// <summary> 
    /// Create new object line with specified name.
    /// </summary>
    /// <param name="ObjectType">Enum "C4BC Object Type", Specifies type of the object that should be registered.</param>
    /// <param name="ObjectID">Integer, Specifies Object ID</param>
    /// <returns>Return variable "Integer", ID of the object line.</returns>
    procedure CreateObjectLine(ObjectType: Enum "C4BC Object Type"; ObjectID: Integer): Integer
    var
        C4BCExtensionObjectLine: Record "C4BC Extension Object Line";
    begin
        C4BCExtensionObjectLine.Init();
        C4BCExtensionObjectLine."Extension Code" := Rec."Code";
        C4BCExtensionObjectLine."Object Type" := ObjectType;
        C4BCExtensionObjectLine."Object ID" := ObjectID;
        C4BCExtensionObjectLine.Insert(true);
        exit(C4BCExtensionObjectLine.ID);
    end;
}