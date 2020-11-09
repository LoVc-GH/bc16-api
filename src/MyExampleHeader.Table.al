table 50200 "My Example Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20]) { }
        field(2; Description; Text[50]) { }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        MyExampleHeader: Record "My Example Header";
    begin
        if "No." = '' then
            if MyExampleHeader.FindLast() then
                "No." := IncStr(MyExampleHeader."No.")
            else
                "No." := 'HEADER0001';
    end;
}