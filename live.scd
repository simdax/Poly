{
	var taillePixel=8;
	var view, b,c;

	b=(offset:0,grandeur:50,nbPoints:5,root:0)
	.parent_((
		points:[],
		specs:(offset:\unipolar,
			grandeur:[1,110,nil,1],
			nbPoints:[1,30,nil,1]),
		calcP:{arg s,x,i;
			(x.sin*s.grandeur)@(x.cos*s.grandeur);
		}
	));

	view=UserView(nil, 400@400)
	.clearOnRefresh_(true)
	.front;
	view.addFlowLayout;

	view.drawFunc_{ arg self;
		var center=self.bounds.extent.asRect.center;
		Pen.translate(*(center.asArray+[0,50]));
		b.parent.points=nil;
		(0, (2pi/b.nbPoints) .. 2pi).do { |x,i|
			var p;
			x=x+(b.offset*2pi); 
			if(i==(b.root)){Pen.color=Color.red}
			{Pen.color=Color.black};
			Pen.fillRect(
				(taillePixel@taillePixel)
				.asRect.origin_(p=b.calcP(x,i))
			);
			b.parent.points=b.parent.points.add(p)
		};
		
	};

	view.animate_(true);

	//
	c=(gui:{ arg s;
		var g=b.gui(8,view);
		g.addAction(\nbPoints,
			{arg s; g.putSpec(\root,[0,b.nbPoints-1,nil,1])}
		).doAction;
		g
	}
	).gui;

	// result
	(win:view, params:b, dict:c)
}

