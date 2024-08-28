/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Aug 26 19:51:07 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X4M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X4M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X4M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X4M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X4M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X2M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;


  AO2B2X2M U1 ( .B0(SEL), .B1(IN_1), .A0(IN_0), .A1N(SEL), .Y(OUT) );
endmodule


module DATA_SYNC_BUS_WIDTH8 ( CLK, RST, BUS_EN, UN_SYNC_BUS, EN_PULSE, 
        SYNC_BUS );
  input [7:0] UN_SYNC_BUS;
  output [7:0] SYNC_BUS;
  input CLK, RST, BUS_EN;
  output EN_PULSE;
  wire   n18, n19, n20, SYNC_BUS_EN, PULSE_GEN_OUT, N1, n2, n3, n4, n5, n6, n7,
         n8, n9, n1, n11, n13, n15, n16, n17;
  wire   [1:0] stages;

  DFFRQX2M \SYNC_BUS_reg[5]  ( .D(n7), .CK(CLK), .RN(n16), .Q(SYNC_BUS[5]) );
  DFFRQX2M \SYNC_BUS_reg[7]  ( .D(n9), .CK(CLK), .RN(n16), .Q(SYNC_BUS[7]) );
  DFFRQX2M \SYNC_BUS_reg[3]  ( .D(n5), .CK(CLK), .RN(n16), .Q(SYNC_BUS[3]) );
  DFFRQX2M \SYNC_BUS_reg[1]  ( .D(n3), .CK(CLK), .RN(n16), .Q(SYNC_BUS[1]) );
  DFFRQX1M \stages_reg[1]  ( .D(stages[0]), .CK(CLK), .RN(n16), .Q(stages[1])
         );
  DFFRQX1M SYNC_BUS_EN_reg ( .D(stages[1]), .CK(CLK), .RN(n16), .Q(SYNC_BUS_EN) );
  DFFRQX1M PULSE_GEN_OUT_reg ( .D(SYNC_BUS_EN), .CK(CLK), .RN(n16), .Q(
        PULSE_GEN_OUT) );
  DFFRQX1M EN_PULSE_reg ( .D(N1), .CK(CLK), .RN(n16), .Q(EN_PULSE) );
  DFFRQX1M \SYNC_BUS_reg[6]  ( .D(n8), .CK(CLK), .RN(n16), .Q(n18) );
  DFFRQX1M \SYNC_BUS_reg[2]  ( .D(n4), .CK(CLK), .RN(n16), .Q(n19) );
  DFFRQX1M \SYNC_BUS_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(n20) );
  DFFRQX1M \stages_reg[0]  ( .D(BUS_EN), .CK(CLK), .RN(n16), .Q(stages[0]) );
  DFFRQX4M \SYNC_BUS_reg[4]  ( .D(n6), .CK(CLK), .RN(n16), .Q(SYNC_BUS[4]) );
  BUFX4M U3 ( .A(SYNC_BUS_EN), .Y(n15) );
  INVXLM U4 ( .A(n20), .Y(n1) );
  INVX4M U5 ( .A(n1), .Y(SYNC_BUS[0]) );
  INVXLM U6 ( .A(n18), .Y(n11) );
  INVX4M U7 ( .A(n11), .Y(SYNC_BUS[6]) );
  INVXLM U8 ( .A(n19), .Y(n13) );
  INVX4M U9 ( .A(n13), .Y(SYNC_BUS[2]) );
  BUFX6M U10 ( .A(RST), .Y(n16) );
  INVX4M U11 ( .A(n15), .Y(n17) );
  NOR2X2M U12 ( .A(PULSE_GEN_OUT), .B(n17), .Y(N1) );
  AO22X1M U13 ( .A0(UN_SYNC_BUS[2]), .A1(n15), .B0(SYNC_BUS[2]), .B1(n17), .Y(
        n4) );
  AO22X1M U14 ( .A0(UN_SYNC_BUS[0]), .A1(n15), .B0(SYNC_BUS[0]), .B1(n17), .Y(
        n2) );
  AO22X1M U15 ( .A0(UN_SYNC_BUS[4]), .A1(n15), .B0(SYNC_BUS[4]), .B1(n17), .Y(
        n6) );
  AO22X1M U16 ( .A0(UN_SYNC_BUS[6]), .A1(n15), .B0(SYNC_BUS[6]), .B1(n17), .Y(
        n8) );
  AO22X1M U17 ( .A0(UN_SYNC_BUS[1]), .A1(n15), .B0(SYNC_BUS[1]), .B1(n17), .Y(
        n3) );
  AO22X1M U18 ( .A0(UN_SYNC_BUS[3]), .A1(n15), .B0(SYNC_BUS[3]), .B1(n17), .Y(
        n5) );
  AO22X1M U19 ( .A0(UN_SYNC_BUS[7]), .A1(n15), .B0(SYNC_BUS[7]), .B1(n17), .Y(
        n9) );
  AO22X1M U20 ( .A0(UN_SYNC_BUS[5]), .A1(n15), .B0(SYNC_BUS[5]), .B1(n17), .Y(
        n7) );
endmodule


module SYS_CTRL_DATA_WIDTH8_ADDRESS_WIDTH4_FUN_WIDTH4_ALU_OUT_WIDTH16 ( CLK, 
        RST, RX_P_DATA, RX_DATA_VALID, RD_DATA, RD_DATA_VALID, ALU_OUT, 
        ALU_OUT_VALID, FIFO_FULL, ALU_FUN, ALU_EN, CLK_GATE_EN, ADDRESS, WR_EN, 
        RD_EN, WR_DATA, TX_P_Data, TX_DATA_VALID, CLK_DIV_EN );
  input [7:0] RX_P_DATA;
  input [7:0] RD_DATA;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] ADDRESS;
  output [7:0] WR_DATA;
  output [7:0] TX_P_Data;
  input CLK, RST, RX_DATA_VALID, RD_DATA_VALID, ALU_OUT_VALID, FIFO_FULL;
  output ALU_EN, CLK_GATE_EN, WR_EN, RD_EN, TX_DATA_VALID, CLK_DIV_EN;
  wire   n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n1, n3, n5, n7, n9, n11, n33, n35, n39, n40, n41, n42,
         n43, n44, n45, n47, n48, n49, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  assign CLK_DIV_EN = 1'b1;

  OAI32X4M U12 ( .A0(n68), .A1(n69), .A2(n70), .B0(n41), .B1(n71), .Y(n55) );
  NOR3X12M U47 ( .A(n135), .B(n128), .C(n75), .Y(n81) );
  DFFRX1M \ALU_OUT_REG_reg[7]  ( .D(n101), .CK(CLK), .RN(n48), .QN(n24) );
  DFFRX1M \ALU_OUT_REG_reg[6]  ( .D(n100), .CK(CLK), .RN(n48), .QN(n25) );
  DFFRX1M \ALU_OUT_REG_reg[5]  ( .D(n99), .CK(CLK), .RN(n48), .QN(n26) );
  DFFRX1M \ALU_OUT_REG_reg[4]  ( .D(n98), .CK(CLK), .RN(n48), .QN(n27) );
  DFFRX1M \ALU_OUT_REG_reg[3]  ( .D(n97), .CK(CLK), .RN(n48), .QN(n28) );
  DFFRX1M \ALU_OUT_REG_reg[2]  ( .D(n96), .CK(CLK), .RN(n48), .QN(n29) );
  DFFRX1M \ALU_OUT_REG_reg[1]  ( .D(n95), .CK(CLK), .RN(n48), .QN(n30) );
  DFFRX1M \ALU_OUT_REG_reg[0]  ( .D(n94), .CK(CLK), .RN(n48), .QN(n31) );
  DFFRX1M \ALU_OUT_REG_reg[15]  ( .D(n109), .CK(CLK), .RN(n47), .QN(n16) );
  DFFRX1M \ALU_OUT_REG_reg[14]  ( .D(n108), .CK(CLK), .RN(n47), .QN(n17) );
  DFFRX1M \ALU_OUT_REG_reg[13]  ( .D(n107), .CK(CLK), .RN(n47), .QN(n18) );
  DFFRX1M \ALU_OUT_REG_reg[12]  ( .D(n106), .CK(CLK), .RN(n47), .QN(n19) );
  DFFRX1M \ALU_OUT_REG_reg[11]  ( .D(n105), .CK(CLK), .RN(n47), .QN(n20) );
  DFFRX1M \ALU_OUT_REG_reg[10]  ( .D(n104), .CK(CLK), .RN(n47), .QN(n21) );
  DFFRX1M \ALU_OUT_REG_reg[9]  ( .D(n103), .CK(CLK), .RN(n47), .QN(n22) );
  DFFRX1M \ALU_OUT_REG_reg[8]  ( .D(n102), .CK(CLK), .RN(n47), .QN(n23) );
  DFFRX1M \ADDRESS_REG_reg[0]  ( .D(n110), .CK(CLK), .RN(n47), .QN(n15) );
  DFFRX1M \ADDRESS_REG_reg[2]  ( .D(n112), .CK(CLK), .RN(n47), .QN(n13) );
  DFFRX1M \ADDRESS_REG_reg[1]  ( .D(n111), .CK(CLK), .RN(n47), .QN(n14) );
  DFFRX1M \ADDRESS_REG_reg[3]  ( .D(n113), .CK(CLK), .RN(n47), .QN(n12) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(n48), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n48), .Q(
        current_state[2]) );
  DFFRQX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n48), .Q(
        current_state[1]) );
  DFFRX4M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n128) );
  NAND2X2M U3 ( .A(RX_P_DATA[3]), .B(n40), .Y(n79) );
  NOR2X4M U4 ( .A(n133), .B(current_state[3]), .Y(n92) );
  NAND3X4M U5 ( .A(current_state[0]), .B(n92), .C(current_state[2]), .Y(n71)
         );
  NAND2XLM U6 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .Y(n68) );
  INVXLM U7 ( .A(n153), .Y(n1) );
  INVX4M U8 ( .A(n1), .Y(TX_P_Data[0]) );
  OAI222X1M U9 ( .A0(n31), .A1(n87), .B0(n23), .B1(n88), .C0(n42), .C1(n124), 
        .Y(n153) );
  INVXLM U10 ( .A(n152), .Y(n3) );
  INVX4M U11 ( .A(n3), .Y(TX_P_Data[1]) );
  OAI222X1M U13 ( .A0(n30), .A1(n87), .B0(n22), .B1(n88), .C0(n42), .C1(n123), 
        .Y(n152) );
  INVXLM U14 ( .A(n151), .Y(n5) );
  INVX4M U15 ( .A(n5), .Y(TX_P_Data[2]) );
  OAI222X1M U16 ( .A0(n29), .A1(n87), .B0(n21), .B1(n88), .C0(n42), .C1(n122), 
        .Y(n151) );
  INVXLM U17 ( .A(n150), .Y(n7) );
  INVX4M U18 ( .A(n7), .Y(TX_P_Data[3]) );
  OAI222X1M U19 ( .A0(n28), .A1(n87), .B0(n20), .B1(n88), .C0(n42), .C1(n121), 
        .Y(n150) );
  INVXLM U20 ( .A(n149), .Y(n9) );
  INVX4M U21 ( .A(n9), .Y(TX_P_Data[4]) );
  OAI222X1M U22 ( .A0(n27), .A1(n87), .B0(n19), .B1(n88), .C0(n42), .C1(n120), 
        .Y(n149) );
  INVXLM U23 ( .A(n148), .Y(n11) );
  INVX4M U24 ( .A(n11), .Y(TX_P_Data[5]) );
  OAI222X1M U25 ( .A0(n26), .A1(n87), .B0(n18), .B1(n88), .C0(n42), .C1(n119), 
        .Y(n148) );
  INVXLM U26 ( .A(n147), .Y(n33) );
  INVX4M U27 ( .A(n33), .Y(TX_P_Data[6]) );
  OAI222X1M U28 ( .A0(n25), .A1(n87), .B0(n17), .B1(n88), .C0(n42), .C1(n118), 
        .Y(n147) );
  INVXLM U29 ( .A(n146), .Y(n35) );
  INVX4M U30 ( .A(n35), .Y(TX_P_Data[7]) );
  OAI222X1M U31 ( .A0(n24), .A1(n87), .B0(n16), .B1(n88), .C0(n42), .C1(n117), 
        .Y(n146) );
  CLKBUFX6M U32 ( .A(n143), .Y(ADDRESS[3]) );
  OAI22X1M U33 ( .A0(n66), .A1(n79), .B0(n12), .B1(n93), .Y(n143) );
  BUFX6M U34 ( .A(n144), .Y(ADDRESS[2]) );
  OAI22X1M U35 ( .A0(n66), .A1(n83), .B0(n13), .B1(n93), .Y(n144) );
  NOR2X4M U36 ( .A(n71), .B(n79), .Y(ALU_FUN[3]) );
  NOR2X4M U37 ( .A(n71), .B(n83), .Y(ALU_FUN[2]) );
  NOR2X4M U38 ( .A(n71), .B(n85), .Y(ALU_FUN[0]) );
  NOR2X4M U39 ( .A(n71), .B(n84), .Y(ALU_FUN[1]) );
  OAI21X2M U40 ( .A0(FIFO_FULL), .A1(n91), .B0(n42), .Y(TX_DATA_VALID) );
  INVX2M U41 ( .A(current_state[2]), .Y(n132) );
  NAND2X2M U42 ( .A(n86), .B(current_state[0]), .Y(n52) );
  NOR2X2M U43 ( .A(n75), .B(current_state[0]), .Y(n76) );
  INVX2M U44 ( .A(RX_P_DATA[5]), .Y(n137) );
  INVX2M U45 ( .A(WR_EN), .Y(n126) );
  INVX2M U46 ( .A(n50), .Y(n131) );
  NOR2X4M U48 ( .A(n135), .B(n82), .Y(WR_EN) );
  OR2X2M U49 ( .A(n56), .B(n135), .Y(n93) );
  INVX4M U50 ( .A(n41), .Y(n135) );
  NAND2X4M U51 ( .A(n59), .B(n114), .Y(n87) );
  INVX2M U52 ( .A(n81), .Y(n125) );
  CLKBUFX8M U53 ( .A(n115), .Y(n44) );
  CLKBUFX6M U54 ( .A(n115), .Y(n43) );
  BUFX4M U55 ( .A(n115), .Y(n45) );
  INVX2M U56 ( .A(FIFO_FULL), .Y(n114) );
  INVX6M U57 ( .A(n49), .Y(n47) );
  INVX6M U58 ( .A(n49), .Y(n48) );
  NOR2X4M U59 ( .A(n131), .B(n128), .Y(n59) );
  NOR2X4M U60 ( .A(n134), .B(n60), .Y(n50) );
  NOR2X2M U61 ( .A(n59), .B(n90), .Y(n91) );
  NAND2X2M U62 ( .A(n133), .B(n132), .Y(n60) );
  NAND3X2M U63 ( .A(n71), .B(n131), .C(n91), .Y(CLK_GATE_EN) );
  INVX4M U64 ( .A(n39), .Y(n40) );
  AND3X4M U65 ( .A(n74), .B(n52), .C(n56), .Y(n82) );
  NAND3X2M U66 ( .A(n128), .B(n132), .C(n92), .Y(n56) );
  NAND2BX2M U67 ( .AN(n60), .B(n134), .Y(n75) );
  OAI211X2M U68 ( .A0(n41), .A1(n56), .B0(n129), .C0(n57), .Y(next_state[1])
         );
  AOI211X2M U69 ( .A0(n41), .A1(n58), .B0(n127), .C0(n59), .Y(n57) );
  INVX2M U70 ( .A(n61), .Y(n129) );
  OAI21X2M U71 ( .A0(n60), .A1(n128), .B0(n52), .Y(n58) );
  NOR2X2M U72 ( .A(n138), .B(n126), .Y(WR_DATA[4]) );
  NOR2X2M U73 ( .A(n137), .B(n126), .Y(WR_DATA[5]) );
  NOR2X2M U74 ( .A(n136), .B(n126), .Y(WR_DATA[7]) );
  NAND2X2M U75 ( .A(n76), .B(n40), .Y(n70) );
  INVX4M U76 ( .A(n39), .Y(n41) );
  NOR2X2M U77 ( .A(n82), .B(n85), .Y(WR_DATA[0]) );
  NOR2X2M U78 ( .A(n82), .B(n84), .Y(WR_DATA[1]) );
  NOR2X2M U79 ( .A(n82), .B(n83), .Y(WR_DATA[2]) );
  NAND2X4M U80 ( .A(n90), .B(n114), .Y(n88) );
  NOR2X4M U81 ( .A(n66), .B(n135), .Y(RD_EN) );
  NOR2X2M U82 ( .A(n82), .B(n79), .Y(WR_DATA[3]) );
  INVX2M U83 ( .A(n74), .Y(n127) );
  NOR4X2M U84 ( .A(n136), .B(n141), .C(n137), .D(n79), .Y(n78) );
  NOR4X2M U85 ( .A(n142), .B(n138), .C(n141), .D(n137), .Y(n73) );
  OAI21X2M U86 ( .A0(n128), .A1(n75), .B0(n52), .Y(n65) );
  INVX2M U87 ( .A(n62), .Y(n115) );
  OR2X2M U88 ( .A(ALU_EN), .B(n50), .Y(next_state[3]) );
  NOR2X2M U89 ( .A(n135), .B(n71), .Y(ALU_EN) );
  INVX2M U90 ( .A(RST), .Y(n49) );
  INVX2M U91 ( .A(current_state[1]), .Y(n133) );
  INVX2M U92 ( .A(current_state[3]), .Y(n134) );
  NOR4X4M U93 ( .A(n133), .B(n134), .C(current_state[0]), .D(current_state[2]), 
        .Y(n90) );
  NAND2X2M U94 ( .A(RX_P_DATA[2]), .B(n40), .Y(n83) );
  NAND2X2M U95 ( .A(RX_P_DATA[0]), .B(n40), .Y(n85) );
  NAND2X2M U96 ( .A(RX_P_DATA[1]), .B(n40), .Y(n84) );
  INVX2M U97 ( .A(RX_DATA_VALID), .Y(n39) );
  NOR3X4M U98 ( .A(current_state[1]), .B(current_state[3]), .C(n132), .Y(n86)
         );
  NAND3X4M U99 ( .A(n92), .B(n132), .C(current_state[0]), .Y(n66) );
  BUFX2M U100 ( .A(n145), .Y(ADDRESS[0]) );
  OAI222X1M U101 ( .A0(n135), .A1(n74), .B0(n15), .B1(n93), .C0(n66), .C1(n85), 
        .Y(n145) );
  INVX2M U102 ( .A(RD_DATA[0]), .Y(n124) );
  INVX2M U103 ( .A(RD_DATA[1]), .Y(n123) );
  INVX2M U104 ( .A(RD_DATA[2]), .Y(n122) );
  INVX2M U105 ( .A(RD_DATA[3]), .Y(n121) );
  INVX2M U106 ( .A(RD_DATA[4]), .Y(n120) );
  INVX2M U107 ( .A(RD_DATA[5]), .Y(n119) );
  INVX2M U108 ( .A(RD_DATA[6]), .Y(n118) );
  INVX2M U109 ( .A(RD_DATA[7]), .Y(n117) );
  OAI211X4M U110 ( .A0(n41), .A1(n66), .B0(n67), .C0(n130), .Y(n61) );
  NAND4BX1M U111 ( .AN(n70), .B(RX_P_DATA[7]), .C(n72), .D(n73), .Y(n67) );
  INVX2M U112 ( .A(n55), .Y(n130) );
  NOR3X2M U113 ( .A(n139), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n72) );
  NOR2BX2M U114 ( .AN(RX_P_DATA[6]), .B(n126), .Y(WR_DATA[6]) );
  NOR2BX2M U115 ( .AN(n86), .B(current_state[0]), .Y(n54) );
  NAND3X2M U116 ( .A(n92), .B(n128), .C(current_state[2]), .Y(n74) );
  CLKBUFX6M U117 ( .A(n89), .Y(n42) );
  NAND3X2M U118 ( .A(n54), .B(n114), .C(RD_DATA_VALID), .Y(n89) );
  NAND4X2M U119 ( .A(n51), .B(n62), .C(n63), .D(n64), .Y(next_state[0]) );
  NAND4X2M U120 ( .A(n76), .B(n142), .C(n77), .D(n78), .Y(n63) );
  AOI221X2M U121 ( .A0(n65), .A1(n135), .B0(n127), .B1(n41), .C0(n61), .Y(n64)
         );
  NOR3X2M U122 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n77)
         );
  OAI22X1M U123 ( .A0(n66), .A1(n84), .B0(n14), .B1(n93), .Y(ADDRESS[1]) );
  OAI22X1M U124 ( .A0(n141), .A1(n125), .B0(n81), .B1(n14), .Y(n111) );
  OAI22X1M U125 ( .A0(n140), .A1(n125), .B0(n81), .B1(n13), .Y(n112) );
  OAI22X1M U126 ( .A0(n139), .A1(n125), .B0(n81), .B1(n12), .Y(n113) );
  OAI22X1M U127 ( .A0(n142), .A1(n125), .B0(n81), .B1(n15), .Y(n110) );
  NAND4BX1M U128 ( .AN(RD_EN), .B(n51), .C(n52), .D(n53), .Y(next_state[2]) );
  AOI211X2M U129 ( .A0(n54), .A1(n116), .B0(n55), .C0(n127), .Y(n53) );
  INVX2M U130 ( .A(RD_DATA_VALID), .Y(n116) );
  NAND4X2M U131 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(n80), .Y(n69) );
  NOR3X2M U132 ( .A(n140), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n80) );
  INVX2M U133 ( .A(RX_P_DATA[2]), .Y(n140) );
  INVX2M U134 ( .A(RX_P_DATA[0]), .Y(n142) );
  INVX2M U135 ( .A(RX_P_DATA[1]), .Y(n141) );
  OAI2BB2X1M U136 ( .B0(n43), .B1(n31), .A0N(ALU_OUT[0]), .A1N(n45), .Y(n94)
         );
  OAI2BB2X1M U137 ( .B0(n43), .B1(n30), .A0N(ALU_OUT[1]), .A1N(n45), .Y(n95)
         );
  OAI2BB2X1M U138 ( .B0(n43), .B1(n29), .A0N(ALU_OUT[2]), .A1N(n45), .Y(n96)
         );
  OAI2BB2X1M U139 ( .B0(n43), .B1(n28), .A0N(ALU_OUT[3]), .A1N(n45), .Y(n97)
         );
  OAI2BB2X1M U140 ( .B0(n43), .B1(n27), .A0N(ALU_OUT[4]), .A1N(n44), .Y(n98)
         );
  OAI2BB2X1M U141 ( .B0(n43), .B1(n26), .A0N(ALU_OUT[5]), .A1N(n44), .Y(n99)
         );
  OAI2BB2X1M U142 ( .B0(n43), .B1(n25), .A0N(ALU_OUT[6]), .A1N(n44), .Y(n100)
         );
  OAI2BB2X1M U143 ( .B0(n43), .B1(n24), .A0N(ALU_OUT[7]), .A1N(n44), .Y(n101)
         );
  OAI2BB2X1M U144 ( .B0(n43), .B1(n23), .A0N(ALU_OUT[8]), .A1N(n44), .Y(n102)
         );
  OAI2BB2X1M U145 ( .B0(n43), .B1(n22), .A0N(ALU_OUT[9]), .A1N(n44), .Y(n103)
         );
  OAI2BB2X1M U146 ( .B0(n43), .B1(n21), .A0N(ALU_OUT[10]), .A1N(n44), .Y(n104)
         );
  OAI2BB2X1M U147 ( .B0(n43), .B1(n20), .A0N(ALU_OUT[11]), .A1N(n44), .Y(n105)
         );
  OAI2BB2X1M U148 ( .B0(n44), .B1(n19), .A0N(ALU_OUT[12]), .A1N(n44), .Y(n106)
         );
  OAI2BB2X1M U149 ( .B0(n44), .B1(n18), .A0N(ALU_OUT[13]), .A1N(n44), .Y(n107)
         );
  OAI2BB2X1M U150 ( .B0(n44), .B1(n17), .A0N(ALU_OUT[14]), .A1N(n45), .Y(n108)
         );
  OAI2BB2X1M U151 ( .B0(n44), .B1(n16), .A0N(ALU_OUT[15]), .A1N(n45), .Y(n109)
         );
  NAND3X2M U152 ( .A(n50), .B(n128), .C(ALU_OUT_VALID), .Y(n62) );
  INVX2M U153 ( .A(RX_P_DATA[4]), .Y(n138) );
  INVX2M U154 ( .A(RX_P_DATA[7]), .Y(n136) );
  INVX2M U155 ( .A(RX_P_DATA[3]), .Y(n139) );
  OR4X1M U156 ( .A(n69), .B(n70), .C(RX_P_DATA[0]), .D(RX_P_DATA[4]), .Y(n51)
         );
endmodule


