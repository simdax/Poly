(

var taillePixel=8;

b=(offset:0,grandeur:50,nbPoints:5,root:0)
.parent_((
	specs:(offset:\unipolar,
		grandeur:[1,50,nil,1],
		nbPoints:[1,30,nil,1])
));

a=UserView(nil, 400@400)
.clearOnRefresh_(true)
.front;
a.addFlowLayout;

a.drawFunc_{ arg self;
	var center=self.bounds.extent.asRect.center;
	Pen.translate(*center.asArray);
	
	(0, (2pi/b.nbPoints) .. 2pi).do { |x,i|
		x=x+(b.offset*2pi); 
		if(i==b.root){Pen.color=Color.red}
		{Pen.color=Color.black};
		Pen.fillRect(Rect(
			x.sin*b.grandeur,
			x.cos*b.grandeur,
			taillePixel, taillePixel))
	};
	
};

c=b.gui(8,a);
c.addAction(\nbPoints,
	{arg s; c.putSpec(\root,[0,b.nbPoints-1,nil,1])}
);
Pbind(\do,Pfunc{a.refresh},\dur,0.05).play(AppClock)
)

