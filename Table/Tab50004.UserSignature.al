table 50004 "User Signature"
{
    DataClassification = ToBeClassified;
    LookupPageId = "User Signature";
    fields
    {
        field(1; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(2; Signature; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
    }

    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }

    procedure CheckifSignatureExist(UserIDCode: Code[50]): Boolean
    var
        USign: Record "User Signature";
    begin
        USign.Reset();
        USign.SetRange("User ID", UserIDCode);
        exit(USign.FindFirst());
    end;

}