(
var chemin;

var a, funcs; 
a=Poly.live;

//simple scramble
funcs=(
	f:{chemin=(..a.params.nbPoints-1).scramble},
	f2:{
		var niouchemin;
		(if(a.params.nbPoints>chemin.size){
			niouchemin=(chemin.size+1..a.params.nbPoints-1).scramble;
			chemin=chemin ++ niouchemin
		}{
			niouchemin=(chemin.size-1..a.params.nbPoints).scramble;
			chemin.removeAll(niouchemin)
		}).postln
	}
);

// init
funcs.f;
a.win.drawFunc=a.win.drawFunc.addFunc({
	arg s;
	Pen.width=0.2; 
	Pen.moveTo(a.params.points[chemin[0]]);
	chemin.drop(1).do { |x|
		Pen.lineTo(a.params.points[x]);
	};
	Pen.stroke;
});

// hooks
a.dict.addAction(\nbPoints,{
	funcs.f2
});
Button(a.win).action_{funcs.f};

//return
(win:a.win, path:{a.params.points.copy.atAll(chemin)})

)
