/**
 * Created by nmtsylla on 26/03/15.
 */
var infoModal = $('#myModal');


$('.addTypeActe').on('click', function(e){
    e.preventDefault();
    $.getJSON('/parametres/categories.json', function(data){
        var items = '<select id="selectCateg" class="form-control">';
        $.each( data, function( key, val ) {
            items += "<option value='" + val.id + "'>" + val.nom + "</option>";
        });
        items += "</select>";
        console.log(items);
        $('.modal-title').text('Ajout type acte medical');
        var htmlData = '<div class="form-group"><label>Nom Type Acte Medical</label> <input type="text" id="idTypeActe" placeholder="Type Acte Medical..." class="form-control"></div>' +
            '<div class="form-group"><label>Categorie acte medical</label>'+items+'</div>';
        htmlData += '<div class="modal-footer"><button type="button" class="btn btn-white" data-dismiss="modal">' +
        'Close</button><button type="button" class="btn btn-primary validerTypeActeMedical">Save changes</button></div>';
        infoModal.find('.modal-body').html(htmlData);
        infoModal.modal('show');
    });
});


$(document).on('click', '.validerTypeActeMedical',function(e){
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: '/parametres/type_acte_medical/add',
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {nom: $('#idTypeActe').val(), categorie: $('#selectCateg').val()},
        success: function(data){
            console.log(data);
            $('.type_acte_table > tr:first').before('<tr><td><a href="#">#'+data.id+'</a></td><td>'+data.nom+'' +
            '</td><td>'+data.created_at+'</td><td>'+data.updated_at+'</td><td><a href="#'+data.id+'" class="editType">' +
            'Edit</a></td><td><a href="#'+data.id+'" class="delType">Destroy</a></td></tr>');
            infoModal.modal('hide');
        },
        error: function(){
            console.log('erreur');
        }
    });
});


$('.addCateg').on('click', function(e){
    e.preventDefault();
    $('.modal-title').text('Ajout categorie acte medical');
    var htmlData = '<div class="form-group"><label>Nom categorie Acte Medical</label> <input type="text" id="idCategActe" placeholder="Categorie Acte Medical..." class="form-control"></div>';
    htmlData += '<div class="modal-footer"><button type="button" class="btn btn-white" data-dismiss="modal">' +
    'Close</button><button type="button" class="btn btn-primary validerCategActeMedical">Save changes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.validerCategActeMedical',function(e){
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: '/parametres/categorie_acte_medical/add',
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {nom: $('#idCategActe').val()},
        success: function(data, textStatus, xhr){
            console.log(data);
            $('.categ_acte_table > tr:first').before('<tr><td><a href="#">#' + data.id + '</a></td><td>' + data.nom + '' +
            '</td><td>' + data.created_at + '</td><td>' + data.updated_at + '</td><td><a href="#' + data.id + '" class="editCateg">' +
            'Edit</a></td><td><a href="#' + data.id + '" class="delCateg">Destroy</a></td></tr>');
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



$('.addTag').on('click', function(e){
    e.preventDefault();
    $('.modal-title').text('Ajout tag');
    var htmlData = '<div class="form-group"><label>Tag</label> <input type="text" id="idTag" placeholder="Tag..." class="form-control"></div>';
    htmlData += '<div class="modal-footer"><button type="button" class="btn btn-white" data-dismiss="modal">' +
    'Close</button><button type="button" class="btn btn-primary validerTag">Save changes</button></div>';
    infoModal.find('.modal-body').html(htmlData);
    infoModal.modal('show');
});


$(document).on('click', '.validerTag',function(e){
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: '/parametres/tags/add',
        dataType: 'json',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: {nom: $('#idTag').val()},
        success: function(data, textStatus, xhr){
            console.log(data);
            $('.tag_table > tr:first').before('<tr><td><a href="#">#' + data.id + '</a></td><td>' + data.libelle + '' +
            '</td><td>' + data.created_at + '</td><td>' + data.updated_at + '</td><td><a href="#' + data.id + '" class="editTag">' +
            'Edit</a></td><td><a href="#' + data.id + '" class="delTag">Destroy</a></td></tr>');
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

