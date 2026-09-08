// Structural PG wrapper. Analog leaf is CF_DPRAM_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_DPRAM (
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
    vgnd
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
    input vgnd;
    CF_DPRAM_core u_core (
        .ARO(ARO),
        .ARW(ARW),
        .WL(WL),
        .WH(WH),
        .ENR(ENR),
        .DI(DI),
        .DORO(DORO),
        .DORW(DORW),
        .SLP(SLP),
        .TME(TME),
        .vpwr(vpwr),
        .vpwrka(vpwrka),
        .vpb(vpwr),
        .vgnd(vgnd),
        .vnb(vgnd)
    );
endmodule
