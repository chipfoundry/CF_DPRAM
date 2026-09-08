// Empty blackbox stub for hierarchical integration LVS.
module CF_DPRAM_core (
    ARO,
    ARW,
    WL,
    WH,
    ENR,
    DI,
    DORO,
    DORW,
    SLP,
    TME,
    vpwr,
    vpwrka,
    vpb,
    vgnd,
    vnb
);
    input [2:0] ARO;
    input [2:0] ARW;
    input WL;
    input WH;
    input ENR;
    input [15:0] DI;
    output [15:0] DORO;
    output [15:0] DORW;
    input SLP;
    input TME;
    input vpwr;
    input vpwrka;
    input vpb;
    input vgnd;
    input vnb;
endmodule
