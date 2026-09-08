`timescale 1ns / 1ps

// Ideal functional model of leaf CF_DPRAM_core (8×16 async dual-port).
// Drop this file in place of hdl/gl/CF_DPRAM_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * SLP high → outputs 0, writes ignored
//   * WH writes DI[15:8] at ARW; WL writes DI[7:0] at ARW
//   * ENR high → DORO = mem[ARO]; else DORO = 0
//   * DORW always follows mem[ARW] when not in sleep
//   * TME is not modeled
// Keep-alive vpwrka and wells are unused in this digital model.

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

    reg [15:0] mem [0:7];
    integer i;
    initial begin
        for (i = 0; i < 8; i = i + 1)
            mem[i] = 16'h0000;
    end

    always @* begin
        if (!SLP) begin
            if (WL)
                mem[ARW][7:0] = DI[7:0];
            if (WH)
                mem[ARW][15:8] = DI[15:8];
        end
    end

    assign DORO = (SLP || !ENR) ? 16'h0000 : mem[ARO];
    assign DORW = SLP ? 16'h0000 : mem[ARW];
endmodule
