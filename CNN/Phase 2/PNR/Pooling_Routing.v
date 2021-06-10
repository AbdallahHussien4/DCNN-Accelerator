
// 	Thu May  6 00:11:44 2021
//	vlsi
//	localhost.localdomain

module datapath (\image_in[0][1] , \image_in[1][0] , \image_in[1][1] , \image_in[0][0] , 
    p_0);

output [15:0] p_0;
input [15:0] \image_in[0][0] ;
input [15:0] \image_in[0][1] ;
input [15:0] \image_in[1][0] ;
input [15:0] \image_in[1][1] ;
wire n_1;
wire n_0;
wire n_3;
wire n_2;
wire n_5;
wire n_4;
wire n_7;
wire n_6;
wire n_9;
wire n_8;
wire n_11;
wire n_10;
wire n_13;
wire n_12;
wire n_15;
wire n_14;
wire n_17;
wire n_16;
wire n_19;
wire n_18;
wire n_21;
wire n_20;
wire n_23;
wire n_22;
wire n_25;
wire n_24;
wire n_27;
wire n_26;
wire n_29;
wire n_28;
wire n_31;
wire n_30;
wire n_33;
wire n_32;
wire n_35;
wire n_34;
wire n_37;
wire n_36;
wire n_39;
wire n_38;
wire n_41;
wire n_40;
wire n_43;
wire n_42;
wire n_45;
wire n_44;
wire n_47;
wire n_46;
wire n_49;
wire n_48;
wire n_51;
wire n_50;
wire n_53;
wire n_52;
wire n_55;
wire n_54;
wire n_57;
wire n_56;
wire n_58;
wire n_59;
wire n_60;
wire n_61;
wire n_63;
wire n_62;
wire n_65;
wire n_64;
wire n_66;
wire n_67;
wire n_68;
wire n_69;
wire n_70;
wire n_71;
wire n_72;
wire n_73;
wire n_74;
wire n_75;
wire n_76;
wire n_77;
wire n_78;
wire n_79;


