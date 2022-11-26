let pass = function () {
    let possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
    let text = '';
    for (let i = 0; i < 5; i++) {
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    }
    return text;
};

function GET(key) {
    let s = window.location.search;
    s = s.match(new RegExp(key + '=([^&=]+)'));
    return s ? s[1] : false;
}

$('#generatePass').on('click', function () { //Генерируем пароль из заданных символов

    if (!$('.create-pass input').is('.input-form')) {
        $('.create-pass').append(`<input class="input-form" type="text" name="password" value="${pass()}">`);
    } else {
        $('.create-pass .input-form').val(pass);
    }
});

if (GET('event') == 'add') {
    $('.create-pass').append(`<input class="input-form" type="text" name="password" value="${pass()}">`);
}
$('input').attr('autocomplete', 'off');

$('.burger          ').on('click', function () {
    $('.aside-list').toggleClass('active');
});

$(document).ready(function () {
    $("#info-table").dataTable({
        "pageLength": 20,
        "lengthChange": true,
        "lengthMenu": [10, 25, 50, 75, 100],
        dom: 'Bflrtip',
        buttons: [
            {
                extend: 'print',
                text: 'Печать',
                className: 'btn',
                exportOptions: {
                    columns: ':visible',
                    modifier: {
                        page: 'current'
                    }
                }
            },
            {
                extend: 'colvis',
                className: 'btn btn-green',
                text: 'Убрать столбец'
            },
        ],
        language: {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }
        }
    }).removeClass('dataTable');

});


