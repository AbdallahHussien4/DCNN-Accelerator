/*
 * Created by 
   ../bin/Linux-x86_64-O/oasysGui 19.2-p002 on Wed May  5 20:10:16 2021
 * (C) Mentor Graphics Corporation
 */
/* CheckSum: 4002056938 */

module datapath(\image_in[0][1] , \image_in[1][0] , \image_in[1][1] , 
      \image_in[0][0] , p_0);
   input [15:0]\image_in[0][1] ;
   input [15:0]\image_in[1][0] ;
   input [15:0]\image_in[1][1] ;
   input [15:0]\image_in[0][0] ;
   output [15:0]p_0;

   FA_X1 i_0 (.A(\image_in[0][1] [0]), .B(\image_in[1][0] [0]), .CI(
      \image_in[1][1] [0]), .CO(n_1), .S(n_0));
   FA_X1 i_1 (.A(\image_in[0][1] [1]), .B(\image_in[1][0] [1]), .CI(
      \image_in[1][1] [1]), .CO(n_3), .S(n_2));
   HA_X1 i_2 (.A(\image_in[0][0] [1]), .B(n_1), .CO(n_5), .S(n_4));
   FA_X1 i_3 (.A(\image_in[0][1] [2]), .B(\image_in[1][0] [2]), .CI(
      \image_in[1][1] [2]), .CO(n_7), .S(n_6));
   FA_X1 i_4 (.A(\image_in[0][0] [2]), .B(n_3), .CI(n_5), .CO(n_9), .S(n_8));
   FA_X1 i_5 (.A(\image_in[0][1] [3]), .B(\image_in[1][0] [3]), .CI(
      \image_in[1][1] [3]), .CO(n_11), .S(n_10));
   FA_X1 i_6 (.A(\image_in[0][0] [3]), .B(n_7), .CI(n_9), .CO(n_13), .S(n_12));
   FA_X1 i_7 (.A(\image_in[0][1] [4]), .B(\image_in[1][0] [4]), .CI(
      \image_in[1][1] [4]), .CO(n_15), .S(n_14));
   FA_X1 i_8 (.A(\image_in[0][0] [4]), .B(n_11), .CI(n_14), .CO(n_17), .S(n_16));
   FA_X1 i_9 (.A(\image_in[0][1] [5]), .B(\image_in[1][0] [5]), .CI(
      \image_in[1][1] [5]), .CO(n_19), .S(n_18));
   FA_X1 i_10 (.A(\image_in[0][0] [5]), .B(n_15), .CI(n_18), .CO(n_21), .S(n_20));
   FA_X1 i_11 (.A(\image_in[0][1] [6]), .B(\image_in[1][0] [6]), .CI(
      \image_in[1][1] [6]), .CO(n_23), .S(n_22));
   FA_X1 i_12 (.A(\image_in[0][0] [6]), .B(n_19), .CI(n_22), .CO(n_25), .S(n_24));
   FA_X1 i_13 (.A(\image_in[0][1] [7]), .B(\image_in[1][0] [7]), .CI(
      \image_in[1][1] [7]), .CO(n_27), .S(n_26));
   FA_X1 i_14 (.A(\image_in[0][0] [7]), .B(n_23), .CI(n_26), .CO(n_29), .S(n_28));
   FA_X1 i_15 (.A(\image_in[0][1] [8]), .B(\image_in[1][0] [8]), .CI(
      \image_in[1][1] [8]), .CO(n_31), .S(n_30));
   FA_X1 i_16 (.A(\image_in[0][0] [8]), .B(n_27), .CI(n_30), .CO(n_33), .S(n_32));
   FA_X1 i_17 (.A(\image_in[0][1] [9]), .B(\image_in[1][0] [9]), .CI(
      \image_in[1][1] [9]), .CO(n_35), .S(n_34));
   FA_X1 i_18 (.A(\image_in[0][0] [9]), .B(n_31), .CI(n_34), .CO(n_37), .S(n_36));
   FA_X1 i_19 (.A(\image_in[0][1] [10]), .B(\image_in[1][0] [10]), .CI(
      \image_in[1][1] [10]), .CO(n_39), .S(n_38));
   FA_X1 i_20 (.A(\image_in[0][0] [10]), .B(n_35), .CI(n_38), .CO(n_41), 
      .S(n_40));
   FA_X1 i_21 (.A(\image_in[0][1] [11]), .B(\image_in[1][0] [11]), .CI(
      \image_in[1][1] [11]), .CO(n_43), .S(n_42));
   FA_X1 i_22 (.A(\image_in[0][0] [11]), .B(n_39), .CI(n_42), .CO(n_45), 
      .S(n_44));
   FA_X1 i_23 (.A(\image_in[0][1] [12]), .B(\image_in[1][0] [12]), .CI(
      \image_in[1][1] [12]), .CO(n_47), .S(n_46));
   FA_X1 i_24 (.A(\image_in[0][0] [12]), .B(n_43), .CI(n_46), .CO(n_49), 
      .S(n_48));
   FA_X1 i_25 (.A(\image_in[0][1] [13]), .B(\image_in[1][0] [13]), .CI(
      \image_in[1][1] [13]), .CO(n_51), .S(n_50));
   FA_X1 i_26 (.A(\image_in[0][0] [13]), .B(n_47), .CI(n_50), .CO(n_53), 
      .S(n_52));
   FA_X1 i_27 (.A(\image_in[0][1] [14]), .B(\image_in[1][0] [14]), .CI(
      \image_in[1][1] [14]), .CO(n_55), .S(n_54));
   FA_X1 i_28 (.A(\image_in[0][0] [14]), .B(n_51), .CI(n_54), .CO(n_57), 
      .S(n_56));
   XNOR2_X1 i_29 (.A(\image_in[0][1] [15]), .B(\image_in[1][0] [15]), .ZN(n_58));
   XNOR2_X1 i_30 (.A(n_58), .B(\image_in[1][1] [15]), .ZN(n_59));
   XNOR2_X1 i_31 (.A(\image_in[0][0] [15]), .B(n_55), .ZN(n_60));
   XNOR2_X1 i_32 (.A(n_60), .B(n_59), .ZN(n_61));
   HA_X1 i_33 (.A(\image_in[0][0] [0]), .B(n_0), .CO(n_63), .S(n_62));
   FA_X1 i_34 (.A(n_4), .B(n_2), .CI(n_63), .CO(n_65), .S(n_64));
   FA_X1 i_35 (.A(n_6), .B(n_8), .CI(n_65), .CO(n_66), .S(p_0[2]));
   FA_X1 i_36 (.A(n_10), .B(n_12), .CI(n_66), .CO(n_67), .S(p_0[3]));
   FA_X1 i_37 (.A(n_13), .B(n_16), .CI(n_67), .CO(n_68), .S(p_0[4]));
   FA_X1 i_38 (.A(n_17), .B(n_20), .CI(n_68), .CO(n_69), .S(p_0[5]));
   FA_X1 i_39 (.A(n_21), .B(n_24), .CI(n_69), .CO(n_70), .S(p_0[6]));
   FA_X1 i_40 (.A(n_25), .B(n_28), .CI(n_70), .CO(n_71), .S(p_0[7]));
   FA_X1 i_41 (.A(n_29), .B(n_32), .CI(n_71), .CO(n_72), .S(p_0[8]));
   FA_X1 i_42 (.A(n_33), .B(n_36), .CI(n_72), .CO(n_73), .S(p_0[9]));
   FA_X1 i_43 (.A(n_37), .B(n_40), .CI(n_73), .CO(n_74), .S(p_0[10]));
   FA_X1 i_44 (.A(n_41), .B(n_44), .CI(n_74), .CO(n_75), .S(p_0[11]));
   FA_X1 i_45 (.A(n_45), .B(n_48), .CI(n_75), .CO(n_76), .S(p_0[12]));
   FA_X1 i_46 (.A(n_49), .B(n_52), .CI(n_76), .CO(n_77), .S(p_0[13]));
   FA_X1 i_47 (.A(n_53), .B(n_56), .CI(n_77), .CO(n_78), .S(p_0[14]));
   XNOR2_X1 i_48 (.A(n_57), .B(n_61), .ZN(n_79));
   XNOR2_X1 i_49 (.A(n_79), .B(n_78), .ZN(p_0[15]));
