OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[7];
creg meas[7];
ry(-3.70395916395932e-05) q[0];
ry(-0.00442170039621071) q[1];
y q[2];
ry(-0.170617652126909) q[3];
ry(0.0010625623385633) q[4];
ry(1.80257271848602) q[5];
ry(-1.61289835045308) q[6];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
ry(8.63071429435558e-05) q[0];
ry(0.0369544539206155) q[1];
ry(-1.11372231178174) q[2];
ry(1.107852001637) q[3];
ry(-0.139147581576273) q[4];
ry(0.230032295980412) q[5];
ry(-0.00956505160530256) q[6];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
ry(pi) q[0];
ry(2.81042969370367) q[1];
ry(1.12422995166413) q[2];
ry(0.0767570835250667) q[3];
ry(1.80145346752936) q[4];
ry(-1.57291053028464) q[5];
ry(-1.52970951586615) q[6];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];