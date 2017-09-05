/**
 * 
 */
var contact_id = '';
$(document)
		.ready(
				function() {
					var browser = get_browser();
					navigator.sayswho = (function() {
						var ua = navigator.userAgent, tem, M = ua
								.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i)
								|| [];
						if (/trident/i.test(M[1])) {
							tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
							return 'IE ' + (tem[1] || '');
						}
						if (M[1] === 'Chrome') {
							tem = ua.match(/\b(OPR|Edge)\/(\d+)/);
							if (tem != null)
								return tem.slice(1).join(' ').replace('OPR',
										'Opera');
						}
						M = M[2] ? [ M[1], M[2] ] : [ navigator.appName,
								navigator.appVersion, '-?' ];
						if ((tem = ua.match(/version\/(\d+)/i)) != null)
							M.splice(1, 1, tem[1]);
						return M.join(' ');
					})();
					// alert(navigator.sayswho);
					contact_id = $.urlParam('cid');
					$("#wavSrc").attr('src', 'wav/' + contact_id + '.wav');
					$("#urlToWav").html('http://localhost:8088/voice_analysis/va_wav_toWav?cid='+contact_id);
					$('#wavSrc').on('ended', function() {
						manageImageObjectsLevel();
					}).get(0).play();
				});

$.urlParam = function(name) {
	var results = new RegExp('[\\?&]' + name + '=([^&#]*)')
			.exec(window.location.href);
	if (!results) {
		return 0;
	}
	return results[1] || 0;
}

function get_browser() {
	var ua = navigator.userAgent, tem, M = ua
			.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i)
			|| [];
	if (/trident/i.test(M[1])) {
		tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
		return {
			name : 'IE',
			version : (tem[1] || '')
		};
	}
	if (M[1] === 'Chrome') {
		tem = ua.match(/\bOPR|Edge\/(\d+)/)
		if (tem != null) {
			return {
				name : 'Opera',
				version : tem[1]
			};
		}
	}
	M = M[2] ? [ M[1], M[2] ]
			: [ navigator.appName, navigator.appVersion, '-?' ];
	if ((tem = ua.match(/version\/(\d+)/i)) != null) {
		M.splice(1, 1, tem[1]);
	}
	return {
		name : M[0],
		version : M[1]
	};
}