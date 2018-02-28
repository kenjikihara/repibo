$(function(){
var $container = $('#grid');
$container.imagesLoaded(function(){
	$container.masonry({
		itemSelector: '.grid-item',
		isFitWidth: true,
		isAnimated: true
	});
});
});
