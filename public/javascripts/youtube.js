var youTubeMe = {
pageSize: 10,
          player: null,
          startIndex: 1,
          username: 'keroger2k',

          init: function() {
            $.getJSON('http://gdata.youtube.com/feeds/users/' + this.username + '/uploads?alt=json&callback=?&start-index=' + this.startIndex + '&max-results=' + youTubeMe.pageSize, youTubeMe.createYouTubePlayers);
          },

play: function(id)
      {
        var html  = '';

        html += '<object >';
        html += '<param name="movie" value="http://www.youtube.com/v/'+id+'"></param>';
        html += '<param name="autoplay" value="1">';
        html += '<param name="wmode" value="transparent"></param>';
        html += '<embed src="http://www.youtube.com/v/'+id+'&autoplay=0" type="application/x-shockwave-flash" wmode="transparent" ></embed>';
        html += '</object>';

        return html;
      },

createYouTubePlayers: function(data) {
                        console.log(data);
                        var playerDiv = $('#player');
                        playerDiv.empty();
                        $('#pager').empty();
                        if (data.feed.entry.length < youTubeMe.pageSize) {
                          youTubeMe.createPreviousButton();
                        } else {
                          if (youTubeMe.startIndex !== 1) {
                            youTubeMe.createPreviousButton();
                          }
                          youTubeMe.createNextButton();
                        }

                        for (var i = 0; i < data.feed.entry.length; i++) {
                          var html = '<div class=\"video\">';
                          html += youTubeMe.play(data.feed.entry[i].id.$t.split('/')[5]);
                          html += '<div class=\"description\">' + data.feed.entry[i].media$group.media$description.$t  + '</div></div>'
                            playerDiv.append(html);
                        }
                      },

createNextButton: function() {
                    $('<a id=\"next\" href=\"#\">next</a>').appendTo('#pager');
                    $('#next').click(function(e) {
                        e.preventDefault();
                        youTubeMe.startIndex += youTubeMe.pageSize;
                        youTubeMe.init();
                        });
                  },

createPreviousButton: function() {
                        $('<a id=\"prev\" href=\"#\">prev</a>').appendTo('#pager');

                        $('#prev').click(function(e) {
                            e.preventDefault();
                            youTubeMe.startIndex -= youTubeMe.pageSize;
                            youTubeMe.init();
                            });
                      }

};