XNOR2_X1 i_49 (.ZN (p_0[15]), .A (n_79), .B (n_78));
XNOR2_X1 i_48 (.ZN (n_79), .A (n_57), .B (n_61));
FA_X1 i_47 (.CO (n_78), .S (p_0[14]), .A (n_53), .B (n_56), .CI (n_77));
FA_X1 i_46 (.CO (n_77), .S (p_0[13]), .A (n_49), .B (n_52), .CI (n_76));
FA_X1 i_45 (.CO (n_76), .S (p_0[12]), .A (n_45), .B (n_48), .CI (n_75));
FA_X1 i_44 (.CO (n_75), .S (p_0[11]), .A (n_41), .B (n_44), .CI (n_74));
FA_X1 i_43 (.CO (n_74), .S (p_0[10]), .A (n_37), .B (n_40), .CI (n_73));
FA_X1 i_42 (.CO (n_73), .S (p_0[9]), .A (n_33), .B (n_36), .CI (n_72));
FA_X1 i_41 (.CO (n_72), .S (p_0[8]), .A (n_29), .B (n_32), .CI (n_71));
FA_X1 i_40 (.CO (n_71), .S (p_0[7]), .A (n_25), .B (n_28), .CI (n_70));
FA_X1 i_39 (.CO (n_70), .S (p_0[6]), .A (n_21), .B (n_24), .CI (n_69));
FA_X1 i_38 (.CO (n_69), .S (p_0[5]), .A (n_17), .B (n_20), .CI (n_68));
FA_X1 i_37 (.CO (n_68), .S (p_0[4]), .A (n_13), .B (n_16), .CI (n_67));
FA_X1 i_36 (.CO (n_67), .S (p_0[3]), .A (n_10), .B (n_12), .CI (n_66));
FA_X1 i_35 (.CO (n_66), .S (p_0[2]), .A (n_6), .B (n_8), .CI (n_65));
FA_X1 i_34 (.CO (n_65), .S (n_64), .A (n_4), .B (n_2), .CI (n_63));
HA_X1 i_33 (.CO (n_63), .S (n_62), .A (\image_in[0][0] [0] ), .B (n_0));
XNOR2_X1 i_32 (.ZN (n_61), .A (n_60), .B (n_59));
XNOR2_X1 i_31 (.ZN (n_60), .A (\image_in[0][0] [15] ), .B (n_55));
XNOR2_X1 i_30 (.ZN (n_59), .A (n_58), .B (\image_in[1][1] [15] ));
XNOR2_X1 i_29 (.ZN (n_58), .A (\image_in[0][1] [15] ), .B (\image_in[1][0] [15] ));
FA_X1 i_28 (.CO (n_57), .S (n_56), .A (\image_in[0][0] [14] ), .B (n_51), .CI (n_54));
FA_X1 i_27 (.CO (n_55), .S (n_54), .A (\image_in[0][1] [14] ), .B (\image_in[1][0] [14] ), .CI (\image_in[1][1] [14] ));
FA_X1 i_26 (.CO (n_53), .S (n_52), .A (\image_in[0][0] [13] ), .B (n_47), .CI (n_50));
FA_X1 i_25 (.CO (n_51), .S (n_50), .A (\image_in[0][1] [13] ), .B (\image_in[1][0] [13] ), .CI (\image_in[1][1] [13] ));
FA_X1 i_24 (.CO (n_49), .S (n_48), .A (\image_in[0][0] [12] ), .B (n_43), .CI (n_46));
FA_X1 i_23 (.CO (n_47), .S (n_46), .A (\image_in[0][1] [12] ), .B (\image_in[1][0] [12] ), .CI (\image_in[1][1] [12] ));
FA_X1 i_22 (.CO (n_45), .S (n_44), .A (\image_in[0][0] [11] ), .B (n_39), .CI (n_42));
FA_X1 i_21 (.CO (n_43), .S (n_42), .A (\image_in[0][1] [11] ), .B (\image_in[1][0] [11] ), .CI (\image_in[1][1] [11] ));
FA_X1 i_20 (.CO (n_41), .S (n_40), .A (\image_in[0][0] [10] ), .B (n_35), .CI (n_38));
FA_X1 i_19 (.CO (n_39), .S (n_38), .A (\image_in[0][1] [10] ), .B (\image_in[1][0] [10] ), .CI (\image_in[1][1] [10] ));
FA_X1 i_18 (.CO (n_37), .S (n_36), .A (\image_in[0][0] [9] ), .B (n_31), .CI (n_34));
FA_X1 i_17 (.CO (n_35), .S (n_34), .A (\image_in[0][1] [9] ), .B (\image_in[1][0] [9] ), .CI (\image_in[1][1] [9] ));
FA_X1 i_16 (.CO (n_33), .S (n_32), .A (\image_in[0][0] [8] ), .B (n_27), .CI (n_30));
FA_X1 i_15 (.CO (n_31), .S (n_30), .A (\image_in[0][1] [8] ), .B (\image_in[1][0] [8] ), .CI (\image_in[1][1] [8] ));
FA_X1 i_14 (.CO (n_29), .S (n_28), .A (\image_in[0][0] [7] ), .B (n_23), .CI (n_26));
FA_X1 i_13 (.CO (n_27), .S (n_26), .A (\image_in[0][1] [7] ), .B (\image_in[1][0] [7] ), .CI (\image_in[1][1] [7] ));
FA_X1 i_12 (.CO (n_25), .S (n_24), .A (\image_in[0][0] [6] ), .B (n_19), .CI (n_22));
FA_X1 i_11 (.CO (n_23), .S (n_22), .A (\image_in[0][1] [6] ), .B (\image_in[1][0] [6] ), .CI (\image_in[1][1] [6] ));
FA_X1 i_10 (.CO (n_21), .S (n_20), .A (\image_in[0][0] [5] ), .B (n_15), .CI (n_18));
FA_X1 i_9 (.CO (n_19), .S (n_18), .A (\image_in[0][1] [5] ), .B (\image_in[1][0] [5] ), .CI (\image_in[1][1] [5] ));
FA_X1 i_8 (.CO (n_17), .S (n_16), .A (\image_in[0][0] [4] ), .B (n_11), .CI (n_14));
FA_X1 i_7 (.CO (n_15), .S (n_14), .A (\image_in[0][1] [4] ), .B (\image_in[1][0] [4] ), .CI (\image_in[1][1] [4] ));
FA_X1 i_6 (.CO (n_13), .S (n_12), .A (\image_in[0][0] [3] ), .B (n_7), .CI (n_9));
FA_X1 i_5 (.CO (n_11), .S (n_10), .A (\image_in[0][1] [3] ), .B (\image_in[1][0] [3] ), .CI (\image_in[1][1] [3] ));
FA_X1 i_4 (.CO (n_9), .S (n_8), .A (\image_in[0][0] [2] ), .B (n_3), .CI (n_5));
FA_X1 i_3 (.CO (n_7), .S (n_6), .A (\image_in[0][1] [2] ), .B (\image_in[1][0] [2] ), .CI (\image_in[1][1] [2] ));
HA_X1 i_2 (.CO (n_5), .S (n_4), .A (\image_in[0][0] [1] ), .B (n_1));
FA_X1 i_1 (.CO (n_3), .S (n_2), .A (\image_in[0][1] [1] ), .B (\image_in[1][0] [1] ), .CI (\image_in[1][1] [1] ));
FA_X1 i_0 (.CO (n_1), .S (n_0), .A (\image_in[0][1] [0] ), .B (\image_in[1][0] [0] ), .CI (\image_in[1][1] [0] ));