module RST_SYNC_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;

  wire   [1:0] stages;

  DFFRQX1M \stages_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(stages[0]) );
  DFFRQX1M \stages_reg[1]  ( .D(stages[0]), .CK(CLK), .RN(RST), .Q(stages[1])
         );
  DFFRQX1M SYNC_RST_reg ( .D(stages[1]), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;

  wire   [1:0] stages;

  DFFRQX1M SYNC_RST_reg ( .D(stages[1]), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX1M \stages_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(stages[0]) );
  DFFRQX1M \stages_reg[1]  ( .D(stages[0]), .CK(CLK), .RN(RST), .Q(stages[1])
         );
endmodule


module Reg_File_DATA_WIDTH8_DEPTH16_ADDRESS_WIDTH4 ( CLK, RST, WR_DATA, 
        ADDRESS, WR_EN, RD_EN, RD_DATA, RD_DATA_VALID, REG_0, REG_1, REG_2, 
        REG_3 );
  input [7:0] WR_DATA;
  input [3:0] ADDRESS;
  output [7:0] RD_DATA;
  output [7:0] REG_0;
  output [7:0] REG_1;
  output [7:0] REG_2;
  output [7:0] REG_3;
  input CLK, RST, WR_EN, RD_EN;
  output RD_DATA_VALID;
  wire   N11, N12, N13, N14, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, \REG[15][7] , \REG[15][6] , \REG[15][5] ,
         \REG[15][4] , \REG[15][3] , \REG[15][2] , \REG[15][1] , \REG[15][0] ,
         \REG[14][7] , \REG[14][6] , \REG[14][5] , \REG[14][4] , \REG[14][3] ,
         \REG[14][2] , \REG[14][1] , \REG[14][0] , \REG[13][7] , \REG[13][6] ,
         \REG[13][5] , \REG[13][4] , \REG[13][3] , \REG[13][2] , \REG[13][1] ,
         \REG[13][0] , \REG[12][7] , \REG[12][6] , \REG[12][5] , \REG[12][4] ,
         \REG[12][3] , \REG[12][2] , \REG[12][1] , \REG[12][0] , \REG[11][7] ,
         \REG[11][6] , \REG[11][5] , \REG[11][4] , \REG[11][3] , \REG[11][2] ,
         \REG[11][1] , \REG[11][0] , \REG[10][7] , \REG[10][6] , \REG[10][5] ,
         \REG[10][4] , \REG[10][3] , \REG[10][2] , \REG[10][1] , \REG[10][0] ,
         \REG[9][7] , \REG[9][6] , \REG[9][5] , \REG[9][4] , \REG[9][3] ,
         \REG[9][2] , \REG[9][1] , \REG[9][0] , \REG[8][7] , \REG[8][6] ,
         \REG[8][5] , \REG[8][4] , \REG[8][3] , \REG[8][2] , \REG[8][1] ,
         \REG[8][0] , \REG[7][7] , \REG[7][6] , \REG[7][5] , \REG[7][4] ,
         \REG[7][3] , \REG[7][2] , \REG[7][1] , \REG[7][0] , \REG[6][7] ,
         \REG[6][6] , \REG[6][5] , \REG[6][4] , \REG[6][3] , \REG[6][2] ,
         \REG[6][1] , \REG[6][0] , \REG[5][7] , \REG[5][6] , \REG[5][5] ,
         \REG[5][4] , \REG[5][3] , \REG[5][2] , \REG[5][1] , \REG[5][0] ,
         \REG[4][7] , \REG[4][6] , \REG[4][5] , \REG[4][4] , \REG[4][3] ,
         \REG[4][2] , \REG[4][1] , \REG[4][0] , N36, N37, N38, N39, N40, N41,
         N42, N43, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n1, n3, n5, n7, n9, n11, n178, n180,
         n184, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286;
  assign N11 = ADDRESS[0];
  assign N12 = ADDRESS[1];
  assign N13 = ADDRESS[2];
  assign N14 = ADDRESS[3];

  DFFRHQX8M \REG_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n266), .Q(REG_2[6]) );
  DFFRHQX8M \REG_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n266), .Q(REG_2[5]) );
  DFFRHQX8M \REG_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n266), .Q(REG_2[4]) );
  DFFRHQX8M \REG_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n266), .Q(REG_2[3]) );
  DFFRHQX8M \REG_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n266), .Q(REG_2[2]) );
  DFFRHQX8M \REG_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n265), .Q(n292) );
  DFFRHQX8M \REG_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n265), .Q(REG_1[3]) );
  DFFRHQX8M \REG_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n264), .Q(REG_0[1]) );
  DFFRHQX8M \REG_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n264), .Q(REG_0[0]) );
  DFFSQX4M \REG_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n264), .Q(REG_3[5]) );
  DFFSQX4M \REG_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n264), .Q(REG_2[0]) );
  DFFRQX2M RD_DATA_VALID_reg ( .D(n48), .CK(CLK), .RN(n264), .Q(RD_DATA_VALID)
         );
  DFFRQX2M \REG_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n265), .Q(REG_0[3]) );
  DFFRQX2M \REG_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n265), .Q(REG_0[2]) );
  DFFRQX2M \REG_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n266), .Q(REG_2[1]) );
  DFFRQX2M \REG_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n266), .Q(REG_3[0]) );
  DFFRQX2M \REG_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n265), .Q(REG_0[4]) );
  DFFSQX2M \REG_reg[2][7]  ( .D(n72), .CK(CLK), .SN(RST), .Q(n294) );
  DFFRQX1M \REG_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n264), .Q(\REG[15][7] )
         );
  DFFRQX1M \REG_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n274), .Q(\REG[15][6] )
         );
  DFFRQX1M \REG_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n274), .Q(\REG[15][5] )
         );
  DFFRQX1M \REG_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n274), .Q(\REG[15][4] )
         );
  DFFRQX1M \REG_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n274), .Q(\REG[15][3] )
         );
  DFFRQX1M \REG_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n274), .Q(\REG[15][2] )
         );
  DFFRQX1M \REG_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n274), .Q(\REG[15][1] )
         );
  DFFRQX1M \REG_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n273), .Q(\REG[14][7] )
         );
  DFFRQX1M \REG_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n273), .Q(\REG[14][6] )
         );
  DFFRQX1M \REG_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n273), .Q(\REG[14][5] )
         );
  DFFRQX1M \REG_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n273), .Q(\REG[14][4] )
         );
  DFFRQX1M \REG_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n273), .Q(\REG[14][3] )
         );
  DFFRQX1M \REG_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n273), .Q(\REG[14][2] )
         );
  DFFRQX1M \REG_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n273), .Q(\REG[14][1] )
         );
  DFFRQX1M \REG_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n273), .Q(\REG[13][7] )
         );
  DFFRQX1M \REG_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n273), .Q(\REG[13][6] )
         );
  DFFRQX1M \REG_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n273), .Q(\REG[13][5] )
         );
  DFFRQX1M \REG_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n273), .Q(\REG[13][4] )
         );
  DFFRQX1M \REG_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n273), .Q(\REG[13][3] )
         );
  DFFRQX1M \REG_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n272), .Q(\REG[13][2] )
         );
  DFFRQX1M \REG_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n272), .Q(\REG[13][1] )
         );
  DFFRQX1M \REG_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n272), .Q(\REG[12][7] )
         );
  DFFRQX1M \REG_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n272), .Q(\REG[12][6] )
         );
  DFFRQX1M \REG_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n272), .Q(\REG[12][5] )
         );
  DFFRQX1M \REG_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n272), .Q(\REG[12][4] )
         );
  DFFRQX1M \REG_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n272), .Q(\REG[12][3] )
         );
  DFFRQX1M \REG_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n272), .Q(\REG[12][2] )
         );
  DFFRQX1M \REG_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n272), .Q(\REG[12][1] )
         );
  DFFRQX1M \REG_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n272), .Q(\REG[11][7] )
         );
  DFFRQX1M \REG_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n272), .Q(\REG[11][6] )
         );
  DFFRQX1M \REG_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n271), .Q(\REG[11][5] )
         );
  DFFRQX1M \REG_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n271), .Q(\REG[11][4] )
         );
  DFFRQX1M \REG_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n271), .Q(\REG[11][3] )
         );
  DFFRQX1M \REG_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n271), .Q(\REG[11][2] )
         );
  DFFRQX1M \REG_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n271), .Q(\REG[11][1] )
         );
  DFFRQX1M \REG_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n271), .Q(\REG[10][7] )
         );
  DFFRQX1M \REG_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n271), .Q(\REG[10][6] )
         );
  DFFRQX1M \REG_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n271), .Q(\REG[10][5] )
         );
  DFFRQX1M \REG_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n271), .Q(\REG[10][4] )
         );
  DFFRQX1M \REG_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n271), .Q(\REG[10][3] )
         );
  DFFRQX1M \REG_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n271), .Q(\REG[10][2] )
         );
  DFFRQX1M \REG_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n271), .Q(\REG[10][1] )
         );
  DFFRQX1M \REG_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n270), .Q(\REG[9][7] ) );
  DFFRQX1M \REG_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n270), .Q(\REG[9][6] ) );
  DFFRQX1M \REG_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n270), .Q(\REG[9][5] ) );
  DFFRQX1M \REG_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n270), .Q(\REG[9][4] ) );
  DFFRQX1M \REG_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n270), .Q(\REG[9][3] ) );
  DFFRQX1M \REG_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n270), .Q(\REG[9][2] ) );
  DFFRQX1M \REG_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n270), .Q(\REG[9][1] ) );
  DFFRQX1M \REG_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n270), .Q(\REG[8][7] ) );
  DFFRQX1M \REG_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n270), .Q(\REG[8][6] ) );
  DFFRQX1M \REG_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n270), .Q(\REG[8][5] ) );
  DFFRQX1M \REG_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n270), .Q(\REG[8][4] ) );
  DFFRQX1M \REG_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n269), .Q(\REG[8][3] ) );
  DFFRQX1M \REG_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n269), .Q(\REG[8][2] ) );
  DFFRQX1M \REG_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n269), .Q(\REG[8][1] ) );
  DFFRQX1M \REG_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n267), .Q(n295) );
  DFFRQX1M \REG_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n266), .Q(n296) );
  DFFRQX1M \REG_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n266), .Q(n297) );
  DFFRQX1M \REG_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n266), .Q(n298) );
  DFFRQX1M \REG_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n265), .Q(n288) );
  DFFRQX1M \REG_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n265), .Q(n287) );
  DFFRQX1M \REG_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n268), .Q(\REG[6][7] ) );
  DFFRQX1M \REG_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n268), .Q(\REG[6][6] ) );
  DFFRQX1M \REG_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n268), .Q(\REG[6][5] ) );
  DFFRQX1M \REG_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n268), .Q(\REG[6][4] ) );
  DFFRQX1M \REG_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n268), .Q(\REG[6][3] ) );
  DFFRQX1M \REG_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n268), .Q(\REG[6][2] ) );
  DFFRQX1M \REG_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n268), .Q(\REG[6][1] ) );
  DFFRQX1M \REG_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n267), .Q(\REG[4][7] ) );
  DFFRQX1M \REG_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n267), .Q(\REG[4][6] ) );
  DFFRQX1M \REG_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n267), .Q(\REG[4][5] ) );
  DFFRQX1M \REG_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n267), .Q(\REG[4][4] ) );
  DFFRQX1M \REG_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n267), .Q(\REG[4][3] ) );
  DFFRQX1M \REG_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n267), .Q(\REG[4][2] ) );
  DFFRQX1M \REG_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n267), .Q(\REG[4][1] ) );
  DFFRQX1M \REG_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n269), .Q(\REG[7][7] ) );
  DFFRQX1M \REG_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n269), .Q(\REG[7][6] ) );
  DFFRQX1M \REG_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n269), .Q(\REG[7][5] ) );
  DFFRQX1M \REG_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n269), .Q(\REG[7][4] ) );
  DFFRQX1M \REG_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n269), .Q(\REG[7][3] ) );
  DFFRQX1M \REG_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n269), .Q(\REG[7][2] ) );
  DFFRQX1M \REG_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n269), .Q(\REG[7][1] ) );
  DFFRQX1M \REG_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n268), .Q(\REG[5][7] ) );
  DFFRQX1M \REG_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n268), .Q(\REG[5][6] ) );
  DFFRQX1M \REG_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n268), .Q(\REG[5][5] ) );
  DFFRQX1M \REG_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n268), .Q(\REG[5][4] ) );
  DFFRQX1M \REG_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n268), .Q(\REG[5][3] ) );
  DFFRQX1M \REG_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n267), .Q(\REG[5][2] ) );
  DFFRQX1M \REG_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n267), .Q(\REG[5][1] ) );
  DFFRQX1M \REG_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n274), .Q(\REG[15][0] )
         );
  DFFRQX1M \REG_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n273), .Q(\REG[14][0] )
         );
  DFFRQX1M \REG_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n272), .Q(\REG[13][0] )
         );
  DFFRQX1M \REG_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n272), .Q(\REG[12][0] )
         );
  DFFRQX1M \REG_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n271), .Q(\REG[11][0] )
         );
  DFFRQX1M \REG_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n270), .Q(\REG[10][0] )
         );
  DFFRQX1M \REG_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n270), .Q(\REG[9][0] ) );
  DFFRQX1M \REG_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n269), .Q(\REG[8][0] ) );
  DFFRQX1M \REG_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n268), .Q(\REG[6][0] ) );
  DFFRQX1M \REG_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n267), .Q(\REG[4][0] ) );
  DFFRQX1M \REG_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n269), .Q(\REG[7][0] ) );
  DFFRQX1M \REG_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n267), .Q(\REG[5][0] ) );
  DFFRQX1M \RD_DATA_reg[7]  ( .D(n47), .CK(CLK), .RN(n265), .Q(RD_DATA[7]) );
  DFFRQX1M \RD_DATA_reg[6]  ( .D(n46), .CK(CLK), .RN(n264), .Q(RD_DATA[6]) );
  DFFRQX1M \RD_DATA_reg[5]  ( .D(n45), .CK(CLK), .RN(n264), .Q(RD_DATA[5]) );
  DFFRQX1M \RD_DATA_reg[1]  ( .D(n41), .CK(CLK), .RN(n264), .Q(RD_DATA[1]) );
  DFFRQX1M \RD_DATA_reg[0]  ( .D(n40), .CK(CLK), .RN(n269), .Q(RD_DATA[0]) );
  DFFRQX1M \RD_DATA_reg[4]  ( .D(n44), .CK(CLK), .RN(n264), .Q(RD_DATA[4]) );
  DFFRQX1M \RD_DATA_reg[3]  ( .D(n43), .CK(CLK), .RN(n264), .Q(RD_DATA[3]) );
  DFFRQX1M \RD_DATA_reg[2]  ( .D(n42), .CK(CLK), .RN(n264), .Q(RD_DATA[2]) );
  DFFRQX4M \REG_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n267), .Q(REG_3[6]) );
  DFFRQX4M \REG_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n266), .Q(REG_3[1]) );
  DFFRQX4M \REG_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n265), .Q(REG_0[7]) );
  DFFRHQX4M \REG_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n265), .Q(n289) );
  DFFRHQX2M \REG_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n266), .Q(n290) );
  DFFRHQX2M \REG_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n266), .Q(n291) );
  DFFRHQX4M \REG_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n265), .Q(n293) );
  DFFRHQX8M \REG_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n265), .Q(REG_1[1]) );
  DFFRHQX8M \REG_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n265), .Q(REG_1[2]) );
  INVX6M U3 ( .A(n292), .Y(n1) );
  INVX16M U4 ( .A(n1), .Y(REG_1[4]) );
  BUFX32M U5 ( .A(n290), .Y(REG_1[6]) );
  CLKBUFX32M U6 ( .A(n291), .Y(REG_1[5]) );
  INVX2M U7 ( .A(n3), .Y(REG_0[6]) );
  INVX6M U8 ( .A(n180), .Y(REG_2[7]) );
  CLKBUFX24M U9 ( .A(n293), .Y(REG_1[0]) );
  BUFX6M U10 ( .A(n277), .Y(n264) );
  OAI2BB2X1M U11 ( .B0(n257), .B1(n283), .A0N(REG_0[7]), .A1N(n258), .Y(n56)
         );
  INVX2M U12 ( .A(n287), .Y(n3) );
  INVXLM U13 ( .A(n288), .Y(n5) );
  INVX2M U14 ( .A(n5), .Y(REG_0[5]) );
  INVXLM U15 ( .A(n297), .Y(n7) );
  INVX4M U16 ( .A(n7), .Y(REG_3[3]) );
  INVXLM U17 ( .A(n296), .Y(n9) );
  INVX4M U18 ( .A(n9), .Y(REG_3[4]) );
  INVXLM U19 ( .A(n295), .Y(n11) );
  INVX4M U20 ( .A(n11), .Y(REG_3[7]) );
  INVXLM U21 ( .A(n298), .Y(n178) );
  INVX4M U22 ( .A(n178), .Y(REG_3[2]) );
  INVXLM U23 ( .A(n294), .Y(n180) );
  CLKINVX32M U24 ( .A(n289), .Y(n184) );
  INVX32M U25 ( .A(n184), .Y(REG_1[7]) );
  NOR2BX4M U26 ( .AN(n27), .B(n261), .Y(n18) );
  NOR2X4M U27 ( .A(n263), .B(N13), .Y(n20) );
  NOR2X4M U28 ( .A(n262), .B(N13), .Y(n15) );
  NOR2BX4M U29 ( .AN(N13), .B(n262), .Y(n23) );
  NOR2BX4M U30 ( .AN(N13), .B(n263), .Y(n26) );
  NOR2BX4M U31 ( .AN(n38), .B(n261), .Y(n32) );
  MX4XLM U32 ( .A(REG_0[0]), .B(REG_1[0]), .C(REG_2[0]), .D(REG_3[0]), .S0(
        n225), .S1(n219), .Y(n190) );
  MX4XLM U33 ( .A(REG_0[1]), .B(REG_1[1]), .C(REG_2[1]), .D(REG_3[1]), .S0(
        n225), .S1(n220), .Y(n194) );
  MX4XLM U34 ( .A(REG_0[2]), .B(REG_1[2]), .C(REG_2[2]), .D(REG_3[2]), .S0(
        n226), .S1(n220), .Y(n198) );
  MX4XLM U35 ( .A(REG_0[3]), .B(REG_1[3]), .C(REG_2[3]), .D(REG_3[3]), .S0(
        n226), .S1(n220), .Y(n202) );
  MX4XLM U36 ( .A(REG_0[4]), .B(REG_1[4]), .C(REG_2[4]), .D(REG_3[4]), .S0(
        n226), .S1(n221), .Y(n206) );
  MX4XLM U37 ( .A(REG_0[5]), .B(REG_1[5]), .C(REG_2[5]), .D(REG_3[5]), .S0(
        n223), .S1(n221), .Y(n210) );
  MX4XLM U38 ( .A(REG_0[6]), .B(REG_1[6]), .C(REG_2[6]), .D(REG_3[6]), .S0(
        n223), .S1(n221), .Y(n214) );
  MX4XLM U39 ( .A(REG_0[7]), .B(REG_1[7]), .C(REG_2[7]), .D(REG_3[7]), .S0(
        n223), .S1(n221), .Y(n218) );
  INVX2M U40 ( .A(N12), .Y(n263) );
  INVX2M U41 ( .A(N11), .Y(n261) );
  INVX8M U42 ( .A(WR_DATA[6]), .Y(n284) );
  CLKBUFX8M U43 ( .A(n224), .Y(n226) );
  CLKBUFX8M U44 ( .A(n262), .Y(n220) );
  CLKBUFX6M U45 ( .A(n224), .Y(n225) );
  BUFX4M U46 ( .A(n221), .Y(n219) );
  CLKBUFX8M U47 ( .A(n276), .Y(n266) );
  CLKBUFX8M U48 ( .A(n276), .Y(n267) );
  CLKBUFX8M U49 ( .A(n276), .Y(n268) );
  CLKBUFX8M U50 ( .A(n275), .Y(n269) );
  CLKBUFX8M U51 ( .A(n275), .Y(n270) );
  CLKBUFX8M U52 ( .A(n275), .Y(n271) );
  CLKBUFX8M U53 ( .A(n275), .Y(n272) );
  CLKBUFX8M U54 ( .A(n276), .Y(n273) );
  CLKBUFX8M U55 ( .A(n277), .Y(n265) );
  BUFX4M U56 ( .A(RST), .Y(n274) );
  BUFX2M U57 ( .A(n222), .Y(n223) );
  BUFX4M U58 ( .A(n17), .Y(n256) );
  BUFX4M U59 ( .A(n29), .Y(n242) );
  BUFX4M U60 ( .A(n31), .Y(n240) );
  BUFX4M U61 ( .A(n33), .Y(n238) );
  BUFX4M U62 ( .A(n34), .Y(n236) );
  BUFX4M U63 ( .A(n19), .Y(n254) );
  BUFX4M U64 ( .A(n21), .Y(n252) );
  BUFX4M U65 ( .A(n14), .Y(n258) );
  BUFX4M U66 ( .A(n22), .Y(n250) );
  BUFX4M U67 ( .A(n24), .Y(n248) );
  BUFX4M U68 ( .A(n25), .Y(n246) );
  BUFX4M U69 ( .A(n28), .Y(n244) );
  BUFX4M U70 ( .A(n35), .Y(n234) );
  BUFX4M U71 ( .A(n36), .Y(n232) );
  BUFX4M U72 ( .A(n37), .Y(n230) );
  BUFX4M U73 ( .A(n39), .Y(n228) );
  BUFX4M U74 ( .A(n17), .Y(n255) );
  BUFX4M U75 ( .A(n29), .Y(n241) );
  BUFX4M U76 ( .A(n31), .Y(n239) );
  BUFX4M U77 ( .A(n33), .Y(n237) );
  BUFX4M U78 ( .A(n34), .Y(n235) );
  BUFX4M U79 ( .A(n19), .Y(n253) );
  BUFX4M U80 ( .A(n21), .Y(n251) );
  BUFX4M U81 ( .A(n22), .Y(n249) );
  BUFX4M U82 ( .A(n24), .Y(n247) );
  BUFX4M U83 ( .A(n25), .Y(n245) );
  BUFX4M U84 ( .A(n28), .Y(n243) );
  BUFX4M U85 ( .A(n35), .Y(n233) );
  BUFX4M U86 ( .A(n36), .Y(n231) );
  BUFX4M U87 ( .A(n37), .Y(n229) );
  BUFX4M U88 ( .A(n39), .Y(n227) );
  BUFX4M U89 ( .A(n14), .Y(n257) );
  BUFX2M U90 ( .A(n222), .Y(n224) );
  INVX4M U91 ( .A(n259), .Y(n282) );
  CLKBUFX8M U92 ( .A(n262), .Y(n221) );
  BUFX2M U93 ( .A(n277), .Y(n276) );
  BUFX2M U94 ( .A(n277), .Y(n275) );
  NOR2BX4M U95 ( .AN(n27), .B(n260), .Y(n16) );
  NOR2BX4M U96 ( .AN(n38), .B(n260), .Y(n30) );
  NOR2BX4M U97 ( .AN(WR_EN), .B(RD_EN), .Y(n13) );
  NAND2X2M U98 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U99 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U100 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U101 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U102 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U103 ( .A(n15), .B(n16), .Y(n14) );
  NAND2X2M U104 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U105 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U106 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U107 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U108 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U109 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U110 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U111 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U112 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U113 ( .A(n32), .B(n26), .Y(n39) );
  BUFX2M U114 ( .A(n260), .Y(n222) );
  CLKBUFX6M U115 ( .A(n12), .Y(n259) );
  NAND2BX2M U116 ( .AN(WR_EN), .B(RD_EN), .Y(n12) );
  NOR2BX2M U117 ( .AN(n13), .B(N14), .Y(n27) );
  AND2X1M U118 ( .A(N14), .B(n13), .Y(n38) );
  INVX2M U119 ( .A(n261), .Y(n260) );
  INVX8M U120 ( .A(WR_DATA[4]), .Y(n286) );
  INVX8M U121 ( .A(WR_DATA[5]), .Y(n285) );
  INVX8M U122 ( .A(WR_DATA[7]), .Y(n283) );
  INVX2M U123 ( .A(n263), .Y(n262) );
  INVX8M U124 ( .A(WR_DATA[0]), .Y(n278) );
  INVX8M U125 ( .A(WR_DATA[1]), .Y(n279) );
  INVX8M U126 ( .A(WR_DATA[2]), .Y(n280) );
  INVX8M U127 ( .A(WR_DATA[3]), .Y(n281) );
  BUFX2M U128 ( .A(RST), .Y(n277) );
  OAI2BB2X1M U129 ( .B0(n257), .B1(n281), .A0N(REG_0[3]), .A1N(n258), .Y(n52)
         );
  OAI2BB2X1M U130 ( .B0(n258), .B1(n278), .A0N(REG_0[0]), .A1N(n258), .Y(n49)
         );
  OAI2BB2X1M U131 ( .B0(n257), .B1(n279), .A0N(REG_0[1]), .A1N(n258), .Y(n50)
         );
  OAI2BB2X1M U132 ( .B0(n257), .B1(n280), .A0N(REG_0[2]), .A1N(n258), .Y(n51)
         );
  OAI2BB2X1M U133 ( .B0(n257), .B1(n286), .A0N(REG_0[4]), .A1N(n258), .Y(n53)
         );
  OAI2BB2X1M U134 ( .B0(n257), .B1(n285), .A0N(REG_0[5]), .A1N(n258), .Y(n54)
         );
  OAI2BB2X1M U135 ( .B0(n281), .B1(n255), .A0N(REG_1[3]), .A1N(n256), .Y(n60)
         );
  OAI2BB2X1M U136 ( .B0(n281), .B1(n253), .A0N(REG_2[3]), .A1N(n254), .Y(n68)
         );
  OAI2BB2X1M U137 ( .B0(n281), .B1(n251), .A0N(REG_3[3]), .A1N(n252), .Y(n76)
         );
  OAI2BB2X1M U138 ( .B0(n281), .B1(n249), .A0N(\REG[4][3] ), .A1N(n250), .Y(
        n84) );
  OAI2BB2X1M U139 ( .B0(n281), .B1(n247), .A0N(\REG[5][3] ), .A1N(n248), .Y(
        n92) );
  OAI2BB2X1M U140 ( .B0(n281), .B1(n245), .A0N(\REG[6][3] ), .A1N(n246), .Y(
        n100) );
  OAI2BB2X1M U141 ( .B0(n281), .B1(n243), .A0N(\REG[7][3] ), .A1N(n244), .Y(
        n108) );
  OAI2BB2X1M U142 ( .B0(n281), .B1(n241), .A0N(\REG[8][3] ), .A1N(n242), .Y(
        n116) );
  OAI2BB2X1M U143 ( .B0(n281), .B1(n239), .A0N(\REG[9][3] ), .A1N(n240), .Y(
        n124) );
  OAI2BB2X1M U144 ( .B0(n281), .B1(n237), .A0N(\REG[10][3] ), .A1N(n238), .Y(
        n132) );
  OAI2BB2X1M U145 ( .B0(n281), .B1(n235), .A0N(\REG[11][3] ), .A1N(n236), .Y(
        n140) );
  OAI2BB2X1M U146 ( .B0(n281), .B1(n233), .A0N(\REG[12][3] ), .A1N(n234), .Y(
        n148) );
  OAI2BB2X1M U147 ( .B0(n281), .B1(n231), .A0N(\REG[13][3] ), .A1N(n232), .Y(
        n156) );
  OAI2BB2X1M U148 ( .B0(n281), .B1(n229), .A0N(\REG[14][3] ), .A1N(n230), .Y(
        n164) );
  OAI2BB2X1M U149 ( .B0(n281), .B1(n227), .A0N(\REG[15][3] ), .A1N(n228), .Y(
        n172) );
  OAI2BB2X1M U150 ( .B0(n278), .B1(n256), .A0N(REG_1[0]), .A1N(n256), .Y(n57)
         );
  OAI2BB2X1M U151 ( .B0(n279), .B1(n255), .A0N(REG_1[1]), .A1N(n256), .Y(n58)
         );
  OAI2BB2X1M U152 ( .B0(n280), .B1(n255), .A0N(REG_1[2]), .A1N(n256), .Y(n59)
         );
  OAI2BB2X1M U153 ( .B0(n286), .B1(n255), .A0N(REG_1[4]), .A1N(n256), .Y(n61)
         );
  OAI2BB2X1M U154 ( .B0(n285), .B1(n255), .A0N(REG_1[5]), .A1N(n256), .Y(n62)
         );
  OAI2BB2X1M U155 ( .B0(n283), .B1(n255), .A0N(REG_1[7]), .A1N(n256), .Y(n64)
         );
  OAI2BB2X1M U156 ( .B0(n279), .B1(n253), .A0N(REG_2[1]), .A1N(n254), .Y(n66)
         );
  OAI2BB2X1M U157 ( .B0(n280), .B1(n253), .A0N(REG_2[2]), .A1N(n254), .Y(n67)
         );
  OAI2BB2X1M U158 ( .B0(n286), .B1(n253), .A0N(REG_2[4]), .A1N(n254), .Y(n69)
         );
  OAI2BB2X1M U159 ( .B0(n285), .B1(n253), .A0N(REG_2[5]), .A1N(n254), .Y(n70)
         );
  OAI2BB2X1M U160 ( .B0(n278), .B1(n252), .A0N(REG_3[0]), .A1N(n252), .Y(n73)
         );
  OAI2BB2X1M U161 ( .B0(n279), .B1(n251), .A0N(REG_3[1]), .A1N(n252), .Y(n74)
         );
  OAI2BB2X1M U162 ( .B0(n280), .B1(n251), .A0N(REG_3[2]), .A1N(n252), .Y(n75)
         );
  OAI2BB2X1M U163 ( .B0(n286), .B1(n251), .A0N(REG_3[4]), .A1N(n252), .Y(n77)
         );
  OAI2BB2X1M U164 ( .B0(n283), .B1(n251), .A0N(REG_3[7]), .A1N(n252), .Y(n80)
         );
  OAI2BB2X1M U165 ( .B0(n278), .B1(n250), .A0N(\REG[4][0] ), .A1N(n250), .Y(
        n81) );
  OAI2BB2X1M U166 ( .B0(n279), .B1(n249), .A0N(\REG[4][1] ), .A1N(n250), .Y(
        n82) );
  OAI2BB2X1M U167 ( .B0(n280), .B1(n249), .A0N(\REG[4][2] ), .A1N(n250), .Y(
        n83) );
  OAI2BB2X1M U168 ( .B0(n286), .B1(n249), .A0N(\REG[4][4] ), .A1N(n250), .Y(
        n85) );
  OAI2BB2X1M U169 ( .B0(n285), .B1(n249), .A0N(\REG[4][5] ), .A1N(n250), .Y(
        n86) );
  OAI2BB2X1M U170 ( .B0(n283), .B1(n249), .A0N(\REG[4][7] ), .A1N(n250), .Y(
        n88) );
  OAI2BB2X1M U171 ( .B0(n278), .B1(n248), .A0N(\REG[5][0] ), .A1N(n248), .Y(
        n89) );
  OAI2BB2X1M U172 ( .B0(n279), .B1(n247), .A0N(\REG[5][1] ), .A1N(n248), .Y(
        n90) );
  OAI2BB2X1M U173 ( .B0(n280), .B1(n247), .A0N(\REG[5][2] ), .A1N(n248), .Y(
        n91) );
  OAI2BB2X1M U174 ( .B0(n286), .B1(n247), .A0N(\REG[5][4] ), .A1N(n248), .Y(
        n93) );
  OAI2BB2X1M U175 ( .B0(n285), .B1(n247), .A0N(\REG[5][5] ), .A1N(n248), .Y(
        n94) );
  OAI2BB2X1M U176 ( .B0(n283), .B1(n247), .A0N(\REG[5][7] ), .A1N(n248), .Y(
        n96) );
  OAI2BB2X1M U177 ( .B0(n278), .B1(n246), .A0N(\REG[6][0] ), .A1N(n246), .Y(
        n97) );
  OAI2BB2X1M U178 ( .B0(n279), .B1(n245), .A0N(\REG[6][1] ), .A1N(n246), .Y(
        n98) );
  OAI2BB2X1M U179 ( .B0(n280), .B1(n245), .A0N(\REG[6][2] ), .A1N(n246), .Y(
        n99) );
  OAI2BB2X1M U180 ( .B0(n286), .B1(n245), .A0N(\REG[6][4] ), .A1N(n246), .Y(
        n101) );
  OAI2BB2X1M U181 ( .B0(n285), .B1(n245), .A0N(\REG[6][5] ), .A1N(n246), .Y(
        n102) );
  OAI2BB2X1M U182 ( .B0(n283), .B1(n245), .A0N(\REG[6][7] ), .A1N(n246), .Y(
        n104) );
  OAI2BB2X1M U183 ( .B0(n278), .B1(n244), .A0N(\REG[7][0] ), .A1N(n244), .Y(
        n105) );
  OAI2BB2X1M U184 ( .B0(n279), .B1(n243), .A0N(\REG[7][1] ), .A1N(n244), .Y(
        n106) );
  OAI2BB2X1M U185 ( .B0(n280), .B1(n243), .A0N(\REG[7][2] ), .A1N(n244), .Y(
        n107) );
  OAI2BB2X1M U186 ( .B0(n286), .B1(n243), .A0N(\REG[7][4] ), .A1N(n244), .Y(
        n109) );
  OAI2BB2X1M U187 ( .B0(n285), .B1(n243), .A0N(\REG[7][5] ), .A1N(n244), .Y(
        n110) );
  OAI2BB2X1M U188 ( .B0(n283), .B1(n243), .A0N(\REG[7][7] ), .A1N(n244), .Y(
        n112) );
  OAI2BB2X1M U189 ( .B0(n278), .B1(n242), .A0N(\REG[8][0] ), .A1N(n242), .Y(
        n113) );
  OAI2BB2X1M U190 ( .B0(n279), .B1(n241), .A0N(\REG[8][1] ), .A1N(n242), .Y(
        n114) );
  OAI2BB2X1M U191 ( .B0(n280), .B1(n241), .A0N(\REG[8][2] ), .A1N(n242), .Y(
        n115) );
  OAI2BB2X1M U192 ( .B0(n286), .B1(n241), .A0N(\REG[8][4] ), .A1N(n242), .Y(
        n117) );
  OAI2BB2X1M U193 ( .B0(n285), .B1(n241), .A0N(\REG[8][5] ), .A1N(n242), .Y(
        n118) );
  OAI2BB2X1M U194 ( .B0(n283), .B1(n241), .A0N(\REG[8][7] ), .A1N(n242), .Y(
        n120) );
  OAI2BB2X1M U195 ( .B0(n278), .B1(n240), .A0N(\REG[9][0] ), .A1N(n240), .Y(
        n121) );
  OAI2BB2X1M U196 ( .B0(n279), .B1(n239), .A0N(\REG[9][1] ), .A1N(n240), .Y(
        n122) );
  OAI2BB2X1M U197 ( .B0(n280), .B1(n239), .A0N(\REG[9][2] ), .A1N(n240), .Y(
        n123) );
  OAI2BB2X1M U198 ( .B0(n286), .B1(n239), .A0N(\REG[9][4] ), .A1N(n240), .Y(
        n125) );
  OAI2BB2X1M U199 ( .B0(n285), .B1(n239), .A0N(\REG[9][5] ), .A1N(n240), .Y(
        n126) );
  OAI2BB2X1M U200 ( .B0(n283), .B1(n239), .A0N(\REG[9][7] ), .A1N(n240), .Y(
        n128) );
  OAI2BB2X1M U201 ( .B0(n278), .B1(n238), .A0N(\REG[10][0] ), .A1N(n238), .Y(
        n129) );
  OAI2BB2X1M U202 ( .B0(n279), .B1(n237), .A0N(\REG[10][1] ), .A1N(n238), .Y(
        n130) );
  OAI2BB2X1M U203 ( .B0(n280), .B1(n237), .A0N(\REG[10][2] ), .A1N(n238), .Y(
        n131) );
  OAI2BB2X1M U204 ( .B0(n286), .B1(n237), .A0N(\REG[10][4] ), .A1N(n238), .Y(
        n133) );
  OAI2BB2X1M U205 ( .B0(n285), .B1(n237), .A0N(\REG[10][5] ), .A1N(n238), .Y(
        n134) );
  OAI2BB2X1M U206 ( .B0(n283), .B1(n237), .A0N(\REG[10][7] ), .A1N(n238), .Y(
        n136) );
  OAI2BB2X1M U207 ( .B0(n278), .B1(n236), .A0N(\REG[11][0] ), .A1N(n236), .Y(
        n137) );
  OAI2BB2X1M U208 ( .B0(n279), .B1(n235), .A0N(\REG[11][1] ), .A1N(n236), .Y(
        n138) );
  OAI2BB2X1M U209 ( .B0(n280), .B1(n235), .A0N(\REG[11][2] ), .A1N(n236), .Y(
        n139) );
  OAI2BB2X1M U210 ( .B0(n286), .B1(n235), .A0N(\REG[11][4] ), .A1N(n236), .Y(
        n141) );
  OAI2BB2X1M U211 ( .B0(n285), .B1(n235), .A0N(\REG[11][5] ), .A1N(n236), .Y(
        n142) );
  OAI2BB2X1M U212 ( .B0(n283), .B1(n235), .A0N(\REG[11][7] ), .A1N(n236), .Y(
        n144) );
  OAI2BB2X1M U213 ( .B0(n278), .B1(n234), .A0N(\REG[12][0] ), .A1N(n234), .Y(
        n145) );
  OAI2BB2X1M U214 ( .B0(n279), .B1(n233), .A0N(\REG[12][1] ), .A1N(n234), .Y(
        n146) );
  OAI2BB2X1M U215 ( .B0(n280), .B1(n233), .A0N(\REG[12][2] ), .A1N(n234), .Y(
        n147) );
  OAI2BB2X1M U216 ( .B0(n286), .B1(n233), .A0N(\REG[12][4] ), .A1N(n234), .Y(
        n149) );
  OAI2BB2X1M U217 ( .B0(n285), .B1(n233), .A0N(\REG[12][5] ), .A1N(n234), .Y(
        n150) );
  OAI2BB2X1M U218 ( .B0(n283), .B1(n233), .A0N(\REG[12][7] ), .A1N(n234), .Y(
        n152) );
  OAI2BB2X1M U219 ( .B0(n278), .B1(n232), .A0N(\REG[13][0] ), .A1N(n232), .Y(
        n153) );
  OAI2BB2X1M U220 ( .B0(n279), .B1(n231), .A0N(\REG[13][1] ), .A1N(n232), .Y(
        n154) );
  OAI2BB2X1M U221 ( .B0(n280), .B1(n231), .A0N(\REG[13][2] ), .A1N(n232), .Y(
        n155) );
  OAI2BB2X1M U222 ( .B0(n286), .B1(n231), .A0N(\REG[13][4] ), .A1N(n232), .Y(
        n157) );
  OAI2BB2X1M U223 ( .B0(n285), .B1(n231), .A0N(\REG[13][5] ), .A1N(n232), .Y(
        n158) );
  OAI2BB2X1M U224 ( .B0(n283), .B1(n231), .A0N(\REG[13][7] ), .A1N(n232), .Y(
        n160) );
  OAI2BB2X1M U225 ( .B0(n278), .B1(n230), .A0N(\REG[14][0] ), .A1N(n230), .Y(
        n161) );
  OAI2BB2X1M U226 ( .B0(n279), .B1(n229), .A0N(\REG[14][1] ), .A1N(n230), .Y(
        n162) );
  OAI2BB2X1M U227 ( .B0(n280), .B1(n229), .A0N(\REG[14][2] ), .A1N(n230), .Y(
        n163) );
  OAI2BB2X1M U228 ( .B0(n286), .B1(n229), .A0N(\REG[14][4] ), .A1N(n230), .Y(
        n165) );
  OAI2BB2X1M U229 ( .B0(n285), .B1(n229), .A0N(\REG[14][5] ), .A1N(n230), .Y(
        n166) );
  OAI2BB2X1M U230 ( .B0(n283), .B1(n229), .A0N(\REG[14][7] ), .A1N(n230), .Y(
        n168) );
  OAI2BB2X1M U231 ( .B0(n278), .B1(n228), .A0N(\REG[15][0] ), .A1N(n228), .Y(
        n169) );
  OAI2BB2X1M U232 ( .B0(n279), .B1(n227), .A0N(\REG[15][1] ), .A1N(n228), .Y(
        n170) );
  OAI2BB2X1M U233 ( .B0(n280), .B1(n227), .A0N(\REG[15][2] ), .A1N(n228), .Y(
        n171) );
  OAI2BB2X1M U234 ( .B0(n286), .B1(n227), .A0N(\REG[15][4] ), .A1N(n228), .Y(
        n173) );
  OAI2BB2X1M U235 ( .B0(n285), .B1(n227), .A0N(\REG[15][5] ), .A1N(n228), .Y(
        n174) );
  OAI2BB2X1M U236 ( .B0(n283), .B1(n227), .A0N(\REG[15][7] ), .A1N(n228), .Y(
        n176) );
  OAI2BB2X1M U237 ( .B0(n257), .B1(n284), .A0N(REG_0[6]), .A1N(n258), .Y(n55)
         );
  OAI2BB2X1M U238 ( .B0(n284), .B1(n255), .A0N(REG_1[6]), .A1N(n256), .Y(n63)
         );
  OAI2BB2X1M U239 ( .B0(n284), .B1(n253), .A0N(REG_2[6]), .A1N(n254), .Y(n71)
         );
  OAI2BB2X1M U240 ( .B0(n284), .B1(n251), .A0N(REG_3[6]), .A1N(n252), .Y(n79)
         );
  OAI2BB2X1M U241 ( .B0(n284), .B1(n249), .A0N(\REG[4][6] ), .A1N(n250), .Y(
        n87) );
  OAI2BB2X1M U242 ( .B0(n284), .B1(n247), .A0N(\REG[5][6] ), .A1N(n248), .Y(
        n95) );
  OAI2BB2X1M U243 ( .B0(n284), .B1(n245), .A0N(\REG[6][6] ), .A1N(n246), .Y(
        n103) );
  OAI2BB2X1M U244 ( .B0(n284), .B1(n243), .A0N(\REG[7][6] ), .A1N(n244), .Y(
        n111) );
  OAI2BB2X1M U245 ( .B0(n284), .B1(n241), .A0N(\REG[8][6] ), .A1N(n242), .Y(
        n119) );
  OAI2BB2X1M U246 ( .B0(n284), .B1(n239), .A0N(\REG[9][6] ), .A1N(n240), .Y(
        n127) );
  OAI2BB2X1M U247 ( .B0(n284), .B1(n237), .A0N(\REG[10][6] ), .A1N(n238), .Y(
        n135) );
  OAI2BB2X1M U248 ( .B0(n284), .B1(n235), .A0N(\REG[11][6] ), .A1N(n236), .Y(
        n143) );
  OAI2BB2X1M U249 ( .B0(n284), .B1(n233), .A0N(\REG[12][6] ), .A1N(n234), .Y(
        n151) );
  OAI2BB2X1M U250 ( .B0(n284), .B1(n231), .A0N(\REG[13][6] ), .A1N(n232), .Y(
        n159) );
  OAI2BB2X1M U251 ( .B0(n284), .B1(n229), .A0N(\REG[14][6] ), .A1N(n230), .Y(
        n167) );
  OAI2BB2X1M U252 ( .B0(n284), .B1(n227), .A0N(\REG[15][6] ), .A1N(n228), .Y(
        n175) );
  OAI2BB2X1M U253 ( .B0(n278), .B1(n254), .A0N(REG_2[0]), .A1N(n254), .Y(n65)
         );
  OAI2BB2X1M U254 ( .B0(n283), .B1(n253), .A0N(REG_2[7]), .A1N(n254), .Y(n72)
         );
  OAI2BB2X1M U255 ( .B0(n285), .B1(n251), .A0N(REG_3[5]), .A1N(n252), .Y(n78)
         );
  MX4X1M U256 ( .A(\REG[4][2] ), .B(\REG[5][2] ), .C(\REG[6][2] ), .D(
        \REG[7][2] ), .S0(n226), .S1(n220), .Y(n197) );
  MX4X1M U257 ( .A(\REG[4][3] ), .B(\REG[5][3] ), .C(\REG[6][3] ), .D(
        \REG[7][3] ), .S0(n226), .S1(n220), .Y(n201) );
  MX4X1M U258 ( .A(\REG[4][4] ), .B(\REG[5][4] ), .C(\REG[6][4] ), .D(
        \REG[7][4] ), .S0(n226), .S1(n220), .Y(n205) );
  MX4X1M U259 ( .A(\REG[4][5] ), .B(\REG[5][5] ), .C(\REG[6][5] ), .D(
        \REG[7][5] ), .S0(n260), .S1(n221), .Y(n209) );
  MX4X1M U260 ( .A(\REG[4][6] ), .B(\REG[5][6] ), .C(\REG[6][6] ), .D(
        \REG[7][6] ), .S0(N11), .S1(n221), .Y(n213) );
  MX4X1M U261 ( .A(\REG[4][7] ), .B(\REG[5][7] ), .C(\REG[6][7] ), .D(
        \REG[7][7] ), .S0(N11), .S1(n221), .Y(n217) );
  MX4X1M U262 ( .A(\REG[12][2] ), .B(\REG[13][2] ), .C(\REG[14][2] ), .D(
        \REG[15][2] ), .S0(n226), .S1(n220), .Y(n195) );
  MX4X1M U263 ( .A(\REG[12][3] ), .B(\REG[13][3] ), .C(\REG[14][3] ), .D(
        \REG[15][3] ), .S0(n226), .S1(n220), .Y(n199) );
  MX4X1M U264 ( .A(\REG[12][4] ), .B(\REG[13][4] ), .C(\REG[14][4] ), .D(
        \REG[15][4] ), .S0(n226), .S1(n220), .Y(n203) );
  MX4X1M U265 ( .A(\REG[12][5] ), .B(\REG[13][5] ), .C(\REG[14][5] ), .D(
        \REG[15][5] ), .S0(n223), .S1(n221), .Y(n207) );
  MX4X1M U266 ( .A(\REG[12][6] ), .B(\REG[13][6] ), .C(\REG[14][6] ), .D(
        \REG[15][6] ), .S0(n225), .S1(n221), .Y(n211) );
  MX4X1M U267 ( .A(\REG[12][7] ), .B(\REG[13][7] ), .C(\REG[14][7] ), .D(
        \REG[15][7] ), .S0(n226), .S1(n221), .Y(n215) );
  AO22X1M U268 ( .A0(N41), .A1(n282), .B0(RD_DATA[2]), .B1(n259), .Y(n42) );
  MX4XLM U269 ( .A(n198), .B(n196), .C(n197), .D(n195), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U270 ( .A(\REG[8][2] ), .B(\REG[9][2] ), .C(\REG[10][2] ), .D(
        \REG[11][2] ), .S0(n226), .S1(n220), .Y(n196) );
  AO22X1M U271 ( .A0(N40), .A1(n282), .B0(RD_DATA[3]), .B1(n259), .Y(n43) );
  MX4XLM U272 ( .A(n202), .B(n200), .C(n201), .D(n199), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U273 ( .A(\REG[8][3] ), .B(\REG[9][3] ), .C(\REG[10][3] ), .D(
        \REG[11][3] ), .S0(n226), .S1(n220), .Y(n200) );
  AO22X1M U274 ( .A0(N39), .A1(n282), .B0(RD_DATA[4]), .B1(n259), .Y(n44) );
  MX4XLM U275 ( .A(n206), .B(n204), .C(n205), .D(n203), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U276 ( .A(\REG[8][4] ), .B(\REG[9][4] ), .C(\REG[10][4] ), .D(
        \REG[11][4] ), .S0(n226), .S1(n220), .Y(n204) );
  AO22X1M U277 ( .A0(N38), .A1(n282), .B0(RD_DATA[5]), .B1(n259), .Y(n45) );
  MX4XLM U278 ( .A(n210), .B(n208), .C(n209), .D(n207), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U279 ( .A(\REG[8][5] ), .B(\REG[9][5] ), .C(\REG[10][5] ), .D(
        \REG[11][5] ), .S0(N11), .S1(n221), .Y(n208) );
  AO22X1M U280 ( .A0(N37), .A1(n282), .B0(RD_DATA[6]), .B1(n259), .Y(n46) );
  MX4XLM U281 ( .A(n214), .B(n212), .C(n213), .D(n211), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U282 ( .A(\REG[8][6] ), .B(\REG[9][6] ), .C(\REG[10][6] ), .D(
        \REG[11][6] ), .S0(n222), .S1(n221), .Y(n212) );
  AO22X1M U283 ( .A0(N36), .A1(n282), .B0(RD_DATA[7]), .B1(n259), .Y(n47) );
  MX4XLM U284 ( .A(n218), .B(n216), .C(n217), .D(n215), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U285 ( .A(\REG[8][7] ), .B(\REG[9][7] ), .C(\REG[10][7] ), .D(
        \REG[11][7] ), .S0(n222), .S1(n221), .Y(n216) );
  MX4X1M U286 ( .A(\REG[4][0] ), .B(\REG[5][0] ), .C(\REG[6][0] ), .D(
        \REG[7][0] ), .S0(n225), .S1(n219), .Y(n189) );
  MX4X1M U287 ( .A(\REG[4][1] ), .B(\REG[5][1] ), .C(\REG[6][1] ), .D(
        \REG[7][1] ), .S0(n225), .S1(n220), .Y(n193) );
  MX4X1M U288 ( .A(\REG[12][0] ), .B(\REG[13][0] ), .C(\REG[14][0] ), .D(
        \REG[15][0] ), .S0(n225), .S1(n219), .Y(n187) );
  MX4X1M U289 ( .A(\REG[12][1] ), .B(\REG[13][1] ), .C(\REG[14][1] ), .D(
        \REG[15][1] ), .S0(n225), .S1(n219), .Y(n191) );
  AO22X1M U290 ( .A0(N43), .A1(n282), .B0(RD_DATA[0]), .B1(n259), .Y(n40) );
  MX4XLM U291 ( .A(n190), .B(n188), .C(n189), .D(n187), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U292 ( .A(\REG[8][0] ), .B(\REG[9][0] ), .C(\REG[10][0] ), .D(
        \REG[11][0] ), .S0(n225), .S1(n219), .Y(n188) );
  AO22X1M U293 ( .A0(N42), .A1(n282), .B0(RD_DATA[1]), .B1(n259), .Y(n41) );
  MX4XLM U294 ( .A(n194), .B(n192), .C(n193), .D(n191), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U295 ( .A(\REG[8][1] ), .B(\REG[9][1] ), .C(\REG[10][1] ), .D(
        \REG[11][1] ), .S0(n225), .S1(n219), .Y(n192) );
  OAI2BB1X2M U296 ( .A0N(RD_DATA_VALID), .A1N(n13), .B0(n259), .Y(n48) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n22, n23, \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] ,
         \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] ,
         \u_div/SumTmp[1][5] , \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] ,
         \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] ,
         \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] ,
         \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] ,
         \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] ,
         \u_div/SumTmp[6][1] , \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][1] ,
         \u_div/PartRem[2][2] , \u_div/PartRem[2][3] , \u_div/PartRem[2][4] ,
         \u_div/PartRem[2][5] , \u_div/PartRem[2][6] , \u_div/PartRem[3][1] ,
         \u_div/PartRem[3][2] , \u_div/PartRem[3][3] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[3][5] , \u_div/PartRem[4][1] , \u_div/PartRem[4][2] ,
         \u_div/PartRem[4][3] , \u_div/PartRem[4][4] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[5][2] , \u_div/PartRem[5][3] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[6][2] , \u_div/PartRem[7][1] , n1, n2, n5, n6, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_2  ( .A(n6), .B(n16), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_2  ( .A(n5), .B(n16), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_3  ( .A(n1), .B(n15), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  OR2X6M U1 ( .A(a[6]), .B(n18), .Y(\u_div/CryTmp[6][1] ) );
  XNOR2X1M U2 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  OR2X4M U3 ( .A(a[5]), .B(n18), .Y(\u_div/CryTmp[5][1] ) );
  XNOR2X1M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  CLKINVX40M U5 ( .A(b[0]), .Y(n18) );
  BUFX16M U6 ( .A(\u_div/PartRem[5][2] ), .Y(n5) );
  BUFX14M U7 ( .A(n10), .Y(quotient[5]) );
  INVX8M U8 ( .A(b[2]), .Y(n16) );
  INVX8M U9 ( .A(b[1]), .Y(n17) );
  INVX32M U10 ( .A(b[5]), .Y(n13) );
  MX2X4M U11 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  INVX16M U12 ( .A(b[3]), .Y(n15) );
  MX2X4M U13 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  BUFX16M U14 ( .A(n23), .Y(quotient[2]) );
  INVX12M U15 ( .A(n2), .Y(quotient[3]) );
  BUFX14M U16 ( .A(n22), .Y(quotient[4]) );
  AND4X8M U17 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  INVX20M U18 ( .A(b[4]), .Y(n14) );
  BUFX4M U19 ( .A(\u_div/PartRem[4][3] ), .Y(n1) );
  MX2X1M U20 ( .A(n1), .B(\u_div/SumTmp[3][3] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][4] ) );
  NAND3X4M U21 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(n2) );
  MX2X2M U22 ( .A(n6), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][3] ) );
  MX2X8M U23 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X4M U24 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  MX2X2M U25 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKAND2X6M U26 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(n23) );
  MX2XLM U27 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  MX2XLM U28 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  MX2XLM U29 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  MX2XLM U30 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  MX2XLM U31 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKAND2X2M U32 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(n22) );
  AND2X12M U33 ( .A(n20), .B(n15), .Y(n19) );
  CLKMX2X12M U34 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  MX2X6M U35 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  MX2X1M U36 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X8M U37 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X12M U38 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X6M U39 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  MX2XLM U40 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  MX2X6M U41 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  BUFX10M U42 ( .A(\u_div/PartRem[4][2] ), .Y(n6) );
  CLKAND2X2M U43 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(n10) );
  MX2X4M U44 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  AND2X12M U45 ( .A(\u_div/CryTmp[6][2] ), .B(n9), .Y(quotient[6]) );
  AND2X2M U46 ( .A(n19), .B(n16), .Y(n9) );
  AND2X12M U47 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
  NOR2X12M U48 ( .A(b[6]), .B(b[7]), .Y(n21) );
  CLKINVX1M U49 ( .A(b[6]), .Y(n12) );
  MX2X1M U50 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  MX2X1M U51 ( .A(n5), .B(\u_div/SumTmp[4][2] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][3] ) );
  MX2X1M U52 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  MX2X1M U53 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U54 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  MX2X1M U55 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  XNOR2X1M U56 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  AND3X12M U57 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  OR2X2M U58 ( .A(a[7]), .B(n18), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U59 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U60 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U61 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U62 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U63 ( .A(a[4]), .B(n18), .Y(\u_div/CryTmp[4][1] ) );
  OR2X2M U64 ( .A(a[3]), .B(n18), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U65 ( .A(a[2]), .B(n18), .Y(\u_div/CryTmp[2][1] ) );
  OR2X2M U66 ( .A(a[1]), .B(n18), .Y(\u_div/CryTmp[1][1] ) );
  NAND2BX2M U67 ( .AN(a[0]), .B(b[0]), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U68 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U69 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXLM U1 ( .A(B[6]), .Y(n3) );
  CLKINVX1M U2 ( .A(B[0]), .Y(n9) );
  INVXLM U3 ( .A(B[1]), .Y(n8) );
  INVXLM U4 ( .A(B[2]), .Y(n7) );
  INVXLM U5 ( .A(B[3]), .Y(n6) );
  INVXLM U6 ( .A(B[4]), .Y(n5) );
  INVXLM U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(carry[8]), .Y(DIFF[8]) );
  OR2X2M U9 ( .A(A[0]), .B(n9), .Y(carry[1]) );
  INVX2M U10 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U11 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFHXLM U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  OAI21BX4M U2 ( .A0(n12), .A1(n13), .B0N(n14), .Y(n10) );
  AOI2BB1X2M U3 ( .A0N(n1), .A1N(n4), .B0(n3), .Y(n17) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n7) );
  NOR2X2M U5 ( .A(B[9]), .B(A[9]), .Y(n4) );
  NOR2X2M U6 ( .A(B[10]), .B(A[10]), .Y(n16) );
  NOR2X2M U7 ( .A(B[11]), .B(A[11]), .Y(n12) );
  NAND2X2M U8 ( .A(A[7]), .B(B[7]), .Y(n6) );
  CLKXOR2X2M U9 ( .A(B[13]), .B(n9), .Y(SUM[13]) );
  CLKXOR2X2M U10 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  XNOR2X1M U11 ( .A(n1), .B(n2), .Y(SUM[9]) );
  NOR2X1M U12 ( .A(n3), .B(n4), .Y(n2) );
  CLKXOR2X2M U13 ( .A(n5), .B(n6), .Y(SUM[8]) );
  NAND2BX1M U14 ( .AN(n7), .B(n8), .Y(n5) );
  OAI2BB1X1M U15 ( .A0N(n10), .A1N(A[12]), .B0(n11), .Y(n9) );
  OAI21X1M U16 ( .A0(A[12]), .A1(n10), .B0(B[12]), .Y(n11) );
  XOR3XLM U17 ( .A(B[12]), .B(A[12]), .C(n10), .Y(SUM[12]) );
  XNOR2X1M U18 ( .A(n13), .B(n15), .Y(SUM[11]) );
  NOR2X1M U19 ( .A(n14), .B(n12), .Y(n15) );
  AND2X1M U20 ( .A(B[11]), .B(A[11]), .Y(n14) );
  OA21X1M U21 ( .A0(n16), .A1(n17), .B0(n18), .Y(n13) );
  CLKXOR2X2M U22 ( .A(n19), .B(n17), .Y(SUM[10]) );
  AND2X1M U23 ( .A(B[9]), .B(A[9]), .Y(n3) );
  OA21X1M U24 ( .A0(n6), .A1(n7), .B0(n8), .Y(n1) );
  CLKNAND2X2M U25 ( .A(B[8]), .B(A[8]), .Y(n8) );
  NAND2BX1M U26 ( .AN(n16), .B(n18), .Y(n19) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n18) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n12, n13, 
        n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n8), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  NOR2X2M U2 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n8) );
  AND2X2M U9 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U10 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  NOR2X2M U11 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U12 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U13 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U14 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U15 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  CLKXOR2X2M U16 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  NOR2X2M U17 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U18 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U19 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U20 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U21 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U22 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U23 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X2M U24 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U25 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U26 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  CLKINVX4M U27 ( .A(B[6]), .Y(n18) );
  CLKINVX4M U28 ( .A(B[2]), .Y(n22) );
  CLKINVX4M U29 ( .A(B[1]), .Y(n23) );
  CLKINVX4M U30 ( .A(B[3]), .Y(n21) );
  CLKINVX4M U31 ( .A(B[4]), .Y(n20) );
  CLKINVX4M U32 ( .A(B[5]), .Y(n19) );
  CLKINVX4M U33 ( .A(B[0]), .Y(n24) );
  CLKXOR2X2M U34 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U35 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U36 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U37 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U38 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n12) );
  AND2X2M U39 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n13) );
  CLKXOR2X2M U40 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U41 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  AND2X2M U42 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U43 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U44 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U45 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  XOR2X1M U46 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1M U47 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2X1M U48 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1M U49 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U50 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  INVX4M U51 ( .A(A[2]), .Y(n30) );
  XOR2X1M U52 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  INVX4M U53 ( .A(A[3]), .Y(n29) );
  INVX4M U54 ( .A(A[4]), .Y(n28) );
  INVX4M U55 ( .A(A[5]), .Y(n27) );
  INVX4M U56 ( .A(A[7]), .Y(n25) );
  INVX4M U57 ( .A(A[6]), .Y(n26) );
  CLKXOR2X2M U58 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  INVX4M U59 ( .A(A[1]), .Y(n31) );
  INVX4M U60 ( .A(A[0]), .Y(n32) );
  INVX4M U61 ( .A(B[7]), .Y(n17) );
  NOR2X1M U63 ( .A(n25), .B(n18), .Y(\ab[7][6] ) );
  NOR2X1M U64 ( .A(n25), .B(n19), .Y(\ab[7][5] ) );
  NOR2X1M U65 ( .A(n25), .B(n20), .Y(\ab[7][4] ) );
  NOR2X1M U66 ( .A(n25), .B(n21), .Y(\ab[7][3] ) );
  NOR2X1M U67 ( .A(n25), .B(n22), .Y(\ab[7][2] ) );
  NOR2X1M U68 ( .A(n25), .B(n23), .Y(\ab[7][1] ) );
  NOR2X1M U69 ( .A(n25), .B(n24), .Y(\ab[7][0] ) );
  NOR2X1M U70 ( .A(n17), .B(n26), .Y(\ab[6][7] ) );
  NOR2X1M U71 ( .A(n18), .B(n26), .Y(\ab[6][6] ) );
  NOR2X1M U72 ( .A(n19), .B(n26), .Y(\ab[6][5] ) );
  NOR2X1M U73 ( .A(n20), .B(n26), .Y(\ab[6][4] ) );
  NOR2X1M U74 ( .A(n21), .B(n26), .Y(\ab[6][3] ) );
  NOR2X1M U75 ( .A(n22), .B(n26), .Y(\ab[6][2] ) );
  NOR2X1M U76 ( .A(n23), .B(n26), .Y(\ab[6][1] ) );
  NOR2X1M U77 ( .A(n24), .B(n26), .Y(\ab[6][0] ) );
  NOR2X1M U78 ( .A(n17), .B(n27), .Y(\ab[5][7] ) );
  NOR2X1M U79 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U80 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U81 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U82 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U83 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U84 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U85 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U86 ( .A(n17), .B(n28), .Y(\ab[4][7] ) );
  NOR2X1M U87 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U88 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U89 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U90 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U91 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U92 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U93 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U94 ( .A(n17), .B(n29), .Y(\ab[3][7] ) );
  NOR2X1M U95 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U96 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U97 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U98 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U99 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U100 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U101 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U102 ( .A(n17), .B(n30), .Y(\ab[2][7] ) );
  NOR2X1M U103 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U104 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U105 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U106 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U107 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U108 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U109 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U110 ( .A(n17), .B(n31), .Y(\ab[1][7] ) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4 ( CLK, RST, A, B, ALU_FUN, ALU_EN, 
        ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_EN;
  output OUT_VALID;
  wire   N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N129, N154, N155, N157, N158,
         N159, N160, N161, N162, N163, N164, N165, N166, N167, N168, N169,
         N170, N171, N172, N173, \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_4 ,
         \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 ,
         \U3/U2/Z_3 , \U3/U2/Z_4 , \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n61, n62, n63, n64, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n60, n65, n66, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156;

  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW_div_uns_0 div_48 ( .a({n21, n20, n19, n18, 
        n17, n16, A[1:0]}), .b(B), .quotient({N129, N128, N127, N126, N125, 
        N124, N123, N122}) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_sub_0 sub_36 ( .A({1'b0, n21, n20, n19, 
        n18, n17, n16, A[1:0]}), .B({1'b0, B}), .CI(1'b0), .DIFF({N105, N104, 
        N103, N102, N101, N100, N99, N98, N97}) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_0 add_30 ( .A({1'b0, n21, n20, n19, 
        n18, n17, n16, A[1:0]}), .B({1'b0, B}), .CI(1'b0), .SUM({N96, N95, N94, 
        N93, N92, N91, N90, N89, N88}) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW02_mult_0 mult_42 ( .A({n21, n20, n19, n18, 
        n17, n16, A[1:0]}), .B(B), .TC(1'b0), .PRODUCT({N121, N120, N119, N118, 
        N117, N116, N115, N114, N113, N112, N111, N110, N109, N108, N107, N106}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(N172), .CK(CLK), .RN(n34), .Q(ALU_OUT[15])
         );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(N171), .CK(CLK), .RN(n34), .Q(ALU_OUT[14])
         );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(N170), .CK(CLK), .RN(n34), .Q(ALU_OUT[13])
         );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(N169), .CK(CLK), .RN(n34), .Q(ALU_OUT[12])
         );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(N168), .CK(CLK), .RN(n34), .Q(ALU_OUT[11])
         );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(N167), .CK(CLK), .RN(n34), .Q(ALU_OUT[10])
         );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(N166), .CK(CLK), .RN(n34), .Q(ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(N165), .CK(CLK), .RN(n34), .Q(ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(N164), .CK(CLK), .RN(n34), .Q(ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(N163), .CK(CLK), .RN(n34), .Q(ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(N162), .CK(CLK), .RN(n34), .Q(ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(N161), .CK(CLK), .RN(n35), .Q(ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(N160), .CK(CLK), .RN(n35), .Q(ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(N159), .CK(CLK), .RN(n35), .Q(ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(N158), .CK(CLK), .RN(n35), .Q(ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(N157), .CK(CLK), .RN(n35), .Q(ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(N173), .CK(CLK), .RN(n34), .Q(OUT_VALID) );
  NAND2X4M U3 ( .A(N122), .B(n61), .Y(n11) );
  BUFX20M U4 ( .A(A[6]), .Y(n20) );
  INVX4M U5 ( .A(n3), .Y(n25) );
  CLKBUFX6M U8 ( .A(A[5]), .Y(n19) );
  INVX4M U9 ( .A(n62), .Y(n149) );
  NAND2X2M U10 ( .A(n113), .B(n127), .Y(n3) );
  NAND2X2M U11 ( .A(n124), .B(n122), .Y(n4) );
  NAND2X2M U12 ( .A(n126), .B(n114), .Y(n5) );
  NAND3X4M U13 ( .A(n116), .B(n117), .C(n118), .Y(N157) );
  AND3X6M U14 ( .A(n10), .B(n11), .C(n12), .Y(n117) );
  BUFX32M U15 ( .A(A[7]), .Y(n21) );
  OAI2B2X4M U16 ( .A1N(\U3/U1/Z_7 ), .A0(\U3/U2/Z_7 ), .B0(n65), .B1(n60), .Y(
        N155) );
  NOR2BX2M U17 ( .AN(\U3/U2/Z_7 ), .B(\U3/U1/Z_7 ), .Y(n65) );
  BUFX4M U18 ( .A(n67), .Y(n6) );
  AOI211X2M U19 ( .A0(N105), .A1(n149), .B0(n25), .C0(n30), .Y(n67) );
  NAND3X2M U20 ( .A(n107), .B(n108), .C(n109), .Y(N158) );
  NOR3X2M U21 ( .A(n7), .B(n8), .C(n9), .Y(n108) );
  CLKAND2X6M U22 ( .A(n124), .B(n128), .Y(n61) );
  OAI2BB1XLM U23 ( .A0N(n41), .A1N(\U3/U1/Z_1 ), .B0(\U3/U2/Z_1 ), .Y(n40) );
  NOR2BX2M U24 ( .AN(\U3/U1/Z_0 ), .B(\U3/U2/Z_0 ), .Y(n41) );
  NOR2BX2M U25 ( .AN(\U3/U2/Z_0 ), .B(\U3/U1/Z_0 ), .Y(n37) );
  NAND2X2M U26 ( .A(N97), .B(n149), .Y(n10) );
  NAND2X2M U27 ( .A(N106), .B(n153), .Y(n12) );
  CLKBUFX6M U28 ( .A(A[4]), .Y(n18) );
  AND2X2M U29 ( .A(N107), .B(n153), .Y(n7) );
  AND2X2M U30 ( .A(n26), .B(A[1]), .Y(n8) );
  AND2X1M U31 ( .A(N123), .B(n61), .Y(n9) );
  CLKINVX2M U32 ( .A(B[6]), .Y(n134) );
  INVX8M U33 ( .A(n64), .Y(n153) );
  NOR2X4M U34 ( .A(n156), .B(ALU_FUN[0]), .Y(n114) );
  NOR2X4M U35 ( .A(n155), .B(ALU_FUN[1]), .Y(n122) );
  NOR2X4M U36 ( .A(n154), .B(ALU_FUN[2]), .Y(n128) );
  NOR2X4M U37 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n126) );
  NOR2X4M U38 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n127) );
  NOR2X4M U39 ( .A(n151), .B(ALU_FUN[3]), .Y(n124) );
  CLKBUFX6M U40 ( .A(A[3]), .Y(n17) );
  CLKBUFX6M U41 ( .A(A[2]), .Y(n16) );
  CLKINVX2M U42 ( .A(B[0]), .Y(n140) );
  CLKINVX2M U43 ( .A(B[1]), .Y(n139) );
  CLKINVX2M U44 ( .A(B[2]), .Y(n138) );
  CLKINVX2M U45 ( .A(B[4]), .Y(n136) );
  CLKINVX2M U46 ( .A(B[3]), .Y(n137) );
  CLKINVX2M U47 ( .A(B[5]), .Y(n135) );
  INVX4M U48 ( .A(n31), .Y(n32) );
  INVX4M U49 ( .A(n31), .Y(n33) );
  INVX2M U50 ( .A(n51), .Y(n31) );
  NOR2BX2M U51 ( .AN(n52), .B(n53), .Y(n51) );
  CLKBUFX6M U52 ( .A(n50), .Y(n23) );
  BUFX4M U53 ( .A(n50), .Y(n22) );
  NAND2X4M U54 ( .A(n58), .B(n125), .Y(n76) );
  INVX4M U55 ( .A(n3), .Y(n24) );
  INVX4M U56 ( .A(n4), .Y(n27) );
  INVX4M U57 ( .A(n5), .Y(n29) );
  INVX4M U58 ( .A(n5), .Y(n28) );
  INVX4M U59 ( .A(n4), .Y(n26) );
  INVX4M U60 ( .A(n63), .Y(n152) );
  INVX4M U61 ( .A(n115), .Y(n150) );
  NOR2X4M U62 ( .A(n156), .B(n151), .Y(n123) );
  NAND4BBX1M U63 ( .AN(n54), .BN(n30), .C(n56), .D(n57), .Y(N173) );
  NOR4BX2M U64 ( .AN(n58), .B(n59), .C(n26), .D(n61), .Y(n57) );
  NOR3X2M U65 ( .A(n150), .B(n24), .C(n28), .Y(n56) );
  NAND3X2M U66 ( .A(n62), .B(n63), .C(n64), .Y(n59) );
  NAND2X2M U67 ( .A(n128), .B(n123), .Y(n52) );
  AND2X2M U68 ( .A(n114), .B(n128), .Y(n53) );
  NAND2X2M U69 ( .A(n122), .B(n114), .Y(n50) );
  NAND2X2M U70 ( .A(n124), .B(n126), .Y(n62) );
  NAND2X2M U71 ( .A(n126), .B(n123), .Y(n125) );
  CLKBUFX6M U72 ( .A(n55), .Y(n30) );
  OAI2BB1X2M U73 ( .A0N(n124), .A1N(n113), .B0(n125), .Y(n55) );
  NOR2X4M U74 ( .A(n155), .B(n154), .Y(n113) );
  NAND2X2M U75 ( .A(n127), .B(n122), .Y(n58) );
  NAND2X4M U76 ( .A(n113), .B(n114), .Y(n69) );
  NAND2X2M U77 ( .A(n127), .B(n126), .Y(n63) );
  NAND2X2M U78 ( .A(n127), .B(n128), .Y(n64) );
  NAND2X2M U79 ( .A(n122), .B(n123), .Y(n115) );
  OAI2BB1XLM U80 ( .A0N(N120), .A1N(n153), .B0(n6), .Y(N171) );
  OAI2BB1XLM U81 ( .A0N(N121), .A1N(n153), .B0(n6), .Y(N172) );
  INVX2M U82 ( .A(\U3/U2/Z_6 ), .Y(n132) );
  OAI2BB1X2M U83 ( .A0N(N154), .A1N(n53), .B0(n129), .Y(n54) );
  OAI2BB1XLM U84 ( .A0N(n23), .A1N(n52), .B0(N155), .Y(n129) );
  INVX2M U85 ( .A(ALU_FUN[3]), .Y(n156) );
  INVX2M U86 ( .A(ALU_FUN[0]), .Y(n151) );
  INVX2M U87 ( .A(ALU_FUN[1]), .Y(n154) );
  OAI2BB1XLM U88 ( .A0N(N119), .A1N(n153), .B0(n6), .Y(N170) );
  INVX2M U89 ( .A(ALU_FUN[2]), .Y(n155) );
  OAI2BB1XLM U90 ( .A0N(N118), .A1N(n153), .B0(n6), .Y(N169) );
  OAI2BB1XLM U91 ( .A0N(N117), .A1N(n153), .B0(n6), .Y(N168) );
  OAI2BB1XLM U92 ( .A0N(N116), .A1N(n153), .B0(n6), .Y(N167) );
  INVX2M U93 ( .A(\U3/U2/Z_4 ), .Y(n131) );
  OAI2BB1XLM U94 ( .A0N(N115), .A1N(n153), .B0(n6), .Y(N166) );
  INVX6M U95 ( .A(n36), .Y(n34) );
  INVX4M U96 ( .A(n36), .Y(n35) );
  NAND3X2M U97 ( .A(n101), .B(n102), .C(n103), .Y(N159) );
  AOI22X1M U98 ( .A0(N99), .A1(n149), .B0(N90), .B1(n152), .Y(n101) );
  AOI221X2M U99 ( .A0(n150), .A1(n17), .B0(n24), .B1(n146), .C0(n104), .Y(n103) );
  AOI222X2M U100 ( .A0(N108), .A1(n153), .B0(n26), .B1(n16), .C0(N124), .C1(
        n61), .Y(n102) );
  OAI22X4M U101 ( .A0(n22), .A1(n140), .B0(n32), .B1(n148), .Y(\U3/U1/Z_0 ) );
  OAI22X4M U102 ( .A0(n22), .A1(n139), .B0(n33), .B1(n147), .Y(\U3/U1/Z_1 ) );
  OAI22X4M U103 ( .A0(n23), .A1(n146), .B0(n32), .B1(n138), .Y(\U3/U2/Z_2 ) );
  OAI22X4M U104 ( .A0(n23), .A1(n147), .B0(n33), .B1(n139), .Y(\U3/U2/Z_1 ) );
  OAI22X4M U105 ( .A0(n22), .A1(n148), .B0(n32), .B1(n140), .Y(\U3/U2/Z_0 ) );
  NAND3X2M U106 ( .A(n95), .B(n96), .C(n97), .Y(N160) );
  AOI22X1M U107 ( .A0(N100), .A1(n149), .B0(N91), .B1(n152), .Y(n95) );
  AOI221X2M U108 ( .A0(n150), .A1(n18), .B0(n25), .B1(n145), .C0(n98), .Y(n97)
         );
  AOI222X2M U109 ( .A0(N109), .A1(n153), .B0(n26), .B1(n17), .C0(N125), .C1(
        n61), .Y(n96) );
  OA22X2M U110 ( .A0(n22), .A1(n138), .B0(n32), .B1(n146), .Y(n13) );
  OAI22X4M U111 ( .A0(n23), .A1(n144), .B0(n32), .B1(n136), .Y(\U3/U2/Z_4 ) );
  OAI22X4M U112 ( .A0(n23), .A1(n145), .B0(n33), .B1(n137), .Y(\U3/U2/Z_3 ) );
  OAI22X4M U113 ( .A0(n22), .A1(n136), .B0(n32), .B1(n144), .Y(\U3/U1/Z_4 ) );
  OA22X2M U114 ( .A0(n22), .A1(n137), .B0(n33), .B1(n145), .Y(n14) );
  NAND3X2M U115 ( .A(n89), .B(n90), .C(n91), .Y(N161) );
  AOI22X1M U116 ( .A0(N101), .A1(n149), .B0(N92), .B1(n152), .Y(n89) );
  AOI221X2M U117 ( .A0(n150), .A1(n19), .B0(n24), .B1(n144), .C0(n92), .Y(n91)
         );
  AOI222X2M U118 ( .A0(N110), .A1(n153), .B0(n26), .B1(n18), .C0(N126), .C1(
        n61), .Y(n90) );
  OAI22X4M U119 ( .A0(n23), .A1(n142), .B0(n32), .B1(n134), .Y(\U3/U2/Z_6 ) );
  OAI22X4M U120 ( .A0(n23), .A1(n143), .B0(n33), .B1(n135), .Y(\U3/U2/Z_5 ) );
  OAI22X4M U121 ( .A0(n22), .A1(n134), .B0(n32), .B1(n142), .Y(\U3/U1/Z_6 ) );
  OAI22X4M U122 ( .A0(n23), .A1(n141), .B0(n33), .B1(n133), .Y(\U3/U2/Z_7 ) );
  INVX4M U123 ( .A(n16), .Y(n146) );
  OA22X2M U124 ( .A0(n22), .A1(n135), .B0(n33), .B1(n143), .Y(n15) );
  OAI2B11X1M U125 ( .A1N(N96), .A0(n63), .B0(n6), .C0(n68), .Y(N165) );
  AOI2BB2X2M U126 ( .B0(N114), .B1(n153), .A0N(n69), .A1N(n141), .Y(n68) );
  OAI22X4M U127 ( .A0(n133), .A1(n23), .B0(n33), .B1(n141), .Y(\U3/U1/Z_7 ) );
  INVX4M U128 ( .A(n17), .Y(n145) );
  INVX4M U129 ( .A(n18), .Y(n144) );
  NAND3X2M U130 ( .A(n83), .B(n84), .C(n85), .Y(N162) );
  AOI22X1M U131 ( .A0(N102), .A1(n149), .B0(N93), .B1(n152), .Y(n83) );
  AOI221X2M U132 ( .A0(n150), .A1(n20), .B0(n25), .B1(n143), .C0(n86), .Y(n85)
         );
  AOI222X2M U133 ( .A0(N111), .A1(n153), .B0(n26), .B1(n19), .C0(N127), .C1(
        n61), .Y(n84) );
  NAND3X2M U134 ( .A(n70), .B(n71), .C(n72), .Y(N164) );
  AOI22X1M U135 ( .A0(N104), .A1(n149), .B0(N95), .B1(n152), .Y(n70) );
  AOI221X2M U136 ( .A0(n24), .A1(n141), .B0(n27), .B1(n21), .C0(n73), .Y(n72)
         );
  AOI22X1M U137 ( .A0(N129), .A1(n61), .B0(N113), .B1(n153), .Y(n71) );
  INVX4M U138 ( .A(n19), .Y(n143) );
  INVX4M U139 ( .A(n20), .Y(n142) );
  NAND3X2M U140 ( .A(n77), .B(n78), .C(n79), .Y(N163) );
  AOI22X1M U141 ( .A0(N103), .A1(n149), .B0(N94), .B1(n152), .Y(n77) );
  AOI221X2M U142 ( .A0(n150), .A1(n21), .B0(n24), .B1(n142), .C0(n80), .Y(n79)
         );
  AOI222X2M U143 ( .A0(N112), .A1(n153), .B0(n26), .B1(n20), .C0(N128), .C1(
        n61), .Y(n78) );
  INVX4M U144 ( .A(n21), .Y(n141) );
  INVX2M U145 ( .A(RST), .Y(n36) );
  AOI221X2M U146 ( .A0(n25), .A1(n148), .B0(n27), .B1(A[0]), .C0(n119), .Y(
        n118) );
  AOI21X2M U147 ( .A0(N88), .A1(n152), .B0(n54), .Y(n116) );
  AOI22X1M U148 ( .A0(N98), .A1(n149), .B0(N89), .B1(n152), .Y(n107) );
  AOI221X2M U149 ( .A0(n150), .A1(n16), .B0(n25), .B1(n147), .C0(n110), .Y(
        n109) );
  INVX4M U150 ( .A(A[0]), .Y(n148) );
  INVX4M U151 ( .A(A[1]), .Y(n147) );
  INVX2M U152 ( .A(B[7]), .Y(n133) );
  OAI222X1M U153 ( .A0(n81), .A1(n134), .B0(B[6]), .B1(n82), .C0(n143), .C1(
        n69), .Y(n80) );
  AOI221X2M U154 ( .A0(n29), .A1(n20), .B0(n30), .B1(n142), .C0(n25), .Y(n82)
         );
  AOI221X2M U155 ( .A0(n29), .A1(n142), .B0(n20), .B1(n76), .C0(n27), .Y(n81)
         );
  OAI222X1M U156 ( .A0(n74), .A1(n133), .B0(B[7]), .B1(n75), .C0(n142), .C1(
        n69), .Y(n73) );
  AOI221X2M U157 ( .A0(n29), .A1(n21), .B0(n30), .B1(n141), .C0(n24), .Y(n75)
         );
  AOI221X2M U158 ( .A0(n29), .A1(n141), .B0(n21), .B1(n76), .C0(n27), .Y(n74)
         );
  OAI222X1M U159 ( .A0(n120), .A1(n140), .B0(B[0]), .B1(n121), .C0(n147), .C1(
        n115), .Y(n119) );
  AOI221X2M U160 ( .A0(n28), .A1(A[0]), .B0(n30), .B1(n148), .C0(n25), .Y(n121) );
  AOI221X2M U161 ( .A0(n28), .A1(n148), .B0(A[0]), .B1(n76), .C0(n26), .Y(n120) );
  OAI222X1M U162 ( .A0(n111), .A1(n139), .B0(B[1]), .B1(n112), .C0(n148), .C1(
        n69), .Y(n110) );
  AOI221X2M U163 ( .A0(n28), .A1(A[1]), .B0(n30), .B1(n147), .C0(n24), .Y(n112) );
  AOI221X2M U164 ( .A0(n28), .A1(n147), .B0(A[1]), .B1(n76), .C0(n27), .Y(n111) );
  OAI222X1M U165 ( .A0(n105), .A1(n138), .B0(B[2]), .B1(n106), .C0(n147), .C1(
        n69), .Y(n104) );
  AOI221X2M U166 ( .A0(n28), .A1(n16), .B0(n30), .B1(n146), .C0(n25), .Y(n106)
         );
  AOI221X2M U167 ( .A0(n28), .A1(n146), .B0(n16), .B1(n76), .C0(n27), .Y(n105)
         );
  OAI222X1M U168 ( .A0(n99), .A1(n137), .B0(B[3]), .B1(n100), .C0(n146), .C1(
        n69), .Y(n98) );
  AOI221X2M U169 ( .A0(n29), .A1(n17), .B0(n30), .B1(n145), .C0(n24), .Y(n100)
         );
  AOI221X2M U170 ( .A0(n28), .A1(n145), .B0(n17), .B1(n76), .C0(n27), .Y(n99)
         );
  OAI222X1M U171 ( .A0(n93), .A1(n136), .B0(B[4]), .B1(n94), .C0(n145), .C1(
        n69), .Y(n92) );
  AOI221X2M U172 ( .A0(n29), .A1(n18), .B0(n30), .B1(n144), .C0(n25), .Y(n94)
         );
  AOI221X2M U173 ( .A0(n29), .A1(n144), .B0(n18), .B1(n76), .C0(n27), .Y(n93)
         );
  OAI222X1M U174 ( .A0(n87), .A1(n135), .B0(B[5]), .B1(n88), .C0(n144), .C1(
        n69), .Y(n86) );
  AOI221X2M U175 ( .A0(n29), .A1(n19), .B0(n30), .B1(n143), .C0(n24), .Y(n88)
         );
  AOI221X2M U176 ( .A0(n29), .A1(n143), .B0(n19), .B1(n76), .C0(n27), .Y(n87)
         );
  OAI2B2X1M U177 ( .A1N(\U3/U1/Z_1 ), .A0(n37), .B0(\U3/U2/Z_1 ), .B1(n37), 
        .Y(n38) );
  NAND2BX1M U178 ( .AN(\U3/U1/Z_6 ), .B(\U3/U2/Z_6 ), .Y(n49) );
  CLKNAND2X2M U179 ( .A(\U3/U2/Z_5 ), .B(n15), .Y(n48) );
  NAND2BX1M U180 ( .AN(\U3/U1/Z_4 ), .B(\U3/U2/Z_4 ), .Y(n45) );
  NAND4X1M U181 ( .A(n38), .B(n49), .C(n48), .D(n45), .Y(n130) );
  CLKNAND2X2M U182 ( .A(\U3/U2/Z_3 ), .B(n14), .Y(n44) );
  CLKNAND2X2M U183 ( .A(\U3/U2/Z_2 ), .B(n13), .Y(n39) );
  CLKNAND2X2M U184 ( .A(n44), .B(n39), .Y(n66) );
  OAI211X1M U185 ( .A0(\U3/U1/Z_1 ), .A1(n41), .B0(n40), .C0(n39), .Y(n42) );
  OAI221X1M U186 ( .A0(\U3/U2/Z_2 ), .A1(n13), .B0(\U3/U2/Z_3 ), .B1(n14), 
        .C0(n42), .Y(n43) );
  AOI32X1M U187 ( .A0(n45), .A1(n44), .A2(n43), .B0(\U3/U1/Z_4 ), .B1(n131), 
        .Y(n46) );
  OAI21X1M U188 ( .A0(\U3/U2/Z_5 ), .A1(n15), .B0(n46), .Y(n47) );
  AOI32X1M U189 ( .A0(n49), .A1(n48), .A2(n47), .B0(\U3/U1/Z_6 ), .B1(n132), 
        .Y(n60) );
  NOR4X1M U190 ( .A(n130), .B(n66), .C(N155), .D(n65), .Y(N154) );
endmodule


module CLK_GATE ( CLK, CLK_EN, GATED_CLK );
  input CLK, CLK_EN;
  output GATED_CLK;
  wire   latch_out;

  TLATNX1M latch_out_reg ( .D(CLK_EN), .GN(CLK), .Q(latch_out) );
  CLKAND2X6M U2 ( .A(latch_out), .B(CLK), .Y(GATED_CLK) );
endmodule


module CLK_DIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  NOR3X12M U5 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR3X12M U6 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR4X6M U3 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U4 ( .A(n4), .B(n3), .C(IN[2]), .Y(n5) );
  NAND4BX2M U7 ( .AN(IN[3]), .B(IN[4]), .C(n2), .D(n1), .Y(n7) );
  NAND4BX2M U8 ( .AN(IN[4]), .B(IN[3]), .C(n2), .D(n1), .Y(n6) );
  OAI211X4M U9 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(OUT[0]) );
  NAND2X2M U10 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X2M U11 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n2), .Y(n8) );
  INVX2M U12 ( .A(IN[2]), .Y(n2) );
  INVX2M U13 ( .A(IN[1]), .Y(n3) );
  INVX2M U14 ( .A(IN[5]), .Y(n1) );
  INVX2M U15 ( .A(IN[0]), .Y(n4) );
endmodule


module Clk_Div_WIDTH8_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module Clk_Div_WIDTH8_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk
 );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   div_clk, flag, N9, N11, N12, N13, N14, N15, N16, N17, N19, N24, N25,
         N26, N27, N28, N29, N30, N31, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53;
  wire   [7:0] counter;

  Clk_Div_WIDTH8_0_DW01_inc_0 add_46 ( .A(counter), .SUM({N31, N30, N29, N28, 
        N27, N26, N25, N24}) );
  DFFRQX1M div_clk_reg ( .D(n19), .CK(i_ref_clk), .RN(n3), .Q(div_clk) );
  DFFRQX2M flag_reg ( .D(n28), .CK(i_ref_clk), .RN(n3), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(n20), .CK(i_ref_clk), .RN(n3), .Q(counter[7])
         );
  DFFRQX4M \counter_reg[1]  ( .D(n26), .CK(i_ref_clk), .RN(n3), .Q(counter[1])
         );
  DFFRQX4M \counter_reg[0]  ( .D(n27), .CK(i_ref_clk), .RN(n3), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[2]  ( .D(n25), .CK(i_ref_clk), .RN(n3), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[3]  ( .D(n24), .CK(i_ref_clk), .RN(n3), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[4]  ( .D(n23), .CK(i_ref_clk), .RN(n3), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[5]  ( .D(n22), .CK(i_ref_clk), .RN(n3), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[6]  ( .D(n21), .CK(i_ref_clk), .RN(n3), .Q(counter[6])
         );
  AOI21BX2M U3 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n5), .Y(n1) );
  NOR2X2M U4 ( .A(n40), .B(N9), .Y(n29) );
  CLKINVX2M U5 ( .A(counter[0]), .Y(n40) );
  NOR3X2M U6 ( .A(n31), .B(N16), .C(counter[7]), .Y(n37) );
  NOR3X4M U7 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n8), .Y(N16) );
  NAND2BX2M U8 ( .AN(i_div_ratio[2]), .B(N9), .Y(n5) );
  OR2X2M U9 ( .A(n5), .B(i_div_ratio[3]), .Y(n6) );
  OAI2BB1XLM U10 ( .A0N(n5), .A1N(i_div_ratio[3]), .B0(n6), .Y(N11) );
  NOR2BX2M U11 ( .AN(i_div_ratio[1]), .B(counter[0]), .Y(n42) );
  NOR2BX2M U12 ( .AN(counter[0]), .B(i_div_ratio[1]), .Y(n41) );
  OAI2BB1XLM U13 ( .A0N(n6), .A1N(i_div_ratio[4]), .B0(n7), .Y(N12) );
  OR2X2M U14 ( .A(n7), .B(i_div_ratio[5]), .Y(n8) );
  OR2X2M U15 ( .A(n6), .B(i_div_ratio[4]), .Y(n7) );
  BUFX6M U16 ( .A(n12), .Y(n2) );
  NOR2BX8M U17 ( .AN(n11), .B(n2), .Y(n13) );
  AOI2B1X2M U18 ( .A1N(i_div_ratio[0]), .A0(N17), .B0(n52), .Y(n11) );
  INVX2M U19 ( .A(n14), .Y(n52) );
  INVX2M U20 ( .A(i_div_ratio[1]), .Y(N9) );
  INVX6M U21 ( .A(n4), .Y(n3) );
  INVX2M U22 ( .A(i_rst_n), .Y(n4) );
  INVX2M U23 ( .A(n2), .Y(n53) );
  CLKXOR2X2M U24 ( .A(div_clk), .B(n10), .Y(n19) );
  NOR2X2M U25 ( .A(n11), .B(n2), .Y(n10) );
  NAND2X2M U26 ( .A(i_div_ratio[0]), .B(n16), .Y(n14) );
  AO2B2X2M U27 ( .B0(N17), .B1(flag), .A0(N19), .A1N(flag), .Y(n16) );
  AO22X1M U28 ( .A0(counter[7]), .A1(n2), .B0(N31), .B1(n13), .Y(n20) );
  AO22X1M U29 ( .A0(counter[6]), .A1(n2), .B0(N30), .B1(n13), .Y(n21) );
  AO22X1M U30 ( .A0(counter[5]), .A1(n2), .B0(N29), .B1(n13), .Y(n22) );
  AO22X1M U31 ( .A0(counter[4]), .A1(n2), .B0(N28), .B1(n13), .Y(n23) );
  AO22X1M U32 ( .A0(counter[3]), .A1(n2), .B0(N27), .B1(n13), .Y(n24) );
  AO22X1M U33 ( .A0(counter[2]), .A1(n2), .B0(N26), .B1(n13), .Y(n25) );
  AO22X1M U34 ( .A0(counter[1]), .A1(n2), .B0(N25), .B1(n13), .Y(n26) );
  AO22X1M U35 ( .A0(counter[0]), .A1(n2), .B0(N24), .B1(n13), .Y(n27) );
  CLKXOR2X2M U36 ( .A(flag), .B(n15), .Y(n28) );
  NOR2X2M U37 ( .A(n2), .B(n14), .Y(n15) );
  OAI2BB1X2M U38 ( .A0N(n17), .A1N(n18), .B0(i_clk_en), .Y(n12) );
  NOR4X2M U39 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n18) );
  NOR3X2M U40 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n17) );
  MX2XLM U41 ( .A(i_ref_clk), .B(div_clk), .S0(n53), .Y(o_div_clk) );
  OAI2BB1X1M U42 ( .A0N(n7), .A1N(i_div_ratio[5]), .B0(n8), .Y(N13) );
  XNOR2X1M U43 ( .A(i_div_ratio[6]), .B(n8), .Y(N14) );
  OAI21X1M U44 ( .A0(i_div_ratio[6]), .A1(n8), .B0(i_div_ratio[7]), .Y(n9) );
  NAND2BX1M U45 ( .AN(N16), .B(n9), .Y(N15) );
  XNOR2X1M U46 ( .A(N11), .B(counter[2]), .Y(n39) );
  OAI22X1M U47 ( .A0(counter[1]), .A1(n29), .B0(n29), .B1(n1), .Y(n38) );
  CLKNAND2X2M U48 ( .A(N9), .B(n40), .Y(n30) );
  AOI22X1M U49 ( .A0(n30), .A1(n1), .B0(n30), .B1(counter[1]), .Y(n31) );
  CLKXOR2X2M U50 ( .A(N12), .B(counter[3]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(N13), .B(counter[4]), .Y(n34) );
  CLKXOR2X2M U52 ( .A(N14), .B(counter[5]), .Y(n33) );
  CLKXOR2X2M U53 ( .A(N15), .B(counter[6]), .Y(n32) );
  NOR4X1M U54 ( .A(n35), .B(n34), .C(n33), .D(n32), .Y(n36) );
  AND4X1M U55 ( .A(n39), .B(n38), .C(n37), .D(n36), .Y(N17) );
  OAI2B2X1M U56 ( .A1N(i_div_ratio[2]), .A0(n41), .B0(counter[1]), .B1(n41), 
        .Y(n45) );
  XNOR2X1M U57 ( .A(i_div_ratio[3]), .B(counter[2]), .Y(n44) );
  OAI2B2X1M U58 ( .A1N(counter[1]), .A0(n42), .B0(i_div_ratio[2]), .B1(n42), 
        .Y(n43) );
  NAND4BX1M U59 ( .AN(counter[7]), .B(n45), .C(n44), .D(n43), .Y(n51) );
  XNOR2X1M U60 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n49) );
  XNOR2X1M U61 ( .A(i_div_ratio[6]), .B(counter[5]), .Y(n48) );
  XNOR2X1M U62 ( .A(i_div_ratio[5]), .B(counter[4]), .Y(n47) );
  XNOR2X1M U63 ( .A(i_div_ratio[4]), .B(counter[3]), .Y(n46) );
  NAND4X1M U64 ( .A(n49), .B(n48), .C(n47), .D(n46), .Y(n50) );
  NOR2X1M U65 ( .A(n51), .B(n50), .Y(N19) );
