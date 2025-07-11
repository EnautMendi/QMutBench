OPENQASM 2.0;
include "qelib1.inc";
qreg q[13];
creg c[13];
creg meas[13];
u(1.9339027,-pi,0) q[0];
u(1.9126792,-pi,0) q[1];
cz q[0],q[1];
u(0.031588282,0,-pi) q[2];
cz q[0],q[2];
cz q[1],q[2];
u(1.4296198,-pi,0) q[3];
cz q[0],q[3];
cz q[1],q[3];
cz q[2],q[3];
u(2.2765603,0,-pi) q[4];
cz q[0],q[4];
cz q[1],q[4];
cz q[2],q[4];
cz q[3],q[4];
u(1.6248769,-pi,0) q[5];
cz q[0],q[5];
cz q[1],q[5];
cz q[2],q[5];
cz q[3],q[5];
cz q[4],q[5];
u(0.72359269,0,-pi) q[6];
cz q[0],q[6];
cz q[1],q[6];
cz q[2],q[6];
cz q[3],q[6];
cz q[4],q[6];
cz q[5],q[6];
u(1.9001905,0,-pi) q[7];
cz q[0],q[7];
cz q[1],q[7];
cz q[2],q[7];
cz q[3],q[7];
cz q[4],q[7];
cz q[5],q[7];
cz q[6],q[7];
u(2.4086948,0,-pi) q[8];
cz q[0],q[8];
cz q[1],q[8];
cz q[2],q[8];
cz q[3],q[8];
cz q[4],q[8];
cz q[5],q[8];
cz q[6],q[8];
cz q[7],q[8];
u(2.077199,0,-pi) q[9];
cz q[0],q[9];
cz q[1],q[9];
cz q[2],q[9];
cz q[3],q[9];
cz q[4],q[9];
cz q[5],q[9];
cz q[6],q[9];
cz q[7],q[9];
cz q[8],q[9];
u(3.0384081,-pi,0) q[10];
cz q[0],q[10];
cz q[1],q[10];
cz q[2],q[10];
cz q[3],q[10];
cz q[4],q[10];
cz q[5],q[10];
cz q[6],q[10];
cz q[7],q[10];
cz q[8],q[10];
cz q[9],q[10];
u(1.5023172,0,-pi) q[11];
cz q[0],q[11];
id q[11];
cz q[1],q[11];
cz q[2],q[11];
cz q[3],q[11];
cz q[4],q[11];
cz q[5],q[11];
cz q[6],q[11];
cz q[7],q[11];
cz q[8],q[11];
cz q[9],q[11];
cz q[10],q[11];
u(0.11087838,-pi,0) q[12];
cz q[0],q[12];
ry(6.22267597160115) q[0];
cz q[1],q[12];
ry(4.91901898508182) q[1];
cz q[2],q[12];
ry(1.86821500102076) q[2];
cz q[3],q[12];
ry(5.87267428232485) q[3];
cz q[4],q[12];
ry(4.01177891921193) q[4];
cz q[5],q[12];
ry(4.97407534203059) q[5];
cz q[6],q[12];
ry(4.90576568066876) q[6];
cz q[7],q[12];
ry(4.46071963310496) q[7];
cz q[8],q[12];
ry(3.22419785237405) q[8];
cz q[9],q[12];
cz q[10],q[12];
ry(3.96876892047689) q[10];
cz q[11],q[12];
ry(4.11901365760149) q[11];
ry(0.804918224031419) q[12];
ry(5.54006029805382) q[9];
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