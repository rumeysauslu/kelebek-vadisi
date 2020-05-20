//= require coreui
//= require jquery
//= require jquery_ujs
//= require select2/dist/js/select2.js
// require ckeditor/config
//= require toastr/build/toastr.min
//= require shared/toastr_config

//= require datatables.net/js/jquery.dataTables
//= require_self


$(document).ready(function () {
  $('#add_stage').change(function(){
    var btn = $('#add_stage_button')
    var uri = btn.attr('href').split('/')
    uri[uri.length - 1] = $(this).val()
    btn.attr('href', uri.join('/'))
  })
  $('.datatable').DataTable({
    "order": [
      [0, "desc"]
    ],
    "aLengthMenu": [
      [10, 25, 50, 75, -1],
      [10, 25, 50, 75, "Tümü"]
    ],
    "iDisplayLength": -1,
    'language': {
      "sDecimal": ",",
      "sEmptyTable": "Tabloda herhangi bir veri mevcut değil",
      "sInfo": "_TOTAL_ kayıttan _START_ - _END_ arasındaki kayıtlar gösteriliyor",
      "sInfoEmpty": "Kayıt yok",
      "sInfoFiltered": "(_MAX_ kayıt içerisinden bulunan)",
      "sInfoPostFix": "",
      "sInfoThousands": ".",
      "sLengthMenu": "Sayfada _MENU_ kayıt göster",
      "sLoadingRecords": "Yükleniyor...",
      "sProcessing": "İşleniyor...",
      "sSearch": "Ara:",
      "sZeroRecords": "Eşleşen kayıt bulunamadı",
      "oPaginate": {
        "sFirst": "İlk",
        "sLast": "Son",
        "sNext": "Sonraki",
        "sPrevious": "Önceki"
      },
      "oAria": {
        "sSortAscending": ": artan sütun sıralamasını aktifleştir",
        "sSortDescending": ": azalan sütun sıralamasını aktifleştir"
      },
      "select": {
        "rows": {
          "_": "%d kayıt seçildi",
          "0": "",
          "1": "1 kayıt seçildi"
        }
      }
    }
  });

  $("form").on("click", ".remove_record", function (event) {
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest("tr").hide();
    $(this).closest("tr").removeClass('element');
    return event.preventDefault();
  });

  $("form").on("click", ".add_fields", function (event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data("id"), "g");
    $(".fields").append($(this).data("fields").replace(regexp, time));
    return event.preventDefault();
  });
});
