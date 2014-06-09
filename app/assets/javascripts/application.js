// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.11.0.min
//= require bootstrap.min
//= require jquery.appear
//= require waypoints.min
//= require jquery.prettyPhoto
//= require modernizr-latest
//= require SmoothScroll
//= require jquery.parallax-1.1.3
//= require jquery.easing.1.3
//= require jquery.superslides
//= require jquery.flexslider
//= require jquery.isotope
//= require jquery.mb.YTPlayer
//= require jquery.fitvids
//= require jquery.slabtext
//= require plugins
//= require mustache
//= require_tree ../../templates

jQuery(document).ready(function() {
	
	jQuery(".showButton").click(function() {
		var id = jQuery(this).prev('.modal-object-id').val();
		loadMustacheTemplate(id);
	});
	
	function loadMustacheTemplate(id) {
		jQuery.ajax({
			dataType: "json",
			url: "./projects/project_show_via_ajax_call",
			data: {id: id},
			success: function(data) {
				jQuery('.modal-fade').fadeOut(50);
				jQuery('#myModal').appendTo("body").modal('show');
				var project_content = SMT['projectshow'](data);
				
				setTimeout(function() {
					jQuery('.modal-fade').empty();
					jQuery('.modal-fade').append(project_content);
					jQuery('.modal-fade').fadeIn(75);
					if(data.hasOwnProperty("image")) {
						jQuery('.modalVideo').hide();
						jQuery('.modalImage').show();
					} else {
						jQuery('.modalVideo').show();
						jQuery('.modalImage').hide();
					}
					detectAndAmmendPrevious(data.prev_project);
					detectAndAmmendNext(data.next_project);
				}, 750);
			}
		});
	}
	
	function detectAndAmmendPrevious(id) {
		jQuery("#prevArrow").click(function(){
			nextPreviousProject(id);
		});
	}
	
	function detectAndAmmendNext(id) {
		jQuery("#nextArrow").click(function(){
			nextPreviousProject(id);
		});
	}
	
	function nextPreviousProject(id) {
		jQuery.ajax({
			dataType: "json",
			url: "./projects/project_show_via_ajax_call",
			data: {id: id},
			success: function(data) {
				jQuery('.modal-fade').fadeOut(50);
				loadMustacheTemplate(id);
			}
		});
	}
	
});

