function bingosetup() {
  var bingoOpts = {
    seed: getUrlParameter('seed') || Math.ceil(999999 * Math.random()).toString(),
    mode: 'normal',//getUrlParameter('mode') || 'normal',
  };

  var prettyMode = {
    'normal': 'Normal',
    'short': 'Short',
    'long': 'Long'
  };

  var cardType = prettyMode[bingoOpts.mode];

  var generateBoard = function()
  {
    // generate the bingos
    $.post('bingo.php', bingoOpts, function(data, textStatus, xhr) {
      if (data.error || !data.board)
      {
        alert('Card could not be generated!');
        return false;
      }

      bingoOpts.seed = data.seed;

      // append this seed to the URL, add to history
      history.pushState(bingoOpts, "", "?seed="+bingoOpts.seed)

      for (row = 0; row < 5; row++)
      {
        for (col = 0; col < 5; col++)
        {
          $('.row'+(row+1)+'.col'+(col+1)).html(data.board[row][col].name);// + ' [' + data.board[row][col].difficulty + ']');
        }
      }

      $("span#debug").html("<p>ALttP Bingo <strong>v" + data.version + "</strong> &emsp;Seed: <strong>" + bingoOpts.seed + "</strong>&emsp;Card type: <strong>" + cardType + "</strong></p>");
    });
  };

  generateBoard();

  // handle bingo popouts
  $('.popout').click(function() {
    var line = $(this).attr('id');
    var name = $(this).html();
    var items = [];
    var cells = $('#bingo .'+ line);

    for (var i = 0; i < 5; i++)
    {
      items.push(encodeURIComponent($(cells[i]).html()));
    }

    var popoutUrl = 'popout.html#'+ name +'='+ items.join('|||');
    var popoutOptions = "width=220, height=460, toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no";

    var popout = window.open(popoutUrl, "_blank", popoutOptions);

    if (window.focus) {
      popout.focus();
    }
  });

  // color toggling
  $("#bingo tr td:not(.popout), #selected td").toggle(
    function () {
      $(this).addClass("greensquare");
    },
    function () {
      $(this).addClass("redsquare").removeClass("greensquare");
    },
    function () {
      $(this).removeClass("redsquare");
    }
  );

  // new board
  $("#new-board-btn").on('click', function(e) {
    bingoOpts.seed = Math.ceil(999999 * Math.random()).toString();
    generateBoard();
  });

  // dat hover tho
  $("#row1").hover(function() { $(".row1").addClass("hover"); }, function() { $(".row1").removeClass("hover"); });
  $("#row2").hover(function() { $(".row2").addClass("hover"); }, function() { $(".row2").removeClass("hover"); });
  $("#row3").hover(function() { $(".row3").addClass("hover"); }, function() { $(".row3").removeClass("hover"); });
  $("#row4").hover(function() { $(".row4").addClass("hover"); }, function() { $(".row4").removeClass("hover"); });
  $("#row5").hover(function() { $(".row5").addClass("hover"); }, function() { $(".row5").removeClass("hover"); });

  $("#col1").hover(function() { $(".col1").addClass("hover"); }, function() { $(".col1").removeClass("hover"); });
  $("#col2").hover(function() { $(".col2").addClass("hover"); }, function() { $(".col2").removeClass("hover"); });
  $("#col3").hover(function() { $(".col3").addClass("hover"); }, function() { $(".col3").removeClass("hover"); });
  $("#col4").hover(function() { $(".col4").addClass("hover"); }, function() { $(".col4").removeClass("hover"); });
  $("#col5").hover(function() { $(".col5").addClass("hover"); }, function() { $(".col5").removeClass("hover"); });

  $("#tlbr").hover(function() { $(".tlbr").addClass("hover"); }, function() { $(".tlbr").removeClass("hover"); });
  $("#bltr").hover(function() { $(".bltr").addClass("hover"); }, function() { $(".bltr").removeClass("hover"); });
}

$(bingosetup);
