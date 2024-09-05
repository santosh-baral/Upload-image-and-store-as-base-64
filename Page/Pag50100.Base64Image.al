page 50130 Base64Image
{
    ApplicationArea = All;
    Caption = 'Base64Image';
    PageType = List;
    SourceTable = "Base64 Image";
    UsageCategory = Lists;
    CardPageId = "Base64 Image card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("N.O"; Rec."N.O")
                {
                    ToolTip = 'Specifies the value of the N.O field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Picture Encoded text"; Rec."Picture Encoded text")
                {
                    ToolTip = 'Specifies the value of the Picture Encoded text field.';
                }
                field("Import picture using media"; Rec."Import picture using media")
                {

                }
            }
        }
    }

}
