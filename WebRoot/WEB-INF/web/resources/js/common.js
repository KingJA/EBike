$(function(){
	//点击标签，显示隐藏菜单
	$('#classify').click(function(event) {
	  var $options = $('#classify-option');
	  if ($options.is(":visible")) { //元素可见
	    $options.slideUp('fast');
	  } else {
	    $options.slideDown('fast');
	  }
	});
	
	$(".header-search").click(function(event) {
	  event.stopPropagation();
	});
	
	$('#classify-option li').click(function(event) {
	  $('#classifyfield').val($(this).attr('value'));
	  $('#classify').text($(this).text());
	  $("#classify-option").slideUp('fast');
	});
	
	$(document).click(function(event) {
	  $("#classify-option").slideUp('fast');
	});
	
	//搜索按钮表单提交
	$('#search').click(function(event) {
	  $('#searchform').submit();
	});
	
	$(".sousuo-btn").click(function(event){
	  $("#inner-search").submit();
	})
});