endmodule


module Clk_Div_WIDTH8_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module Clk_Div_WIDTH8_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk
 );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   div_clk, flag, N9, N11, N12, N13, N14, N15, N16, N17, N19, N24, N25,
         N26, N27, N28, N29, N30, N31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72;
  wire   [7:0] counter;

  Clk_Div_WIDTH8_1_DW01_inc_0 add_46 ( .A(counter), .SUM({N31, N30, N29, N28, 
        N27, N26, N25, N24}) );
  DFFRQX1M div_clk_reg ( .D(n63), .CK(i_ref_clk), .RN(n3), .Q(div_clk) );
  DFFRQX2M flag_reg ( .D(n54), .CK(i_ref_clk), .RN(n3), .Q(flag) );
  DFFRQX2M \counter_reg[7]  ( .D(n62), .CK(i_ref_clk), .RN(n3), .Q(counter[7])
         );
  DFFRQX4M \counter_reg[1]  ( .D(n56), .CK(i_ref_clk), .RN(n3), .Q(counter[1])
         );
  DFFRQX4M \counter_reg[0]  ( .D(n55), .CK(i_ref_clk), .RN(n3), .Q(counter[0])
         );
  DFFRQX2M \counter_reg[2]  ( .D(n57), .CK(i_ref_clk), .RN(n3), .Q(counter[2])
         );
  DFFRQX2M \counter_reg[3]  ( .D(n58), .CK(i_ref_clk), .RN(n3), .Q(counter[3])
         );
  DFFRQX2M \counter_reg[4]  ( .D(n59), .CK(i_ref_clk), .RN(n3), .Q(counter[4])
         );
  DFFRQX2M \counter_reg[5]  ( .D(n60), .CK(i_ref_clk), .RN(n3), .Q(counter[5])
         );
  DFFRQX2M \counter_reg[6]  ( .D(n61), .CK(i_ref_clk), .RN(n3), .Q(counter[6])
         );
  AOI21BX2M U3 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n5), .Y(n1) );
  NOR3X2M U4 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), .Y(
        n65) );
  NOR3X4M U5 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n8), .Y(N16) );
  NOR4X1M U6 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), .D(
        i_div_ratio[4]), .Y(n64) );
  NOR2X2M U7 ( .A(n40), .B(N9), .Y(n29) );
  CLKINVX2M U8 ( .A(counter[0]), .Y(n40) );
  NOR3X2M U9 ( .A(n31), .B(N16), .C(counter[7]), .Y(n37) );
  NOR2BX2M U10 ( .AN(i_div_ratio[1]), .B(counter[0]), .Y(n42) );
  NOR2BX2M U11 ( .AN(counter[0]), .B(i_div_ratio[1]), .Y(n41) );
  OR2X2M U12 ( .A(n7), .B(i_div_ratio[5]), .Y(n8) );
  NAND2BX2M U13 ( .AN(i_div_ratio[2]), .B(N9), .Y(n5) );
  OR2X2M U14 ( .A(n5), .B(i_div_ratio[3]), .Y(n6) );
  OR2X2M U15 ( .A(n6), .B(i_div_ratio[4]), .Y(n7) );
  OAI2BB1XLM U16 ( .A0N(n5), .A1N(i_div_ratio[3]), .B0(n6), .Y(N11) );
  BUFX6M U17 ( .A(n70), .Y(n2) );
  NOR2BX8M U18 ( .AN(n71), .B(n2), .Y(n69) );
  INVX6M U19 ( .A(n4), .Y(n3) );
  INVX2M U20 ( .A(i_rst_n), .Y(n4) );
  INVX2M U21 ( .A(n2), .Y(n53) );
  AOI2B1X2M U22 ( .A1N(i_div_ratio[0]), .A0(N17), .B0(n52), .Y(n71) );
  INVX2M U23 ( .A(n68), .Y(n52) );
  CLKXOR2X2M U24 ( .A(div_clk), .B(n72), .Y(n63) );
  NOR2X2M U25 ( .A(n71), .B(n2), .Y(n72) );
  NAND2X2M U26 ( .A(i_div_ratio[0]), .B(n66), .Y(n68) );
  AO2B2X2M U27 ( .B0(N17), .B1(flag), .A0(N19), .A1N(flag), .Y(n66) );
  AO22X1M U28 ( .A0(counter[7]), .A1(n2), .B0(N31), .B1(n69), .Y(n62) );
  AO22X1M U29 ( .A0(counter[6]), .A1(n2), .B0(N30), .B1(n69), .Y(n61) );
  AO22X1M U30 ( .A0(counter[5]), .A1(n2), .B0(N29), .B1(n69), .Y(n60) );
  AO22X1M U31 ( .A0(counter[4]), .A1(n2), .B0(N28), .B1(n69), .Y(n59) );
  AO22X1M U32 ( .A0(counter[3]), .A1(n2), .B0(N27), .B1(n69), .Y(n58) );
  AO22X1M U33 ( .A0(counter[2]), .A1(n2), .B0(N26), .B1(n69), .Y(n57) );
  AO22X1M U34 ( .A0(counter[1]), .A1(n2), .B0(N25), .B1(n69), .Y(n56) );
  AO22X1M U35 ( .A0(counter[0]), .A1(n2), .B0(N24), .B1(n69), .Y(n55) );
  CLKXOR2X2M U36 ( .A(flag), .B(n67), .Y(n54) );
  NOR2X2M U37 ( .A(n2), .B(n68), .Y(n67) );
  OAI2BB1X2M U38 ( .A0N(n65), .A1N(n64), .B0(i_clk_en), .Y(n70) );
  INVX2M U39 ( .A(i_div_ratio[1]), .Y(N9) );
  MX2XLM U40 ( .A(i_ref_clk), .B(div_clk), .S0(n53), .Y(o_div_clk) );
  OAI2BB1X1M U41 ( .A0N(n6), .A1N(i_div_ratio[4]), .B0(n7), .Y(N12) );
  OAI2BB1X1M U42 ( .A0N(n7), .A1N(i_div_ratio[5]), .B0(n8), .Y(N13) );
  XNOR2X1M U43 ( .A(i_div_ratio[6]), .B(n8), .Y(N14) );
  OAI21X1M U44 ( .A0(i_div_ratio[6]), .A1(n8), .B0(i_div_ratio[7]), .Y(n9) );
  NAND2BX1M U45 ( .AN(N16), .B(n9), .Y(N15) );
  XNOR2X1M U46 ( .A(N11), .B(counter[2]), .Y(n39) );
  OAI22X1M U47 ( .A0(counter[1]), .A1(n29), .B0(n29), .B1(n1), .Y(n38) );
  CLKNAND2X2M U48 ( .A(N9), .B(n40), .Y(n30) );
  AOI22X1M U49 ( .A0(n30), .A1(n1), .B0(n30), .B1(counter[1]), .Y(n31) );
  CLKXOR2X2M U50 ( .A(N12), .B(counter[3]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(N13), .B(counter[4]), .Y(n34) );
  CLKXOR2X2M U52 ( .A(N14), .B(counter[5]), .Y(n33) );
  CLKXOR2X2M U53 ( .A(N15), .B(counter[6]), .Y(n32) );
  NOR4X1M U54 ( .A(n35), .B(n34), .C(n33), .D(n32), .Y(n36) );
  AND4X1M U55 ( .A(n39), .B(n38), .C(n37), .D(n36), .Y(N17) );
  OAI2B2X1M U56 ( .A1N(i_div_ratio[2]), .A0(n41), .B0(counter[1]), .B1(n41), 
        .Y(n45) );
  XNOR2X1M U57 ( .A(i_div_ratio[3]), .B(counter[2]), .Y(n44) );
  OAI2B2X1M U58 ( .A1N(counter[1]), .A0(n42), .B0(i_div_ratio[2]), .B1(n42), 
        .Y(n43) );
  NAND4BX1M U59 ( .AN(counter[7]), .B(n45), .C(n44), .D(n43), .Y(n51) );
  XNOR2X1M U60 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n49) );
  XNOR2X1M U61 ( .A(i_div_ratio[6]), .B(counter[5]), .Y(n48) );
  XNOR2X1M U62 ( .A(i_div_ratio[5]), .B(counter[4]), .Y(n47) );
  XNOR2X1M U63 ( .A(i_div_ratio[4]), .B(counter[3]), .Y(n46) );
  NAND4X1M U64 ( .A(n49), .B(n48), .C(n47), .D(n46), .Y(n50) );
  NOR2X1M U65 ( .A(n51), .B(n50), .Y(N19) );
