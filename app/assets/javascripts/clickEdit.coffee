(($, window) ->
	class ClickEdit
		constructor: (el, options) ->
			@el = $(el)
			@product = {}
			@action = @el.data('action')
			@id = @el.data('product-id')

			@initialize()

		initialize: ->
			wysiwyg = new MediumEditor '.js-wysiwyg', 
				spellcheck: false,
				toolbar: {
					static: true,
					sticky: true,
					buttons: [
						'bold','italic','underline','strikethrough','subscript','superscript',
						'anchor','image','quote','pre','orderedlist','unorderedlist','indent',
						'outdent','justifyLeft','justifyCenter','justifyRight','justifyFull',
						'h1','h2','h3','h4','removeFormat']
				}
			editor = new MediumEditor '.js-editor', 
				toolbar: false,
				spellcheck: false

			wysiwyg.subscribe 'blur', (event, editable) =>
				@product[ $(editable).data('edit') ] = $(editable).html()

			editor.subscribe 'blur', (event, editable) =>
				@product[ $(editable).data('edit') ] = $(editable).text()

	# Define the plugin
	$.fn.extend clickEdit: (option, args...) ->
		@each ->
			$this = $(this)
			data = $this.data('clickEdit')

			if !data
				$this.data 'clickEdit', (data = new ClickEdit(this, option))
			if typeof option == 'string'
				data[option].apply(data, args)

) window.jQuery, window