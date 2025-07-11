OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[5];
creg meas[5];
h q[0];
h q[1];
cz q[0],q[1];
h q[2];
h q[3];
cz q[1],q[3];
cz q[2],q[3];
h q[4];
cz q[0],q[4];
cz q[2],q[4];
barrier q[0],q[1],q[2],q[3],q[4];
swap q[2],q[1];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];