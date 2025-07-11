OPENQASM 2.0;
include "qelib1.inc";
qreg q[13];
creg c[13];
creg meas[13];
ry(1.5947652) q[0];
ry(1.6163407) q[1];
ry(1.647148) q[2];
ry(1.6641835) q[3];
ry(1.6479655) q[4];
ry(1.5135408) q[5];
cx q[5],q[4];
ry(0.86752035) q[4];
cx q[5],q[4];
cx q[4],q[3];
ry(0.26514636) q[3];
cx q[5],q[3];
ry(0.11948144) q[3];
cx q[4],q[3];
ry(0.54080891) q[3];
cx q[5],q[3];
cx q[3],q[2];
ry(0.083022902) q[2];
cx q[4],q[2];
ry(0.020503932) q[2];
cx q[3],q[2];
ry(0.16558102) q[2];
cx q[5],q[2];
ry(0.085907598) q[2];
cx q[3],q[2];
ry(0.0089247848) q[2];
cx q[4],q[2];
ry(0.042252153) q[2];
cx q[3],q[2];
ry(0.31061061) q[2];
cx q[5],q[2];
cx q[2],q[1];
ry(0.023352368) q[1];
cx q[3],q[1];
ry(0.0036541455) q[1];
cx q[2],q[1];
ry(0.04642649) q[1];
cx q[4],q[1];
ry(0.014284618) q[1];
cx q[2],q[1];
ry(0.0011717076) q[1];
cx q[3],q[1];
ry(0.0071726612) q[1];
cx q[2],q[1];
ry(0.090487054) q[1];
cx q[5],q[1];
ry(0.049684692) q[1];
cx q[2],q[1];
ry(0.0042975585) q[1];
cx q[3],q[1];
ry(0.00071186036) q[1];
cx q[2],q[1];
ry(0.0085779933) q[1];
cx q[4],q[1];
ry(0.025570002) q[1];
cx q[2],q[1];
ry(0.0021735007) q[1];
cx q[3],q[1];
ry(0.0128638) q[1];
cx q[2],q[1];
ry(0.16419765) q[1];
cx q[5],q[1];
cx q[1],q[0];
ry(0.0060781038) q[0];
cx q[2],q[0];
ry(0.00052904929) q[0];
cx q[1],q[0];
ry(0.012128274) q[0];
cx q[3],q[0];
ry(0.0020831693) q[0];
cx q[1],q[0];
ry(0.00010980752) q[0];
cx q[2],q[0];
ry(0.0010448914) q[0];
cx q[1],q[0];
ry(0.024037705) q[0];
cx q[4],q[0];
ry(0.0078460109) q[0];
cx q[1],q[0];
ry(0.0004078366) q[0];
cx q[2],q[0];
ry(4.9392404e-05) q[0];
cx q[1],q[0];
ry(0.00081254104) q[0];
cx q[3],q[0];
ry(0.0039722403) q[0];
cx q[1],q[0];
ry(0.00020705673) q[0];
cx q[2],q[0];
ry(0.0019923921) q[0];
cx q[1],q[0];
ry(0.046475455) q[0];
cx q[5],q[0];
ry(0.025949313) q[0];
cx q[1],q[0];
ry(0.0012748476) q[0];
cx q[2],q[0];
ry(0.00014903644) q[0];
cx q[1],q[0];
ry(0.0025400077) q[0];
cx q[3],q[0];
ry(0.00058369063) q[0];
cx q[1],q[0];
ry(3.8180209e-05) q[0];
cx q[2],q[0];
ry(0.00029308707) q[0];
cx q[1],q[0];
ry(0.0050038849) q[0];
cx q[4],q[0];
ry(0.013548306) q[0];
cx q[1],q[0];
ry(0.00067507279) q[0];
cx q[2],q[0];
ry(7.953033e-05) q[0];
cx q[1],q[0];
ry(0.0013450437) q[0];
cx q[3],q[0];
ry(0.0068533854) q[0];
cx q[1],q[0];
ry(0.00034263436) q[0];
cx q[2],q[0];
ry(0.0034368196) q[0];
cx q[1],q[0];
ry(0.083493363) q[0];
cx q[5],q[0];
ry(3*pi/8) q[6];
cry(0) q[0],q[6];
cry(0) q[1],q[6];
cry(0) q[2],q[6];
x q[2];
cry(0) q[3],q[6];
cry(0) q[4],q[6];
cry(0) q[5],q[6];
x q[5];
x q[7];
cx q[0],q[8];
s q[9];
ccx q[1],q[8],q[9];
x q[9];
x q[10];
ccx q[2],q[9],q[10];
ccx q[3],q[10],q[11];
ccx q[4],q[11],q[12];
x q[12];
ccx q[5],q[12],q[7];
x q[12];
ccx q[4],q[11],q[12];
ccx q[3],q[10],q[11];
x q[10];
ccx q[2],q[9],q[10];
x q[2];
x q[5];
cx q[7],q[6];
u(0.29425236,0,0) q[6];
cx q[7],q[6];
u(0.29425236,-pi,-pi) q[6];
cx q[7],q[6];
u(-0.0054519956,0,0) q[6];
cx q[7],q[6];
u(0.0054519956,0,0) q[6];
x q[9];
ccx q[1],q[8],q[9];
cx q[0],q[8];
ccx q[7],q[0],q[6];
cx q[7],q[6];
u(0.0054519956,0,0) q[6];
cx q[7],q[6];
u(-0.0054519956,0,0) q[6];
ccx q[7],q[0],q[6];
cx q[0],q[8];
cx q[7],q[6];
u(-0.010903991,0,0) q[6];
cx q[7],q[6];
u(0.010903991,0,0) q[6];
ccx q[7],q[1],q[6];
cx q[7],q[6];
u(0.010903991,0,0) q[6];
cx q[7],q[6];
u(-0.010903991,0,0) q[6];
ccx q[7],q[1],q[6];
ccx q[1],q[8],q[9];
cx q[7],q[6];
u(-0.021807982,0,0) q[6];
cx q[7],q[6];
u(0.021807982,0,0) q[6];
ccx q[7],q[2],q[6];
cx q[7],q[6];
u(0.021807982,0,0) q[6];
cx q[7],q[6];
u(-0.021807982,0,0) q[6];
ccx q[7],q[2],q[6];
x q[2];
cx q[7],q[6];
u(-0.043615965,0,0) q[6];
cx q[7],q[6];
u(0.043615965,0,0) q[6];
ccx q[7],q[3],q[6];
cx q[7],q[6];
u(0.043615965,0,0) q[6];
cx q[7],q[6];
u(-0.043615965,0,0) q[6];
ccx q[7],q[3],q[6];
cx q[7],q[6];
u(-0.08723193,0,0) q[6];
cx q[7],q[6];
u(0.08723193,0,0) q[6];
ccx q[7],q[4],q[6];
cx q[7],q[6];
u(0.08723193,0,0) q[6];
cx q[7],q[6];
u(-0.08723193,0,0) q[6];
ccx q[7],q[4],q[6];
cx q[7],q[6];
u(-0.17446386,0,0) q[6];
cx q[7],q[6];
u(0.17446386,0,0) q[6];
ccx q[7],q[5],q[6];
cx q[7],q[6];
u(0.17446386,0,0) q[6];
cx q[7],q[6];
u(-0.17446386,0,0) q[6];
ccx q[7],q[5],q[6];
x q[5];
x q[9];
ccx q[2],q[9],q[10];
x q[10];
ccx q[3],q[10],q[11];
ccx q[4],q[11],q[12];
x q[12];
ccx q[5],q[12],q[7];
x q[12];
ccx q[4],q[11],q[12];
ccx q[3],q[10],q[11];
ccx q[2],q[9],q[10];
x q[10];
x q[2];
x q[5];
x q[7];
x q[9];
ccx q[1],q[8],q[9];
cx q[0],q[8];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];