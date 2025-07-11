OPENQASM 2.0;
include "qelib1.inc";
qreg q[4];
creg c[4];
creg meas[4];
cz q[2],q[3];
h q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
barrier q[0],q[1],q[2],q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];