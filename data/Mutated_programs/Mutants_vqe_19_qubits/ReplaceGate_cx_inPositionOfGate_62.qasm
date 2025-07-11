OPENQASM 2.0;
include "qelib1.inc";
qreg q[19];
creg c[19];
creg meas[19];
ry(1.57073193274131) q[0];
ry(-1.57068807758159) q[1];
ry(1.57323244980775) q[2];
ry(-0.0497645179592719) q[3];
ry(-3.14158529452704) q[4];
ry(0.000276048920942356) q[5];
ry(-pi) q[6];
ry(-1.7216041640305e-05) q[7];
ry(0.0621011555565027) q[8];
ry(-pi) q[9];
ry(2.29046333604669) q[10];
ry(-0.000221153275987029) q[11];
ry(-0.253548255118865) q[12];
ry(pi) q[13];
ry(-1.57065297725269) q[14];
ry(-0.000329900047966916) q[15];
ry(-1.5704746777556) q[16];
ry(-pi) q[17];
ry(2.86436745247123) q[18];
cx q[17],q[18];
cx q[16],q[17];
cx q[15],q[16];
cx q[14],q[15];
cx q[13],q[14];
cx q[12],q[13];
cx q[11],q[12];
cx q[10],q[11];
ry(0.186124519898029) q[11];
ry(1.56943583051854) q[12];
ry(1.57022086367823) q[13];
ry(2.61360167992161) q[14];
ry(-0.528112579221869) q[15];
ry(-0.254712689875126) q[16];
ry(-0.254817893609402) q[17];
ry(1.29349614371878) q[18];
cx q[17],q[18];
cx q[16],q[17];
cx q[15],q[16];
cx q[14],q[15];
cx q[13],q[14];
cx q[12],q[13];
cx q[11],q[12];
ry(1.56955790856553) q[12];
ry(-1.82388747948479) q[13];
ry(1.57078967210712) q[14];
ry(-pi) q[15];
ry(-1.57073077383926) q[16];
ry(-0.000885932638584606) q[17];
ry(-0.645741257785053) q[18];
cx q[9],q[10];
ry(-0.141048016477052) q[10];
cx q[10],q[11];
ry(-0.122239796891551) q[11];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cz q[0],q[1];
ry(1.5708417594776) q[0];
ry(1.57083292079611) q[1];
ry(1.56716388739586) q[2];
ry(1.56836095302563) q[3];
ry(3.09176622024661) q[4];
ry(-3.21288158680841e-05) q[5];
ry(-6.22090483736401e-05) q[6];
ry(0.000355988044118356) q[7];
ry(-pi) q[8];
ry(-3.14108443063903) q[9];
cx q[9],q[10];
ry(-2.76932701759118) q[10];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
ry(-3.09790420762593) q[0];
ry(-pi) q[1];
ry(-3.0373511003379) q[2];
ry(0.000551908978410508) q[3];
ry(3.09761788492724) q[4];
ry(pi) q[5];
ry(-0.000179658152518253) q[6];
ry(0.043819633230069) q[7];
ry(-0.0182666220279084) q[8];
ry(0.000709600491551764) q[9];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18];
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
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];
measure q[16] -> meas[16];
measure q[17] -> meas[17];
measure q[18] -> meas[18];