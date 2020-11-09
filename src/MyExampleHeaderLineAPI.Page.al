page 50201 "My Example Header Line API"
{
    PageType = ListPart;

    SourceTable = "My Example Header Line";
    DelayedInsert = true;
    AutoSplitKey = true;
    PopulateAllFields = true;

    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(lines)
            {
                field(id; Format(SystemId, 0, 4).ToLower()) { ApplicationArea = All; }
                field(headerNo; "Header No.") { ApplicationArea = All; }
                field(headerId; "Header Id") { ApplicationArea = All; }
                field(lineNo; "Line No.") { ApplicationArea = All; }
                field(description; Description) { ApplicationArea = All; }
            }
        }
    }

    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        MyExampleHeader: Record "My Example Header";
        MyExampleHeaderLine: Record "My Example Header Line";
    begin
        if IsDeepInsert then begin
            MyExampleHeader.GetBySystemId("Header Id");
            "Header No." := MyExampleHeader."No.";
            MyExampleHeaderLine.SetRange("Header No.", "Header No.");
            if MyExampleHeaderLine.FindLast() then
                "Line No." := MyExampleHeaderLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyExampleHeader: Record "My Example Header";
    begin
        IsDeepInsert := IsNullGuid("Header Id");
        if not IsDeepInsert then begin
            MyExampleHeader.GetBySystemId("Header Id");
            "Header No." := MyExampleHeader."No.";
        end;
    end;
}