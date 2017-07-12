class window.ClickEdit
	constructor: ->
		@product = {}

		@initialize()

	initialize: ->
		console.log 'init'
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
			@product[ $(editable).data('edit') ] = $(editable).text().trim()