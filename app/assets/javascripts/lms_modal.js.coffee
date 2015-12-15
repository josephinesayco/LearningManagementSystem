jQuery ($)->
  #=============================================
  #                 Objects
  #=============================================
  LMSModal = (title, content, options={})->
    this.defaults = {
      okText: "OK"
      cancelText: "Cancel"
      okButtonColorClass: "btn-primary"
      okButtonAdditionalClasses: []
      cancelButtonAdditionalClasses: []

      dismissOnOk: true
      additionalModalClasses: []

      # Callbacks
      onInit: (modal)-> return,
      onOk: (modal)-> return,
      beforeClose: (modal)-> return,
      afterClose: ()-> return
    };

    this.options = $.extend({}, this.defaults, options);
    this.title = title
    this.content = content
    this._init();


  LMSModal.prototype = {
    constructor: LMSModal,

    _init: ()->
      template = """
             <div class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                 <div class="modal-content">
                   <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
                       <h4 class="modal-title"></h4>
                   </div>
                   <div class="modal-body">
                     <div class='notices'></div>
                     <p></p>
                   </div>
                   <div class="modal-footer">
                     <a data-dismiss="modal" class="btn modal-cancel"></a>
                     <a class="modal-okay btn #{this.options.okButtonColorClass} confirm onclick=""></a>
                   </div>
               </div>
             </div>
             """

      this.modal = $(template).modal()
      this._initModalElements()
      this.options.onInit(this.modal)
      this._attachCallbacks()

      this.modal


    _initModalElements: ()->
      this.titleElement = this.modal.find('.modal-title')
      this.titleElement.text(this.title)

      this.contentElement = this.modal.find('.modal-body p')
      this.contentElement.html(this.content)

      this.okButton = this.modal.find('a.modal-okay')
      this.okButton.text(this.options.okText)

      this.cancelButton = this.modal.find('a.modal-cancel')
      this.cancelButton.text(this.options.cancelText)

      if this.options.dismissOnOk
        this.okButton.attr('data-dismiss', 'modal')

      modal = this.modal
      okButton = this.okButton
      cancelButton = this.cancelButton

      $.each(this.options.additionalModalClasses, (index, klass)->
        modal.addClass(klass)
      )
      $.each(this.options.okButtonAdditionalClasses, (index, klass)->
        okButton.addClass(klass)
      )

      $.each(this.options.cancelButtonAdditionalClasses, (index, klass)->
        cancelButton.addClass(klass)
      )


    _destroy: ()->
      this.options.beforeClose(this.modal)
      this.modal.remove()
      $('.modal-backdrop').remove()
      $('body').removeClass("modal-open")
      this.options.afterClose()


    _onOk: (e)->
      this.options.onOk(this.modal)


    _attachCallbacks: ()->
      this.modal.on('hidden.bs.modal', $.proxy(this._destroy, this))
      this.okButton.on("click", $.proxy(this._onOk, this))

  }

  $.lms_modal = (title="Java Course Recommender", content="", options={}) ->
    new LMSModal(title, content, options)

  return