endmodule //datapath

module Pooling_2x2_Routing (start, \image_in[0][0] , \image_in[0][1] , \image_in[0][2] , 
    \image_in[0][3] , \image_in[0][4] , \image_in[1][0] , \image_in[1][1] , \image_in[1][2] , 
    \image_in[1][3] , \image_in[1][4] , \image_in[2][0] , \image_in[2][1] , \image_in[2][2] , 
    \image_in[2][3] , \image_in[2][4] , \image_in[3][0] , \image_in[3][1] , \image_in[3][2] , 
    \image_in[3][3] , \image_in[3][4] , \image_in[4][0] , \image_in[4][1] , \image_in[4][2] , 
    \image_in[4][3] , \image_in[4][4] , finish, pixel_out);

output finish;
output [15:0] pixel_out;
input [15:0] \image_in[0][0] ;
input [15:0] \image_in[0][1] ;
input [15:0] \image_in[0][2] ;
input [15:0] \image_in[0][3] ;
input [15:0] \image_in[0][4] ;
input [15:0] \image_in[1][0] ;
input [15:0] \image_in[1][1] ;
input [15:0] \image_in[1][2] ;
input [15:0] \image_in[1][3] ;
input [15:0] \image_in[1][4] ;
input [15:0] \image_in[2][0] ;
input [15:0] \image_in[2][1] ;
input [15:0] \image_in[2][2] ;
input [15:0] \image_in[2][3] ;
input [15:0] \image_in[2][4] ;
input [15:0] \image_in[3][0] ;
input [15:0] \image_in[3][1] ;
input [15:0] \image_in[3][2] ;
input [15:0] \image_in[3][3] ;
input [15:0] \image_in[3][4] ;
input [15:0] \image_in[4][0] ;
input [15:0] \image_in[4][1] ;
input [15:0] \image_in[4][2] ;
input [15:0] \image_in[4][3] ;
input [15:0] \image_in[4][4] ;
input start;
wire uc_1;
wire uc_0;
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
wire n_0_0;

assign finish = 1'b1 ;
// WARNING . Detected multiport output net(s). Introducing ASSIGN statements.
// This may cause simulation/synthesis mismatches . 
assign pixel_out[15] = 1'b0 ;
assign pixel_out[14] = 1'b0 ;

