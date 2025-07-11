OPENQASM 2.0;
include "qelib1.inc";
qreg q[11];
creg c[11];
creg meas[11];
h q[0];
h q[1];
cz q[0],q[1];
h q[2];
h q[3];
cz q[2],q[3];
h q[4];
cz q[1],q[4];
h q[5];
cz q[4],q[5];
h q[6];
y q[7];
cz q[6],q[7];
h q[8];
cz q[5],q[8];
cz q[6],q[8];
h q[9];
cz q[2],q[9];
cz q[3],q[9];
h q[10];
cz q[0],q[10];
cz q[7],q[10];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10];
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