endmodule


module DF_SYNC_ADDRESS_WIDTH4_0 ( CLK, RST, ASYNC, SYNC );
  input [4:0] ASYNC;
  output [4:0] SYNC;
  input CLK, RST;
  wire   n1, n2;
  wire   [3:0] REG;
  assign SYNC[4] = 1'b0;

  DFFRQX1M \SYNC_reg[1]  ( .D(REG[1]), .CK(CLK), .RN(n1), .Q(SYNC[1]) );
  DFFRQX1M \SYNC_reg[0]  ( .D(REG[0]), .CK(CLK), .RN(n1), .Q(SYNC[0]) );
  DFFRQX1M \SYNC_reg[3]  ( .D(REG[3]), .CK(CLK), .RN(n1), .Q(SYNC[3]) );
  DFFRQX1M \SYNC_reg[2]  ( .D(REG[2]), .CK(CLK), .RN(n1), .Q(SYNC[2]) );
  DFFRQX1M \REG_reg[3]  ( .D(ASYNC[3]), .CK(CLK), .RN(n1), .Q(REG[3]) );
  DFFRQX1M \REG_reg[2]  ( .D(ASYNC[2]), .CK(CLK), .RN(n1), .Q(REG[2]) );
  DFFRQX1M \REG_reg[1]  ( .D(ASYNC[1]), .CK(CLK), .RN(n1), .Q(REG[1]) );
  DFFRQX1M \REG_reg[0]  ( .D(ASYNC[0]), .CK(CLK), .RN(n1), .Q(REG[0]) );
  INVX4M U4 ( .A(n2), .Y(n1) );
  INVX2M U5 ( .A(RST), .Y(n2) );
