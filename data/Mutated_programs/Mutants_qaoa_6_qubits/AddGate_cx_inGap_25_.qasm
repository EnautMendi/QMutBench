OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
creg c[6];
creg meas[6];
h q[0];
h q[1];
h q[2];
rzz(5.62724885812889) q[0],q[2];
h q[3];
rzz(5.62724885812889) q[0],q[3];
rx(-5.04047412391158) q[0];
h q[4];
rzz(5.62724885812889) q[1],q[4];
rzz(5.62724885812889) q[2],q[4];
rx(-5.04047412391158) q[2];
rzz(-4.38434633329271) q[0],q[2];
rx(-5.04047412391158) q[4];
h q[5];
rzz(5.62724885812889) q[1],q[5];
rx(-5.04047412391158) q[1];
rzz(-4.38434633329271) q[1],q[4];
rzz(-4.38434633329271) q[2],q[4];
rx(-5.62738622902127) q[2];
rzz(5.62724885812889) q[3],q[5];
rx(-5.04047412391158) q[3];
rzz(-4.38434633329271) q[0],q[3];
rx(-5.62738622902127) q[0];
rx(-5.62738622902127) q[4];
cx q[4],q[5];
rx(-5.04047412391158) q[5];
rzz(-4.38434633329271) q[1],q[5];
rx(-5.62738622902127) q[1];
rzz(-4.38434633329271) q[3],q[5];
rx(-5.62738622902127) q[3];
rx(-5.62738622902127) q[5];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];