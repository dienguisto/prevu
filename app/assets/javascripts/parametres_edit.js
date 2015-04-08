/**
 * Created by nmtsylla on 06/04/15.
 */
var infoModal = $('#myModal');



$('.editTag').on('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    var id = link.split('#')[1];
    console.log(id);
    var tag = $(this).parent().parent().find('td:nth-child(2)').text();
    console.log(tag);
    $('.modal-title').text('Edition tag');
    var htmlData = '<div class="form-group"><label>Tag</label> <input type="text" id="nomTag" value="'+tag+'" class="form-control"></div>';
    htmlData += '<div class="modal-footer"><button type="button" class="btn btn-white" data-dismiss="modal">';
    htmlData += '<input type="hidden" id="idTag" value="'+id+'">' +
    'Close</button><button type="button" class="btn btn-primary updateTag">Update changes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.updateTag',function(e){
    e.preventDefault();
    var idTag = $('#idTag').val();
    $.ajax({
        type: "PUT",
        url: '/parametres/'+idTag,
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {nom: $('#nomTag').val(), tag_id: idTag},
        success: function(data){
            console.log(data);
            $("a[href$='#"+idTag+"'][class$='editTag']").parent().parent().find('td:nth-child(2)').html(data.nom);
            infoModal.modal('hide');
        },
        error: function(xhr){
            console.log(xhr.status);
            if(xhr.status == 406)
                alert("L'element est invalide verifier qu'il n'existe pas deja");
            console.log('erreur');
        }
    });
});



$('.editCateg').on('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    var id = link.split('#')[1];
    console.log(id);
    var categ = $(this).parent().parent().find('td:nth-child(2)').text();
    console.log(categ);
    $('.modal-title').text('Edition categorie medical');
    var htmlData = '<div class="form-group"><label>Tag</label> <input type="text" id="nomCateg" value="'+categ+'" class="form-control"></div>';
    htmlData += '<div class="modal-footer"><button type="button" class="btn btn-white" data-dismiss="modal">';
    htmlData += '<input type="hidden" id="idCateg" value="'+id+'">' +
    'Close</button><button type="button" class="btn btn-primary updateCateg">Update changes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.updateCateg',function(e){
    e.preventDefault();
    var idCateg = $('#idCateg').val();
    $.ajax({
        type: "PUT",
        url: '/parametres/'+idCateg,
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {nom: $('#nomCateg').val(), categ_id: idCateg},
        success: function(data){
            console.log(data);
            $("a[href$='#"+idCateg+"'][class$='editCateg']").parent().parent().find('td:nth-child(2)').html(data.nom);
            infoModal.modal('hide');
        },
        error: function(xhr){
            console.log(xhr.status);
            if(xhr.status == 406)
                alert("L'element est invalide verifier qu'il n'existe pas deja");
            console.log('erreur');
        }
    });
});
