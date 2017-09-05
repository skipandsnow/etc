var templateLoader = (function($, host) {
	// Loads external templates from path and injects in to page DOM
	return {
		loadExtTemplate : function(tmplPath, tmplContainerId) {
			$.support.cors = true;
			var tmplLoader = $.get(tmplPath).success(function(result) {
				// Add templates to DOM
				$("#" + tmplContainerId).html(result);
			}).error(function(result) {
				alert("Error Loading Templates");
			});
		}
	};
})(jQuery, document);

function getFormDataArray(form) {
	var $form = form;
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};

	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});

	return indexed_array;
}

function getFormData() {
	// Lookup the form and serialize it
	var $form = $("#queryForm");
	var formData = $form.serialize().split('&');

	// Iterate over each form element and add it to an object collection
	var formParams = {};
	$(formData).each(function() {
		var nvp = this.split('=');

		// Instead of setting a value to the param we set up a function to get
		// the value
		formParams[nvp[0]] = function() {
			var $inputEl = $form.find('*[name=' + nvp[0] + ']').first();
			return $inputEl.val();
		};
	});
	
	return formParams;
}