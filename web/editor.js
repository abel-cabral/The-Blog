/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#summernote').summernote({
    placeholder: 'Escreva sua postagem',
    tabsize: 2,
    height: 500,
    minHeight: 350,
    lang: 'pt-BR',
    toolbar: [
        // [groupName, [list of button]]
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']]
    ],
    popover: {
        air: [
            ['color', ['color']],
            ['font', ['bold', 'underline', 'clear']]
        ]
    }
});

