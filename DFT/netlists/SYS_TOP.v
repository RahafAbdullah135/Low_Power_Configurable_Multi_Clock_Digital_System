/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Mon Aug 26 23:41:23 2024
/////////////////////////////////////////////////////////////


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module DATA_SYNC_BUS_WIDTH8_test_1 ( CLK, RST, BUS_EN, UN_SYNC_BUS, EN_PULSE, 
        SYNC_BUS, test_si, test_so, test_se );
  input [7:0] UN_SYNC_BUS;
  output [7:0] SYNC_BUS;
  input CLK, RST, BUS_EN, test_si, test_se;
  output EN_PULSE, test_so;
  wire   SYNC_BUS_EN, PULSE_GEN_OUT, N1, n3, n5, n7, n9, n11, n13, n15, n17,
         n1, n23;
  wire   [1:0] stages;
  assign test_so = stages[1];

  SDFFRQX2M PULSE_GEN_OUT_reg ( .D(SYNC_BUS_EN), .SI(EN_PULSE), .SE(test_se), 
        .CK(CLK), .RN(n1), .Q(PULSE_GEN_OUT) );
  SDFFRQX2M \SYNC_BUS_reg[7]  ( .D(n17), .SI(SYNC_BUS[6]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[7]) );
  SDFFRQX2M \SYNC_BUS_reg[6]  ( .D(n15), .SI(SYNC_BUS[5]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[6]) );
  SDFFRQX2M \SYNC_BUS_reg[4]  ( .D(n11), .SI(SYNC_BUS[3]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[4]) );
  SDFFRQX2M SYNC_BUS_EN_reg ( .D(stages[1]), .SI(PULSE_GEN_OUT), .SE(test_se), 
        .CK(CLK), .RN(n1), .Q(SYNC_BUS_EN) );
  SDFFRQX2M \SYNC_BUS_reg[5]  ( .D(n13), .SI(SYNC_BUS[4]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[5]) );
  SDFFRQX2M \SYNC_BUS_reg[3]  ( .D(n9), .SI(SYNC_BUS[2]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[3]) );
  SDFFRQX2M \SYNC_BUS_reg[1]  ( .D(n5), .SI(SYNC_BUS[0]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[1]) );
  SDFFRQX2M \SYNC_BUS_reg[0]  ( .D(n3), .SI(n23), .SE(test_se), .CK(CLK), .RN(
        n1), .Q(SYNC_BUS[0]) );
  SDFFRQX2M \SYNC_BUS_reg[2]  ( .D(n7), .SI(SYNC_BUS[1]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(SYNC_BUS[2]) );
  SDFFRQX2M EN_PULSE_reg ( .D(N1), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        n1), .Q(EN_PULSE) );
  SDFFRQX2M \stages_reg[0]  ( .D(BUS_EN), .SI(SYNC_BUS[7]), .SE(test_se), .CK(
        CLK), .RN(n1), .Q(stages[0]) );
  SDFFRQX2M \stages_reg[1]  ( .D(stages[0]), .SI(stages[0]), .SE(test_se), 
        .CK(CLK), .RN(n1), .Q(stages[1]) );
  BUFX2M U3 ( .A(RST), .Y(n1) );
  INVX2M U4 ( .A(SYNC_BUS_EN), .Y(n23) );
  NOR2X2M U5 ( .A(PULSE_GEN_OUT), .B(n23), .Y(N1) );
  AO22X1M U6 ( .A0(UN_SYNC_BUS[0]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[0]), .B1(
        n23), .Y(n3) );
  AO22X1M U7 ( .A0(UN_SYNC_BUS[1]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[1]), .B1(
        n23), .Y(n5) );
  AO22X1M U8 ( .A0(UN_SYNC_BUS[2]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[2]), .B1(
        n23), .Y(n7) );
  AO22X1M U9 ( .A0(UN_SYNC_BUS[3]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[3]), .B1(
        n23), .Y(n9) );
  AO22X1M U10 ( .A0(UN_SYNC_BUS[4]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[4]), .B1(
        n23), .Y(n11) );
  AO22X1M U11 ( .A0(UN_SYNC_BUS[5]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[5]), .B1(
        n23), .Y(n13) );
  AO22X1M U12 ( .A0(UN_SYNC_BUS[6]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[6]), .B1(
        n23), .Y(n15) );
  AO22X1M U26 ( .A0(UN_SYNC_BUS[7]), .A1(SYNC_BUS_EN), .B0(SYNC_BUS[7]), .B1(
        n23), .Y(n17) );
