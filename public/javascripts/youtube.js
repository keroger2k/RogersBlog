var youTubeMe = {
pageSize: 10,
          player: null,
          startIndex: 1,
          username: 'keroger2k',

          init: function() {
            $.getJSON('http://gdata.youtube.com/feeds/users/' + this.username + '/uploads?alt=json&callback=?&start-index=' + this.startIndex + '&max-results=' + youTubeMe.pageSize, youTubeMe.createYouTubePlayers);
          },

play: function(id) {
        var html = '<iframe width="560" height="349" src="http://www.youtube.com/embed/' + id + '" frameborder="0" allowfullscreen></iframe>'
        return html;
      },

createYouTubePlayers: function(data) {
                        console.log(data);
                        var playerDiv = $('#player');
                        playerDiv.empty();
                        $('.pager').empty();
                        if (data.feed.entry.length < youTubeMe.pageSize) {
                          youTubeMe.createPreviousButton();
                        } else {
                          if (youTubeMe.startIndex !== 1) {
                            youTubeMe.createPreviousButton();
                          }
                          youTubeMe.createNextButton();
                        }

                        for (var i = 0; i < data.feed.entry.length; i++) {
                          var entry = data.feed.entry[i];
                          var html = '<div class="video">';
                          html += '<h2 class="title">' + entry.title.$t  + '</h2>';
						  html += '<div class="published">' + new Date(entry.published.$t).toDateString() + '</div>';
                          html += youTubeMe.play(entry.id.$t.split('/')[5]);
                          html += '<span class="description">' + entry.media$group.media$description.$t  + '</span></div>'
                            playerDiv.append(html);
                        }
                      },

createNextButton: function() {
                    $('<a id="next" class="next" href="#">next</a>').appendTo('.pager');
                    $('.next').click(function(e) {
                        e.preventDefault();
                        youTubeMe.startIndex += youTubeMe.pageSize;
                        youTubeMe.init();
                        });
                  },

createPreviousButton: function() {
                        $('<a id="prev" class="prev" href="#">prev</a>').appendTo('.pager');

                        $('.prev').click(function(e) {
                            e.preventDefault();
                            youTubeMe.startIndex -= youTubeMe.pageSize;
                            youTubeMe.init();
                            });
                      }

};
