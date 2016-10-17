(
var chemin;

a=Poly.live;

a.params.points;

f={chemin=(..a.params.nbPoints).scramble};
f.value;

a.win.drawFunc=a.win.drawFunc.addFunc({
	arg s;
	Pen.width=0.2;
	Pen.moveTo(a.params.points[chemin[0]]);
	chemin.drop(1).do { |x|
		Pen.lineTo(a.params.points[x]);
		
		//		Pen.moveTo(x);
	};
	Pen.stroke;

});

a.dict.addAction(\nbPoints,{
	f.value
});
Button(a.win).action_{chemin=chemin.scramble};

)

