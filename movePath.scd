

(
var a=Poly.set; 
var pos=(x:0,y:0);
var envY, envX;
var recFunc={arg a,b;
	if(a.isCollection){a++[[a.last.last,b]]}
	{[[a,b]]}
};
var params=(
times:2,
pathX:[0,20,30,40,20],
pathY:[0,20,30,20,30],
f:{arg s; s.use{
	#envY,envX=[~pathY,~pathX].postln
	.collect(_.reduce(recFunc))
	.collect(_.collect({|x,i| Env(x,(~times.asArray@@i)).asPseg }))
	.collect(_.pseq(inf));
}}
);

d=
(
pathX:a.path.collect(_.x),
pathY:a.path.collect(_.y),
)
.parent_(params);

d.f;
j=(d.pathX[0])@(d.pathY[0]);

Pbind(
	\x, envX,
	\y, envY,
	\dur, 0.04,
	\do, Pfunc{arg in; pos=(x:in[\x],y:in[\y])}
).play(AppClock);

a.win.drawFunc=a.win.drawFunc.addFunc{
	Pen.use{
		Pen.fillRect(Rect(0,0,10,10).origin_(
			Point.performWithEnvir(\new,pos) + j
		).postln)
	}
};
)

