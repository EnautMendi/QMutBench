OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
creg c[9];
creg meas[9];
cx q[0],q[1];
cx q[0],q[2];
cx q[1],q[2];
cx q[0],q[3];
cx q[1],q[3];
cx q[2],q[3];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
cx q[0],q[5];
cx q[1],q[5];
cx q[2],q[5];
cx q[3],q[5];
cx q[4],q[5];
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[6];
cx q[4],q[6];
cx q[5],q[6];
cx q[0],q[7];
cx q[1],q[7];
cx q[2],q[7];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];
cx q[6],q[7];
cx q[0],q[8];
cx q[1],q[8];
cx q[0],q[1];
cx q[2],q[8];
cx q[0],q[2];
cx q[1],q[2];
cx q[3],q[8];
cx q[0],q[3];
cx q[1],q[3];
cx q[2],q[3];
cx q[4],q[8];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
cx q[5],q[8];
cx q[0],q[5];
cx q[1],q[5];
cx q[2],q[5];
cx q[3],q[5];
cx q[4],q[5];
cx q[6],q[8];
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[6];
cx q[4],q[6];
cx q[5],q[6];
cx q[7],q[8];
cx q[0],q[7];
cx q[1],q[7];
cx q[2],q[7];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];
cx q[6],q[7];
cx q[0],q[8];
cx q[1],q[8];
cx q[0],q[1];
cx q[2],q[8];
cx q[0],q[2];
cx q[1],q[2];
cx q[3],q[8];
cx q[0],q[3];
cx q[1],q[3];
cx q[2],q[3];
cx q[4],q[8];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
cx q[5],q[8];
cx q[0],q[5];
cx q[1],q[5];
cx q[2],q[5];
cx q[3],q[5];
cx q[4],q[5];
cx q[6],q[8];
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[6];
cx q[4],q[6];
cx q[5],q[6];
cx q[7],q[8];
cx q[0],q[7];
cx q[1],q[7];
cx q[2],q[7];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];
cx q[6],q[7];
u(0.6556157,0.15510159,0) q[0];
cx q[1],q[8];
u(0.097841045,0.64041009,0) q[1];
cx q[2],q[8];
u(0.19828995,0.82975729,0) q[2];
cx q[3],q[8];
u(0.22234265,0.66541431,0) q[3];
cx q[4],q[8];
u(0.63603936,0.80856355,0) q[4];
cx q[5],q[8];
u(0.52550392,0.93088825,0) q[5];
cx q[6],q[8];
u(0.87265046,0.45527024,0) q[6];
cx q[7],q[8];
u(0.29802418,0.0019710394,0) q[7];
u(0.16410084,0.94650602,0) q[8];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];