endmodule


module DF_SYNC_ADDRESS_WIDTH4_1 ( CLK, RST, ASYNC, SYNC );
  input [4:0] ASYNC;
  output [4:0] SYNC;
  input CLK, RST;
  wire   n1, n2;
  wire   [3:0] REG;
  assign SYNC[4] = 1'b0;

  DFFRQX1M \SYNC_reg[2]  ( .D(REG[2]), .CK(CLK), .RN(n1), .Q(SYNC[2]) );
  DFFRQX1M \SYNC_reg[3]  ( .D(REG[3]), .CK(CLK), .RN(n1), .Q(SYNC[3]) );
  DFFRQX1M \SYNC_reg[1]  ( .D(REG[1]), .CK(CLK), .RN(n1), .Q(SYNC[1]) );
  DFFRQX1M \SYNC_reg[0]  ( .D(REG[0]), .CK(CLK), .RN(n1), .Q(SYNC[0]) );
  DFFRQX1M \REG_reg[3]  ( .D(ASYNC[3]), .CK(CLK), .RN(n1), .Q(REG[3]) );
  DFFRQX1M \REG_reg[2]  ( .D(ASYNC[2]), .CK(CLK), .RN(n1), .Q(REG[2]) );
  DFFRQX1M \REG_reg[1]  ( .D(ASYNC[1]), .CK(CLK), .RN(n1), .Q(REG[1]) );
  DFFRQX1M \REG_reg[0]  ( .D(ASYNC[0]), .CK(CLK), .RN(n1), .Q(REG[0]) );
  INVX4M U4 ( .A(n2), .Y(n1) );
  INVX2M U5 ( .A(RST), .Y(n2) );
endmodule