datapath i_0_1 (.p_0 ({n_0_0, n_0_13, n_0_12, n_0_11, n_0_10, n_0_9, n_0_8, n_0_7, 
    n_0_6, n_0_5, n_0_4, n_0_3, n_0_2, n_0_1, uc_0, uc_1}), .\image_in[0][0]  ({\image_in[0][0] [15] , 
    \image_in[0][0] [14] , \image_in[0][0] [13] , \image_in[0][0] [12] , \image_in[0][0] [11] , 
    \image_in[0][0] [10] , \image_in[0][0] [9] , \image_in[0][0] [8] , \image_in[0][0] [7] , 
    \image_in[0][0] [6] , \image_in[0][0] [5] , \image_in[0][0] [4] , \image_in[0][0] [3] , 
    \image_in[0][0] [2] , \image_in[0][0] [1] , \image_in[0][0] [0] }), .\image_in[0][1]  ({
    \image_in[0][1] [15] , \image_in[0][1] [14] , \image_in[0][1] [13] , \image_in[0][1] [12] , 
    \image_in[0][1] [11] , \image_in[0][1] [10] , \image_in[0][1] [9] , \image_in[0][1] [8] , 
    \image_in[0][1] [7] , \image_in[0][1] [6] , \image_in[0][1] [5] , \image_in[0][1] [4] , 
    \image_in[0][1] [3] , \image_in[0][1] [2] , \image_in[0][1] [1] , \image_in[0][1] [0] })
    , .\image_in[1][0]  ({\image_in[1][0] [15] , \image_in[1][0] [14] , \image_in[1][0] [13] , 
    \image_in[1][0] [12] , \image_in[1][0] [11] , \image_in[1][0] [10] , \image_in[1][0] [9] , 
    \image_in[1][0] [8] , \image_in[1][0] [7] , \image_in[1][0] [6] , \image_in[1][0] [5] , 
    \image_in[1][0] [4] , \image_in[1][0] [3] , \image_in[1][0] [2] , \image_in[1][0] [1] , 
    \image_in[1][0] [0] }), .\image_in[1][1]  ({\image_in[1][1] [15] , \image_in[1][1] [14] , 
    \image_in[1][1] [13] , \image_in[1][1] [12] , \image_in[1][1] [11] , \image_in[1][1] [10] , 
    \image_in[1][1] [9] , \image_in[1][1] [8] , \image_in[1][1] [7] , \image_in[1][1] [6] , 
    \image_in[1][1] [5] , \image_in[1][1] [4] , \image_in[1][1] [3] , \image_in[1][1] [2] , 
    \image_in[1][1] [1] , \image_in[1][1] [0] }));
DFF_X1 \pixel_out_reg[0]  (.Q (pixel_out[0]), .CK (start), .D (n_0_1));
DFF_X1 \pixel_out_reg[1]  (.Q (pixel_out[1]), .CK (start), .D (n_0_2));
DFF_X1 \pixel_out_reg[2]  (.Q (pixel_out[2]), .CK (start), .D (n_0_3));
DFF_X1 \pixel_out_reg[3]  (.Q (pixel_out[3]), .CK (start), .D (n_0_4));
DFF_X1 \pixel_out_reg[4]  (.Q (pixel_out[4]), .CK (start), .D (n_0_5));
DFF_X1 \pixel_out_reg[5]  (.Q (pixel_out[5]), .CK (start), .D (n_0_6));
DFF_X1 \pixel_out_reg[6]  (.Q (pixel_out[6]), .CK (start), .D (n_0_7));
DFF_X1 \pixel_out_reg[7]  (.Q (pixel_out[7]), .CK (start), .D (n_0_8));
DFF_X1 \pixel_out_reg[8]  (.Q (pixel_out[8]), .CK (start), .D (n_0_9));
DFF_X1 \pixel_out_reg[9]  (.Q (pixel_out[9]), .CK (start), .D (n_0_10));
DFF_X1 \pixel_out_reg[10]  (.Q (pixel_out[10]), .CK (start), .D (n_0_11));
DFF_X1 \pixel_out_reg[11]  (.Q (pixel_out[11]), .CK (start), .D (n_0_12));
DFF_X1 \pixel_out_reg[12]  (.Q (pixel_out[12]), .CK (start), .D (n_0_13));
DFF_X1 \pixel_out_reg[13]  (.Q (pixel_out[13]), .CK (start), .D (n_0_0));

endmodule //Pooling_2x2

