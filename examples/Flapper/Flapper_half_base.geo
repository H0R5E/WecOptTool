
Mesh.Algorithm = 9;

// Define in command line call (using -setnumber)
//lc = 0.5;
//length = 10;
//width = 4;
//height = 6;
depth = 10;

Point(1) = {0, 0, 0, lc};
Point(2) = {length, 0, 0, lc};
Point(3) = {length, width / 2, 0, lc};
Point(4) = {0, width / 2, 0, lc};

Point(5) = {0, 0, height, lc};
Point(6) = {length, 0, height, lc};
Point(7) = {length, width / 2, height, lc};
Point(8) = {0, width / 2, height, lc};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
Line(9) = {1, 5};
Line(10) = {2, 6};
Line(11) = {3, 7};
Line(12) = {4, 8};

Line Loop(1) = {1, 2, 3, 4};
Line Loop(2) = {5, 6, 7, 8};
Line Loop(3) = {1, 10, -5, -9};
Line Loop(4) = {2, 11, -6, -10};
Line Loop(5) = {3, 12, -7, -11};
Line Loop(6) = {4, 9, -8, -12};

Surface(1) = {-1};
Surface(2) = {2};
Surface(4) = {4};
Surface(5) = {5};
Surface(6) = {6};

Surface Loop(1) = {1, 2, 4, 5, 6};
Volume(1) = {1};
Translate {-length / 2, 0, -depth} { Volume{1}; }

Physical Volume("flapper") = {1};

Mesh 2;
RecombineMesh;
