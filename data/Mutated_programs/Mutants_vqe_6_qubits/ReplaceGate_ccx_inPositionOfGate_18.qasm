OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
creg c[6];
creg meas[6];
ry(0.0969221017129248) q[0];
ry(0.168468438035128) q[1];
ry(0.0354650220605822) q[2];
ry(1.17710803918365) q[3];
ry(-0.0700233921310761) q[4];
ry(0.908058648702977) q[5];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
ry(1.1269721682698) q[0];
ry(1.52486483649232) q[1];
ry(1.56539099168023) q[2];
ry(1.70233809584903) q[3];
ry(1.7136285725121) q[4];
ry(-2.47803995388745) q[5];
cx q[4],q[5];
swap q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
ry(-2.0125964746234) q[0];
ry(1.46337859736903) q[1];
ry(1.40213462496913) q[2];
ry(1.53545289005977) q[3];
ry(-2.74477512583519) q[4];
ry(-1.61354600013194) q[5];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];