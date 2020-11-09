page 50200 "My Example Header API"
{
    PageType = API;

    SourceTable = "My Example Header";
    APIPublisher = 'kef';
    APIGroup = 'test';
    APIVersion = 'v1.0';
    EntitySetName = 'headers';
    EntityName = 'header';
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(headers)
            {
                field(id; SystemId) { }
                field(headerNo; "No.") { }
                field(description; Description) { }
                part(lines; "My Example Header Line API")
                {
                    EntitySetName = 'headerslines';
                    EntityName = 'headersline';
                    SubPageLink = "Header Id" = field(SystemId);
                }
            }
        }
    }
}