endmodule

module Pooling_2x2(start, \image_in[0][0] , \image_in[0][1] , \image_in[0][2] , 
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

   wire n_0_0;
   wire n_0_1;
   wire n_0_2;
   wire n_0_3;
   wire n_0_4;
   wire n_0_5;
   wire n_0_6;
   wire n_0_7;
   wire n_0_8;
   wire n_0_9;
   wire n_0_10;
   wire n_0_11;
   wire n_0_12;
   wire n_0_13;

   assign finish = start;
   assign pixel_out[15] = 1'b0;
   assign pixel_out[14] = 1'b0;

   DLH_X1 \pixel_out_reg[13]  (.D(n_0_13), .G(start), .Q(pixel_out[13]));
   DLH_X1 \pixel_out_reg[12]  (.D(n_0_12), .G(start), .Q(pixel_out[12]));
   DLH_X1 \pixel_out_reg[11]  (.D(n_0_11), .G(start), .Q(pixel_out[11]));
   DLH_X1 \pixel_out_reg[10]  (.D(n_0_10), .G(start), .Q(pixel_out[10]));
   DLH_X1 \pixel_out_reg[9]  (.D(n_0_9), .G(start), .Q(pixel_out[9]));
   DLH_X1 \pixel_out_reg[8]  (.D(n_0_8), .G(start), .Q(pixel_out[8]));
   DLH_X1 \pixel_out_reg[7]  (.D(n_0_7), .G(start), .Q(pixel_out[7]));
   DLH_X1 \pixel_out_reg[6]  (.D(n_0_6), .G(start), .Q(pixel_out[6]));
   DLH_X1 \pixel_out_reg[5]  (.D(n_0_5), .G(start), .Q(pixel_out[5]));
   DLH_X1 \pixel_out_reg[4]  (.D(n_0_4), .G(start), .Q(pixel_out[4]));
   DLH_X1 \pixel_out_reg[3]  (.D(n_0_3), .G(start), .Q(pixel_out[3]));
   DLH_X1 \pixel_out_reg[2]  (.D(n_0_2), .G(start), .Q(pixel_out[2]));
   DLH_X1 \pixel_out_reg[1]  (.D(n_0_1), .G(start), .Q(pixel_out[1]));
   DLH_X1 \pixel_out_reg[0]  (.D(n_0_0), .G(start), .Q(pixel_out[0]));
   datapath i_0_0 (.\image_in[0][1] (\image_in[0][1] ), .\image_in[1][0] (
      \image_in[1][0] ), .\image_in[1][1] (\image_in[1][1] ), .\image_in[0][0] (
      \image_in[0][0] ), .p_0({n_0_13, n_0_12, n_0_11, n_0_10, n_0_9, n_0_8, 
      n_0_7, n_0_6, n_0_5, n_0_4, n_0_3, n_0_2, n_0_1, n_0_0, uc_0, uc_1}));
endmodule
