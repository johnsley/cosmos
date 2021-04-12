pageextension 50001 "User Setup" extends "User Setup"
{

    actions
    {

        addfirst(Processing)
        {
            action(Signature)
            {
                ApplicationArea = All;
                Caption = 'Append Signature', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SignUp;
                trigger OnAction()
                var
                    Usign: Record "User Signature";
                begin
                    Usign.Reset();
                    Usign.SetRange("User ID", Rec."User ID");
                    if Usign.FindFirst() then
                        Page.Run(Page::"User Signature", Usign)
                    else begin
                        Usign.Init();
                        Usign."User ID" := Rec."User ID";
                        if Usign.Insert(true) then
                            Page.Run(Page::"User Signature", Usign);
                    end;
                end;
            }
        }
    }
}