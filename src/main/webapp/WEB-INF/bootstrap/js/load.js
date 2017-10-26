/*!
 * jQuery loading Plugin v1.0.1
 *
 * Copyright 2017 Nick Han
 */
(function (factory) {
	if (typeof define === 'function' && define.amd) {
		// AMD
		define(['jquery'], factory);
	} else if (typeof exports === 'object') {
		// CommonJS
		factory(require('jquery'));
	} else {
		// Browser globals
		factory(jQuery);
	}
}(function ($) {
	//给窗口添加滚动事件，在滚动时遮罩跟着元素移动
	$(window).bind("scroll",function() {
		var masks = $(".mask");
		for (var i = 0; i < masks.length; i++) {
			var ele_id = $(masks[i]).attr("ele");
			var eleTop= $(ele_id).offset().top;
			var gun = $(document).scrollTop();
            var top = eleTop-gun;
			$(masks[i]).css({
				"top": top+'px'
			});
		}
	});
	
	//timeout cache
	var cache = {};
	
	/*
	 * full screen loading mask
	 */
	$.mask_fullscreen = function(timeout){
		if($(".mask[ele=full_screen]").length > 0){
			return;
		}
		//禁止滚动
		$("body").addClass("scroll-off");
		var mask = '<div class="mask" ele="full_screen"><div>数据加载中...</div></div>';
		$("body").append(mask);
		clearTimeout(cache["full_screen"]);
		if(timeout && timeout > 0){
			var s = setTimeout(function(){
				$(".mask[ele=full_screen]").remove();
				$("body").removeClass("scroll-off");
			}, timeout);
			cache["full_screen"] = s;
		}
	}
	

	
	/*
	 * close certain loading mask
	 */
	$.mask_close = function(ele_id){
		$(".mask[ele="+ele_id+"]").remove();
	}
	
	/*
	 * close all loading mask
	 */
	$.mask_close_all = function(){
		$(".mask").remove();
	}
}));