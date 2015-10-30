var chickenFeed = new function(){
    $(start)

    function start(){
        $('.feed_row').each(function(i, row){
            var feedTitle = $(row).find('.feed_title').text();
            console.log(feedTitle);
            updateTimeSince();
        })
    }

    function updateTimeSince() {
        var dTag = 'data-feed-ts';
        $('[' + dTag + ']').each(function(i, span){
            var date = $(span).attr(dTag);

            if (typeof date !== 'object')
                date = new Date(date);

            var seconds = Math.floor((new Date() - date) / 1000);
            var intervalType;

            var interval = Math.floor(seconds / 31536000);
            if (interval >= 1) {
                intervalType = 'year';
            } else {
                interval = Math.floor(seconds / 2592000);
                if (interval >= 1) {
                    intervalType = 'month';
                } else {
                    interval = Math.floor(seconds / 86400);
                    if (interval >= 1) {
                        intervalType = 'day';
                    } else {
                        interval = Math.floor(seconds / 3600);
                        if (interval >= 1) {
                            intervalType = "hour";
                        } else {
                            interval = Math.floor(seconds / 60);
                            if (interval >= 1) {
                                intervalType = "minute";
                            } else {
                                interval = seconds;
                                intervalType = "second";
                            }
                        }
                    }
                }
            }

            if (interval > 1 || interval === 0) {
                intervalType += 's';
            }

            var curr = interval + ' ' + intervalType + ' ago';
            $(span).html(curr);
        });
    }
}