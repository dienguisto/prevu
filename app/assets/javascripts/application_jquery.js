function remove_fields(link) {
    $(link).parent().parent().remove();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    var regexp2 = new RegExp("[detail_ordonnances]", "g");
    $(link).parent().before(content.replace(regexp, new_id));
}