module FIFO_WR_DATA_WIDTH8_ADDRESS_WIDTH4 ( W_INC, W_CLK, W_RST, SYNC_RD_PTR, 
        WR_ADDR, WR_PTR, FULL );
  input [4:0] SYNC_RD_PTR;
  output [3:0] WR_ADDR;
  output [4:0] WR_PTR;
  input W_INC, W_CLK, W_RST;
  output FULL;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N110, n5, n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, \add_28/carry[4] , \add_28/carry[3] ,
         \add_28/carry[2] , n1, n2, n3, n9;
  wire   [4:0] WR_PTR_binary;
  assign WR_PTR[4] = 1'b0;

  DFFRQX2M \WR_PTR_reg[2]  ( .D(n20), .CK(W_CLK), .RN(n1), .Q(WR_PTR[2]) );
  DFFRQX2M \WR_PTR_reg[0]  ( .D(n22), .CK(W_CLK), .RN(n1), .Q(WR_PTR[0]) );
  DFFRQX2M \WR_PTR_reg[1]  ( .D(n21), .CK(W_CLK), .RN(n1), .Q(WR_PTR[1]) );
  DFFRQX2M \WR_PTR_reg[3]  ( .D(n19), .CK(W_CLK), .RN(n1), .Q(WR_PTR[3]) );
  DFFRQX2M \WR_PTR_binary_reg[0]  ( .D(N34), .CK(W_CLK), .RN(n1), .Q(
        WR_PTR_binary[0]) );
  DFFRQX2M \WR_ADDR_reg[2]  ( .D(N32), .CK(W_CLK), .RN(n1), .Q(WR_ADDR[2]) );
  DFFRQX2M \WR_PTR_binary_reg[1]  ( .D(N35), .CK(W_CLK), .RN(n1), .Q(
        WR_PTR_binary[1]) );
  DFFRQX2M \WR_PTR_binary_reg[2]  ( .D(N36), .CK(W_CLK), .RN(n1), .Q(
        WR_PTR_binary[2]) );
  DFFRQX1M \WR_PTR_binary_reg[3]  ( .D(N37), .CK(W_CLK), .RN(n1), .Q(N110) );
  DFFRQX1M \WR_ADDR_reg[3]  ( .D(N33), .CK(W_CLK), .RN(n1), .Q(WR_ADDR[3]) );
  DFFRX4M \WR_PTR_binary_reg[4]  ( .D(N38), .CK(W_CLK), .RN(W_RST), .Q(
        WR_PTR_binary[4]), .QN(n23) );
  DFFRQX4M \WR_ADDR_reg[0]  ( .D(N30), .CK(W_CLK), .RN(n1), .Q(WR_ADDR[0]) );
  DFFRQX4M \WR_ADDR_reg[1]  ( .D(N31), .CK(W_CLK), .RN(n1), .Q(WR_ADDR[1]) );
  NAND2X2M U3 ( .A(W_INC), .B(n8), .Y(n10) );
  INVX4M U4 ( .A(n10), .Y(n3) );
  INVX6M U5 ( .A(n2), .Y(n1) );
  INVX2M U6 ( .A(W_RST), .Y(n2) );
  OAI2BB2X1M U7 ( .B0(n3), .B1(n9), .A0N(N28), .A1N(n3), .Y(N37) );
  INVX2M U8 ( .A(n8), .Y(FULL) );
  CLKXOR2X2M U9 ( .A(WR_ADDR[1]), .B(n13), .Y(N31) );
  CLKXOR2X2M U10 ( .A(WR_ADDR[3]), .B(n11), .Y(N33) );
  NOR2BX2M U11 ( .AN(WR_ADDR[2]), .B(n12), .Y(n11) );
  XNOR2X2M U12 ( .A(WR_ADDR[2]), .B(n12), .Y(N32) );
  NAND2X2M U13 ( .A(WR_ADDR[1]), .B(n13), .Y(n12) );
  AND2X2M U14 ( .A(WR_ADDR[0]), .B(n3), .Y(n13) );
  CLKXOR2X2M U15 ( .A(WR_ADDR[0]), .B(n3), .Y(N30) );
  OAI2BB2X1M U16 ( .B0(n23), .B1(n3), .A0N(N29), .A1N(n3), .Y(N38) );
  AO22X1M U17 ( .A0(n10), .A1(WR_PTR_binary[2]), .B0(N27), .B1(n3), .Y(N36) );
  AO22X1M U18 ( .A0(n10), .A1(WR_PTR_binary[1]), .B0(N26), .B1(n3), .Y(N35) );
  AO22X1M U19 ( .A0(n10), .A1(WR_PTR_binary[0]), .B0(N25), .B1(n3), .Y(N34) );
  INVX2M U20 ( .A(WR_PTR_binary[0]), .Y(N25) );
  ADDHX1M U21 ( .A(WR_PTR_binary[2]), .B(\add_28/carry[2] ), .CO(
        \add_28/carry[3] ), .S(N27) );
  ADDHX1M U22 ( .A(WR_PTR_binary[1]), .B(WR_PTR_binary[0]), .CO(
        \add_28/carry[2] ), .S(N26) );
  ADDHX1M U23 ( .A(N110), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), .S(
        N28) );
  OAI2BB2X1M U24 ( .B0(n9), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[3]), .Y(n19) );
  OAI2BB2X1M U25 ( .B0(n5), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[2]), .Y(n20) );
  CLKXOR2X2M U26 ( .A(n9), .B(WR_PTR_binary[2]), .Y(n5) );
  OAI2BB2X1M U27 ( .B0(n6), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[1]), .Y(n21) );
  XNOR2X2M U28 ( .A(WR_PTR_binary[1]), .B(WR_PTR_binary[2]), .Y(n6) );
  OAI2BB2X1M U29 ( .B0(n7), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[0]), .Y(n22) );
  XNOR2X2M U30 ( .A(WR_PTR_binary[0]), .B(WR_PTR_binary[1]), .Y(n7) );
  INVX2M U31 ( .A(N110), .Y(n9) );
  CLKXOR2X2M U32 ( .A(WR_PTR[0]), .B(SYNC_RD_PTR[0]), .Y(n17) );
  CLKXOR2X2M U34 ( .A(WR_PTR[1]), .B(SYNC_RD_PTR[1]), .Y(n18) );
  NAND4X2M U35 ( .A(SYNC_RD_PTR[4]), .B(n14), .C(n15), .D(n16), .Y(n8) );
  NOR2X2M U36 ( .A(n17), .B(n18), .Y(n16) );
  XNOR2X2M U37 ( .A(WR_PTR[2]), .B(SYNC_RD_PTR[2]), .Y(n15) );
  CLKXOR2X2M U38 ( .A(WR_PTR[3]), .B(SYNC_RD_PTR[3]), .Y(n14) );
  CLKXOR2X2M U39 ( .A(\add_28/carry[4] ), .B(WR_PTR_binary[4]), .Y(N29) );
endmodule


