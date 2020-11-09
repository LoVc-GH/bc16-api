table 50201 "My Example Header Line"
{
    fields
    {
        field(1; "Header No."; Code[20])
        {
            TableRelation = "My Example Header"."No.";
        }
        field(2; "Line No."; Integer) { }
        field(3; "Header Id"; Guid)
        {
            TableRelation = "My Example Header".SystemId;
        }
        field(4; Description; Text[50]) { }
    }

    keys
    {
        key(PK; "Header No.", "Line No.")
        {
            Clustered = true;
        }
    }
}