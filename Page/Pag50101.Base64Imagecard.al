page 50131 "Base64 Image card"
{
    ApplicationArea = All;
    Caption = 'Base64 Image card';
    PageType = Card;
    SourceTable = "Base64 Image";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
                    MultiLine = true;
                }
                field("Import picture using media"; Rec."Import picture using media")
                {

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            // this action is used import image into table
            action(importMedia)
            {
                ApplicationArea = All;
                Caption = 'Import Media';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    FromFileName: text;
                    InstreamPic: InStream;
                begin
                    If UploadIntoStream('Import', '', '', FromFileName, InstreamPic) then begin
                        Rec."Import picture using media".ImportStream(InstreamPic, FromFileName);
                        Rec.Modify(true);
                    end;
                end;
            }
            action(ConvertPictureToEncodedText)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Base64Convert: Codeunit "Base64 Convert";
                    TenantMedia: Record "Tenant Media";
                    instr: InStream;
                begin
                    // convert from blob to base 64
                    TenantMedia.Get(rec."Import picture using media".Item(1));
                    TenantMedia.CalcFields(Content);
                    TenantMedia.Content.CreateInStream(instr, TextEncoding::UTF8);
                    LargeText := Base64Convert.ToBase64(instr, false);
                    // convert Base 64 to image
                    SetPictureinTextfileld(largetext);
                end;
            }
        }
    }

    var
        LargeText: text;

    procedure SetPictureinTextfileld(Picturetext: text)
    var
        outStream: OutStream;
        tempblob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        Recordref: RecordRef;

        texts: text;
    begin
        Clear(rec."Picture Encoded text");
        tempblob.CreateOutStream(outStream);
        rec."Picture Encoded text".CreateOutStream(outStream, TextEncoding::UTF8);
        Base64Convert.FromBase64(Picturetext, outStream);
        rec.Modify();
    end;
}
