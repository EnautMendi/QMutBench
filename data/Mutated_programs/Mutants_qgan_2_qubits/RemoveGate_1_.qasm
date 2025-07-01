OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
creg c[2];
ry(4.43809726294417) q[0];
ry(1.16893331500669) q[1];
barrier q[0],q[1];