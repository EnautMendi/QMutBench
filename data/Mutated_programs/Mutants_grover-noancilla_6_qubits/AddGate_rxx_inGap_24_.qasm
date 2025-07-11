OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
creg c[6];
creg meas[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
x q[5];
cp(pi/16) q[4],q[5];
cx q[4],q[3];
cp(-pi/16) q[3],q[5];
cx q[4],q[3];
cp(pi/16) q[3],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
rxx(pi) q[4],q[0];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[1];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[2];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[3];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
u(pi/2,0,0) q[0];
u(pi/2,0,0) q[4];
cu(pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cu(-pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
cu(pi/8,0,0,0) q[0],q[4];
cx q[0],q[1];
cu(-pi/8,0,0,0) q[1],q[4];
cx q[0],q[1];
cu(pi/8,0,0,0) q[1],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
cu(pi/8,0,0,0) q[2],q[4];
cx q[1],q[2];
u(pi/2,-pi,-pi) q[1];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
u(pi/2,-pi,-pi) q[0];
cu(pi/8,0,0,0) q[2],q[4];
u(pi/2,-pi,-pi) q[2];
p(3*pi/4) q[3];
u(pi/2,-pi,-pi) q[4];
cp(pi/16) q[4],q[5];
cx q[4],q[3];
cp(-pi/16) q[3],q[5];
cx q[4],q[3];
cp(pi/16) q[3],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[1];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[2];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[3];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
u(pi/2,0,0) q[0];
u(pi/2,0,0) q[4];
cu(pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cu(-pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
cu(pi/8,0,0,0) q[0],q[4];
cx q[0],q[1];
cu(-pi/8,0,0,0) q[1],q[4];
cx q[0],q[1];
cu(pi/8,0,0,0) q[1],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
cu(pi/8,0,0,0) q[2],q[4];
cx q[1],q[2];
u(pi/2,-pi,-pi) q[1];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
u(pi/2,-pi,-pi) q[0];
cu(pi/8,0,0,0) q[2],q[4];
u(pi/2,-pi,-pi) q[2];
p(3*pi/4) q[3];
u(pi/2,-pi,-pi) q[4];
cp(pi/16) q[4],q[5];
cx q[4],q[3];
cp(-pi/16) q[3],q[5];
cx q[4],q[3];
cp(pi/16) q[3],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[1];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[2];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[3];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
u(pi/2,0,0) q[0];
u(pi/2,0,0) q[4];
cu(pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cu(-pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
cu(pi/8,0,0,0) q[0],q[4];
cx q[0],q[1];
cu(-pi/8,0,0,0) q[1],q[4];
cx q[0],q[1];
cu(pi/8,0,0,0) q[1],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
cu(pi/8,0,0,0) q[2],q[4];
cx q[1],q[2];
u(pi/2,-pi,-pi) q[1];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
u(pi/2,-pi,-pi) q[0];
cu(pi/8,0,0,0) q[2],q[4];
u(pi/2,-pi,-pi) q[2];
p(3*pi/4) q[3];
u(pi/2,-pi,-pi) q[4];
cp(pi/16) q[4],q[5];
cx q[4],q[3];
cp(-pi/16) q[3],q[5];
cx q[4],q[3];
cp(pi/16) q[3],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[3],q[2];
cp(-pi/16) q[2],q[5];
cx q[4],q[2];
cp(pi/16) q[2],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[2],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[3],q[1];
cp(-pi/16) q[1],q[5];
cx q[4],q[1];
cp(pi/16) q[1],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[1],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[1];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[2],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[2];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
cx q[3],q[0];
cp(-pi/16) q[0],q[5];
u(pi/2,0,0) q[3];
cx q[4],q[0];
cp(pi/16) q[0],q[5];
u(pi/2,0,0) q[0];
u(pi/2,0,0) q[4];
cu(pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[2],q[3];
u(pi/2,0,3*pi/4) q[3];
cu(-pi/2,0,0,0) q[3],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
u(pi/2,pi/4,3*pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
p(pi/4) q[3];
cx q[1],q[3];
p(-pi/4) q[3];
cx q[0],q[3];
cu(pi/8,0,0,0) q[0],q[4];
cx q[0],q[1];
cu(-pi/8,0,0,0) q[1],q[4];
cx q[0],q[1];
cu(pi/8,0,0,0) q[1],q[4];
u(pi/2,pi/4,-pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
cu(pi/8,0,0,0) q[2],q[4];
cx q[1],q[2];
u(pi/2,-pi,-pi) q[1];
cu(-pi/8,0,0,0) q[2],q[4];
cx q[0],q[2];
u(pi/2,-pi,-pi) q[0];
cu(pi/8,0,0,0) q[2],q[4];
u(pi/2,-pi,-pi) q[2];
p(3*pi/4) q[3];
u(pi/2,-pi,-pi) q[4];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];