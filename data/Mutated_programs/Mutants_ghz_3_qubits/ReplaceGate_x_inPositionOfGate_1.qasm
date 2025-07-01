OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
x q[2];
cx q[2],q[1];
cx q[1],q[0];
barrier q[0],q[1],q[2];