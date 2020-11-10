var wordLimit = 50;

$(function() {  
  //trata o conteúdo na inicialização da página
  $('.show-summary').each(function() {
    var post = $(this);
    var text = post.text();
    //encontra palavra limite
    var re = /[\s]+/gm, results = null, count = 0;
    while ((results = re.exec(text)) !== null && ++count < wordLimit) { }
    //resume o texto e coloca o link
    if (results !== null && count >= wordLimit) {
      var summary = text.substring(0, re.lastIndex - results[0].length);
      post.text(summary + '...');
      post.data('original-text', text);
    }
  });  
})();