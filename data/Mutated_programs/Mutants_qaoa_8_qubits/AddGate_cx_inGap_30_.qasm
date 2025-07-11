OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
creg c[8];
creg meas[8];
h q[0];
h q[1];
h q[2];
rzz(4.99372414680687) q[0],q[2];
h q[3];
rzz(4.99372414680687) q[2],q[3];
rx(-0.644666633247637) q[2];
h q[4];
h q[5];
rzz(4.99372414680687) q[1],q[5];
rzz(4.99372414680687) q[4],q[5];
rx(-0.644666633247637) q[5];
h q[6];
rzz(4.99372414680687) q[0],q[6];
rx(-0.644666633247637) q[0];
rzz(-5.63835456257789) q[0],q[2];
rzz(4.99372414680687) q[4],q[6];
rx(-0.644666633247637) q[4];
rx(-0.644666633247637) q[6];
rzz(-5.63835456257789) q[0],q[6];
rx(7.57277847467952) q[0];
h q[7];
rzz(4.99372414680687) q[1],q[7];
rx(-0.644666633247637) q[1];
rzz(-5.63835456257789) q[1],q[5];
rzz(4.99372414680687) q[3],q[7];
rx(-0.644666633247637) q[3];
rzz(-5.63835456257789) q[2],q[3];
rx(7.57277847467952) q[2];
cx q[4],q[5];
rzz(-5.63835456257789) q[4],q[5];
rzz(-5.63835456257789) q[4],q[6];
rx(7.57277847467952) q[4];
rx(7.57277847467952) q[5];
rx(7.57277847467952) q[6];
rx(-0.644666633247637) q[7];
rzz(-5.63835456257789) q[1],q[7];
rx(7.57277847467952) q[1];
rzz(-5.63835456257789) q[3],q[7];
rx(7.57277847467952) q[3];
rx(7.57277847467952) q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];