/*
 * Created by 
   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Wed May  5 22:43:31 2021
 * (C) Mentor Graphics Corporation
 */
/* CheckSum: 4095887008 */

module Pooling_2x2_Synth(start, \image_in[0][0] , \image_in[0][1] , \image_in[0][2] , 
      \image_in[0][3] , \image_in[0][4] , \image_in[1][0] , \image_in[1][1] , 
      \image_in[1][2] , \image_in[1][3] , \image_in[1][4] , \image_in[2][0] , 
      \image_in[2][1] , \image_in[2][2] , \image_in[2][3] , \image_in[2][4] , 
      \image_in[3][0] , \image_in[3][1] , \image_in[3][2] , \image_in[3][3] , 
      \image_in[3][4] , \image_in[4][0] , \image_in[4][1] , \image_in[4][2] , 
      \image_in[4][3] , \image_in[4][4] , finish, pixel_out);
   input start;
   input [15:0]\image_in[0][0] ;
   input [15:0]\image_in[0][1] ;
   input [15:0]\image_in[0][2] ;
   input [15:0]\image_in[0][3] ;
   input [15:0]\image_in[0][4] ;
   input [15:0]\image_in[1][0] ;
   input [15:0]\image_in[1][1] ;
   input [15:0]\image_in[1][2] ;
   input [15:0]\image_in[1][3] ;
   input [15:0]\image_in[1][4] ;
   input [15:0]\image_in[2][0] ;
   input [15:0]\image_in[2][1] ;
   input [15:0]\image_in[2][2] ;
   input [15:0]\image_in[2][3] ;
   input [15:0]\image_in[2][4] ;
   input [15:0]\image_in[3][0] ;
   input [15:0]\image_in[3][1] ;
   input [15:0]\image_in[3][2] ;
   input [15:0]\image_in[3][3] ;
   input [15:0]\image_in[3][4] ;
   input [15:0]\image_in[4][0] ;
   input [15:0]\image_in[4][1] ;
   input [15:0]\image_in[4][2] ;
   input [15:0]\image_in[4][3] ;
   input [15:0]\image_in[4][4] ;
   output finish;
   output [15:0]pixel_out;

   wire n_0_0_0;
   wire n_0_0_1;
   wire n_0_0_2;
   wire n_0_0_3;
   wire n_0_0_4;
   wire n_0_0_5;
   wire n_0_0_6;
   wire n_0_0_7;
   wire n_0_0_8;
   wire n_0_0_9;
   wire n_0_0_10;
   wire n_0_0_11;
   wire n_0_0_12;
   wire n_0_0_13;
   wire n_0_0_14;
   wire n_0_0_15;
   wire n_0_0_16;
   wire n_0_0_17;
   wire n_0_0_18;
   wire n_0_0_19;
   wire n_0_0_20;
   wire n_0_0_21;
   wire n_0_0_22;
   wire n_0_0_23;
   wire n_0_0_24;
   wire n_0_0_25;
   wire n_0_0_26;
   wire n_0_0_27;
   wire n_0_0_28;
   wire n_0_0_29;
   wire n_0_0_30;
   wire n_0_0_31;
   wire n_0_0_32;
   wire n_0_0_33;
   wire n_0_0_34;
   wire n_0_0_35;
   wire n_0_0_36;
   wire n_0_0_37;
   wire n_0_0_38;
   wire n_0_0_39;
   wire n_0_0_40;
   wire n_0_0_41;
   wire n_0_0_42;
   wire n_0_0_43;
   wire n_0_0_44;
   wire n_0_0_45;
   wire n_0_0_46;
   wire n_0_0_47;
   wire n_0_0_48;
   wire n_0_0_49;
   wire n_0_0_50;
   wire n_0_0_51;
   wire n_0_0_52;
   wire n_0_0_53;
   wire n_0_0_54;
   wire n_0_0_55;
   wire n_0_0_56;
   wire n_0_0_57;
   wire n_0_0_62;
   wire n_0_0_63;
   wire n_0_0_64;
   wire n_0_0_65;
   wire n_0_0_58;
   wire n_0_0_66;
   wire n_0_0_59;
   wire n_0_0_67;
   wire n_0_0_60;
   wire n_0_0_68;
   wire n_0_0_61;
   wire n_0_0_69;
   wire n_0_0_79;
   wire n_0_0_70;
   wire n_0_0_80;
   wire n_0_0_71;
   wire n_0_0_81;
   wire n_0_0_72;
   wire n_0_0_82;
   wire n_0_0_73;
   wire n_0_0_83;
   wire n_0_0_74;
   wire n_0_0_84;
   wire n_0_0_75;
   wire n_0_0_85;
   wire n_0_0_76;
   wire n_0_0_86;
   wire n_0_0_77;
   wire n_0_0_87;
   wire n_0_0_78;
   wire n_0_0_88;
   wire n_0_0_89;
   wire n_0_0_90;
   wire n_0_0_91;
   wire n_0_0_92;
   wire n_0_0_93;

   assign finish = start;
   assign pixel_out[15] = 1'b0;
   assign pixel_out[14] = 1'b0;

   FA_X1 i_0_0_0 (.A(\image_in[0][1] [0]), .B(\image_in[1][0] [0]), .CI(
      \image_in[1][1] [0]), .CO(n_0_0_1), .S(n_0_0_0));
   FA_X1 i_0_0_1 (.A(\image_in[0][1] [1]), .B(\image_in[1][0] [1]), .CI(
      \image_in[1][1] [1]), .CO(n_0_0_3), .S(n_0_0_2));
   HA_X1 i_0_0_2 (.A(\image_in[0][0] [1]), .B(n_0_0_1), .CO(n_0_0_5), .S(n_0_0_4));
   FA_X1 i_0_0_3 (.A(\image_in[0][1] [2]), .B(\image_in[1][0] [2]), .CI(
      \image_in[1][1] [2]), .CO(n_0_0_7), .S(n_0_0_6));
   FA_X1 i_0_0_4 (.A(\image_in[0][0] [2]), .B(n_0_0_3), .CI(n_0_0_5), .CO(
      n_0_0_9), .S(n_0_0_8));
   FA_X1 i_0_0_5 (.A(\image_in[0][1] [3]), .B(\image_in[1][0] [3]), .CI(
      \image_in[1][1] [3]), .CO(n_0_0_11), .S(n_0_0_10));
   FA_X1 i_0_0_6 (.A(\image_in[0][0] [3]), .B(n_0_0_7), .CI(n_0_0_9), .CO(
      n_0_0_13), .S(n_0_0_12));
   FA_X1 i_0_0_7 (.A(\image_in[0][1] [4]), .B(\image_in[1][0] [4]), .CI(
      \image_in[1][1] [4]), .CO(n_0_0_15), .S(n_0_0_14));
   FA_X1 i_0_0_8 (.A(\image_in[0][0] [4]), .B(n_0_0_11), .CI(n_0_0_14), .CO(
      n_0_0_17), .S(n_0_0_16));
   FA_X1 i_0_0_9 (.A(\image_in[0][1] [5]), .B(\image_in[1][0] [5]), .CI(
      \image_in[1][1] [5]), .CO(n_0_0_19), .S(n_0_0_18));
   FA_X1 i_0_0_10 (.A(\image_in[0][0] [5]), .B(n_0_0_15), .CI(n_0_0_18), 
      .CO(n_0_0_21), .S(n_0_0_20));
   FA_X1 i_0_0_11 (.A(\image_in[0][1] [6]), .B(\image_in[1][0] [6]), .CI(
      \image_in[1][1] [6]), .CO(n_0_0_23), .S(n_0_0_22));
   FA_X1 i_0_0_12 (.A(\image_in[0][0] [6]), .B(n_0_0_19), .CI(n_0_0_22), 
      .CO(n_0_0_25), .S(n_0_0_24));
   FA_X1 i_0_0_13 (.A(\image_in[0][1] [7]), .B(\image_in[1][0] [7]), .CI(
      \image_in[1][1] [7]), .CO(n_0_0_27), .S(n_0_0_26));
   FA_X1 i_0_0_14 (.A(\image_in[0][0] [7]), .B(n_0_0_23), .CI(n_0_0_26), 
      .CO(n_0_0_29), .S(n_0_0_28));
   FA_X1 i_0_0_15 (.A(\image_in[0][1] [8]), .B(\image_in[1][0] [8]), .CI(
      \image_in[1][1] [8]), .CO(n_0_0_31), .S(n_0_0_30));
   FA_X1 i_0_0_16 (.A(\image_in[0][0] [8]), .B(n_0_0_27), .CI(n_0_0_30), 
      .CO(n_0_0_33), .S(n_0_0_32));
   FA_X1 i_0_0_17 (.A(\image_in[0][1] [9]), .B(\image_in[1][0] [9]), .CI(
      \image_in[1][1] [9]), .CO(n_0_0_35), .S(n_0_0_34));
   FA_X1 i_0_0_18 (.A(\image_in[0][0] [9]), .B(n_0_0_31), .CI(n_0_0_34), 
      .CO(n_0_0_37), .S(n_0_0_36));
   FA_X1 i_0_0_19 (.A(\image_in[0][1] [10]), .B(\image_in[1][0] [10]), .CI(
      \image_in[1][1] [10]), .CO(n_0_0_39), .S(n_0_0_38));
   FA_X1 i_0_0_20 (.A(\image_in[0][0] [10]), .B(n_0_0_35), .CI(n_0_0_38), 
      .CO(n_0_0_41), .S(n_0_0_40));
   FA_X1 i_0_0_21 (.A(\image_in[0][1] [11]), .B(\image_in[1][0] [11]), .CI(
      \image_in[1][1] [11]), .CO(n_0_0_43), .S(n_0_0_42));
   FA_X1 i_0_0_22 (.A(\image_in[0][0] [11]), .B(n_0_0_39), .CI(n_0_0_42), 
      .CO(n_0_0_45), .S(n_0_0_44));
   FA_X1 i_0_0_23 (.A(\image_in[0][1] [12]), .B(\image_in[1][0] [12]), .CI(
      \image_in[1][1] [12]), .CO(n_0_0_47), .S(n_0_0_46));
   FA_X1 i_0_0_24 (.A(\image_in[0][0] [12]), .B(n_0_0_43), .CI(n_0_0_46), 
      .CO(n_0_0_49), .S(n_0_0_48));
   FA_X1 i_0_0_25 (.A(\image_in[0][1] [13]), .B(\image_in[1][0] [13]), .CI(
      \image_in[1][1] [13]), .CO(n_0_0_51), .S(n_0_0_50));
   FA_X1 i_0_0_26 (.A(\image_in[0][0] [13]), .B(n_0_0_47), .CI(n_0_0_50), 
      .CO(n_0_0_53), .S(n_0_0_52));
   FA_X1 i_0_0_27 (.A(\image_in[0][1] [14]), .B(\image_in[1][0] [14]), .CI(
      \image_in[1][1] [14]), .CO(n_0_0_55), .S(n_0_0_54));
   FA_X1 i_0_0_28 (.A(\image_in[0][0] [14]), .B(n_0_0_51), .CI(n_0_0_54), 
      .CO(n_0_0_57), .S(n_0_0_56));
   HA_X1 i_0_0_29 (.A(\image_in[0][0] [0]), .B(n_0_0_0), .CO(n_0_0_63), .S(
      n_0_0_62));
   FA_X1 i_0_0_30 (.A(n_0_0_4), .B(n_0_0_2), .CI(n_0_0_63), .CO(n_0_0_65), 
      .S(n_0_0_64));
   FA_X1 i_0_0_31 (.A(n_0_0_6), .B(n_0_0_8), .CI(n_0_0_65), .CO(n_0_0_66), 
      .S(n_0_0_58));
   FA_X1 i_0_0_32 (.A(n_0_0_10), .B(n_0_0_12), .CI(n_0_0_66), .CO(n_0_0_67), 
      .S(n_0_0_59));
   FA_X1 i_0_0_33 (.A(n_0_0_13), .B(n_0_0_16), .CI(n_0_0_67), .CO(n_0_0_68), 
      .S(n_0_0_60));
   FA_X1 i_0_0_34 (.A(n_0_0_17), .B(n_0_0_20), .CI(n_0_0_68), .CO(n_0_0_69), 
      .S(n_0_0_61));
   FA_X1 i_0_0_35 (.A(n_0_0_21), .B(n_0_0_24), .CI(n_0_0_69), .CO(n_0_0_70), 
      .S(n_0_0_79));
   FA_X1 i_0_0_36 (.A(n_0_0_25), .B(n_0_0_28), .CI(n_0_0_70), .CO(n_0_0_71), 
      .S(n_0_0_80));
   FA_X1 i_0_0_37 (.A(n_0_0_29), .B(n_0_0_32), .CI(n_0_0_71), .CO(n_0_0_72), 
      .S(n_0_0_81));
   FA_X1 i_0_0_38 (.A(n_0_0_33), .B(n_0_0_36), .CI(n_0_0_72), .CO(n_0_0_73), 
      .S(n_0_0_82));
   FA_X1 i_0_0_39 (.A(n_0_0_37), .B(n_0_0_40), .CI(n_0_0_73), .CO(n_0_0_74), 
      .S(n_0_0_83));
   FA_X1 i_0_0_40 (.A(n_0_0_41), .B(n_0_0_44), .CI(n_0_0_74), .CO(n_0_0_75), 
      .S(n_0_0_84));
   FA_X1 i_0_0_41 (.A(n_0_0_45), .B(n_0_0_48), .CI(n_0_0_75), .CO(n_0_0_76), 
      .S(n_0_0_85));
   FA_X1 i_0_0_42 (.A(n_0_0_49), .B(n_0_0_52), .CI(n_0_0_76), .CO(n_0_0_77), 
      .S(n_0_0_86));
   FA_X1 i_0_0_43 (.A(n_0_0_53), .B(n_0_0_56), .CI(n_0_0_77), .CO(n_0_0_78), 
      .S(n_0_0_87));
   AND2_X1 i_0_0_44 (.A1(start), .A2(n_0_0_58), .ZN(pixel_out[0]));
   AND2_X1 i_0_0_45 (.A1(start), .A2(n_0_0_59), .ZN(pixel_out[1]));
   AND2_X1 i_0_0_46 (.A1(start), .A2(n_0_0_60), .ZN(pixel_out[2]));
   AND2_X1 i_0_0_47 (.A1(start), .A2(n_0_0_61), .ZN(pixel_out[3]));
   AND2_X1 i_0_0_48 (.A1(start), .A2(n_0_0_79), .ZN(pixel_out[4]));
   AND2_X1 i_0_0_49 (.A1(start), .A2(n_0_0_80), .ZN(pixel_out[5]));
   AND2_X1 i_0_0_50 (.A1(start), .A2(n_0_0_81), .ZN(pixel_out[6]));
   AND2_X1 i_0_0_51 (.A1(start), .A2(n_0_0_82), .ZN(pixel_out[7]));
   AND2_X1 i_0_0_52 (.A1(start), .A2(n_0_0_83), .ZN(pixel_out[8]));
   AND2_X1 i_0_0_53 (.A1(start), .A2(n_0_0_84), .ZN(pixel_out[9]));
   AND2_X1 i_0_0_54 (.A1(start), .A2(n_0_0_85), .ZN(pixel_out[10]));
   AND2_X1 i_0_0_55 (.A1(start), .A2(n_0_0_86), .ZN(pixel_out[11]));
   AND2_X1 i_0_0_56 (.A1(start), .A2(n_0_0_87), .ZN(pixel_out[12]));
   AOI21_X1 i_0_0_57 (.A(n_0_0_88), .B1(n_0_0_89), .B2(n_0_0_91), .ZN(
      pixel_out[13]));
   OAI21_X1 i_0_0_58 (.A(start), .B1(n_0_0_91), .B2(n_0_0_89), .ZN(n_0_0_88));
   XNOR2_X1 i_0_0_59 (.A(\image_in[0][1] [15]), .B(n_0_0_90), .ZN(n_0_0_89));
   XOR2_X1 i_0_0_60 (.A(\image_in[0][0] [15]), .B(n_0_0_55), .Z(n_0_0_90));
   XNOR2_X1 i_0_0_61 (.A(n_0_0_93), .B(n_0_0_92), .ZN(n_0_0_91));
   XNOR2_X1 i_0_0_62 (.A(n_0_0_57), .B(n_0_0_78), .ZN(n_0_0_92));
   XNOR2_X1 i_0_0_63 (.A(\image_in[1][0] [15]), .B(\image_in[1][1] [15]), 
      .ZN(n_0_0_93));
endmodule
