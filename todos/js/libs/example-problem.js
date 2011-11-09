$(document).ready(function(){

	/* this doesn't work with our current setup
$("div.row").click(function(){
		window.location=$(this).find("a").attr("href");
		return false;
	});
*/
	$('div.row').live('hover',function() {
		$(this).addClass('active');
		swapimg($(this).find('.imageopen'));
	}, function() {
		$(this).removeClass('active');
		swapimg($(this).find('.imageopen'));
	});
	
	$('div.row').live({mouseenter: function(){
		$(this).addClass('active');
	},mouseleave: function(){
		$(this).removeClass('active');
		}
	});

	$('.votenow').hover(function() {
		$(this).addClass('active');
	}, function() {
		$(this).removeClass('active');
	});
	
	$('.stripe').hover(function() {
		$(this).parent().find('.votenow').addClass('active');
	}, function() {
		$(this).parent().find('.votenow').removeClass('active');
	});
	
	$('.flyout').hover(function() {
		$('.anonymous').css({'background-position': '0 -13px'});
	}, function() {
		$('.anonymous').css({'background-position': '0 0px'});
	});
	
	function swapimg(img,action){
		if ($(img).attr('data-alt')) {
			var toimg = $(img).attr('data-alt');
			var fromimg = $(img).attr('src');
			$(img).attr('data-alt', fromimg);
			$(img).attr('src', toimg);
			//$(img).attr('src',toimg);
			/*
$(img).fadeTo(400, 0.1, function(){
				$(img).attr('src', toimg).bind('readystatechange load', function(){
				if (this.complete) 
					$(this).fadeTo(200, 1);
				});
			});
*/
			
		}
	}
	
	/*
$('.imageopen').live('hover',function() {
		
		swapimg(this);
		
	}, function() {
		
		swapimg(this);
		
	});
*/
	
	$('.heart').live({mouseenter: function(){
		$(this).addClass('active');
	},mouseleave: function(){
		$(this).removeClass('active');
		}
	});
	
	$('.heart').hover(function() {
		$(this).addClass('active');
	}, function() {
		$(this).removeClass('active');
	});

	$('a.mediathumb span.hover').hide();
	$("a.mediathumb").each(function() {
		$(this).hover(function() {
			$(this).find('span.hover').fadeIn(100);
		}, function() {
			$(this).find('span.hover').fadeOut(100);
		})
	});

	$("#recent-votes ul li:nth-child(3)").addClass("last");
	$("#recent-votes ul li:nth-child(6)").addClass("last");
	$("#recent-votes ul li:nth-child(9)").addClass("last");
	$("#recent-votes ul li:nth-child(12)").addClass("last");
	$("#recent-votes ul li:nth-child(15)").addClass("last");

	/*
$('div.attach').hover(function() {
		$(this).addClass('hover');
	}, function() {
		$(this).removeClass('hover');
	});
*/

	/*
$('a.mediathumba').fancybox({
		'overlayColor'		: '#000',
		'overlayOpacity'	: 0.75,
		'showCloseButton'	: true
	});
*/

	$('a.signin,a.join,a.forgotpassword,a.recent-votes-lightbox').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'overlayOpacity'	: 0.75,
		'showCloseButton'	: false,
		'showCloseButton'	: true
	});
	
	$('a.facebook-friends').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'overlayOpacity'	: 0.75,
		'showCloseButton'	: false,
		'showCloseButton'	: true,
		'onClosed'			: function (){
			if ($('#fbfriendlist').length == 0) {
				$('#shareFacebookFriends').toggleClass('on');
			}
		}
	});
	
	$('a.map-votes-lightbox').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'overlayOpacity'	: 0.75,
		'showCloseButton'	: false,
		'showCloseButton'	: true,
		'onClosed'			: function (){
			$('#map-div').append($('#map'));
			$('#map').css('height', 200);
			$('#map').css('width',603);
			$('#googleMap').css('height',200);
			$('#googleMap').css('width',603);
		}
	});
	
	$('a.user-votes-map-votes-lightbox').fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'overlayOpacity'	: 0.75,
		'showCloseButton'	: false,
		'showCloseButton'	: true,
		'onClosed'			: function (){
			$('#map-div').append($('#map'));
			$('#map').css('height', 200);
			$('#map').css('width',240);
			$('#googleMap').css('height',200);
			$('#googleMap').css('width',240);
		},
		'onComplete'			: function (){
			//map.checkResize();
			$.fancybox.center();
		}
	});

	/* comment out more stuff that isn't working from design team
$('#options a.switch').each(function() {
		$(this).click(function() {
			$(this).toggleClass('on');
			return false;
		})
	});
*/

	$('#signup .select').jqTransform();
	$('#fb_filter_form .select').jqTransform();
	$('#filters-list .select').jqTransform();
	
	$('.jqTransformSelectWrapper ul li:first-child').addClass("first");
	$('.jqTransformSelectWrapper ul li:last-child').addClass("last");
	$('.jqTransformSelectWrapper div span').click(function () {
		$(this).toggleClass('active');
    });
	
	$('.expand_userinfo').live("click", function()
	{
		var expand_selection = $(this).attr('data-user');
		var selection = '#'+ expand_selection.toString() + '_expand';
		var expanded = $(this).parent().parent().parent().parent().find(selection);
		expanded.slideToggle("slow", function()
		{
			var args = {
				action: "user.ajaxGetUserDetails",
				userid: expand_selection
			};
			
			if (expanded.find('.block').length == 0) {
				expanded.append('<img src="/f8ball/assets/images/loadingIcon/ajax-loader.gif"></img>');
				$.ajax({
					url: "index.cfm",
					type: "get",
					data: args,
					cache: false,
					dataType: "text",
					success: function(data){
						expanded.empty();
						expanded.append(data);
					},
					error: function(err){
						var error = err;
					}
				});
			} 
			
		});
	});
	
	$('#invite-friends-to-vote').live("click", function(){
		$('.public-options').addClass('hide');
		$('#invite-friends-options').removeClass('hide');
		$('#group-options').addClass('hide');
		checkifpublic();
		return false;
	});
	
	$('#share-with-groups').live("click", function(){
		$('.public-options').addClass('hide');
		$('#invite-friends-options').addClass('hide');
		$('#group-options').removeClass('hide');
		checkifpublic();
		return false;
	});
	
	$('.invite-friends-switch-public, .groups-switch-public').live("click", function(){
		$('#invite-friends-options').addClass('hide');
		$('.public-options').removeClass('hide');
		$('#group-options').addClass('hide');
		checkifpublic();
		return false;
	});
	
	$('.invite-friends-clear-list').live("click", function(){
		$('.invite-friends-box').empty();
	});
	
	$('.remove_friend').live("click", function(){
		$(this).parent().remove();
	});
	
	$('.add_group').live("click", function(){
		
		var q_group = $(this).parent().find('.hide').clone();
		q_group.find('.invite-friends-box-inner').each(function(){
			$('.invite-friends-box').prepend(this);
		});
		
	});
	
	$('.invite-friend-hover').live("click", function(){
		addEmail(this,'text');
	});
	
	$('#invite-friends-emails').bind("keydown", function(e){
		var code = (e.keyCode ? e.keyCode : e.which);
		if (code == 13) {
			addEmail(this,'input');
		}
		else if(code == 188){
			e.preventDefault();
			addEmail(this,'input');
		}
		else if(code == 9){
			e.preventDefault();
			addEmail(this,'input');
		}
	});
	
	function addEmail(clickedon,type){
		if(type=='input'){
			var email = $(clickedon).val();
			$(clickedon).val('');
		}
		else{
			var email = $(clickedon).text();
		}
		
			var emailblock = "<div class='invite-friends-box-inner border'><div class='group_email'>" + email +
				"</div><div class='remove_friend'>" +
					"<a href='##'><img src='/f8ball/assets/images/add/remove.png' /></a>" +
				"</div>" +
			"</div>";
		$('.invite-friends-box').prepend(emailblock);
	}
	
	
	function checkifpublic(){
		if($('.public-options').hasClass('hide')){
			$('#sharePublicHidden').val('F');
		}else{
			$('#sharePublicHidden').val('T');
		}
	}
	
	$("input[name=add-group-name]").prompt("add a new group");
	$("input[name=invite-friends-emails]").prompt("invite by email address");
	$("input[name=email-invite]").prompt("invite by email address");
	$("input[name=add-user-email]").prompt("invite by email address");
	
	$('#account_options').live('click',function() {
		$('.profile_open').toggle();
		//$('#account_profile_pic').toggle();
		return false;
	});
	
	$('html').click(function() {
 		if ($('.notification_open').is(":visible")) {
			$('.notification_open').toggle();
			$('#notify_unreal_image').attr('src','/f8ball/assets/images/flash.png');
		}else if ($('.profile_open').is(":visible")) {
			$('.profile_open').toggle();
		}
 	});

/* ! End jquery.function -------------------------- ***/
});

$(function(){
	$(".heart_tip").tipTip({defaultPosition : "top", content: "Click to heart the question", edgeOffset : 0});
	$(".anonymous_tip").tipTip({defaultPosition : "top", content: "Vote Anonymously, you username will not be recorded in recent votes and your vote will not show up on the map", edgeOffset : -3});
	$(".viewresults_tip").tipTip({defaultPosition : "right", content: "Click to skip voting and go straight to the results", edgeOffset : 0});
	$(".popup_tip").tipTip({defaultPosition : "top", edgeOffset : 0});
	$(".popup_tip_right").tipTip({defaultPosition : "right", edgeOffset : 0});
	$(".popup_tip_left").tipTip({defaultPosition : "left", edgeOffset : 0});
});

function updateToolTip(){
	$(".popup_tip").tipTip({defaultPosition : "top"});
};