module FIFO_RD_DATA_WIDTH8_ADDRESS_WIDTH4 ( R_INC, R_CLK, R_RST, SYNC_WR_PTR, 
        RD_ADDR, RD_PTR, EMPTY );
  input [4:0] SYNC_WR_PTR;
  output [3:0] RD_ADDR;
  output [4:0] RD_PTR;
  input R_INC, R_CLK, R_RST;
  output EMPTY;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N110, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, \add_28/carry[4] , \add_28/carry[3] , \add_28/carry[2] , n1, n2,
         n3, n4, n8, n19, n20, n21, n22;
  wire   [4:0] RD_PTR_binary;
  assign RD_PTR[4] = 1'b0;
  assign EMPTY = N39;

  DFFRX4M \RD_ADDR_reg[2]  ( .D(N32), .CK(R_CLK), .RN(n1), .Q(RD_ADDR[2]), 
        .QN(n18) );
  DFFRQX1M \RD_ADDR_reg[3]  ( .D(N33), .CK(R_CLK), .RN(n1), .Q(RD_ADDR[3]) );
  DFFRQX2M \RD_PTR_reg[2]  ( .D(n14), .CK(R_CLK), .RN(n1), .Q(RD_PTR[2]) );
  DFFRQX2M \RD_PTR_reg[3]  ( .D(n13), .CK(R_CLK), .RN(n1), .Q(RD_PTR[3]) );
  DFFRQX2M \RD_PTR_reg[0]  ( .D(n16), .CK(R_CLK), .RN(n1), .Q(RD_PTR[0]) );
  DFFRQX2M \RD_PTR_reg[1]  ( .D(n15), .CK(R_CLK), .RN(n1), .Q(RD_PTR[1]) );
  DFFRQX2M \RD_ADDR_reg[0]  ( .D(N30), .CK(R_CLK), .RN(n1), .Q(RD_ADDR[0]) );
  DFFRQX2M \RD_PTR_binary_reg[0]  ( .D(N34), .CK(R_CLK), .RN(n1), .Q(
        RD_PTR_binary[0]) );
  DFFRQX2M \RD_ADDR_reg[1]  ( .D(N31), .CK(R_CLK), .RN(n1), .Q(RD_ADDR[1]) );
  DFFRQX2M \RD_PTR_binary_reg[1]  ( .D(N35), .CK(R_CLK), .RN(n1), .Q(
        RD_PTR_binary[1]) );
  DFFRQX2M \RD_PTR_binary_reg[2]  ( .D(N36), .CK(R_CLK), .RN(n1), .Q(
        RD_PTR_binary[2]) );
  DFFRQX1M \RD_PTR_binary_reg[3]  ( .D(N37), .CK(R_CLK), .RN(n1), .Q(N110) );
  DFFRX4M \RD_PTR_binary_reg[4]  ( .D(N38), .CK(R_CLK), .RN(R_RST), .Q(
        RD_PTR_binary[4]), .QN(n17) );
  NOR4X2M U3 ( .A(n20), .B(n19), .C(SYNC_WR_PTR[4]), .D(n8), .Y(N39) );
  NAND2BX2M U4 ( .AN(N39), .B(R_INC), .Y(n9) );
  INVX6M U5 ( .A(n2), .Y(n1) );
  INVX2M U6 ( .A(R_RST), .Y(n2) );
  INVX4M U7 ( .A(n9), .Y(n21) );
  OAI2BB2X1M U8 ( .B0(n21), .B1(n22), .A0N(N28), .A1N(n21), .Y(N37) );
  CLKXOR2X2M U9 ( .A(n11), .B(n18), .Y(N32) );
  CLKXOR2X2M U10 ( .A(RD_ADDR[0]), .B(n21), .Y(N30) );
  CLKXOR2X2M U11 ( .A(RD_ADDR[1]), .B(n12), .Y(N31) );
  CLKXOR2X2M U12 ( .A(RD_ADDR[3]), .B(n10), .Y(N33) );
  NOR2X2M U13 ( .A(n18), .B(n11), .Y(n10) );
  OAI2BB2X1M U14 ( .B0(n17), .B1(n21), .A0N(N29), .A1N(n21), .Y(N38) );
  NAND2X2M U15 ( .A(RD_ADDR[1]), .B(n12), .Y(n11) );
  AND2X2M U16 ( .A(RD_ADDR[0]), .B(n21), .Y(n12) );
  AO22X1M U17 ( .A0(n9), .A1(RD_PTR_binary[2]), .B0(N27), .B1(n21), .Y(N36) );
  AO22X1M U18 ( .A0(n9), .A1(RD_PTR_binary[1]), .B0(N26), .B1(n21), .Y(N35) );
  AO22X1M U19 ( .A0(n9), .A1(RD_PTR_binary[0]), .B0(N25), .B1(n21), .Y(N34) );
  INVX2M U20 ( .A(RD_PTR_binary[0]), .Y(N25) );
  OAI2BB2X1M U21 ( .B0(n22), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[3]), .A1N(
        RD_PTR_binary[4]), .Y(n13) );
  OAI2BB2X1M U22 ( .B0(n5), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[2]), .A1N(
        RD_PTR_binary[4]), .Y(n14) );
  CLKXOR2X2M U23 ( .A(n22), .B(RD_PTR_binary[2]), .Y(n5) );
  OAI2BB2X1M U24 ( .B0(n6), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[1]), .A1N(
        RD_PTR_binary[4]), .Y(n15) );
  XNOR2X2M U25 ( .A(RD_PTR_binary[1]), .B(RD_PTR_binary[2]), .Y(n6) );
  OAI2BB2X1M U26 ( .B0(n7), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[0]), .A1N(
        RD_PTR_binary[4]), .Y(n16) );
  XNOR2X2M U28 ( .A(RD_PTR_binary[0]), .B(RD_PTR_binary[1]), .Y(n7) );
  INVX2M U29 ( .A(N110), .Y(n22) );
  ADDHX1M U30 ( .A(RD_PTR_binary[2]), .B(\add_28/carry[2] ), .CO(
        \add_28/carry[3] ), .S(N27) );
  ADDHX1M U31 ( .A(RD_PTR_binary[1]), .B(RD_PTR_binary[0]), .CO(
        \add_28/carry[2] ), .S(N26) );
  ADDHX1M U32 ( .A(N110), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), .S(
        N28) );
  CLKXOR2X2M U33 ( .A(\add_28/carry[4] ), .B(RD_PTR_binary[4]), .Y(N29) );
  XNOR2X1M U34 ( .A(SYNC_WR_PTR[2]), .B(RD_PTR[2]), .Y(n4) );
  XNOR2X1M U35 ( .A(SYNC_WR_PTR[3]), .B(RD_PTR[3]), .Y(n3) );
  CLKNAND2X2M U36 ( .A(n4), .B(n3), .Y(n20) );
  CLKXOR2X2M U37 ( .A(SYNC_WR_PTR[1]), .B(RD_PTR[1]), .Y(n19) );
  CLKXOR2X2M U38 ( .A(SYNC_WR_PTR[0]), .B(RD_PTR[0]), .Y(n8) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_ADDRESS_WIDTH4 ( WR_DATA, WR_ADDR, RD_ADDR, 
        W_INC, R_INC, W_CLK, R_CLK, FULL, RD_DATA );
  input [7:0] WR_DATA;
  input [3:0] WR_ADDR;
  input [3:0] RD_ADDR;
  output [7:0] RD_DATA;
  input W_INC, R_INC, W_CLK, R_CLK, FULL;
  wire   N9, N10, N11, \MEM[7][7] , \MEM[7][6] , \MEM[7][5] , \MEM[7][4] ,
         \MEM[7][3] , \MEM[7][2] , \MEM[7][1] , \MEM[7][0] , \MEM[6][7] ,
         \MEM[6][6] , \MEM[6][5] , \MEM[6][4] , \MEM[6][3] , \MEM[6][2] ,
         \MEM[6][1] , \MEM[6][0] , \MEM[5][7] , \MEM[5][6] , \MEM[5][5] ,
         \MEM[5][4] , \MEM[5][3] , \MEM[5][2] , \MEM[5][1] , \MEM[5][0] ,
         \MEM[4][7] , \MEM[4][6] , \MEM[4][5] , \MEM[4][4] , \MEM[4][3] ,
         \MEM[4][2] , \MEM[4][1] , \MEM[4][0] , \MEM[3][7] , \MEM[3][6] ,
         \MEM[3][5] , \MEM[3][4] , \MEM[3][3] , \MEM[3][2] , \MEM[3][1] ,
         \MEM[3][0] , \MEM[2][7] , \MEM[2][6] , \MEM[2][5] , \MEM[2][4] ,
         \MEM[2][3] , \MEM[2][2] , \MEM[2][1] , \MEM[2][0] , \MEM[1][7] ,
         \MEM[1][6] , \MEM[1][5] , \MEM[1][4] , \MEM[1][3] , \MEM[1][2] ,
         \MEM[1][1] , \MEM[1][0] , \MEM[0][7] , \MEM[0][6] , \MEM[0][5] ,
         \MEM[0][4] , \MEM[0][3] , \MEM[0][2] , \MEM[0][1] , \MEM[0][0] , n12,
         n16, n18, n22, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100;
  assign N9 = RD_ADDR[0];
  assign N10 = RD_ADDR[1];
  assign N11 = RD_ADDR[2];

  EDFFTRX1M \MEM_reg[7][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][7] ) );
  EDFFTRX1M \MEM_reg[7][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][6] ) );
  EDFFTRX1M \MEM_reg[6][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][7] ) );
  EDFFTRX1M \MEM_reg[6][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][6] ) );
  EDFFTRX1M \MEM_reg[5][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][7] ) );
  EDFFTRX1M \MEM_reg[5][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][6] ) );
  EDFFTRX1M \MEM_reg[4][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][7] ) );
  EDFFTRX1M \MEM_reg[4][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][6] ) );
  EDFFTRX1M \MEM_reg[0][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][7] ) );
  EDFFTRX1M \MEM_reg[0][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][6] ) );
  EDFFTRX1M \MEM_reg[3][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][7] ) );
  EDFFTRX1M \MEM_reg[3][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][6] ) );
  EDFFTRX1M \MEM_reg[2][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][7] ) );
  EDFFTRX1M \MEM_reg[2][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][6] ) );
  EDFFTRX1M \MEM_reg[1][7]  ( .RN(1'b1), .D(WR_DATA[7]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][7] ) );
  EDFFTRX1M \MEM_reg[1][6]  ( .RN(1'b1), .D(WR_DATA[6]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][6] ) );
  EDFFTRX1M \MEM_reg[2][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][5] ) );
  EDFFTRX1M \MEM_reg[2][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][4] ) );
  EDFFTRX1M \MEM_reg[2][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][3] ) );
  EDFFTRX1M \MEM_reg[2][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][2] ) );
  EDFFTRX1M \MEM_reg[2][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][1] ) );
  EDFFTRX1M \MEM_reg[2][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n76), .CK(W_CLK), 
        .Q(\MEM[2][0] ) );
  EDFFTRX1M \MEM_reg[1][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][5] ) );
  EDFFTRX1M \MEM_reg[1][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][4] ) );
  EDFFTRX1M \MEM_reg[1][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][3] ) );
  EDFFTRX1M \MEM_reg[1][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][2] ) );
  EDFFTRX1M \MEM_reg[1][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][1] ) );
  EDFFTRX1M \MEM_reg[1][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n75), .CK(W_CLK), 
        .Q(\MEM[1][0] ) );
  EDFFTRX1M \MEM_reg[7][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][5] ) );
  EDFFTRX1M \MEM_reg[7][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][4] ) );
  EDFFTRX1M \MEM_reg[7][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][3] ) );
  EDFFTRX1M \MEM_reg[7][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][2] ) );
  EDFFTRX1M \MEM_reg[7][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][1] ) );
  EDFFTRX1M \MEM_reg[7][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n74), .CK(W_CLK), 
        .Q(\MEM[7][0] ) );
  EDFFTRX1M \MEM_reg[6][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][5] ) );
  EDFFTRX1M \MEM_reg[6][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][4] ) );
  EDFFTRX1M \MEM_reg[6][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][3] ) );
  EDFFTRX1M \MEM_reg[6][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][2] ) );
  EDFFTRX1M \MEM_reg[6][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][1] ) );
  EDFFTRX1M \MEM_reg[6][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n73), .CK(W_CLK), 
        .Q(\MEM[6][0] ) );
  EDFFTRX1M \MEM_reg[5][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][5] ) );
  EDFFTRX1M \MEM_reg[5][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][4] ) );
  EDFFTRX1M \MEM_reg[5][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][3] ) );
  EDFFTRX1M \MEM_reg[5][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][2] ) );
  EDFFTRX1M \MEM_reg[5][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][1] ) );
  EDFFTRX1M \MEM_reg[5][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n72), .CK(W_CLK), 
        .Q(\MEM[5][0] ) );
  EDFFTRX1M \MEM_reg[3][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][5] ) );
  EDFFTRX1M \MEM_reg[3][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][4] ) );
  EDFFTRX1M \MEM_reg[3][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][3] ) );
  EDFFTRX1M \MEM_reg[3][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][2] ) );
  EDFFTRX1M \MEM_reg[3][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][1] ) );
  EDFFTRX1M \MEM_reg[3][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n71), .CK(W_CLK), 
        .Q(\MEM[3][0] ) );
  EDFFTRX1M \MEM_reg[4][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][5] ) );
  EDFFTRX1M \MEM_reg[4][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][4] ) );
  EDFFTRX1M \MEM_reg[4][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][3] ) );
  EDFFTRX1M \MEM_reg[4][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][2] ) );
  EDFFTRX1M \MEM_reg[4][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][1] ) );
  EDFFTRX1M \MEM_reg[4][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n70), .CK(W_CLK), 
        .Q(\MEM[4][0] ) );
  EDFFTRX1M \MEM_reg[0][5]  ( .RN(1'b1), .D(WR_DATA[5]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][5] ) );
  EDFFTRX1M \MEM_reg[0][4]  ( .RN(1'b1), .D(WR_DATA[4]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][4] ) );
  EDFFTRX1M \MEM_reg[0][3]  ( .RN(1'b1), .D(WR_DATA[3]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][3] ) );
  EDFFTRX1M \MEM_reg[0][2]  ( .RN(1'b1), .D(WR_DATA[2]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][2] ) );
  EDFFTRX1M \MEM_reg[0][1]  ( .RN(1'b1), .D(WR_DATA[1]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][1] ) );
  EDFFTRX1M \MEM_reg[0][0]  ( .RN(1'b1), .D(WR_DATA[0]), .E(n69), .CK(W_CLK), 
        .Q(\MEM[0][0] ) );
  AND3X4M U2 ( .A(n99), .B(n100), .C(n12), .Y(n69) );
  AND3X4M U3 ( .A(n99), .B(n100), .C(n18), .Y(n70) );
  AND3X4M U4 ( .A(WR_ADDR[0]), .B(n12), .C(WR_ADDR[1]), .Y(n71) );
  AND3X4M U5 ( .A(WR_ADDR[0]), .B(n100), .C(n18), .Y(n72) );
  AND3X4M U6 ( .A(WR_ADDR[1]), .B(n99), .C(n18), .Y(n73) );
  AND3X4M U7 ( .A(WR_ADDR[1]), .B(WR_ADDR[0]), .C(n18), .Y(n74) );
  AND3X4M U8 ( .A(n12), .B(n100), .C(WR_ADDR[0]), .Y(n75) );
  AND3X4M U9 ( .A(n12), .B(n99), .C(WR_ADDR[1]), .Y(n76) );
  NOR2BX4M U74 ( .AN(n16), .B(WR_ADDR[2]), .Y(n12) );
  AND2X2M U75 ( .A(WR_ADDR[2]), .B(n16), .Y(n18) );
  INVX2M U76 ( .A(WR_ADDR[1]), .Y(n100) );
  INVX2M U77 ( .A(WR_ADDR[0]), .Y(n99) );
  INVX6M U78 ( .A(n95), .Y(n94) );
  INVX6M U79 ( .A(n95), .Y(n93) );
  INVX4M U80 ( .A(n98), .Y(n97) );
  INVX4M U81 ( .A(n98), .Y(n96) );
  AND2X2M U82 ( .A(n22), .B(W_INC), .Y(n16) );
  NOR2X2M U83 ( .A(WR_ADDR[3]), .B(FULL), .Y(n22) );
  MX2X2M U84 ( .A(n80), .B(n79), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U85 ( .A(\MEM[4][1] ), .B(\MEM[5][1] ), .C(\MEM[6][1] ), .D(
        \MEM[7][1] ), .S0(n93), .S1(n96), .Y(n79) );
  MX4X1M U86 ( .A(\MEM[0][1] ), .B(\MEM[1][1] ), .C(\MEM[2][1] ), .D(
        \MEM[3][1] ), .S0(n94), .S1(n97), .Y(n80) );
  MX2X2M U87 ( .A(n82), .B(n81), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U88 ( .A(\MEM[4][2] ), .B(\MEM[5][2] ), .C(\MEM[6][2] ), .D(
        \MEM[7][2] ), .S0(n93), .S1(n96), .Y(n81) );
  MX4X1M U89 ( .A(\MEM[0][2] ), .B(\MEM[1][2] ), .C(\MEM[2][2] ), .D(
        \MEM[3][2] ), .S0(n94), .S1(n97), .Y(n82) );
  MX2X2M U90 ( .A(n84), .B(n83), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U91 ( .A(\MEM[4][3] ), .B(\MEM[5][3] ), .C(\MEM[6][3] ), .D(
        \MEM[7][3] ), .S0(n93), .S1(n96), .Y(n83) );
  MX4X1M U92 ( .A(\MEM[0][3] ), .B(\MEM[1][3] ), .C(\MEM[2][3] ), .D(
        \MEM[3][3] ), .S0(n94), .S1(n97), .Y(n84) );
  MX2X2M U93 ( .A(n88), .B(n87), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U94 ( .A(\MEM[4][5] ), .B(\MEM[5][5] ), .C(\MEM[6][5] ), .D(
        \MEM[7][5] ), .S0(n93), .S1(n96), .Y(n87) );
  MX4X1M U95 ( .A(\MEM[0][5] ), .B(\MEM[1][5] ), .C(\MEM[2][5] ), .D(
        \MEM[3][5] ), .S0(n94), .S1(n97), .Y(n88) );
  MX2X2M U96 ( .A(n90), .B(n89), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U97 ( .A(\MEM[4][6] ), .B(\MEM[5][6] ), .C(\MEM[6][6] ), .D(
        \MEM[7][6] ), .S0(n93), .S1(n96), .Y(n89) );
  MX4X1M U98 ( .A(\MEM[0][6] ), .B(\MEM[1][6] ), .C(\MEM[2][6] ), .D(
        \MEM[3][6] ), .S0(n94), .S1(n97), .Y(n90) );
  MX2X2M U99 ( .A(n92), .B(n91), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U100 ( .A(\MEM[4][7] ), .B(\MEM[5][7] ), .C(\MEM[6][7] ), .D(
        \MEM[7][7] ), .S0(n93), .S1(n96), .Y(n91) );
  MX4X1M U101 ( .A(\MEM[0][7] ), .B(\MEM[1][7] ), .C(\MEM[2][7] ), .D(
        \MEM[3][7] ), .S0(n94), .S1(n97), .Y(n92) );
  MX2X2M U102 ( .A(n78), .B(n77), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U103 ( .A(\MEM[4][0] ), .B(\MEM[5][0] ), .C(\MEM[6][0] ), .D(
        \MEM[7][0] ), .S0(n93), .S1(n96), .Y(n77) );
  MX4X1M U104 ( .A(\MEM[0][0] ), .B(\MEM[1][0] ), .C(\MEM[2][0] ), .D(
        \MEM[3][0] ), .S0(n94), .S1(n97), .Y(n78) );
  MX2X2M U105 ( .A(n86), .B(n85), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U106 ( .A(\MEM[4][4] ), .B(\MEM[5][4] ), .C(\MEM[6][4] ), .D(
        \MEM[7][4] ), .S0(n93), .S1(n96), .Y(n85) );
  MX4X1M U107 ( .A(\MEM[0][4] ), .B(\MEM[1][4] ), .C(\MEM[2][4] ), .D(
        \MEM[3][4] ), .S0(n94), .S1(n97), .Y(n86) );
  INVX2M U108 ( .A(N10), .Y(n98) );
  INVX2M U109 ( .A(N9), .Y(n95) );
endmodule


module FIFO_DATA_WIDTH8_ADDRESS_WIDTH4 ( WR_DATA, W_INC, R_INC, W_CLK, W_RST, 
        R_CLK, R_RST, FULL, EMPTY, RD_DATA );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_INC, R_INC, W_CLK, W_RST, R_CLK, R_RST;
  output FULL, EMPTY;
  wire   n1, n2, n3, n4;
  wire   [4:0] WR_PTR;
  wire   [4:0] SYNC_WR_PTR;
  wire   [4:0] RD_PTR;
  wire   [4:0] SYNC_RD_PTR;
  wire   [3:0] WR_ADDR;
  wire   [3:0] RD_ADDR;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  DF_SYNC_ADDRESS_WIDTH4_0 DUT0 ( .CLK(R_CLK), .RST(n1), .ASYNC({1'b0, 
        WR_PTR[3:0]}), .SYNC({SYNOPSYS_UNCONNECTED__0, SYNC_WR_PTR[3:0]}) );
  DF_SYNC_ADDRESS_WIDTH4_1 DUT1 ( .CLK(W_CLK), .RST(n3), .ASYNC({1'b0, 
        RD_PTR[3:0]}), .SYNC({SYNOPSYS_UNCONNECTED__1, SYNC_RD_PTR[3:0]}) );
  FIFO_WR_DATA_WIDTH8_ADDRESS_WIDTH4 DUT2 ( .W_INC(W_INC), .W_CLK(W_CLK), 
        .W_RST(n3), .SYNC_RD_PTR({1'b0, SYNC_RD_PTR[3:0]}), .WR_ADDR(WR_ADDR), 
        .WR_PTR({SYNOPSYS_UNCONNECTED__2, WR_PTR[3:0]}), .FULL(FULL) );
  FIFO_RD_DATA_WIDTH8_ADDRESS_WIDTH4 DUT3 ( .R_INC(R_INC), .R_CLK(R_CLK), 
        .R_RST(n1), .SYNC_WR_PTR({1'b0, SYNC_WR_PTR[3:0]}), .RD_ADDR(RD_ADDR), 
        .RD_PTR({SYNOPSYS_UNCONNECTED__3, RD_PTR[3:0]}), .EMPTY(EMPTY) );
  FIFO_MEM_CNTRL_DATA_WIDTH8_ADDRESS_WIDTH4 DUT4 ( .WR_DATA(WR_DATA), 
        .WR_ADDR(WR_ADDR), .RD_ADDR(RD_ADDR), .W_INC(W_INC), .R_INC(R_INC), 
        .W_CLK(W_CLK), .R_CLK(R_CLK), .FULL(FULL), .RD_DATA(RD_DATA) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(R_RST), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(W_RST), .Y(n4) );
endmodule


module PULSE_GEN ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;
  wire   FLOP_OUT, FLOP_IN;

  DFFRQX1M FLOP_OUT_reg ( .D(FLOP_IN), .CK(CLK), .RN(RST), .Q(FLOP_OUT) );
  DFFRQX1M FLOP_IN_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(FLOP_IN) );
  NOR2BX2M U3 ( .AN(FLOP_IN), .B(FLOP_OUT), .Y(PULSE_SIG) );
endmodule


module fsm ( clk, rst, rx_in, par_en, bit_count, edge_count, par_error, 
        str_glitch, stp_error, prescale, par_chk_en, str_chk_en, stp_chk_en, 
        data_sample_en, counter_en, deser_en, data_valid );
  input [3:0] bit_count;
  input [4:0] edge_count;
  input [5:0] prescale;
  input clk, rst, rx_in, par_en, par_error, str_glitch, stp_error;
  output par_chk_en, str_chk_en, stp_chk_en, data_sample_en, counter_en,
         deser_en, data_valid;
  wire   data_sample_en, n27, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         \r91/EQ , \r91/B[0] , \r91/B[1] , \r91/B[2] , \r91/B[3] , \r91/B[4] ,
         \r91/B[5] , \r91/B[9] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign counter_en = data_sample_en;

  DFFRX4M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n3), .QN(
        n27) );
  NOR4BBX4M U13 ( .AN(bit_count[3]), .BN(bit_count[0]), .C(bit_count[2]), .D(
        bit_count[1]), .Y(n34) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n3), .Q(
        current_state[1]) );
  DFFRQX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n3), .Q(
        current_state[0]) );
  NOR3BX2M U3 ( .AN(stp_chk_en), .B(stp_error), .C(par_error), .Y(data_valid)
         );
  OAI222X1M U4 ( .A0(\r91/EQ ), .A1(n30), .B0(n19), .B1(n31), .C0(par_error), 
        .C1(n16), .Y(next_state[2]) );
  NOR4X4M U5 ( .A(n15), .B(n14), .C(n13), .D(n12), .Y(\r91/EQ ) );
  INVXLM U6 ( .A(current_state[0]), .Y(n1) );
  INVX4M U7 ( .A(n1), .Y(n2) );
  NOR2BX2M U8 ( .AN(\r91/B[0] ), .B(edge_count[0]), .Y(n9) );
  NOR2BX2M U9 ( .AN(edge_count[0]), .B(\r91/B[0] ), .Y(n8) );
  NOR2X2M U10 ( .A(n7), .B(prescale[5]), .Y(\r91/B[9] ) );
  NAND2BX2M U11 ( .AN(prescale[1]), .B(\r91/B[0] ), .Y(n4) );
  OR2X2M U12 ( .A(n6), .B(prescale[4]), .Y(n7) );
  OR2X2M U14 ( .A(n5), .B(prescale[3]), .Y(n6) );
  OR2X2M U15 ( .A(n4), .B(prescale[2]), .Y(n5) );
  OAI2BB1XLM U16 ( .A0N(n6), .A1N(prescale[4]), .B0(n7), .Y(\r91/B[4] ) );
  OAI2BB1XLM U17 ( .A0N(n5), .A1N(prescale[3]), .B0(n6), .Y(\r91/B[3] ) );
  OAI2BB1XLM U18 ( .A0N(n4), .A1N(prescale[2]), .B0(n5), .Y(\r91/B[2] ) );
  NAND2X2M U19 ( .A(current_state[1]), .B(n27), .Y(n32) );
  NOR2X2M U20 ( .A(n32), .B(n2), .Y(n37) );
  NOR2X4M U21 ( .A(n17), .B(n19), .Y(deser_en) );
  BUFX2M U22 ( .A(rst), .Y(n3) );
  CLKINVX4M U23 ( .A(\r91/EQ ), .Y(n17) );
  NOR2X2M U24 ( .A(n30), .B(n17), .Y(stp_chk_en) );
  NOR3X6M U25 ( .A(n17), .B(n18), .C(n32), .Y(par_chk_en) );
  INVX2M U26 ( .A(n37), .Y(n19) );
  NAND3X4M U27 ( .A(n30), .B(n32), .C(n35), .Y(data_sample_en) );
  INVX2M U28 ( .A(prescale[0]), .Y(\r91/B[0] ) );
  OAI21X1M U29 ( .A0(\r91/EQ ), .A1(n35), .B0(n36), .Y(next_state[0]) );
  AOI31X2M U30 ( .A0(n37), .A1(n34), .A2(par_en), .B0(n38), .Y(n36) );
  NOR4X2M U31 ( .A(rx_in), .B(current_state[1]), .C(n2), .D(n39), .Y(n38) );
  AOI2BB1X2M U32 ( .A0N(stp_error), .A1N(n17), .B0(n27), .Y(n39) );
  INVX2M U33 ( .A(par_chk_en), .Y(n16) );
  NOR3X6M U34 ( .A(n35), .B(current_state[1]), .C(n17), .Y(str_chk_en) );
  OAI2B2X1M U35 ( .A1N(str_chk_en), .A0(str_glitch), .B0(n33), .B1(n32), .Y(
        next_state[1]) );
  AOI22X1M U36 ( .A0(n31), .A1(n18), .B0(n2), .B1(n17), .Y(n33) );
  NAND2X2M U37 ( .A(n2), .B(n27), .Y(n35) );
  OR3X2M U38 ( .A(current_state[1]), .B(n2), .C(n27), .Y(n30) );
  NAND2BX2M U39 ( .AN(par_en), .B(n34), .Y(n31) );
  INVX2M U40 ( .A(n2), .Y(n18) );
  OAI2BB1X1M U41 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n4), .Y(
        \r91/B[1] ) );
  AO21XLM U42 ( .A0(n7), .A1(prescale[5]), .B0(\r91/B[9] ), .Y(\r91/B[5] ) );
  OAI2B2X1M U43 ( .A1N(\r91/B[1] ), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(
        n11) );
  OAI2B2X1M U44 ( .A1N(edge_count[1]), .A0(n9), .B0(\r91/B[1] ), .B1(n9), .Y(
        n10) );
  NAND4BBX1M U45 ( .AN(\r91/B[9] ), .BN(\r91/B[5] ), .C(n11), .D(n10), .Y(n15)
         );
  CLKXOR2X2M U46 ( .A(\r91/B[4] ), .B(edge_count[4]), .Y(n14) );
  CLKXOR2X2M U47 ( .A(\r91/B[2] ), .B(edge_count[2]), .Y(n13) );
  CLKXOR2X2M U48 ( .A(\r91/B[3] ), .B(edge_count[3]), .Y(n12) );
endmodule


module counter ( clk, rst, counter_en, prescale, par_en, bit_count, edge_count
 );
  input [5:0] prescale;
  output [3:0] bit_count;
  output [4:0] edge_count;
  input clk, rst, counter_en, par_en;
  wire   n59, n60, n61, n62, n63, n64, N5, N7, N8, N9, N10, N11, N12, N14, N19,
         N20, N21, N22, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, \add_22/carry[4] ,
         \add_22/carry[3] , \add_22/carry[2] , n1, n2, n4, n6, n8, n10, n12,
         n14, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;

  OAI33X4M U14 ( .A0(n23), .A1(n55), .A2(n58), .B0(n24), .B1(n54), .B2(n57), 
        .Y(n20) );
  DFFRQX2M \bit_count_reg[0]  ( .D(n29), .CK(clk), .RN(n35), .Q(bit_count[0])
         );
  DFFRQX2M \bit_count_reg[3]  ( .D(n27), .CK(clk), .RN(n35), .Q(bit_count[3])
         );
  DFFRQX2M \bit_count_reg[2]  ( .D(n52), .CK(clk), .RN(n35), .Q(bit_count[2])
         );
  DFFRQX1M \bit_count_reg[1]  ( .D(n28), .CK(clk), .RN(n35), .Q(n59) );
  DFFRQX1M \edge_count_reg[4]  ( .D(n33), .CK(clk), .RN(n35), .Q(n60) );
  DFFRQX1M \edge_count_reg[3]  ( .D(n30), .CK(clk), .RN(n35), .Q(n61) );
  DFFRQX1M \edge_count_reg[2]  ( .D(n31), .CK(clk), .RN(n35), .Q(n62) );
  DFFRQX1M \edge_count_reg[0]  ( .D(n34), .CK(clk), .RN(n35), .Q(n64) );
  DFFRQX1M \edge_count_reg[1]  ( .D(n32), .CK(clk), .RN(n35), .Q(n63) );
  AOI21BX2M U3 ( .A0(prescale[0]), .A1(prescale[1]), .B0N(n37), .Y(n1) );
  INVX6M U4 ( .A(n36), .Y(n35) );
  INVXLM U5 ( .A(n59), .Y(n2) );
  INVX4M U6 ( .A(n2), .Y(bit_count[1]) );
  INVXLM U7 ( .A(n60), .Y(n4) );
  INVX4M U8 ( .A(n4), .Y(edge_count[4]) );
  INVXLM U9 ( .A(n62), .Y(n6) );
  INVX4M U10 ( .A(n6), .Y(edge_count[2]) );
  INVXLM U11 ( .A(n61), .Y(n8) );
  INVX4M U12 ( .A(n8), .Y(edge_count[3]) );
  INVXLM U13 ( .A(n63), .Y(n10) );
  INVX6M U15 ( .A(n10), .Y(edge_count[1]) );
  INVXLM U16 ( .A(n64), .Y(n12) );
  INVX6M U17 ( .A(n12), .Y(edge_count[0]) );
  NOR4BX2M U18 ( .AN(n44), .B(N11), .C(N10), .D(n43), .Y(n45) );
  BUFX2M U19 ( .A(n20), .Y(n14) );
  NOR3X6M U20 ( .A(n14), .B(n54), .C(n22), .Y(n17) );
  NOR2X2M U21 ( .A(n49), .B(N5), .Y(n41) );
  NAND4X2M U22 ( .A(n48), .B(n47), .C(n46), .D(n45), .Y(N12) );
  NOR2X2M U23 ( .A(n40), .B(prescale[5]), .Y(N11) );
  NAND4X1M U24 ( .A(bit_count[2]), .B(n17), .C(bit_count[1]), .D(n57), .Y(n16)
         );
  NAND2BX2M U25 ( .AN(prescale[1]), .B(N5), .Y(n37) );
  OR2X2M U26 ( .A(n39), .B(prescale[4]), .Y(n40) );
  OR2X2M U27 ( .A(n38), .B(prescale[3]), .Y(n39) );
  OR2X2M U28 ( .A(n37), .B(prescale[2]), .Y(n38) );
  OAI2BB1XLM U29 ( .A0N(n39), .A1N(prescale[4]), .B0(n40), .Y(N9) );
  OAI2BB1XLM U30 ( .A0N(n38), .A1N(prescale[3]), .B0(n39), .Y(N8) );
  OAI2BB1XLM U31 ( .A0N(n37), .A1N(prescale[2]), .B0(n38), .Y(N7) );
  INVX2M U32 ( .A(bit_count[2]), .Y(n56) );
  INVX2M U33 ( .A(bit_count[1]), .Y(n55) );
  NOR2X6M U34 ( .A(n50), .B(n51), .Y(n25) );
  INVX4M U35 ( .A(n26), .Y(n50) );
  INVX2M U36 ( .A(n22), .Y(n51) );
  INVX2M U37 ( .A(rst), .Y(n36) );
  NAND2X1M U38 ( .A(counter_en), .B(N12), .Y(n26) );
  AOI21X2M U39 ( .A0(n54), .A1(n53), .B0(n22), .Y(n21) );
  NAND3X4M U40 ( .A(counter_en), .B(n26), .C(N14), .Y(n22) );
  INVXLM U41 ( .A(N12), .Y(N14) );
  OAI2BB2X1M U42 ( .B0(n21), .B1(n55), .A0N(n55), .A1N(n17), .Y(n28) );
  CLKINVX1M U43 ( .A(n14), .Y(n53) );
  OAI21X2M U44 ( .A0(bit_count[1]), .A1(n14), .B0(n21), .Y(n18) );
  INVX2M U45 ( .A(edge_count[0]), .Y(n49) );
  OAI21X2M U46 ( .A0(n15), .A1(n57), .B0(n16), .Y(n27) );
  AOI21X2M U47 ( .A0(n53), .A1(n56), .B0(n18), .Y(n15) );
  INVX2M U48 ( .A(n19), .Y(n52) );
  AOI32X1M U49 ( .A0(n17), .A1(n56), .A2(bit_count[1]), .B0(n18), .B1(
        bit_count[2]), .Y(n19) );
  OAI32X2M U50 ( .A0(n22), .A1(bit_count[0]), .A2(n14), .B0(n51), .B1(n54), 
        .Y(n29) );
  AO22X1M U51 ( .A0(edge_count[0]), .A1(n25), .B0(n49), .B1(n50), .Y(n34) );
  AO22X1M U52 ( .A0(edge_count[1]), .A1(n25), .B0(N19), .B1(n50), .Y(n32) );
  AO22X1M U53 ( .A0(edge_count[2]), .A1(n25), .B0(N20), .B1(n50), .Y(n31) );
  AO22X1M U54 ( .A0(edge_count[3]), .A1(n25), .B0(N21), .B1(n50), .Y(n30) );
  AO22X1M U55 ( .A0(edge_count[4]), .A1(n25), .B0(N22), .B1(n50), .Y(n33) );
  NAND3X2M U56 ( .A(n54), .B(n56), .C(bit_count[3]), .Y(n23) );
  NAND3X2M U57 ( .A(n56), .B(n58), .C(n55), .Y(n24) );
  INVX2M U58 ( .A(par_en), .Y(n58) );
  INVX4M U59 ( .A(bit_count[0]), .Y(n54) );
  INVX2M U60 ( .A(bit_count[3]), .Y(n57) );
  ADDHX1M U61 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_22/carry[2] ), 
        .S(N19) );
  ADDHX1M U62 ( .A(edge_count[2]), .B(\add_22/carry[2] ), .CO(
        \add_22/carry[3] ), .S(N20) );
  ADDHX1M U63 ( .A(edge_count[3]), .B(\add_22/carry[3] ), .CO(
        \add_22/carry[4] ), .S(N21) );
  INVX2M U64 ( .A(prescale[0]), .Y(N5) );
  AO21XLM U65 ( .A0(n40), .A1(prescale[5]), .B0(N11), .Y(N10) );
  CLKXOR2X2M U66 ( .A(\add_22/carry[4] ), .B(edge_count[4]), .Y(N22) );
  XNOR2X1M U67 ( .A(N8), .B(edge_count[3]), .Y(n48) );
  XNOR2X1M U68 ( .A(N7), .B(edge_count[2]), .Y(n47) );
  XNOR2X1M U69 ( .A(N9), .B(edge_count[4]), .Y(n46) );
  OAI22X1M U70 ( .A0(edge_count[1]), .A1(n41), .B0(n41), .B1(n1), .Y(n44) );
  CLKNAND2X2M U71 ( .A(N5), .B(n49), .Y(n42) );
  AOI22X1M U72 ( .A0(n42), .A1(n1), .B0(n42), .B1(edge_count[1]), .Y(n43) );
endmodule


module data_sampling ( clk, rst, rx_in, prescale, edge_count, data_sample_en, 
        sampled_bit );
  input [5:0] prescale;
  input [4:0] edge_count;
  input clk, rst, rx_in, data_sample_en;
  output sampled_bit;
  wire   sample_1, sample_2, sample_3, N6, N7, N8, N9, N10, N11, N12, N13, N14,
         N15, N16, N17, N18, N19, N20, n12, n13, n14, n15, n16, n17, n18, n19,
         \add_34/carry[4] , \add_34/carry[3] , \add_34/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37;

  OAI2BB1X4M U3 ( .A0N(sample_1), .A1N(sample_2), .B0(n12), .Y(sampled_bit) );
  DFFRQX2M sample_2_reg ( .D(n18), .CK(clk), .RN(n1), .Q(sample_2) );
  DFFRQX2M sample_1_reg ( .D(n19), .CK(clk), .RN(n1), .Q(sample_1) );
  DFFRQX1M sample_3_reg ( .D(n17), .CK(clk), .RN(n1), .Q(sample_3) );
  NOR2BX2M U4 ( .AN(N14), .B(edge_count[0]), .Y(n29) );
  NOR2BX2M U5 ( .AN(N6), .B(edge_count[0]), .Y(n5) );
  NOR3X4M U6 ( .A(prescale[4]), .B(prescale[5]), .C(n3), .Y(N11) );
  NOR2BX2M U7 ( .AN(edge_count[0]), .B(N6), .Y(n6) );
  NOR4X2M U8 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N13) );
  NOR4X4M U9 ( .A(n20), .B(n11), .C(n10), .D(n9), .Y(N12) );
  NOR2BX2M U10 ( .AN(prescale[1]), .B(edge_count[0]), .Y(n21) );
  NOR2BX2M U11 ( .AN(edge_count[0]), .B(N14), .Y(n30) );
  NOR2BX2M U12 ( .AN(edge_count[0]), .B(prescale[1]), .Y(n22) );
  OR2X2M U13 ( .A(n2), .B(prescale[3]), .Y(n3) );
  NAND2BX2M U14 ( .AN(prescale[2]), .B(N6), .Y(n2) );
  OAI2BB1XLM U15 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N8) );
  BUFX2M U16 ( .A(rst), .Y(n1) );
  INVX2M U17 ( .A(rx_in), .Y(n37) );
  NOR2BX2M U18 ( .AN(data_sample_en), .B(N12), .Y(n14) );
  OAI2BB2X1M U19 ( .B0(n37), .B1(n16), .A0N(n16), .A1N(sample_1), .Y(n19) );
  NAND2X1M U20 ( .A(N12), .B(data_sample_en), .Y(n16) );
  OAI2BB2X1M U21 ( .B0(n37), .B1(n15), .A0N(n15), .A1N(sample_2), .Y(n18) );
  NAND2X1M U22 ( .A(N13), .B(n14), .Y(n15) );
  OAI2BB2X1M U23 ( .B0(n13), .B1(n37), .A0N(n13), .A1N(sample_3), .Y(n17) );
  NAND3BX1M U24 ( .AN(N13), .B(n14), .C(N20), .Y(n13) );
  OAI21X2M U25 ( .A0(sample_1), .A1(sample_2), .B0(sample_3), .Y(n12) );
  INVX2M U26 ( .A(prescale[1]), .Y(N6) );
  INVX1M U27 ( .A(prescale[1]), .Y(N14) );
  ADDHX1M U28 ( .A(prescale[4]), .B(\add_34/carry[3] ), .CO(\add_34/carry[4] ), 
        .S(N17) );
  ADDHX2M U29 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_34/carry[2] ), .S(
        N15) );
  ADDHX1M U30 ( .A(prescale[3]), .B(\add_34/carry[2] ), .CO(\add_34/carry[3] ), 
        .S(N16) );
  ADDHX1M U31 ( .A(prescale[5]), .B(\add_34/carry[4] ), .CO(N19), .S(N18) );
  OAI2BB1X1M U32 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n2), .Y(N7) );
  XNOR2X1M U33 ( .A(prescale[4]), .B(n3), .Y(N9) );
  OAI21X1M U34 ( .A0(prescale[4]), .A1(n3), .B0(prescale[5]), .Y(n4) );
  NAND2BX1M U35 ( .AN(N11), .B(n4), .Y(N10) );
  OAI2B2X1M U36 ( .A1N(edge_count[1]), .A0(n5), .B0(N7), .B1(n5), .Y(n8) );
  OAI2B2X1M U37 ( .A1N(N7), .A0(n6), .B0(edge_count[1]), .B1(n6), .Y(n7) );
  NAND3BX1M U38 ( .AN(N11), .B(n8), .C(n7), .Y(n20) );
  CLKXOR2X2M U39 ( .A(N10), .B(edge_count[4]), .Y(n11) );
  CLKXOR2X2M U40 ( .A(N8), .B(edge_count[2]), .Y(n10) );
  CLKXOR2X2M U41 ( .A(N9), .B(edge_count[3]), .Y(n9) );
  CLKXOR2X2M U42 ( .A(prescale[3]), .B(edge_count[2]), .Y(n28) );
  OAI2B2X1M U43 ( .A1N(edge_count[1]), .A0(n21), .B0(prescale[2]), .B1(n21), 
        .Y(n24) );
  OAI2B2X1M U44 ( .A1N(prescale[2]), .A0(n22), .B0(edge_count[1]), .B1(n22), 
        .Y(n23) );
  CLKNAND2X2M U45 ( .A(n24), .B(n23), .Y(n27) );
  CLKXOR2X2M U46 ( .A(prescale[4]), .B(edge_count[3]), .Y(n26) );
  CLKXOR2X2M U47 ( .A(prescale[5]), .B(edge_count[4]), .Y(n25) );
  OAI2B2X1M U48 ( .A1N(edge_count[1]), .A0(n29), .B0(N15), .B1(n29), .Y(n32)
         );
  OAI2B2X1M U49 ( .A1N(N15), .A0(n30), .B0(edge_count[1]), .B1(n30), .Y(n31)
         );
  NAND3BX1M U50 ( .AN(N19), .B(n32), .C(n31), .Y(n36) );
  CLKXOR2X2M U51 ( .A(N18), .B(edge_count[4]), .Y(n35) );
  CLKXOR2X2M U52 ( .A(N16), .B(edge_count[2]), .Y(n34) );
  CLKXOR2X2M U53 ( .A(N17), .B(edge_count[3]), .Y(n33) );
  NOR4X1M U54 ( .A(n36), .B(n35), .C(n34), .D(n33), .Y(N20) );
endmodule


module parity_check ( clk, rst, p_data, par_typ, par_chk_en, sampled_bit, 
        par_error );
  input [7:0] p_data;
  input clk, rst, par_typ, par_chk_en, sampled_bit;
  output par_error;
  wire   par_bit, N6, n3, n4, n5, n6, n7, n1;

  DFFRQX1M par_bit_reg ( .D(N6), .CK(clk), .RN(rst), .Q(par_bit) );
  DFFRQX4M par_error_reg ( .D(n7), .CK(clk), .RN(rst), .Q(par_error) );
  AO2B2X2M U3 ( .B0(n1), .B1(par_chk_en), .A0(par_error), .A1N(par_chk_en), 
        .Y(n7) );
  CLKXOR2X2M U4 ( .A(sampled_bit), .B(par_bit), .Y(n1) );
  XNOR2X2M U5 ( .A(p_data[7]), .B(p_data[6]), .Y(n6) );
  XOR3XLM U6 ( .A(par_typ), .B(n3), .C(n4), .Y(N6) );
  XOR3XLM U7 ( .A(p_data[1]), .B(p_data[0]), .C(n5), .Y(n4) );
  XOR3XLM U8 ( .A(p_data[5]), .B(p_data[4]), .C(n6), .Y(n3) );
  XNOR2X2M U9 ( .A(p_data[3]), .B(p_data[2]), .Y(n5) );
endmodule


module start_check ( clk, rst, str_chk_en, sampled_bit, str_glitch );
  input clk, rst, str_chk_en, sampled_bit;
  output str_glitch;
  wire   n1;

  DFFRQX1M str_glitch_reg ( .D(n1), .CK(clk), .RN(rst), .Q(str_glitch) );
  AO2B2X2M U2 ( .B0(str_chk_en), .B1(sampled_bit), .A0(str_glitch), .A1N(
        str_chk_en), .Y(n1) );
endmodule


module stop_check ( clk, rst, stp_chk_en, sampled_bit, stp_error );
  input clk, rst, stp_chk_en, sampled_bit;
  output stp_error;
  wire   n5, n2, n1, n4;

  DFFRQX1M stp_error_reg ( .D(n2), .CK(clk), .RN(rst), .Q(n5) );
  INVXLM U3 ( .A(n5), .Y(n1) );
  INVX4M U4 ( .A(n1), .Y(stp_error) );
  OAI2BB2X1M U5 ( .B0(sampled_bit), .B1(n4), .A0N(stp_error), .A1N(n4), .Y(n2)
         );
  INVX2M U6 ( .A(stp_chk_en), .Y(n4) );
endmodule


module deserializer ( clk, rst, deser_en, sampled_bit, p_data );
  output [7:0] p_data;
  input clk, rst, deser_en, sampled_bit;
  wire   n6, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n1, n2, n3, n4, n5, n7, n42, n43,
         n44, n45, n46, n47;
  wire   [3:0] counter;

  DFFRX4M \p_data_reg[0]  ( .D(n30), .CK(clk), .RN(n5), .Q(p_data[0]), .QN(n6)
         );
  DFFRQX2M \p_data_reg[5]  ( .D(n35), .CK(clk), .RN(n5), .Q(p_data[5]) );
  DFFRQX2M \p_data_reg[1]  ( .D(n31), .CK(clk), .RN(n5), .Q(p_data[1]) );
  DFFRQX2M \p_data_reg[4]  ( .D(n34), .CK(clk), .RN(n5), .Q(p_data[4]) );
  DFFRQX2M \p_data_reg[7]  ( .D(n37), .CK(clk), .RN(n5), .Q(p_data[7]) );
  DFFRQX2M \p_data_reg[3]  ( .D(n33), .CK(clk), .RN(n5), .Q(p_data[3]) );
  DFFRQX2M \p_data_reg[6]  ( .D(n36), .CK(clk), .RN(n5), .Q(p_data[6]) );
  DFFRQX2M \p_data_reg[2]  ( .D(n32), .CK(clk), .RN(n5), .Q(p_data[2]) );
  DFFRQX2M \counter_reg[2]  ( .D(n38), .CK(clk), .RN(n5), .Q(counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n39), .CK(clk), .RN(n5), .Q(counter[1]) );
  DFFRQX1M \counter_reg[0]  ( .D(n41), .CK(clk), .RN(n5), .Q(counter[0]) );
  DFFRQX1M \counter_reg[3]  ( .D(n40), .CK(clk), .RN(n5), .Q(counter[3]) );
  INVXLM U3 ( .A(counter[0]), .Y(n1) );
  INVX4M U4 ( .A(n1), .Y(n2) );
  INVXLM U5 ( .A(counter[3]), .Y(n3) );
  INVX4M U6 ( .A(n3), .Y(n4) );
  NOR2X2M U7 ( .A(n28), .B(counter[2]), .Y(n24) );
  NAND4X2M U8 ( .A(n4), .B(n43), .C(n45), .D(n46), .Y(n29) );
  INVX2M U9 ( .A(counter[1]), .Y(n45) );
  INVX2M U10 ( .A(n2), .Y(n43) );
  NAND2X2M U11 ( .A(counter[1]), .B(n2), .Y(n11) );
  NOR2X4M U12 ( .A(n43), .B(counter[1]), .Y(n13) );
  NOR2X4M U13 ( .A(n45), .B(n2), .Y(n12) );
  INVX6M U14 ( .A(n7), .Y(n5) );
  INVX2M U15 ( .A(rst), .Y(n7) );
  NAND2X4M U16 ( .A(deser_en), .B(n29), .Y(n28) );
  NAND2X2M U17 ( .A(n19), .B(n44), .Y(n22) );
  NAND2X2M U18 ( .A(n28), .B(n29), .Y(n26) );
  INVX2M U19 ( .A(n24), .Y(n42) );
  OAI2BB2X1M U20 ( .B0(n25), .B1(n45), .A0N(n26), .A1N(n13), .Y(n39) );
  INVX4M U21 ( .A(sampled_bit), .Y(n47) );
  INVX2M U22 ( .A(n11), .Y(n44) );
  NOR3X8M U23 ( .A(n28), .B(n4), .C(n46), .Y(n19) );
  NOR2X4M U24 ( .A(n42), .B(n4), .Y(n15) );
  OAI21X2M U25 ( .A0(counter[1]), .A1(n28), .B0(n25), .Y(n23) );
  OAI2BB2X1M U26 ( .B0(n47), .B1(n14), .A0N(p_data[1]), .A1N(n14), .Y(n31) );
  NAND2X2M U27 ( .A(n15), .B(n13), .Y(n14) );
  OAI2BB2X1M U28 ( .B0(n47), .B1(n16), .A0N(p_data[2]), .A1N(n16), .Y(n32) );
  NAND2X2M U29 ( .A(n12), .B(n15), .Y(n16) );
  OAI2BB2X1M U30 ( .B0(n47), .B1(n18), .A0N(p_data[4]), .A1N(n18), .Y(n34) );
  NAND3X2M U31 ( .A(n43), .B(n45), .C(n19), .Y(n18) );
  OAI2BB2X1M U32 ( .B0(n47), .B1(n20), .A0N(p_data[5]), .A1N(n20), .Y(n35) );
  NAND2X2M U33 ( .A(n19), .B(n13), .Y(n20) );
  OAI2BB2X1M U34 ( .B0(n47), .B1(n21), .A0N(p_data[6]), .A1N(n21), .Y(n36) );
  NAND2X2M U35 ( .A(n19), .B(n12), .Y(n21) );
  OAI2BB2X1M U36 ( .B0(n47), .B1(n22), .A0N(p_data[7]), .A1N(n22), .Y(n37) );
  OAI2BB2X1M U37 ( .B0(n42), .B1(n11), .A0N(n23), .A1N(counter[2]), .Y(n38) );
  OAI2B1X2M U38 ( .A1N(n4), .A0(n27), .B0(n22), .Y(n40) );
  NOR2X2M U39 ( .A(n24), .B(n23), .Y(n27) );
  OAI2BB2X1M U40 ( .B0(n47), .B1(n17), .A0N(p_data[3]), .A1N(n17), .Y(n33) );
  NAND2X2M U41 ( .A(n44), .B(n15), .Y(n17) );
  OA21X2M U42 ( .A0(n2), .A1(n28), .B0(n26), .Y(n25) );
  OAI22X1M U43 ( .A0(n43), .A1(n26), .B0(n2), .B1(n28), .Y(n41) );
  NAND2BX2M U44 ( .AN(n8), .B(n9), .Y(n30) );
  NAND4X2M U45 ( .A(n10), .B(sampled_bit), .C(deser_en), .D(n11), .Y(n9) );
  AOI31X2M U46 ( .A0(n10), .A1(n11), .A2(deser_en), .B0(n6), .Y(n8) );
  NOR4X4M U47 ( .A(n12), .B(n13), .C(counter[2]), .D(n4), .Y(n10) );
  INVX2M U48 ( .A(counter[2]), .Y(n46) );
endmodule


module UART_RX ( clk, rst, rx_in, par_en, par_typ, prescale, data_valid, 
        par_error, stp_error, p_data );
  input [5:0] prescale;
  output [7:0] p_data;
  input clk, rst, rx_in, par_en, par_typ;
  output data_valid, par_error, stp_error;
  wire   str_glitch, par_chk_en, str_chk_en, stp_chk_en, data_sample_en,
         counter_en, deser_en, sampled_bit, n1, n2;
  wire   [3:0] bit_count;
  wire   [4:0] edge_count;

  fsm DUT0 ( .clk(clk), .rst(n1), .rx_in(rx_in), .par_en(par_en), .bit_count(
        bit_count), .edge_count(edge_count), .par_error(par_error), 
        .str_glitch(str_glitch), .stp_error(stp_error), .prescale(prescale), 
        .par_chk_en(par_chk_en), .str_chk_en(str_chk_en), .stp_chk_en(
        stp_chk_en), .data_sample_en(data_sample_en), .counter_en(counter_en), 
        .deser_en(deser_en), .data_valid(data_valid) );
  counter DUT1 ( .clk(clk), .rst(n1), .counter_en(counter_en), .prescale(
        prescale), .par_en(par_en), .bit_count(bit_count), .edge_count(
        edge_count) );
  data_sampling DUT2 ( .clk(clk), .rst(n1), .rx_in(rx_in), .prescale(prescale), 
        .edge_count(edge_count), .data_sample_en(data_sample_en), 
        .sampled_bit(sampled_bit) );
  parity_check DUT3 ( .clk(clk), .rst(n1), .p_data(p_data), .par_typ(par_typ), 
        .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), .par_error(
        par_error) );
  start_check DUT4 ( .clk(clk), .rst(n1), .str_chk_en(str_chk_en), 
        .sampled_bit(sampled_bit), .str_glitch(str_glitch) );
  stop_check DUT5 ( .clk(clk), .rst(n1), .stp_chk_en(stp_chk_en), 
        .sampled_bit(sampled_bit), .stp_error(stp_error) );
  deserializer DUT6 ( .clk(clk), .rst(n1), .deser_en(deser_en), .sampled_bit(
        sampled_bit), .p_data(p_data) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rst), .Y(n2) );
endmodule


module serializer_WIDTH8 ( CLK, RST, P_DATA, DATA_VALID, SER_EN, SER_DATA, 
        SER_DONE );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, SER_EN;
  output SER_DATA, SER_DONE;
  wire   n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n34, n35, n36, n37, n1, n2, n3, n4, n5,
         n12, n28;
  wire   [3:0] counter;
  wire   [7:0] REG;

  EDFFHQX1M \REG_reg[4]  ( .D(P_DATA[4]), .E(n1), .CK(CLK), .Q(REG[4]) );
  EDFFHQX1M \REG_reg[0]  ( .D(P_DATA[0]), .E(n1), .CK(CLK), .Q(REG[0]) );
  DFFSQX2M \counter_reg[3]  ( .D(n36), .CK(CLK), .SN(RST), .Q(counter[3]) );
  DFFRQX4M \counter_reg[2]  ( .D(n34), .CK(CLK), .RN(RST), .Q(counter[2]) );
  DFFRQX2M \counter_reg[1]  ( .D(n35), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX1M SER_DATA_reg ( .D(n27), .CK(CLK), .RN(RST), .Q(SER_DATA) );
  EDFFX1M \REG_reg[7]  ( .D(P_DATA[7]), .E(n21), .CK(CLK), .QN(n6) );
  EDFFX1M \REG_reg[6]  ( .D(P_DATA[6]), .E(n1), .CK(CLK), .QN(n7) );
  EDFFX1M \REG_reg[5]  ( .D(P_DATA[5]), .E(n1), .CK(CLK), .QN(n8) );
  EDFFX1M \REG_reg[3]  ( .D(P_DATA[3]), .E(n1), .CK(CLK), .QN(n9) );
  EDFFX1M \REG_reg[2]  ( .D(P_DATA[2]), .E(n1), .CK(CLK), .QN(n10) );
  EDFFX1M \REG_reg[1]  ( .D(P_DATA[1]), .E(n1), .CK(CLK), .QN(n11) );
  DFFRX4M \counter_reg[0]  ( .D(n37), .CK(CLK), .RN(RST), .Q(counter[0]), .QN(
        n5) );
  BUFX4M U3 ( .A(n21), .Y(n1) );
  NOR3BX4M U4 ( .AN(DATA_VALID), .B(n22), .C(n2), .Y(n21) );
  AOI21X2M U5 ( .A0(counter[0]), .A1(n22), .B0(n26), .Y(n24) );
  NOR3X6M U6 ( .A(counter[2]), .B(counter[3]), .C(n16), .Y(SER_DONE) );
  INVX2M U7 ( .A(RST), .Y(n2) );
  NOR2X4M U8 ( .A(DATA_VALID), .B(n22), .Y(n26) );
  INVX4M U9 ( .A(n22), .Y(n4) );
  OAI21X2M U10 ( .A0(n12), .A1(n4), .B0(n24), .Y(n23) );
  OAI22X1M U11 ( .A0(n24), .A1(n12), .B0(n16), .B1(n4), .Y(n35) );
  NOR2BX8M U12 ( .AN(SER_EN), .B(SER_DONE), .Y(n22) );
  NAND2X4M U13 ( .A(n5), .B(n12), .Y(n16) );
  OAI32X2M U14 ( .A0(n4), .A1(counter[2]), .A2(n16), .B0(n3), .B1(n28), .Y(n34) );
  INVX2M U15 ( .A(n23), .Y(n3) );
  OAI2B2X1M U16 ( .A1N(counter[3]), .A0(n25), .B0(n22), .B1(n26), .Y(n36) );
  NOR2X2M U17 ( .A(counter[2]), .B(n23), .Y(n25) );
  OAI2BB2X1M U18 ( .B0(counter[0]), .B1(n4), .A0N(counter[0]), .A1N(n26), .Y(
        n37) );
  INVX4M U19 ( .A(counter[1]), .Y(n12) );
  AOI32X1M U20 ( .A0(REG[0]), .A1(n12), .A2(counter[0]), .B0(counter[1]), .B1(
        n20), .Y(n19) );
  OAI22X1M U21 ( .A0(n5), .A1(n10), .B0(counter[0]), .B1(n11), .Y(n20) );
  AOI32X1M U22 ( .A0(counter[0]), .A1(n12), .A2(REG[4]), .B0(counter[1]), .B1(
        n18), .Y(n17) );
  OAI22X1M U23 ( .A0(n5), .A1(n7), .B0(counter[0]), .B1(n8), .Y(n18) );
  OAI2BB2X1M U24 ( .B0(n13), .B1(n4), .A0N(SER_DATA), .A1N(n4), .Y(n27) );
  AOI22X1M U25 ( .A0(n14), .A1(n28), .B0(counter[2]), .B1(n15), .Y(n13) );
  OAI21X2M U26 ( .A0(n16), .A1(n9), .B0(n17), .Y(n15) );
  OAI21X2M U27 ( .A0(n16), .A1(n6), .B0(n19), .Y(n14) );
  INVX2M U28 ( .A(counter[2]), .Y(n28) );
endmodule


module FSM ( CLK, RST, DATA_VALID, SER_DONE, PAR_EN, SER_EN, MUX_SEL, PAR_FLAG, 
        BUSY );
  output [1:0] MUX_SEL;
  input CLK, RST, DATA_VALID, SER_DONE, PAR_EN;
  output SER_EN, PAR_FLAG, BUSY;
  wire   SER_EN, n4, n5, n6, n7, n1, n2, n3, n8;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign PAR_FLAG = SER_EN;

  DFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n1), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n1), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n1), .Q(
        current_state[0]) );
  OAI21X2M U3 ( .A0(current_state[0]), .A1(n5), .B0(n7), .Y(MUX_SEL[0]) );
  OAI21X2M U4 ( .A0(n5), .A1(n2), .B0(n7), .Y(MUX_SEL[1]) );
  NAND3X2M U5 ( .A(n2), .B(n8), .C(current_state[2]), .Y(n7) );
  AOI2B1X2M U6 ( .A1N(PAR_EN), .A0(SER_DONE), .B0(current_state[0]), .Y(n4) );
  BUFX2M U7 ( .A(RST), .Y(n1) );
  NAND2BX4M U8 ( .AN(SER_EN), .B(n7), .Y(BUSY) );
  NOR2X2M U9 ( .A(n4), .B(n5), .Y(next_state[2]) );
  NAND2BX4M U10 ( .AN(current_state[2]), .B(current_state[1]), .Y(n5) );
  INVX2M U11 ( .A(current_state[0]), .Y(n2) );
  INVX2M U12 ( .A(current_state[1]), .Y(n8) );
  OAI21X6M U13 ( .A0(current_state[2]), .A1(n2), .B0(n5), .Y(SER_EN) );
  NOR3X2M U14 ( .A(n6), .B(current_state[2]), .C(current_state[0]), .Y(
        next_state[0]) );
  AOI32X1M U15 ( .A0(SER_DONE), .A1(current_state[1]), .A2(PAR_EN), .B0(
        DATA_VALID), .B1(n8), .Y(n6) );
  OAI32X2M U16 ( .A0(n2), .A1(current_state[2]), .A2(current_state[1]), .B0(n5), .B1(n3), .Y(next_state[1]) );
  INVX2M U17 ( .A(n4), .Y(n3) );
