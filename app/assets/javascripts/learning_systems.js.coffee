# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->

	$.prog_flash = (type, message, container_cls = '.page-content') ->
		html = """
	      <div class='alert-area container'>
	        <div class='#{type}'>
	          <button class='close' data-dismiss='alert' type='button'>
	          <i class='icon-remove'></i>
	          </button>
	          #{message}
	        </div>
	      </div>
	      """
		$('.alert-area').remove();
		$(html).prependTo(container_cls).fadeOut(100000);
		$('body').animate({scrollTop:$(html).offset().top},500);



	$(document).on 'click', 'a.form-submit-btn, btn.form-submit-btn', (e) ->
		return if $(this).hasClass("form-submit-btn-no-disable")

		formId = $(this).data('form-id')
		form = $("form##{formId}")
		submitType = $(this).data('submit-type')

		if($("form ol li input[type='radio']:checked").length >= $("form .choices").length)
			$(e.target).addClass('disabled')
			if submitType
			  $('<input>').attr({
			      type: 'hidden',
			      name: 'submit_type',
			      value: submitType
			    }).appendTo(form)

			form.submit()
		else
			idNum = 0
			idNumbers = []
			$("form ol .choices").each ()->
				if $(this).find("input[type='radio']:checked").length <= 0
					idNum = parseInt($(this).attr("id")) + 1
					idNumbers.push(idNum)

			$.prog_flash('alert alert-danger', "You must answer all the following questions. Please check the following item numbers " + idNumbers.join(", "))
			e.preventDefault()

	demo_modal_completed = ""

	# This is for counter
	liftoffTime = new Date($('#until2d').data("until"));
	$('#until2d').countdown({
		until: liftoffTime, format: "MS",
		onExpiry: ()->
			$.ajax
      	type: "GET"
      	url: "/java_questions/lock"
      	dataType: "script"

	});

	# This is for login image
	$('.login-selector input[name=for-login]').change () ->
    val = this.value;
    window.location.href = val



