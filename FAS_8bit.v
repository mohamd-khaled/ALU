module FAS_8bit (
input i_C,
input [7:0] i_A,
input [7:0] i_B,
output o_C,
output [7:0] o_S
);

wire [6:0] C;
wire [7:0] D;
xor (D[0], i_C, i_B[0]);
xor (D[1], i_C, i_B[1]);
xor (D[2], i_C, i_B[2]);
xor (D[3], i_C, i_B[3]);
xor (D[4], i_C, i_B[4]);
xor (D[5], i_C, i_B[5]);
xor (D[6], i_C, i_B[6]);
xor (D[7], i_C, i_B[7]);

FA U0(
.i_A(i_A[0]),
.i_B(D[0]),
.i_C(i_C),
.o_S(o_S[0]),
.o_C(C[0])
);

FA U1(
.i_A(i_A[1]),
.i_B(D[1]),
.i_C(C[0]),
.o_S(o_S[1]),
.o_C(C[1])
);

FA U2(
.i_A(i_A[2]),
.i_B(D[2]),
.i_C(C[1]),
.o_S(o_S[2]),
.o_C(C[2])
);

FA U3(
.i_A(i_A[3]),
.i_B(D[3]),
.i_C(C[2]),
.o_S(o_S[3]),
.o_C(C[3])
);

FA U4(
.i_A(i_A[4]),
.i_B(D[4]),
.i_C(C[3]),
.o_S(o_S[4]),
.o_C(C[4])
);

FA U5(
.i_A(i_A[5]),
.i_B(D[5]),
.i_C(C[4]),
.o_S(o_S[5]),
.o_C(C[5])
);

FA U6(
.i_A(i_A[6]),
.i_B(D[6]),
.i_C(C[5]),
.o_S(o_S[6]),
.o_C(C[6])
);

FA U7(
.i_A(i_A[7]),
.i_B(D[7]),
.i_C(C[6]),
.o_S(o_S[7]),
.o_C(o_C)
);
endmodule