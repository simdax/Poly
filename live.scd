(

b=(offset:0,grandeur:20,nbPoints:5).parent_((
specs:(offset:\unipolar,grandeur:[1,50,nil,1],nbPoints:[3,10,nil,1])
));

a=UserView(nil, 400@400)
.clearOnRefresh_(true)
.front;
a.addFlowLayout;
a.drawFunc_{ arg self;
	var center=self.bounds.extent.asRect.center;
	Pen.translate(*center.asArray);
	
	(..b.nbPoints-1).do { |x|
		x=x+b.offset*2;
		Pen.fillRect(Rect(x.cos*b.grandeur,
			x.sin*b.grandeur, 10, 10))
	};
	
};

b.gui(8,a);
Pbind(\do,Pfunc{a.refresh},\dur,0.05).play(AppClock)
)
