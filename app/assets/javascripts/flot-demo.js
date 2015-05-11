//Flot Bar Chart
$(document).ready(function () {

    $.getJSON('/reporting/by_sexe', function(data){
      var items = [];
      $.each(data, function( key, val ) {
        if(key==0){
          items.push({label: 'Masculin', data: val, color: "#d3d3d3"});
        }else{
          items.push({label: 'Féminin', data: val, color: "#f8ac59"});
        }
      });
      var plotObj = $.plot($("#flot-pie-chart"), items, {
          series: {
              pie: {
                  show: true
              }
          },
          grid: {
              hoverable: true
          },
          tooltip: true,
          tooltipOpts: {
              content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
              shifts: {
                  x: 20,
                  y: 0
              },
              defaultTheme: false
          }
      });
    });

    $.getJSON('/reporting/by_status_mat', function(data){
      var items = [];
      console.log(data);
      $.each( data, function( key, val ) {
        if(key==1){
          items.push({label: 'Célibataire', data: val, color: "#86d3d3"});
        }else if(key==2){
          items.push({label: 'Marié', data: val, color: "#a8ac59"});
        }
        else if(key==3){
          items.push({label: 'Divorcé', data: val, color: "#d0a369"});
        }
        else if(key==4){
          items.push({label: 'Veuf', data: val, color: "#0c1c59"});
        }
        else{
          items.push({label: 'Inconnu', data: val, color: "#f8ac59"});
        }
      });
      console.log(items)
      var plotObj = $.plot($("#flot-pie-marie_celib"), items, {
          series: {
              pie: {
                  show: true
              }
          },
          grid: {
              hoverable: true
          },
          tooltip: true,
          tooltipOpts: {
              content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
              shifts: {
                  x: 20,
                  y: 0
              },
              defaultTheme: false
          }
      });
    });

});
