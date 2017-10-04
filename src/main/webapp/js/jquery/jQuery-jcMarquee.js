
;(function($){
	$.fn.jcMarquee = function(options) {
		var defaults = {
			'marquee':'x',
			'margin_bottom':'0',
			'margin_right':'0',
            'speed':'1'
		};
		var options = $.extend(defaults,options);
		return this.each(function() {
	        var $marquee = $(this),
			    $marquee_scroll = $marquee.children('ul');
			var	$marquee_car = $( "#car" );
			var $marquee_left = $marquee_scroll.find('li');
			if (options.marquee == 'x') {
				var x = 0,y=0,car_hight = 190,car_return=0;
		        $marquee_scroll.css('width','1000%');
				$marquee_left.find('div').css({'margin-right':options.margin_right});
				/*START*/
                function Marquee_x(){ 
					if(x==0){
						y=0
					}
	                $marquee.scrollLeft(++x);
					if(x%700==0){
						y++;
					}
					switch(y) {
						//車禍
						case 1:
							if(x%700 > 70 && x%700 < 320 && car_hight > 80){
								$marquee_car.css('margin-top',car_hight-- );
							}else if(x%700 > 320 && car_hight < 191){
								$marquee_car.css('margin-top',car_hight++ );
							}
							break;
						//路障
						case 0:
							if(x%700 > 140 && x%700 < 350 && car_hight > 90){
								$marquee_car.css('margin-top',car_hight-- );
							}else if(x%700 > 350 && car_hight < 191){
								$marquee_car.css('margin-top',car_hight++ );
							}
							break;
						default:
							break;
					}

					_margin = parseInt($marquee_left.find('div').css('margin-right'));
		            if(x==$marquee_left.width()+_margin) { x = 0 };
				};
				/*END*/
				
		    	var MyMar=setInterval(Marquee_x,options.speed); 
                $marquee.hover(function(){
                    clearInterval(MyMar);
                },function(){
                    MyMar=setInterval(Marquee_x,options.speed);
                });
			}
			if (options.marquee == 'y') {
				var y = 0;
		        $marquee_scroll.css('height','1000%');
				$marquee_left.find('div').css('margin-bottom',options.margin_bottom);
				$marquee_left.css('margin-bottom',options.margin_bottom);
                function Marquee_y(){ 
	                $marquee.scrollTop(++y);
					_margin = parseInt($marquee_left.find('div').css('margin-bottom'));
		            if(y==$marquee_left.height()+_margin) { y = 0 };
				};
		    	var MyMar=setInterval(Marquee_y,options.speed); 
                $marquee.hover(function(){
                    clearInterval(MyMar);
                },function(){
                    MyMar=setInterval(Marquee_y,options.speed);
                });
			};
		});
	};
})(jQuery)