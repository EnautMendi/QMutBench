OPENQASM 2.0;
include "qelib1.inc";
qreg q[12];
creg c[12];
creg meas[12];
u(pi/2,0,-pi) q[0];
u(pi/2,0,-pi) q[1];
u(pi/2,0,-pi) q[2];
u(pi/2,0,-pi) q[3];
u(pi/2,0,-pi) q[4];
u(pi/2,0,-pi) q[5];
u(pi/2,0,-pi) q[6];
u(pi/2,0,-pi) q[7];
u(pi/2,0,-pi) q[8];
u(pi/2,0,-pi) q[9];
u(pi/2,0,-pi) q[10];
u(0.92729522,0,0) q[11];
cx q[0],q[11];
u(-0.92729522,0,0) q[11];
cx q[0],q[11];
u(0.92729522,0,0) q[11];
cx q[1],q[11];
u(-1.8545904,0,0) q[11];
cx q[1],q[11];
u(1.8545904,0,0) q[11];
cx q[2],q[11];
u(-3.7091809,0,0) q[11];
cx q[2],q[11];
u(2.5740044,-pi,-pi) q[11];
cx q[3],q[11];
u(-7.4183617,0,0) q[11];
cx q[3],q[11];
u(1.1351764,0,0) q[11];
cx q[4],q[11];
u(-14.836723,0,0) q[11];
cx q[4],q[11];
u(2.2703529,0,0) q[11];
cx q[5],q[11];
u(-29.673447,0,0) q[11];
cx q[5],q[11];
u(1.7424796,-pi,-pi) q[11];
cx q[6],q[11];
u(-59.346894,0,0) q[11];
cx q[6],q[11];
u(2.7982262,0,0) q[11];
cx q[7],q[11];
u(-118.69379,0,0) q[11];
cx q[7],q[11];
u(0.68673293,-pi,-pi) q[11];
cx q[8],q[11];
u(-237.38758,0,0) q[11];
cx q[8],q[11];
u(1.3734659,-pi,-pi) q[11];
cx q[9],q[11];
u(-474.77515,0,0) q[11];
cx q[9],q[11];
u(2.7469317,-pi,-pi) q[11];
cx q[10],q[11];
u(-949.5503,0,0) q[11];
cx q[10],q[11];
u(949.5503,0,0) q[11];
h q[10];
cp(-pi/2) q[9],q[10];
cp(-pi/4) q[8],q[10];
cp(-pi/8) q[7],q[10];
cp(-pi/16) q[6],q[10];
cp(-pi/32) q[5],q[10];
cp(-pi/64) q[4],q[10];
cp(-pi/128) q[3],q[10];
cp(-pi/256) q[2],q[10];
cp(-pi/512) q[1],q[10];
cp(-pi/1024) q[0],q[10];
h q[9];
cp(-pi/2) q[8],q[9];
cp(-pi/4) q[7],q[9];
cp(-pi/8) q[6],q[9];
cp(-pi/16) q[5],q[9];
cp(-pi/32) q[4],q[9];
cp(-pi/64) q[3],q[9];
cp(-pi/128) q[2],q[9];
cp(-pi/256) q[1],q[9];
cp(-pi/512) q[0],q[9];
h q[8];
cp(-pi/2) q[7],q[8];
cp(-pi/4) q[6],q[8];
cp(-pi/8) q[5],q[8];
cp(-pi/16) q[4],q[8];
cp(-pi/32) q[3],q[8];
cp(-pi/64) q[2],q[8];
cp(-pi/128) q[1],q[8];
cp(-pi/256) q[0],q[8];
h q[7];
cp(-pi/2) q[6],q[7];
cp(-pi/4) q[5],q[7];
cp(-pi/8) q[4],q[7];
cp(-pi/16) q[3],q[7];
cp(-pi/32) q[2],q[7];
cp(-pi/64) q[1],q[7];
cp(-pi/128) q[0],q[7];
h q[6];
cp(-pi/2) q[5],q[6];
cp(-pi/4) q[4],q[6];
cp(-pi/8) q[3],q[6];
cp(-pi/16) q[2],q[6];
cp(-pi/32) q[1],q[6];
cp(-pi/64) q[0],q[6];
cx q[6],q[5];
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
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11];
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