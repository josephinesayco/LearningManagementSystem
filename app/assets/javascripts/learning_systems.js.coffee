# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->



	$.show_modal = (title="Confirmation", message) ->
		html = """
			<div id="confirmationDialog" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" id="confirmationDialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
							<h4 class="modal-title">Do you want to take LMS Test?</h4>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to take LMS test?</p>
						</div>
					    <div class="modal-footer">
					   		<a data-dismiss="modal" class="btn btn-cancel">Cancel</a>
					   		<a data-dismiss="modal" class="btn btn-primary confirm">Ok</a>
					    </div>
					</div>
				</div>
			</div>

		"""

		modal = $(html).modal()
		$(modal).find('a.btn-cancel').on 'click', -> $.remove_modal()
		$(modal).find('a.confirm').on 'click', ->
			alert("jjj")
			$.ajax
				type: "GET"
				url: "/learning_systems"




	$.remove_modal = () ->
		$('.modal').remove();
		$('.modal-backdrop').remove();
		$('body').removeClass("modal-open");


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
		$(html).prependTo(container_cls).fadeOut(10000);
		$('body').animate({scrollTop:$(html).offset().top},500);



	$(document).on 'click', 'a.form-submit-btn, btn.form-submit-btn', (e) ->
		return if $(this).hasClass("form-submit-btn-no-disable")

		formId = $(this).data('form-id')
		form = $("form##{formId}")
		submitType = $(this).data('submit-type')

		if(true)
			#($("form ol li input[type='radio']:checked").length >= $("form .choices").length)
			$(e.target).addClass('disabled')
			if submitType
			  $('<input>').attr({
			      type: 'hidden',
			      name: 'submit_type',
			      value: submitType
			    }).appendTo(form)

			form.submit()
		else
			$.prog_flash('alert alert-danger', "You must answer all the following questions.")
			e.preventDefault()

	demo_modal_completed = ""

