/**
 * Created by nmtsylla on 06/04/15.
 */
$(document).on('ready', function(){

var infoModal = $('#myModalDel');



$('.delTag').on('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    var id = link.split('#')[1];
    console.log(id);
    $('.modal-title').text('Delete tag');
    var htmlData = '<div class="form-group"><p>Delete?</p></div>';
    htmlData += '<input type="hidden" id="idTag" value="'+id+'">' +
    '<button  type="button" class="btn" data-dismiss="modal">No</button><button type="button" class="btn btn-primary removeTag">Yes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.removeTag',function(e){
    e.preventDefault();
    var idTag = $('#idTag').val();
    $.ajax({
        type: "DELETE",
        url: '/parametres/'+idTag,
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {tag_id: idTag},
        success: function(data){
            console.log(data);
            $("a[href$='#"+idTag+"'][class$='editTag']").parent().parent().remove();
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



$('.delCateg').on('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    var id = link.split('#')[1];
    console.log(id);
    $('.modal-title').text('Delete Categ');
    var htmlData = '<div class="form-group"><p>Delete?</p></div>';
    htmlData += '<input type="hidden" id="idCateg" value="'+id+'">' +
    '<button  type="button" class="btn" data-dismiss="modal">No</button><button type="button" class="btn btn-primary removeCateg">Yes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.removeCateg',function(e){
    e.preventDefault();
    var idTag = $('#idCateg').val();
    $.ajax({
        type: "DELETE",
        url: '/parametres/'+idTag,
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {categ_id: idTag},
        success: function(data){
            $("a[href$='#"+idTag+"'][class$='editTag']").parent().parent().remove();
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



$('.delType').on('click', function(e){
    e.preventDefault();
    var link = $(this).attr('href');
    var id = link.split('#')[1];
    console.log(id);
    $('.modal-title').text('Delete Type categorie medicale');
    var htmlData = '<div class="form-group"><p>Delete?</p></div>';
    htmlData += '<input type="hidden" id="idType" value="'+id+'">' +
    '<button  type="button" class="btn" data-dismiss="modal">No</button><button type="button" class="btn btn-primary removeType">Yes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.removeType',function(e){
    e.preventDefault();
    var idTag = $('#idType').val();
    $.ajax({
        type: "DELETE",
        url: '/parametres/'+idTag,
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {type_id: idTag},
        success: function(data){
            $("a[href$='#"+idTag+"'][class$='editType']").parent().parent().remove();
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

});