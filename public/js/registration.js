$(function () {
	$("form#registration").submit(function () {
		window.location = $("input:checked", this).val();
		return false;
	});
	
	$("form#registration button:enabled").click(function () {
		window.location = $("input:checked", $(this).parents("form")).val();
	})
});