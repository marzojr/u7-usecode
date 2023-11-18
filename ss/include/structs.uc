struct Position2D {
	var x;
	var y;
}

struct Position {
	var x;
	var y;
	var z;
}

enum Position {
	X = &struct<Position>::x,
	Y = &struct<Position>::y,
	Z = &struct<Position>::z,
};

struct FindSpec {
	struct<Position>;
	var quality;
	var framenum;
}

struct PosObj {
	struct<Position>;
	var obj;
}

struct ObjPos {
	var obj;
	struct<Position>;
}
