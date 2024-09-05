table 50130 "Base64 Image"
{
    Caption = 'Base64 Image';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "N.O"; Code[20])
        {
            Caption = 'N.O';
        }
        field(2; Description; Text[20])
        {
            Caption = 'Description';
        }
        field(3; "Picture Encoded text"; Blob)
        {
            Caption = 'Picture Encoded text';
            Subtype = Bitmap;

        }
        field(4; "Import picture using media"; MediaSet)
        {
            Caption = 'Picture Encoded text';


        }
    }
    keys
    {
        key(PK; "N.O")
        {
            Clustered = true;
        }
    }


}
