OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
creg c[8];
creg meas[8];
u(pi/2,0,-pi) q[0];
u(pi/2,0,-pi) q[1];
u(pi/2,0,-pi) q[2];
u(pi/2,0,-pi) q[3];
u(pi/2,0,-pi) q[4];
u(pi/2,0,-pi) q[5];
u(pi/2,0,-pi) q[6];
u(0.92729522,0,0) q[7];
cx q[0],q[7];
u(-0.92729522,0,0) q[7];
cx q[0],q[7];
u(0.92729522,0,0) q[7];
cx q[1],q[7];
u(-1.8545904,0,0) q[7];
cx q[1],q[7];
u(1.8545904,0,0) q[7];
cx q[2],q[7];
u(-3.7091809,0,0) q[7];
cx q[2],q[7];
u(2.5740044,-pi,-pi) q[7];
cx q[3],q[7];
u(-7.4183617,0,0) q[7];
cx q[3],q[7];
u(1.1351764,0,0) q[7];
cx q[4],q[7];
u(-14.836723,0,0) q[7];
cx q[4],q[7];
u(2.2703529,0,0) q[7];
cx q[5],q[7];
u(-29.673447,0,0) q[7];
cx q[5],q[7];
u(1.7424796,-pi,-pi) q[7];
cx q[6],q[7];
u(-59.346894,0,0) q[7];
cx q[6],q[7];
u(59.346894,0,0) q[7];
h q[6];
cp(-pi/2) q[5],q[6];
cp(-pi/4) q[4],q[6];
cp(-pi/8) q[3],q[6];
cp(-pi/16) q[2],q[6];
cp(-pi/32) q[1],q[6];
cp(-pi/64) q[0],q[6];
h q[5];
cp(-pi/2) q[4],q[5];
cp(-pi/4) q[3],q[5];
cp(-pi/8) q[2],q[5];
cp(-pi/16) q[1],q[5];
cp(-pi/32) q[0],q[5];
h q[4];
cp(-pi/2) q[3],q[4];
cp(-pi/4) q[2],q[4];
cp(-pi/8) q[1],q[4];
cp(-pi/16) q[0],q[4];
h q[3];
cp(-pi/2) q[2],q[3];
cp(-pi/4) q[1],q[3];
cp(-pi/8) q[0],q[3];
h q[2];
cp(-pi/2) q[1],q[2];
cp(-pi/4) q[0],q[2];
h q[1];
cp(-pi/2) q[0],q[1];
h q[0];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
rz(pi/2) q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];