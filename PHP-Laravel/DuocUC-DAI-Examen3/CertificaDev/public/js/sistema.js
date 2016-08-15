$(function(){
    var menu_sistema = $('.body > .menu_sistema');
    var contenido_sistema = $('.body > .contenido');
    var header = $('body > .header');
    var menu_sistema_pad_marg = menu_sistema.outerHeight(true) - menu_sistema.height();
    
    var sistemaSetSize = function(){
        var document_height = $(window).height();
        contenido_sistema.css('height',document_height - header.outerHeight(true));
        menu_sistema.css('height',document_height - header.outerHeight(true) - menu_sistema_pad_marg);
    };
    
    sistemaSetSize();
    $(window).resize(sistemaSetSize);
    $('.information-message button.close').click(function(){$(this).closest('.information-message').remove();});
});