endmodule



    module SYS_CTRL_DATA_WIDTH8_ADDRESS_WIDTH4_FUN_WIDTH4_ALU_OUT_WIDTH16_test_1 ( 
        CLK, RST, RX_P_DATA, RX_DATA_VALID, RD_DATA, RD_DATA_VALID, ALU_OUT, 
        ALU_OUT_VALID, FIFO_FULL, ALU_FUN, ALU_EN, CLK_GATE_EN, ADDRESS, WR_EN, 
        RD_EN, WR_DATA, TX_P_Data, TX_DATA_VALID, CLK_DIV_EN, test_si, test_so, 
        test_se );
  input [7:0] RX_P_DATA;
  input [7:0] RD_DATA;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] ADDRESS;
  output [7:0] WR_DATA;
  output [7:0] TX_P_Data;
  input CLK, RST, RX_DATA_VALID, RD_DATA_VALID, ALU_OUT_VALID, FIFO_FULL,
         test_si, test_se;
  output ALU_EN, CLK_GATE_EN, WR_EN, RD_EN, TX_DATA_VALID, CLK_DIV_EN, test_so;
  wire   n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n28, n29, n30, n31,
         n32, n33, n34, n35, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  assign test_so = n71;

  SDFFRX1M \ALU_OUT_REG_reg[7]  ( .D(n125), .SI(n153), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n152), .QN(n48) );
  SDFFRX1M \ALU_OUT_REG_reg[6]  ( .D(n124), .SI(n154), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n153), .QN(n49) );
  SDFFRX1M \ALU_OUT_REG_reg[5]  ( .D(n123), .SI(n155), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n154), .QN(n50) );
  SDFFRX1M \ALU_OUT_REG_reg[4]  ( .D(n122), .SI(n156), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n155), .QN(n51) );
  SDFFRX1M \ALU_OUT_REG_reg[3]  ( .D(n121), .SI(n157), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n156), .QN(n52) );
  SDFFRX1M \ALU_OUT_REG_reg[2]  ( .D(n120), .SI(n158), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n157), .QN(n53) );
  SDFFRX1M \ALU_OUT_REG_reg[1]  ( .D(n119), .SI(n159), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n158), .QN(n54) );
  SDFFRX1M \ALU_OUT_REG_reg[0]  ( .D(n118), .SI(n160), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n159), .QN(n55) );
  SDFFRX1M \ALU_OUT_REG_reg[14]  ( .D(n132), .SI(n146), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n145), .QN(n41) );
  SDFFRX1M \ALU_OUT_REG_reg[13]  ( .D(n131), .SI(n147), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n146), .QN(n42) );
  SDFFRX1M \ALU_OUT_REG_reg[12]  ( .D(n130), .SI(n148), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n147), .QN(n43) );
  SDFFRX1M \ALU_OUT_REG_reg[11]  ( .D(n129), .SI(n149), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n148), .QN(n44) );
  SDFFRX1M \ALU_OUT_REG_reg[10]  ( .D(n128), .SI(n150), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n149), .QN(n45) );
  SDFFRX1M \ALU_OUT_REG_reg[9]  ( .D(n127), .SI(n151), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n150), .QN(n46) );
  SDFFRX1M \ALU_OUT_REG_reg[8]  ( .D(n126), .SI(n152), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n151), .QN(n47) );
  SDFFRX1M \ADDRESS_REG_reg[2]  ( .D(n136), .SI(n162), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n161), .QN(n37) );
  SDFFRX1M \ADDRESS_REG_reg[0]  ( .D(n134), .SI(test_si), .SE(test_se), .CK(
        CLK), .RN(n30), .Q(n163), .QN(n39) );
  SDFFRX1M \ADDRESS_REG_reg[3]  ( .D(n137), .SI(n161), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n160), .QN(n36) );
  SDFFRX1M \ADDRESS_REG_reg[1]  ( .D(n135), .SI(n163), .SE(test_se), .CK(CLK), 
        .RN(n30), .Q(n162), .QN(n38) );
  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n65), .SE(test_se), 
        .CK(CLK), .RN(n30), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .SI(n69), .SE(test_se), 
        .CK(CLK), .RN(n30), .Q(current_state[3]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n70), .SE(test_se), 
        .CK(CLK), .RN(n30), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(n144), .SE(test_se), .CK(CLK), .RN(n30), .Q(current_state[0]) );
  SDFFRX1M \ALU_OUT_REG_reg[15]  ( .D(n133), .SI(n145), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n144), .QN(n40) );
  OAI22X2M U30 ( .A0(n90), .A1(n107), .B0(n37), .B1(n117), .Y(ADDRESS[2]) );
  NOR4X1M U31 ( .A(n70), .B(n71), .C(current_state[0]), .D(current_state[2]), 
        .Y(n114) );
  INVX2M U32 ( .A(WR_EN), .Y(n63) );
  NOR2X2M U33 ( .A(n72), .B(n106), .Y(WR_EN) );
  OR2X2M U34 ( .A(n80), .B(n72), .Y(n117) );
  NAND2X2M U35 ( .A(n83), .B(n32), .Y(n111) );
  INVX2M U36 ( .A(n74), .Y(n68) );
  INVX2M U37 ( .A(n105), .Y(n62) );
  INVX2M U38 ( .A(n86), .Y(n29) );
  INVX2M U39 ( .A(FIFO_FULL), .Y(n32) );
  INVX2M U40 ( .A(n31), .Y(n30) );
  AND3X2M U41 ( .A(n98), .B(n76), .C(n80), .Y(n106) );
  INVX2M U42 ( .A(n28), .Y(n72) );
  NAND3X2M U43 ( .A(n65), .B(n69), .C(n116), .Y(n80) );
  NOR2X2M U44 ( .A(n106), .B(n109), .Y(WR_DATA[0]) );
  NOR2X2M U45 ( .A(n106), .B(n108), .Y(WR_DATA[1]) );
  NOR2X2M U46 ( .A(n106), .B(n107), .Y(WR_DATA[2]) );
  NOR2X2M U47 ( .A(n106), .B(n103), .Y(WR_DATA[3]) );
  NOR2X2M U48 ( .A(n138), .B(n63), .Y(WR_DATA[5]) );
  OAI21X2M U49 ( .A0(FIFO_FULL), .A1(n115), .B0(n113), .Y(TX_DATA_VALID) );
  NOR2X2M U50 ( .A(n71), .B(n84), .Y(n74) );
  NOR2X2M U51 ( .A(n68), .B(n65), .Y(n83) );
  NOR2X2M U52 ( .A(n90), .B(n72), .Y(RD_EN) );
  NOR2X2M U53 ( .A(n83), .B(n114), .Y(n115) );
  NAND2X2M U54 ( .A(n114), .B(n32), .Y(n112) );
  NOR2X2M U55 ( .A(n139), .B(n63), .Y(WR_DATA[4]) );
  NOR2X2M U56 ( .A(n73), .B(n63), .Y(WR_DATA[7]) );
  NAND2BX2M U57 ( .AN(n84), .B(n71), .Y(n99) );
  NAND2X2M U58 ( .A(n70), .B(n69), .Y(n84) );
  NAND2X2M U59 ( .A(n100), .B(n28), .Y(n94) );
  OAI211X2M U60 ( .A0(n28), .A1(n80), .B0(n66), .C0(n81), .Y(next_state[1]) );
  AOI211X2M U61 ( .A0(n28), .A1(n82), .B0(n64), .C0(n83), .Y(n81) );
  INVX2M U62 ( .A(n85), .Y(n66) );
  OAI21X2M U63 ( .A0(n84), .A1(n65), .B0(n76), .Y(n82) );
  NOR3X2M U64 ( .A(n72), .B(n65), .C(n99), .Y(n105) );
  NOR4X1M U65 ( .A(n73), .B(n142), .C(n138), .D(n103), .Y(n102) );
  NOR4X1M U66 ( .A(n143), .B(n139), .C(n142), .D(n138), .Y(n97) );
  OAI21X2M U67 ( .A0(n65), .A1(n99), .B0(n76), .Y(n89) );
  INVX2M U68 ( .A(n98), .Y(n64) );
  OR2X2M U69 ( .A(ALU_EN), .B(n74), .Y(next_state[3]) );
  NOR2X2M U70 ( .A(n72), .B(n95), .Y(ALU_EN) );
  NOR2X2M U71 ( .A(n95), .B(n107), .Y(ALU_FUN[2]) );
  NOR2X2M U72 ( .A(n95), .B(n103), .Y(ALU_FUN[3]) );
  NOR2X2M U73 ( .A(n95), .B(n109), .Y(ALU_FUN[0]) );
  NOR2X2M U74 ( .A(n95), .B(n108), .Y(ALU_FUN[1]) );
  INVX2M U75 ( .A(RST), .Y(n31) );
  NAND3X2M U76 ( .A(n95), .B(n68), .C(n115), .Y(CLK_GATE_EN) );
  OAI22X4M U77 ( .A0(n90), .A1(n103), .B0(n36), .B1(n117), .Y(ADDRESS[3]) );
  NOR3X2M U78 ( .A(current_state[1]), .B(current_state[3]), .C(n69), .Y(n110)
         );
  NOR2X2M U79 ( .A(n70), .B(current_state[3]), .Y(n116) );
  NAND3X2M U80 ( .A(n116), .B(n69), .C(current_state[0]), .Y(n90) );
  INVX2M U81 ( .A(current_state[0]), .Y(n65) );
  NAND2X2M U82 ( .A(n110), .B(current_state[0]), .Y(n76) );
  INVX2M U83 ( .A(current_state[2]), .Y(n69) );
  NAND3X2M U84 ( .A(n116), .B(n65), .C(current_state[2]), .Y(n98) );
  BUFX2M U85 ( .A(RX_DATA_VALID), .Y(n28) );
  INVX2M U86 ( .A(current_state[1]), .Y(n70) );
  OAI222X1M U87 ( .A0(n72), .A1(n98), .B0(n39), .B1(n117), .C0(n90), .C1(n109), 
        .Y(ADDRESS[0]) );
  OAI32X1M U88 ( .A0(n92), .A1(n93), .A2(n94), .B0(n28), .B1(n95), .Y(n79) );
  NAND2X2M U89 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .Y(n92) );
  NAND3X2M U90 ( .A(current_state[0]), .B(n116), .C(current_state[2]), .Y(n95)
         );
  OAI211X2M U91 ( .A0(n28), .A1(n90), .B0(n91), .C0(n67), .Y(n85) );
  NAND4BX1M U92 ( .AN(n94), .B(RX_P_DATA[7]), .C(n96), .D(n97), .Y(n91) );
  INVX2M U93 ( .A(n79), .Y(n67) );
  NOR3X2M U94 ( .A(n140), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n96) );
  NAND4BX1M U95 ( .AN(RD_EN), .B(n75), .C(n76), .D(n77), .Y(next_state[2]) );
  AOI211X2M U96 ( .A0(n78), .A1(n33), .B0(n79), .C0(n64), .Y(n77) );
  INVX2M U97 ( .A(RD_DATA_VALID), .Y(n33) );
  NOR2BX2M U98 ( .AN(RX_P_DATA[6]), .B(n63), .Y(WR_DATA[6]) );
  OAI222X1M U99 ( .A0(n55), .A1(n111), .B0(n47), .B1(n112), .C0(n113), .C1(n61), .Y(TX_P_Data[0]) );
  INVX2M U100 ( .A(RD_DATA[0]), .Y(n61) );
  OAI222X1M U101 ( .A0(n54), .A1(n111), .B0(n46), .B1(n112), .C0(n113), .C1(
        n60), .Y(TX_P_Data[1]) );
  INVX2M U102 ( .A(RD_DATA[1]), .Y(n60) );
  OAI222X1M U103 ( .A0(n53), .A1(n111), .B0(n45), .B1(n112), .C0(n113), .C1(
        n59), .Y(TX_P_Data[2]) );
  INVX2M U104 ( .A(RD_DATA[2]), .Y(n59) );
  OAI222X1M U105 ( .A0(n52), .A1(n111), .B0(n44), .B1(n112), .C0(n113), .C1(
        n58), .Y(TX_P_Data[3]) );
  INVX2M U106 ( .A(RD_DATA[3]), .Y(n58) );
  OAI222X1M U107 ( .A0(n51), .A1(n111), .B0(n43), .B1(n112), .C0(n113), .C1(
        n57), .Y(TX_P_Data[4]) );
  INVX2M U108 ( .A(RD_DATA[4]), .Y(n57) );
  OAI222X1M U109 ( .A0(n50), .A1(n111), .B0(n42), .B1(n112), .C0(n113), .C1(
        n56), .Y(TX_P_Data[5]) );
  INVX2M U110 ( .A(RD_DATA[5]), .Y(n56) );
  OAI222X1M U111 ( .A0(n49), .A1(n111), .B0(n41), .B1(n112), .C0(n113), .C1(
        n35), .Y(TX_P_Data[6]) );
  INVX2M U112 ( .A(RD_DATA[6]), .Y(n35) );
  OAI222X1M U113 ( .A0(n48), .A1(n111), .B0(n40), .B1(n112), .C0(n113), .C1(
        n34), .Y(TX_P_Data[7]) );
  INVX2M U114 ( .A(RD_DATA[7]), .Y(n34) );
  NOR2X2M U115 ( .A(n99), .B(current_state[0]), .Y(n100) );
  NAND2X2M U116 ( .A(RX_P_DATA[3]), .B(n28), .Y(n103) );
  NAND3X2M U117 ( .A(n78), .B(n32), .C(RD_DATA_VALID), .Y(n113) );
  NOR2BX2M U118 ( .AN(n110), .B(current_state[0]), .Y(n78) );
  NAND2X2M U119 ( .A(RX_P_DATA[2]), .B(n28), .Y(n107) );
  NAND2X2M U120 ( .A(RX_P_DATA[1]), .B(n28), .Y(n108) );
  NAND2X2M U121 ( .A(RX_P_DATA[0]), .B(n28), .Y(n109) );
  NAND4X2M U122 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[3]), .C(RX_P_DATA[7]), .D(
        n104), .Y(n93) );
  NOR3X2M U123 ( .A(n141), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n104) );
  INVX2M U124 ( .A(current_state[3]), .Y(n71) );
  NAND4X2M U125 ( .A(n75), .B(n86), .C(n87), .D(n88), .Y(next_state[0]) );
  NAND4X2M U126 ( .A(n100), .B(n143), .C(n101), .D(n102), .Y(n87) );
  AOI221XLM U127 ( .A0(n89), .A1(n72), .B0(n64), .B1(n28), .C0(n85), .Y(n88)
         );
  NOR3X2M U128 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n101) );
  INVX2M U129 ( .A(RX_P_DATA[2]), .Y(n141) );
  OAI22X1M U130 ( .A0(n90), .A1(n108), .B0(n38), .B1(n117), .Y(ADDRESS[1]) );
  OAI22X1M U131 ( .A0(n143), .A1(n62), .B0(n105), .B1(n39), .Y(n134) );
  OAI22X1M U132 ( .A0(n142), .A1(n62), .B0(n105), .B1(n38), .Y(n135) );
  OAI22X1M U133 ( .A0(n141), .A1(n62), .B0(n105), .B1(n37), .Y(n136) );
  OAI22X1M U134 ( .A0(n140), .A1(n62), .B0(n105), .B1(n36), .Y(n137) );
  NAND3X2M U135 ( .A(n74), .B(n65), .C(ALU_OUT_VALID), .Y(n86) );
  OAI2BB2X1M U136 ( .B0(n29), .B1(n55), .A0N(ALU_OUT[0]), .A1N(n29), .Y(n118)
         );
  OAI2BB2X1M U137 ( .B0(n29), .B1(n54), .A0N(ALU_OUT[1]), .A1N(n29), .Y(n119)
         );
  OAI2BB2X1M U138 ( .B0(n29), .B1(n53), .A0N(ALU_OUT[2]), .A1N(n29), .Y(n120)
         );
  OAI2BB2X1M U139 ( .B0(n29), .B1(n52), .A0N(ALU_OUT[3]), .A1N(n29), .Y(n121)
         );
  OAI2BB2X1M U140 ( .B0(n29), .B1(n51), .A0N(ALU_OUT[4]), .A1N(n29), .Y(n122)
         );
  OAI2BB2X1M U141 ( .B0(n29), .B1(n50), .A0N(ALU_OUT[5]), .A1N(n29), .Y(n123)
         );
  OAI2BB2X1M U142 ( .B0(n29), .B1(n49), .A0N(ALU_OUT[6]), .A1N(n29), .Y(n124)
         );
  OAI2BB2X1M U143 ( .B0(n29), .B1(n48), .A0N(ALU_OUT[7]), .A1N(n29), .Y(n125)
         );
  OAI2BB2X1M U144 ( .B0(n29), .B1(n47), .A0N(ALU_OUT[8]), .A1N(n29), .Y(n126)
         );
  OAI2BB2X1M U145 ( .B0(n29), .B1(n46), .A0N(ALU_OUT[9]), .A1N(n29), .Y(n127)
         );
  OAI2BB2X1M U146 ( .B0(n29), .B1(n45), .A0N(ALU_OUT[10]), .A1N(n29), .Y(n128)
         );
  OAI2BB2X1M U147 ( .B0(n29), .B1(n44), .A0N(ALU_OUT[11]), .A1N(n29), .Y(n129)
         );
  OAI2BB2X1M U148 ( .B0(n29), .B1(n43), .A0N(ALU_OUT[12]), .A1N(n29), .Y(n130)
         );
  OAI2BB2X1M U149 ( .B0(n29), .B1(n42), .A0N(ALU_OUT[13]), .A1N(n29), .Y(n131)
         );
  OAI2BB2X1M U150 ( .B0(n29), .B1(n41), .A0N(ALU_OUT[14]), .A1N(n29), .Y(n132)
         );
  OAI2BB2X1M U151 ( .B0(n29), .B1(n40), .A0N(ALU_OUT[15]), .A1N(n29), .Y(n133)
         );
  INVX2M U152 ( .A(RX_P_DATA[1]), .Y(n142) );
  INVX2M U153 ( .A(RX_P_DATA[5]), .Y(n138) );
  INVX2M U154 ( .A(RX_P_DATA[0]), .Y(n143) );
  INVX2M U155 ( .A(RX_P_DATA[4]), .Y(n139) );
  INVX2M U156 ( .A(RX_P_DATA[7]), .Y(n73) );
  OR4X1M U157 ( .A(n93), .B(n94), .C(RX_P_DATA[0]), .D(RX_P_DATA[4]), .Y(n75)
         );
  INVX2M U158 ( .A(RX_P_DATA[3]), .Y(n140) );
  INVX2M U3 ( .A(1'b0), .Y(CLK_DIV_EN) );
endmodule


module RST_SYNC_NUM_STAGES2_test_0 ( CLK, RST, SYNC_RST, test_si, test_so, 
        test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST, test_so;

  wire   [1:0] stages;
  assign test_so = stages[1];

  SDFFRQX2M SYNC_RST_reg ( .D(stages[1]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \stages_reg[0]  ( .D(1'b1), .SI(SYNC_RST), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(stages[0]) );
  SDFFRQX1M \stages_reg[1]  ( .D(stages[0]), .SI(stages[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(stages[1]) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( CLK, RST, SYNC_RST, test_si, test_so, 
        test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST, test_so;

  wire   [1:0] stages;
  assign test_so = stages[1];

  SDFFRQX2M SYNC_RST_reg ( .D(stages[1]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \stages_reg[0]  ( .D(1'b1), .SI(SYNC_RST), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(stages[0]) );
  SDFFRQX1M \stages_reg[1]  ( .D(stages[0]), .SI(stages[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(stages[1]) );
endmodule


module Reg_File_DATA_WIDTH8_DEPTH16_ADDRESS_WIDTH4_test_1 ( CLK, RST, WR_DATA, 
        ADDRESS, WR_EN, RD_EN, RD_DATA, RD_DATA_VALID, REG_0, REG_1, REG_2, 
        REG_3, test_si3, test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  input [3:0] ADDRESS;
  output [7:0] RD_DATA;
  output [7:0] REG_0;
  output [7:0] REG_1;
  output [7:0] REG_2;
  output [7:0] REG_3;
  input CLK, RST, WR_EN, RD_EN, test_si3, test_si2, test_si1, test_se;
  output RD_DATA_VALID, test_so2, test_so1;
  wire   N11, N12, N13, N14, \REG[15][7] , \REG[15][6] , \REG[15][5] ,
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
         N42, N43, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n370, n371,
         n372, n373;
  assign N11 = ADDRESS[0];
  assign N12 = ADDRESS[1];
  assign N13 = ADDRESS[2];
  assign N14 = ADDRESS[3];
  assign test_so2 = \REG[15][7] ;
  assign test_so1 = \REG[14][1] ;

  SDFFRQX2M \REG_reg[13][7]  ( .D(n297), .SI(\REG[13][6] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG[13][7] ) );
  SDFFRQX2M \REG_reg[13][6]  ( .D(n296), .SI(\REG[13][5] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\REG[13][6] ) );
  SDFFRQX2M \REG_reg[13][5]  ( .D(n295), .SI(\REG[13][4] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG[13][5] ) );
  SDFFRQX2M \REG_reg[13][4]  ( .D(n294), .SI(\REG[13][3] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG[13][4] ) );
  SDFFRQX2M \REG_reg[13][3]  ( .D(n293), .SI(\REG[13][2] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG[13][3] ) );
  SDFFRQX2M \REG_reg[13][2]  ( .D(n292), .SI(\REG[13][1] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\REG[13][2] ) );
  SDFFRQX2M \REG_reg[13][1]  ( .D(n291), .SI(\REG[13][0] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG[13][1] ) );
  SDFFRQX2M \REG_reg[13][0]  ( .D(n290), .SI(\REG[12][7] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG[13][0] ) );
  SDFFRQX2M \REG_reg[9][7]  ( .D(n265), .SI(\REG[9][6] ), .SE(n372), .CK(CLK), 
        .RN(n348), .Q(\REG[9][7] ) );
  SDFFRQX2M \REG_reg[9][6]  ( .D(n264), .SI(\REG[9][5] ), .SE(n371), .CK(CLK), 
        .RN(n348), .Q(\REG[9][6] ) );
  SDFFRQX2M \REG_reg[9][5]  ( .D(n263), .SI(\REG[9][4] ), .SE(n370), .CK(CLK), 
        .RN(n348), .Q(\REG[9][5] ) );
  SDFFRQX2M \REG_reg[9][4]  ( .D(n262), .SI(\REG[9][3] ), .SE(n373), .CK(CLK), 
        .RN(n348), .Q(\REG[9][4] ) );
  SDFFRQX2M \REG_reg[9][3]  ( .D(n261), .SI(\REG[9][2] ), .SE(n372), .CK(CLK), 
        .RN(n348), .Q(\REG[9][3] ) );
  SDFFRQX2M \REG_reg[9][2]  ( .D(n260), .SI(\REG[9][1] ), .SE(n371), .CK(CLK), 
        .RN(n348), .Q(\REG[9][2] ) );
  SDFFRQX2M \REG_reg[9][1]  ( .D(n259), .SI(\REG[9][0] ), .SE(n370), .CK(CLK), 
        .RN(n348), .Q(\REG[9][1] ) );
  SDFFRQX2M \REG_reg[9][0]  ( .D(n258), .SI(\REG[8][7] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\REG[9][0] ) );
  SDFFRQX2M \REG_reg[5][7]  ( .D(n233), .SI(\REG[5][6] ), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\REG[5][7] ) );
  SDFFRQX2M \REG_reg[5][6]  ( .D(n232), .SI(\REG[5][5] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\REG[5][6] ) );
  SDFFRQX2M \REG_reg[5][5]  ( .D(n231), .SI(\REG[5][4] ), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(\REG[5][5] ) );
  SDFFRQX2M \REG_reg[5][4]  ( .D(n230), .SI(\REG[5][3] ), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(\REG[5][4] ) );
  SDFFRQX2M \REG_reg[5][3]  ( .D(n229), .SI(\REG[5][2] ), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(\REG[5][3] ) );
  SDFFRQX2M \REG_reg[5][2]  ( .D(n228), .SI(\REG[5][1] ), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(\REG[5][2] ) );
  SDFFRQX2M \REG_reg[5][1]  ( .D(n227), .SI(\REG[5][0] ), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(\REG[5][1] ) );
  SDFFRQX2M \REG_reg[5][0]  ( .D(n226), .SI(\REG[4][7] ), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(\REG[5][0] ) );
  SDFFRQX2M \REG_reg[15][7]  ( .D(n313), .SI(\REG[15][6] ), .SE(n372), .CK(CLK), .RN(n342), .Q(\REG[15][7] ) );
  SDFFRQX2M \REG_reg[15][6]  ( .D(n312), .SI(\REG[15][5] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\REG[15][6] ) );
  SDFFRQX2M \REG_reg[15][5]  ( .D(n311), .SI(\REG[15][4] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\REG[15][5] ) );
  SDFFRQX2M \REG_reg[15][4]  ( .D(n310), .SI(\REG[15][3] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\REG[15][4] ) );
  SDFFRQX2M \REG_reg[15][3]  ( .D(n309), .SI(\REG[15][2] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\REG[15][3] ) );
  SDFFRQX2M \REG_reg[15][2]  ( .D(n308), .SI(\REG[15][1] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\REG[15][2] ) );
  SDFFRQX2M \REG_reg[15][1]  ( .D(n307), .SI(\REG[15][0] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\REG[15][1] ) );
  SDFFRQX2M \REG_reg[15][0]  ( .D(n306), .SI(\REG[14][7] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\REG[15][0] ) );
  SDFFRQX2M \REG_reg[11][7]  ( .D(n281), .SI(\REG[11][6] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG[11][7] ) );
  SDFFRQX2M \REG_reg[11][6]  ( .D(n280), .SI(\REG[11][5] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG[11][6] ) );
  SDFFRQX2M \REG_reg[11][5]  ( .D(n279), .SI(\REG[11][4] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG[11][5] ) );
  SDFFRQX2M \REG_reg[11][4]  ( .D(n278), .SI(\REG[11][3] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG[11][4] ) );
  SDFFRQX2M \REG_reg[11][3]  ( .D(n277), .SI(\REG[11][2] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG[11][3] ) );
  SDFFRQX2M \REG_reg[11][2]  ( .D(n276), .SI(\REG[11][1] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG[11][2] ) );
  SDFFRQX2M \REG_reg[11][1]  ( .D(n275), .SI(\REG[11][0] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG[11][1] ) );
  SDFFRQX2M \REG_reg[11][0]  ( .D(n274), .SI(\REG[10][7] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG[11][0] ) );
  SDFFRQX2M \REG_reg[7][7]  ( .D(n249), .SI(\REG[7][6] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\REG[7][7] ) );
  SDFFRQX2M \REG_reg[7][6]  ( .D(n248), .SI(\REG[7][5] ), .SE(n371), .CK(CLK), 
        .RN(n347), .Q(\REG[7][6] ) );
  SDFFRQX2M \REG_reg[7][5]  ( .D(n247), .SI(\REG[7][4] ), .SE(n370), .CK(CLK), 
        .RN(n347), .Q(\REG[7][5] ) );
  SDFFRQX2M \REG_reg[7][4]  ( .D(n246), .SI(\REG[7][3] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\REG[7][4] ) );
  SDFFRQX2M \REG_reg[7][3]  ( .D(n245), .SI(\REG[7][2] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\REG[7][3] ) );
  SDFFRQX2M \REG_reg[7][2]  ( .D(n244), .SI(\REG[7][1] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\REG[7][2] ) );
  SDFFRQX2M \REG_reg[7][1]  ( .D(n243), .SI(\REG[7][0] ), .SE(n370), .CK(CLK), 
        .RN(n346), .Q(\REG[7][1] ) );
  SDFFRQX2M \REG_reg[7][0]  ( .D(n242), .SI(\REG[6][7] ), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\REG[7][0] ) );
  SDFFRQX2M \REG_reg[14][7]  ( .D(n305), .SI(\REG[14][6] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\REG[14][7] ) );
  SDFFRQX2M \REG_reg[14][6]  ( .D(n304), .SI(\REG[14][5] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\REG[14][6] ) );
  SDFFRQX2M \REG_reg[14][5]  ( .D(n303), .SI(\REG[14][4] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\REG[14][5] ) );
  SDFFRQX2M \REG_reg[14][4]  ( .D(n302), .SI(\REG[14][3] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\REG[14][4] ) );
  SDFFRQX2M \REG_reg[14][3]  ( .D(n301), .SI(\REG[14][2] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\REG[14][3] ) );
  SDFFRQX2M \REG_reg[14][2]  ( .D(n300), .SI(test_si3), .SE(n371), .CK(CLK), 
        .RN(n350), .Q(\REG[14][2] ) );
  SDFFRQX2M \REG_reg[14][1]  ( .D(n299), .SI(\REG[14][0] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG[14][1] ) );
  SDFFRQX2M \REG_reg[14][0]  ( .D(n298), .SI(\REG[13][7] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG[14][0] ) );
  SDFFRQX2M \REG_reg[10][7]  ( .D(n273), .SI(\REG[10][6] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG[10][7] ) );
  SDFFRQX2M \REG_reg[10][6]  ( .D(n272), .SI(\REG[10][5] ), .SE(n371), .CK(CLK), .RN(n348), .Q(\REG[10][6] ) );
  SDFFRQX2M \REG_reg[10][5]  ( .D(n271), .SI(\REG[10][4] ), .SE(n370), .CK(CLK), .RN(n348), .Q(\REG[10][5] ) );
  SDFFRQX2M \REG_reg[10][4]  ( .D(n270), .SI(\REG[10][3] ), .SE(n373), .CK(CLK), .RN(n348), .Q(\REG[10][4] ) );
  SDFFRQX2M \REG_reg[10][3]  ( .D(n269), .SI(\REG[10][2] ), .SE(n372), .CK(CLK), .RN(n348), .Q(\REG[10][3] ) );
  SDFFRQX2M \REG_reg[10][2]  ( .D(n268), .SI(\REG[10][1] ), .SE(n371), .CK(CLK), .RN(n348), .Q(\REG[10][2] ) );
  SDFFRQX2M \REG_reg[10][1]  ( .D(n267), .SI(\REG[10][0] ), .SE(n370), .CK(CLK), .RN(n348), .Q(\REG[10][1] ) );
  SDFFRQX2M \REG_reg[10][0]  ( .D(n266), .SI(\REG[9][7] ), .SE(n373), .CK(CLK), 
        .RN(n348), .Q(\REG[10][0] ) );
  SDFFRQX2M \REG_reg[6][7]  ( .D(n241), .SI(\REG[6][6] ), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\REG[6][7] ) );
  SDFFRQX2M \REG_reg[6][6]  ( .D(n240), .SI(\REG[6][5] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\REG[6][6] ) );
  SDFFRQX2M \REG_reg[6][5]  ( .D(n239), .SI(\REG[6][4] ), .SE(n370), .CK(CLK), 
        .RN(n346), .Q(\REG[6][5] ) );
  SDFFRQX2M \REG_reg[6][4]  ( .D(n238), .SI(\REG[6][3] ), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\REG[6][4] ) );
  SDFFRQX2M \REG_reg[6][3]  ( .D(n237), .SI(\REG[6][2] ), .SE(n372), .CK(CLK), 
        .RN(n346), .Q(\REG[6][3] ) );
  SDFFRQX2M \REG_reg[6][2]  ( .D(n236), .SI(\REG[6][1] ), .SE(n371), .CK(CLK), 
        .RN(n346), .Q(\REG[6][2] ) );
  SDFFRQX2M \REG_reg[6][1]  ( .D(n235), .SI(\REG[6][0] ), .SE(n370), .CK(CLK), 
        .RN(n346), .Q(\REG[6][1] ) );
  SDFFRQX2M \REG_reg[6][0]  ( .D(n234), .SI(\REG[5][7] ), .SE(n373), .CK(CLK), 
        .RN(n346), .Q(\REG[6][0] ) );
  SDFFRQX2M \REG_reg[12][7]  ( .D(n289), .SI(\REG[12][6] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG[12][7] ) );
  SDFFRQX2M \REG_reg[12][6]  ( .D(n288), .SI(\REG[12][5] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\REG[12][6] ) );
  SDFFRQX2M \REG_reg[12][5]  ( .D(n287), .SI(\REG[12][4] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG[12][5] ) );
  SDFFRQX2M \REG_reg[12][4]  ( .D(n286), .SI(\REG[12][3] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG[12][4] ) );
  SDFFRQX2M \REG_reg[12][3]  ( .D(n285), .SI(\REG[12][2] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG[12][3] ) );
  SDFFRQX2M \REG_reg[12][2]  ( .D(n284), .SI(\REG[12][1] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG[12][2] ) );
  SDFFRQX2M \REG_reg[12][1]  ( .D(n283), .SI(\REG[12][0] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG[12][1] ) );
  SDFFRQX2M \REG_reg[12][0]  ( .D(n282), .SI(\REG[11][7] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG[12][0] ) );
  SDFFRQX2M \REG_reg[8][7]  ( .D(n257), .SI(\REG[8][6] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\REG[8][7] ) );
  SDFFRQX2M \REG_reg[8][6]  ( .D(n256), .SI(\REG[8][5] ), .SE(n371), .CK(CLK), 
        .RN(n347), .Q(\REG[8][6] ) );
  SDFFRQX2M \REG_reg[8][5]  ( .D(n255), .SI(\REG[8][4] ), .SE(n370), .CK(CLK), 
        .RN(n347), .Q(\REG[8][5] ) );
  SDFFRQX2M \REG_reg[8][4]  ( .D(n254), .SI(\REG[8][3] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\REG[8][4] ) );
  SDFFRQX2M \REG_reg[8][3]  ( .D(n253), .SI(\REG[8][2] ), .SE(n372), .CK(CLK), 
        .RN(n347), .Q(\REG[8][3] ) );
  SDFFRQX2M \REG_reg[8][2]  ( .D(n252), .SI(\REG[8][1] ), .SE(n371), .CK(CLK), 
        .RN(n347), .Q(\REG[8][2] ) );
  SDFFRQX2M \REG_reg[8][1]  ( .D(n251), .SI(\REG[8][0] ), .SE(n370), .CK(CLK), 
        .RN(n347), .Q(\REG[8][1] ) );
  SDFFRQX2M \REG_reg[8][0]  ( .D(n250), .SI(\REG[7][7] ), .SE(n373), .CK(CLK), 
        .RN(n347), .Q(\REG[8][0] ) );
  SDFFRQX2M \REG_reg[4][7]  ( .D(n225), .SI(\REG[4][6] ), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(\REG[4][7] ) );
  SDFFRQX2M \REG_reg[4][6]  ( .D(n224), .SI(\REG[4][5] ), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(\REG[4][6] ) );
  SDFFRQX2M \REG_reg[4][5]  ( .D(n223), .SI(\REG[4][4] ), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(\REG[4][5] ) );
  SDFFRQX2M \REG_reg[4][4]  ( .D(n222), .SI(\REG[4][3] ), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(\REG[4][4] ) );
  SDFFRQX2M \REG_reg[4][3]  ( .D(n221), .SI(\REG[4][2] ), .SE(n372), .CK(CLK), 
        .RN(n345), .Q(\REG[4][3] ) );
  SDFFRQX2M \REG_reg[4][2]  ( .D(n220), .SI(\REG[4][1] ), .SE(n371), .CK(CLK), 
        .RN(n345), .Q(\REG[4][2] ) );
  SDFFRQX2M \REG_reg[4][1]  ( .D(n219), .SI(\REG[4][0] ), .SE(n370), .CK(CLK), 
        .RN(n345), .Q(\REG[4][1] ) );
  SDFFRQX2M \REG_reg[4][0]  ( .D(n218), .SI(REG_3[7]), .SE(n373), .CK(CLK), 
        .RN(n345), .Q(\REG[4][0] ) );
  SDFFRQX2M \REG_reg[0][7]  ( .D(n193), .SI(REG_0[6]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG_0[7]) );
  SDFFRQX2M \REG_reg[0][6]  ( .D(n192), .SI(REG_0[5]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG_0[6]) );
  SDFFRQX2M \REG_reg[0][5]  ( .D(n191), .SI(REG_0[4]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG_0[5]) );
  SDFFRQX2M \REG_reg[0][4]  ( .D(n190), .SI(REG_0[3]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(REG_0[4]) );
  SDFFRQX2M \REG_reg[0][3]  ( .D(n189), .SI(REG_0[2]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG_0[3]) );
  SDFFRQX2M \REG_reg[0][2]  ( .D(n188), .SI(REG_0[1]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG_0[2]) );
  SDFFRQX2M \RD_DATA_reg[7]  ( .D(n184), .SI(RD_DATA[6]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(RD_DATA[7]) );
  SDFFRQX2M \RD_DATA_reg[6]  ( .D(n183), .SI(RD_DATA[5]), .SE(n373), .CK(CLK), 
        .RN(n342), .Q(RD_DATA[6]) );
  SDFFRQX2M \RD_DATA_reg[5]  ( .D(n182), .SI(RD_DATA[4]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(RD_DATA[5]) );
  SDFFRQX2M \RD_DATA_reg[4]  ( .D(n181), .SI(RD_DATA[3]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(RD_DATA[4]) );
  SDFFRQX2M \RD_DATA_reg[3]  ( .D(n180), .SI(RD_DATA[2]), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(RD_DATA[3]) );
  SDFFRQX2M \RD_DATA_reg[2]  ( .D(n179), .SI(RD_DATA[1]), .SE(n373), .CK(CLK), 
        .RN(n342), .Q(RD_DATA[2]) );
  SDFFRQX2M \RD_DATA_reg[1]  ( .D(n178), .SI(RD_DATA[0]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(RD_DATA[1]) );
  SDFFRQX2M \RD_DATA_reg[0]  ( .D(n177), .SI(RD_DATA_VALID), .SE(n371), .CK(
        CLK), .RN(n346), .Q(RD_DATA[0]) );
  SDFFRQX2M \REG_reg[2][1]  ( .D(n203), .SI(REG_2[0]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG_2[1]) );
  SDFFRQX2M \REG_reg[3][0]  ( .D(n210), .SI(REG_2[7]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG_3[0]) );
  SDFFRQX2M \REG_reg[1][5]  ( .D(n199), .SI(REG_1[4]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG_1[5]) );
  SDFFRQX2M \REG_reg[1][4]  ( .D(n198), .SI(REG_1[3]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG_1[4]) );
  SDFFRQX2M \REG_reg[1][3]  ( .D(n197), .SI(REG_1[2]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG_1[3]) );
  SDFFRQX2M \REG_reg[1][2]  ( .D(n196), .SI(REG_1[1]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(REG_1[2]) );
  SDFFRQX2M \REG_reg[1][1]  ( .D(n195), .SI(REG_1[0]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG_1[1]) );
  SDFFRQX2M \REG_reg[1][7]  ( .D(n201), .SI(REG_1[6]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG_1[7]) );
  SDFFRQX2M \REG_reg[1][6]  ( .D(n200), .SI(REG_1[5]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG_1[6]) );
  SDFFRQX2M \REG_reg[1][0]  ( .D(n194), .SI(REG_0[7]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(REG_1[0]) );
  SDFFRQX2M \REG_reg[0][1]  ( .D(n187), .SI(REG_0[0]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(REG_0[1]) );
  SDFFSQX2M \REG_reg[2][0]  ( .D(n202), .SI(REG_1[7]), .SE(test_se), .CK(CLK), 
        .SN(n342), .Q(REG_2[0]) );
  SDFFRQX2M RD_DATA_VALID_reg ( .D(n185), .SI(test_si1), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(RD_DATA_VALID) );
  SDFFRQX2M \REG_reg[3][7]  ( .D(n217), .SI(REG_3[6]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG_3[7]) );
  SDFFRQX2M \REG_reg[3][6]  ( .D(n216), .SI(REG_3[5]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG_3[6]) );
  SDFFRQX2M \REG_reg[3][3]  ( .D(n213), .SI(REG_3[2]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG_3[3]) );
  SDFFRQX2M \REG_reg[3][2]  ( .D(n212), .SI(REG_3[1]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG_3[2]) );
  SDFFSQX2M \REG_reg[3][5]  ( .D(n215), .SI(REG_3[4]), .SE(n370), .CK(CLK), 
        .SN(n342), .Q(REG_3[5]) );
  SDFFRQX2M \REG_reg[3][4]  ( .D(n214), .SI(REG_3[3]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG_3[4]) );
  SDFFRQX2M \REG_reg[3][1]  ( .D(n211), .SI(REG_3[0]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG_3[1]) );
  SDFFRQX2M \REG_reg[2][4]  ( .D(n206), .SI(REG_2[3]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG_2[4]) );
  SDFFRQX2M \REG_reg[2][2]  ( .D(n204), .SI(REG_2[1]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG_2[2]) );
  SDFFSQX2M \REG_reg[2][7]  ( .D(n209), .SI(REG_2[6]), .SE(n373), .CK(CLK), 
        .SN(n342), .Q(REG_2[7]) );
  SDFFRQX2M \REG_reg[2][5]  ( .D(n207), .SI(REG_2[4]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG_2[5]) );
  SDFFRQX2M \REG_reg[2][6]  ( .D(n208), .SI(REG_2[5]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG_2[6]) );
  SDFFRQX2M \REG_reg[2][3]  ( .D(n205), .SI(test_si2), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG_2[3]) );
  SDFFRQX2M \REG_reg[0][0]  ( .D(n186), .SI(RD_DATA[7]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(REG_0[0]) );
  NOR2BX2M U140 ( .AN(n175), .B(n340), .Y(n169) );
  NOR2BX2M U141 ( .AN(n164), .B(n340), .Y(n155) );
  NOR2BX2M U142 ( .AN(N13), .B(N12), .Y(n160) );
  NOR2BX2M U143 ( .AN(N13), .B(n341), .Y(n163) );
  NOR2X2M U144 ( .A(n341), .B(N13), .Y(n157) );
  NOR2X2M U145 ( .A(N12), .B(N13), .Y(n152) );
  INVX2M U146 ( .A(n337), .Y(n338) );
  INVX2M U147 ( .A(n335), .Y(n336) );
  INVX2M U148 ( .A(n337), .Y(n339) );
  BUFX2M U149 ( .A(n340), .Y(n337) );
  INVX2M U150 ( .A(n149), .Y(n361) );
  BUFX2M U151 ( .A(n341), .Y(n335) );
  NOR2BX2M U152 ( .AN(n164), .B(N11), .Y(n153) );
  NOR2BX2M U153 ( .AN(n175), .B(N11), .Y(n167) );
  NAND2X2M U154 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U155 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U156 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U157 ( .A(n169), .B(n157), .Y(n171) );
  NAND2X2M U158 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U159 ( .A(n157), .B(n155), .Y(n158) );
  NAND2X2M U160 ( .A(n167), .B(n160), .Y(n172) );
  NAND2X2M U161 ( .A(n169), .B(n160), .Y(n173) );
  NAND2X2M U162 ( .A(n167), .B(n163), .Y(n174) );
  NAND2X2M U163 ( .A(n169), .B(n163), .Y(n176) );
  NOR2BX2M U164 ( .AN(WR_EN), .B(RD_EN), .Y(n150) );
  NAND2X2M U165 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U166 ( .A(n160), .B(n153), .Y(n159) );
  NAND2X2M U167 ( .A(n160), .B(n155), .Y(n161) );
  NAND2X2M U168 ( .A(n163), .B(n153), .Y(n162) );
  NAND2X2M U169 ( .A(n163), .B(n155), .Y(n165) );
  NAND2X2M U170 ( .A(n152), .B(n153), .Y(n151) );
  NAND2BX2M U171 ( .AN(WR_EN), .B(RD_EN), .Y(n149) );
  BUFX2M U172 ( .A(n356), .Y(n343) );
  BUFX2M U173 ( .A(n355), .Y(n344) );
  BUFX2M U174 ( .A(n355), .Y(n345) );
  BUFX2M U175 ( .A(n354), .Y(n346) );
  BUFX2M U176 ( .A(n354), .Y(n347) );
  BUFX2M U177 ( .A(n353), .Y(n348) );
  BUFX2M U178 ( .A(n353), .Y(n349) );
  BUFX2M U179 ( .A(n352), .Y(n350) );
  BUFX2M U180 ( .A(n356), .Y(n342) );
  BUFX2M U181 ( .A(n352), .Y(n351) );
  NOR2BX2M U182 ( .AN(n150), .B(N14), .Y(n164) );
  AND2X2M U183 ( .A(N14), .B(n150), .Y(n175) );
  INVX2M U184 ( .A(WR_DATA[0]), .Y(n357) );
  INVX2M U185 ( .A(WR_DATA[1]), .Y(n358) );
  INVX2M U186 ( .A(WR_DATA[2]), .Y(n359) );
  INVX2M U187 ( .A(WR_DATA[3]), .Y(n360) );
  INVX2M U188 ( .A(WR_DATA[5]), .Y(n364) );
  INVX2M U189 ( .A(WR_DATA[4]), .Y(n365) );
  INVX2M U190 ( .A(WR_DATA[7]), .Y(n362) );
  BUFX2M U191 ( .A(RST), .Y(n355) );
  BUFX2M U192 ( .A(RST), .Y(n354) );
  BUFX2M U193 ( .A(RST), .Y(n353) );
  BUFX2M U194 ( .A(RST), .Y(n352) );
  BUFX2M U195 ( .A(RST), .Y(n356) );
  OAI2BB2X1M U196 ( .B0(n357), .B1(n166), .A0N(\REG[8][0] ), .A1N(n166), .Y(
        n250) );
  OAI2BB2X1M U197 ( .B0(n358), .B1(n166), .A0N(\REG[8][1] ), .A1N(n166), .Y(
        n251) );
  OAI2BB2X1M U198 ( .B0(n359), .B1(n166), .A0N(\REG[8][2] ), .A1N(n166), .Y(
        n252) );
  OAI2BB2X1M U199 ( .B0(n360), .B1(n166), .A0N(\REG[8][3] ), .A1N(n166), .Y(
        n253) );
  OAI2BB2X1M U200 ( .B0(n365), .B1(n166), .A0N(\REG[8][4] ), .A1N(n166), .Y(
        n254) );
  OAI2BB2X1M U201 ( .B0(n364), .B1(n166), .A0N(\REG[8][5] ), .A1N(n166), .Y(
        n255) );
  OAI2BB2X1M U202 ( .B0(n363), .B1(n166), .A0N(\REG[8][6] ), .A1N(n166), .Y(
        n256) );
  OAI2BB2X1M U203 ( .B0(n362), .B1(n166), .A0N(\REG[8][7] ), .A1N(n166), .Y(
        n257) );
  OAI2BB2X1M U204 ( .B0(n357), .B1(n168), .A0N(\REG[9][0] ), .A1N(n168), .Y(
        n258) );
  OAI2BB2X1M U205 ( .B0(n358), .B1(n168), .A0N(\REG[9][1] ), .A1N(n168), .Y(
        n259) );
  OAI2BB2X1M U206 ( .B0(n359), .B1(n168), .A0N(\REG[9][2] ), .A1N(n168), .Y(
        n260) );
  OAI2BB2X1M U207 ( .B0(n360), .B1(n168), .A0N(\REG[9][3] ), .A1N(n168), .Y(
        n261) );
  OAI2BB2X1M U208 ( .B0(n365), .B1(n168), .A0N(\REG[9][4] ), .A1N(n168), .Y(
        n262) );
  OAI2BB2X1M U209 ( .B0(n364), .B1(n168), .A0N(\REG[9][5] ), .A1N(n168), .Y(
        n263) );
  OAI2BB2X1M U210 ( .B0(n363), .B1(n168), .A0N(\REG[9][6] ), .A1N(n168), .Y(
        n264) );
  OAI2BB2X1M U211 ( .B0(n362), .B1(n168), .A0N(\REG[9][7] ), .A1N(n168), .Y(
        n265) );
  OAI2BB2X1M U212 ( .B0(n357), .B1(n170), .A0N(\REG[10][0] ), .A1N(n170), .Y(
        n266) );
  OAI2BB2X1M U213 ( .B0(n358), .B1(n170), .A0N(\REG[10][1] ), .A1N(n170), .Y(
        n267) );
  OAI2BB2X1M U214 ( .B0(n359), .B1(n170), .A0N(\REG[10][2] ), .A1N(n170), .Y(
        n268) );
  OAI2BB2X1M U215 ( .B0(n360), .B1(n170), .A0N(\REG[10][3] ), .A1N(n170), .Y(
        n269) );
  OAI2BB2X1M U216 ( .B0(n365), .B1(n170), .A0N(\REG[10][4] ), .A1N(n170), .Y(
        n270) );
  OAI2BB2X1M U217 ( .B0(n364), .B1(n170), .A0N(\REG[10][5] ), .A1N(n170), .Y(
        n271) );
  OAI2BB2X1M U218 ( .B0(n363), .B1(n170), .A0N(\REG[10][6] ), .A1N(n170), .Y(
        n272) );
  OAI2BB2X1M U219 ( .B0(n362), .B1(n170), .A0N(\REG[10][7] ), .A1N(n170), .Y(
        n273) );
  OAI2BB2X1M U220 ( .B0(n357), .B1(n171), .A0N(\REG[11][0] ), .A1N(n171), .Y(
        n274) );
  OAI2BB2X1M U221 ( .B0(n358), .B1(n171), .A0N(\REG[11][1] ), .A1N(n171), .Y(
        n275) );
  OAI2BB2X1M U222 ( .B0(n359), .B1(n171), .A0N(\REG[11][2] ), .A1N(n171), .Y(
        n276) );
  OAI2BB2X1M U223 ( .B0(n360), .B1(n171), .A0N(\REG[11][3] ), .A1N(n171), .Y(
        n277) );
  OAI2BB2X1M U224 ( .B0(n365), .B1(n171), .A0N(\REG[11][4] ), .A1N(n171), .Y(
        n278) );
  OAI2BB2X1M U225 ( .B0(n364), .B1(n171), .A0N(\REG[11][5] ), .A1N(n171), .Y(
        n279) );
  OAI2BB2X1M U226 ( .B0(n363), .B1(n171), .A0N(\REG[11][6] ), .A1N(n171), .Y(
        n280) );
  OAI2BB2X1M U227 ( .B0(n362), .B1(n171), .A0N(\REG[11][7] ), .A1N(n171), .Y(
        n281) );
  OAI2BB2X1M U228 ( .B0(n357), .B1(n172), .A0N(\REG[12][0] ), .A1N(n172), .Y(
        n282) );
  OAI2BB2X1M U229 ( .B0(n358), .B1(n172), .A0N(\REG[12][1] ), .A1N(n172), .Y(
        n283) );
  OAI2BB2X1M U230 ( .B0(n359), .B1(n172), .A0N(\REG[12][2] ), .A1N(n172), .Y(
        n284) );
  OAI2BB2X1M U231 ( .B0(n360), .B1(n172), .A0N(\REG[12][3] ), .A1N(n172), .Y(
        n285) );
  OAI2BB2X1M U232 ( .B0(n365), .B1(n172), .A0N(\REG[12][4] ), .A1N(n172), .Y(
        n286) );
  OAI2BB2X1M U233 ( .B0(n364), .B1(n172), .A0N(\REG[12][5] ), .A1N(n172), .Y(
        n287) );
  OAI2BB2X1M U234 ( .B0(n363), .B1(n172), .A0N(\REG[12][6] ), .A1N(n172), .Y(
        n288) );
  OAI2BB2X1M U235 ( .B0(n362), .B1(n172), .A0N(\REG[12][7] ), .A1N(n172), .Y(
        n289) );
  OAI2BB2X1M U236 ( .B0(n357), .B1(n173), .A0N(\REG[13][0] ), .A1N(n173), .Y(
        n290) );
  OAI2BB2X1M U237 ( .B0(n358), .B1(n173), .A0N(\REG[13][1] ), .A1N(n173), .Y(
        n291) );
  OAI2BB2X1M U238 ( .B0(n359), .B1(n173), .A0N(\REG[13][2] ), .A1N(n173), .Y(
        n292) );
  OAI2BB2X1M U239 ( .B0(n360), .B1(n173), .A0N(\REG[13][3] ), .A1N(n173), .Y(
        n293) );
  OAI2BB2X1M U240 ( .B0(n365), .B1(n173), .A0N(\REG[13][4] ), .A1N(n173), .Y(
        n294) );
  OAI2BB2X1M U241 ( .B0(n364), .B1(n173), .A0N(\REG[13][5] ), .A1N(n173), .Y(
        n295) );
  OAI2BB2X1M U242 ( .B0(n363), .B1(n173), .A0N(\REG[13][6] ), .A1N(n173), .Y(
        n296) );
  OAI2BB2X1M U243 ( .B0(n362), .B1(n173), .A0N(\REG[13][7] ), .A1N(n173), .Y(
        n297) );
  OAI2BB2X1M U244 ( .B0(n357), .B1(n174), .A0N(\REG[14][0] ), .A1N(n174), .Y(
        n298) );
  OAI2BB2X1M U245 ( .B0(n358), .B1(n174), .A0N(\REG[14][1] ), .A1N(n174), .Y(
        n299) );
  OAI2BB2X1M U246 ( .B0(n359), .B1(n174), .A0N(\REG[14][2] ), .A1N(n174), .Y(
        n300) );
  OAI2BB2X1M U247 ( .B0(n360), .B1(n174), .A0N(\REG[14][3] ), .A1N(n174), .Y(
        n301) );
  OAI2BB2X1M U248 ( .B0(n365), .B1(n174), .A0N(\REG[14][4] ), .A1N(n174), .Y(
        n302) );
  OAI2BB2X1M U249 ( .B0(n364), .B1(n174), .A0N(\REG[14][5] ), .A1N(n174), .Y(
        n303) );
  OAI2BB2X1M U250 ( .B0(n363), .B1(n174), .A0N(\REG[14][6] ), .A1N(n174), .Y(
        n304) );
  OAI2BB2X1M U251 ( .B0(n362), .B1(n174), .A0N(\REG[14][7] ), .A1N(n174), .Y(
        n305) );
  OAI2BB2X1M U252 ( .B0(n357), .B1(n176), .A0N(\REG[15][0] ), .A1N(n176), .Y(
        n306) );
  OAI2BB2X1M U253 ( .B0(n358), .B1(n176), .A0N(\REG[15][1] ), .A1N(n176), .Y(
        n307) );
  OAI2BB2X1M U254 ( .B0(n359), .B1(n176), .A0N(\REG[15][2] ), .A1N(n176), .Y(
        n308) );
  OAI2BB2X1M U255 ( .B0(n360), .B1(n176), .A0N(\REG[15][3] ), .A1N(n176), .Y(
        n309) );
  OAI2BB2X1M U256 ( .B0(n365), .B1(n176), .A0N(\REG[15][4] ), .A1N(n176), .Y(
        n310) );
  OAI2BB2X1M U257 ( .B0(n364), .B1(n176), .A0N(\REG[15][5] ), .A1N(n176), .Y(
        n311) );
  OAI2BB2X1M U258 ( .B0(n363), .B1(n176), .A0N(\REG[15][6] ), .A1N(n176), .Y(
        n312) );
  OAI2BB2X1M U259 ( .B0(n362), .B1(n176), .A0N(\REG[15][7] ), .A1N(n176), .Y(
        n313) );
  OAI2BB2X1M U260 ( .B0(n357), .B1(n156), .A0N(REG_2[0]), .A1N(n156), .Y(n202)
         );
  OAI2BB2X1M U261 ( .B0(n362), .B1(n156), .A0N(REG_2[7]), .A1N(n156), .Y(n209)
         );
  OAI2BB2X1M U262 ( .B0(n364), .B1(n158), .A0N(REG_3[5]), .A1N(n158), .Y(n215)
         );
  AO22X1M U263 ( .A0(N43), .A1(n361), .B0(RD_DATA[0]), .B1(n149), .Y(n177) );
  MX4X1M U264 ( .A(n141), .B(n139), .C(n140), .D(n138), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U265 ( .A(REG_0[0]), .B(REG_1[0]), .C(REG_2[0]), .D(REG_3[0]), .S0(
        N11), .S1(N12), .Y(n141) );
  MX4X1M U266 ( .A(\REG[8][0] ), .B(\REG[9][0] ), .C(\REG[10][0] ), .D(
        \REG[11][0] ), .S0(N11), .S1(N12), .Y(n139) );
  AO22X1M U267 ( .A0(N42), .A1(n361), .B0(RD_DATA[1]), .B1(n149), .Y(n178) );
  MX4X1M U268 ( .A(n145), .B(n143), .C(n144), .D(n142), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U269 ( .A(\REG[8][1] ), .B(\REG[9][1] ), .C(\REG[10][1] ), .D(
        \REG[11][1] ), .S0(N11), .S1(N12), .Y(n143) );
  MX4X1M U270 ( .A(\REG[12][1] ), .B(\REG[13][1] ), .C(\REG[14][1] ), .D(
        \REG[15][1] ), .S0(n339), .S1(n336), .Y(n142) );
  AO22X1M U271 ( .A0(N41), .A1(n361), .B0(RD_DATA[2]), .B1(n149), .Y(n179) );
  MX4X1M U272 ( .A(n314), .B(n147), .C(n148), .D(n146), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U273 ( .A(REG_0[2]), .B(REG_1[2]), .C(REG_2[2]), .D(REG_3[2]), .S0(
        n338), .S1(n336), .Y(n314) );
  MX4X1M U274 ( .A(\REG[8][2] ), .B(\REG[9][2] ), .C(\REG[10][2] ), .D(
        \REG[11][2] ), .S0(n338), .S1(n336), .Y(n147) );
  AO22X1M U275 ( .A0(N40), .A1(n361), .B0(RD_DATA[3]), .B1(n149), .Y(n180) );
  MX4X1M U276 ( .A(n318), .B(n316), .C(n317), .D(n315), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U277 ( .A(REG_0[3]), .B(REG_1[3]), .C(REG_2[3]), .D(REG_3[3]), .S0(
        n338), .S1(n336), .Y(n318) );
  MX4X1M U278 ( .A(\REG[8][3] ), .B(\REG[9][3] ), .C(\REG[10][3] ), .D(
        \REG[11][3] ), .S0(n338), .S1(n336), .Y(n316) );
  AO22X1M U279 ( .A0(N39), .A1(n361), .B0(RD_DATA[4]), .B1(n149), .Y(n181) );
  MX4X1M U280 ( .A(n322), .B(n320), .C(n321), .D(n319), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U281 ( .A(REG_0[4]), .B(REG_1[4]), .C(REG_2[4]), .D(REG_3[4]), .S0(
        n339), .S1(n336), .Y(n322) );
  MX4X1M U282 ( .A(\REG[8][4] ), .B(\REG[9][4] ), .C(\REG[10][4] ), .D(
        \REG[11][4] ), .S0(n338), .S1(n336), .Y(n320) );
  AO22X1M U283 ( .A0(N38), .A1(n361), .B0(RD_DATA[5]), .B1(n149), .Y(n182) );
  MX4X1M U284 ( .A(n326), .B(n324), .C(n325), .D(n323), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U285 ( .A(REG_0[5]), .B(REG_1[5]), .C(REG_2[5]), .D(REG_3[5]), .S0(
        n339), .S1(N12), .Y(n326) );
  MX4X1M U286 ( .A(\REG[8][5] ), .B(\REG[9][5] ), .C(\REG[10][5] ), .D(
        \REG[11][5] ), .S0(n339), .S1(N12), .Y(n324) );
  AO22X1M U287 ( .A0(N37), .A1(n361), .B0(RD_DATA[6]), .B1(n149), .Y(n183) );
  MX4X1M U288 ( .A(n330), .B(n328), .C(n329), .D(n327), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U289 ( .A(REG_0[6]), .B(REG_1[6]), .C(REG_2[6]), .D(REG_3[6]), .S0(
        n339), .S1(N12), .Y(n330) );
  MX4X1M U290 ( .A(\REG[8][6] ), .B(\REG[9][6] ), .C(\REG[10][6] ), .D(
        \REG[11][6] ), .S0(n339), .S1(N12), .Y(n328) );
  AO22X1M U291 ( .A0(N36), .A1(n361), .B0(RD_DATA[7]), .B1(n149), .Y(n184) );
  MX4X1M U292 ( .A(n334), .B(n332), .C(n333), .D(n331), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U293 ( .A(REG_0[7]), .B(REG_1[7]), .C(REG_2[7]), .D(REG_3[7]), .S0(
        n339), .S1(N12), .Y(n334) );
  MX4X1M U294 ( .A(\REG[8][7] ), .B(\REG[9][7] ), .C(\REG[10][7] ), .D(
        \REG[11][7] ), .S0(n339), .S1(N12), .Y(n332) );
  MX4X1M U295 ( .A(REG_0[1]), .B(REG_1[1]), .C(REG_2[1]), .D(REG_3[1]), .S0(
        n338), .S1(N12), .Y(n145) );
  MX4X1M U296 ( .A(\REG[4][0] ), .B(\REG[5][0] ), .C(\REG[6][0] ), .D(
        \REG[7][0] ), .S0(N11), .S1(N12), .Y(n140) );
  MX4X1M U297 ( .A(\REG[4][1] ), .B(\REG[5][1] ), .C(\REG[6][1] ), .D(
        \REG[7][1] ), .S0(n338), .S1(N12), .Y(n144) );
  MX4X1M U298 ( .A(\REG[4][2] ), .B(\REG[5][2] ), .C(\REG[6][2] ), .D(
        \REG[7][2] ), .S0(n338), .S1(n336), .Y(n148) );
  MX4X1M U299 ( .A(\REG[4][3] ), .B(\REG[5][3] ), .C(\REG[6][3] ), .D(
        \REG[7][3] ), .S0(n338), .S1(n336), .Y(n317) );
  MX4X1M U300 ( .A(\REG[4][4] ), .B(\REG[5][4] ), .C(\REG[6][4] ), .D(
        \REG[7][4] ), .S0(n338), .S1(n336), .Y(n321) );
  MX4X1M U301 ( .A(\REG[4][5] ), .B(\REG[5][5] ), .C(\REG[6][5] ), .D(
        \REG[7][5] ), .S0(n339), .S1(N12), .Y(n325) );
  MX4X1M U302 ( .A(\REG[4][6] ), .B(\REG[5][6] ), .C(\REG[6][6] ), .D(
        \REG[7][6] ), .S0(n339), .S1(N12), .Y(n329) );
  MX4X1M U303 ( .A(\REG[4][7] ), .B(\REG[5][7] ), .C(\REG[6][7] ), .D(
        \REG[7][7] ), .S0(n339), .S1(N12), .Y(n333) );
  MX4X1M U304 ( .A(\REG[12][0] ), .B(\REG[13][0] ), .C(\REG[14][0] ), .D(
        \REG[15][0] ), .S0(n338), .S1(n336), .Y(n138) );
  MX4X1M U305 ( .A(\REG[12][2] ), .B(\REG[13][2] ), .C(\REG[14][2] ), .D(
        \REG[15][2] ), .S0(n338), .S1(n336), .Y(n146) );
  MX4X1M U306 ( .A(\REG[12][3] ), .B(\REG[13][3] ), .C(\REG[14][3] ), .D(
        \REG[15][3] ), .S0(n338), .S1(n336), .Y(n315) );
  MX4X1M U307 ( .A(\REG[12][4] ), .B(\REG[13][4] ), .C(\REG[14][4] ), .D(
        \REG[15][4] ), .S0(n338), .S1(n336), .Y(n319) );
  MX4X1M U308 ( .A(\REG[12][5] ), .B(\REG[13][5] ), .C(\REG[14][5] ), .D(
        \REG[15][5] ), .S0(n339), .S1(N12), .Y(n323) );
  MX4X1M U309 ( .A(\REG[12][6] ), .B(\REG[13][6] ), .C(\REG[14][6] ), .D(
        \REG[15][6] ), .S0(n339), .S1(N12), .Y(n327) );
  MX4X1M U310 ( .A(\REG[12][7] ), .B(\REG[13][7] ), .C(\REG[14][7] ), .D(
        \REG[15][7] ), .S0(n339), .S1(N12), .Y(n331) );
  INVX2M U311 ( .A(N11), .Y(n340) );
  INVX2M U312 ( .A(WR_DATA[6]), .Y(n363) );
  OAI2BB2X1M U313 ( .B0(n151), .B1(n357), .A0N(REG_0[0]), .A1N(n151), .Y(n186)
         );
  OAI2BB2X1M U314 ( .B0(n151), .B1(n358), .A0N(REG_0[1]), .A1N(n151), .Y(n187)
         );
  OAI2BB2X1M U315 ( .B0(n151), .B1(n359), .A0N(REG_0[2]), .A1N(n151), .Y(n188)
         );
  OAI2BB2X1M U316 ( .B0(n151), .B1(n360), .A0N(REG_0[3]), .A1N(n151), .Y(n189)
         );
  OAI2BB2X1M U317 ( .B0(n151), .B1(n365), .A0N(REG_0[4]), .A1N(n151), .Y(n190)
         );
  OAI2BB2X1M U318 ( .B0(n151), .B1(n364), .A0N(REG_0[5]), .A1N(n151), .Y(n191)
         );
  OAI2BB2X1M U319 ( .B0(n151), .B1(n363), .A0N(REG_0[6]), .A1N(n151), .Y(n192)
         );
  OAI2BB2X1M U320 ( .B0(n151), .B1(n362), .A0N(REG_0[7]), .A1N(n151), .Y(n193)
         );
  OAI2BB2X1M U321 ( .B0(n357), .B1(n154), .A0N(REG_1[0]), .A1N(n154), .Y(n194)
         );
  OAI2BB2X1M U322 ( .B0(n358), .B1(n154), .A0N(REG_1[1]), .A1N(n154), .Y(n195)
         );
  OAI2BB2X1M U323 ( .B0(n359), .B1(n154), .A0N(REG_1[2]), .A1N(n154), .Y(n196)
         );
  OAI2BB2X1M U324 ( .B0(n360), .B1(n154), .A0N(REG_1[3]), .A1N(n154), .Y(n197)
         );
  OAI2BB2X1M U325 ( .B0(n365), .B1(n154), .A0N(REG_1[4]), .A1N(n154), .Y(n198)
         );
  OAI2BB2X1M U326 ( .B0(n364), .B1(n154), .A0N(REG_1[5]), .A1N(n154), .Y(n199)
         );
  OAI2BB2X1M U327 ( .B0(n363), .B1(n154), .A0N(REG_1[6]), .A1N(n154), .Y(n200)
         );
  OAI2BB2X1M U328 ( .B0(n362), .B1(n154), .A0N(REG_1[7]), .A1N(n154), .Y(n201)
         );
  OAI2BB2X1M U329 ( .B0(n357), .B1(n159), .A0N(\REG[4][0] ), .A1N(n159), .Y(
        n218) );
  OAI2BB2X1M U330 ( .B0(n358), .B1(n159), .A0N(\REG[4][1] ), .A1N(n159), .Y(
        n219) );
  OAI2BB2X1M U331 ( .B0(n359), .B1(n159), .A0N(\REG[4][2] ), .A1N(n159), .Y(
        n220) );
  OAI2BB2X1M U332 ( .B0(n360), .B1(n159), .A0N(\REG[4][3] ), .A1N(n159), .Y(
        n221) );
  OAI2BB2X1M U333 ( .B0(n365), .B1(n159), .A0N(\REG[4][4] ), .A1N(n159), .Y(
        n222) );
  OAI2BB2X1M U334 ( .B0(n364), .B1(n159), .A0N(\REG[4][5] ), .A1N(n159), .Y(
        n223) );
  OAI2BB2X1M U335 ( .B0(n363), .B1(n159), .A0N(\REG[4][6] ), .A1N(n159), .Y(
        n224) );
  OAI2BB2X1M U336 ( .B0(n362), .B1(n159), .A0N(\REG[4][7] ), .A1N(n159), .Y(
        n225) );
  OAI2BB2X1M U337 ( .B0(n357), .B1(n161), .A0N(\REG[5][0] ), .A1N(n161), .Y(
        n226) );
  OAI2BB2X1M U338 ( .B0(n358), .B1(n161), .A0N(\REG[5][1] ), .A1N(n161), .Y(
        n227) );
  OAI2BB2X1M U339 ( .B0(n359), .B1(n161), .A0N(\REG[5][2] ), .A1N(n161), .Y(
        n228) );
  OAI2BB2X1M U340 ( .B0(n360), .B1(n161), .A0N(\REG[5][3] ), .A1N(n161), .Y(
        n229) );
  OAI2BB2X1M U341 ( .B0(n365), .B1(n161), .A0N(\REG[5][4] ), .A1N(n161), .Y(
        n230) );
  OAI2BB2X1M U342 ( .B0(n364), .B1(n161), .A0N(\REG[5][5] ), .A1N(n161), .Y(
        n231) );
  OAI2BB2X1M U343 ( .B0(n363), .B1(n161), .A0N(\REG[5][6] ), .A1N(n161), .Y(
        n232) );
  OAI2BB2X1M U344 ( .B0(n362), .B1(n161), .A0N(\REG[5][7] ), .A1N(n161), .Y(
        n233) );
  OAI2BB2X1M U345 ( .B0(n357), .B1(n162), .A0N(\REG[6][0] ), .A1N(n162), .Y(
        n234) );
  OAI2BB2X1M U346 ( .B0(n358), .B1(n162), .A0N(\REG[6][1] ), .A1N(n162), .Y(
        n235) );
  OAI2BB2X1M U347 ( .B0(n359), .B1(n162), .A0N(\REG[6][2] ), .A1N(n162), .Y(
        n236) );
  OAI2BB2X1M U348 ( .B0(n360), .B1(n162), .A0N(\REG[6][3] ), .A1N(n162), .Y(
        n237) );
  OAI2BB2X1M U349 ( .B0(n365), .B1(n162), .A0N(\REG[6][4] ), .A1N(n162), .Y(
        n238) );
  OAI2BB2X1M U350 ( .B0(n364), .B1(n162), .A0N(\REG[6][5] ), .A1N(n162), .Y(
        n239) );
  OAI2BB2X1M U351 ( .B0(n363), .B1(n162), .A0N(\REG[6][6] ), .A1N(n162), .Y(
        n240) );
  OAI2BB2X1M U352 ( .B0(n362), .B1(n162), .A0N(\REG[6][7] ), .A1N(n162), .Y(
        n241) );
  OAI2BB2X1M U353 ( .B0(n357), .B1(n165), .A0N(\REG[7][0] ), .A1N(n165), .Y(
        n242) );
  OAI2BB2X1M U354 ( .B0(n358), .B1(n165), .A0N(\REG[7][1] ), .A1N(n165), .Y(
        n243) );
  OAI2BB2X1M U355 ( .B0(n359), .B1(n165), .A0N(\REG[7][2] ), .A1N(n165), .Y(
        n244) );
  OAI2BB2X1M U356 ( .B0(n360), .B1(n165), .A0N(\REG[7][3] ), .A1N(n165), .Y(
        n245) );
  OAI2BB2X1M U357 ( .B0(n365), .B1(n165), .A0N(\REG[7][4] ), .A1N(n165), .Y(
        n246) );
  OAI2BB2X1M U358 ( .B0(n364), .B1(n165), .A0N(\REG[7][5] ), .A1N(n165), .Y(
        n247) );
  OAI2BB2X1M U359 ( .B0(n363), .B1(n165), .A0N(\REG[7][6] ), .A1N(n165), .Y(
        n248) );
  OAI2BB2X1M U360 ( .B0(n362), .B1(n165), .A0N(\REG[7][7] ), .A1N(n165), .Y(
        n249) );
  OAI2BB2X1M U361 ( .B0(n358), .B1(n156), .A0N(REG_2[1]), .A1N(n156), .Y(n203)
         );
  OAI2BB2X1M U362 ( .B0(n359), .B1(n156), .A0N(REG_2[2]), .A1N(n156), .Y(n204)
         );
  OAI2BB2X1M U363 ( .B0(n360), .B1(n156), .A0N(REG_2[3]), .A1N(n156), .Y(n205)
         );
  OAI2BB2X1M U364 ( .B0(n365), .B1(n156), .A0N(REG_2[4]), .A1N(n156), .Y(n206)
         );
  OAI2BB2X1M U365 ( .B0(n364), .B1(n156), .A0N(REG_2[5]), .A1N(n156), .Y(n207)
         );
  OAI2BB2X1M U366 ( .B0(n363), .B1(n156), .A0N(REG_2[6]), .A1N(n156), .Y(n208)
         );
  OAI2BB2X1M U367 ( .B0(n357), .B1(n158), .A0N(REG_3[0]), .A1N(n158), .Y(n210)
         );
  OAI2BB2X1M U368 ( .B0(n358), .B1(n158), .A0N(REG_3[1]), .A1N(n158), .Y(n211)
         );
  OAI2BB2X1M U369 ( .B0(n359), .B1(n158), .A0N(REG_3[2]), .A1N(n158), .Y(n212)
         );
  OAI2BB2X1M U370 ( .B0(n360), .B1(n158), .A0N(REG_3[3]), .A1N(n158), .Y(n213)
         );
  OAI2BB2X1M U371 ( .B0(n365), .B1(n158), .A0N(REG_3[4]), .A1N(n158), .Y(n214)
         );
  OAI2BB2X1M U372 ( .B0(n363), .B1(n158), .A0N(REG_3[6]), .A1N(n158), .Y(n216)
         );
  OAI2BB2X1M U373 ( .B0(n362), .B1(n158), .A0N(REG_3[7]), .A1N(n158), .Y(n217)
         );
  OAI2BB1X2M U374 ( .A0N(RD_DATA_VALID), .A1N(n150), .B0(n149), .Y(n185) );
  INVX2M U375 ( .A(N12), .Y(n341) );
  DLY1X1M U376 ( .A(test_se), .Y(n370) );
  DLY1X1M U377 ( .A(test_se), .Y(n371) );
  DLY1X1M U378 ( .A(test_se), .Y(n372) );
  DLY1X1M U379 ( .A(test_se), .Y(n373) );
endmodule


module CLK_GATE ( CLK, CLK_EN, GATED_CLK );
  input CLK, CLK_EN;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n3) );
  INVX2M U11 ( .A(n18), .Y(n2) );
  NAND2X2M U12 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n5) );
  INVX2M U14 ( .A(n18), .Y(n4) );
  NAND2X2M U15 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  INVX2M U17 ( .A(n18), .Y(n6) );
  NAND2X2M U18 ( .A(n2), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U19 ( .A(a[2]), .Y(n8) );
  NAND2X2M U20 ( .A(n6), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U21 ( .A(a[6]), .Y(n1) );
  XNOR2X2M U22 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U23 ( .A(b[1]), .Y(n17) );
  INVX2M U24 ( .A(b[2]), .Y(n16) );
  INVX2M U25 ( .A(b[3]), .Y(n15) );
  INVX2M U26 ( .A(b[4]), .Y(n14) );
  INVX2M U27 ( .A(b[5]), .Y(n13) );
  INVX2M U28 ( .A(a[0]), .Y(n10) );
  INVX2M U29 ( .A(b[6]), .Y(n12) );
  NAND2X2M U30 ( .A(n4), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U31 ( .A(a[1]), .Y(n9) );
  NAND2X2M U32 ( .A(n2), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
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
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(A[0]), .Y(n1) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[6]), .Y(n3) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(B[1]), .Y(n8) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U5 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  INVX2M U7 ( .A(n9), .Y(SUM[6]) );
  INVX2M U8 ( .A(A[6]), .Y(n9) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
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
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;

  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKXOR2X2M U10 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U18 ( .A(\ab[0][7] ), .Y(n22) );
  INVX2M U19 ( .A(\ab[0][6] ), .Y(n21) );
  INVX2M U20 ( .A(\ab[0][5] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][4] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][3] ), .Y(n18) );
  INVX2M U23 ( .A(\ab[0][2] ), .Y(n17) );
  AND2X2M U24 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U25 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U27 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U29 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U30 ( .A(\ab[1][6] ), .B(n22), .Y(\SUMB[1][6] ) );
  XNOR2X2M U31 ( .A(\ab[1][5] ), .B(n21), .Y(\SUMB[1][5] ) );
  XNOR2X2M U32 ( .A(\ab[1][4] ), .B(n20), .Y(\SUMB[1][4] ) );
  XNOR2X2M U33 ( .A(\ab[1][3] ), .B(n19), .Y(\SUMB[1][3] ) );
  XNOR2X2M U34 ( .A(\ab[1][2] ), .B(n18), .Y(\SUMB[1][2] ) );
  XNOR2X2M U35 ( .A(\ab[1][1] ), .B(n17), .Y(\SUMB[1][1] ) );
  INVX2M U36 ( .A(A[7]), .Y(n31) );
  INVX2M U37 ( .A(A[2]), .Y(n36) );
  INVX2M U38 ( .A(A[3]), .Y(n35) );
  INVX2M U39 ( .A(A[4]), .Y(n34) );
  INVX2M U40 ( .A(A[5]), .Y(n33) );
  INVX2M U41 ( .A(A[6]), .Y(n32) );
  INVX2M U42 ( .A(A[0]), .Y(n38) );
  INVX2M U43 ( .A(A[1]), .Y(n37) );
  INVX2M U44 ( .A(B[0]), .Y(n30) );
  INVX2M U45 ( .A(B[6]), .Y(n24) );
  INVX2M U46 ( .A(B[7]), .Y(n23) );
  INVX2M U47 ( .A(B[2]), .Y(n28) );
  INVX2M U48 ( .A(B[1]), .Y(n29) );
  INVX2M U49 ( .A(B[3]), .Y(n27) );
  INVX2M U50 ( .A(B[4]), .Y(n26) );
  INVX2M U51 ( .A(B[5]), .Y(n25) );
  NOR2X1M U53 ( .A(n31), .B(n23), .Y(\ab[7][7] ) );
  NOR2X1M U54 ( .A(n31), .B(n24), .Y(\ab[7][6] ) );
  NOR2X1M U55 ( .A(n31), .B(n25), .Y(\ab[7][5] ) );
  NOR2X1M U56 ( .A(n31), .B(n26), .Y(\ab[7][4] ) );
  NOR2X1M U57 ( .A(n31), .B(n27), .Y(\ab[7][3] ) );
  NOR2X1M U58 ( .A(n31), .B(n28), .Y(\ab[7][2] ) );
  NOR2X1M U59 ( .A(n31), .B(n29), .Y(\ab[7][1] ) );
  NOR2X1M U60 ( .A(n31), .B(n30), .Y(\ab[7][0] ) );
  NOR2X1M U61 ( .A(n23), .B(n32), .Y(\ab[6][7] ) );
  NOR2X1M U62 ( .A(n24), .B(n32), .Y(\ab[6][6] ) );
  NOR2X1M U63 ( .A(n25), .B(n32), .Y(\ab[6][5] ) );
  NOR2X1M U64 ( .A(n26), .B(n32), .Y(\ab[6][4] ) );
  NOR2X1M U65 ( .A(n27), .B(n32), .Y(\ab[6][3] ) );
  NOR2X1M U66 ( .A(n28), .B(n32), .Y(\ab[6][2] ) );
  NOR2X1M U67 ( .A(n29), .B(n32), .Y(\ab[6][1] ) );
  NOR2X1M U68 ( .A(n30), .B(n32), .Y(\ab[6][0] ) );
  NOR2X1M U69 ( .A(n23), .B(n33), .Y(\ab[5][7] ) );
  NOR2X1M U70 ( .A(n24), .B(n33), .Y(\ab[5][6] ) );
  NOR2X1M U71 ( .A(n25), .B(n33), .Y(\ab[5][5] ) );
  NOR2X1M U72 ( .A(n26), .B(n33), .Y(\ab[5][4] ) );
  NOR2X1M U73 ( .A(n27), .B(n33), .Y(\ab[5][3] ) );
  NOR2X1M U74 ( .A(n28), .B(n33), .Y(\ab[5][2] ) );
  NOR2X1M U75 ( .A(n29), .B(n33), .Y(\ab[5][1] ) );
  NOR2X1M U76 ( .A(n30), .B(n33), .Y(\ab[5][0] ) );
  NOR2X1M U77 ( .A(n23), .B(n34), .Y(\ab[4][7] ) );
  NOR2X1M U78 ( .A(n24), .B(n34), .Y(\ab[4][6] ) );
  NOR2X1M U79 ( .A(n25), .B(n34), .Y(\ab[4][5] ) );
  NOR2X1M U80 ( .A(n26), .B(n34), .Y(\ab[4][4] ) );
  NOR2X1M U81 ( .A(n27), .B(n34), .Y(\ab[4][3] ) );
  NOR2X1M U82 ( .A(n28), .B(n34), .Y(\ab[4][2] ) );
  NOR2X1M U83 ( .A(n29), .B(n34), .Y(\ab[4][1] ) );
  NOR2X1M U84 ( .A(n30), .B(n34), .Y(\ab[4][0] ) );
  NOR2X1M U85 ( .A(n23), .B(n35), .Y(\ab[3][7] ) );
  NOR2X1M U86 ( .A(n24), .B(n35), .Y(\ab[3][6] ) );
  NOR2X1M U87 ( .A(n25), .B(n35), .Y(\ab[3][5] ) );
  NOR2X1M U88 ( .A(n26), .B(n35), .Y(\ab[3][4] ) );
  NOR2X1M U89 ( .A(n27), .B(n35), .Y(\ab[3][3] ) );
  NOR2X1M U90 ( .A(n28), .B(n35), .Y(\ab[3][2] ) );
  NOR2X1M U91 ( .A(n29), .B(n35), .Y(\ab[3][1] ) );
  NOR2X1M U92 ( .A(n30), .B(n35), .Y(\ab[3][0] ) );
  NOR2X1M U93 ( .A(n23), .B(n36), .Y(\ab[2][7] ) );
  NOR2X1M U94 ( .A(n24), .B(n36), .Y(\ab[2][6] ) );
  NOR2X1M U95 ( .A(n25), .B(n36), .Y(\ab[2][5] ) );
  NOR2X1M U96 ( .A(n26), .B(n36), .Y(\ab[2][4] ) );
  NOR2X1M U97 ( .A(n27), .B(n36), .Y(\ab[2][3] ) );
  NOR2X1M U98 ( .A(n28), .B(n36), .Y(\ab[2][2] ) );
  NOR2X1M U99 ( .A(n29), .B(n36), .Y(\ab[2][1] ) );
  NOR2X1M U100 ( .A(n30), .B(n36), .Y(\ab[2][0] ) );
  NOR2X1M U101 ( .A(n23), .B(n37), .Y(\ab[1][7] ) );
  NOR2X1M U102 ( .A(n24), .B(n37), .Y(\ab[1][6] ) );
  NOR2X1M U103 ( .A(n25), .B(n37), .Y(\ab[1][5] ) );
  NOR2X1M U104 ( .A(n26), .B(n37), .Y(\ab[1][4] ) );
  NOR2X1M U105 ( .A(n27), .B(n37), .Y(\ab[1][3] ) );
  NOR2X1M U106 ( .A(n28), .B(n37), .Y(\ab[1][2] ) );
  NOR2X1M U107 ( .A(n29), .B(n37), .Y(\ab[1][1] ) );
  NOR2X1M U108 ( .A(n30), .B(n37), .Y(\ab[1][0] ) );
  NOR2X1M U109 ( .A(n23), .B(n38), .Y(\ab[0][7] ) );
  NOR2X1M U110 ( .A(n24), .B(n38), .Y(\ab[0][6] ) );
  NOR2X1M U111 ( .A(n25), .B(n38), .Y(\ab[0][5] ) );
  NOR2X1M U112 ( .A(n26), .B(n38), .Y(\ab[0][4] ) );
  NOR2X1M U113 ( .A(n27), .B(n38), .Y(\ab[0][3] ) );
  NOR2X1M U114 ( .A(n28), .B(n38), .Y(\ab[0][2] ) );
  NOR2X1M U115 ( .A(n29), .B(n38), .Y(\ab[0][1] ) );
  NOR2X1M U116 ( .A(n30), .B(n38), .Y(PRODUCT[0]) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, 
        n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_OPERAND_WIDTH8_FUN_WIDTH4_test_1 ( CLK, RST, A, B, ALU_FUN, ALU_EN, 
        ALU_OUT, OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, ALU_EN, test_si, test_se;
  output OUT_VALID;
  wire   N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N129, N154, N155, N157, N158,
         N159, N160, N161, N162, N163, N164, N165, N166, N167, N168, N169,
         N170, N171, N172, N173, \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_4 ,
         \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 ,
         \U3/U2/Z_3 , \U3/U2/Z_4 , \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n147, n148,
         n149, n150, n151, n152, n153, n154;

  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(N172), .SI(ALU_OUT[14]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(N171), .SI(ALU_OUT[13]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(N170), .SI(ALU_OUT[12]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(N169), .SI(ALU_OUT[11]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(N168), .SI(ALU_OUT[10]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(N167), .SI(ALU_OUT[9]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(N166), .SI(ALU_OUT[8]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(N165), .SI(ALU_OUT[7]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(N164), .SI(ALU_OUT[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(N163), .SI(ALU_OUT[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(N162), .SI(ALU_OUT[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(N161), .SI(ALU_OUT[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(N160), .SI(ALU_OUT[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(N159), .SI(ALU_OUT[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(N158), .SI(ALU_OUT[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(N157), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX2M OUT_VALID_reg ( .D(N173), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  BUFX2M U8 ( .A(n68), .Y(n14) );
  NOR2BX2M U23 ( .AN(n69), .B(n70), .Y(n68) );
  NAND2X2M U24 ( .A(n75), .B(n142), .Y(n93) );
  INVX2M U25 ( .A(n80), .Y(n150) );
  INVX2M U26 ( .A(n81), .Y(n151) );
  BUFX2M U27 ( .A(n67), .Y(n13) );
  BUFX2M U28 ( .A(n67), .Y(n12) );
  INVX2M U29 ( .A(n79), .Y(n147) );
  INVX2M U30 ( .A(n132), .Y(n148) );
  OAI2BB1X2M U31 ( .A0N(n141), .A1N(n130), .B0(n142), .Y(n72) );
  NOR2X2M U32 ( .A(n154), .B(n149), .Y(n140) );
  AND2X2M U33 ( .A(n130), .B(n144), .Y(n82) );
  AND2X2M U34 ( .A(n143), .B(n131), .Y(n83) );
  NOR2X2M U35 ( .A(n153), .B(n152), .Y(n130) );
  AND2X2M U36 ( .A(n141), .B(n139), .Y(n77) );
  NAND2X2M U37 ( .A(n144), .B(n145), .Y(n81) );
  NAND2X2M U38 ( .A(n144), .B(n143), .Y(n80) );
  NAND2X2M U39 ( .A(n130), .B(n131), .Y(n86) );
  NAND2X2M U40 ( .A(n141), .B(n143), .Y(n79) );
  NAND2X2M U41 ( .A(n143), .B(n140), .Y(n142) );
  NAND2X2M U42 ( .A(n144), .B(n139), .Y(n75) );
  NAND2X2M U43 ( .A(n139), .B(n140), .Y(n132) );
  NAND4BBX1M U44 ( .AN(n71), .BN(n72), .C(n73), .D(n74), .Y(N173) );
  NOR3X2M U45 ( .A(n148), .B(n82), .C(n83), .Y(n73) );
  NOR4BX1M U46 ( .AN(n75), .B(n76), .C(n77), .D(n78), .Y(n74) );
  NAND3X2M U47 ( .A(n79), .B(n80), .C(n81), .Y(n76) );
  AND2X2M U48 ( .A(n141), .B(n145), .Y(n78) );
  NAND2X2M U49 ( .A(n139), .B(n131), .Y(n67) );
  NAND2X2M U50 ( .A(n145), .B(n140), .Y(n69) );
  AND2X2M U51 ( .A(n131), .B(n145), .Y(n70) );
  NOR2X2M U52 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n143) );
  NOR2X2M U53 ( .A(ALU_FUN[3]), .B(ALU_FUN[0]), .Y(n144) );
  NOR2X2M U54 ( .A(n153), .B(ALU_FUN[1]), .Y(n139) );
  NOR2X2M U55 ( .A(n152), .B(ALU_FUN[2]), .Y(n145) );
  NOR2X2M U56 ( .A(n154), .B(ALU_FUN[0]), .Y(n131) );
  INVX2M U57 ( .A(\U3/U2/Z_6 ), .Y(n50) );
  NOR2X2M U58 ( .A(n149), .B(ALU_FUN[3]), .Y(n141) );
  OAI2BB1X2M U59 ( .A0N(N115), .A1N(n151), .B0(n84), .Y(N166) );
  OAI2BB1X2M U60 ( .A0N(N116), .A1N(n151), .B0(n84), .Y(N167) );
  OAI2BB1X2M U61 ( .A0N(N117), .A1N(n151), .B0(n84), .Y(N168) );
  OAI2BB1X2M U62 ( .A0N(N118), .A1N(n151), .B0(n84), .Y(N169) );
  OAI2BB1X2M U63 ( .A0N(N119), .A1N(n151), .B0(n84), .Y(N170) );
  OAI2BB1X2M U64 ( .A0N(N120), .A1N(n151), .B0(n84), .Y(N171) );
  OAI2BB1X2M U65 ( .A0N(N121), .A1N(n151), .B0(n84), .Y(N172) );
  OAI2BB1X2M U66 ( .A0N(N154), .A1N(n70), .B0(n146), .Y(n71) );
  OAI2BB1X2M U67 ( .A0N(n13), .A1N(n69), .B0(N155), .Y(n146) );
  INVX2M U68 ( .A(ALU_FUN[2]), .Y(n153) );
  INVX2M U69 ( .A(ALU_FUN[3]), .Y(n154) );
  INVX2M U70 ( .A(ALU_FUN[0]), .Y(n149) );
  INVX2M U71 ( .A(ALU_FUN[1]), .Y(n152) );
  INVX2M U72 ( .A(\U3/U2/Z_4 ), .Y(n49) );
  AOI211X2M U73 ( .A0(N105), .A1(n147), .B0(n82), .C0(n72), .Y(n84) );
  OAI22X1M U74 ( .A0(n13), .A1(n62), .B0(n14), .B1(n54), .Y(\U3/U2/Z_4 ) );
  OAI22X1M U75 ( .A0(n13), .A1(n60), .B0(n14), .B1(n52), .Y(\U3/U2/Z_6 ) );
  OAI22X1M U76 ( .A0(n13), .A1(n61), .B0(n14), .B1(n53), .Y(\U3/U2/Z_5 ) );
  OAI22X1M U77 ( .A0(n13), .A1(n64), .B0(n14), .B1(n56), .Y(\U3/U2/Z_2 ) );
  OAI22X1M U78 ( .A0(n13), .A1(n63), .B0(n14), .B1(n55), .Y(\U3/U2/Z_3 ) );
  OAI22X1M U79 ( .A0(n12), .A1(n57), .B0(n14), .B1(n65), .Y(\U3/U1/Z_1 ) );
  OAI22X1M U80 ( .A0(n13), .A1(n65), .B0(n14), .B1(n57), .Y(\U3/U2/Z_1 ) );
  OAI22X1M U81 ( .A0(n12), .A1(n54), .B0(n14), .B1(n62), .Y(\U3/U1/Z_4 ) );
  OAI22X1M U82 ( .A0(n12), .A1(n52), .B0(n14), .B1(n60), .Y(\U3/U1/Z_6 ) );
  OAI22X1M U83 ( .A0(n13), .A1(n59), .B0(n14), .B1(n51), .Y(\U3/U2/Z_7 ) );
  OAI22X1M U84 ( .A0(n51), .A1(n13), .B0(n14), .B1(n59), .Y(\U3/U1/Z_7 ) );
  OAI22X1M U85 ( .A0(n12), .A1(n66), .B0(n14), .B1(n58), .Y(\U3/U2/Z_0 ) );
  OAI22X1M U86 ( .A0(n12), .A1(n58), .B0(n14), .B1(n66), .Y(\U3/U1/Z_0 ) );
  OAI2B11X2M U87 ( .A1N(N96), .A0(n80), .B0(n84), .C0(n85), .Y(N165) );
  AOI2BB2XLM U88 ( .B0(N114), .B1(n151), .A0N(n86), .A1N(n59), .Y(n85) );
  NAND3X2M U89 ( .A(n118), .B(n119), .C(n120), .Y(N159) );
  AOI22X1M U90 ( .A0(N99), .A1(n147), .B0(N90), .B1(n150), .Y(n118) );
  AOI221XLM U91 ( .A0(n148), .A1(n7), .B0(n82), .B1(n64), .C0(n121), .Y(n120)
         );
  AOI222X1M U92 ( .A0(N108), .A1(n151), .B0(n77), .B1(n6), .C0(N124), .C1(n78), 
        .Y(n119) );
  NAND3X2M U93 ( .A(n112), .B(n113), .C(n114), .Y(N160) );
  AOI22X1M U94 ( .A0(N100), .A1(n147), .B0(N91), .B1(n150), .Y(n112) );
  AOI221XLM U95 ( .A0(n148), .A1(n8), .B0(n82), .B1(n63), .C0(n115), .Y(n114)
         );
  AOI222X1M U96 ( .A0(N109), .A1(n151), .B0(n77), .B1(n7), .C0(N125), .C1(n78), 
        .Y(n113) );
  NAND3X2M U97 ( .A(n106), .B(n107), .C(n108), .Y(N161) );
  AOI22X1M U98 ( .A0(N101), .A1(n147), .B0(N92), .B1(n150), .Y(n106) );
  AOI221XLM U99 ( .A0(n148), .A1(n9), .B0(n82), .B1(n62), .C0(n109), .Y(n108)
         );
  AOI222X1M U100 ( .A0(N110), .A1(n151), .B0(n77), .B1(n8), .C0(N126), .C1(n78), .Y(n107) );
  NAND3X2M U101 ( .A(n100), .B(n101), .C(n102), .Y(N162) );
  AOI22X1M U102 ( .A0(N102), .A1(n147), .B0(N93), .B1(n150), .Y(n100) );
  AOI221XLM U103 ( .A0(n148), .A1(n10), .B0(n82), .B1(n61), .C0(n103), .Y(n102) );
  AOI222X1M U104 ( .A0(N111), .A1(n151), .B0(n77), .B1(n9), .C0(N127), .C1(n78), .Y(n101) );
  NAND3X2M U105 ( .A(n94), .B(n95), .C(n96), .Y(N163) );
  AOI22X1M U106 ( .A0(N103), .A1(n147), .B0(N94), .B1(n150), .Y(n94) );
  AOI221XLM U107 ( .A0(n148), .A1(n11), .B0(n82), .B1(n60), .C0(n97), .Y(n96)
         );
  AOI222X1M U108 ( .A0(N112), .A1(n151), .B0(n77), .B1(n10), .C0(N128), .C1(
        n78), .Y(n95) );
  NAND3X2M U109 ( .A(n87), .B(n88), .C(n89), .Y(N164) );
  AOI22X1M U110 ( .A0(N129), .A1(n78), .B0(N113), .B1(n151), .Y(n88) );
  AOI22X1M U111 ( .A0(N104), .A1(n147), .B0(N95), .B1(n150), .Y(n87) );
  AOI221XLM U112 ( .A0(n82), .A1(n59), .B0(n77), .B1(n11), .C0(n90), .Y(n89)
         );
  INVX2M U113 ( .A(n6), .Y(n64) );
  INVX2M U114 ( .A(n7), .Y(n63) );
  INVX2M U115 ( .A(n8), .Y(n62) );
  INVX2M U116 ( .A(n9), .Y(n61) );
  INVX2M U117 ( .A(n10), .Y(n60) );
  INVX2M U118 ( .A(n11), .Y(n59) );
  OA22X2M U119 ( .A0(n12), .A1(n56), .B0(n14), .B1(n64), .Y(n3) );
  OA22X2M U120 ( .A0(n12), .A1(n55), .B0(n14), .B1(n63), .Y(n4) );
  OA22X2M U121 ( .A0(n12), .A1(n53), .B0(n14), .B1(n61), .Y(n5) );
  OAI222X1M U122 ( .A0(n137), .A1(n58), .B0(B[0]), .B1(n138), .C0(n65), .C1(
        n132), .Y(n136) );
  AOI221XLM U123 ( .A0(n83), .A1(A[0]), .B0(n72), .B1(n66), .C0(n82), .Y(n138)
         );
  AOI221XLM U124 ( .A0(n83), .A1(n66), .B0(A[0]), .B1(n93), .C0(n77), .Y(n137)
         );
  OAI222X1M U125 ( .A0(n128), .A1(n57), .B0(B[1]), .B1(n129), .C0(n66), .C1(
        n86), .Y(n127) );
  AOI221XLM U126 ( .A0(n83), .A1(A[1]), .B0(n72), .B1(n65), .C0(n82), .Y(n129)
         );
  AOI221XLM U127 ( .A0(n83), .A1(n65), .B0(A[1]), .B1(n93), .C0(n77), .Y(n128)
         );
  OAI222X1M U128 ( .A0(n122), .A1(n56), .B0(B[2]), .B1(n123), .C0(n65), .C1(
        n86), .Y(n121) );
  AOI221XLM U129 ( .A0(n83), .A1(n6), .B0(n72), .B1(n64), .C0(n82), .Y(n123)
         );
  AOI221XLM U130 ( .A0(n83), .A1(n64), .B0(n6), .B1(n93), .C0(n77), .Y(n122)
         );
  OAI222X1M U131 ( .A0(n116), .A1(n55), .B0(B[3]), .B1(n117), .C0(n64), .C1(
        n86), .Y(n115) );
  AOI221XLM U132 ( .A0(n83), .A1(n7), .B0(n72), .B1(n63), .C0(n82), .Y(n117)
         );
  AOI221XLM U133 ( .A0(n83), .A1(n63), .B0(n7), .B1(n93), .C0(n77), .Y(n116)
         );
  OAI222X1M U134 ( .A0(n110), .A1(n54), .B0(B[4]), .B1(n111), .C0(n63), .C1(
        n86), .Y(n109) );
  AOI221XLM U135 ( .A0(n83), .A1(n8), .B0(n72), .B1(n62), .C0(n82), .Y(n111)
         );
  AOI221XLM U136 ( .A0(n83), .A1(n62), .B0(n8), .B1(n93), .C0(n77), .Y(n110)
         );
  OAI222X1M U137 ( .A0(n104), .A1(n53), .B0(B[5]), .B1(n105), .C0(n62), .C1(
        n86), .Y(n103) );
  AOI221XLM U138 ( .A0(n83), .A1(n9), .B0(n72), .B1(n61), .C0(n82), .Y(n105)
         );
  AOI221XLM U139 ( .A0(n83), .A1(n61), .B0(n9), .B1(n93), .C0(n77), .Y(n104)
         );
  OAI222X1M U140 ( .A0(n98), .A1(n52), .B0(B[6]), .B1(n99), .C0(n61), .C1(n86), 
        .Y(n97) );
  AOI221XLM U141 ( .A0(n83), .A1(n10), .B0(n72), .B1(n60), .C0(n82), .Y(n99)
         );
  AOI221XLM U142 ( .A0(n83), .A1(n60), .B0(n10), .B1(n93), .C0(n77), .Y(n98)
         );
  OAI222X1M U143 ( .A0(n91), .A1(n51), .B0(B[7]), .B1(n92), .C0(n60), .C1(n86), 
        .Y(n90) );
  AOI221XLM U144 ( .A0(n83), .A1(n11), .B0(n72), .B1(n59), .C0(n82), .Y(n92)
         );
  AOI221XLM U145 ( .A0(n83), .A1(n59), .B0(n11), .B1(n93), .C0(n77), .Y(n91)
         );
  INVX2M U146 ( .A(A[1]), .Y(n65) );
  INVX2M U147 ( .A(A[0]), .Y(n66) );
  NAND3X2M U148 ( .A(n124), .B(n125), .C(n126), .Y(N158) );
  AOI22X1M U149 ( .A0(N98), .A1(n147), .B0(N89), .B1(n150), .Y(n124) );
  AOI221XLM U150 ( .A0(n148), .A1(n6), .B0(n82), .B1(n65), .C0(n127), .Y(n126)
         );
  AOI222X1M U151 ( .A0(N107), .A1(n151), .B0(n77), .B1(A[1]), .C0(N123), .C1(
        n78), .Y(n125) );
  NAND3X2M U152 ( .A(n133), .B(n134), .C(n135), .Y(N157) );
  AOI21X2M U153 ( .A0(N88), .A1(n150), .B0(n71), .Y(n133) );
  AOI221XLM U154 ( .A0(n82), .A1(n66), .B0(n77), .B1(A[0]), .C0(n136), .Y(n135) );
  AOI222X1M U155 ( .A0(N97), .A1(n147), .B0(N122), .B1(n78), .C0(N106), .C1(
        n151), .Y(n134) );
  BUFX2M U156 ( .A(A[7]), .Y(n11) );
  BUFX2M U157 ( .A(A[2]), .Y(n6) );
  BUFX2M U158 ( .A(A[3]), .Y(n7) );
  BUFX2M U159 ( .A(A[4]), .Y(n8) );
  BUFX2M U160 ( .A(A[5]), .Y(n9) );
  BUFX2M U161 ( .A(A[6]), .Y(n10) );
  INVX2M U162 ( .A(B[0]), .Y(n58) );
  INVX2M U163 ( .A(B[7]), .Y(n51) );
  INVX2M U164 ( .A(B[6]), .Y(n52) );
  INVX2M U165 ( .A(B[2]), .Y(n56) );
  INVX2M U166 ( .A(B[1]), .Y(n57) );
  INVX2M U167 ( .A(B[3]), .Y(n55) );
  INVX2M U168 ( .A(B[4]), .Y(n54) );
  INVX2M U169 ( .A(B[5]), .Y(n53) );
  NOR2BX1M U170 ( .AN(\U3/U2/Z_0 ), .B(\U3/U1/Z_0 ), .Y(n15) );
  OAI2B2X1M U171 ( .A1N(\U3/U1/Z_1 ), .A0(n15), .B0(\U3/U2/Z_1 ), .B1(n15), 
        .Y(n16) );
  NAND2BX1M U172 ( .AN(\U3/U1/Z_6 ), .B(\U3/U2/Z_6 ), .Y(n44) );
  CLKNAND2X2M U173 ( .A(\U3/U2/Z_5 ), .B(n5), .Y(n43) );
  NAND2BX1M U174 ( .AN(\U3/U1/Z_4 ), .B(\U3/U2/Z_4 ), .Y(n23) );
  NAND4X1M U175 ( .A(n16), .B(n44), .C(n43), .D(n23), .Y(n48) );
  CLKNAND2X2M U176 ( .A(\U3/U2/Z_3 ), .B(n4), .Y(n22) );
  CLKNAND2X2M U177 ( .A(\U3/U2/Z_2 ), .B(n3), .Y(n17) );
  CLKNAND2X2M U178 ( .A(n22), .B(n17), .Y(n47) );
  NOR2BX1M U179 ( .AN(\U3/U2/Z_7 ), .B(\U3/U1/Z_7 ), .Y(n46) );
  NOR2BX1M U180 ( .AN(\U3/U1/Z_0 ), .B(\U3/U2/Z_0 ), .Y(n19) );
  OAI2BB1X1M U181 ( .A0N(n19), .A1N(\U3/U1/Z_1 ), .B0(\U3/U2/Z_1 ), .Y(n18) );
  OAI211X1M U182 ( .A0(\U3/U1/Z_1 ), .A1(n19), .B0(n18), .C0(n17), .Y(n20) );
  OAI221X1M U183 ( .A0(\U3/U2/Z_2 ), .A1(n3), .B0(\U3/U2/Z_3 ), .B1(n4), .C0(
        n20), .Y(n21) );
  AOI32X1M U184 ( .A0(n23), .A1(n22), .A2(n21), .B0(\U3/U1/Z_4 ), .B1(n49), 
        .Y(n24) );
  OAI21X1M U185 ( .A0(\U3/U2/Z_5 ), .A1(n5), .B0(n24), .Y(n25) );
  AOI32X1M U186 ( .A0(n44), .A1(n43), .A2(n25), .B0(\U3/U1/Z_6 ), .B1(n50), 
        .Y(n45) );
  OAI2B2X1M U187 ( .A1N(\U3/U1/Z_7 ), .A0(\U3/U2/Z_7 ), .B0(n46), .B1(n45), 
        .Y(N155) );
  NOR4X1M U188 ( .A(n48), .B(n47), .C(N155), .D(n46), .Y(N154) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW_div_uns_0 div_48 ( .a({n11, n10, n9, n8, n7, 
        n6, A[1:0]}), .b(B), .quotient({N129, N128, N127, N126, N125, N124, 
        N123, N122}) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_sub_0 sub_36 ( .A({1'b0, n11, n10, n9, n8, 
        n7, n6, A[1:0]}), .B({1'b0, B}), .CI(1'b0), .DIFF({N105, N104, N103, 
        N102, N101, N100, N99, N98, N97}) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW01_add_0 add_30 ( .A({1'b0, n11, n10, n9, n8, 
        n7, n6, A[1:0]}), .B({1'b0, B}), .CI(1'b0), .SUM({N96, N95, N94, N93, 
        N92, N91, N90, N89, N88}) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_DW02_mult_0 mult_42 ( .A({n11, n10, n9, n8, n7, 
        n6, A[1:0]}), .B(B), .TC(1'b0), .PRODUCT({N121, N120, N119, N118, N117, 
        N116, N115, N114, N113, N112, N111, N110, N109, N108, N107, N106}) );
endmodule


module CLK_DIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NOR3X2M U11 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NAND4BX1M U12 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U13 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  INVX2M U17 ( .A(IN[2]), .Y(n15) );
  INVX2M U18 ( .A(IN[0]), .Y(n17) );
  INVX2M U19 ( .A(IN[1]), .Y(n16) );
  INVX2M U20 ( .A(IN[5]), .Y(n14) );
  OAI211X2M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NOR4X1M U22 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NAND2X2M U23 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
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
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clk_Div_WIDTH8_test_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N0, div_clk, flag, N9, N11, N12, N13, N14, N15, N16, N17, N19, N24,
         N25, N26, N27, N28, N29, N30, N31, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n1, n2,
         n3, n4, n5, n6, n7, n18, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60;
  wire   [7:0] counter;
  assign test_so = flag;

  SDFFRQX2M div_clk_reg ( .D(n28), .SI(counter[7]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  SDFFRQX2M flag_reg ( .D(n37), .SI(div_clk), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(flag) );
  SDFFRQX2M \counter_reg[7]  ( .D(n29), .SI(counter[6]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n36), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n34), .SI(counter[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n33), .SI(counter[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[4]  ( .D(n32), .SI(counter[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[5]  ( .D(n31), .SI(counter[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[6]  ( .D(n30), .SI(counter[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n35), .SI(n48), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(counter[1]) );
  NOR2BX2M U5 ( .AN(n20), .B(n2), .Y(n22) );
  AOI2B1X1M U6 ( .A1N(i_div_ratio[0]), .A0(N17), .B0(n60), .Y(n20) );
  INVX2M U7 ( .A(n23), .Y(n60) );
  OR2X2M U12 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n3) );
  AOI21BX2M U17 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n3), .Y(n1)
         );
  INVX2M U18 ( .A(n2), .Y(N0) );
  NAND2X2M U19 ( .A(i_div_ratio[0]), .B(n25), .Y(n23) );
  AO2B2X2M U20 ( .B0(N17), .B1(flag), .A0(N19), .A1N(flag), .Y(n25) );
  CLKXOR2X2M U21 ( .A(flag), .B(n24), .Y(n37) );
  NOR2X2M U22 ( .A(n2), .B(n23), .Y(n24) );
  CLKXOR2X2M U23 ( .A(div_clk), .B(n19), .Y(n28) );
  NOR2X2M U24 ( .A(n20), .B(n2), .Y(n19) );
  AO22X1M U25 ( .A0(counter[7]), .A1(n2), .B0(N31), .B1(n22), .Y(n29) );
  AO22X1M U26 ( .A0(counter[6]), .A1(n2), .B0(N30), .B1(n22), .Y(n30) );
  AO22X1M U27 ( .A0(counter[5]), .A1(n2), .B0(N29), .B1(n22), .Y(n31) );
  AO22X1M U28 ( .A0(counter[4]), .A1(n2), .B0(N28), .B1(n22), .Y(n32) );
  AO22X1M U29 ( .A0(counter[3]), .A1(n2), .B0(N27), .B1(n22), .Y(n33) );
  AO22X1M U30 ( .A0(counter[2]), .A1(n2), .B0(N26), .B1(n22), .Y(n34) );
  AO22X1M U31 ( .A0(counter[1]), .A1(n2), .B0(N25), .B1(n22), .Y(n35) );
  AO22X1M U32 ( .A0(counter[0]), .A1(n2), .B0(N24), .B1(n22), .Y(n36) );
  BUFX2M U33 ( .A(n21), .Y(n2) );
  OAI2BB1X2M U34 ( .A0N(n26), .A1N(n27), .B0(i_clk_en), .Y(n21) );
  NOR4X1M U35 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n27) );
  NOR3X2M U36 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n26) );
  INVX2M U37 ( .A(counter[0]), .Y(n48) );
  MX2X2M U38 ( .A(i_ref_clk), .B(div_clk), .S0(N0), .Y(o_div_clk) );
  CLKINVX1M U39 ( .A(i_div_ratio[1]), .Y(N9) );
  OR2X1M U40 ( .A(n3), .B(i_div_ratio[3]), .Y(n4) );
  OAI2BB1X1M U41 ( .A0N(n3), .A1N(i_div_ratio[3]), .B0(n4), .Y(N11) );
  OR2X1M U42 ( .A(n4), .B(i_div_ratio[4]), .Y(n5) );
  OAI2BB1X1M U43 ( .A0N(n4), .A1N(i_div_ratio[4]), .B0(n5), .Y(N12) );
  OR2X1M U44 ( .A(n5), .B(i_div_ratio[5]), .Y(n6) );
  OAI2BB1X1M U45 ( .A0N(n5), .A1N(i_div_ratio[5]), .B0(n6), .Y(N13) );
  XNOR2X1M U46 ( .A(i_div_ratio[6]), .B(n6), .Y(N14) );
  NOR3X1M U47 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n6), .Y(N16) );
  OAI21X1M U48 ( .A0(i_div_ratio[6]), .A1(n6), .B0(i_div_ratio[7]), .Y(n7) );
  NAND2BX1M U49 ( .AN(N16), .B(n7), .Y(N15) );
  XNOR2X1M U50 ( .A(N11), .B(counter[2]), .Y(n47) );
  NOR2X1M U51 ( .A(n48), .B(N9), .Y(n18) );
  OAI22X1M U52 ( .A0(counter[1]), .A1(n18), .B0(n18), .B1(n1), .Y(n46) );
  CLKNAND2X2M U53 ( .A(N9), .B(n48), .Y(n38) );
  AOI22X1M U54 ( .A0(n38), .A1(n1), .B0(n38), .B1(counter[1]), .Y(n39) );
  NOR3X1M U55 ( .A(n39), .B(N16), .C(counter[7]), .Y(n45) );
  CLKXOR2X2M U56 ( .A(N12), .B(counter[3]), .Y(n43) );
  CLKXOR2X2M U57 ( .A(N13), .B(counter[4]), .Y(n42) );
  CLKXOR2X2M U58 ( .A(N14), .B(counter[5]), .Y(n41) );
  CLKXOR2X2M U59 ( .A(N15), .B(counter[6]), .Y(n40) );
  NOR4X1M U60 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(n44) );
  AND4X1M U61 ( .A(n47), .B(n46), .C(n45), .D(n44), .Y(N17) );
  NOR2BX1M U62 ( .AN(counter[0]), .B(i_div_ratio[1]), .Y(n49) );
  OAI2B2X1M U63 ( .A1N(i_div_ratio[2]), .A0(n49), .B0(counter[1]), .B1(n49), 
        .Y(n53) );
  XNOR2X1M U64 ( .A(i_div_ratio[3]), .B(counter[2]), .Y(n52) );
  NOR2BX1M U65 ( .AN(i_div_ratio[1]), .B(counter[0]), .Y(n50) );
  OAI2B2X1M U66 ( .A1N(counter[1]), .A0(n50), .B0(i_div_ratio[2]), .B1(n50), 
        .Y(n51) );
  NAND4BX1M U67 ( .AN(counter[7]), .B(n53), .C(n52), .D(n51), .Y(n59) );
  XNOR2X1M U68 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n57) );
  XNOR2X1M U69 ( .A(i_div_ratio[6]), .B(counter[5]), .Y(n56) );
  XNOR2X1M U70 ( .A(i_div_ratio[5]), .B(counter[4]), .Y(n55) );
  XNOR2X1M U71 ( .A(i_div_ratio[4]), .B(counter[3]), .Y(n54) );
  NAND4X1M U72 ( .A(n57), .B(n56), .C(n55), .D(n54), .Y(n58) );
  NOR2X1M U73 ( .A(n59), .B(n58), .Y(N19) );
  Clk_Div_WIDTH8_0_DW01_inc_0 add_46 ( .A(counter), .SUM({N31, N30, N29, N28, 
        N27, N26, N25, N24}) );
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
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clk_Div_WIDTH8_test_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N0, div_clk, flag, N9, N11, N12, N13, N14, N15, N16, N17, N19, N24,
         N25, N26, N27, N28, N29, N30, N31, n1, n2, n3, n4, n5, n6, n7, n18,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79;
  wire   [7:0] counter;
  assign test_so = flag;

  SDFFRQX2M div_clk_reg ( .D(n70), .SI(counter[7]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(div_clk) );
  SDFFRQX2M flag_reg ( .D(n61), .SI(div_clk), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(flag) );
  SDFFRQX2M \counter_reg[7]  ( .D(n69), .SI(counter[6]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n62), .SI(test_si), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n64), .SI(counter[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n65), .SI(counter[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[4]  ( .D(n66), .SI(counter[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[5]  ( .D(n67), .SI(counter[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[6]  ( .D(n68), .SI(counter[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n63), .SI(n48), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(counter[1]) );
  NOR2BX2M U5 ( .AN(n78), .B(n2), .Y(n76) );
  INVX2M U6 ( .A(n2), .Y(N0) );
  AOI2B1X1M U7 ( .A1N(i_div_ratio[0]), .A0(N17), .B0(n60), .Y(n78) );
  INVX2M U12 ( .A(n75), .Y(n60) );
  OR2X2M U17 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n3) );
  NAND2X2M U18 ( .A(i_div_ratio[0]), .B(n73), .Y(n75) );
  AO2B2X2M U19 ( .B0(N17), .B1(flag), .A0(N19), .A1N(flag), .Y(n73) );
  AO22X1M U20 ( .A0(counter[7]), .A1(n2), .B0(N31), .B1(n76), .Y(n69) );
  AO22X1M U21 ( .A0(counter[6]), .A1(n2), .B0(N30), .B1(n76), .Y(n68) );
  AO22X1M U22 ( .A0(counter[5]), .A1(n2), .B0(N29), .B1(n76), .Y(n67) );
  AO22X1M U23 ( .A0(counter[4]), .A1(n2), .B0(N28), .B1(n76), .Y(n66) );
  AO22X1M U24 ( .A0(counter[3]), .A1(n2), .B0(N27), .B1(n76), .Y(n65) );
  AO22X1M U25 ( .A0(counter[2]), .A1(n2), .B0(N26), .B1(n76), .Y(n64) );
  AO22X1M U26 ( .A0(counter[1]), .A1(n2), .B0(N25), .B1(n76), .Y(n63) );
  AO22X1M U27 ( .A0(counter[0]), .A1(n2), .B0(N24), .B1(n76), .Y(n62) );
  CLKXOR2X2M U28 ( .A(div_clk), .B(n79), .Y(n70) );
  NOR2X2M U29 ( .A(n78), .B(n2), .Y(n79) );
  CLKXOR2X2M U30 ( .A(flag), .B(n74), .Y(n61) );
  NOR2X2M U31 ( .A(n2), .B(n75), .Y(n74) );
  AOI21BX2M U32 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0N(n3), .Y(n1)
         );
  INVX2M U33 ( .A(counter[0]), .Y(n48) );
  BUFX2M U34 ( .A(n77), .Y(n2) );
  OAI2BB1X2M U35 ( .A0N(n72), .A1N(n71), .B0(i_clk_en), .Y(n77) );
  NOR3X2M U36 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n72) );
  NOR4X1M U37 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n71) );
  MX2X2M U38 ( .A(i_ref_clk), .B(div_clk), .S0(N0), .Y(o_div_clk) );
  CLKINVX1M U39 ( .A(i_div_ratio[1]), .Y(N9) );
  OR2X1M U40 ( .A(n3), .B(i_div_ratio[3]), .Y(n4) );
  OAI2BB1X1M U41 ( .A0N(n3), .A1N(i_div_ratio[3]), .B0(n4), .Y(N11) );
  OR2X1M U42 ( .A(n4), .B(i_div_ratio[4]), .Y(n5) );
  OAI2BB1X1M U43 ( .A0N(n4), .A1N(i_div_ratio[4]), .B0(n5), .Y(N12) );
  OR2X1M U44 ( .A(n5), .B(i_div_ratio[5]), .Y(n6) );
  OAI2BB1X1M U45 ( .A0N(n5), .A1N(i_div_ratio[5]), .B0(n6), .Y(N13) );
  XNOR2X1M U46 ( .A(i_div_ratio[6]), .B(n6), .Y(N14) );
  NOR3X1M U47 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n6), .Y(N16) );
  OAI21X1M U48 ( .A0(i_div_ratio[6]), .A1(n6), .B0(i_div_ratio[7]), .Y(n7) );
  NAND2BX1M U49 ( .AN(N16), .B(n7), .Y(N15) );
  XNOR2X1M U50 ( .A(N11), .B(counter[2]), .Y(n47) );
  NOR2X1M U51 ( .A(n48), .B(N9), .Y(n18) );
  OAI22X1M U52 ( .A0(counter[1]), .A1(n18), .B0(n18), .B1(n1), .Y(n46) );
  CLKNAND2X2M U53 ( .A(N9), .B(n48), .Y(n38) );
  AOI22X1M U54 ( .A0(n38), .A1(n1), .B0(n38), .B1(counter[1]), .Y(n39) );
  NOR3X1M U55 ( .A(n39), .B(N16), .C(counter[7]), .Y(n45) );
  CLKXOR2X2M U56 ( .A(N12), .B(counter[3]), .Y(n43) );
  CLKXOR2X2M U57 ( .A(N13), .B(counter[4]), .Y(n42) );
  CLKXOR2X2M U58 ( .A(N14), .B(counter[5]), .Y(n41) );
  CLKXOR2X2M U59 ( .A(N15), .B(counter[6]), .Y(n40) );
  NOR4X1M U60 ( .A(n43), .B(n42), .C(n41), .D(n40), .Y(n44) );
  AND4X1M U61 ( .A(n47), .B(n46), .C(n45), .D(n44), .Y(N17) );
  NOR2BX1M U62 ( .AN(counter[0]), .B(i_div_ratio[1]), .Y(n49) );
  OAI2B2X1M U63 ( .A1N(i_div_ratio[2]), .A0(n49), .B0(counter[1]), .B1(n49), 
        .Y(n53) );
  XNOR2X1M U64 ( .A(i_div_ratio[3]), .B(counter[2]), .Y(n52) );
  NOR2BX1M U65 ( .AN(i_div_ratio[1]), .B(counter[0]), .Y(n50) );
  OAI2B2X1M U66 ( .A1N(counter[1]), .A0(n50), .B0(i_div_ratio[2]), .B1(n50), 
        .Y(n51) );
  NAND4BX1M U67 ( .AN(counter[7]), .B(n53), .C(n52), .D(n51), .Y(n59) );
  XNOR2X1M U68 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n57) );
  XNOR2X1M U69 ( .A(i_div_ratio[6]), .B(counter[5]), .Y(n56) );
  XNOR2X1M U70 ( .A(i_div_ratio[5]), .B(counter[4]), .Y(n55) );
  XNOR2X1M U71 ( .A(i_div_ratio[4]), .B(counter[3]), .Y(n54) );
  NAND4X1M U72 ( .A(n57), .B(n56), .C(n55), .D(n54), .Y(n58) );
  NOR2X1M U73 ( .A(n59), .B(n58), .Y(N19) );
  Clk_Div_WIDTH8_1_DW01_inc_0 add_46 ( .A(counter), .SUM({N31, N30, N29, N28, 
        N27, N26, N25, N24}) );
endmodule


module DF_SYNC_ADDRESS_WIDTH4_test_0 ( CLK, RST, ASYNC, SYNC, test_si, test_se
 );
  input [4:0] ASYNC;
  output [4:0] SYNC;
  input CLK, RST, test_si, test_se;

  wire   [3:0] REG;

  SDFFRQX2M \SYNC_reg[3]  ( .D(REG[3]), .SI(SYNC[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[3]) );
  SDFFRQX2M \SYNC_reg[2]  ( .D(REG[2]), .SI(SYNC[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[2]) );
  SDFFRQX2M \SYNC_reg[1]  ( .D(REG[1]), .SI(SYNC[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[1]) );
  SDFFRQX2M \SYNC_reg[0]  ( .D(REG[0]), .SI(REG[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[0]) );
  SDFFRQX2M \REG_reg[3]  ( .D(ASYNC[3]), .SI(REG[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[3]) );
  SDFFRQX2M \REG_reg[2]  ( .D(ASYNC[2]), .SI(REG[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[2]) );
  SDFFRQX2M \REG_reg[1]  ( .D(ASYNC[1]), .SI(REG[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[1]) );
  SDFFRQX2M \REG_reg[0]  ( .D(ASYNC[0]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[0]) );
  INVX2M U3 ( .A(1'b1), .Y(SYNC[4]) );
endmodule


module DF_SYNC_ADDRESS_WIDTH4_test_1 ( CLK, RST, ASYNC, SYNC, test_si, test_se
 );
  input [4:0] ASYNC;
  output [4:0] SYNC;
  input CLK, RST, test_si, test_se;

  wire   [3:0] REG;

  SDFFRQX2M \SYNC_reg[2]  ( .D(REG[2]), .SI(SYNC[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[2]) );
  SDFFRQX2M \SYNC_reg[3]  ( .D(REG[3]), .SI(SYNC[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[3]) );
  SDFFRQX2M \SYNC_reg[1]  ( .D(REG[1]), .SI(SYNC[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[1]) );
  SDFFRQX2M \SYNC_reg[0]  ( .D(REG[0]), .SI(REG[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(SYNC[0]) );
  SDFFRQX2M \REG_reg[3]  ( .D(ASYNC[3]), .SI(REG[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[3]) );
  SDFFRQX2M \REG_reg[2]  ( .D(ASYNC[2]), .SI(REG[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[2]) );
  SDFFRQX2M \REG_reg[1]  ( .D(ASYNC[1]), .SI(REG[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[1]) );
  SDFFRQX2M \REG_reg[0]  ( .D(ASYNC[0]), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(REG[0]) );
  INVX2M U3 ( .A(1'b1), .Y(SYNC[4]) );
endmodule


module FIFO_WR_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 ( W_INC, W_CLK, W_RST, 
        SYNC_RD_PTR, WR_ADDR, WR_PTR, FULL, test_se );
  input [4:0] SYNC_RD_PTR;
  output [3:0] WR_ADDR;
  output [4:0] WR_PTR;
  input W_INC, W_CLK, W_RST, test_se;
  output FULL;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N110, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n20, n22, n24, n35, n36, \add_28/carry[4] , \add_28/carry[3] ,
         \add_28/carry[2] , n4, n8;
  wire   [4:0] WR_PTR_binary;

  SDFFRQX2M \WR_PTR_reg[2]  ( .D(n22), .SI(WR_PTR[1]), .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(WR_PTR[2]) );
  SDFFRQX2M \WR_PTR_reg[0]  ( .D(n35), .SI(n36), .SE(test_se), .CK(W_CLK), 
        .RN(W_RST), .Q(WR_PTR[0]) );
  SDFFRQX2M \WR_PTR_reg[1]  ( .D(n24), .SI(WR_PTR[0]), .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(WR_PTR[1]) );
  SDFFRQX2M \WR_PTR_reg[3]  ( .D(n20), .SI(WR_PTR[2]), .SE(test_se), .CK(W_CLK), .RN(W_RST), .Q(WR_PTR[3]) );
  SDFFRQX2M \WR_PTR_binary_reg[0]  ( .D(N34), .SI(WR_ADDR[3]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(WR_PTR_binary[0]) );
  SDFFRQX2M \WR_ADDR_reg[3]  ( .D(N33), .SI(WR_ADDR[2]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(WR_ADDR[3]) );
  SDFFRQX2M \WR_ADDR_reg[2]  ( .D(N32), .SI(WR_ADDR[1]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(WR_ADDR[2]) );
  SDFFRQX2M \WR_PTR_binary_reg[3]  ( .D(N37), .SI(WR_PTR_binary[2]), .SE(
        test_se), .CK(W_CLK), .RN(W_RST), .Q(N110) );
  SDFFRQX2M \WR_PTR_binary_reg[1]  ( .D(N35), .SI(N25), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(WR_PTR_binary[1]) );
  SDFFRQX2M \WR_PTR_binary_reg[2]  ( .D(N36), .SI(WR_PTR_binary[1]), .SE(
        test_se), .CK(W_CLK), .RN(W_RST), .Q(WR_PTR_binary[2]) );
  SDFFRQX2M \WR_ADDR_reg[0]  ( .D(N30), .SI(SYNC_RD_PTR[3]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(WR_ADDR[0]) );
  SDFFRQX2M \WR_ADDR_reg[1]  ( .D(N31), .SI(WR_ADDR[0]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(WR_ADDR[1]) );
  SDFFRX1M \WR_PTR_binary_reg[4]  ( .D(N38), .SI(n8), .SE(test_se), .CK(W_CLK), 
        .RN(W_RST), .Q(WR_PTR_binary[4]), .QN(n36) );
  INVX2M U6 ( .A(n9), .Y(n4) );
  NAND2X2M U7 ( .A(W_INC), .B(n13), .Y(n9) );
  OAI2BB2X1M U8 ( .B0(n4), .B1(n8), .A0N(N28), .A1N(n4), .Y(N37) );
  INVX2M U9 ( .A(n13), .Y(FULL) );
  XNOR2X2M U10 ( .A(WR_ADDR[2]), .B(n11), .Y(N32) );
  NAND2X2M U11 ( .A(WR_ADDR[1]), .B(n12), .Y(n11) );
  OAI2BB2X1M U12 ( .B0(n36), .B1(n4), .A0N(N29), .A1N(n4), .Y(N38) );
  AND2X2M U13 ( .A(WR_ADDR[0]), .B(n4), .Y(n12) );
  AO22X1M U14 ( .A0(n9), .A1(WR_PTR_binary[0]), .B0(N25), .B1(n4), .Y(N34) );
  AO22X1M U15 ( .A0(n9), .A1(WR_PTR_binary[2]), .B0(N27), .B1(n4), .Y(N36) );
  AO22X1M U16 ( .A0(n9), .A1(WR_PTR_binary[1]), .B0(N26), .B1(n4), .Y(N35) );
  CLKXOR2X2M U17 ( .A(WR_ADDR[1]), .B(n12), .Y(N31) );
  CLKXOR2X2M U18 ( .A(WR_ADDR[0]), .B(n4), .Y(N30) );
  CLKXOR2X2M U19 ( .A(WR_ADDR[3]), .B(n10), .Y(N33) );
  NOR2BX2M U20 ( .AN(WR_ADDR[2]), .B(n11), .Y(n10) );
  OAI2BB2X1M U21 ( .B0(n5), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[2]), .Y(n22) );
  CLKXOR2X2M U22 ( .A(n8), .B(WR_PTR_binary[2]), .Y(n5) );
  OAI2BB2X1M U23 ( .B0(n8), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[3]), .Y(n20) );
  OAI2BB2X1M U24 ( .B0(n6), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[1]), .Y(n24) );
  XNOR2X2M U25 ( .A(WR_PTR_binary[1]), .B(WR_PTR_binary[2]), .Y(n6) );
  OAI2BB2X1M U26 ( .B0(n7), .B1(WR_PTR_binary[4]), .A0N(WR_PTR_binary[4]), 
        .A1N(WR_PTR[0]), .Y(n35) );
  XNOR2X2M U27 ( .A(WR_PTR_binary[0]), .B(WR_PTR_binary[1]), .Y(n7) );
  INVX2M U28 ( .A(N110), .Y(n8) );
  ADDHX1M U29 ( .A(WR_PTR_binary[2]), .B(\add_28/carry[2] ), .CO(
        \add_28/carry[3] ), .S(N27) );
  ADDHX1M U30 ( .A(WR_PTR_binary[1]), .B(WR_PTR_binary[0]), .CO(
        \add_28/carry[2] ), .S(N26) );
  ADDHX1M U31 ( .A(N110), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), .S(
        N28) );
  NAND4X2M U32 ( .A(SYNC_RD_PTR[4]), .B(n14), .C(n15), .D(n16), .Y(n13) );
  CLKXOR2X2M U47 ( .A(WR_PTR[3]), .B(SYNC_RD_PTR[3]), .Y(n14) );
  NOR2X2M U48 ( .A(n17), .B(n18), .Y(n16) );
  XNOR2X2M U49 ( .A(WR_PTR[2]), .B(SYNC_RD_PTR[2]), .Y(n15) );
  CLKXOR2X2M U50 ( .A(WR_PTR[0]), .B(SYNC_RD_PTR[0]), .Y(n17) );
  CLKXOR2X2M U51 ( .A(WR_PTR[1]), .B(SYNC_RD_PTR[1]), .Y(n18) );
  CLKINVX1M U52 ( .A(WR_PTR_binary[0]), .Y(N25) );
  CLKXOR2X2M U53 ( .A(\add_28/carry[4] ), .B(WR_PTR_binary[4]), .Y(N29) );
  INVX2M U3 ( .A(1'b1), .Y(WR_PTR[4]) );
endmodule


module FIFO_RD_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 ( R_INC, R_CLK, R_RST, 
        SYNC_WR_PTR, RD_ADDR, RD_PTR, EMPTY, test_si, test_se );
  input [4:0] SYNC_WR_PTR;
  output [3:0] RD_ADDR;
  output [4:0] RD_PTR;
  input R_INC, R_CLK, R_RST, test_si, test_se;
  output EMPTY;
  wire   N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N110, n5, n6, n7, n9, n10, n11, n12, n18, n20, n22, n29, n30, n31,
         \add_28/carry[4] , \add_28/carry[3] , \add_28/carry[2] , n8, n32, n33,
         n34, n35, n36, n37;
  wire   [4:0] RD_PTR_binary;

  SDFFRQX2M \RD_ADDR_reg[3]  ( .D(N33), .SI(n31), .SE(test_se), .CK(R_CLK), 
        .RN(R_RST), .Q(RD_ADDR[3]) );
  SDFFRQX2M \RD_PTR_binary_reg[0]  ( .D(N34), .SI(RD_ADDR[3]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(RD_PTR_binary[0]) );
  SDFFRQX2M \RD_ADDR_reg[0]  ( .D(N30), .SI(test_si), .SE(test_se), .CK(R_CLK), 
        .RN(R_RST), .Q(RD_ADDR[0]) );
  SDFFRQX2M \RD_PTR_binary_reg[3]  ( .D(N37), .SI(RD_PTR_binary[2]), .SE(
        test_se), .CK(R_CLK), .RN(R_RST), .Q(N110) );
  SDFFRQX2M \RD_PTR_binary_reg[1]  ( .D(N35), .SI(N25), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(RD_PTR_binary[1]) );
  SDFFRQX2M \RD_PTR_binary_reg[2]  ( .D(N36), .SI(RD_PTR_binary[1]), .SE(
        test_se), .CK(R_CLK), .RN(R_RST), .Q(RD_PTR_binary[2]) );
  SDFFRQX2M \RD_ADDR_reg[1]  ( .D(N31), .SI(RD_ADDR[0]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(RD_ADDR[1]) );
  SDFFRQX2M \RD_PTR_reg[2]  ( .D(n20), .SI(RD_PTR[1]), .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(RD_PTR[2]) );
  SDFFRQX2M \RD_PTR_reg[3]  ( .D(n18), .SI(RD_PTR[2]), .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(RD_PTR[3]) );
  SDFFRQX2M \RD_PTR_reg[0]  ( .D(n29), .SI(n30), .SE(test_se), .CK(R_CLK), 
        .RN(R_RST), .Q(RD_PTR[0]) );
  SDFFRQX2M \RD_PTR_reg[1]  ( .D(n22), .SI(RD_PTR[0]), .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(RD_PTR[1]) );
  SDFFRX1M \RD_PTR_binary_reg[4]  ( .D(N38), .SI(n37), .SE(test_se), .CK(R_CLK), .RN(R_RST), .Q(RD_PTR_binary[4]), .QN(n30) );
  SDFFRX1M \RD_ADDR_reg[2]  ( .D(N32), .SI(RD_ADDR[1]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(RD_ADDR[2]), .QN(n31) );
  OAI2BB2X1M U7 ( .B0(n36), .B1(n37), .A0N(N28), .A1N(n36), .Y(N37) );
  INVX2M U8 ( .A(n9), .Y(n36) );
  NAND2X2M U9 ( .A(RD_ADDR[1]), .B(n12), .Y(n11) );
  NAND2BX2M U10 ( .AN(EMPTY), .B(R_INC), .Y(n9) );
  OAI2BB2X1M U11 ( .B0(n30), .B1(n36), .A0N(N29), .A1N(n36), .Y(N38) );
  AND2X2M U12 ( .A(RD_ADDR[0]), .B(n36), .Y(n12) );
  AO22X1M U13 ( .A0(n9), .A1(RD_PTR_binary[0]), .B0(N25), .B1(n36), .Y(N34) );
  AO22X1M U14 ( .A0(n9), .A1(RD_PTR_binary[2]), .B0(N27), .B1(n36), .Y(N36) );
  AO22X1M U15 ( .A0(n9), .A1(RD_PTR_binary[1]), .B0(N26), .B1(n36), .Y(N35) );
  CLKXOR2X2M U16 ( .A(RD_ADDR[1]), .B(n12), .Y(N31) );
  CLKXOR2X2M U17 ( .A(RD_ADDR[3]), .B(n10), .Y(N33) );
  NOR2X2M U18 ( .A(n31), .B(n11), .Y(n10) );
  CLKXOR2X2M U19 ( .A(RD_ADDR[0]), .B(n36), .Y(N30) );
  CLKXOR2X2M U20 ( .A(n11), .B(n31), .Y(N32) );
  OAI2BB2X1M U21 ( .B0(n5), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[2]), .A1N(
        RD_PTR_binary[4]), .Y(n20) );
  CLKXOR2X2M U22 ( .A(n37), .B(RD_PTR_binary[2]), .Y(n5) );
  OAI2BB2X1M U23 ( .B0(n37), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[3]), .A1N(
        RD_PTR_binary[4]), .Y(n18) );
  OAI2BB2X1M U24 ( .B0(n6), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[1]), .A1N(
        RD_PTR_binary[4]), .Y(n22) );
  XNOR2X2M U25 ( .A(RD_PTR_binary[1]), .B(RD_PTR_binary[2]), .Y(n6) );
  OAI2BB2X1M U26 ( .B0(n7), .B1(RD_PTR_binary[4]), .A0N(RD_PTR[0]), .A1N(
        RD_PTR_binary[4]), .Y(n29) );
  XNOR2X2M U41 ( .A(RD_PTR_binary[0]), .B(RD_PTR_binary[1]), .Y(n7) );
  INVX2M U42 ( .A(N110), .Y(n37) );
  ADDHX1M U43 ( .A(RD_PTR_binary[2]), .B(\add_28/carry[2] ), .CO(
        \add_28/carry[3] ), .S(N27) );
  ADDHX1M U44 ( .A(RD_PTR_binary[1]), .B(RD_PTR_binary[0]), .CO(
        \add_28/carry[2] ), .S(N26) );
  ADDHX1M U45 ( .A(N110), .B(\add_28/carry[3] ), .CO(\add_28/carry[4] ), .S(
        N28) );
  CLKINVX1M U46 ( .A(RD_PTR_binary[0]), .Y(N25) );
  CLKXOR2X2M U47 ( .A(\add_28/carry[4] ), .B(RD_PTR_binary[4]), .Y(N29) );
  XNOR2X1M U48 ( .A(SYNC_WR_PTR[2]), .B(RD_PTR[2]), .Y(n32) );
  XNOR2X1M U49 ( .A(SYNC_WR_PTR[3]), .B(RD_PTR[3]), .Y(n8) );
  CLKNAND2X2M U50 ( .A(n32), .B(n8), .Y(n35) );
  CLKXOR2X2M U51 ( .A(SYNC_WR_PTR[1]), .B(RD_PTR[1]), .Y(n34) );
  CLKXOR2X2M U52 ( .A(SYNC_WR_PTR[0]), .B(RD_PTR[0]), .Y(n33) );
  NOR4X1M U53 ( .A(n35), .B(n34), .C(SYNC_WR_PTR[4]), .D(n33), .Y(EMPTY) );
  INVX2M U3 ( .A(1'b1), .Y(RD_PTR[4]) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 ( WR_DATA, WR_ADDR, 
        RD_ADDR, W_INC, R_INC, W_CLK, R_CLK, FULL, RD_DATA, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  input [3:0] WR_ADDR;
  input [3:0] RD_ADDR;
  output [7:0] RD_DATA;
  input W_INC, R_INC, W_CLK, R_CLK, FULL, test_si2, test_si1, test_se;
  output test_so2, test_so1;
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
         \MEM[0][4] , \MEM[0][3] , \MEM[0][2] , \MEM[0][1] , \MEM[0][0] , n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n176, n177, n178;
  assign N9 = RD_ADDR[0];
  assign N10 = RD_ADDR[1];
  assign N11 = RD_ADDR[2];
  assign test_so2 = \MEM[7][7] ;
  assign test_so1 = \MEM[0][3] ;

  SDFFQX2M \MEM_reg[5][6]  ( .D(n133), .SI(\MEM[5][5] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[5][6] ) );
  SDFFQX2M \MEM_reg[5][5]  ( .D(n132), .SI(\MEM[5][4] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[5][5] ) );
  SDFFQX2M \MEM_reg[5][4]  ( .D(n131), .SI(\MEM[5][3] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[5][4] ) );
  SDFFQX2M \MEM_reg[5][3]  ( .D(n130), .SI(\MEM[5][2] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[5][3] ) );
  SDFFQX2M \MEM_reg[5][2]  ( .D(n129), .SI(\MEM[5][1] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[5][2] ) );
  SDFFQX2M \MEM_reg[5][1]  ( .D(n128), .SI(\MEM[5][0] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[5][1] ) );
  SDFFQX2M \MEM_reg[5][0]  ( .D(n127), .SI(\MEM[4][7] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[5][0] ) );
  SDFFQX2M \MEM_reg[1][7]  ( .D(n102), .SI(\MEM[1][6] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[1][7] ) );
  SDFFQX2M \MEM_reg[1][6]  ( .D(n101), .SI(\MEM[1][5] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[1][6] ) );
  SDFFQX2M \MEM_reg[1][5]  ( .D(n100), .SI(\MEM[1][4] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[1][5] ) );
  SDFFQX2M \MEM_reg[1][4]  ( .D(n99), .SI(\MEM[1][3] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[1][4] ) );
  SDFFQX2M \MEM_reg[1][3]  ( .D(n98), .SI(\MEM[1][2] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[1][3] ) );
  SDFFQX2M \MEM_reg[1][2]  ( .D(n97), .SI(\MEM[1][1] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[1][2] ) );
  SDFFQX2M \MEM_reg[1][1]  ( .D(n96), .SI(\MEM[1][0] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[1][1] ) );
  SDFFQX2M \MEM_reg[1][0]  ( .D(n95), .SI(\MEM[0][7] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[1][0] ) );
  SDFFQX2M \MEM_reg[7][7]  ( .D(n150), .SI(\MEM[7][6] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[7][7] ) );
  SDFFQX2M \MEM_reg[7][6]  ( .D(n149), .SI(\MEM[7][5] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[7][6] ) );
  SDFFQX2M \MEM_reg[7][5]  ( .D(n148), .SI(\MEM[7][4] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[7][5] ) );
  SDFFQX2M \MEM_reg[7][4]  ( .D(n147), .SI(\MEM[7][3] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[7][4] ) );
  SDFFQX2M \MEM_reg[7][3]  ( .D(n146), .SI(\MEM[7][2] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[7][3] ) );
  SDFFQX2M \MEM_reg[7][2]  ( .D(n145), .SI(\MEM[7][1] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[7][2] ) );
  SDFFQX2M \MEM_reg[7][1]  ( .D(n144), .SI(\MEM[7][0] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[7][1] ) );
  SDFFQX2M \MEM_reg[7][0]  ( .D(n143), .SI(\MEM[6][7] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[7][0] ) );
  SDFFQX2M \MEM_reg[3][7]  ( .D(n118), .SI(\MEM[3][6] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[3][7] ) );
  SDFFQX2M \MEM_reg[3][6]  ( .D(n117), .SI(\MEM[3][5] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[3][6] ) );
  SDFFQX2M \MEM_reg[3][5]  ( .D(n116), .SI(\MEM[3][4] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[3][5] ) );
  SDFFQX2M \MEM_reg[3][4]  ( .D(n115), .SI(\MEM[3][3] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[3][4] ) );
  SDFFQX2M \MEM_reg[3][3]  ( .D(n114), .SI(\MEM[3][2] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[3][3] ) );
  SDFFQX2M \MEM_reg[3][2]  ( .D(n113), .SI(\MEM[3][1] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[3][2] ) );
  SDFFQX2M \MEM_reg[3][1]  ( .D(n112), .SI(\MEM[3][0] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[3][1] ) );
  SDFFQX2M \MEM_reg[3][0]  ( .D(n111), .SI(\MEM[2][7] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[3][0] ) );
  SDFFQX2M \MEM_reg[6][7]  ( .D(n142), .SI(\MEM[6][6] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[6][7] ) );
  SDFFQX2M \MEM_reg[6][6]  ( .D(n141), .SI(\MEM[6][5] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[6][6] ) );
  SDFFQX2M \MEM_reg[6][5]  ( .D(n140), .SI(\MEM[6][4] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[6][5] ) );
  SDFFQX2M \MEM_reg[6][4]  ( .D(n139), .SI(\MEM[6][3] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[6][4] ) );
  SDFFQX2M \MEM_reg[6][3]  ( .D(n138), .SI(\MEM[6][2] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[6][3] ) );
  SDFFQX2M \MEM_reg[6][2]  ( .D(n137), .SI(\MEM[6][1] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[6][2] ) );
  SDFFQX2M \MEM_reg[6][1]  ( .D(n136), .SI(\MEM[6][0] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[6][1] ) );
  SDFFQX2M \MEM_reg[6][0]  ( .D(n135), .SI(\MEM[5][7] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[6][0] ) );
  SDFFQX2M \MEM_reg[2][7]  ( .D(n110), .SI(\MEM[2][6] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[2][7] ) );
  SDFFQX2M \MEM_reg[2][6]  ( .D(n109), .SI(\MEM[2][5] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[2][6] ) );
  SDFFQX2M \MEM_reg[2][5]  ( .D(n108), .SI(\MEM[2][4] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[2][5] ) );
  SDFFQX2M \MEM_reg[2][4]  ( .D(n107), .SI(\MEM[2][3] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[2][4] ) );
  SDFFQX2M \MEM_reg[2][3]  ( .D(n106), .SI(\MEM[2][2] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[2][3] ) );
  SDFFQX2M \MEM_reg[2][2]  ( .D(n105), .SI(\MEM[2][1] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[2][2] ) );
  SDFFQX2M \MEM_reg[2][1]  ( .D(n104), .SI(\MEM[2][0] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[2][1] ) );
  SDFFQX2M \MEM_reg[2][0]  ( .D(n103), .SI(\MEM[1][7] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[2][0] ) );
  SDFFQX2M \MEM_reg[4][7]  ( .D(n126), .SI(\MEM[4][6] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[4][7] ) );
  SDFFQX2M \MEM_reg[4][6]  ( .D(n125), .SI(\MEM[4][5] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[4][6] ) );
  SDFFQX2M \MEM_reg[4][5]  ( .D(n124), .SI(\MEM[4][4] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[4][5] ) );
  SDFFQX2M \MEM_reg[4][4]  ( .D(n123), .SI(\MEM[4][3] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[4][4] ) );
  SDFFQX2M \MEM_reg[4][3]  ( .D(n122), .SI(\MEM[4][2] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[4][3] ) );
  SDFFQX2M \MEM_reg[4][2]  ( .D(n121), .SI(\MEM[4][1] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[4][2] ) );
  SDFFQX2M \MEM_reg[4][1]  ( .D(n120), .SI(\MEM[4][0] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[4][1] ) );
  SDFFQX2M \MEM_reg[4][0]  ( .D(n119), .SI(\MEM[3][7] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[4][0] ) );
  SDFFQX2M \MEM_reg[0][7]  ( .D(n94), .SI(\MEM[0][6] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[0][7] ) );
  SDFFQX2M \MEM_reg[0][6]  ( .D(n93), .SI(\MEM[0][5] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[0][6] ) );
  SDFFQX2M \MEM_reg[0][5]  ( .D(n92), .SI(\MEM[0][4] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[0][5] ) );
  SDFFQX2M \MEM_reg[0][4]  ( .D(n91), .SI(test_si2), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[0][4] ) );
  SDFFQX2M \MEM_reg[0][3]  ( .D(n90), .SI(\MEM[0][2] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[0][3] ) );
  SDFFQX2M \MEM_reg[0][2]  ( .D(n89), .SI(\MEM[0][1] ), .SE(n178), .CK(W_CLK), 
        .Q(\MEM[0][2] ) );
  SDFFQX2M \MEM_reg[0][1]  ( .D(n88), .SI(\MEM[0][0] ), .SE(n177), .CK(W_CLK), 
        .Q(\MEM[0][1] ) );
  SDFFQX2M \MEM_reg[0][0]  ( .D(n87), .SI(test_si1), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[0][0] ) );
  SDFFQX1M \MEM_reg[5][7]  ( .D(n134), .SI(\MEM[5][6] ), .SE(n176), .CK(W_CLK), 
        .Q(\MEM[5][7] ) );
  NOR2BX2M U67 ( .AN(n80), .B(WR_ADDR[2]), .Y(n76) );
  BUFX2M U68 ( .A(n83), .Y(n162) );
  BUFX2M U69 ( .A(n84), .Y(n161) );
  BUFX2M U70 ( .A(n85), .Y(n160) );
  NAND3X2M U71 ( .A(n171), .B(n172), .C(n82), .Y(n81) );
  NAND3X2M U72 ( .A(n171), .B(n172), .C(n76), .Y(n75) );
  NAND3X2M U73 ( .A(n76), .B(n171), .C(WR_ADDR[1]), .Y(n78) );
  NAND3X2M U74 ( .A(WR_ADDR[0]), .B(n76), .C(WR_ADDR[1]), .Y(n79) );
  NAND3X2M U75 ( .A(n76), .B(n172), .C(WR_ADDR[0]), .Y(n77) );
  INVX2M U76 ( .A(WR_DATA[0]), .Y(n163) );
  INVX2M U77 ( .A(WR_DATA[1]), .Y(n164) );
  INVX2M U78 ( .A(WR_DATA[2]), .Y(n165) );
  INVX2M U79 ( .A(WR_DATA[3]), .Y(n166) );
  INVX2M U80 ( .A(WR_DATA[4]), .Y(n167) );
  INVX2M U81 ( .A(WR_DATA[5]), .Y(n168) );
  INVX2M U82 ( .A(WR_DATA[6]), .Y(n169) );
  INVX2M U83 ( .A(WR_DATA[7]), .Y(n170) );
  OAI2BB2X1M U84 ( .B0(n75), .B1(n163), .A0N(\MEM[0][0] ), .A1N(n75), .Y(n87)
         );
  OAI2BB2X1M U85 ( .B0(n75), .B1(n164), .A0N(\MEM[0][1] ), .A1N(n75), .Y(n88)
         );
  OAI2BB2X1M U86 ( .B0(n75), .B1(n165), .A0N(\MEM[0][2] ), .A1N(n75), .Y(n89)
         );
  OAI2BB2X1M U87 ( .B0(n75), .B1(n166), .A0N(\MEM[0][3] ), .A1N(n75), .Y(n90)
         );
  OAI2BB2X1M U88 ( .B0(n75), .B1(n167), .A0N(\MEM[0][4] ), .A1N(n75), .Y(n91)
         );
  OAI2BB2X1M U89 ( .B0(n75), .B1(n168), .A0N(\MEM[0][5] ), .A1N(n75), .Y(n92)
         );
  OAI2BB2X1M U90 ( .B0(n75), .B1(n169), .A0N(\MEM[0][6] ), .A1N(n75), .Y(n93)
         );
  OAI2BB2X1M U91 ( .B0(n75), .B1(n170), .A0N(\MEM[0][7] ), .A1N(n75), .Y(n94)
         );
  OAI2BB2X1M U92 ( .B0(n163), .B1(n78), .A0N(\MEM[2][0] ), .A1N(n78), .Y(n103)
         );
  OAI2BB2X1M U93 ( .B0(n164), .B1(n78), .A0N(\MEM[2][1] ), .A1N(n78), .Y(n104)
         );
  OAI2BB2X1M U94 ( .B0(n165), .B1(n78), .A0N(\MEM[2][2] ), .A1N(n78), .Y(n105)
         );
  OAI2BB2X1M U95 ( .B0(n166), .B1(n78), .A0N(\MEM[2][3] ), .A1N(n78), .Y(n106)
         );
  OAI2BB2X1M U96 ( .B0(n167), .B1(n78), .A0N(\MEM[2][4] ), .A1N(n78), .Y(n107)
         );
  OAI2BB2X1M U97 ( .B0(n168), .B1(n78), .A0N(\MEM[2][5] ), .A1N(n78), .Y(n108)
         );
  OAI2BB2X1M U98 ( .B0(n169), .B1(n78), .A0N(\MEM[2][6] ), .A1N(n78), .Y(n109)
         );
  OAI2BB2X1M U99 ( .B0(n170), .B1(n78), .A0N(\MEM[2][7] ), .A1N(n78), .Y(n110)
         );
  OAI2BB2X1M U100 ( .B0(n163), .B1(n79), .A0N(\MEM[3][0] ), .A1N(n79), .Y(n111) );
  OAI2BB2X1M U101 ( .B0(n164), .B1(n79), .A0N(\MEM[3][1] ), .A1N(n79), .Y(n112) );
  OAI2BB2X1M U102 ( .B0(n165), .B1(n79), .A0N(\MEM[3][2] ), .A1N(n79), .Y(n113) );
  OAI2BB2X1M U103 ( .B0(n166), .B1(n79), .A0N(\MEM[3][3] ), .A1N(n79), .Y(n114) );
  OAI2BB2X1M U104 ( .B0(n167), .B1(n79), .A0N(\MEM[3][4] ), .A1N(n79), .Y(n115) );
  OAI2BB2X1M U105 ( .B0(n168), .B1(n79), .A0N(\MEM[3][5] ), .A1N(n79), .Y(n116) );
  OAI2BB2X1M U106 ( .B0(n169), .B1(n79), .A0N(\MEM[3][6] ), .A1N(n79), .Y(n117) );
  OAI2BB2X1M U107 ( .B0(n170), .B1(n79), .A0N(\MEM[3][7] ), .A1N(n79), .Y(n118) );
  OAI2BB2X1M U108 ( .B0(n163), .B1(n77), .A0N(\MEM[1][0] ), .A1N(n77), .Y(n95)
         );
  OAI2BB2X1M U109 ( .B0(n164), .B1(n77), .A0N(\MEM[1][1] ), .A1N(n77), .Y(n96)
         );
  OAI2BB2X1M U110 ( .B0(n165), .B1(n77), .A0N(\MEM[1][2] ), .A1N(n77), .Y(n97)
         );
  OAI2BB2X1M U111 ( .B0(n166), .B1(n77), .A0N(\MEM[1][3] ), .A1N(n77), .Y(n98)
         );
  OAI2BB2X1M U112 ( .B0(n167), .B1(n77), .A0N(\MEM[1][4] ), .A1N(n77), .Y(n99)
         );
  OAI2BB2X1M U113 ( .B0(n168), .B1(n77), .A0N(\MEM[1][5] ), .A1N(n77), .Y(n100) );
  OAI2BB2X1M U114 ( .B0(n169), .B1(n77), .A0N(\MEM[1][6] ), .A1N(n77), .Y(n101) );
  OAI2BB2X1M U115 ( .B0(n170), .B1(n77), .A0N(\MEM[1][7] ), .A1N(n77), .Y(n102) );
  OAI2BB2X1M U116 ( .B0(n163), .B1(n81), .A0N(\MEM[4][0] ), .A1N(n81), .Y(n119) );
  OAI2BB2X1M U117 ( .B0(n164), .B1(n81), .A0N(\MEM[4][1] ), .A1N(n81), .Y(n120) );
  OAI2BB2X1M U118 ( .B0(n165), .B1(n81), .A0N(\MEM[4][2] ), .A1N(n81), .Y(n121) );
  OAI2BB2X1M U119 ( .B0(n166), .B1(n81), .A0N(\MEM[4][3] ), .A1N(n81), .Y(n122) );
  OAI2BB2X1M U120 ( .B0(n167), .B1(n81), .A0N(\MEM[4][4] ), .A1N(n81), .Y(n123) );
  OAI2BB2X1M U121 ( .B0(n168), .B1(n81), .A0N(\MEM[4][5] ), .A1N(n81), .Y(n124) );
  OAI2BB2X1M U122 ( .B0(n169), .B1(n81), .A0N(\MEM[4][6] ), .A1N(n81), .Y(n125) );
  OAI2BB2X1M U123 ( .B0(n170), .B1(n81), .A0N(\MEM[4][7] ), .A1N(n81), .Y(n126) );
  OAI2BB2X1M U124 ( .B0(n163), .B1(n162), .A0N(\MEM[5][0] ), .A1N(n162), .Y(
        n127) );
  OAI2BB2X1M U125 ( .B0(n164), .B1(n162), .A0N(\MEM[5][1] ), .A1N(n162), .Y(
        n128) );
  OAI2BB2X1M U126 ( .B0(n165), .B1(n162), .A0N(\MEM[5][2] ), .A1N(n162), .Y(
        n129) );
  OAI2BB2X1M U127 ( .B0(n166), .B1(n162), .A0N(\MEM[5][3] ), .A1N(n162), .Y(
        n130) );
  OAI2BB2X1M U128 ( .B0(n167), .B1(n162), .A0N(\MEM[5][4] ), .A1N(n162), .Y(
        n131) );
  OAI2BB2X1M U129 ( .B0(n168), .B1(n162), .A0N(\MEM[5][5] ), .A1N(n162), .Y(
        n132) );
  OAI2BB2X1M U130 ( .B0(n169), .B1(n162), .A0N(\MEM[5][6] ), .A1N(n162), .Y(
        n133) );
  OAI2BB2X1M U131 ( .B0(n170), .B1(n162), .A0N(\MEM[5][7] ), .A1N(n162), .Y(
        n134) );
  OAI2BB2X1M U132 ( .B0(n163), .B1(n161), .A0N(\MEM[6][0] ), .A1N(n161), .Y(
        n135) );
  OAI2BB2X1M U133 ( .B0(n164), .B1(n161), .A0N(\MEM[6][1] ), .A1N(n161), .Y(
        n136) );
  OAI2BB2X1M U134 ( .B0(n165), .B1(n161), .A0N(\MEM[6][2] ), .A1N(n161), .Y(
        n137) );
  OAI2BB2X1M U135 ( .B0(n166), .B1(n161), .A0N(\MEM[6][3] ), .A1N(n161), .Y(
        n138) );
  OAI2BB2X1M U136 ( .B0(n167), .B1(n161), .A0N(\MEM[6][4] ), .A1N(n161), .Y(
        n139) );
  OAI2BB2X1M U137 ( .B0(n168), .B1(n161), .A0N(\MEM[6][5] ), .A1N(n161), .Y(
        n140) );
  OAI2BB2X1M U138 ( .B0(n169), .B1(n161), .A0N(\MEM[6][6] ), .A1N(n161), .Y(
        n141) );
  OAI2BB2X1M U139 ( .B0(n170), .B1(n161), .A0N(\MEM[6][7] ), .A1N(n161), .Y(
        n142) );
  OAI2BB2X1M U140 ( .B0(n163), .B1(n160), .A0N(\MEM[7][0] ), .A1N(n160), .Y(
        n143) );
  OAI2BB2X1M U141 ( .B0(n164), .B1(n160), .A0N(\MEM[7][1] ), .A1N(n160), .Y(
        n144) );
  OAI2BB2X1M U142 ( .B0(n165), .B1(n160), .A0N(\MEM[7][2] ), .A1N(n160), .Y(
        n145) );
  OAI2BB2X1M U143 ( .B0(n166), .B1(n160), .A0N(\MEM[7][3] ), .A1N(n160), .Y(
        n146) );
  OAI2BB2X1M U144 ( .B0(n167), .B1(n160), .A0N(\MEM[7][4] ), .A1N(n160), .Y(
        n147) );
  OAI2BB2X1M U145 ( .B0(n168), .B1(n160), .A0N(\MEM[7][5] ), .A1N(n160), .Y(
        n148) );
  OAI2BB2X1M U146 ( .B0(n169), .B1(n160), .A0N(\MEM[7][6] ), .A1N(n160), .Y(
        n149) );
  OAI2BB2X1M U147 ( .B0(n170), .B1(n160), .A0N(\MEM[7][7] ), .A1N(n160), .Y(
        n150) );
  AND2X2M U148 ( .A(WR_ADDR[2]), .B(n80), .Y(n82) );
  NAND3X2M U149 ( .A(WR_ADDR[0]), .B(n172), .C(n82), .Y(n83) );
  NAND3X2M U150 ( .A(WR_ADDR[1]), .B(n171), .C(n82), .Y(n84) );
  NAND3X2M U151 ( .A(WR_ADDR[1]), .B(WR_ADDR[0]), .C(n82), .Y(n85) );
  AND2X2M U152 ( .A(n86), .B(W_INC), .Y(n80) );
  NOR2X2M U153 ( .A(WR_ADDR[3]), .B(FULL), .Y(n86) );
  INVX2M U154 ( .A(WR_ADDR[1]), .Y(n172) );
  INVX2M U155 ( .A(WR_ADDR[0]), .Y(n171) );
  MX2X2M U156 ( .A(n67), .B(n66), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U157 ( .A(\MEM[0][0] ), .B(\MEM[1][0] ), .C(\MEM[2][0] ), .D(
        \MEM[3][0] ), .S0(n159), .S1(N10), .Y(n67) );
  MX4X1M U158 ( .A(\MEM[4][0] ), .B(\MEM[5][0] ), .C(\MEM[6][0] ), .D(
        \MEM[7][0] ), .S0(n158), .S1(N10), .Y(n66) );
  MX2X2M U159 ( .A(n151), .B(n74), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U160 ( .A(\MEM[0][4] ), .B(\MEM[1][4] ), .C(\MEM[2][4] ), .D(
        \MEM[3][4] ), .S0(n159), .S1(N10), .Y(n151) );
  MX4X1M U161 ( .A(\MEM[4][4] ), .B(\MEM[5][4] ), .C(\MEM[6][4] ), .D(
        \MEM[7][4] ), .S0(n158), .S1(N10), .Y(n74) );
  MX2X2M U162 ( .A(n69), .B(n68), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U163 ( .A(\MEM[0][1] ), .B(\MEM[1][1] ), .C(\MEM[2][1] ), .D(
        \MEM[3][1] ), .S0(n159), .S1(N10), .Y(n69) );
  MX4X1M U164 ( .A(\MEM[4][1] ), .B(\MEM[5][1] ), .C(\MEM[6][1] ), .D(
        \MEM[7][1] ), .S0(n158), .S1(N10), .Y(n68) );
  MX2X2M U165 ( .A(n71), .B(n70), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U166 ( .A(\MEM[0][2] ), .B(\MEM[1][2] ), .C(\MEM[2][2] ), .D(
        \MEM[3][2] ), .S0(n159), .S1(N10), .Y(n71) );
  MX4X1M U167 ( .A(\MEM[4][2] ), .B(\MEM[5][2] ), .C(\MEM[6][2] ), .D(
        \MEM[7][2] ), .S0(n158), .S1(N10), .Y(n70) );
  MX2X2M U168 ( .A(n73), .B(n72), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U169 ( .A(\MEM[0][3] ), .B(\MEM[1][3] ), .C(\MEM[2][3] ), .D(
        \MEM[3][3] ), .S0(n159), .S1(N10), .Y(n73) );
  MX4X1M U170 ( .A(\MEM[4][3] ), .B(\MEM[5][3] ), .C(\MEM[6][3] ), .D(
        \MEM[7][3] ), .S0(n158), .S1(N10), .Y(n72) );
  MX2X2M U171 ( .A(n153), .B(n152), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U172 ( .A(\MEM[0][5] ), .B(\MEM[1][5] ), .C(\MEM[2][5] ), .D(
        \MEM[3][5] ), .S0(n159), .S1(N10), .Y(n153) );
  MX4X1M U173 ( .A(\MEM[4][5] ), .B(\MEM[5][5] ), .C(\MEM[6][5] ), .D(
        \MEM[7][5] ), .S0(n158), .S1(N10), .Y(n152) );
  MX2X2M U174 ( .A(n155), .B(n154), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U175 ( .A(\MEM[0][6] ), .B(\MEM[1][6] ), .C(\MEM[2][6] ), .D(
        \MEM[3][6] ), .S0(n159), .S1(N10), .Y(n155) );
  MX4X1M U176 ( .A(\MEM[4][6] ), .B(\MEM[5][6] ), .C(\MEM[6][6] ), .D(
        \MEM[7][6] ), .S0(n158), .S1(N10), .Y(n154) );
  MX2X2M U177 ( .A(n157), .B(n156), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U178 ( .A(\MEM[0][7] ), .B(\MEM[1][7] ), .C(\MEM[2][7] ), .D(
        \MEM[3][7] ), .S0(n159), .S1(N10), .Y(n157) );
  MX4X1M U179 ( .A(\MEM[4][7] ), .B(\MEM[5][7] ), .C(\MEM[6][7] ), .D(
        \MEM[7][7] ), .S0(n158), .S1(N10), .Y(n156) );
  BUFX2M U180 ( .A(N9), .Y(n158) );
  BUFX2M U181 ( .A(N9), .Y(n159) );
  DLY1X1M U182 ( .A(test_se), .Y(n176) );
  DLY1X1M U183 ( .A(test_se), .Y(n177) );
  DLY1X1M U184 ( .A(test_se), .Y(n178) );
endmodule


module FIFO_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 ( WR_DATA, W_INC, R_INC, W_CLK, 
        W_RST, R_CLK, R_RST, FULL, EMPTY, RD_DATA, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_INC, R_INC, W_CLK, W_RST, R_CLK, R_RST, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   n1, n2, n3, n4;
  wire   [4:0] WR_PTR;
  wire   [4:0] SYNC_WR_PTR;
  wire   [4:0] RD_PTR;
  wire   [4:0] SYNC_RD_PTR;
  wire   [3:0] WR_ADDR;
  wire   [3:0] RD_ADDR;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(R_RST), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(W_RST), .Y(n4) );
  DF_SYNC_ADDRESS_WIDTH4_test_0 DUT0 ( .CLK(R_CLK), .RST(n1), .ASYNC({1'b0, 
        WR_PTR[3:0]}), .SYNC({SYNOPSYS_UNCONNECTED__0, SYNC_WR_PTR[3:0]}), 
        .test_si(test_si1), .test_se(test_se) );
  DF_SYNC_ADDRESS_WIDTH4_test_1 DUT1 ( .CLK(W_CLK), .RST(n3), .ASYNC({1'b0, 
        RD_PTR[3:0]}), .SYNC({SYNOPSYS_UNCONNECTED__1, SYNC_RD_PTR[3:0]}), 
        .test_si(SYNC_WR_PTR[3]), .test_se(test_se) );
  FIFO_WR_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 DUT2 ( .W_INC(W_INC), .W_CLK(W_CLK), .W_RST(n3), .SYNC_RD_PTR({1'b0, SYNC_RD_PTR[3:0]}), .WR_ADDR(WR_ADDR), 
        .WR_PTR({SYNOPSYS_UNCONNECTED__2, WR_PTR[3:0]}), .FULL(FULL), 
        .test_se(test_se) );
  FIFO_RD_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 DUT3 ( .R_INC(R_INC), .R_CLK(R_CLK), .R_RST(n1), .SYNC_WR_PTR({1'b0, SYNC_WR_PTR[3:0]}), .RD_ADDR(RD_ADDR), 
        .RD_PTR({SYNOPSYS_UNCONNECTED__3, RD_PTR[3:0]}), .EMPTY(EMPTY), 
        .test_si(WR_PTR[3]), .test_se(test_se) );
  FIFO_MEM_CNTRL_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 DUT4 ( .WR_DATA(WR_DATA), 
        .WR_ADDR(WR_ADDR), .RD_ADDR(RD_ADDR), .W_INC(W_INC), .R_INC(R_INC), 
        .W_CLK(W_CLK), .R_CLK(R_CLK), .FULL(FULL), .RD_DATA(RD_DATA), 
        .test_si2(test_si2), .test_si1(RD_PTR[3]), .test_so2(test_so2), 
        .test_so1(test_so1), .test_se(test_se) );
endmodule


module PULSE_GEN_test_1 ( CLK, RST, LVL_SIG, PULSE_SIG, test_si, test_so, 
        test_se );
  input CLK, RST, LVL_SIG, test_si, test_se;
  output PULSE_SIG, test_so;
  wire   FLOP_OUT, FLOP_IN;
  assign test_so = FLOP_OUT;

  SDFFRQX2M FLOP_IN_reg ( .D(LVL_SIG), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(FLOP_IN) );
  SDFFRQX2M FLOP_OUT_reg ( .D(FLOP_IN), .SI(FLOP_IN), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(FLOP_OUT) );
  NOR2BX2M U5 ( .AN(FLOP_IN), .B(FLOP_OUT), .Y(PULSE_SIG) );
endmodule


module fsm_test_1 ( clk, rst, rx_in, par_en, bit_count, edge_count, par_error, 
        str_glitch, stp_error, prescale, par_chk_en, str_chk_en, stp_chk_en, 
        data_sample_en, counter_en, deser_en, data_valid, test_si, test_so, 
        test_se );
  input [3:0] bit_count;
  input [4:0] edge_count;
  input [5:0] prescale;
  input clk, rst, rx_in, par_en, par_error, str_glitch, stp_error, test_si,
         test_se;
  output par_chk_en, str_chk_en, stp_chk_en, data_sample_en, counter_en,
         deser_en, data_valid, test_so;
  wire   n30, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, \r91/EQ ,
         \r91/B[0] , \r91/B[1] , \r91/B[2] , \r91/B[3] , \r91/B[4] ,
         \r91/B[5] , \r91/B[9] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n16), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(rst), .Q(current_state[0]) );
  SDFFRX1M \current_state_reg[2]  ( .D(next_state[2]), .SI(current_state[1]), 
        .SE(test_se), .CK(clk), .RN(rst), .Q(test_so), .QN(n30) );
  NOR2X2M U6 ( .A(n15), .B(n17), .Y(deser_en) );
  INVX2M U7 ( .A(\r91/EQ ), .Y(n15) );
  NOR3X2M U8 ( .A(n15), .B(n16), .C(n35), .Y(par_chk_en) );
  NOR2X2M U9 ( .A(n33), .B(n15), .Y(stp_chk_en) );
  INVX2M U10 ( .A(n40), .Y(n17) );
  OR2X2M U11 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  OAI222X1M U12 ( .A0(\r91/EQ ), .A1(n33), .B0(n17), .B1(n34), .C0(par_error), 
        .C1(n14), .Y(next_state[2]) );
  INVX2M U13 ( .A(par_chk_en), .Y(n14) );
  OAI2B2X1M U14 ( .A1N(str_chk_en), .A0(str_glitch), .B0(n36), .B1(n35), .Y(
        next_state[1]) );
  AOI22X1M U15 ( .A0(n34), .A1(n16), .B0(current_state[0]), .B1(n15), .Y(n36)
         );
  NOR3X2M U16 ( .A(n38), .B(current_state[1]), .C(n15), .Y(str_chk_en) );
  OAI21X2M U17 ( .A0(\r91/EQ ), .A1(n38), .B0(n39), .Y(next_state[0]) );
  AOI31X2M U18 ( .A0(n40), .A1(n37), .A2(par_en), .B0(n41), .Y(n39) );
  NOR4X1M U19 ( .A(rx_in), .B(current_state[1]), .C(current_state[0]), .D(n42), 
        .Y(n41) );
  AOI2BB1X2M U20 ( .A0N(stp_error), .A1N(n15), .B0(n30), .Y(n42) );
  NOR3BX2M U21 ( .AN(stp_chk_en), .B(stp_error), .C(par_error), .Y(data_valid)
         );
  NAND2X2M U22 ( .A(current_state[1]), .B(n30), .Y(n35) );
  NOR2X2M U23 ( .A(n35), .B(current_state[0]), .Y(n40) );
  NAND2X2M U24 ( .A(current_state[0]), .B(n30), .Y(n38) );
  OR3X2M U25 ( .A(current_state[1]), .B(current_state[0]), .C(n30), .Y(n33) );
  NOR4BBX1M U26 ( .AN(bit_count[3]), .BN(bit_count[0]), .C(bit_count[2]), .D(
        bit_count[1]), .Y(n37) );
  INVX2M U27 ( .A(current_state[0]), .Y(n16) );
  NAND2BX2M U28 ( .AN(par_en), .B(n37), .Y(n34) );
  BUFX2M U29 ( .A(counter_en), .Y(data_sample_en) );
  NAND3X2M U30 ( .A(n33), .B(n35), .C(n38), .Y(counter_en) );
  CLKINVX1M U31 ( .A(prescale[0]), .Y(\r91/B[0] ) );
  OAI2BB1X1M U32 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(
        \r91/B[1] ) );
  OR2X1M U33 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U34 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(\r91/B[2] ) );
  OR2X1M U35 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U36 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(\r91/B[3] ) );
  OR2X1M U37 ( .A(n4), .B(prescale[4]), .Y(n5) );
  OAI2BB1X1M U38 ( .A0N(n4), .A1N(prescale[4]), .B0(n5), .Y(\r91/B[4] ) );
  NOR2X1M U39 ( .A(n5), .B(prescale[5]), .Y(\r91/B[9] ) );
  AO21XLM U40 ( .A0(n5), .A1(prescale[5]), .B0(\r91/B[9] ), .Y(\r91/B[5] ) );
  NOR2BX1M U41 ( .AN(edge_count[0]), .B(\r91/B[0] ), .Y(n6) );
  OAI2B2X1M U42 ( .A1N(\r91/B[1] ), .A0(n6), .B0(edge_count[1]), .B1(n6), .Y(
        n9) );
  NOR2BX1M U43 ( .AN(\r91/B[0] ), .B(edge_count[0]), .Y(n7) );
  OAI2B2X1M U44 ( .A1N(edge_count[1]), .A0(n7), .B0(\r91/B[1] ), .B1(n7), .Y(
        n8) );
  NAND4BBX1M U45 ( .AN(\r91/B[9] ), .BN(\r91/B[5] ), .C(n9), .D(n8), .Y(n13)
         );
  CLKXOR2X2M U46 ( .A(\r91/B[4] ), .B(edge_count[4]), .Y(n12) );
  CLKXOR2X2M U47 ( .A(\r91/B[2] ), .B(edge_count[2]), .Y(n11) );
  CLKXOR2X2M U48 ( .A(\r91/B[3] ), .B(edge_count[3]), .Y(n10) );
  NOR4X1M U49 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(\r91/EQ ) );
endmodule


module counter_test_1 ( clk, rst, counter_en, prescale, par_en, bit_count, 
        edge_count, test_si, test_se );
  input [5:0] prescale;
  output [3:0] bit_count;
  output [4:0] edge_count;
  input clk, rst, counter_en, par_en, test_si, test_se;
  wire   N5, N7, N8, N9, N10, N11, N12, N14, N19, N20, N21, N22, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, \add_22/carry[4] , \add_22/carry[3] ,
         \add_22/carry[2] , n1, n2, n3, n4, n5, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n44, n45, n46, n47, n48, n49, n50, n51, n52;

  SDFFRQX2M \bit_count_reg[0]  ( .D(n38), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(bit_count[0]) );
  SDFFRQX2M \bit_count_reg[3]  ( .D(n36), .SI(n50), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(bit_count[3]) );
  SDFFRQX2M \bit_count_reg[2]  ( .D(n46), .SI(bit_count[1]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(bit_count[2]) );
  SDFFRQX2M \bit_count_reg[1]  ( .D(n37), .SI(n48), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(bit_count[1]) );
  SDFFRQX2M \edge_count_reg[4]  ( .D(n42), .SI(edge_count[3]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(edge_count[4]) );
  SDFFRQX2M \edge_count_reg[3]  ( .D(n39), .SI(edge_count[2]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(edge_count[3]) );
  SDFFRQX2M \edge_count_reg[2]  ( .D(n40), .SI(edge_count[1]), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(edge_count[2]) );
  SDFFRQX2M \edge_count_reg[0]  ( .D(n43), .SI(n51), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(edge_count[0]) );
  SDFFRQX2M \edge_count_reg[1]  ( .D(n41), .SI(n23), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(edge_count[1]) );
  OAI33X2M U6 ( .A0(n32), .A1(n49), .A2(n52), .B0(n33), .B1(n48), .B2(n51), 
        .Y(n29) );
  NOR2X2M U7 ( .A(n44), .B(n45), .Y(n34) );
  INVX2M U14 ( .A(n35), .Y(n44) );
  INVX2M U15 ( .A(n31), .Y(n45) );
  NAND3X2M U16 ( .A(counter_en), .B(n35), .C(N14), .Y(n31) );
  NOR3X2M U17 ( .A(n29), .B(n48), .C(n31), .Y(n26) );
  AOI21X2M U18 ( .A0(n48), .A1(n47), .B0(n31), .Y(n30) );
  NAND2X2M U19 ( .A(counter_en), .B(N12), .Y(n35) );
  OAI2BB2X1M U20 ( .B0(n30), .B1(n49), .A0N(n49), .A1N(n26), .Y(n37) );
  INVX2M U21 ( .A(n29), .Y(n47) );
  OAI21X2M U22 ( .A0(bit_count[1]), .A1(n29), .B0(n30), .Y(n27) );
  OAI21X2M U23 ( .A0(n24), .A1(n51), .B0(n25), .Y(n36) );
  NAND4X2M U24 ( .A(bit_count[2]), .B(n26), .C(bit_count[1]), .D(n51), .Y(n25)
         );
  AOI21X2M U25 ( .A0(n47), .A1(n50), .B0(n27), .Y(n24) );
  OR2X2M U26 ( .A(prescale[1]), .B(prescale[0]), .Y(n2) );
  INVX2M U27 ( .A(n28), .Y(n46) );
  AOI32X1M U28 ( .A0(n26), .A1(n50), .A2(bit_count[1]), .B0(n27), .B1(
        bit_count[2]), .Y(n28) );
  OAI32X1M U29 ( .A0(n31), .A1(bit_count[0]), .A2(n29), .B0(n45), .B1(n48), 
        .Y(n38) );
  AOI21BX2M U30 ( .A0(prescale[0]), .A1(prescale[1]), .B0N(n2), .Y(n1) );
  AO22X1M U31 ( .A0(edge_count[1]), .A1(n34), .B0(N19), .B1(n44), .Y(n41) );
  AO22X1M U32 ( .A0(edge_count[2]), .A1(n34), .B0(N20), .B1(n44), .Y(n40) );
  AO22X1M U33 ( .A0(edge_count[3]), .A1(n34), .B0(N21), .B1(n44), .Y(n39) );
  AO22X1M U34 ( .A0(edge_count[4]), .A1(n34), .B0(N22), .B1(n44), .Y(n42) );
  AO22X1M U35 ( .A0(edge_count[0]), .A1(n34), .B0(n23), .B1(n44), .Y(n43) );
  INVX2M U36 ( .A(edge_count[0]), .Y(n23) );
  NAND3X2M U37 ( .A(n48), .B(n50), .C(bit_count[3]), .Y(n32) );
  NAND3X2M U38 ( .A(n50), .B(n52), .C(n49), .Y(n33) );
  INVX2M U39 ( .A(par_en), .Y(n52) );
  INVX2M U40 ( .A(bit_count[2]), .Y(n50) );
  INVX2M U41 ( .A(bit_count[0]), .Y(n48) );
  INVX2M U42 ( .A(bit_count[1]), .Y(n49) );
  INVX2M U43 ( .A(bit_count[3]), .Y(n51) );
  ADDHX1M U44 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_22/carry[2] ), 
        .S(N19) );
  ADDHX1M U45 ( .A(edge_count[2]), .B(\add_22/carry[2] ), .CO(
        \add_22/carry[3] ), .S(N20) );
  ADDHX1M U46 ( .A(edge_count[3]), .B(\add_22/carry[3] ), .CO(
        \add_22/carry[4] ), .S(N21) );
  CLKINVX1M U47 ( .A(prescale[0]), .Y(N5) );
  OR2X1M U48 ( .A(n2), .B(prescale[2]), .Y(n3) );
  OAI2BB1X1M U49 ( .A0N(n2), .A1N(prescale[2]), .B0(n3), .Y(N7) );
  OR2X1M U50 ( .A(n3), .B(prescale[3]), .Y(n4) );
  OAI2BB1X1M U51 ( .A0N(n3), .A1N(prescale[3]), .B0(n4), .Y(N8) );
  OR2X1M U52 ( .A(n4), .B(prescale[4]), .Y(n5) );
  OAI2BB1X1M U53 ( .A0N(n4), .A1N(prescale[4]), .B0(n5), .Y(N9) );
  NOR2X1M U54 ( .A(n5), .B(prescale[5]), .Y(N11) );
  AO21XLM U55 ( .A0(n5), .A1(prescale[5]), .B0(N11), .Y(N10) );
  CLKXOR2X2M U56 ( .A(\add_22/carry[4] ), .B(edge_count[4]), .Y(N22) );
  XNOR2X1M U57 ( .A(N8), .B(edge_count[3]), .Y(n22) );
  XNOR2X1M U58 ( .A(N7), .B(edge_count[2]), .Y(n21) );
  XNOR2X1M U59 ( .A(N9), .B(edge_count[4]), .Y(n20) );
  NOR2X1M U60 ( .A(n23), .B(N5), .Y(n15) );
  OAI22X1M U61 ( .A0(edge_count[1]), .A1(n15), .B0(n15), .B1(n1), .Y(n18) );
  CLKNAND2X2M U62 ( .A(N5), .B(n23), .Y(n16) );
  AOI22X1M U63 ( .A0(n16), .A1(n1), .B0(n16), .B1(edge_count[1]), .Y(n17) );
  NOR4BX1M U64 ( .AN(n18), .B(N11), .C(N10), .D(n17), .Y(n19) );
  NAND4X1M U65 ( .A(n22), .B(n21), .C(n20), .D(n19), .Y(N12) );
  CLKINVX1M U66 ( .A(N12), .Y(N14) );
endmodule


module data_sampling_test_1 ( clk, rst, rx_in, prescale, edge_count, 
        data_sample_en, sampled_bit, test_so, test_se );
  input [5:0] prescale;
  input [4:0] edge_count;
  input clk, rst, rx_in, data_sample_en, test_se;
  output sampled_bit, test_so;
  wire   sample_1, sample_2, sample_3, N6, N7, N8, N9, N10, N11, N12, N13, N15,
         N16, N17, N18, N19, N20, n15, n16, n17, n18, n19, n20, n21, n22,
         \add_34/carry[4] , \add_34/carry[3] , \add_34/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n14, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  assign test_so = sample_3;

  SDFFRQX2M sample_3_reg ( .D(n20), .SI(sample_2), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(sample_3) );
  SDFFRQX2M sample_2_reg ( .D(n21), .SI(sample_1), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(sample_2) );
  SDFFRQX2M sample_1_reg ( .D(n22), .SI(edge_count[4]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(sample_1) );
  NOR2BX2M U4 ( .AN(data_sample_en), .B(N12), .Y(n17) );
  INVX2M U5 ( .A(rx_in), .Y(n39) );
  OAI2BB2X1M U6 ( .B0(n39), .B1(n19), .A0N(n19), .A1N(sample_1), .Y(n22) );
  NAND2X2M U7 ( .A(N12), .B(data_sample_en), .Y(n19) );
  OAI2BB2X1M U8 ( .B0(n39), .B1(n18), .A0N(n18), .A1N(sample_2), .Y(n21) );
  NAND2X2M U11 ( .A(N13), .B(n17), .Y(n18) );
  OAI2BB2X1M U12 ( .B0(n16), .B1(n39), .A0N(n16), .A1N(sample_3), .Y(n20) );
  NAND3BX2M U13 ( .AN(N13), .B(n17), .C(N20), .Y(n16) );
  OR2X2M U14 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  ADDHX1M U15 ( .A(prescale[5]), .B(\add_34/carry[4] ), .CO(N19), .S(N18) );
  ADDHX1M U16 ( .A(prescale[4]), .B(\add_34/carry[3] ), .CO(\add_34/carry[4] ), 
        .S(N17) );
  ADDHX1M U17 ( .A(prescale[3]), .B(\add_34/carry[2] ), .CO(\add_34/carry[3] ), 
        .S(N16) );
  ADDHX1M U18 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_34/carry[2] ), .S(
        N15) );
  OAI2BB1X2M U19 ( .A0N(sample_1), .A1N(sample_2), .B0(n15), .Y(sampled_bit)
         );
  OAI21X2M U20 ( .A0(sample_1), .A1(sample_2), .B0(sample_3), .Y(n15) );
  CLKINVX1M U21 ( .A(prescale[1]), .Y(N6) );
  OAI2BB1X1M U22 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n1), .Y(N7) );
  OR2X1M U23 ( .A(n1), .B(prescale[3]), .Y(n2) );
  OAI2BB1X1M U24 ( .A0N(n1), .A1N(prescale[3]), .B0(n2), .Y(N8) );
  XNOR2X1M U25 ( .A(prescale[4]), .B(n2), .Y(N9) );
  NOR3X1M U26 ( .A(prescale[4]), .B(prescale[5]), .C(n2), .Y(N11) );
  OAI21X1M U27 ( .A0(prescale[4]), .A1(n2), .B0(prescale[5]), .Y(n3) );
  NAND2BX1M U28 ( .AN(N11), .B(n3), .Y(N10) );
  NOR2BX1M U29 ( .AN(N6), .B(edge_count[0]), .Y(n4) );
  OAI2B2X1M U30 ( .A1N(edge_count[1]), .A0(n4), .B0(N7), .B1(n4), .Y(n7) );
  NOR2BX1M U31 ( .AN(edge_count[0]), .B(N6), .Y(n5) );
  OAI2B2X1M U32 ( .A1N(N7), .A0(n5), .B0(edge_count[1]), .B1(n5), .Y(n6) );
  NAND3BX1M U33 ( .AN(N11), .B(n7), .C(n6), .Y(n14) );
  CLKXOR2X2M U34 ( .A(N10), .B(edge_count[4]), .Y(n10) );
  CLKXOR2X2M U35 ( .A(N8), .B(edge_count[2]), .Y(n9) );
  CLKXOR2X2M U36 ( .A(N9), .B(edge_count[3]), .Y(n8) );
  NOR4X1M U37 ( .A(n14), .B(n10), .C(n9), .D(n8), .Y(N12) );
  CLKXOR2X2M U38 ( .A(prescale[3]), .B(edge_count[2]), .Y(n30) );
  NOR2BX1M U39 ( .AN(prescale[1]), .B(edge_count[0]), .Y(n23) );
  OAI2B2X1M U40 ( .A1N(edge_count[1]), .A0(n23), .B0(prescale[2]), .B1(n23), 
        .Y(n26) );
  NOR2BX1M U41 ( .AN(edge_count[0]), .B(prescale[1]), .Y(n24) );
  OAI2B2X1M U42 ( .A1N(prescale[2]), .A0(n24), .B0(edge_count[1]), .B1(n24), 
        .Y(n25) );
  CLKNAND2X2M U43 ( .A(n26), .B(n25), .Y(n29) );
  CLKXOR2X2M U44 ( .A(prescale[4]), .B(edge_count[3]), .Y(n28) );
  CLKXOR2X2M U45 ( .A(prescale[5]), .B(edge_count[4]), .Y(n27) );
  NOR4X1M U46 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(N13) );
  NOR2BX1M U47 ( .AN(N6), .B(edge_count[0]), .Y(n31) );
  OAI2B2X1M U48 ( .A1N(edge_count[1]), .A0(n31), .B0(N15), .B1(n31), .Y(n34)
         );
  NOR2BX1M U49 ( .AN(edge_count[0]), .B(N6), .Y(n32) );
  OAI2B2X1M U50 ( .A1N(N15), .A0(n32), .B0(edge_count[1]), .B1(n32), .Y(n33)
         );
  NAND3BX1M U51 ( .AN(N19), .B(n34), .C(n33), .Y(n38) );
  CLKXOR2X2M U52 ( .A(N18), .B(edge_count[4]), .Y(n37) );
  CLKXOR2X2M U53 ( .A(N16), .B(edge_count[2]), .Y(n36) );
  CLKXOR2X2M U54 ( .A(N17), .B(edge_count[3]), .Y(n35) );
  NOR4X1M U55 ( .A(n38), .B(n37), .C(n36), .D(n35), .Y(N20) );
endmodule


module parity_check_test_1 ( clk, rst, p_data, par_typ, par_chk_en, 
        sampled_bit, par_error, test_si, test_se );
  input [7:0] p_data;
  input clk, rst, par_typ, par_chk_en, sampled_bit, test_si, test_se;
  output par_error;
  wire   par_bit, N6, n3, n4, n5, n6, n8, n1;

  SDFFRQX2M par_bit_reg ( .D(N6), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(par_bit) );
  SDFFRQX2M par_error_reg ( .D(n8), .SI(par_bit), .SE(test_se), .CK(clk), .RN(
        rst), .Q(par_error) );
  AO2B2X2M U3 ( .B0(n1), .B1(par_chk_en), .A0(par_error), .A1N(par_chk_en), 
        .Y(n8) );
  CLKXOR2X2M U4 ( .A(sampled_bit), .B(par_bit), .Y(n1) );
  XNOR2X2M U5 ( .A(p_data[7]), .B(p_data[6]), .Y(n6) );
  XOR3XLM U6 ( .A(par_typ), .B(n3), .C(n4), .Y(N6) );
  XOR3XLM U7 ( .A(p_data[1]), .B(p_data[0]), .C(n5), .Y(n4) );
  XOR3XLM U8 ( .A(p_data[5]), .B(p_data[4]), .C(n6), .Y(n3) );
  XNOR2X2M U9 ( .A(p_data[3]), .B(p_data[2]), .Y(n5) );
endmodule


module start_check_test_1 ( clk, rst, str_chk_en, sampled_bit, str_glitch, 
        test_si, test_se );
  input clk, rst, str_chk_en, sampled_bit, test_si, test_se;
  output str_glitch;
  wire   n2;

  SDFFRQX2M str_glitch_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(str_glitch) );
  AO2B2X2M U2 ( .B0(str_chk_en), .B1(sampled_bit), .A0(str_glitch), .A1N(
        str_chk_en), .Y(n2) );
endmodule


module stop_check_test_1 ( clk, rst, stp_chk_en, sampled_bit, stp_error, 
        test_si, test_se );
  input clk, rst, stp_chk_en, sampled_bit, test_si, test_se;
  output stp_error;
  wire   n3, n2;

  SDFFRQX2M stp_error_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        rst), .Q(stp_error) );
  OAI2BB2X1M U4 ( .B0(sampled_bit), .B1(n2), .A0N(stp_error), .A1N(n2), .Y(n3)
         );
  INVX2M U5 ( .A(stp_chk_en), .Y(n2) );
endmodule


module deserializer_test_1 ( clk, rst, deser_en, sampled_bit, p_data, test_si, 
        test_se );
  output [7:0] p_data;
  input clk, rst, deser_en, sampled_bit, test_si, test_se;
  wire   n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n14, n15, n16, n17, n19, n54;
  wire   [3:0] counter;

  SDFFRQX2M \p_data_reg[5]  ( .D(n47), .SI(p_data[4]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[5]) );
  SDFFRQX2M \p_data_reg[1]  ( .D(n43), .SI(n18), .SE(test_se), .CK(clk), .RN(
        rst), .Q(p_data[1]) );
  SDFFRQX2M \p_data_reg[4]  ( .D(n46), .SI(p_data[3]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[4]) );
  SDFFRQX2M \p_data_reg[7]  ( .D(n49), .SI(p_data[6]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[7]) );
  SDFFRQX2M \p_data_reg[3]  ( .D(n45), .SI(p_data[2]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[3]) );
  SDFFRQX2M \p_data_reg[6]  ( .D(n48), .SI(p_data[5]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[6]) );
  SDFFRQX2M \p_data_reg[2]  ( .D(n44), .SI(p_data[1]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[2]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n52), .SI(counter[2]), .SE(test_se), .CK(clk), .RN(rst), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n51), .SI(n15), .SE(test_se), .CK(clk), .RN(
        rst), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n53), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n50), .SI(n17), .SE(test_se), .CK(clk), .RN(
        rst), .Q(counter[2]) );
  SDFFRX1M \p_data_reg[0]  ( .D(n42), .SI(counter[3]), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(p_data[0]), .QN(n18) );
  NOR2X2M U16 ( .A(n15), .B(counter[1]), .Y(n25) );
  NOR2X2M U17 ( .A(n17), .B(counter[0]), .Y(n24) );
  NAND2X2M U18 ( .A(deser_en), .B(n41), .Y(n40) );
  NAND2X2M U19 ( .A(n31), .B(n16), .Y(n34) );
  OAI2BB2X1M U20 ( .B0(n37), .B1(n17), .A0N(n38), .A1N(n25), .Y(n51) );
  NAND2X2M U21 ( .A(n40), .B(n41), .Y(n38) );
  INVX2M U22 ( .A(n36), .Y(n14) );
  INVX2M U23 ( .A(sampled_bit), .Y(n54) );
  INVX2M U24 ( .A(n23), .Y(n16) );
  NOR3X2M U25 ( .A(n40), .B(counter[3]), .C(n19), .Y(n31) );
  OAI2BB2X1M U26 ( .B0(n54), .B1(n34), .A0N(p_data[7]), .A1N(n34), .Y(n49) );
  NOR2X2M U27 ( .A(n14), .B(counter[3]), .Y(n27) );
  OAI21X2M U28 ( .A0(counter[1]), .A1(n40), .B0(n37), .Y(n35) );
  OAI22X1M U29 ( .A0(n15), .A1(n38), .B0(counter[0]), .B1(n40), .Y(n53) );
  NOR2X2M U30 ( .A(n40), .B(counter[2]), .Y(n36) );
  OAI2BB2X1M U31 ( .B0(n54), .B1(n29), .A0N(p_data[3]), .A1N(n29), .Y(n45) );
  NAND2X2M U32 ( .A(n16), .B(n27), .Y(n29) );
  OAI2BB2X1M U33 ( .B0(n54), .B1(n26), .A0N(p_data[1]), .A1N(n26), .Y(n43) );
  NAND2X2M U34 ( .A(n27), .B(n25), .Y(n26) );
  OAI2BB2X1M U35 ( .B0(n54), .B1(n28), .A0N(p_data[2]), .A1N(n28), .Y(n44) );
  NAND2X2M U36 ( .A(n24), .B(n27), .Y(n28) );
  OAI2BB2X1M U37 ( .B0(n54), .B1(n30), .A0N(p_data[4]), .A1N(n30), .Y(n46) );
  NAND3X2M U38 ( .A(n15), .B(n17), .C(n31), .Y(n30) );
  OAI2BB2X1M U39 ( .B0(n54), .B1(n32), .A0N(p_data[5]), .A1N(n32), .Y(n47) );
  NAND2X2M U40 ( .A(n31), .B(n25), .Y(n32) );
  OAI2BB2X1M U41 ( .B0(n54), .B1(n33), .A0N(p_data[6]), .A1N(n33), .Y(n48) );
  NAND2X2M U42 ( .A(n31), .B(n24), .Y(n33) );
  OAI2BB2X1M U43 ( .B0(n14), .B1(n23), .A0N(n35), .A1N(counter[2]), .Y(n50) );
  OAI2B1X2M U44 ( .A1N(counter[3]), .A0(n39), .B0(n34), .Y(n52) );
  NOR2X2M U45 ( .A(n36), .B(n35), .Y(n39) );
  OA21X2M U46 ( .A0(counter[0]), .A1(n40), .B0(n38), .Y(n37) );
  NAND2BX2M U47 ( .AN(n20), .B(n21), .Y(n42) );
  NAND4X2M U48 ( .A(n22), .B(sampled_bit), .C(deser_en), .D(n23), .Y(n21) );
  AOI31X2M U49 ( .A0(n22), .A1(n23), .A2(deser_en), .B0(n18), .Y(n20) );
  NOR4X1M U50 ( .A(n24), .B(n25), .C(counter[2]), .D(counter[3]), .Y(n22) );
  NAND4X2M U51 ( .A(counter[3]), .B(n15), .C(n17), .D(n19), .Y(n41) );
  INVX2M U52 ( .A(counter[0]), .Y(n15) );
  INVX2M U53 ( .A(counter[1]), .Y(n17) );
  INVX2M U54 ( .A(counter[2]), .Y(n19) );
  NAND2X2M U55 ( .A(counter[1]), .B(counter[0]), .Y(n23) );
endmodule


module UART_RX_test_1 ( clk, rst, rx_in, par_en, par_typ, prescale, data_valid, 
        par_error, stp_error, p_data, test_si, test_se );
  input [5:0] prescale;
  output [7:0] p_data;
  input clk, rst, rx_in, par_en, par_typ, test_si, test_se;
  output data_valid, par_error, stp_error;
  wire   str_glitch, par_chk_en, str_chk_en, stp_chk_en, data_sample_en,
         counter_en, deser_en, sampled_bit, n1, n2, n3, n4;
  wire   [3:0] bit_count;
  wire   [4:0] edge_count;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rst), .Y(n2) );
  fsm_test_1 DUT0 ( .clk(clk), .rst(n1), .rx_in(rx_in), .par_en(par_en), 
        .bit_count(bit_count), .edge_count(edge_count), .par_error(par_error), 
        .str_glitch(str_glitch), .stp_error(stp_error), .prescale(prescale), 
        .par_chk_en(par_chk_en), .str_chk_en(str_chk_en), .stp_chk_en(
        stp_chk_en), .data_sample_en(data_sample_en), .counter_en(counter_en), 
        .deser_en(deser_en), .data_valid(data_valid), .test_si(test_si), 
        .test_so(n4), .test_se(test_se) );
  counter_test_1 DUT1 ( .clk(clk), .rst(n1), .counter_en(counter_en), 
        .prescale(prescale), .par_en(par_en), .bit_count(bit_count), 
        .edge_count(edge_count), .test_si(n4), .test_se(test_se) );
  data_sampling_test_1 DUT2 ( .clk(clk), .rst(n1), .rx_in(rx_in), .prescale(
        prescale), .edge_count(edge_count), .data_sample_en(data_sample_en), 
        .sampled_bit(sampled_bit), .test_so(n3), .test_se(test_se) );
  parity_check_test_1 DUT3 ( .clk(clk), .rst(n1), .p_data(p_data), .par_typ(
        par_typ), .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), 
        .par_error(par_error), .test_si(n3), .test_se(test_se) );
  start_check_test_1 DUT4 ( .clk(clk), .rst(n1), .str_chk_en(str_chk_en), 
        .sampled_bit(sampled_bit), .str_glitch(str_glitch), .test_si(par_error), .test_se(test_se) );
  stop_check_test_1 DUT5 ( .clk(clk), .rst(n1), .stp_chk_en(stp_chk_en), 
        .sampled_bit(sampled_bit), .stp_error(stp_error), .test_si(str_glitch), 
        .test_se(test_se) );
  deserializer_test_1 DUT6 ( .clk(clk), .rst(n1), .deser_en(deser_en), 
        .sampled_bit(sampled_bit), .p_data(p_data), .test_si(stp_error), 
        .test_se(test_se) );
endmodule


module serializer_WIDTH8_test_1 ( CLK, RST, P_DATA, DATA_VALID, SER_EN, 
        SER_DATA, SER_DONE, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, SER_EN, test_si, test_se;
  output SER_DATA, SER_DONE, test_so;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n14, n15, n16, n17, n18, n52, n53, n54, n55,
         n56, n57;
  wire   [3:0] counter;
  wire   [7:0] REG;
  assign test_so = counter[3];

  SDFFRQX2M SER_DATA_reg ( .D(n39), .SI(n52), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(SER_DATA) );
  SDFFRQX2M \REG_reg[4]  ( .D(n44), .SI(n55), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(REG[4]) );
  SDFFRQX2M \REG_reg[0]  ( .D(n40), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[0]) );
  SDFFSQX2M \counter_reg[3]  ( .D(n50), .SI(n18), .SE(test_se), .CK(CLK), .SN(
        RST), .Q(counter[3]) );
  SDFFRX1M \REG_reg[6]  ( .D(n46), .SI(n54), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(n53), .QN(n20) );
  SDFFRX1M \REG_reg[2]  ( .D(n42), .SI(n57), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(n56), .QN(n23) );
  SDFFRX1M \REG_reg[5]  ( .D(n45), .SI(REG[4]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n54), .QN(n21) );
  SDFFRX1M \REG_reg[1]  ( .D(n41), .SI(REG[0]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(n57), .QN(n24) );
  SDFFRX1M \REG_reg[7]  ( .D(n47), .SI(n53), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(n52), .QN(n19) );
  SDFFRX1M \REG_reg[3]  ( .D(n43), .SI(n56), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(n55), .QN(n22) );
  SDFFRQX2M \counter_reg[2]  ( .D(n48), .SI(n17), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n49), .SI(n16), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n51), .SI(SER_DATA), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(counter[0]) );
  INVX2M U16 ( .A(n34), .Y(n14) );
  NAND2X2M U17 ( .A(DATA_VALID), .B(n26), .Y(n34) );
  NAND2X2M U18 ( .A(n26), .B(n34), .Y(n38) );
  OAI21X2M U19 ( .A0(n17), .A1(n26), .B0(n36), .Y(n35) );
  NAND2BX2M U20 ( .AN(SER_DONE), .B(SER_EN), .Y(n26) );
  OAI22X1M U21 ( .A0(n36), .A1(n17), .B0(n29), .B1(n26), .Y(n49) );
  NAND2X2M U22 ( .A(n16), .B(n17), .Y(n29) );
  OA21X2M U23 ( .A0(n16), .A1(n26), .B0(n38), .Y(n36) );
  OAI32X1M U24 ( .A0(n26), .A1(counter[2]), .A2(n29), .B0(n15), .B1(n18), .Y(
        n48) );
  INVX2M U25 ( .A(n35), .Y(n15) );
  NOR3X2M U26 ( .A(counter[2]), .B(counter[3]), .C(n29), .Y(SER_DONE) );
  OAI22X1M U27 ( .A0(n16), .A1(n38), .B0(counter[0]), .B1(n26), .Y(n51) );
  OAI2B1X2M U28 ( .A1N(counter[3]), .A0(n37), .B0(n34), .Y(n50) );
  NOR2X2M U29 ( .A(counter[2]), .B(n35), .Y(n37) );
  OAI2BB2X1M U30 ( .B0(n14), .B1(n24), .A0N(P_DATA[1]), .A1N(n14), .Y(n41) );
  OAI2BB2X1M U31 ( .B0(n14), .B1(n23), .A0N(P_DATA[2]), .A1N(n14), .Y(n42) );
  OAI2BB2X1M U32 ( .B0(n14), .B1(n22), .A0N(P_DATA[3]), .A1N(n14), .Y(n43) );
  OAI2BB2X1M U33 ( .B0(n14), .B1(n21), .A0N(P_DATA[5]), .A1N(n14), .Y(n45) );
  OAI2BB2X1M U34 ( .B0(n14), .B1(n20), .A0N(P_DATA[6]), .A1N(n14), .Y(n46) );
  OAI2BB2X1M U35 ( .B0(n14), .B1(n19), .A0N(P_DATA[7]), .A1N(n14), .Y(n47) );
  INVX2M U36 ( .A(counter[0]), .Y(n16) );
  INVX2M U37 ( .A(counter[1]), .Y(n17) );
  AO22X1M U38 ( .A0(n34), .A1(REG[0]), .B0(P_DATA[0]), .B1(n14), .Y(n40) );
  AO22X1M U39 ( .A0(n34), .A1(REG[4]), .B0(P_DATA[4]), .B1(n14), .Y(n44) );
  AOI32X1M U40 ( .A0(counter[0]), .A1(n17), .A2(REG[4]), .B0(counter[1]), .B1(
        n31), .Y(n30) );
  OAI22X1M U41 ( .A0(n16), .A1(n20), .B0(counter[0]), .B1(n21), .Y(n31) );
  AOI32X1M U42 ( .A0(REG[0]), .A1(n17), .A2(counter[0]), .B0(counter[1]), .B1(
        n33), .Y(n32) );
  OAI22X1M U43 ( .A0(n16), .A1(n23), .B0(counter[0]), .B1(n24), .Y(n33) );
  OAI2BB2X1M U44 ( .B0(n25), .B1(n26), .A0N(SER_DATA), .A1N(n26), .Y(n39) );
  AOI22X1M U45 ( .A0(n27), .A1(n18), .B0(counter[2]), .B1(n28), .Y(n25) );
  OAI21X2M U46 ( .A0(n29), .A1(n19), .B0(n32), .Y(n27) );
  OAI21X2M U47 ( .A0(n29), .A1(n22), .B0(n30), .Y(n28) );
  INVX2M U48 ( .A(counter[2]), .Y(n18) );
endmodule


module FSM_test_1 ( CLK, RST, DATA_VALID, SER_DONE, PAR_EN, SER_EN, MUX_SEL, 
        PAR_FLAG, BUSY, test_si, test_so, test_se );
  output [1:0] MUX_SEL;
  input CLK, RST, DATA_VALID, SER_DONE, PAR_EN, test_si, test_se;
  output SER_EN, PAR_FLAG, BUSY, test_so;
  wire   n7, n8, n9, n10, n5, n6, n11;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign test_so = current_state[2];

  SDFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .SI(n5), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[1]) );
  SDFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .SI(n11), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_state[2]) );
  SDFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .SI(test_si), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(current_state[0]) );
  NAND2BX2M U6 ( .AN(SER_EN), .B(n10), .Y(BUSY) );
  NOR2X2M U7 ( .A(n7), .B(n8), .Y(next_state[2]) );
  NOR3X2M U8 ( .A(n9), .B(current_state[2]), .C(current_state[0]), .Y(
        next_state[0]) );
  AOI32X1M U9 ( .A0(SER_DONE), .A1(current_state[1]), .A2(PAR_EN), .B0(
        DATA_VALID), .B1(n11), .Y(n9) );
  NAND2BX2M U10 ( .AN(current_state[2]), .B(current_state[1]), .Y(n8) );
  INVX2M U11 ( .A(current_state[0]), .Y(n5) );
  OAI32X1M U12 ( .A0(n5), .A1(current_state[2]), .A2(current_state[1]), .B0(n8), .B1(n6), .Y(next_state[1]) );
  INVX2M U13 ( .A(n7), .Y(n6) );
  AOI2B1X1M U14 ( .A1N(PAR_EN), .A0(SER_DONE), .B0(current_state[0]), .Y(n7)
         );
  NAND3X2M U15 ( .A(n5), .B(n11), .C(current_state[2]), .Y(n10) );
  INVX2M U16 ( .A(current_state[1]), .Y(n11) );
  OAI21X2M U17 ( .A0(current_state[0]), .A1(n8), .B0(n10), .Y(MUX_SEL[0]) );
  OAI21X2M U18 ( .A0(n8), .A1(n5), .B0(n10), .Y(MUX_SEL[1]) );
  BUFX2M U19 ( .A(SER_EN), .Y(PAR_FLAG) );
  OAI21X2M U20 ( .A0(current_state[2]), .A1(n5), .B0(n8), .Y(SER_EN) );
endmodule


module parity_Calc_WIDTH8_test_1 ( CLK, RST, P_DATA, DATA_VALID, PAR_TYP, 
        PAR_FLAG, PAR_BIT, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_TYP, PAR_FLAG, test_si, test_se;
  output PAR_BIT, test_so;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n10, n11, n12;
  wire   [7:0] REG;
  assign test_so = REG[7];

  SDFFRQX2M PAR_BIT_reg ( .D(n21), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(PAR_BIT) );
  SDFFRQX2M \REG_reg[5]  ( .D(n27), .SI(REG[4]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[5]) );
  SDFFRQX2M \REG_reg[1]  ( .D(n23), .SI(REG[0]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[1]) );
  SDFFRQX2M \REG_reg[4]  ( .D(n26), .SI(REG[3]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[4]) );
  SDFFRQX2M \REG_reg[0]  ( .D(n22), .SI(PAR_BIT), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[0]) );
  SDFFRQX2M \REG_reg[2]  ( .D(n24), .SI(REG[1]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[2]) );
  SDFFRQX2M \REG_reg[3]  ( .D(n25), .SI(REG[2]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[3]) );
  SDFFRQX2M \REG_reg[6]  ( .D(n28), .SI(REG[5]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[6]) );
  SDFFRQX2M \REG_reg[7]  ( .D(n29), .SI(REG[6]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(REG[7]) );
  INVX2M U12 ( .A(PAR_FLAG), .Y(n12) );
  AND2X2M U13 ( .A(DATA_VALID), .B(n12), .Y(n20) );
  INVX2M U14 ( .A(n14), .Y(n11) );
  NOR2X2M U15 ( .A(PAR_TYP), .B(n12), .Y(n14) );
  OAI2BB1X2M U16 ( .A0N(PAR_BIT), .A1N(n12), .B0(n13), .Y(n21) );
  AOI32X1M U17 ( .A0(PAR_FLAG), .A1(n11), .A2(n10), .B0(n14), .B1(n15), .Y(n13) );
  INVX2M U18 ( .A(n15), .Y(n10) );
  XNOR2X2M U19 ( .A(n16), .B(n17), .Y(n15) );
  AO2B2X2M U20 ( .B0(P_DATA[0]), .B1(n20), .A0(REG[0]), .A1N(n20), .Y(n22) );
  AO2B2X2M U21 ( .B0(P_DATA[1]), .B1(n20), .A0(REG[1]), .A1N(n20), .Y(n23) );
  AO2B2X2M U22 ( .B0(P_DATA[2]), .B1(n20), .A0(REG[2]), .A1N(n20), .Y(n24) );
  AO2B2X2M U23 ( .B0(P_DATA[3]), .B1(n20), .A0(REG[3]), .A1N(n20), .Y(n25) );
  AO2B2X2M U24 ( .B0(P_DATA[4]), .B1(n20), .A0(REG[4]), .A1N(n20), .Y(n26) );
  AO2B2X2M U25 ( .B0(P_DATA[5]), .B1(n20), .A0(REG[5]), .A1N(n20), .Y(n27) );
  AO2B2X2M U26 ( .B0(P_DATA[6]), .B1(n20), .A0(REG[6]), .A1N(n20), .Y(n28) );
  AO2B2X2M U27 ( .B0(P_DATA[7]), .B1(n20), .A0(REG[7]), .A1N(n20), .Y(n29) );
  XOR3XLM U28 ( .A(REG[5]), .B(REG[4]), .C(n18), .Y(n17) );
  CLKXOR2X2M U29 ( .A(REG[7]), .B(REG[6]), .Y(n18) );
  XOR3XLM U30 ( .A(REG[1]), .B(REG[0]), .C(n19), .Y(n16) );
  XNOR2X2M U31 ( .A(REG[2]), .B(REG[3]), .Y(n19) );
endmodule


module MUX_test_1 ( CLK, RST, MUX_SEL, SER_DATA, PAR_BIT, TX_OUT, test_si, 
        test_se );
  input [1:0] MUX_SEL;
  input CLK, RST, SER_DATA, PAR_BIT, test_si, test_se;
  output TX_OUT;
  wire   N13, n2;

  SDFFSQX2M TX_OUT_reg ( .D(N13), .SI(test_si), .SE(test_se), .CK(CLK), .SN(
        RST), .Q(TX_OUT) );
  OAI2BB1X2M U5 ( .A0N(SER_DATA), .A1N(MUX_SEL[0]), .B0(n2), .Y(N13) );
  OAI21X2M U6 ( .A0(MUX_SEL[0]), .A1(PAR_BIT), .B0(MUX_SEL[1]), .Y(n2) );
endmodule


module UART_TX_test_1 ( CLK, RST, P_DATA, DATA_VALID, PAR_EN, PAR_TYP, TX_OUT, 
        BUSY, test_si, test_se );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP, test_si, test_se;
  output TX_OUT, BUSY;
  wire   SER_EN, SER_DATA, SER_DONE, PAR_FLAG, PAR_BIT, n1, n2, n3, n4, n5;
  wire   [1:0] MUX_SEL;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  serializer_WIDTH8_test_1 DUT0 ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .DATA_VALID(DATA_VALID), .SER_EN(SER_EN), .SER_DATA(SER_DATA), 
        .SER_DONE(SER_DONE), .test_si(test_si), .test_so(n5), .test_se(test_se) );
  FSM_test_1 DUT1 ( .CLK(CLK), .RST(n1), .DATA_VALID(DATA_VALID), .SER_DONE(
        SER_DONE), .PAR_EN(PAR_EN), .SER_EN(SER_EN), .MUX_SEL(MUX_SEL), 
        .PAR_FLAG(PAR_FLAG), .BUSY(BUSY), .test_si(n5), .test_so(n4), 
        .test_se(test_se) );
  parity_Calc_WIDTH8_test_1 DUT2 ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .DATA_VALID(DATA_VALID), .PAR_TYP(PAR_TYP), .PAR_FLAG(PAR_FLAG), 
        .PAR_BIT(PAR_BIT), .test_si(n4), .test_so(n3), .test_se(test_se) );
  MUX_test_1 DUT3 ( .CLK(CLK), .RST(n1), .MUX_SEL(MUX_SEL), .SER_DATA(SER_DATA), .PAR_BIT(PAR_BIT), .TX_OUT(TX_OUT), .test_si(n3), .test_se(test_se) );
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
         RD_EN, CTRL_OUT_VALID, _0_net_, ALU_CLK, RD_INC, FIFO_EMPTY, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n11, n12, n16, n17, n18, n19, n22, n23,
         n24, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42;
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
  assign SO[2] = UART_config[2];

  INVX2M U3 ( .A(n7), .Y(n6) );
  INVX2M U4 ( .A(n9), .Y(n8) );
  INVX2M U5 ( .A(FIFO_EMPTY), .Y(n1) );
  OR2X2M U6 ( .A(CLK_GATE_EN), .B(n3), .Y(_0_net_) );
  BUFX2M U7 ( .A(ADDRESS[0]), .Y(n4) );
  BUFX2M U8 ( .A(ADDRESS[1]), .Y(n5) );
  INVX2M U9 ( .A(SYNC_REF_SCAN_RST), .Y(n9) );
  INVX2M U10 ( .A(SYNC_UART_SCAN_RST), .Y(n7) );
  BUFX2M U11 ( .A(RX_IN), .Y(n2) );
  BUFX2M U12 ( .A(test_mode), .Y(n3) );
  DLY1X1M U19 ( .A(n29), .Y(n27) );
  INVXLM U20 ( .A(n40), .Y(n28) );
  INVXLM U21 ( .A(n28), .Y(n29) );
  DLY1X1M U22 ( .A(n33), .Y(n30) );
  INVXLM U23 ( .A(n42), .Y(n31) );
  INVXLM U24 ( .A(n31), .Y(n32) );
  INVXLM U25 ( .A(n31), .Y(n33) );
  DLY1X1M U26 ( .A(n41), .Y(n34) );
  DLY1X1M U27 ( .A(n37), .Y(n35) );
  INVXLM U28 ( .A(n32), .Y(n36) );
  INVXLM U29 ( .A(n36), .Y(n37) );
  INVXLM U30 ( .A(n36), .Y(n38) );
  INVXLM U31 ( .A(SE), .Y(n39) );
  INVXLM U32 ( .A(n39), .Y(n40) );
  INVXLM U33 ( .A(n39), .Y(n41) );
  INVXLM U34 ( .A(n39), .Y(n42) );
  mux2X1_1 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        REF_SCAN_CLK) );
  mux2X1_4 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        UART_SCAN_CLK) );
  mux2X1_3 U2_mux2X1 ( .IN_0(RX_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        UART_RX_SCAN_CLK) );
  mux2X1_2 U3_mux2X1 ( .IN_0(TX_CLK), .IN_1(scan_clk), .SEL(n3), .OUT(
        UART_TX_SCAN_CLK) );
  mux2X1_0 U4_mux2X1 ( .IN_0(RST), .IN_1(scan_rst), .SEL(n3), .OUT(
        RSTN_SCAN_RST) );
  mux2X1_6 U5_mux2X1 ( .IN_0(REF_SYNC_RST), .IN_1(scan_rst), .SEL(n3), .OUT(
        SYNC_REF_SCAN_RST) );
  mux2X1_5 U6_mux2X1 ( .IN_0(UART_SYNC_RST), .IN_1(scan_rst), .SEL(n3), .OUT(
        SYNC_UART_SCAN_RST) );
  DATA_SYNC_BUS_WIDTH8_test_1 DATA_SYNC ( .CLK(REF_SCAN_CLK), .RST(n8), 
        .BUS_EN(RX_DATA_VALID), .UN_SYNC_BUS(RX_P_DATA), .EN_PULSE(
        SYNC_RX_DATA_VALID), .SYNC_BUS(SYNC_RX_P_DATA), .test_si(n23), 
        .test_so(n22), .test_se(n34) );
  SYS_CTRL_DATA_WIDTH8_ADDRESS_WIDTH4_FUN_WIDTH4_ALU_OUT_WIDTH16_test_1 SYS_CTRL ( 
        .CLK(REF_SCAN_CLK), .RST(n8), .RX_P_DATA(SYNC_RX_P_DATA), 
        .RX_DATA_VALID(SYNC_RX_DATA_VALID), .RD_DATA(RD_DATA), .RD_DATA_VALID(
        RD_DATA_VALID), .ALU_OUT(ALU_OUT), .ALU_OUT_VALID(ALU_OUT_VALID), 
        .FIFO_FULL(FIFO_FULL), .ALU_FUN(FUN), .ALU_EN(ALU_EN), .CLK_GATE_EN(
        CLK_GATE_EN), .ADDRESS(ADDRESS), .WR_EN(WR_EN), .RD_EN(RD_EN), 
        .WR_DATA(WR_DATA), .TX_P_Data(CTRL_OUT_DATA), .TX_DATA_VALID(
        CTRL_OUT_VALID), .test_si(n12), .test_so(n11), .test_se(n27) );
  RST_SYNC_NUM_STAGES2_test_0 RST_SYNC_1 ( .CLK(REF_SCAN_CLK), .RST(
        RSTN_SCAN_RST), .SYNC_RST(REF_SYNC_RST), .test_si(n18), .test_so(n17), 
        .test_se(n41) );
  RST_SYNC_NUM_STAGES2_test_1 RST_SYNC_2 ( .CLK(UART_SCAN_CLK), .RST(
        RSTN_SCAN_RST), .SYNC_RST(UART_SYNC_RST), .test_si(n17), .test_so(n16), 
        .test_se(n38) );
  Reg_File_DATA_WIDTH8_DEPTH16_ADDRESS_WIDTH4_test_1 Reg_file ( .CLK(
        REF_SCAN_CLK), .RST(n8), .WR_DATA(WR_DATA), .ADDRESS({ADDRESS[3:2], n5, 
        n4}), .WR_EN(WR_EN), .RD_EN(RD_EN), .RD_DATA(RD_DATA), .RD_DATA_VALID(
        RD_DATA_VALID), .REG_0(OP_A), .REG_1(OP_B), .REG_2(UART_config), 
        .REG_3(TX_DIV_RATIO), .test_si3(SI[0]), .test_si2(SI[1]), .test_si1(
        n16), .test_so2(n12), .test_so1(SO[1]), .test_se(SE) );
  CLK_GATE CLK_GATE ( .CLK(REF_SCAN_CLK), .CLK_EN(_0_net_), .GATED_CLK(ALU_CLK) );
  ALU_OPERAND_WIDTH8_FUN_WIDTH4_test_1 ALU ( .CLK(ALU_CLK), .RST(n8), .A(OP_A), 
        .B(OP_B), .ALU_FUN(FUN), .ALU_EN(ALU_EN), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(ALU_OUT_VALID), .test_si(SI[3]), .test_se(n32) );
  CLK_DIV_MUX CLK_DIV_MUX ( .IN(UART_config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, RX_DIV_RATIO[3:0]})
         );
  Clk_Div_WIDTH8_test_0 CLK_DIV_1 ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(n6), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        RX_DIV_RATIO[3:0]}), .o_div_clk(RX_CLK), .test_si(ALU_OUT_VALID), 
        .test_so(n24), .test_se(n42) );
  Clk_Div_WIDTH8_test_1 CLK_DIV_2 ( .i_ref_clk(UART_SCAN_CLK), .i_rst_n(n6), 
        .i_clk_en(1'b1), .i_div_ratio(TX_DIV_RATIO), .o_div_clk(TX_CLK), 
        .test_si(n24), .test_so(n23), .test_se(n38) );
  FIFO_DATA_WIDTH8_ADDRESS_WIDTH4_test_1 FIFO ( .WR_DATA(CTRL_OUT_DATA), 
        .W_INC(CTRL_OUT_VALID), .R_INC(RD_INC), .W_CLK(REF_SCAN_CLK), .W_RST(
        n8), .R_CLK(UART_TX_SCAN_CLK), .R_RST(n6), .FULL(FIFO_FULL), .EMPTY(
        FIFO_EMPTY), .RD_DATA(TX_IN_DATA), .test_si2(SI[2]), .test_si1(n22), 
        .test_so2(n19), .test_so1(SO[3]), .test_se(SE) );
  PULSE_GEN_test_1 PULSE_GEN ( .CLK(UART_TX_SCAN_CLK), .RST(n6), .LVL_SIG(BUSY), .PULSE_SIG(RD_INC), .test_si(n19), .test_so(n18), .test_se(n38) );
  UART_RX_test_1 UART_RX ( .clk(UART_RX_SCAN_CLK), .rst(n6), .rx_in(n2), 
        .par_en(UART_config[0]), .par_typ(UART_config[1]), .prescale(
        UART_config[7:2]), .data_valid(RX_DATA_VALID), .par_error(PARITY_ERROR), .stp_error(STOP_ERROR), .p_data(RX_P_DATA), .test_si(n11), .test_se(n35) );
  UART_TX_test_1 UART_TX ( .CLK(UART_TX_SCAN_CLK), .RST(n6), .P_DATA(
        TX_IN_DATA), .DATA_VALID(n1), .PAR_EN(UART_config[0]), .PAR_TYP(
        UART_config[1]), .TX_OUT(SO[0]), .BUSY(BUSY), .test_si(RX_P_DATA[7]), 
        .test_se(n30) );
  BUFX2M U18 ( .A(SO[0]), .Y(TX_OUT) );
endmodule

