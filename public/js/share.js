$(start);

function start(){
	handlePreview();
	
	window.fbAsyncInit = function() {
		FB.Event.subscribe('comment.create', function(response){
			console.log('comment', response);
		});
	}
}

var imagePre = 'http://image.chickenpox.io/';

function handlePreview(){		
	console.log(spot)
	// append thoughts and details
	updateTimeSince('data-timestamp');
	
	//set final image
	var pv = $('#preview_container');
    pv.css('width', spot.targetWidth);
	
	var pad = 10;
	// append highlight bar
    var psb = $('<div class="pulse_set_bar" id="psc_' + spot.id + '"></div>');
    pv.append(psb);
    psb.css('top', spot.pulseOptions.top - .5 * psb.height() + pad);
	spot.pulseOptions.top += spot.pulseOptions.size*.5 - pad; // 10 for padding
	spot.pulseOptions.left += spot.pulseOptions.size*.5 - pad; // 10 for padding
	// finally, show the pulsating circle
    pv.find('img').jPulse(spot.pulseOptions);

    $('#copy_link_outer').on('click', function(){
        $('#copy_link').select();
        document.execCommand('copy');
        var startColor = $('#copy_link_span').css('backgroundColor');
        console.log('bg', startColor);
        $('#copy_link_span')
            .hide()
            .fadeIn(400)
    });



    var visi = {
    	hide: {
    		right: -340,
    		text: 'Hide',
    		opp: 'show'
    	},
    	show: {
    		right:0,
    		text: 'Show',
    		opp: 'hide'
    	}
    }

    $('#comment_container_visibility').on('click', function(){
    	var dir = $(this).attr('data-direction');
    	$('#comment_container').animate({
    		right: visi[dir].right
    	});

    	$(this).html(visi[visi[dir].opp].text);
    	$(this).attr('data-direction', visi[dir].opp);
    });
}


var blankFavicon = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQEAYAAABPYyMiAAAABmJLR0T///////8JWPfcAAAACXBIWXMAAABIAAAASABGyWs+AAABWUlEQVRIx72UPY6DMBCFB2vPgELjm7hIfLiII1EhJO4QSipSW0Y0GCYFO4CNbTbZ1Y6E7Qdi/M3zTwLfUZZlWZaI8MuY53meZwAppZQySX78IwEYM47jiGiMMUsf0nZf13Vd14ht27Zti1gURVEU5wUxGiAiIgLQs2992n0o0jRN0xRACCGEADgDWQHIOhckrO0+FJxzznkY5Mt1YBntq/JrN7TWWmuAqqqqqvJUyhhj7Ph+BXAdoO0T0m5IebtdrwBd13XP5/H749E0TfMGwNGZOABFlmXZ5fIBwDRN0zTZBtMah7QbMTDK/5ED9iSf3RWU/xRgv+mWdfdrX/Wxa+cUwBhjjPGt8d94QPmDAO65fvcUnF26of9WAKWUUur8/Me2YMwZyh8EoItkm2ireWltfZw+7sGWPwAwDMMwDLblSRLWviWIIVD+IEDf933fA9zveZ7n8G/xAixIBOiEWtbwAAAAAElFTkSuQmCC";