endmodule


module parity_Calc_WIDTH8 ( CLK, RST, P_DATA, DATA_VALID, PAR_TYP, PAR_FLAG, 
        PAR_BIT );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_TYP, PAR_FLAG;
  output PAR_BIT;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n1, n2, n3, n13;
  wire   [7:0] REG;

  EDFFHQX1M \REG_reg[5]  ( .D(P_DATA[5]), .E(n11), .CK(CLK), .Q(REG[5]) );
  EDFFHQX1M \REG_reg[1]  ( .D(P_DATA[1]), .E(n11), .CK(CLK), .Q(REG[1]) );
  EDFFHQX1M \REG_reg[4]  ( .D(P_DATA[4]), .E(n11), .CK(CLK), .Q(REG[4]) );
  EDFFHQX1M \REG_reg[0]  ( .D(P_DATA[0]), .E(n11), .CK(CLK), .Q(REG[0]) );
  EDFFHQX1M \REG_reg[2]  ( .D(P_DATA[2]), .E(n11), .CK(CLK), .Q(REG[2]) );
  EDFFHQX1M \REG_reg[7]  ( .D(P_DATA[7]), .E(n11), .CK(CLK), .Q(REG[7]) );
  EDFFHQX1M \REG_reg[3]  ( .D(P_DATA[3]), .E(n11), .CK(CLK), .Q(REG[3]) );
  EDFFHQX1M \REG_reg[6]  ( .D(P_DATA[6]), .E(n11), .CK(CLK), .Q(REG[6]) );
  DFFRQX1M PAR_BIT_reg ( .D(n12), .CK(CLK), .RN(n1), .Q(PAR_BIT) );
  NOR2X2M U3 ( .A(PAR_TYP), .B(n13), .Y(n5) );
  AND3X4M U4 ( .A(DATA_VALID), .B(n1), .C(n13), .Y(n11) );
  BUFX2M U5 ( .A(RST), .Y(n1) );
  INVX2M U6 ( .A(PAR_FLAG), .Y(n13) );
  INVX2M U7 ( .A(n5), .Y(n3) );
  OAI2BB1X2M U8 ( .A0N(PAR_BIT), .A1N(n13), .B0(n4), .Y(n12) );
  AOI32X1M U9 ( .A0(PAR_FLAG), .A1(n3), .A2(n2), .B0(n5), .B1(n6), .Y(n4) );
  INVX2M U10 ( .A(n6), .Y(n2) );
  XNOR2X4M U11 ( .A(n7), .B(n8), .Y(n6) );
  XOR3XLM U12 ( .A(REG[5]), .B(REG[4]), .C(n9), .Y(n8) );
  CLKXOR2X2M U13 ( .A(REG[7]), .B(REG[6]), .Y(n9) );
  XOR3XLM U14 ( .A(REG[1]), .B(REG[0]), .C(n10), .Y(n7) );
  XNOR2X2M U15 ( .A(REG[2]), .B(REG[3]), .Y(n10) );
endmodule


module MUX ( CLK, RST, MUX_SEL, SER_DATA, PAR_BIT, TX_OUT );
  input [1:0] MUX_SEL;
  input CLK, RST, SER_DATA, PAR_BIT;
  output TX_OUT;
  wire   n4, n2, n3;

  BUFX2M U3 ( .A(n4), .Y(TX_OUT) );
  CLKINVX2M U4 ( .A(MUX_SEL[0]), .Y(n3) );
  OAI21X2M U5 ( .A0(MUX_SEL[0]), .A1(PAR_BIT), .B0(MUX_SEL[1]), .Y(n2) );
  OAI2B11X2M U6 ( .A1N(SER_DATA), .A0(n3), .B0(n2), .C0(RST), .Y(n4) );
endmodule


module UART_TX ( CLK, RST, P_DATA, DATA_VALID, PAR_EN, PAR_TYP, TX_OUT, BUSY
 );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP;
  output TX_OUT, BUSY;
  wire   SER_EN, SER_DATA, SER_DONE, PAR_FLAG, PAR_BIT, n1, n2;
  wire   [1:0] MUX_SEL;

  serializer_WIDTH8 DUT0 ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), .DATA_VALID(
        DATA_VALID), .SER_EN(SER_EN), .SER_DATA(SER_DATA), .SER_DONE(SER_DONE)
         );
  FSM DUT1 ( .CLK(CLK), .RST(n1), .DATA_VALID(DATA_VALID), .SER_DONE(SER_DONE), 
        .PAR_EN(PAR_EN), .SER_EN(SER_EN), .MUX_SEL(MUX_SEL), .PAR_FLAG(
        PAR_FLAG), .BUSY(BUSY) );
  parity_Calc_WIDTH8 DUT2 ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), .DATA_VALID(
        DATA_VALID), .PAR_TYP(PAR_TYP), .PAR_FLAG(PAR_FLAG), .PAR_BIT(PAR_BIT)
         );
  MUX DUT3 ( .CLK(CLK), .RST(n1), .MUX_SEL(MUX_SEL), .SER_DATA(SER_DATA), 
        .PAR_BIT(PAR_BIT), .TX_OUT(TX_OUT) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, REF_CLK, RST, 
        UART_CLK, RX_IN, TX_OUT, PARITY_ERROR, STOP_ERROR, BUSY );
  input [3:0] SI;
  output [3:0] SO;
  input scan_clk, scan_rst, test_mode, SE, REF_CLK, RST, UART_CLK, RX_IN;
  output TX_OUT, PARITY_ERROR, STOP_ERROR, BUSY;
  wire   REF_SCAN_CLK, UART_SCAN_CLK, RX_CLK, UART_RX_SCAN_CLK, TX_CLK,
         UART_TX_SCAN_CLK, RSTN_SCAN_RST, REF_SYNC_RST, SYNC_REF_SCAN_RST,
         UART_SYNC_RST, SYNC_UART_SCAN_RST, RX_DATA_VALID, SYNC_RX_DATA_VALID,
         RD_DATA_VALID, ALU_OUT_VALID, FIFO_FULL, ALU_EN, CLK_GATE_EN, WR_EN,
         RD_EN, CTRL_OUT_VALID, ALU_CLK, RD_INC, FIFO_EMPTY, n2, n3, n4, n5,
         n6;
  wire   [7:0] RX_P_DATA;
  wire   [7:0] SYNC_RX_P_DATA;
  wire   [7:0] RD_DATA;
  wire   [15:0] ALU_OUT;
  wire   [3:0] FUN;
  wire   [3:0] ADDRESS;
  wire   [7:0] WR_DATA;
  wire   [7:0] CTRL_OUT_DATA;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   [7:0] UART_config;
  wire   [7:0] TX_DIV_RATIO;
  wire   [7:0] RX_DIV_RATIO;
  wire   [7:0] TX_IN_DATA;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  mux2X1_1 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        REF_SCAN_CLK) );
  mux2X1_4 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(UART_SCAN_CLK) );
  mux2X1_3 U2_mux2X1 ( .IN_0(RX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        UART_RX_SCAN_CLK) );
  mux2X1_2 U3_mux2X1 ( .IN_0(TX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        UART_TX_SCAN_CLK) );
  mux2X1_0 U4_mux2X1 ( .IN_0(RST), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        RSTN_SCAN_RST) );
  mux2X1_6 U5_mux2X1 ( .IN_0(REF_SYNC_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(SYNC_REF_SCAN_RST) );
  mux2X1_5 U6_mux2X1 ( .IN_0(UART_SYNC_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(SYNC_UART_SCAN_RST) );
  DATA_SYNC_BUS_WIDTH8 DATA_SYNC ( .CLK(REF_SCAN_CLK), .RST(n4), .BUS_EN(
        RX_DATA_VALID), .UN_SYNC_BUS(RX_P_DATA), .EN_PULSE(SYNC_RX_DATA_VALID), 
        .SYNC_BUS(SYNC_RX_P_DATA) );
  SYS_CTRL_DATA_WIDTH8_ADDRESS_WIDTH4_FUN_WIDTH4_ALU_OUT_WIDTH16 SYS_CTRL ( 
        .CLK(REF_SCAN_CLK), .RST(n4), .RX_P_DATA(SYNC_RX_P_DATA), 
        .RX_DATA_VALID(SYNC_RX_DATA_VALID), .RD_DATA(RD_DATA), .RD_DATA_VALID(
        RD_DATA_VALID), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(ALU_OUT_VALID), 
        .FIFO_FULL(FIFO_FULL), .ALU_FUN(FUN), .ALU_EN(ALU_EN), .CLK_GATE_EN(
        CLK_GATE_EN), .ADDRESS(ADDRESS), .WR_EN(WR_EN), .RD_EN(RD_EN), 
        .WR_DATA(WR_DATA), .TX_P_Data(CTRL_OUT_DATA), .TX_DATA_VALID(
        CTRL_OUT_VALID) );
  RST_SYNC_NUM_STAGES2_0 RST_SYNC_1 ( .CLK(REF_SCAN_CLK), .RST(RSTN_SCAN_RST), 
        .SYNC_RST(REF_SYNC_RST) );
  RST_SYNC_NUM_STAGES2_1 RST_SYNC_2 ( .CLK(UART_SCAN_CLK), .RST(RSTN_SCAN_RST), 
        .SYNC_RST(UART_SYNC_RST) );
  Reg_File_DATA_WIDTH8_DEPTH16_ADDRESS_WIDTH4 Reg_file ( .CLK(REF_SCAN_CLK), 
        .RST(n4), .WR_DATA(WR_DATA), .ADDRESS(ADDRESS), .WR_EN(WR_EN), .RD_EN(
        RD_EN), .RD_DATA(RD_DATA), .RD_DATA_VALID(RD_DATA_VALID), .REG_0(OP_A), 
        .REG_1(OP_B), .REG_2(UART_config), .REG_3(TX_DIV_RATIO) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4 ALU ( .CLK(ALU_CLK), .RST(n4), .A(OP_A), .B(
        OP_B), .ALU_FUN(FUN), .ALU_EN(ALU_EN), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VALID) );
  CLK_GATE CLK_GATE ( .CLK(REF_SCAN_CLK), .CLK_EN(CLK_GATE_EN), .GATED_CLK(
        ALU_CLK) );
  CLK_DIV_MUX CLK_DIV_MUX ( .IN(UART_config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, RX_DIV_RATIO[3:0]})
         );
  Clk_Div_WIDTH8_0 CLK_DIV_1 ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(n2), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        RX_DIV_RATIO[3:0]}), .o_div_clk(RX_CLK) );
  Clk_Div_WIDTH8_1 CLK_DIV_2 ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(n2), 
        .i_clk_en(1'b1), .i_div_ratio(TX_DIV_RATIO), .o_div_clk(TX_CLK) );
  FIFO_DATA_WIDTH8_ADDRESS_WIDTH4 FIFO ( .WR_DATA(CTRL_OUT_DATA), .W_INC(
        CTRL_OUT_VALID), .R_INC(RD_INC), .W_CLK(REF_SCAN_CLK), .W_RST(n4), 
        .R_CLK(UART_TX_SCAN_CLK), .R_RST(n2), .FULL(FIFO_FULL), .EMPTY(
        FIFO_EMPTY), .RD_DATA(TX_IN_DATA) );
  PULSE_GEN PULSE_GEN ( .CLK(UART_TX_SCAN_CLK), .RST(n2), .LVL_SIG(BUSY), 
        .PULSE_SIG(RD_INC) );
  UART_RX UART_RX ( .clk(UART_RX_SCAN_CLK), .rst(n2), .rx_in(RX_IN), .par_en(
        UART_config[0]), .par_typ(UART_config[1]), .prescale(UART_config[7:2]), 
        .data_valid(RX_DATA_VALID), .par_error(PARITY_ERROR), .stp_error(
        STOP_ERROR), .p_data(RX_P_DATA) );
  UART_TX UART_TX ( .CLK(UART_TX_SCAN_CLK), .RST(n2), .P_DATA(TX_IN_DATA), 
        .DATA_VALID(n6), .PAR_EN(UART_config[0]), .PAR_TYP(UART_config[1]), 
        .TX_OUT(TX_OUT), .BUSY(BUSY) );
  CLKINVX2M U2 ( .A(FIFO_EMPTY), .Y(n6) );
  INVX4M U3 ( .A(n3), .Y(n2) );
  INVX4M U4 ( .A(n5), .Y(n4) );
  INVX2M U5 ( .A(SYNC_UART_SCAN_RST), .Y(n3) );
  INVX2M U6 ( .A(SYNC_REF_SCAN_RST), .Y(n5) );
endmodule

